-- Query G
SELECT customerName, rewardsPoints FROM Customer NATURAL JOIN MimingsAccount
ORDER BY rewardsPoints DESC;
