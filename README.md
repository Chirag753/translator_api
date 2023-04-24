# README
This README file provides instructions to get the application up and running. Below are the necessary steps that can be followed:

* Prerequisites
Ensure that you have the following software installed on your system:

Ruby version "3.0.0"
Rails version "7.0.4"
MySQL

* System dependencies
There are no external dependencies for this application.

* Configuration
Before you can run the application, you will need to configure the MySQL database by performing the following steps:

Open the config/database.yml file and update the username and password fields as per your MySQL configuration.

Run the following command to create the database:
rails db:create

* Database initialization
After configuring the database, you can initialize it by performing the following steps:

1. Run the following command to setup the database:
rails db:setup ( This will create, migrate and seed the database)


2. Alternatively, you can import the database from a dump file using the following command:
mysql -u username -p translator_api_development < '/path/to/dump_file.sql'
Be sure to provide the full path to the dump file.

* How to run the test suite
You can run the test suite by navigating to the translator-api/spec directory and running the following command:
rspec .

* Deployment instructions
There are no specific deployment instructions for this application. You can deploy it using your preferred deployment method.


## Running api requests using postman collection shared.

* import the collection and run the request in the created order. Make sure to run the rails server. 

* ...# translator_api
