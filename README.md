# Enterprise_Ins_data

##Task

## Requirements:
* docker >= 17.12.0+
* docker-compose
* Python3(pandas,psycopg2,faker)

## Guide
* Clone or download this repository
* Go inside of directory,  `cd Enterprise_Ins_data`
* Run this command `docker-compose up -d



## Environments
This Compose file contains the following environment variables:

* `POSTGRES_USER` 
* `POSTGRES_PASSWORD` 
* `PGADMIN_PORT` 
* `PGADMIN_DEFAULT_EMAIL` 
* `PGADMIN_DEFAULT_PASSWORD` 

## Access to postgres: 
* `localhost:5432`
* **Username:** enterprise
* **Password:** enterprise_password 

## Access to PgAdmin: 
* **URL:** [http://localhost:5050](http://localhost:5050)
* **Username:** pgadmin@pgadmin.org 
* **Password:** admin 

## Add a new server in PgAdmin:
* **Host name/address** `postgres`
* **Port** `5432`
* **Username** as `POSTGRES_USER`, by default: `enterprise`
* **Password** as `POSTGRES_PASSWORD`, by default `enterprise_password`
