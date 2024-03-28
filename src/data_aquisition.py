from unicodedata import digit
from faker import Faker
import csv

from phonenumbers import country_code_for_region

fake = Faker()

# Define the number of records
number_of_records = 100000

# Open a new CSV file
with open('ent_gen_data.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    # Writing  headers
    writer.writerow(['Name', 'Address','Customer_Preference', 'Transaction_Activity', 'E_Mail','Gender','Telephone'])

    # Generate fake data
    for _ in range(number_of_records):
        name = fake.name()
        address = fake.address()
        customer_preference = fake.random_element(elements=('app', 'website'))
        transaction_activity = fake.random_number(digits=5, fix_len=True)
        e_mail = fake.email()
        gender = fake.random_element(elements=('male', 'female', 'other'))
        telephone = fake.phone_number()
        
        
        
        
        # Write the data row
        writer.writerow([name, address, customer_preference, transaction_activity, e_mail,gender, telephone])

print('Generated '+ str(number_of_records) + ' fake records in fake_bank_data.csv')