SELECT accountNumber AS "Checking Account Num" FROM CheckingAccounts
UNION
SELECT accountNumber AS "Savings Account Num" FROM SavingsAccounts
UNION
SELECT accountNumber AS "Loan Account Num" FROM LoanAccounts;
------
SELECT accountNumber
CASE
        WHEN EXISTS SELECT accountNumber FROM CheckingAccount THEN "Checking Account Num"
	WHEN EXISTS SELECT accountNumber FROM SavingsAccounts THEN "Savings Account Num"
	WHEN EXISTS SELECT accountNumber FROM LoanAccounts THEN "Loan Account Num"
END;
