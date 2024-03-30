CREATE TYPE gender_enum AS ENUM ('Male', 'Female', 'others');
CREATE TYPE contact_method_enum AS ENUM ('Phone', 'SMS', 'Email');
CREATE TYPE transaction_type_enum AS ENUM ('credit', 'debit');

CREATE TABLE demographics (
    customer_id VARCHAR(6),
    customer_name VARCHAR(255),
    age INTEGER,
    gender gender_enum,
    address VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(30)
);


CREATE TABLE preferences (
    preferred_contact_method contact_method_enum,
    product_category_preferences VARCHAR(100) 
);



CREATE TABLE transactions (
    TransactionDate TIMESTAMP,
    Amount NUMERIC(10, 2),
    Transaction_Type transaction_type_enum
);




select * from preferences;
select * from transactions;
select * from demographics;


ALTER TABLE demographics
ADD PRIMARY KEY (Customer_id);

-----SPLITTING THE CUSTOMER_NAME COLUMN--------
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
---####################



ALTER TABLE demographics
ALTER COLUMN phone_number SET DATA TYPE VARCHAR(15) ;



-----ADDING customer_id from demographics table to the other tables as foreign keys------------------
-- For transactions table
ALTER TABLE transactions
ADD COLUMN customer_id VARCHAR(10),
ADD CONSTRAINT fk_transactions_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES demographics(Customer_id);

-- For preferences table
ALTER TABLE preferences
ADD COLUMN customer_id VARCHAR(10),
ADD CONSTRAINT fk_preferences_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES demographics(Customer_id);
