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
    VALUES (1, '9:00:00', 'Morning Shift'),
           (2, '9:00:00', 'Morning Shift'),
           (3, '9:00:00', 'Morning Shift'),
           (7, '9:00:00', 'Morning Shift'),
           (9, '9:00:00', 'Morning Shift'),
           (11, '9:00:00', 'Morning Shift'),
           (12, '16:00:00', 'Evening Shift'),
           (4, '16:00:00', 'Evening Shift'),
           (5, '16:00:00', 'Evening Shift'),
           (6, '16:00:00', 'Evening Shift'),
           (8, '16:00:00', 'Evening Shift'),
           (10, '16:00:00', 'Evening Shift'),
           (13, '16:00:00', 'Evening Shift');

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
           ('Chop Suey', 'Chop Suey', 'Seafood', 'Oh My God');
