CREATE TABLE `Chef` (
  `empNumber` int(10) NOT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `SalariedEmployee_Chef_FK` FOREIGN KEY (`empNumber`) REFERENCES `SalariedEmployee` (`empNumber`)
);

CREATE TABLE `CorporationAccount` (
  `customerID` int(10) NOT NULL,
  `corporationName` varchar(50) DEFAULT NULL,
  `organizationName` varchar(50) DEFAULT NULL,
  `officeAddress` varchar(100) DEFAULT NULL,
  `contactNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  CONSTRAINT `MimingsAccount_CorporationAccount_FK` FOREIGN KEY (`customerID`) REFERENCES `MimingsAccount` (`customerID`)
);

CREATE TABLE `Customer` (
  `customerID` int(10) NOT NULL,
  `customerName` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
);

CREATE TABLE `CustomerAccount` (
  `customerID` int(10) NOT NULL,
  `snailMail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  CONSTRAINT `MimingsAccount_CustomerAccount_FK` FOREIGN KEY (`customerID`) REFERENCES `MimingsAccount` (`customerID`)
);

CREATE TABLE `Dishwasher` (
  `empNumber` int(10) NOT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `HourlyEmployee_Dishwasher_FK` FOREIGN KEY (`empNumber`) REFERENCES `HourlyEmployee` (`empNumber`)
);

CREATE TABLE `EatIn` (
  `orderID` int(10) NOT NULL,
  `partySize` int(10) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  CONSTRAINT `mmOrder_EatIn_FK` FOREIGN KEY (`orderID`) REFERENCES `mmOrder` (`orderID`)
);

CREATE TABLE `Employee` (
  `empNumber` int(10) NOT NULL,
  `empJobTitle` varchar(50) DEFAULT NULL,
  `empJobDescription` varchar(200) DEFAULT NULL,
  `fullOrPartTime` varchar(50) DEFAULT NULL,
  `empName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`empNumber`)
);

CREATE TABLE `EmployeeShift` (
  `empNumber` int(10) NOT NULL,
  `shiftStartTime` time NOT NULL,
  `shiftName` varchar(50) DEFAULT NULL,
  `empShiftDate` date NOT NULL,
  PRIMARY KEY (`empNumber`,`shiftStartTime`,`empShiftDate`),
  KEY `Shift_EmployeeShift_FK` (`shiftStartTime`),
  CONSTRAINT `Employee_EmployeeShift_FK` FOREIGN KEY (`empNumber`) REFERENCES `Employee` (`empNumber`),
  CONSTRAINT `Shift_EmployeeShift_FK` FOREIGN KEY (`shiftStartTime`) REFERENCES `Shift` (`shiftStartTime`)
);

CREATE TABLE `HeadChef` (
  `empNumber` int(10) NOT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `Chef_HeadChef_FK` FOREIGN KEY (`empNumber`) REFERENCES `Chef` (`empNumber`)
);

CREATE TABLE `HeadChefRecipes` (
  `empNumber` int(10) NOT NULL,
  `recipeName` varchar(50) NOT NULL,
  `recipeDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`empNumber`,`recipeName`),
  CONSTRAINT `HeadChef_HeadChefRecipies_FK` FOREIGN KEY (`empNumber`) REFERENCES `HeadChef` (`empNumber`)
);

CREATE TABLE `HourlyEmployee` (
  `empNumber` int(10) NOT NULL,
  `hourlyRate` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `Employee_HourlyEmployee_FK` FOREIGN KEY (`empNumber`) REFERENCES `Employee` (`empNumber`)
);

CREATE TABLE `LineCook` (
  `empNumber` int(10) NOT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `Chef_LineCook_FK` FOREIGN KEY (`empNumber`) REFERENCES `Chef` (`empNumber`)
);

CREATE TABLE `LineCookStation` (
  `empNumber` int(10) NOT NULL,
  `stationName` varchar(50) NOT NULL,
  `lineCookName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`empNumber`,`stationName`),
  KEY `Station_LineCookStation_FK` (`stationName`),
  CONSTRAINT `LineCook_LineCookStation_FK` FOREIGN KEY (`empNumber`) REFERENCES `LineCook` (`empNumber`),
  CONSTRAINT `Station_LineCookStation_FK` FOREIGN KEY (`stationName`) REFERENCES `Station` (`stationName`)
);

CREATE TABLE `MaitreD` (
  `empNumber` int(10) NOT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `HourlyEmployee_MaitreD_FK` FOREIGN KEY (`empNumber`) REFERENCES `HourlyEmployee` (`empNumber`)
);

CREATE TABLE `Manager` (
  `empNumber` int(10) NOT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `SalariedEmployee_Manager_FK` FOREIGN KEY (`empNumber`) REFERENCES `SalariedEmployee` (`empNumber`)
);

CREATE TABLE `Mentorship` (
  `menuItemName` varchar(50) NOT NULL,
  `empNumber` int(10) NOT NULL,
  `mentorNumber` int(10) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `skill` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`menuItemName`,`empNumber`,`mentorNumber`,`startDate`),
  KEY `SousChefEmployee_Mentorship_FK` (`empNumber`),
  KEY `SousChefMentor_Mentorship_FK` (`mentorNumber`),
  CONSTRAINT `MenuItem_Mentorship_FK` FOREIGN KEY (`menuItemName`) REFERENCES `MenuItem` (`menuItemName`),
  CONSTRAINT `SousChefEmployee_Mentorship_FK` FOREIGN KEY (`empNumber`) REFERENCES `SousChef` (`empNumber`),
  CONSTRAINT `SousChefMentor_Mentorship_FK` FOREIGN KEY (`mentorNumber`) REFERENCES `SousChef` (`empNumber`)
);

CREATE TABLE `Menu` (
  `menuName` varchar(50) NOT NULL,
  PRIMARY KEY (`menuName`)
);

CREATE TABLE `MenuItem` (
  `menuItemName` varchar(50) NOT NULL,
  `foodType` varchar(50) DEFAULT NULL,
  `meatChoice` varchar(50) DEFAULT NULL,
  `spiceName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`menuItemName`)
);

