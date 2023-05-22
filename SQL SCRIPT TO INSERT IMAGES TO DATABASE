--CREATE IMAGES TABLE SCRIPT
USE [dba]
CREATE TABLE images(id int, img varbinary(max))

--INSERT IMAGES SCRIPT
USE [dba]
INSERT INTO dba.dbo.images 
values (1, (SELECT * FROM OPENROWSET(BULK N'C:\Users\henite2005\Downloads\color\1.jpg', SINGLE_BLOB) as T1))

--INSERT IMAGES SCRIPT
USE [dba]
INSERT INTO dba.dbo.images 
values (1, (SELECT * FROM OPENROWSET(BULK N'C:\Users\henite2005\Downloads\color\2.jpg', SINGLE_BLOB) as T1))

--INSERT IMAGES SCRIPT
USE [dba]
INSERT INTO dba.dbo.images 
values (1, (SELECT * FROM OPENROWSET(BULK N'C:\Users\henite2005\Downloads\color\3.jpg', SINGLE_BLOB) as T1))

