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

