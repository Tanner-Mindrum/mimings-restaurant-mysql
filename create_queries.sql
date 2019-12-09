-- Query A
SELECT customerName, 'Both Corporation and Customer' AS "Account Type",email, snailMail, contactNumber 
FROM Customer Natural Join CustomerAccount Natural Join CorporationAccount Natural Join MimingsAccount
UNION
SELECT customerName, 'Corporation' AS "Account Type", email, 'None' AS "snailMail", contactNumber 
FROM Customer Natural Join CorporationAccount Natural Join MimingsAccount
WHERE CustomerID IN 
    (SELECT CustomerID 
    FROM CorporationAccount) 
    AND CustomerID NOT IN 
    (SELECT CustomerID
    FROM CustomerAccount)
UNION
SELECT customerName, 'Customer' AS "Account Type", email, snailMail, 'None' AS contactNumber
FROM Customer Natural Join CustomerAccount Natural Join MimingsAccount
WHERE CustomerID IN 
    (SELECT CustomerID 
    FROM CustomerAccount)
    AND CustomerID NOT IN 
    (SELECT CustomerID 
    FROM CorporationAccount) 
ORDER BY CustomerName;

-- Query B
SELECT customerName, ROUND(SUM(MenuMenuItem.price * Quantity),2) AS "Net Spending in past 2 years", mmOrder.orderDateTime
FROM MimingsAccount NATURAL JOIN Customer NATURAL JOIN mmOrder NATURAL JOIN OrderDetails NATURAL JOIN MenuMenuItem
WHERE OrderDateTime <= (SELECT CURRENT_TIMESTAMP()) AND OrderDateTime > (SELECT SUBDATE(CURRENT_TIMESTAMP(), INTERVAL 2 YEAR))
GROUP BY customerName
ORDER BY amountSpent DESC
LIMIT 3;
                                                                                            
-- Query C
SELECT empName, COUNT(*) AS "Items Learned", GROUP_CONCAT(menuItemName)
FROM Mentorship NATURAL JOIN Employee
GROUP BY empNumber 
HAVING COUNT(*) >= 3;
                                                                                            
-- Query D
SELECT empName FROM Employee NATURAL JOIN (
SELECT e1.empNumber FROM Mentorship e1
WHERE EXISTS (SELECT empNumber, menuItemName FROM Mentorship e2
              WHERE e1.menuItemName = e2.menuItemName
              GROUP BY menuItemName
              HAVING COUNT(empNumber) > 1)
GROUP BY empNumber
HAVING COUNT(empNumber) > 3) AS a;
              
-- Query E
SELECT menuItemName FROM OrderDetails
WHERE menuName = 'Childrens'
GROUP BY menuItemName
ORDER BY COUNT(*) DESC
LIMIT 3;

-- Query F
SELECT menuItemName AS "Item Name", 
       shiftName AS "Shift",
       orderDateTime AS "Time Ordered",
       empName AS "Employee Name", 
       skill AS "Skill"
FROM mmOrder
NATURAL JOIN OrderDetails
NATURAL JOIN MenuMenuItem
NATURAL JOIN MenuItem
NATURAL JOIN Mentorship
NATURAL JOIN SousChef
NATURAL JOIN Chef
NATURAL JOIN SalariedEmployee
NATURAL JOIN Employee
NATURAL JOIN EmployeeShift
WHERE skill <> "Expert";

-- Query G
SELECT customerName, rewardsPoints FROM Customer NATURAL JOIN MimingsAccount
ORDER BY rewardsPoints DESC;

-- Query H
SELECT customerName, amountSpent FROM MimingsAccount NATURAL JOIN Customer
ORDER BY amountSpent DESC;

-- Query I              
CREATE VIEW cust_month_v AS
SELECT customerID, customerName, month(orderDateTime) m
FROM mmOrder NATURAL JOIN EatIn NATURAL JOIN Customer;

SELECT customerName FROM cust_month_v
GROUP BY m
ORDER BY COUNT(*) DESC;

-- Query J              
SELECT customerName, FORMAT(SUM(price), 2) AS "Total" FROM mmOrder
NATURAL JOIN OrderDetails
NATURAL JOIN MenuMenuItem
NATURAL JOIN Customer
WHERE YEAR(orderDateTime) = YEAR(NOW())
GROUP BY customerID
ORDER BY Total DESC
LIMIT 3;
        
-- Query K                                 
SELECT menuItemName, FORMAT(SUM(price), 2) AS "Total" FROM mmOrder
NATURAL JOIN OrderDetails
NATURAL JOIN MenuMenuItem
WHERE YEAR(orderDateTime) = YEAR(NOW())
GROUP BY menuItemName
ORDER BY Total DESC
LIMIT 5;                                 
              
-- Query L
CREATE VIEW max_mentor_v AS
SELECT mentorNumber, COUNT(mentorNumber) c FROM Mentorship
GROUP BY mentorNumber
ORDER BY c DESC
LIMIT 1;

SELECT empName, menuItemName FROM Employee
INNER JOIN Mentorship ON Employee.empNumber = Mentorship.mentorNumber
WHERE Mentorship.mentorNumber IN
(SELECT mentorNumber FROM max_mentor_v);
                                 
-- Query M
SELECT menuItemName, COUNT(menuItemName) "Amount Sous Chefs Who've Learned"
FROM MenuItem NATURAL JOIN Mentorship
GROUP BY menuItemName
ORDER BY COUNT(menuItemName) ASC
LIMIT 3;                                 

-- Query N
SELECT customerName, organizationName FROM CustomerAccount
INNER JOIN CorporationAccount on CustomerAccount.customerID = CorporationAccount.customerID
INNER JOIN Customer on CorporationAccount.customerID = Customer.customerID;

-- Query O
SELECT * FROM MenuMenuItem;

-- Query P1: List the orders where waivers have been signed and make sure only signed waivers order Oh My God spiciness
SELECT waiverSigned, spiceName
FROM mmOrder
NATURAL JOIN OrderDetails
NATURAL JOIN MenuItem;                                 

-- Query P2: Show that orders made from the Childrens menu have only been ordered by those 12 or younger                                 
SELECT customerName, age, menuName FROM OrderDetails
NATURAL JOIN Customer NATURAL JOIN mmOrder
WHERE menuName = 'Childrens';                                 

-- Query P3: Orders must be picked up within 15 minutes or they are removed from the ToGo table                                 
SELECT SUBTIME(pickUpTime, orderReadyTime) FROM ToGo;
