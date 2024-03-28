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

# Function to ingest data from DataFrame into the database
# Function to ingest data from DataFrame into the database
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
        print("Data ingestion completed successfully")
    except psycopg2.Error as e:
        conn.rollback()
        print("Error ingesting data:", e)


# Database connection parameters
dbname = 'enterprise'
user = 'enterprise'
password = 'enterprise_passwd'
host = 'localhost'  # Assuming PostgreSQL is running on localhost
port = '5432'       # Default PostgreSQL port

# Excel file path and table name
excel_file_path = 'D:\INNGEN_NSS\Data Engineering\Trestle Training\Assignments\Projects\Enterprise_Ins_data\enterprise_data\ent_gen_data.xlsx'
table_name = 'customer'

# Read data from Excel file into a pandas DataFrame
df = pd.read_excel(excel_file_path)

# Connect to the database
conn = connect_to_database(dbname, user, password, host, port)

# Ingest data from DataFrame into the database
if conn:
    ingest_data(conn, df, table_name)
    conn.close()
else:
    print("Failed to connect to the database")
