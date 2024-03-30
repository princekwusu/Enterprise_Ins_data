from faker import Faker
import random
import csv
import uuid

fake = Faker()

# Function to generate random customer demographics for a specific custome
def generate_customer_demographics( num_customers,id_lenght,phone_number_length):
    customers = []
    for _ in range(num_customers):
        customer_id = str(uuid.uuid4())[:id_lenght]
        customer_name = fake.name()
        age = fake.random_int(min=12, max=110)
        gender = fake.random_element(elements=('Male', 'Female','others'))
        address = fake.address()
        email = fake.email()
        phone_number = fake.phone_number()[:phone_number_length]
        customers.append((customer_id,customer_name, age, gender, address, email, phone_number))
    return customers


# Function to generate random transaction data for a specific customer
def generate_transactions( num_transactions):
    transactions = []
    for _ in range(num_transactions):
        transaction_date = fake.date_time_between(start_date="-1y", end_date="now")
        amount = round(random.uniform(10.0, 500.0), 2)
        transaction_type = random.choice(['debit', 'credit'])
        transactions.append((transaction_date, amount, transaction_type))
    return transactions

r


# Function to generate random customer preferences for a specific customer
def generate_customer_preferences(num_customers):
    customers = []
    for _ in range(num_customers):
        preferred_contact_method = random.choice(['Email', 'Phone', 'SMS'])
        product_category_preferences = ', '.join(fake.words(nb=random.randint(1, 5)))
        customers.append((preferred_contact_method, product_category_preferences))
    return customers



number_of_records = 100000
id_lenght = 6
phone_number_length = 15

# Generate data for the common customer
transactions_data = generate_transactions(number_of_records)
customer_demographics_data = generate_customer_demographics(number_of_records,id_lenght,phone_number_length)
customer_preferences_data = generate_customer_preferences(number_of_records)

# Saving data to CSV files (optional)
def save_to_csv(data, filename, header):
    with open(filename, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(header)
        for item in data:
            writer.writerow(item)

save_to_csv(transactions_data, 'transactions.csv', ['TransactionDate','Amount', 'Transaction_Type'])
save_to_csv(customer_demographics_data, 'customer_demographics.csv', ['Customer_id','Customer_Name', 'Age', 'Gender', 'Address', 'Email', 'Phone_Number'])
save_to_csv(customer_preferences_data, 'customer_preferences.csv', [ 'Preferred_Contact_Method', 'Product_Category_Preferences'])

print("Data has been generated and saved to CSV files.")
