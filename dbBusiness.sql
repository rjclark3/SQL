-- --------------------------------------------------------------------------------
-- Name: Rodney Clark
-- Class: Database Design 111
-- Abstract: Assignment 1 Construction Business
-- --------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
-- Options
-- --------------------------------------------------------------------------------
USE dbBusiness;     -- Get out of the master database
SET NOCOUNT ON; -- Report only errors

-- --------------------------------------------------------------------------------
--						Problem #1
-- --------------------------------------------------------------------------------

-- Drop Table Statements
IF OBJECt_ID ('TCustomerJobs')			IS NOT NULL DROP TABLE TCustomerJobs
IF OBJECt_ID ('TCustomers')				IS NOT NULL DROP TABLE TCustomers
IF OBJECt_ID ('TJobs')					IS NOT NULL DROP TABLE TJobs

-- --------------------------------------------------------------------------------
-- Drop Views
-- --------------------------------------------------------------------------------

IF OBJECT_ID( 'VCustomers' )						IS NOT NULL DROP VIEW		VCustomers
IF OBJECT_ID( 'VCustomerJobs' )						IS NOT NULL DROP VIEW		VCustomerJobs
IF OBJECT_ID( 'VCustomerNoJob' )					IS NOT NULL DROP VIEW		VCustomerNoJob
IF OBJECT_ID( 'VCustomerJobCount' )					IS NOT NULL DROP VIEW		VCustomerJobCount
-- --------------------------------------------------------------------------------
-- Drop Procedures
-- --------------------------------------------------------------------------------
IF OBJECT_ID( 'uspAddCustomer' )					IS NOT NULL DROP PROCEDURE  uspAddCustomer
IF OBJECT_ID( 'uspAddJob' )							IS NOT NULL DROP PROCEDURE  uspAddJob
-- --------------------------------------------------------------------------------
--	Step #1 : Create table 
-- --------------------------------------------------------------------------------

CREATE TABLE TCustomers
(
	 intCustomerID		INTEGER 	IDENTITY	NOT NULL -- IDENTITY(1,1) first # is starting 2nd is increment
	 ,strLastName		VARCHAR(255)			NOT NULL
	,strFirstName		VARCHAR(255)			NOT NULL
	,strPhoneNum		VARCHAR(255)			NOT NULL
	,strEmail			VARCHAR(255)			NOT NULL
	,CONSTRAINT TCustomers_PK PRIMARY KEY ( intCustomerID )
)

CREATE TABLE TJobs
(
	 intJobID			 INTEGER	IDENTITY	NOT NULL -- IDENTITY(1,1) first # is starting 2nd is increment		
	,strJobDescription	 VARCHAR(250)			NOT NULL
	,dtmStartDate		 DATETIME				NOT NULL
	,dtmEndDate			 DATETIME			

	,CONSTRAINT TJobs_PK PRIMARY KEY ( intJobID )
)

CREATE TABLE TCustomerJobs
(
	  intCustomerJobID		INTEGER	 IDENTITY	NOT NULL -- IDENTITY(1,1) first # is starting 2nd is increment		
	 ,intCustomerID			INTEGER				NOT NULL
	 ,intJobID				INTEGER				NOT NULL
	,CONSTRAINT TCustomerJobs_PK PRIMARY KEY ( intCustomerJobID )
)


-----------------------------------------------------------------------------------
--	Step #2 and 3 Establish Referential Integrity	
-- --------------------------------------------------------------------------------
--
-- #	 Child					Parent				Column
-- -	 -----					 ------				------
-- 1	TCustomerJobs		  TCustomers			intCustomerID
-- 2	TCustomerJobs		  TJobs					intJobID

--1
ALTER TABLE TCustomerJobs ADD CONSTRAINT TCustomerJobs_TCustomers_FK
FOREIGN KEY (intCustomerID) REFERENCES TCustomers (intCustomerID) 

--2
ALTER TABLE TCustomerJobs  ADD CONSTRAINT TCustomerJobs_TJobs_FK
FOREIGN KEY (intJobID) REFERENCES TJobs (intJobID) 

-- --------------------------------------------------------------------------------
--	Step #4 - 8 : Add Sample Data - INSERTS
-- --------------------------------------------------------------------------------

INSERT INTO TCustomers( strLastName, strFirstName, strPhoneNum, strEmail)
VALUES			 	     ( 'James', 'Jones', '5135455545', 'CincyWins@gmail.com')
					    ,( 'Sally', 'Smith', '9371254411', 'YeeHaw@gmail.com')
					    ,( 'Jose', 'Hernandez', '1612522111.', 'email@gmail.com')
					    ,( 'Lan', 'Kim', '6849991111', 'random@gmail.com')

INSERT INTO TJobs( strJobDescription, dtmStartDate, dtmEndDate)  
VALUES					 (  '1', '1/1/2011','1/1/2012')
						,(  '2', '1/1/2014',NULL)
						,(  '3','1/1/2016', '1/1/2018')
						,(  '4', '1/1/2012',NULL)
						,(  '5', '1/1/2014',NULL)

