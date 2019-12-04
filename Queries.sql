-- Query G
SELECT customerName, rewardsPoints FROM Customer NATURAL JOIN MimingsAccount
ORDER BY rewardsPoints DESC;

-- Query N
SELECT customerName, organizationName FROM CustomerAccount
INNER JOIN CorporationAccount on CustomerAccount.customerID = CorporationAccount.customerID
INNER JOIN Customer on CorporationAccount.customerID = Customer.customerID;

-- Query O
SELECT * FROM MenuMenuItem;
