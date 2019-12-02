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
