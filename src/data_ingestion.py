#Importing the neccesay libraries
import pandas as pd
import psycopg2
from psycopg2 import sql

# Function to connect to the PostgreSQL database
def connect_to_database(dbname, user, password, host, port):
    try:
        conn = psycopg2.connect(
            dbname=dbname,
            user=user,
            password=password,
            host=host,
            port=port
        )
        print("Connected to the database")
        return conn
    except psycopg2.Error as e:
        print("Error connecting to the database:", e)
        return None



# Function to ingest generated data into the database
def ingest_data(conn, df, table_name):
    try:
        cursor = conn.cursor()
        for idx, row in df.iterrows():
            try:
                # Prepare SQL statement to insert data into the table
                insert_query = sql.SQL("INSERT INTO {} VALUES ({})").format(
                    sql.Identifier(table_name),
                    sql.SQL(', ').join(map(sql.Literal, row))
                )
                # Execute the SQL statement
                cursor.execute(insert_query)
            except Exception as e:
                print(f"Error inserting row {idx+1}: {e}")
        conn.commit()
        print(f"Data ingestion into table '{table_name}' completed successfully")
    except psycopg2.Error as e:
        conn.rollback()
        print("Error ingesting data:", e)



# Database connection parameters
dbname = 'enterprise'
user = 'enterprise'
password = 'enterprise_passwd'
host = 'localhost'  
port = '5432'       


# Define Excel file paths and corresponding table names
excel_file_paths = [
    ('enterprise_data/transactions.xlsx', 'transactions'),
    ('enterprise_data/customer_preferences.xlsx', 'preferences'),
    ('enterprise_data/customer_demographics.xlsx', 'demographics')
]

# Connect to the database
conn = connect_to_database(dbname, user, password, host, port)

# Iterate over each Excel file and ingest data into corresponding tables
if conn:
    for file_path, table_name in excel_file_paths:
        # Read data from Excel file into a pandas DataFrame
        df = pd.read_excel(file_path)
        
        # Ingest generated data  into the database
        ingest_data(conn, df, table_name)
        
    conn.close()
else:
    print("Failed to connect to the database")

print("Data import completed.")
