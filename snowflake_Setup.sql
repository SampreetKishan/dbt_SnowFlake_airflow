use role accountadmin;

CREATE or replace WAREHOUSE dbt_wh 
WAREHOUSE_TYPE =  STANDARD
 WAREHOUSE_SIZE =  XSMALL 
 AUTO_SUSPEND = 60
 AUTO_RESUME =  TRUE 
 INITIALLY_SUSPENDED = TRUE; 
 
CREATE DATABASE IF NOT EXISTS dbt_db;

CREATE ROLE dbt_role; 
GRANT ROLE DBT_ROLE TO USER SAMKISHAN5; 

SHOW grants on warehouse dbt_wh; 

GRANT USAGE on warehouse dbt_wh to role dbt_role; 
SHOW grants on warehouse dbt_wh; 
GRANT ALL ON database dbt_db to role dbt_role; 
SHOW GRANTS on database DBT_DB; 
USE ROLE DBT_ROLE; 

CREATE SCHEMA dbt_db.dbt_schema; 

