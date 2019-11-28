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

/* Creates a table, HourlyEmployee, which is inherited from Employee.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with Employee */
CREATE TABLE HourlyEmployee (
    empNumber INT(10) NOT NULL,
    hourlyRate FLOAT(10),

    CONSTRAINT HourlyEmployee_PK PRIMARY KEY(empNumber),
    
    CONSTRAINT Employee_HourlyEmployee_FK
        FOREIGN KEY(empNumber) REFERENCES Employee(empNumber)
);

/* Creates a table, SalariedEmployee, which is inherited from Employee.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with Employee */
CREATE TABLE SalariedEmployee (
    empNumber INT(10) NOT NULL,
    healthBenefits BOOLEAN,
    weeklyRate FLOAT(10),
    

    CONSTRAINT SalariedEmployee_PK PRIMARY KEY(empNumber),
    
    CONSTRAINT Employee_SalariedEmployee_FK
        FOREIGN KEY(empNumber) REFERENCES Employee(empNumber)
);

/* Creates a table, Chef, which is inherited from SalariedEmployee.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with SalariedEmployee */

CREATE TABLE Chef(
  empNumber INT(10) NOT NULL,
  
  CONSTRAINT Chef_PK PRIMARY KEY(empNumber),
    
    CONSTRAINT SalariedEmployee_Chef_FK
	FOREIGN KEY(empNumber) REFERENCES SalariedEmployee(empNumber)
);

/* Creates a table, Manager, which is inherited from SalariedEmployee.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with SalariedEmployee */
CREATE TABLE Manager(
  empNumber INT(10) NOT NULL,
  
  CONSTRAINT Manager_PK PRIMARY KEY(empNumber),
    
  CONSTRAINT SalariedEmployee_Manager_FK
  FOREIGN KEY(empNumber) REFERENCES SalariedEmployee(empNumber)
);

/* Creates a table, LineCook, which is inherited from Chef.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with Chef */
CREATE TABLE LineCook(
   empNumber INT(10) NOT NULL,
  
  CONSTRAINT LineCook_PK PRIMARY KEY(empNumber),
    
  CONSTRAINT Chef_LineCook_FK
  FOREIGN KEY(empNumber) REFERENCES Chef(empNumber)
  
  );
  
  /* Creates a table, HeadChef, which is inherited from Chef.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with Chef */
  CREATE TABLE HeadChef(
   empNumber INT(10) NOT NULL,
  
  CONSTRAINT HeadChef_PK PRIMARY KEY(empNumber),
    
  CONSTRAINT Chef_HeadChef_FK
  FOREIGN KEY(empNumber) REFERENCES Chef(empNumber)
  
  );
  
  /* Creates a table, SousChef, which is inherited from Chef.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with Chef */
  
  CREATE TABLE SousChef(
   empNumber INT(10) NOT NULL,
  
  CONSTRAINT SousChef_PK PRIMARY KEY(empNumber),
    
  CONSTRAINT Chef_SousChef_FK
  FOREIGN KEY(empNumber) REFERENCES Chef(empNumber)
  
  );
  
  /* Creates a table, HeadChefRecipies, which is created by HeadChef
    It's uniquely identified by empNumber (surrogate) and recipeName and has a zero-to-many
    with HeadChef */
  CREATE TABLE HeadChefRecipes(
   empNumber INT(10) NOT NULL,
   recipeName VARCHAR (50) NOT NULL, 
   recipeDescription VARCHAR (200),
  
  CONSTRAINT HeadChefRecipes_PK PRIMARY KEY(empNumber,recipeName),
    
  CONSTRAINT HeadChef_HeadChefRecipies_FK
  FOREIGN KEY(empNumber) REFERENCES HeadChef(empNumber)
  
  );
  
  /*
-- DROP TABLE STATEMENTS --
DROP TABLE Employee;
DROP TABLE Shift;
DROP TABLE EmployeeShift;
DROP TABLE HourlyEmployee;
DROP TABLE SalariedEmployee;
DROP TABLE Manager;
DROP TABLE Chef;
DROP TABLE LineCook;
DROP TABLE SousChef;
DROP TABLE HeadChef;
DROP TABLE HeadChefRecipes;
*/