DROP TRIGGER IF EXISTS MAX_one_head_chef;
DELIMITER //
CREATE TRIGGER MAX_one_head_chef
BEFORE INSERT ON EmployeeShift
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM EmployeeShift
    WHERE NEW.shiftStartTime = shiftStartTime AND NEW.shiftName = shiftName
    AND NEW.empShiftDate = empShiftDate 
    AND (SELECT COUNT(*) FROM Employee WHERE empJobTitle = 'Head Chef' AND empNumber = NEW.empNumber)
    > 0)
    THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'There can only be one head chef per shift.';
    END IF;
END //
DELIMITER ;

-- Business rule 1
DROP TRIGGER IF EXISTS menu_age_check;
DELIMITER //
CREATE TRIGGER menu_age_check
BEFORE INSERT ON OrderDetails
FOR EACH ROW
BEGIN
        IF (SELECT COUNT(*) FROM Customer
        INNER JOIN mmOrder ON Customer.customerID = mmOrder.customerID
        INNER JOIN OrderDetails ON mmOrder.orderID = OrderDetails.orderID
        WHERE OrderDetails.orderID = NEW.orderID AND Customer.age > 12 AND
        NEW.menuName = 'Childrens' > 0)
        THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You must be 12 years old or younger to order from the childrens menu.';
    END IF;
END //
DELIMITER ;

-- Business rule 2 **** Requires DDL update
DROP TRIGGER IF EXISTS MAX_reward_check;
DELIMITER //
CREATE TRIGGER MAX_reward_check
BEFORE INSERT ON mmDetails
FOR EACH ROW
BEGIN
        IF (NEW.rewardsUsed > 20)
        THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You mmay not use more than $20 in Mimings rewards points per purchase.';
    END IF;
END //
DELIMITER ;

-- Business rule 3 **** Requires DDL update
DROP TRIGGER IF EXISTS waiver_check;
DELIMITER //
CREATE TRIGGER waiver_check
BEFORE INSERT ON OrderDetails
FOR EACH ROW
BEGIN
        IF (SELECT COUNT(*) FROM Customer
        INNER JOIN mmOrder ON Customer.customerID = mmOrder.customerID
        INNER JOIN OrderDetails ON mmOrder.orderID = OrderDetails.orderID
        WHERE OrderDetails.orderID = NEW.orderID AND mmOrder.waiverSigned = false
        AND NEW.spiciness = 'Oh My God' > 0)
        THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You must first sign a waiver to order the Oh My God spiciness level.';
    END IF;
END //
DELIMITER ;

-- Business rule 4
DROP TRIGGER IF EXISTS quick_pickup_check;
DELIMITER //
CREATE TRIGGER quick_pickup_check
BEFORE INSERT ON ToGo
FOR EACH ROW
BEGIN
        IF (NEW.pickUpTime - NEW.orderReadyTime > TIME('00:15:00'))
        THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Oredrs must be picked up within 15 minutes of completion.';
    END IF;
END //
DELIMITER ;
                                                       
-- Business rule 5
DROP TRIGGER IF EXISTS no_double_shift;
DELIMITER //
CREATE TRIGGER no_double_shift
BEFORE INSERT ON EmployeeShift
FOR EACH ROW
BEGIN
        IF (SELECT COUNT(*) FROM EmployeeShift WHERE
        NEW.empNumber = EmployeeShift.empNumber AND
        NEW.empShiftDate = EmployeeShift.empShiftDate > 0)
        THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An employee may not work two full shifts in a given day.';
    END IF;
END //
DELIMITER ;
                                                    
