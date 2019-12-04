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

-- Query N
SELECT customerName, organizationName FROM CustomerAccount
INNER JOIN CorporationAccount on CustomerAccount.customerID = CorporationAccount.customerID
INNER JOIN Customer on CorporationAccount.customerID = Customer.customerID;

-- Query O
SELECT * FROM MenuMenuItem;
