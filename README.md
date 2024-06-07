# Overview 
This is an ELT data pipeline project that uses the snowflake snowflake_sample_data.tpch_sf1.orders and snowflake_sample_data.tpch_sf1.lineitems datasets, transforms them using dbt-core, and deploys them on Airflow using astronomer cosmos. 

# Snowflake 

First, you need to create a database and schema on snowflake that dbt can utilize. You also need to create a simple warehouse that can performs computations on the data in the database. Additionally, you need to create role that can access both the database and the warehouse. In my git repo, this setup can be found in the snowflake_Setup.sql file. 

# DBT 

Secondly, you need to download and install dbt-core and dbt-snowflake. More information about the download and installation can be found here: https://docs.getdbt.com/docs/core/pip-install. Once installed, open your terminal and create a folder where you'd like your dbt folder and files to reside. In there run "dbt init". Here you will also specify the way dbt would authenticate into SnowFlake and what database, schema, and warehouse to use. Additionally, this will create a bunch of dbt-related folders and files. 

In the models directory, create two other directories "staging" and "mart". The staging directory will create one-to-one models with the data sources, snowflake tables in this case. The mart contain complex business transformation models. 

As you can see in my repo, the staging directory (dags/dbt/data_pipeline1/models/staging) contains two sql files and one yml file. The yml file defines the source tables from snowflake and you can have some generic tests on some columns from those tables. The sql files in the staging folder contain simple 1:1 connections to the source tables with minor changes like changing column names, adding one or two new columns to the tables. 

The mart contains sql files with complex business logic. I am not going to explain the business logic I used here since that is not the point of this exercise. But suffice it to say, there is some complex SQL here in addition to a yml file with generic tests on the datasets. I've also added some singular SQL based tests in the tests directory. You can modify these based on your business/personal needs. 

Last but not the least is the dbt_project.yml file. This is the probably the most important file in your dbt project folder as this tells dbt where to find all the important files like models, tests, seeds etc. It also tells dbt how to materialize these models, either as tables or views. You can modify this yml file based on your business needs as well.

You can then, execute the command "dbt run" to run your models. Upon successful completion, you'll see the corresponding tables and views on SnowFlake.

# Airflow

If you wish you deploy the dbt-snowflake pipeline, you can do so using Airflow's astronomer-cosmos module. Think of it as a way to view your dbt models as Airflow tasks. This tutorial here was of lots of help in setting this up: https://medium.com/snowflake/using-astronomers-new-cosmos-to-deploy-dbt-pipelines-onto-snowflake-2e211e84690





