SELECT customerID, customerName, 'Customer' AS "Account Type", email, age, snailMail,'None' AS "corporationName", 'None' AS "organizationName", 'None' AS "officeAddress", 'None' AS contactNumber
FROM Customer Natural Join CustomerAccount
WHERE CustomerID IN 
    (SELECT CustomerID 
    FROM CustomerAccount)
UNION
SELECT customerID, customerName, 'Corporation' AS "Account Type", email, age, 'None' AS "snailMail", corporationName, organizationName, officeAddress, contactNumber 
FROM Customer Natural Join CorporationAccount
WHERE CustomerID IN 
    (SELECT CustomerID 
    FROM CorporationAccount);