INSERT INTO TCustomerJobs( intCustomerID, intJobID)
VALUES					   (1,2)
						  ,(2,2)
						  ,(1,1)
						  ,(3,4)
						  ,(2,2)



-- --------------------------------------------------------------------------------
--	Step #9 : SELECT from Sample Data 
-- --------------------------------------------------------------------------------

----Returns all Customers jobs
--SELECT 
--	TC.strLastName,TC.strFirstName, TC.strPhoneNum, TC.strEmail, TJ.intJobID, TJ.strJobDescription, TJ.dtmStartDate, TJ.dtmEndDate
--FROM
--	TCustomers as TC
--	Join TCustomerJobs as TCJ
--	on  TC.intCustomerID = TCJ.intCustomerID
--	Join TJobs as TJ
--	on TJ.intJobID = TCJ.intJobID
--Group By TC.strLastName,TC.strFirstName, TC.strPhoneNum, TC.strEmail, TJ.intJobID, TJ.strJobDescription,TJ.dtmStartDate, TJ.dtmEndDate


------All Customers and all jobs (not sure if you wanted this or the first query)
----SELECT	
----	TCustomers.*
----From
----	TCustomers

----SELECT	
----	TJobs.*
----From
----	TJobs

--	-- --------------------------------------------------------------------------------
----	Step #10.	Write query to show any job not completed
---- --------------------------------------------------------------------------------
--SELECT TJ.*
-- FROM TJobs as TJ
--Where tj.dtmEndDate is NULL



---- --------------------------------------------------------------------------------
----	Step #11 Write a query to update an End Date from NULL to a date after the Start Date for that job.
------ --------------------------------------------------------------------------------

--UPDATE TJobs
--SET dtmEndDate = '1/1/2013'
--WHERE intJobID =2

--select TJobs.*
--from TJobs


 -- --------------------------------------------------------------------------------
--	Step #1 Write a View to show all customers
---- --------------------------------------------------------------------------------

GO
CREATE VIEW VCustomers
AS
SELECT
	TC.*
FROM
	TCustomers AS TC

GO
-- --------------------------------------------------------------------------------
--	Step #2 Write a View to show all customers jobs
---- --------------------------------------------------------------------------------
GO
CREATE VIEW VCustomerJobs
AS
SELECT 
	TC.intCustomerID, TC.strLastName,TC.strFirstName, TC.strPhoneNum, TC.strEmail
FROM
	TCustomers as TC
	Join TCustomerJobs as TCJ
	on  TC.intCustomerID = TCJ.intCustomerID
	Join TJobs as TJ
	on TJ.intJobID = TCJ.intJobID
Group By tc.intCustomerID, TC.strLastName,TC.strFirstName, TC.strPhoneNum, TC.strEmail

GO
-- --------------------------------------------------------------------------------
--	Step #3 Write a View to show all customers without jobs
---- --------------------------------------------------------------------------------
GO
CREATE VIEW VCustomerNoJob
AS
SELECT 
	TC.intCustomerID, Tc.strLastName,TC.strFirstName, TC.strPhoneNum, TC.strEmail
FROM
	TCustomers as TC


WHERE TC.intCustomerID not in (SELECT 
	TC.intCustomerID
FROM
	TCustomers as TC
	Join TCustomerJobs as TCJ
	on  TC.intCustomerID = TCJ.intCustomerID
	Join TJobs as TJ
	on TJ.intJobID = TCJ.intJobID
Group By 	TC.intCustomerID)


Group By TC.intCustomerID,TC.strLastName,TC.strFirstName, TC.strPhoneNum, TC.strEmail

GO
-- --------------------------------------------------------------------------------
--	Step #4 Write a View to show all customers job count
---- --------------------------------------------------------------------------------
GO
CREATE VIEW VCustomerJobCount
AS
SELECT
	Tc.intCustomerID, TC.strLastName, TC.strFirstName
	,COUNT(TJ.intJobID) AS Job_Count
FROM
	TCustomers as TC
	Left Join TCustomerJobs as TCJ
	on  TC.intCustomerID = TCJ.intCustomerID
	Left Join TJobs as TJ
	on TJ.intJobID = TCJ.intJobID
group by Tc.intCustomerID, TC.strLastName, TC.strFirstName

GO

--Call views
SELECT * FROM VCustomers
SELECT * FROM VCustomerJobs
SELECT * FROM VCustomerNoJob
SELECT * FROM VCustomerJobCount

-- --------------------------------------------------------------------------------
--	Step #5	Create the stored procedure uspAddCustomer that will add a record to TCustomers.  
---- ------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddCustomer
	 @intCustomerID 	AS INTEGER OUTPUT
	,@strLastName		AS VARCHAR( 50 )
	,@strFirstName		AS VARCHAR( 50 )
	,@strPhoneNum		AS VARCHAR( 50 )
	,@strEMail			AS VARCHAR( 50 )
