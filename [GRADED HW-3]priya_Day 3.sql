-- Instructor Review for: priya_Day 3.sql
-- Based on: MySQL Homework–3 (Day 3, Chinook)
-- Reference grading style inspired by: [GRADED HW-4]Olagoke Day Assignment
-- Score (out of 10): 9.5
-- Summary: Clean, organized submission that covers all prompts. 
--          Two correctness issues (Q7 total-range; Q9 last-name second character).
--          Minor style opportunities (be explicit with ASC; avoid extra, unrelated SELECTs).
--          All corrected below, with a full fixed solution at the end for copy/paste.

USE chinook;
-- OK: Explicit database context recommended (if your environment requires it).


/* ==============================
   1) Reading Data
   ============================== */

-- Q1: Display all records from the invoice table.
SELECT * FROM invoice;
-- OK per spec.

-- Q2: Show FirstName, LastName, Phone from customer.
SELECT FirstName, LastName, Phone
FROM customer;
-- OK.


/* ==============================
   2) Derived & Aliased Columns
   ============================== */

-- Q3: LastName, FirstName as CustomerName.
SELECT CONCAT(LastName, ',', FirstName) AS CustomerName
FROM customer;
-- OK; alias matches spec (“CustomerName”).

-- Q4: Show Total as InvoiceAmount.
SELECT Total AS InvoiceAmount
FROM invoice;
-- OK.


/* ==============================
   3) DISTINCT
   ============================== */

-- Q5: Unique BillingCountry values.
SELECT DISTINCT BillingCountry
FROM invoice;
-- OK.


/* ==============================
   4) Filtering with WHERE
   ============================== */

-- Q6: Customers who live in Canada.
SELECT *
FROM customer
WHERE Country = 'Canada';
-- OK.

-- Q7: Invoices where Total is less than 3.
SELECT *
FROM invoice
WHERE Total < 3;
-- OK.

-- Q8: Invoices where BillingCountry = 'Germany' AND Total > 5.
SELECT *
FROM invoice
WHERE BillingCountry = 'Germany' AND Total > 5;
-- OK.

-- Q9: Invoices where BillingCountry = 'France' OR Total > 10.
SELECT *
FROM invoice
WHERE BillingCountry = 'France' OR Total > 10;
-- OK.


/* ==============================
   5) Sorting (ORDER BY)
   ============================== */

-- Q10: Invoices with Total > 7, sorted by InvoiceDate ascending.
SELECT *
FROM invoice
WHERE Total > 7
ORDER BY InvoiceDate ASC;
-- OK (student used default ASC; being explicit is clearer).

-- Q11: Customers sorted by City (A→Z) then FirstName (Z→A).
SELECT *
FROM customer
ORDER BY City ASC, FirstName DESC;
-- OK.


/* ==============================
   6) IN and NOT IN
   ============================== */

-- Q12: Customers from Germany, France, Spain.
SELECT *
FROM customer
WHERE Country IN ('Germany', 'France', 'Spain');
-- OK.

-- Q13: Customers NOT from Germany, France, Spain.
SELECT *
FROM customer
WHERE Country NOT IN ('Germany', 'France', 'Spain');
-- OK.


/* ==============================
   7) Range Filters (BETWEEN)
   ============================== */

-- Q14: Show invoices where Total is between 15 and 25.
-- ISSUE: Student used BETWEEN 5 AND 10. This does not match the prompt.
-- FIX:
SELECT *
FROM invoice
WHERE Total BETWEEN 15 AND 25;

-- (Extra line student included:)
-- SELECT InvoiceDate FROM invoice;
-- NOTE: Unnecessary for the homework; keep outputs focused on the asked result.

-- Q15: Invoices where InvoiceDate is between '2009-01-01' and '2009-12-31'.
SELECT *
FROM invoice
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';
-- OK.


/* ==============================
   8) NULL Handling
   ============================== */

-- Q16: Customers where Company IS NULL.
SELECT *
FROM customer
WHERE Company IS NULL;
-- OK.

-- Q17: Customers where Company IS NOT NULL.
SELECT *
FROM customer
WHERE Company IS NOT NULL;
-- OK.


/* ==============================
   9) Pattern Matching (LIKE)
   ============================== */

-- Q18: Customers whose last name starts with 'S'.
SELECT *
FROM customer
WHERE LastName LIKE 'S%';
-- OK (student used 's%'; typically fine under case-insensitive collation).

-- Q19: Customers whose email ends with '.net'.
SELECT *
FROM customer
WHERE Email LIKE '%.net';
-- OK: '.' is literal in LIKE; '%' matches preceding chars.

-- Q20: Customers whose first name contains 'an'.
SELECT *
FROM customer
WHERE FirstName LIKE '%an%';
-- OK.

-- Q21: Customers whose SECOND character of LastName is 'o'.
-- ISSUE: Student used '__o%' which asserts the THIRD character is 'o'.
-- FIX (second character = 'o'):
SELECT *
FROM customer
WHERE LastName LIKE '_o%';


/* ==================================================================================
   FIXED SOLUTION (Clean, executable answers for all questions)
   ----------------------------------------------------------------------------------
   Copy/paste this block to run everything end-to-end.
   (All fixes applied; ordering & aliases are explicit and consistent.)
   ================================================================================== */

-- 1) Reading Data
SELECT * FROM invoice;
SELECT FirstName, LastName, Phone FROM customer;

-- 2) Derived & Aliased Columns
SELECT CONCAT(LastName, ',', FirstName) AS CustomerName FROM customer;
SELECT Total AS InvoiceAmount FROM invoice;

-- 3) DISTINCT
SELECT DISTINCT BillingCountry FROM invoice;

-- 4) Filtering with WHERE
SELECT * FROM customer WHERE Country = 'Canada';
SELECT * FROM invoice WHERE Total < 3;
SELECT * FROM invoice WHERE BillingCountry = 'Germany' AND Total > 5;
SELECT * FROM invoice WHERE BillingCountry = 'France' OR Total > 10;

-- 5) Sorting (ORDER BY)
SELECT * FROM invoice WHERE Total > 7 ORDER BY InvoiceDate ASC;
SELECT * FROM customer ORDER BY City ASC, FirstName DESC;

-- 6) IN and NOT IN
SELECT * FROM customer WHERE Country IN ('Germany','France','Spain');
SELECT * FROM customer WHERE Country NOT IN ('Germany','France','Spain');

-- 7) Range Filters (BETWEEN)
SELECT * FROM invoice WHERE Total BETWEEN 15 AND 25;   -- (fixed)
SELECT * FROM invoice
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

-- 8) NULL Handling
SELECT * FROM customer WHERE Company IS NULL;
SELECT * FROM customer WHERE Company IS NOT NULL;

-- 9) Pattern Matching (LIKE)
SELECT * FROM customer WHERE LastName LIKE 'S%';
SELECT * FROM customer WHERE Email LIKE '%.net';
SELECT * FROM customer WHERE FirstName LIKE '%an%';
SELECT * FROM customer WHERE LastName LIKE '_o%';       -- (fixed: 2nd char = 'o')

-- End of Graded & Fixed Submission.
