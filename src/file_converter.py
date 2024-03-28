import pandas as pd

# Read the CSV file into a pandas DataFrame
df = pd.read_csv('D:\INNGEN_NSS\Data Engineering\Trestle Training\Assignments\Projects\Enterprise_Ins_data\ent_gen_data.csv')

# Convert the DataFrame to an Excel file
df.to_excel('ent_gen_data.xlsx', index=False)  # Set index=False to exclude DataFrame index from the Excel file
