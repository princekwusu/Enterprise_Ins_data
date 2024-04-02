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
1. Clone or download this repository.
2. Navigate into the directory: `cd Enterprise_Ins_data`.
3. Run the command: `docker-compose up -d`.

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
