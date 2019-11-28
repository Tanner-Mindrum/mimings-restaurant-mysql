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
    It's uniquely identified by empNumber and recipeName and has a zero-to-many
    with HeadChef */
  CREATE TABLE HeadChefRecipes(
   empNumber INT(10) NOT NULL,
   recipeName VARCHAR (50) NOT NULL, 
   recipeDescription VARCHAR (200),
  
  CONSTRAINT HeadChefRecipes_PK PRIMARY KEY(empNumber,recipeName),
    
  CONSTRAINT HeadChef_HeadChefRecipies_FK
  FOREIGN KEY(empNumber) REFERENCES HeadChef(empNumber)
  
  );
  
   /* Creates a table, Dishwasher, which is inherited from HourlyEmployee.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with HourlyEmployee */
  CREATE TABLE Dishwasher(
   empNumber INT(10) NOT NULL,
  
  CONSTRAINT Dishwasher_PK PRIMARY KEY(empNumber),
    
  CONSTRAINT HourlyEmployee_Dishwasher_FK
  FOREIGN KEY(empNumber) REFERENCES HourlyEmployee(empNumber)
  
  );
  
   /* Creates a table, MaitreD, which is inherited from HourlyEmployee.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with HourlyEmployee */
  CREATE TABLE MaitreD(
   empNumber INT(10) NOT NULL,
  
  CONSTRAINT MaitreD_PK PRIMARY KEY(empNumber),
    
  CONSTRAINT HourlyEmployee_MaitreD_FK
  FOREIGN KEY(empNumber) REFERENCES HourlyEmployee(empNumber)
  
  );
   /* Creates a table, WaitStaff, which is inherited from HourlyEmployee.
    It's uniquely identified by empNumber (surrogate) and has a zero-to-one
    with HourlyEmployee */
  CREATE TABLE WaitStaff(
   empNumber INT(10) NOT NULL,
   tips FLOAT (10),
  
  CONSTRAINT WaitStaff_PK PRIMARY KEY(empNumber),
    
  CONSTRAINT HourlyEmployee_WaitStaff_FK
  FOREIGN KEY(empNumber) REFERENCES HourlyEmployee(empNumber)
  
  );
  
  /* Creates a parent table, Customer, which contains information regarding
    a customer at Miming's. It's uniquely identified by customerID (surrogate)*/
  CREATE TABLE Customer(
  customerID INT(10) NOT NULL,
  customerName VARCHAR(50),
  email VARCHAR(60),
  age INT(3),
  
  CONSTRAINT Customer_PK PRIMARY KEY(customerID)
  
  );
   /* Creates a table, MimingsAccount, which is owned by Customer
    It's uniquely identified by customer and has a zero-to-many
    with HeadChef */
CREATE TABLE MimingsAccount(
  customerID INT(10) NOT NULL,
  rewardsPoints INT(4),
  amountSpent FLOAT(10),
  
  CONSTRAINT MimingsAccount_PK PRIMARY KEY(customerID),
  
  CONSTRAINT Customer_MimingsAccount_FK
  FOREIGN KEY(customerID) REFERENCES Customer(customerID)
  
  );
  
  CREATE TABLE CustomerAccount(
  customerID INT(10) NOT NULL,
  customerName VARCHAR(50),
  customerEmail VARCHAR(60),
  snailMail VARCHAR (100),
  
  CONSTRAINT CustomerAccount_PK PRIMARY KEY(customerID),
  
  CONSTRAINT MimingsAccount_CustomerAccount_FK
  FOREIGN KEY(customerID) REFERENCES MimingsAccount(customerID)
  
  );
  
  CREATE TABLE CorporationAccount(
  customerID INT(10) NOT NULL,
  corporationName VARCHAR(50),
  organizationName VARCHAR(50),
  officeAddress VARCHAR(100),
  contactNumber VARCHAR(20),
  
  CONSTRAINT CorporationAccount_PK PRIMARY KEY(customerID),
  
  CONSTRAINT MimingsAccount_CorporationAccount_FK
  FOREIGN KEY(customerID) REFERENCES MimingsAccount(customerID)
  
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
DROP TABLE Customer;
DROP TABLE MimingsAccount;
DROP TABLE CorporationAccount;
DROP TABLE CustomerAccount;
DROP TABLE WaitStaff
DROP TABLE Dishwasher;
DROP TABLE MaitreD;
*/