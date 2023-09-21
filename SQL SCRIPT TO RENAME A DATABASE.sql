----SQL SCRIPT TO RENAME A DATABASE----

----Alter the Database to single user mode
ALTER DATABASE "dbname" SET SINGLE_USER WITH ROLLBACK IMMEDIATE

----Rename the Database
ALTER DATABASE dbname MODIFY NAME = newdbName

----Alter the database to multi user mode
ALTER DATABASE "dbname" SET MULTI_USER WITH ROLLBACK IMMEDIATE
