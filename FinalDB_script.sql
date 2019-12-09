-- Report Requirements --

-- Query 1: Student List --
SELECT
	StudentGrade,
    LastName,
    FirstName
FROM Students;

-- Query 2: Students and their Meal Status --
SELECT
	P.MealType,
    S.LastName,
    S.FirstName
FROM Students S
INNER JOIN Prices P 
ON P.PriceID = S.PriceID;

-- Query 3: Daily Transactions --
SELECT
	COUNT(TransactionID) AS 'MealsPurchased Feb 4',
    SUM(Price) AS 'TotalPrice Feb 4'
FROM Transactions T
INNER JOIN Students S 
ON S.StudentID = T.StudentID
INNER JOIN Prices P 
ON S.PriceID = P.PriceID
WHERE TransactionDate = '2018-02-04 00:00:00';

SELECT
	COUNT(TransactionID) AS 'MealsPurchased Feb 8',
    SUM(Price) AS 'TotalPrice Feb 8'
FROM Transactions T
INNER JOIN Students S 
ON S.StudentID = T.StudentID
INNER JOIN Prices P 
ON S.PriceID = P.PriceID
WHERE TransactionDate = '2018-02-08 00:00:00';

SELECT
	COUNT(TransactionID) AS 'MealsPurchased Feb 22',
    SUM(Price) AS 'TotalPrice Feb 22'
FROM Transactions T
INNER JOIN Students S 
ON S.StudentID = T.StudentID
INNER JOIN Prices P 
ON S.PriceID = P.PriceID
WHERE TransactionDate = '2018-02-022 00:00:00';

-- Query 4: Total Free Meals --
SELECT
	COUNT(TransactionID) 'NumberOfFreeMeals',
    SUM(Mealcost) 'TotalCost ($)'
FROM Prices P 
INNER JOIN Students S 
ON P.PriceID = S.PriceID
INNER JOIN Transactions T
ON S.StudentID = T.StudentID
WHERE MealType = 'Free';

-- Query 5: Total Reduced Meals --
SELECT
	COUNT(TransactionID) 'NumberOfReducedMeals',
    SUM(Mealcost) 'TotalCost ($)'
FROM Prices P 
INNER JOIN Students S 
ON P.PriceID = S.PriceID
INNER JOIN Transactions T
ON S.StudentID = T.StudentID
WHERE MealType = 'Reduced';

-- Query 6: Payment by Students --
SELECT *
FROM Payments;

-- Query 7: Student Balances --
SELECT
	CONCAT(S.FirstName,' ',S.LastName) AS 'StudentName',
    Pm.PaymentAmount,
    P.Price * COUNT(TransactionID) AS 'Current Charges'
FROM Students S 
RIGHT JOIN Prices P 
ON S.PriceID = P.PriceID
LEFT JOIN Payments Pm
ON Pm.StudentID = S.StudentID
LEFT JOIN Transactions T 
ON S.StudentID = T.StudentID
GROUP BY S.StudentID;

-- END --