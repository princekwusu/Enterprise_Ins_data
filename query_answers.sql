--1. Find the average age of customers who have made transactions.
SELECT AVG(age) FROM demographics WHERE customer_id IN (SELECT DISTINCT customer_id FROM transactions);


--2. Rank customers based on the total transaction amount they've made.
SELECT customer_id, SUM(Amount) AS total_amount
FROM transactions
GROUP BY customer_id
ORDER BY total_amount DESC;


--3. Create a CTE that lists customers along with the count of transactions they've made.
WITH TransactionCounts AS (
    SELECT customer_id, COUNT(*) AS transaction_count
    FROM transactions
    GROUP BY customer_id
)
SELECT d.customer_id,d.first_name,d.last_name, tc.transaction_count
FROM demographics d
LEFT JOIN TransactionCounts tc ON d.customer_id = tc.customer_id;


--4 .List all combinations of customer names and product category preferences
SELECT d.first_name,d.last_name, p.product_category_preferences
FROM demographics d, preferences p;


--5. Find customers who share the same address.
SELECT address, COUNT(*) AS customer_count
FROM demographics
GROUP BY address
HAVING COUNT(*) > 1;


--6. Calculate the total transaction amount for each transaction type.
SELECT Transaction_Type, SUM(Amount) AS total_amount
FROM transactions
GROUP BY Transaction_Type;


--7. Transform the data to show transaction counts for each transaction type as columns.
SELECT 
    SUM(CASE WHEN Transaction_Type = 'credit' THEN 1 ELSE 0 END) AS credit_count,
    SUM(CASE WHEN Transaction_Type = 'debit' THEN 1 ELSE 0 END) AS debit_count
FROM transactions;


--8. Calculate the cumulative sum of transaction amounts for each customer.
SELECT TransactionDate, Amount, 
       SUM(Amount) OVER (PARTITION BY customer_id ORDER BY TransactionDate) AS cumulative_sum
FROM transactions;


--9. List customers who have made transactions.
SELECT DISTINCT d.customer_id, d.first_name,d.last_name
FROM demographics d
INNER JOIN transactions t ON d.customer_id = t.customer_id;


--10. List customers who have not provided an email address
SELECT customer_id,first_name,last_name
FROM demographics
WHERE email IS NULL;


--11. Retrieve customer names along with their email addresses. If an email address is not provided, display 'N/A'.
SELECT first_name,last_name, COALESCE(email, 'N/A') AS email
FROM demographics;


--12. Categorize customers into age groups (e.g., 'Young', 'Middle-aged', 'Senior').
SELECT 
    first_name,last_name,
    CASE 
        WHEN age < 30 THEN 'Young'
        WHEN age >= 30 AND age < 60 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS age_group
FROM demographics;


--13. Retrieve the latest transaction for each customer.
SELECT DISTINCT ON (customer_id) customer_id, TransactionDate, Amount, Transaction_Type
FROM transactions
ORDER BY customer_id, TransactionDate DESC;


14. --Aggregate all product category preferences into an array for each customer.
SELECT customer_id, ARRAY_AGG(product_category_preferences) AS preferences_array
FROM preferences
GROUP BY customer_id;


--15. Convert the preferences table into JSON format.
SELECT json_agg(p) AS preferences_json
FROM preferences p;


--16. Find customers whose addresses contain the word 'Street
SELECT *
FROM demographics
WHERE address LIKE '%Street%';


--17.Find customers whose email addresses follow a specific pattern
SELECT *
FROM demographics
WHERE email ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';


--18. Assign a unique row number to each transaction, ordered by transaction date.
SELECT ROW_NUMBER() OVER (ORDER BY TransactionDate) AS row_number, *
FROM transactions;


--19. Find customers who have specified multiple product category preferences.
SELECT customer_id
FROM preferences
GROUP BY customer_id
HAVING COUNT(*) > 1;


--20. List customers who have made more transactions than the average number of transactions per customer.
SELECT d.customer_id,d.first_name,d.last_name
FROM demographics d
JOIN (
    SELECT customer_id, COUNT(*) AS transaction_count
    FROM transactions
    GROUP BY customer_id
) AS tc ON d.customer_id = tc.customer_id
WHERE tc.transaction_count > (
    SELECT AVG(transaction_count)
    FROM (
        SELECT COUNT(*) AS transaction_count
        FROM transactions
        GROUP BY customer_id
    ) AS avg_tc
);


