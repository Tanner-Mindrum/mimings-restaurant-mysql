-- MenuItem_v
CREATE VIEW MenuItem_lunch_v AS
SELECT MenuItem.menuItemName as "MenuItem", MenuItem.spiceName AS "Spice", CONVERT(MenuMenuItem.price,decimal(10,2)) AS "Lunch Price",MenuMenuItem.itemSize AS "Lunch Size" 
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuMenuItem.menuName="Lunch"
UNION
SELECT MenuItem.menuItemName as "MenuItem", MenuItem.spiceName AS "Spice", 'N/A' AS "Lunch Price",'N/A' AS "Lunch Size" 
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuItem.menuItemName
NOT IN(SELECT MenuItem.menuItemName as "MenuItem"
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuMenuItem.menuName="Lunch"); 

CREATE VIEW MenuItem_eve_v AS
SELECT MenuItem.menuItemName as "MenuItem",MenuItem.spiceName AS "Spice", CONVERT(MenuMenuItem.price,decimal(10,2)) AS "Evening Price",MenuMenuItem.itemSize AS "Evening Size" 
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuMenuItem.menuName="Evening"
UNION
SELECT MenuItem.menuItemName as "MenuItem",MenuItem.spiceName AS "Spice", 'N/A' AS "Evening Price",'N/A' AS "Evening Size" 
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuItem.menuItemName
NOT IN(SELECT MenuItem.menuItemName as "MenuItem"
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuMenuItem.menuName="Evening");

CREATE VIEW MenuItem_kids_v AS
SELECT MenuItem.menuItemName as "MenuItem",MenuItem.spiceName AS "Spice",CONVERT(MenuMenuItem.price,decimal(10,2)) AS "Childrens' Price",MenuMenuItem.itemSize AS "Childrens' Size" 
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuMenuItem.menuName="Childrens"
UNION
SELECT MenuItem.menuItemName as "MenuItem",MenuItem.spiceName AS "Spice", 'N/A' AS "Childrens' Price",'N/A' AS "Childrens' Size" 
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuItem.menuItemName
NOT IN(SELECT MenuItem.menuItemName as "MenuItem"
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuMenuItem.menuName="Childrens");

CREATE VIEW MenuItem_sund_v AS
SELECT MenuItem.menuItemName as "MenuItem",MenuItem.spiceName AS "Spice", CONVERT(MenuMenuItem.price,decimal(10,2)) AS "Sunday Brunch Buffet Price",MenuMenuItem.itemSize AS "Sunday Brunch Buffet Size" 
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuMenuItem.menuName="Sunday brunch buffet"
UNION
SELECT MenuItem.menuItemName as "MenuItem",MenuItem.spiceName AS "Spice", 'N/A' AS "Sunday Brunch Buffet Price",'N/A' AS "Sunday Brunch Buffet Size" 
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuItem.menuItemName
NOT IN(SELECT MenuItem.menuItemName as "MenuItem"
FROM MenuItem INNER JOIN MenuMenuItem
ON MenuItem.menuItemName=MenuMenuItem.menuItemName AND MenuMenuItem.menuName="Sunday brunch buffet");

-- Joining the views
CREATE VIEW MenuItem_v AS
SELECT * FROM MenuItem_lunch_v  Natural Join MenuItem_eve_v Natural Join MenuItem_kids_v Natural Join MenuItem_sund_v;

-- Customer_addresses_v
CREATE VIEW Customer_addresses_v AS
SELECT customerID, customerName, 'Both' AS "Account Type", email, age, snailMail, corporationName, organizationName, officeAddress, contactNumber, rewardsPoints, AmountSpent
FROM Customer Natural Join CustomerAccount Natural Join CorporationAccount Natural Join MimingsAccount
UNION
SELECT customerID, customerName, 'Corporation' AS "Account Type", email, age, 'None' AS "snailMail", corporationName, organizationName, officeAddress, contactNumber, rewardsPoints, AmountSpent 
FROM Customer Natural Join CorporationAccount Natural Join MimingsAccount
WHERE CustomerID IN 
    (SELECT CustomerID 
    FROM CorporationAccount) 
    AND CustomerID NOT IN 
    (SELECT CustomerID
    FROM CustomerAccount)
UNION
SELECT customerID, customerName, 'Customer' AS "Account Type", email, age, snailMail,'None' AS "corporationName", 'None' AS "organizationName", 'None' AS "officeAddress", 'None' AS contactNumber, rewardsPoints, AmountSpent
FROM Customer Natural Join CustomerAccount Natural Join MimingsAccount
WHERE CustomerID IN 
    (SELECT CustomerID 
    FROM CustomerAccount)
    AND CustomerID NOT IN 
    (SELECT CustomerID 
    FROM CorporationAccount) 
ORDER BY CustomerID;

-- Sous_mentor_v 
CREATE VIEW Sous_mentor_v AS
SELECT E.empName AS "Mentor", M.empName AS "Mentee", S.skill AS "Skill",S.menuItemName AS "Food Item", S.startDate AS "Start Date"
FROM Employee M INNER JOIN (Mentorship S INNER JOIN Employee E ON S.empNumber = E.empNumber) 
ON M.empNumber = S.mentorNumber 
ORDER BY E.empName, M.empName;

-- Customer_Sales_v

-- Customer_Value_v
CREATE VIEW Customer_Value_v AS
SELECT customerName AS "Customer", FORMAT(SUM(price), 2) AS "Total" FROM mmOrder
NATURAL JOIN OrderDetails
NATURAL JOIN MenuMenuItem
NATURAL JOIN Customer
WHERE YEAR(orderDateTime) = YEAR(NOW())
GROUP BY customerName
ORDER BY Total DESC;
