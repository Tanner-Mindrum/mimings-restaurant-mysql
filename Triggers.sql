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

