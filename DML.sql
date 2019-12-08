INSERT INTO Employee
    VALUES (1, 'Head Chef', 'Control and direct food preparation, provide
                expertise in Chinese cuisine, and create recipes', 'Full time',
                'Henry Hippo'),
           (2, 'Line Cook', 'Prepare food to Head Chef''s exact specifications
                assist Head and Sous Chefs with their daily tasks', 'Full time',
                'Linus Kook'),
           (3, 'Sous Chef', 'Plan and direct food preparation in the kitchen and
                supervise over kitchen staff', 'Full time', 'Sue Lee'),
           (4, 'Line Cook', 'Prepare food to Head Chef''s exact specifications
                assist Head and Sous Chefs with their daily tasks', 'Full time',
                'Won der'),
           (5, 'Sous Chef', 'Plan and direct food preparation in the kitchen and
                supervise over kitchen staff', 'Full time', 'Richie Rich'),
           (6, 'Sous Chef', 'Plan and direct food preparation in the kitchen and
                supervise over kitchen staff', 'Full time', 'Sandy Rivi'),
           (7, 'Wait Staff', 'Wait tables and oversee customer service and
                satisfaction', 'Part time', 'Darlene Cue'),
           (8, 'Wait Staff', 'Wait tables and oversee customer service and
                satisfaction', 'Part time', 'Braedon Swift'),
           (9, 'Dishwasher', 'Wash dishes and glasswear, assist kitchen in prep
                duties', 'Part time', 'Brenda Medi'),
           (10, 'Dishwasher', 'Wash dishes and glasswear, assist kitchen in prep
                duties', 'Part time', 'Javier Monway'),
           (11, 'Maitre D', 'Manage restaurant seating, lead guests to tables',
                'Part time', 'Cristoph Freeze'),
            (12, 'Head Chef', 'Control and direct food preparation, provide
            expertise in Chinese cuisine, and create recipes', 'Full time',
            'Monica Salzy'),
            (13, 'Maitre D', 'Manage restaurant seating, lead guests to tables',
                'Part time', 'Ana Kaween');
  
-- Miming's open 9:00 AM - 11:00 PM
-- Breakfast from 9:00 - 12:00, lunch from 12:00 - 4:00, dinner from 4:00 - 11:00
  INSERT INTO Shift
    VALUES ('9:00:00'),
           ('16:00:00');
                
INSERT INTO EmployeeShift
    VALUES (1, '9:00:00', 'Morning Shift', '2019-11-01'),
           (2, '9:00:00', 'Morning Shift', '2019-11-01'),
           (3, '9:00:00', 'Morning Shift', '2019-11-01'),
           (7, '9:00:00', 'Morning Shift', '2019-11-01'),
           (9, '9:00:00', 'Morning Shift', '2019-11-01'),
           (11, '9:00:00', 'Morning Shift', '2019-11-01'),
           (12, '16:00:00', 'Evening Shift', '2019-11-01'),
           (4, '16:00:00', 'Evening Shift', '2019-11-01'),
           (5, '16:00:00', 'Evening Shift', '2019-11-01'),
           (6, '16:00:00', 'Evening Shift', '2019-11-01'),
           (8, '16:00:00', 'Evening Shift', '2019-11-01'),
           (10, '16:00:00', 'Evening Shift', '2019-11-01'),
           (13, '16:00:00', 'Evening Shift', '2019-11-01');

INSERT INTO SalariedEmployee
    VALUES (1, TRUE, 5000.00),
           (2, TRUE, 2000.00),
           (3, TRUE, 3000.00),
           (4, TRUE, 2000.00),
           (5, TRUE, 3000.00),
           (6, TRUE, 3000.00),
           (12, TRUE, 5000.00);

INSERT INTO Chef
    VALUES (1),
           (2),
           (3),
           (4),
           (5),
           (6),
           (12);

INSERT INTO LineCook
    VALUES (4), (2);

INSERT INTO HeadChef
    VALUES (1), (12);

INSERT INTO SousChef
    VALUES (3), (6), (5);

INSERT INTO Station
    VALUES ('Butcher');

INSERT INTO LineCookStation
    VALUES (2, 'Fryer', 'Linus Kook'),
           (4, 'Butcher', 'Won der');

INSERT INTO HeadChefRecipes
    VALUES (1, 'Special Chow Mein', 'Seasoned noodles with vegetables'),
           (12, 'Egg Foo Young', 'Omelette'),
           (12, 'Chop Suey', 'Meat, egg, and vegetable dish');
           
INSERT INTO MenuItem
    VALUES ('Celery Sticks', 'Appetizer', NULL, 'Mild'),
           ('Shabu Shabu Udon', 'Soup', 'Beef', 'Mild'),
           ('Chef Special', 'Meat Entree', 'Chef Special', 'Mild'),
           ('Pork', 'Meat Entree', 'Pork', 'Tangy'),
           ('Chicken', 'Meat Entree', 'Chicken', 'Piquant'),
           ('Chow Mein', 'Chow Mein', 'Beef', 'Hot'),
           ('Egg Foo Young', 'Egg Foo Young', 'Chicken', 'Oh My God'),
           ('Chop Suey', 'Chop Suey', 'Seafood', 'Oh My God'),
           ('Buffet', 'All', NULL, NULL);
           
INSERT INTO Customer(customerID, customerName, email, age) 
	Values
	(2000000001, 'Joe', 'Joe223@gmail.com', 21),
	(2000000002, 'Shrek', 'Shrek221@gmail.com', 43),
	(2000000003, 'Perry the Plataups', 'perry42@secretAgent.com', 14),
	(2000000004, 'Einstein', 'Genius@email.com', 150),
	(2000000005, 'Steven', 'Steve32@gmail.com', 20),
	(2000000006, 'Justin', 'Justin75@gmail.com', 21),
	(2000000007, 'Oscar', 'Oscar11@gmail.com', 20);

INSERT INTO MimingsAccount (customerID, rewardsPoints, amountSpent) 
	VALUES
	(2000000001, 75, 750.23),
	(2000000002, 325, 3250.13),
	(2000000003, 476, 4764.20),
	(2000000004, 97, 975.28),
	(2000000005, 12, 128.99),
	(2000000006, 33, 332.08),
	(2000000007, 12, 120.72);

INSERT INTO CorporationAccount ( customerID, corporationName, organizationName, officeAddress, contactNumber )
	VALUES
	(2000000001, 'Swamp INC.', 'CEOs', '700 SWAMP Ave.', '1-800-OGRE'),
	(2000000002, 'Doofenshmertz Evil INC.', 'Secret Agents', '590 TRI STATE AREA', '1-800-DOOF'),
	(2000000003, 'Joes corporation', 'Engineering', '1111 Long Beach Ave.', '1111111'),
	(2000000004, 'Steves corporation', 'Software Developers', '1110 Long Beach Ave.', '2222222');

INSERT INTO CustomerAccount (customerID, snailMail)
 VALUES
	(2000000005, 'Stevesmail@snailmail.com'),
	(2000000006, 'justins@snailmail.com'),
	(2000000007, 'Oscars@snailmail.com'),
	(2000000001, 'joe@snailmail.com');

INSERT INTO mmOrder (orderID, customerID, orderDateTime, paymentType, waiverSigned) 
	VALUES
	(001, 2000000005, '2013-07-11 09:25:10','Credit Card',0),
	(002, 2000000005, '2013-07-13 13:20:10','CreditCard',0),
	(003, 2000000001, '2014-07-13 09:13:10','Check',0),
	(004, null, '2014-07-13 09:25:10', 'Cash', 1),
	(005, 2000000002, '2015-08-12 20:39:10', 'Credit Card', 0),
	(006, 2000000003, '2015-10-30 10:55:10', 'Credit Card', 1),
	(007, 2000000004, '2016-12-02 09:12:10', 'Credit Card', 0),
	(008, 2000000006, '2017-01-21 09:25:10', 'Credit Card', 0),
	(009, 2000000007, '2017-05-13 14:43:10', 'Credit Card', 0),
	(010, 2000000002, '2018-09-01 22:56:10', 'Credit Card', 0),
	(011, 2000000006, '2019-03-09 12:34:10', 'Credit Card', 1),
	(012, 2000000005, '2019-04-06 09:45:10', 'Credit Card', 0);
    
INSERT INTO ToGo (orderID, pickUpTime, orderReadyTime) 
	VALUES
	(001,'09:37:10', '09:35:10'),
	(002,'13:32:10', '13:25:10'),
	(003,'09:25:10','09:18:10'),
	(004,'09:35:10','09:30:10'),
	(005,'20:50:10','20:45:10'),
	(006,'11:05:10','11:00:10');

INSERT INTO EatIn (orderID) 
	VALUES
	(007),
	(008),
	(009),
	(010),
	(011),
	(012);
    
INSERT INTO Menu (menuName) 
	VALUES
	('Evening'),
	('Lunch'),
	('Sunday brunch buffet'),
	('Childrens');

INSERT INTO MenuMenuItem (menuName, menuItemName, price, itemSize) 
	VALUES
	('Evening', 'Chef Special', 14.50, 'large'),
	('Evening', 'Celery Sticks', 12.25, 'large'),
	('Evening', 'Shabu Shabu Udon', 13.99, 'large'),
	('Evening', 'Pork', 15.50, 'large'),
	('Evening', 'Chicken', 14.50, 'large'),
	('Evening', 'Chow Mein', 13.50, 'large'),
	('Evening', 'Egg Foo Young', 13.99, 'large'),
	('Evening', 'Chop Suey', 14.99, 'large'),
	('Lunch', 'Chef Special', 10.20, 'medium'),
	('Lunch', 'Celery Sticks', 9.50, 'medium'),
	('Lunch', 'Shabu Shabu Udon', 8.99, 'medium'),
	('Lunch', 'Pork', 9.50, 'medium'),
	('Lunch', 'Chicken', 10.50, 'medium'),
	('Lunch', 'Chow Mein', 10.50, 'medium'),
	('Childrens', 'Celery Sticks', 5.50, 'small'),
	('Childrens', 'Shabu Shabu Udon', 4.99, 'small'),
	('Childrens', 'Pork', 6.50, 'small'),
	('Childrens', 'Chicken', 5.50, 'small'),
    ('Sunday brunch buffet', 'Buffet', 39.99, NULL);
    
INSERT INTO Tables
    VALUES (7, 7, 1, 'Front room', 10),
           (7, 8, 2, 'Front room', 10),
           (7, 9, 3, 'Bar', 10),
           (7, 10, 4, 'Bar', 10),
           (8, 11, 5, 'Patio', 10),
           (8, 12, 6, 'Patio', 10),
           (7,13,4,'Bar', 10);
           
INSERT INTO OrderDetails 
	VALUES
	('Lunch', 'Chow Mein', 001, 2),
	('Childrens', 'Pork', 001, 1),
	('Lunch', 'Chicken', 002, 3),
	('Sunday brunch buffet', 'Buffet', 003, 4),
	('Lunch', 'Chop Suey', 004, 1),
	('Evening', 'Chef Special', 005, 2),
	('Lunch', 'Pork', 006, 5),
	('Lunch', 'Shabu Shabu Udon', 007, 4),
	('Lunch', 'Chef Special', 008, 3),
	('Lunch', 'Chef Special', 009, 2),
	('Childrens', 'Pork', 009, 1),
	('Evening', 'Celery Sticks', 010, 2),
	('Lunch', 'Chop Suey', 011, 2),
	('Lunch', 'Chow Mein', 012, 1);
    

INSERT INTO OrderDetails
    VALUES ('Childrens', 'Pork', 13, 1), ('Childrens', 'Celery Sticks', 9, 5),
            ('Childrens', 'Celery Sticks', 1, 5), ('Childrens', 'Shabu Shabu Udon', 9, 1);
	    
INSERT INTO Mentorship
    VALUES ('Celery sticks', 6, 5, '2019-12-01', '2019-12-07', 'Expert');
    
INSERT INTO mmOrder
    VALUES (14, 2000000006, '2019-03-10 12:30:00', 'Credit Card', TRUE);

INSERT INTO OrderDetails
    VALUES ('Lunch', 'Pork', 14, 1);

INSERT INTO EatIn VALUES (14, 1);


INSERT INTO Mentorship
    VALUES ('Shabu Shabu Udon', 3, 6, '2019-01-01', '2019-01-30', 'Proficient'),
           ('Pork', 3, 6, '2019-02-02', '2019-03-30', 'Proficient'),
           ('Pork', 5, 6, '2019-03-03', '2019-03-30', 'Proficient'),
           ('Chicken', 3, 5, '2019-04-04', '2019-04-30', 'Proficient'),
           ('Chef Special', 5, 3, '2019-05-05', '2019-05-30', 'Proficient'),
           ('Buffet', 3, 6, '2019-06-06', '2019-07-30', 'Expert'),
           ('Buffet', 6, 3, '2019-08-08', '2019-09-30', 'Expert');
