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
        WHERE mmOrder.orderID = NEW.orderID AND Customer.age > 12 > 0) AND
        (NEW.menuName = 'Childrens')
        THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You must be 12 years old or younger to order from the childrens menu.';
    END IF;
END //
DELIMITER ;

-- Business rule 2
DROP TRIGGER IF EXISTS MAX_reward_check;
DELIMITER //
CREATE TRIGGER MAX_reward_check
BEFORE INSERT ON mmOrder
FOR EACH ROW
BEGIN
        IF (NEW.rewardsPointsUsed > 20)
        THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You may not use more than $20 in Mimings rewards points per purchase.';
    END IF;
END //
DELIMITER ;

-- Business rule 3
DROP TRIGGER IF EXISTS waiver_check;
DELIMITER //
CREATE TRIGGER waiver_check
BEFORE INSERT ON OrderDetails
FOR EACH ROW
BEGIN
        IF (SELECT COUNT(*) FROM mmOrder
        INNER JOIN OrderDetails ON mmOrder.orderID = OrderDetails.orderID
        WHERE OrderDetails.orderID = NEW.orderID AND mmOrder.waiverSigned = false > 0)
        AND
        (SELECT COUNT(*) FROM OrderDetails
        INNER JOIN MenuItem ON OrderDetails.menuItemName = MenuItem.menuItemName
        WHERE NEW.menuItemName = OrderDetails.menuItemName AND MenuItem.spiceName = 'Oh My God' > 0)
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
        SET MESSAGE_TEXT = 'Orders must be picked up within 15 minutes of completion.';
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
                                                    
-- Trigger for tables not being over populated
DROP TRIGGER IF EXISTS table_size_limit;
DELIMITER //
CREATE TRIGGER table_size_limit
BEFORE INSERT ON Tables
FOR EACH ROW
BEGIN
        IF (SELECT COUNT(*) FROM EatIn
        WHERE EatIn.partySize > NEW.tableCapacity AND NEW.orderID = EatIn.orderID > 0)
        THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The given party is too large to sit at this table.';
    END IF;
END //
DELIMITER ;
