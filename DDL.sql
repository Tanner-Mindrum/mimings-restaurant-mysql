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
    with Customer */
CREATE TABLE MimingsAccount(
  customerID INT(10) NOT NULL,
  rewardsPoints INT(4),
  amountSpent FLOAT(10),
  
  CONSTRAINT MimingsAccount_PK PRIMARY KEY(customerID),
  
  CONSTRAINT Customer_MimingsAccount_FK
  FOREIGN KEY(customerID) REFERENCES Customer(customerID)
  
  );

/* Creates a table, CustomerAccount, which is inherited from MimingsAccount
    It's uniquely identified by customer and has a zero-to-many
    with MimingsAccount */
  
  CREATE TABLE CustomerAccount(
  customerID INT(10) NOT NULL,
  customerName VARCHAR(50),
  customerEmail VARCHAR(60),
  snailMail VARCHAR (100),
  
  CONSTRAINT CustomerAccount_PK PRIMARY KEY(customerID),
  
  CONSTRAINT MimingsAccount_CustomerAccount_FK
  FOREIGN KEY(customerID) REFERENCES MimingsAccount(customerID)
  
  );
  
/* Creates a table, CorporationAccount, which is inherited from MimingsAccount
    It's uniquely identified by customer and has a zero-to-many
    with MimingsAccount */

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

/* Creates a parent table, Station, which contains the name of a station.
    It's uniquely identified by stationName */
CREATE TABLE Station (
    stationName VARCHAR(50) NOT NULL,

    CONSTRAINT Station_PK PRIMARY KEY(stationName)
);

/* Creates a junction table, LineCookStation, which associates LineCook and 
    Station and contains the name of the line cook working that station.
    It's uniquely identified by empNumber (surrogate) and stationName and has a
    one-to-many relationship with LineCook and Station */
CREATE TABLE LineCookStation(
    empNumber INT(10) NOT NULL,
    stationName VARCHAR(50) NOT NULL,
    lineCookName VARCHAR(50),

    CONSTRAINT LineCookStation_PK PRIMARY KEY(empNumber, stationName),
    
    CONSTRAINT LineCook_LineCookStation_FK
        FOREIGN KEY(empNumber) REFERENCES LineCook(empNumber),
    CONSTRAINT Station_LineCookStation_FK
        FOREIGN KEY(stationName) REFERENCES Station(stationName)
);

/* Creates a parent table, MenuItem, which contains information regarding
    an item on a menu at Miming's. It's uniquely identified by menuItemName
    and has a one-to-many relationship with Mentorship and MenuMenuItem */
CREATE TABLE MenuItem(
    menuItemName VARCHAR(50) NOT NULL,
    foodType VARCHAR(50),
    meatChoice VARCHAR(50),
    spiceName VARCHAR(50),

    CONSTRAINT MenuItem_PK PRIMARY KEY(menuItemName)
);

/* Creates a junction table, Mentorship, which associates SousChef and MenuItem
    and contains the start and end date and skill gained of each mentorship.
    It's uniquely identified by menuItemName, empNumber (surrogate),
    mentorNumber (surrogate), and startDate and has a one-to-many relationship
    with MenuItem and zero-to-many with SousChef */
CREATE TABLE Mentorship(
    menuItemName VARCHAR(50) NOT NULL,
    empNumber INT(10) NOT NULL,
    mentorNumber INT(10) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE,
    skill VARCHAR(50),

    CONSTRAINT Mentorship_PK PRIMARY KEY(menuItemName, empNumber, mentorNumber,
        startDate),
    
    CONSTRAINT MenuItem_Mentorship_FK
        FOREIGN KEY(menuItemName) REFERENCES MenuItem(menuItemName),
    CONSTRAINT SousChefEmployee_Mentorship_FK
        FOREIGN KEY(empNumber) REFERENCES SousChef(empNumber),
    CONSTRAINT SousChefMentor_Mentorship_FK
        FOREIGN KEY(mentorNumber) REFERENCES SousChef(empNumber)
);

/* Creates a parent table, Menu, which contains information regarding
    the name of a menu at Miming's. It's uniquely identified by menuName
    and has a one-to-many relationship with MenuMenuItem */
CREATE TABLE Menu(
    menuName VARCHAR(50) NOT NULL,
    
    CONSTRAINT Menu_PK PRIMARY KEY(menuName)
);

/* Creates a junction table, MenuMenuItem, which associates Menu and MenuItem
    and contains the price and size of an item on a menu at Miming's.
    It's uniquely identified by menuItemName, and menuName and has a
    one-to-many relationship with MenuItem and Menu */