AS
SET NOCOUNT ON		-- Report only errors
SET XACT_ABORT ON	-- Terminate and rollback entire transaction on error

BEGIN TRANSACTION

	INSERT INTO TCustomers with (TABLOCK) (strLastName, strFirstName, strPhoneNum, strEMail )
	VALUES( @strLastName, @strFirstName, @strPhoneNum, @strEMail )

	SELECT @intCustomerID = MAX(intCustomerID) from TCustomers

COMMIT TRANSACTION

GO

----Test it
--DECLARE @intCustomerID AS INTEGER = 0;
--EXECUTE uspAddCustomer @intCustomerID OUTPUT, 'Richards', 'Dillard', '5134448888', 'Gamer@gmail.com'
--PRINT 'Customer ID = ' + CONVERT( VARCHAR, @intCustomerID )

--select Tc.*
--from TCustomers as TC

-- --------------------------------------------------------------------------------
--	Step #6	Create the stored procedure uspAddJob that will add a record to TJob.  
---- ------------------------------------------------------------------------------
GO

CREATE PROCEDURE uspAddJob
	 @intJobID			AS INTEGER OUTPUT
	,@strJobDescription	AS VARCHAR( 50 )
	,@dtmStartDate		AS datetime
	,@dtmEndDate		AS datetime		
AS
SET NOCOUNT ON		-- Report only errors
SET XACT_ABORT ON	-- Terminate and rollback entire transaction on error

BEGIN TRANSACTION

	INSERT INTO TJobs with(TABLOCK)( strJobDescription, dtmStartDate, dtmEndDate)
	VALUES( @strJobDescription, @dtmStartDate, @dtmEndDate )

	SELECT @intJobID = MAX(intJobID) FROM TJobs

COMMIT TRANSACTION

GO

----Test it
--DECLARE @intJobID AS INTEGER = 0;
--EXECUTE uspAddJob @intJobID OUTPUT, '3', '1/12/1994', '1/12/1995'
--PRINT 'Job ID = ' + CONVERT( VARCHAR, @intJobID )

--select TJ.*
--from TJobs as TJ

GO

CREATE PROCEDURE uspAddCustomerJob
	 @intCustomerJobID			AS INTEGER OUTPUT
	,@intCutomerID				AS INTEGER
	,@intJobID					AS INTEGER

AS
SET NOCOUNT ON		-- Report only errors
SET XACT_ABORT ON	-- Terminate and rollback entire transaction on error

BEGIN TRANSACTION

	INSERT INTO TCustomerJobs with(TABLOCK)( intCustomerID, intJobID )
	VALUES( @intCutomerID, @intJobID )


COMMIT TRANSACTION

GO

----Test it
--DECLARE @intCustomerJobID AS INTEGER = 0;
--EXECUTE uspAddCustomerJob @intCustomerJobID OUTPUT, '3', '4'
--PRINT 'intCustomerJob ID = ' + CONVERT( VARCHAR, @intCustomerJobID )

--select TJ.*
--from TJobs as TJ

 GO

CREATE PROCEDURE uspAddCustomerAndJob

	 @strLastName		AS VARCHAR( 50 )
	,@strFirstName		AS VARCHAR( 50 )
	,@strPhoneNum		AS VARCHAR( 50 )
	,@strEMail			AS VARCHAR( 50 )
	,@strJobDescription	AS VARCHAR( 50 )
	,@dtmStartDate		AS datetime
	,@dtmEndDate		AS datetime

AS
SET NOCOUNT ON		-- Report only errors
SET XACT_ABORT ON	-- Terminate and rollback entire transaction on error

BEGIN TRANSACTION

	DECLARE @intCustomerJobID			AS INTEGER = 0
	DECLARE @intCustomerID				as INTEGER = 0
	DECLARE @intJobID					AS INTEGER = 0

	--Add Customer
	EXECUTE uspAddCustomer @intCustomerID OUTPUT,  'Smith', 'Jeff', '513-545-5544', 'thisismyemail@email.com'

	--Add Job
	EXECUTE uspAddJob @intJobID OUTPUT,  'Job Desc 2', '1/12/2015', '1/12/2016'
	 
	-- Add Customer Job
	EXECUTE uspAddCustomerJob @intCustomerJobID OUTPUT,  @intCustomerID , @intJobID



COMMIT TRANSACTION

GO


--Test it
SELECT * FROM TCustomers
SELECT * FROM TJobs
SELECT * FROM TCustomerJobs

EXECUTE uspAddCustomerAndJob 'Clegane', 'Sandor', '513-555-4321', 'hiimme@gmail.com', 'Job Desc 3', '1/1/2017', '1/1/2018'

SELECT * FROM TCustomers
SELECT * FROM TJobs
SELECT * FROM TCustomerJobs