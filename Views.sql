-- MenuItem_v

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