CREATE TABLE MenuMenuItem(
    menuName VARCHAR(50) NOT NULL,
    menuItemName VARCHAR(50) NOT NULL,
    price FLOAT(10),
    itemSize VARCHAR(50),

    CONSTRAINT MenuMenuItem_PK PRIMARY KEY(menuName, menuItemName),

    CONSTRAINT Menu_MenuMenuItem_FK
        FOREIGN KEY(menuName) REFERENCES Menu(menuName),
    CONSTRAINT MenuItem_MenuMenuItem_FK
        FOREIGN KEY(menuItemName) REFERENCES MenuItem(menuItemName)
);

/* Creates a parent table, mmOrder, which contains information regarding
    a customer's order at Miming's. It's uniquely identified by orderID
    and has a one-to-many relationship with OrderDetails */
CREATE TABLE mmOrder(
    orderID INT(10) NOT NULL,
    customerID INT(10),
    orderDateTime DATETIME,
    orderType VARCHAR(50),
    paymentType VARCHAR(50),
    waiverSigned BOOLEAN,
    
    CONSTRAINT Order_PK PRIMARY KEY(orderID),

    CONSTRAINT Customer_Order_FK
        FOREIGN KEY(customerID) REFERENCES Customer(customerID)
);

/* An order can also be uniquely identified by a customerID and orderDateTime,
   so we make a candidate key using those attributes */
ALTER TABLE mmOrder
ADD CONSTRAINT mmOrder_CK UNIQUE(customerID, orderDateTime);

CREATE TABLE OrderDetails(
    menuName VARCHAR(50) NOT NULL,
    menuItemName VARCHAR(50) NOT NULL,
    orderID INT(10) NOT NULL,
    quantity INT(10),

    CONSTRAINT OrderDetails_PK PRIMARY KEY(menuName, menuItemName, orderID),

    CONSTRAINT MenuMenuItem_OrderDetails_FK_1
        FOREIGN KEY(menuName) REFERENCES MenuMenuItem(menuName),
    CONSTRAINT MenuMenuItem_OrderDetails_FK_2
        FOREIGN KEY(menuItemName) REFERENCES MenuMenuItem(menuItemName),
    CONSTRAINT mmOrder_OrderDetails_FK
        FOREIGN KEY(orderID) REFERENCES mmOrder(orderID)
);

/* Creates a table, ToGo, which is inherited from Order. It contains information
    regarding orders that are placed over phone or web. It's uniquely identified
    by orderID (surrogate) and has a zero-to-one with Order */
CREATE TABLE ToGo(
    orderID INT(10) NOT NULL,
    pickUpTime TIME,
    orderReadyTime TIME,

    CONSTRAINT ToGo_PK PRIMARY KEY(orderID),

    CONSTRAINT mmOrder_ToGo_FK
        FOREIGN KEY(orderID) REFERENCES mmOrder(orderID)
);

/* Creates a table, EatIn, which is inherited from Order. It's uniquely
    identified by orderID (surrogate) and has a zero-to-one with Order */
CREATE TABLE EatIn(
    orderID INT(10) NOT NULL,
    
    CONSTRAINT EatIn_PK PRIMARY KEY(orderID),
    
    CONSTRAINT mmOrder_EatIn_FK
        FOREIGN KEY(orderID) REFERENCES mmOrder(orderID)
);

/* Creates a child table, Tables, which contains information regarding
    a table at Miming's and who is sitting at it. It's uniquely identified by
    empNumber, orderID, and tableNumber and has a one-to-many relationship with
    WaitStaff and a one-to-one relationship with EatIn */
CREATE TABLE Tables(
    empNumber INT(10) NOT NULL,
    orderID INT(10) NOT NULL,
    tableNumber INT(10) NOT NULL,
    tableSection VARCHAR(50),
    tableCapacity VARCHAR(50),
    partySize INT(10),

    CONSTRAINT Tables_PK PRIMARY KEY(empNumber, orderID, tableNumber),

    CONSTRAINT WaitStaff_Tables_FK
        FOREIGN KEY(empNumber) REFERENCES WaitStaff(empNumber),
    CONSTRAINT EatIn_Tables_FK
        FOREIGN KEY(orderID) REFERENCES EatIn(orderID)
);

ALTER TABLE Employee
DROP COLUMN employeeFunction;

ALTER TABLE Employee
DROP COLUMN payRate;
