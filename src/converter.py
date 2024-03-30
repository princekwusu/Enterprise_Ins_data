import pandas as pd

# Read the CSV file into a pandas DataFrame
transactions = pd.read_csv('transactions.csv')
preferences = pd.read_csv('customer_preferences.csv')
demographics = pd.read_csv('customer_demographics.csv')
# Convert the DataFrame to an Excel file
transactions.to_excel('transactions.xlsx', index=False)  # Set index=False to exclude DataFrame index from the Excel file
preferences.to_excel('customer_preferences.xlsx', index=False)
demographics.to_excel('customer_demographics.xlsx', index=False)

