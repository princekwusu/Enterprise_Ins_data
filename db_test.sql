

INSERT INTO demographics (customer_id,customer_name,age,gender,address,email,phone_Number)
VALUES ('d7d2b0', 'David Moreno','25','Female','0126 Burch Bridge
Lake Monique, OH 90891','sdavis@example.net','543-993-3123x44762'
);

UPDATE demographics
SET address = '0126 Burch Bridge Lake Monique, OH 90891'
WHERE customer_id = 'd7d2b0'; 


ALTER TABLE demographics
ALTER COLUMN phone_number SET DATA TYPE VARCHAR(60);

select * from demographics

DELETE FROM demographics;

ALTER TABLE demographics
ALTER COLUMN customer_id SET DATA TYPE VARCHAR(6);

select * from demographics

ALTER TABLE demographics
ALTER COLUMN phone_number SET DATA TYPE VARCHAR(30);

-- Find the name of the primary key constraint
SELECT constraint_name
FROM information_schema.table_constraints
WHERE table_name = 'demographics'
AND constraint_type = 'PRIMARY KEY';

-- Drop the primary key constraint from the table
ALTER TABLE demographics DROP CONSTRAINT demographics_pkey;


select * from demographics;
select count(distinct(customer_id))  from demographics
	where count(customer_id)

DELETE FROM demographics;

ALTER TABLE demographics
ALTER COLUMN customer_id SET DATA TYPE VARCHAR(10) ;

SELECT Customer_id
FROM demographics
WHERE LENGTH(Customer_id) = 8;



SELECT COUNT(*) AS num_recurring_values
FROM (
    SELECT Customer_id
    FROM demographics
    GROUP BY Customer_id
    HAVING COUNT(*) > 1
) AS recurring_val;




-- Add the new columns
ALTER TABLE demographics
ADD COLUMN First_Name VARCHAR(255),
ADD COLUMN Last_Name VARCHAR(255);

-- Update the new columns with the split values
UPDATE demographics
SET First_Name = SPLIT_PART(Customer_Name, ' ', 1),
    Last_Name = SPLIT_PART(Customer_Name, ' ', 2);

-- Drop the original Customer_Name column
ALTER TABLE demographics
DROP COLUMN Customer_Name;


select * from demographics where gender='others'
	
SELECT phone_number
FROM demographics
WHERE LENGTH(phone_number) = 11;

ALTER TABLE demographics
ALTER COLUMN phone_number SET DATA TYPE VARCHAR(15) ;


-- Add the customer_id column to the transactions table
ALTER TABLE transactions
ADD COLUMN customer_id VARCHAR(10);

-- Add the customer_id column to the preferences table
ALTER TABLE preferences
ADD COLUMN customer_id VARCHAR(10);

-- Set the customer_id column as a foreign key in the transactions table
ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_customer_id
FOREIGN KEY (customer_id)
REFERENCES demographics(Customer_id);

-- Set the customer_id column as a foreign key in the preferences table
ALTER TABLE preferences
ADD CONSTRAINT fk_preferences_customer_id
FOREIGN KEY (customer_id)
REFERENCES demographics(Customer_id);

-- Update the customer_id column in the transactions table with values from demographics
UPDATE transactions
SET customer_id = demographics.customer_id
FROM demographics
WHERE transactions.customer_id = demographics.customer_id;

-- Update the customer_id column in the preferences table with values from demographics
UPDATE preferences
SET customer_id = demographics.customer_id
FROM demographics
WHERE preferences.customer_id = demographics.customer_id;
