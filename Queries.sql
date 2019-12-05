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

-- Query L DRAFT - literal statement works
SELECT empName, menuItemName FROM Employee
INNER JOIN Mentorship ON Employee.empNumber = Mentorship.mentorNumber
WHERE Mentorship.mentorNumber = 6;
IN (SELECT MAX(COUNT(mentorNumber) FROM Mentorship GROUP BY mentorNumber ORDER BY mentorNumber DESC LIMIT 1);

-- Query N
SELECT customerName, organizationName FROM CustomerAccount
INNER JOIN CorporationAccount on CustomerAccount.customerID = CorporationAccount.customerID
INNER JOIN Customer on CorporationAccount.customerID = Customer.customerID;

-- Query O
SELECT * FROM MenuMenuItem;
