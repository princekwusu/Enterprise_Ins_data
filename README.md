# Enterprise_Ins_data

## Introduction
This project involves generating synthetic data and ingesting it into a PostgreSQL database container managed by Docker. The Python Faker library is utilized to fabricate various types of data, including customer demographics, preferences, and transaction records. SQL queries are employed for creating views and analyzing the data stored within the database.

## Requirements:
- Docker (version >= 17.12.0)
- docker-compose
- Python 3
- Required Python packages (pandas, psycopg2, faker)

## Getting Started
Follow these steps to get started with the project:

### 1. Clone or download this repository
```bash
git clone https://github.com/princekwusu/Enterprise_Ins_data.git
```

### 2. Navigate into the directory
```bash
cd Enterprise_Ins_data
```

### 3. Generate and Ingest Data
The data to be ingested can be found in the `enterprise_data` directory:
- `customer_preferences.xlsx`
- `transaction.xlsx`
- `customer_demographics.xlsx`

Python scripts used to generate the data and ingest are located in the `src` folder:
- `data_aquisition.py` (used to generate data)
- `data_ingestion.py` (used to ingest data)
- `converter.py` (used to convert CSV data to XLSX format)

To generate and ingest data, follow these steps:
```bash
python src/data_aquisition.py
python src/converter.py
python src/data_ingestion.py
```

### 4. Define Database
The `db_def.sql` script is used to define or create the database on the PostgreSQL container. Run the following command to execute the script:
```bash
docker exec -i enterprise_ins_data psql -U enterprise -d enterprise < db_def.sql
```


### 5. Query Questions and Answers
In the `query_questions.txt` file, you'll find a set of questions designed to be solved by querying the database. Each question presents a specific inquiry about the data stored within the database.
The corresponding SQL queries that provide answers to these questions can be found in the `query_answers.sql` file. These queries retrieve relevant information from the database and provide solutions or insights to the questions posed in `query_questions.txt`. 
Feel free to explore both files to understand the questions being asked and the SQL queries used to derive the answers.


## Folder Structure
Here's the structure of the project:


Enterprise_Ins_Data/
│
├── enterprise_data/
│ ├── customer_preferences.xlsx
│ ├── transaction.xlsx
│ └── customer_demographics.xlsx
│
├── src/
│ ├── data_aquisition.py
│ ├── data_ingestion.py
│ ├── converter.py
│ └── db_def.sql
│
├── query_answers.sql
├── query_questions.txt
├── docker-compose.yml
├── LICENSE
└── README.md

## Environments
The Compose file comprises the following environment variables:
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `PGADMIN_PORT`
- `PGADMIN_DEFAULT_EMAIL`
- `PGADMIN_DEFAULT_PASSWORD`

## Accessing PostgreSQL
- **URL:** `localhost:5432`
- **Username:** enterprise
- **Password:** enterprise_password

## Accessing PgAdmin
- **URL:** [http://localhost:5050](http://localhost:5050)
- **Username:** pgadmin@pgadmin.org
- **Password:** admin

## Adding a New Server in PgAdmin
Follow these configurations to add a new server in PgAdmin:
- **Host name/address:** `postgres`
- **Port:** `5432`
- **Username:** Use `POSTGRES_USER` (default: `enterprise`)
- **Password:** Use `POSTGRES_PASSWORD` (default: `enterprise_password`)