CREATE TABLE `MenuMenuItem` (
  `menuName` varchar(50) NOT NULL,
  `menuItemName` varchar(50) NOT NULL,
  `price` float DEFAULT NULL,
  `itemSize` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`menuName`,`menuItemName`),
  KEY `MenuItem_MenuMenuItem_FK` (`menuItemName`),
  CONSTRAINT `MenuItem_MenuMenuItem_FK` FOREIGN KEY (`menuItemName`) REFERENCES `MenuItem` (`menuItemName`),
  CONSTRAINT `Menu_MenuMenuItem_FK` FOREIGN KEY (`menuName`) REFERENCES `Menu` (`menuName`)
);

CREATE TABLE `MimingsAccount` (
  `customerID` int(10) NOT NULL,
  `rewardsPoints` int(4) DEFAULT NULL,
  `amountSpent` float DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  CONSTRAINT `Customer_MimingsAccount_FK` FOREIGN KEY (`customerID`) REFERENCES `Customer` (`customerID`)
);

CREATE TABLE `OrderDetails` (
  `menuName` varchar(50) NOT NULL,
  `menuItemName` varchar(50) NOT NULL,
  `orderID` int(10) NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  PRIMARY KEY (`menuName`,`menuItemName`,`orderID`),
  KEY `mmOrder_OrderDetails_FK` (`orderID`),
  CONSTRAINT `MenuMenuItem_OrderDetails_FK_1` FOREIGN KEY (`menuName`, `menuItemName`) REFERENCES `MenuMenuItem` (`menuName`, `menuItemName`),
  CONSTRAINT `mmOrder_OrderDetails_FK` FOREIGN KEY (`orderID`) REFERENCES `mmOrder` (`orderID`)
);

CREATE TABLE `SalariedEmployee` (
  `empNumber` int(10) NOT NULL,
  `healthBenefits` tinyint(1) DEFAULT NULL,
  `weeklyRate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `Employee_SalariedEmployee_FK` FOREIGN KEY (`empNumber`) REFERENCES `Employee` (`empNumber`)
);

CREATE TABLE `Shift` (
  `shiftStartTime` time NOT NULL,
  PRIMARY KEY (`shiftStartTime`)
);

CREATE TABLE `SousChef` (
  `empNumber` int(10) NOT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `Chef_SousChef_FK` FOREIGN KEY (`empNumber`) REFERENCES `Chef` (`empNumber`)
);

CREATE TABLE `Station` (
  `stationName` varchar(50) NOT NULL,
  PRIMARY KEY (`stationName`)
);

CREATE TABLE `Tables` (
  `empNumber` int(10) NOT NULL,
  `orderID` int(10) NOT NULL,
  `tableNumber` int(10) NOT NULL,
  `tableSection` varchar(50) DEFAULT NULL,
  `tableCapacity` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`empNumber`,`orderID`,`tableNumber`),
  KEY `EatIn_Tables_FK_1` (`orderID`),
  CONSTRAINT `EatIn_Tables_FK_1` FOREIGN KEY (`orderID`) REFERENCES `EatIn` (`orderID`),
  CONSTRAINT `WaitStaff_Tables_FK` FOREIGN KEY (`empNumber`) REFERENCES `WaitStaff` (`empNumber`)
);

CREATE TABLE `ToGo` (
  `orderID` int(10) NOT NULL,
  `pickUpTime` time DEFAULT NULL,
  `orderReadyTime` time DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  CONSTRAINT `mmOrder_ToGo_FK` FOREIGN KEY (`orderID`) REFERENCES `mmOrder` (`orderID`)
);

CREATE TABLE `WaitStaff` (
  `empNumber` int(10) NOT NULL,
  `tips` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`empNumber`),
  CONSTRAINT `HourlyEmployee_WaitStaff_FK` FOREIGN KEY (`empNumber`) REFERENCES `HourlyEmployee` (`empNumber`)
);

CREATE TABLE `mmOrder` (
  `orderID` int(10) NOT NULL,
  `customerID` int(10) DEFAULT NULL,
  `orderDateTime` datetime DEFAULT NULL,
  `paymentType` varchar(50) DEFAULT NULL,
  `waiverSigned` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `mmOrder_CK` (`customerID`,`orderDateTime`),
  CONSTRAINT `Customer_Order_FK` FOREIGN KEY (`customerID`) REFERENCES `Customer` (`customerID`)
);
