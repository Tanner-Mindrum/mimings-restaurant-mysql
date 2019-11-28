/* Creates a parent table, Employee, which contains information regarding
    an employee at Miming's. It's uniquely identified by empNumber (surrogate)
    and has a one-to-many relationship with EmployeeShift */
CREATE TABLE Employee  (
    empNumber INT(10) NOT NULL,
    payRate FLOAT(10),
    empJobTitle VARCHAR(50),
    empJobDescription VARCHAR(200),
    fullOrPartTime VARCHAR(50),
    employeeFunction VARCHAR(100),

    CONSTRAINT Employee_PK PRIMARY KEY(empNumber)  -- PK empNumber
);

/* Creates a parent table, Shift, which contains the time of shift at Miming's.
    It's uniquely identified by shiftTime and has a one-to-many relationship
    with EmployeeShift */
CREATE TABLE Shift (
    shiftTime TIME NOT NULL,

    CONSTRAINT Shift_PK PRIMARY KEY(shiftTime)  -- PK shiftTime
);


/* Creates a junction table, EmployeeShift, which associates Employee and Shift
    and contains the date of the shift. It's uniquely identified by
    empNumber (surrogate) and shiftTime and has a one-to-many relationship with
    Employee and Shift */
CREATE TABLE EmployeeShift (
    empNumber INT(10) NOT NULL,
    shiftTime TIME NOT NULL,
    empShiftDate DATE,
    
    CONSTRAINT EmployeeShift_PK PRIMARY KEY(empNumber, shiftTime),

    CONSTRAINT Employee_EmployeeShift_FK
        FOREIGN KEY(empNumber) REFERENCES Employee(empNumber),

    CONSTRAINT Shift_EmployeeShift_FK
        FOREIGN KEY(shiftTime) REFERENCES Shift(shiftTime)
);

