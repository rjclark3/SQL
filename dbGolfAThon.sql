-- --------------------------------------------------------------------------------
-- Name: Rodney Clark
-- Class: Database Design 111
-- Abstract: Assignment 15 GetemToBuyIt
-- --------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
-- Options
-- --------------------------------------------------------------------------------
USE dbGolfAthon;     -- Get out of the master database
SET NOCOUNT ON; -- Report only errors

-- --------------------------------------------------------------------------------
--						Problem #1
-- --------------------------------------------------------------------------------

-- Drop Table Statements
IF OBJECt_ID ('TCSponsorshipSponsors')IS NOT NULL DROP TABLE TCSponsorshipSponsors
IF OBJECt_ID ('TCSponsorshipBenefits')IS NOT NULL DROP TABLE TCSponsorshipBenefits
IF OBJECt_ID ('TCSponsorshipEvents')  IS NOT NULL DROP TABLE TCSponsorshipEvents
IF OBJECt_ID ('TGolferEvents')		  IS NOT NULL DROP TABLE TGolferEvents
IF OBJECt_ID ('TGolferTeamClubs')	  IS NOT NULL DROP TABLE TGolferTeamClubs
IF OBJECt_ID ('TGolfers')			  IS NOT NULL DROP TABLE TGolfers
IF OBJECt_ID ('TShirtSizes')		  IS NOT NULL DROP TABLE TShirtsizes
IF OBJECt_ID ('TBenefits')			  IS NOT NULL DROP TABLE TBenefits
IF OBJECt_ID ('TTeamClubs')			  IS NOT NULL DROP TABLE TTeamClubs
IF OBJECt_ID ('TClubTypes')			  IS NOT NULL DROP TABLE TClubTypes
IF OBJECt_ID ('TClubLevels')		  IS NOT NULL DROP TABLE TClubLevels
IF OBJECt_ID ('TGSponsorships')		  IS NOT NULL DROP TABLE TGSponsorships
IF OBJECt_ID ('TCSponsorships')		  IS NOT NULL DROP TABLE TCSponsorships
IF OBJECt_ID ('TGSponsors')			  IS NOT NULL DROP TABLE TGSponsors
IF OBJECt_ID ('TCSponsors')			  IS NOT NULL DROP TABLE TCSponsors
IF OBJECt_ID ('TPayStatus')			  IS NOT NULL DROP TABLE TPayStatus
IF OBJECt_ID ('TPayTypes')			  IS NOT NULL DROP TABLE TPayTypes
IF OBJECt_ID ('TStates')			  IS NOT NULL DROP TABLE TStates
IF OBJECt_ID ('TGenders')			  IS NOT NULL DROP TABLE TGenders
IF OBJECt_ID ('TCSponsorTypes')		  IS NOT NULL DROP TABLE TCSponsorTypes
IF OBJECt_ID ('TEvents')			  IS NOT NULL DROP TABLE TEvents
-- --------------------------------------------------------------------------------
--	Step #1 : Create table 
-- --------------------------------------------------------------------------------
CREATE TABLE TStates
(
	 intStateID		    INTEGER				NOT NULL
	,strState			VARCHAR(255)		NOT NULL
	,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID )
)

CREATE TABLE TGenders
(
	 intGenderID		INTEGER				NOT NULL
	,strGender			VARCHAR(255)		NOT NULL
	,CONSTRAINT TGenders_PK PRIMARY KEY ( intGenderID )
)

CREATE TABLE TShirtSizes
(
	 intShirtSizeID				INTEGER				NOT NULL
	,strSize					VARCHAR(255)		NOT NULL
	,CONSTRAINT TShirtSizes_PK PRIMARY KEY ( intShirtSizeID )
)

CREATE TABLE TPaystatus
(
	 intPayStatusID	    INTEGER				NOT NULL
	,strType			VARCHAR(255)		NOT NULL
	,CONSTRAINT TPaystatus_PK PRIMARY KEY ( intPayStatusID )
)

CREATE TABLE TPayTypes
(
	 intPayTypeID					INTEGER				NOT NULL
	,strPType						VARCHAR(255)		NOT NULL
	,CONSTRAINT TPayTypes_PK PRIMARY KEY ( intPayTypeID )
)

CREATE TABLE TBenefits
(
	 intBenefitID						INTEGER				NOT NULL
	,strBenfit							VARCHAR(255)		NOT NULL
	,CONSTRAINT TBenefits_PK PRIMARY KEY ( intBenefitID )
)

CREATE TABLE TClubTypes
(
	 intClubTypeID					INTEGER				NOT NULL
	,strCType						VARCHAR(255)		NOT NULL
	,CONSTRAINT TClubTypes_PK PRIMARY KEY ( intClubTypeID )
)

CREATE TABLE TClubLevels
(
	 intClubLevelID					INTEGER				NOT NULL
	,strLevel						VARCHAR(255)		NOT NULL
	,CONSTRAINT TClubLevels_PK PRIMARY KEY ( intClubLevelID )
)

CREATE TABLE TTeamClubs
(
	 intTeamclubID						INTEGER				NOT NULL	
	,intClubLevelID						INTEGER				NOT NULL
	,intClubTypeID						INTEGER				NOT NULL
	,intGenderID						INTEGER				NOT NULL
	,strClubName						VARCHAR(255)		NOT NULL
	,CONSTRAINT TTeamClubs_PK PRIMARY KEY ( intTeamClubID )
)

CREATE TABLE TGSponsorships
(
	 intGSponsorshipID				INTEGER				NOT NULL
	,intGSponsorID					INTEGER				NOT NULL
	,intPayTypeID					INTEGER				NOT NULL
	,intPayStatusID					INTEGER				NOT NULL
	,monSponsorAmt					MONEY				NOT NULL
	,dtmPledgeDate					DATETIME			NOT NULL
	,CONSTRAINT TGolferSponsorships_PK PRIMARY KEY ( intGSponsorshipID )
)

CREATE TABLE TCSponsorships
(
	 intCSponsorshipID				INTEGER				NOT NULL
	,intCSponsorTypeID				INTEGER				NOT NULL
	,monSponsorshipCost				MONEY				NOT NULL
	,intCSAvailable					INTEGER				NOT NULL
	,CONSTRAINT TCSponsorships_PK PRIMARY KEY ( intCSponsorshipID )
)

CREATE TABLE TCSponsorshipSponsors
(
	 intCSponsorshipSponsorID		INTEGER				NOT NULL
	,intCSponsorshipID				INTEGER				NOT NULL
	,intCSponsorID					INTEGER				NOT NULL
	,CONSTRAINT TCSponsorshipSponsors_PK PRIMARY KEY ( intCSponsorshipSponsorID )
)

CREATE TABLE TCSponsorTypes
(
	 intCSponsorTypeID				INTEGER				NOT NULL
	,strCSType						VARCHAR(255)		NOT NULL
	,CONSTRAINT TCSponsorTypes_PK PRIMARY KEY ( intCSponsorTypeID )
)

CREATE TABLE TGolferEvents
(
	 intGolferEventID				INTEGER				NOT NULL
	,intGolferID					INTEGER				NOT NULL
	,intEventID						INTEGER				NOT NULL
	,intTeamClubID					INTEGER				NOT NULL
	,intGsponsorshipID					INTEGER				NOT NULL
	,CONSTRAINT TGolferEvents_PK PRIMARY KEY ( intGolferEventID )
)

CREATE TABLE TGolfers
(
	 intGolferID		INTEGER				NOT NULL
	,intStateID		    INTEGER				NOT NULL
	,intGenderID		INTEGER				NOT NULL
	,intShirtSizeiD		INTEGER				NOT NULL
	,strFirstName		VARCHAR(255)		NOT NULL
	,strLastName		VARCHAR(255)		NOT NULL
	,strAddress			VARCHAR(255)		NOT NULL
	,strCity			VARCHAR(255)		NOT NULL
	,strZip				VARCHAR(255)		NOT NULL
	,strPhNum			VARCHAR(255)		NOT NULL
	,strEMail			VARCHAR(255)		NOT NULL
	,dtmDateOfBirth		DATETIME			NOT NULL
	,CONSTRAINT TGolfers_PK PRIMARY KEY ( intGolferID )
)



CREATE TABLE TCSponsors
(
	 intCSponsorID			INTEGER				NOT NULL
	,intStateID				INTEGER             NOT NULL
	,strCName				VARCHAR(255)		NOT NULL
	,strAddress				VARCHAR(255)		NOT NULL
	,strCity				VARCHAR(255)		NOT NULL
	,strZip					VARCHAR(255)		NOT NULL
	,strContPh				VARCHAR(255)		NOT NULL
	,strContEMail			VARCHAR(255)		NOT NULL

	,CONSTRAINT TCSponsors_PK PRIMARY KEY ( intCSponsorID )
)

CREATE TABLE TCSponsorshipBenefits
(
	 intCSponsorshipBenefitID			INTEGER				NOT NULL
	,strBenefitDesc						VARCHAR(255)		NOT NULL
	,CONSTRAINT TCSponsorshipBenefits_PK PRIMARY KEY ( intCSponsorshipBenefitID )
)

CREATE TABLE TCSponsorshipEvents
(
	 intCSponsorshipEventID			INTEGER				NOT NULL
	,intCSponsorshipID				INTEGER				NOT NULL
	,intEventID						INTEGER				NOT NULL
	,CONSTRAINT TCSponsorshipEvents_PK PRIMARY KEY ( intCSponsorshipEventID )
)

CREATE TABLE TGSponsors
(
	 intGSponsorID			INTEGER				NOT NULL
	,intStateID				INTEGER				NOT NULL
	,strFirstName			VARCHAR(255)		NOT NULL
	,strLastName			VARCHAR(255)		NOT NULL
	,straddress				VARCHAR(255)		NOT NULL
	,strCity				VARCHAR(255)		NOT NULL
	,strZip					VARCHAR(255)		NOT NULL
	,strPhNum				VARCHAR(255)		NOT NULL
	,strEMail				VARCHAR(255)		NOT NULL
	,CONSTRAINT TGSponsors_PK PRIMARY KEY ( intGSponsorID )
)


CREATE TABLE TEvents
(
	 intEventID				INTEGER				NOT NULL
	,dtmEventYr				DATETIME			NOT NULL
	,CONSTRAINT TEvents_PK PRIMARY KEY ( intEventID )
)



-- --------------------------------------------------------------------------------
--	Step #2 Establish Referential Integrity	
-- --------------------------------------------------------------------------------
--
-- #	 Child					Parent				Column
-- -	 -----					 ------				------
-- 1	TCSponsorships		  TCSponsorTypes		intCSponsorTypeID
-- 2	TCSponsorships		  TEvents				intEventID
-- 3	TCSponsorshipSponsors TCSponors				intCSponsorID
-- 4	TCSponsorshipSponsors TCSponsorships		intCSponsorshipID
-- 5	TGolferEvents		  TGolfers				intGolferID
-- 6	TGolferEvents		  TEvents				intEventID
-- 7	TGolfers			  TStates				intStateID
-- 8	TGolfers			  TShirtSizes			intShirtSizeID
-- 9	TGolfers			  TGenders				intGenderID
-- 10	TCSponsors			  TGenders				intGenderID
-- 11   TTeamClubs			  TClubTypes			intClubTypeID
-- 12   TTeamClubs			  TClubLevels			intClubLevelID
-- 13   TTeamClubs			  TGenders			    intGenderID
-- 14	TGolferTeamClubs	  TGolfers				intGolferID
-- 15	TGolferTeamClubs	  TTeamClubs			intTeamClubID
-- 16	TGSponsors			  TStates				intStateID
-- 17   TGSponsorships		  TGolfers				intGolferID
-- 18   TGSponsorships		  TGSponsors			intGSponsorID
-- 19   TGSponsorships		  TPayTypes				intPayTypeID
-- 20   TGSponsorships		  TPayStatus			intPayStatusID
-- 21   TCSponsorships		  TBenefits			    intGenderID
-- 22   TCSponsorshipEvents   TEvents				intEventID
-- 23	TCSponsorshipEvents   TCSponsorships		intCSponsorshipID

--1
ALTER TABLE TCSponsorships ADD CONSTRAINT TCSponsorships_TCSponsorTypes_FK
FOREIGN KEY (intCSponsorTypeID) REFERENCES TCSponsorTypes (intCSponsorTypeID) 

----2
--ALTER TABLE TCSponsorships    ADD CONSTRAINT TCSponsorships_TEvents_FK
--FOREIGN KEY (intEventID) REFERENCES TEvents (intEventID) 

--3
ALTER TABLE TCSponsorshipSponsors ADD CONSTRAINT TCSponsorshipSponsors_TCSponsors_FK
FOREIGN KEY (intCSponsorID) REFERENCES TCSponsors (intCSponsorID) 

--4
ALTER TABLE TCSponsorshipSponsors ADD CONSTRAINT TCSponsorshipSponsors_TCSponsorships_FK
FOREIGN KEY (intCSponsorshipID) REFERENCES TCSponsorships (intCSponsorshipID) 

--5
ALTER TABLE TGolferEvents ADD CONSTRAINT TGolferEvents_TGolfers_FK
FOREIGN KEY (intGolferID) REFERENCES TGolfers (intGolferID) 

--6
ALTER TABLE TGolferEvents ADD CONSTRAINT TGolferEvents_TEvents_FK
FOREIGN KEY (intEventID) REFERENCES TEvents (intEventID) 

--7
ALTER TABLE TGolferEvents ADD CONSTRAINT TGolferEvents_TTeamClubs_FK
FOREIGN KEY (intTeamClubID) REFERENCES TTeamClubs (intTeamClubID) 

--8
ALTER TABLE TGolferEvents ADD CONSTRAINT TGolferEvents_TGsponsorships_FK
FOREIGN KEY (intGSponsorshipID) REFERENCES TGSponsorships (intGSponsorshipID) 

--9
ALTER TABLE TGolfers ADD CONSTRAINT TGolfers_TStates_FK
FOREIGN KEY (intStateID) REFERENCES TStates (intStateID)  

--10
ALTER TABLE TGolfers ADD CONSTRAINT TGolfers_TShirtSizes_FK
FOREIGN KEY (intShirtSizeID) REFERENCES TShirtSizes (intShirtSizeID)

--11
ALTER TABLE TGolfers ADD CONSTRAINT TGolfers_TGenders_FK
FOREIGN KEY (intGenderID) REFERENCES TGenders(intGenderID)
 

--12
ALTER TABLE TTeamClubs ADD CONSTRAINT TTeamClubs_TClubTypes_FK
FOREIGN KEY (intClubTypeID) REFERENCES TClubTypes (intClubTypeID)

--13
ALTER TABLE TTeamClubs ADD CONSTRAINT TTeamClubs_TClubLevels_FK
FOREIGN KEY (intClubLevelID) REFERENCES TClubLevels (intClubLevelID) 

--14
ALTER TABLE TTeamClubs ADD CONSTRAINT TTeamClubs_TGenders_FK
FOREIGN KEY (intGenderID) REFERENCES TGenders (intGenderID) 

--15
ALTER TABLE TGSponsors ADD CONSTRAINT TGSponsorss_TStates_FK
FOREIGN KEY (intStateID) REFERENCES TStates (intStateID)

--17
ALTER TABLE TGSponsorships ADD CONSTRAINT TGSponsorships_TGSponsors_FK
FOREIGN KEY (intGSponsorID) REFERENCES TGSponsors (intGSponsorID)

--18
ALTER TABLE TGSponsorships ADD CONSTRAINT TGSponsorships_TPayTypes_FK
FOREIGN KEY (intPayTypeID) REFERENCES TPayTypes (intPayTypeID)

--19
ALTER TABLE TGSponsorships ADD CONSTRAINT TGSponsorships_TPayStatus_FK
FOREIGN KEY (intPayStatusID) REFERENCES TPayStatus (intPayStatusID)

--20
ALTER TABLE TCSponsorshipEvents ADD CONSTRAINT TCSponsorshipEvents_Tevents_FK
FOREIGN KEY (intEventID) REFERENCES TEvents (intEventID)

--21
ALTER TABLE TCSponsorshipEvents ADD CONSTRAINT TCSponsorshipEvents_TCSponsorships_FK
FOREIGN KEY (intCSponsorshipID) REFERENCES TCSponsorships (intCSponsorshipID)



-- --------------------------------------------------------------------------------
--	Step #2 : Add Sample Data - INSERTS
-- --------------------------------------------------------------------------------

INSERT INTO TStates				(intStateID,	strState)
VALUES			 					 (1,		'Ohio')
									,(2,		'Kentucky')
									,(3,		'Indiana')
									,(4,		'West Virginia')
									,(5,		'Illinois')

INSERT INTO TGenders			 (intGenderID,	 strGender)
VALUES			 					(1,			'Male')
								   ,(2,			'Female')
								   ,(3,			'Multi')

 INSERT INTO TShirtSizes        (intShirtSizeID,		 strSize)
VALUES			 					  (1,				'Extra Small')
									 ,(2,				'Small')
									 ,(3,				'Medium')
									 ,(4,				'Large')
									 ,(5,				'Extra Large')

INSERT INTO TPaystatus			(intPayStatusID,	 strType)
VALUES			 					 (1,			'Paid')
									,(2,			'Not paid')
									
									

INSERT INTO TPayTypes				(intPayTypeID, strPType)
VALUES			 					  (1,		'Cash')
									 ,(2,		'Credit')
									 ,(3,		'Check')


INSERT INTO TBenefits				(intBenefitID,		strBenfit)
VALUES			 					  (1,			'Auto')
									 ,(2,			'Boat')
									 ,(3,			'Motorcycle')
									 ,(4,			'Home')
									 ,(5,			'Renters')

INSERT INTO TCSponsorTypes		 (intCSponsorTypeID, strCSType)
VALUES			 					  (1,			 'Shirts')
									 ,(2,			 'Golf Balls')
									 ,(3,			 'Logo')


INSERT INTO TEvents				 (intEventID, dtmEventYr)
VALUES			 					  (1,			 '2015')
									 ,(2,			 '2016')
									 ,(3,			 '2017')
									 ,(4,			 '2018')

INSERT INTO TClubLevels			(intClubLevelID,	 strLevel)
VALUES			 					  (1,			 'Junior Varsity')
									 ,(2,			 'Varsity')
									 ,(3,			 'Other')

INSERT INTO TClubTypes			(intClubTypeID,	 strCType)
VALUES			 					  (1,			 'Junior Sales')
									 ,(2,			 'Sales')
									 ,(3,			 'Senior Sales')

INSERT INTO TTeamClubs			(intTeamclubID,	intClubLevelID, intClubTypeID, intGenderID,	strClubName)
VALUES			 				  (1,2,3,1,			 'Girls Golf')
								 ,(2,1,2,3,			 'Boys Golf')
								 ,(3,3,1,2,			 'Boys Soccer')

INSERT INTO TGSponsors			(intGSponsorID, intStateID,   strFirstName,strLastName,straddress,strCity,strZip,strPhNum, strEMail)
VALUES			 				 (1, 1,			'James',	'Jones',	  '321 Elm St.',	'Cincinnati',    '45201','5134456687',	  'jj333@gmail.com'  )
								,(2, 1, 		'Sally',	'Smith',	  '987 Main St.',	   'Norwood',		'45218', '5136664485',    'sdt@gmail.com'  )
								,(3, 2, 		'Jose',		'Hernandez',  '1569 Windisch Rd.', 'West Chester',  '45069' , '5138845612',   'gamer222' )
								,(4, 3, 		'Lan',		'Kim',		  '44561 Oak Ave.',    'Milford',		'45246', '5136641258',	  'sdd@gmail.com' )
								,(5, 4,			'Jarret',	'Simmons',	  '2322 Croak Ave.',   'Millards',		'42458', '5136984565',	  'JL3499@gmail.com')

INSERT INTO TCSponsors			(intCSponsorID,	intStateID, strCName, strAddress, strCity, strZip, strContPh, strContEMail)
VALUES			 				 (1, 2,		'HoleIn1Course',	  '321 Elm St.',	   'Cincinnati',    '45201', '5134485644', 'holeinoneer1@gmail.com')
								,(2, 2,		'Sandys Drivers',	  '987 Main St.',	   'Norwood',		'45218', '5136451214', 'shotman4@gmail.com')
								,(3, 1,		'GolfnBourbon',		  '1569 Windisch Rd.', 'West Chester',  '45069', '5137485141', 'Bourbonman3@gmail.com')
								,(4, 1,     'Morning Green',	  '44561 Oak Ave.',    'Milford',		'45246', '513124845', 'eggman2@gmail.com')
								,(5, 4,		'GolfnSnack',		  '2322 Croak Ave.',   'Millards',		'42458', '5136485147', 'candy1@gmail.com')


INSERT INTO TGSponsorships		(intGSponsorshipID,  intGSponsorID, intPayStatusID, intPayTypeID, dtmPledgeDate, monSponsorAmt)
VALUES			 			 (1,						1,			1,				 1,				'7/14/2014',	25)
							,(2,						2,			1,				 2,				'6/11/2014',	100)
							,(3,						3,			2,				 3,				'9/23/2015',	20)
							,(4,						4,			2,				 1,				'12/1/2017',	75)
							,(5,						2,			2,				 2,				'1/1/2016',		121)
							,(6,						5,			1,				 3,				'9/23/2015',	55)
							,(7,						1,			1,				 1,				'12/1/2016',	37)
							,(8,						2,			1,				 2,				'1/1/2015',		21)
							,(9,						3,			1,				 3,				'9/23/2015',	55)
							,(10,						4,			1,				 1,				'12/1/2016',	37)
							,(11,						5,			1,				 2,				'1/1/2015',		21)
							,(12,						1,			1,				 1,				'11/12/2016',	37)
							,(13,						2,			1,				 2,				'9/11/2016',	21)
							,(14,						3,			1,				 3,				'1/1/2017',		55)
							,(15,						4,			1,				 1,				'12/6/2016',	37)
							,(16,						5,			1,				 2,				'1/1/2015',		21)

INSERT INTO TGolfers	(intGolferID, intGenderID, intShirtSizeiD, intStateID, strFirstName, strLastName,		strAddress,			strCity,		strZip, dtmDateOfBirth,	strPhNum,	strEMail)
VALUES					   (1,				1,				1,			2,			'Rodney',	'Jackson',	  '321 Elm St.',	   'Cincinnati',    '45201', '2/1/1994',	'1471455', 'golfer12@gmail.com')
						  ,(2,				2,			    1,			4,			'Sara',		'Sally',	  '987 Main St.',	   'Norwood',		'45218', '1/1/2001',	'1247977', 'golfin2@gmail.com')
						  ,(3,				3,				2,			1,			'Juan',		'Hernandez',  '1569 Windisch Rd.', 'West Chester',  '45069', '5/7/1999',	'4257868', 'GolfKing555@gmail.com')
						  ,(4,				2,				3,			3,			'Landon',	'Carrey',	  '44561 Oak Ave.',    'Milford',		'45246', '8/4/2002',	'4523973', 'doyouevengolfbro@gmail.com')
						  ,(5,				1,				4,			1,			'Jannet',	'Sinsi',	  '2322 Croak Ave.',   'Millards',		'42458', '9/5/2000',	'6788847', 'goingolf222@gmail.com')
						  ,(6,				1,				3,			2,			'Jerry',	'Snails',	  '23 oak st.',		   'Eastgate',		'54865', '9/5/1994',	'5136844', 'GolfRUS@gmail.com')
						  ,(7,				1,				4,			1,			'Tiger',	'Woods',	  '2322 Croak Ave.',   'Millards',		'42458', '9/5/2000',	'6788847', 'icangold@gmail.com')
						  ,(8,				1,				2,			2,			'Happy',	'Gilmore',	  '23 oak st.',		   'Eastgate',		'54865', '9/5/1994',	'5136844', 'GolfRUS@gmail.com')

INSERT INTO TCSponsorships	(intCSponsorshipID,intCSponsorTypeID, intCSAvailable, monSponsorshipCost)
VALUES			 	       (1,			3,				2,			150)
						  ,(2,			2,				5,			101)
						  ,(3,			1,				3,			85)
						  ,(4,			3,				6,			35)
						  ,(5,			1,				5,			250)
						  ,(6,			2,				3,			850)
						  ,(7,			3,				6,			350)
						  ,(8,			3,				5,			240)
						  ,(9,			1,				5,			250)
						  ,(10,			2,				3,			550)
						  ,(11,			1,				6,			150)
						  ,(12,			3,				5,			200)

INSERT INTO TCSponsorshipEvents	(intCSponsorshipEventID, intEventID, intCSponsorshipID)
VALUES						 ( 1,			  2,			1)
							,( 2,			  3,			2)
							,( 3,			  4,			3)
							,( 4,			  1,			4)
							,( 5,			  3,			5)
							,( 6,			  4,			6)
							,( 7,			  1,			7)
							,( 8,			  3,			8)
							,( 9,			  3,			9)
							,( 10,			  4,			10)
							,( 11,			  1,			11)
							,( 12,			  3,			12)
							


INSERT INTO TGolferEvents	(intGolferEventID, intEventID, intGolferID, intGsponsorshipID, intTeamClubID)  
VALUES						 ( 1,			  2,			1,				1,			3)
							,( 2,			  3,			2,				2,			2)
							,( 3,			  4,			2,				3,			1)
							,( 4,			  1,			3,				4,			1)
							,( 5,			  3,			4,				5,			3)
							,( 6,			  3,			2,				6,			1)
							,( 7,			  1,			3,				7,			1)
							,( 8,			  1,			4,				8,			3)
							,( 9,			  4,			2,				9,			2)
							,( 10,			  3,			3,				10,			1)
							,( 11,			  4,			4,				11,			3)
							,( 12,			  2,			3,				12,			1)
							,( 13,			  4,			2,				13,			3)
							,( 14,			  4,			2,				14,			2)
							,( 15,			  4,			3,				15,			1)
							,( 16,			  4,			4,				16,			3)


INSERT INTO TCSponsorshipSponsors	(intCSponsorshipSponsorID,	 intCSponsorID, intCSponsorshipID)
VALUES			 					  (1,1,1)
									 ,(2,2,2)
									 ,(3,3,3)
									 ,(4,1,4)
									 ,(5,2,5)
									 ,(6,3,6)
									 ,(7,1,7)
									 ,(8,2,8)
									 ,(9,2,5)
									 ,(10,2,6)
									 ,(11,1,7)
									 ,(12,2,8)
									 








 --------------------------------------------------------------------------------
	--Step #3 : SELECT from Sample Data 
 --------------------------------------------------------------------------------
 
 --How many events

SELECT 
	Count(intEventID) as TotalEvents
FROM
	TEvents



-- 	Show the total count of sponsors per year. 

SELECT 
	Count(intGSponsorID) as TotalSponsors
FROM
	TGSponsorships as TGS Join TGolferEvents as TGE
	on  TGS.intGSponsorshipID = TGE.intGsponsorshipID
Group by intEventID



-- 	Show the total amount pledged/donated per year. 

SELECT 
	TE.intEventID, SUM (monSponsorAmt*100 ) as TotalSales
FROM
	TGSponsorships as TGS 
	Join TGolferEvents as TGE
	on  TGS.intGSponsorshipID = TGE.intGsponsorshipID
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
Group By TE.intEventID



-- Show total amount collected for a particular year. 

SELECT 
	TE.intEventID,  SUM (CASE TGS.intPayStatusID WHEN 1 THEN  (monSponsorAmt*100) ELSE 0 END) as Paid
				   ,SUM (CASE TGS.intPayStatusID WHEN 2 THEN  (monSponsorAMT*100) ELSE 0 END) as NOTPaid
FROM
	TGSponsorships as TGS 
	Join TGolferEvents as TGE
	on  TGS.intGSponsorshipID = TGE.intGsponsorshipID
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
	Join TPaystatus as TPS
	on TPS.intPayStatusID = TGS.intPayStatusID
Where TE.dtmEventYr = '2015'
Group By TE.intEventID



-- 	Show all golfers who collected over $2500 for a particular year

SELECT 
	TE.intEventID, TG.strLastName, TG.strFirstName,   SUM (monSponsorAmt * 100) as TotalAmt
FROM
	TGSponsorships as TGS 
	Join TGolferEvents as TGE
	on  TGS.intGSponsorshipID = TGE.intGsponsorshipID
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
	Join TGolfers as TG
	on TG.intGolferID = TGE.intGolferID
	WHERE TE.dtmEventYr = '2017'
	Group by TE.intEventID, TG.strLastName, TG.strFirstName
Having sum (TGS.monSponsorAmt*100) > 2500



-- 	Show the total pledges per golfer for a particular year.  Order by highest first. 

SELECT 
	TE.intEventID, TG.strLastName, TG.strFirstName,   COUNT (TGS.intGSponsorID) as TotalPledges
FROM
	TGSponsorships as TGS 
	Join TGolferEvents as TGE
	on  TGS.intGSponsorshipID = TGE.intGsponsorshipID
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
	Join TGolfers as TG
	on TG.intGolferID = TGE.intGolferID
	WHERE TE.dtmEventYr = '2015'
	Group by TG.intGolferID, TE.intEventID, TG.strLastName, TG.strFirstName
	


-- 	Show the average pledge of all sponsors per year. 

SELECT 
	TE.intEventID,  Sum (monsponsoramt), COUNT (monsponsoramt), AVG (monSponsorAmt) as TotalPledges
FROM
	TGSponsorships as TGS 
	Join TGolferEvents as TGE
	on  TGS.intGSponsorshipID = TGE.intGsponsorshipID
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
	Group by  TE.intEventID



--	Show the sponsor who gave the highest single pledge. 

SELECT 
	TOP (1) WITH ties MAX (monsponsoramt) as HighestPledge,   TG.intGSponsorID, TG.strLastName, TG.strfirstName 
FROM
	TGSponsorships as TGS 
	Join TGolferEvents as TGE
	on  TGS.intGSponsorshipID = TGE.intGsponsorshipID
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
	JOIN TGSponsors as TG
	on TG.intGSponsorID = TGS.intGSponsorID
	Group By TG.intGSponsorID, TG.strLastName, TG.strFirstName, TGS.monSponsorAmt
	Order BY (monSponsorAmt) desc



-- 	Show the sponsor who gave the lowest single pledge. 
SELECT 
	 TOP 1 MIN (monsponsoramt) as LowestPledge,  TG.intGSponsorID, TG.strLastName, TG.strfirstName 
FROM
	TGSponsorships as TGS 
	Join TGolferEvents as TGE
	on  TGS.intGSponsorshipID = TGE.intGsponsorshipID
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
	JOIN TGSponsors as TG
	on TG.intGSponsorID = TGS.intGSponsorID
	Group By TG.intGSponsorID, TG.strLastName, TG.strFirstName, TGS.monSponsorAmt
	Order BY (monSponsorAmt) desc



-- 	Show the TEAM/CLUB that has the most pledges on their behalf for a particular year. 

SELECT 
	  TOP (1) WITH ties  TTC.strClubName, Count (TTC.intTeamclubID) as ClubPledges
FROM
	TGSponsorships as TGS 
	Join TGolferEvents as TGE
	on  TGS.intGSponsorshipID = TGE.intGsponsorshipID
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
	Join TTeamClubs as TTC
	on TTC.intTeamclubID = TGE.intTeamClubID	
	Group By  TTC.strClubName
	Order By TTC.strClubName desc



--	Show the total amount raised in corporate sponsorships for a particular year. 
SELECT 
	  TE.intEventID, SUM (TCSS.monSponsorshipCost) as TotalAMT
FROM
	TCSponsorshipEvents as TSE
	Join TCSponsorships as TCSS
	on   TSE.intCSponsorshipID = TCSS.intCSponsorshipID
	Join TEvents as TE
	on   TE.intEventID = TSE.intEventID
	WHERE TE.dtmEventYr = '2015'
	GROUP BY TE.intEventID















-- 1	Show all golfers for the most current event while showing those golfers that played in a previous event who is not golfing in the current event. 
SELECT DISTINCT
	 (TG.strLastName+ ' ' + TG.strFirstName) as CurrentGolfers  
	 
FROM
	 TGolferEvents as TGE
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
	Join TGolfers as TG
	on TG.intGolferID = TGE.intGolferID
WHERE TGE.intGolferID NOT IN (SELECT TGE.intGolferID
FROM TEvents as TE
	Join TGolferEvents as TGE
	  on TE.intEventID = TGE.intEventID
	Join TGolfers as TG
	  on TG.intGolferID = TGE.intGolferID
	  WHERE TE.intEventID = 4)
	Group by TE.intEventID, TG.strLastName, TG.strFirstName


-- 2 
SELECT THISYEARSGOLFERS.strFirstName, THISYEARSGOLFERS.strLastName,  ISNULL (HASSPONSORS.Donations, 0.00)

FROM (SELECT Sum(TGS.monSponsorAmt * 100) as Donations, TG.intGolferID
	  FROM TEvents AS TE JOIN TGolferEvents AS TGE
				ON TE.intEventID = TGE.intEventID	
		JOIN TGSponsorships as TGS 
				ON TGS.intGSponsorshipID = TGE.intGsponsorshipID
		JOIN TGolfers AS TG
				ON TG.intGolferID = TGE.intGolferID	
	 WHERE   TGS.dtmPledgeDate between '1/1/2016' and '12/1/2016'
				 and TE.dtmEventYr = '2016'
	 GROUP BY TG.intGolferID) AS HASSPONSORS

	 RIGHT JOIN (SELECT TG.strFirstName, TG.strLastName, TG.intGolferID
				 FROM TGolfers as TG JOIN TGolferEvents as TEG
						ON TG.intGolferID = TEG.intGolferID	
				 WHERE TEG.intEventID = 2) As THISYEARSGOLFERS

		ON THISYEARSGOLFERS.intGolferID = HASSPONSORS.intGolferID

																	

	 
-- 3	Show total pledged/donated per golfer for the current event.  For those playing that do not have pledges, show their total as zero.  (Note:…all you need to do is make this an outer join).  

	SELECT  TG.strLastName+ ', ' + TG.strFirstName,  SUM (TGS.monsponsoramt*100)
	FROM		TGolfers as TG

				Left Join TGolferEvents as TGE
				on TG.intGolferID = TGE.intGolferID

				LEFT Join TGSponsorships as TGS
				on TGE.intGsponsorshipID = TGS.intGSponsorshipID

				LEFT Join TEvents as TE
				on TE.intEventID = TGE.intEventID
				Group By TG.intGolferID, TG.strLastName, TG.strFirstName



-- 4)	Show ONLY golfers who played in previous events that are not playing in the current event. 
SELECT DISTINCT
	 (TG.strLastName+ ' ' + TG.strFirstName) as CurrentGolfers
	 
FROM
	 TGolferEvents as TGE
	Join TEvents as TE
	on TE.intEventID = TGE.intEventID
	 Join TGolfers as TG
	on TG.intGolferID = TGE.intGolferID
WHERE TGE.intGolferID NOT IN (SELECT TGE.intGolferID
FROM TEvents as TE
	Join TGolferEvents as TGE
	  on TE.intEventID = TGE.intEventID
	Join TGolfers as TG
	  on TG.intGolferID = TGE.intGolferID
	  WHERE TE.intEventID = 4)
	Group by TE.intEventID, TG.strLastName, TG.strFirstName


-- 5)	Show ONLY sponsors who donated $100 or more in previous events that have not donated for the current event.  Show the golfer(s), the event, and representative sport/club that each of these sponsors donated in the past. 
	SELECT (TGS.strLastName + ', ' + TGS.strFirstName) as Sponsor, (TG.strLastName + ', ' + TG.strFirstName) as Golfer, TE.dtmEventYr, TTC.strClubName
	FROM		TGolfers as TG

				Join TGolferEvents as TGE
				on TG.intGolferID = TGE.intGolferID

				Join TGSponsorships as TGSS
				on TGE.intGsponsorshipID = TGSS.intGSponsorshipID

				Join TEvents as TE
				on TE.intEventID = TGE.intEventID

				Join TTeamClubs as TTC
				on TTC.intTeamclubID = TGE.intTeamClubID

				Join TGSponsors as TGS
				on TGS.intGsponsorID = TGSS.intGSponsorID
				 
				WHERE TGS.intGSponsorID NOT IN ( SELECT  TGS.intGSponsorID
						FROM		TGolfers as TG

						Join TGolferEvents as TGE
						on TG.intGolferID = TGE.intGolferID

						Join TGSponsorships as TGSS
						on TGE.intGsponsorshipID = TGSS.intGSponsorshipID

						Join TEvents as TE
						on TE.intEventID = TGE.intEventID
						
						Join TGSponsors as TGS
						on TGS.intGsponsorID = TGSS.intGSponsorID
						WHERE TE.intEventID = 4)

				Group By TGS.intGSponsorID, TGS.strLastName, TGS.strFirstName, TG.strLastName, Tg.strFirstName, TE.dtmEventYr, TTC.strClubName, TGSS.monSponsorAmt
				HAVING (TGSS.monSponsorAmt*100) > 100
				
-- 6)	Show corporate sponsors that have purchased a corporate sponsorship in the past but have not in the current event.  Show the event(s) and the type(s) of sponsorships purchased per sponsor.  

	SELECT (TCS.strCName) as Sponsor, TE.dtmEventYr, TCST.strCSType
	FROM		TEvents as TE

				Join TCSponsorshipEvents as TCSE
				on TE.intEventID = TCSE.intEventID

				Join TCSponsorships as TCSS
				on TCSS.intCSponsorshipID = TCSE.intCSponsorshipID
						
				Join TCSponsorshipSponsors as TCSSS
				on TCSS.intCSponsorshipID = TCSSS.intCSponsorshipID

				Join TCSponsors as TCS
				on TCS.intCsponsorID = TCSSS.intCSponsorID

				Join TCSponsorTypes as TCST
				on TCST.intCSponsorTypeID = TCSS.intCSponsorTypeID

					 
				WHERE TCS.intCSponsorID NOT IN ( SELECT  TCS.intCSponsorID
						FROM  TEvents as TE

						Join TCSponsorshipEvents as TCSE
						on TE.intEventID = TCSE.intEventID

						Join TCSponsorships as TCSS
						on TCSS.intCSponsorshipID = TCSE.intCSponsorshipID
						
						Join TCSponsorshipSponsors as TCSSS
						on TCSS.intCSponsorshipID = TCSSS.intCSponsorshipID

						Join TCSponsors as TCS
						on TCS.intCsponsorID = TCSSS.intCSponsorID
						WHERE TE.intEventID = 4)

				Group By TCS.intCSponsorID, TCS.strCName, TE.dtmEventYr, TCST.strCSType

--7)	Show corporate sponsors that have purchased more than 1 corporate sponsorships where the combined total was over $500.00 in the past but has not purchased a sponsorship in the current event.  Show the event(s), the type(s) of sponsorships purchased, and the price for each per sponsor
	SELECT  (TCS.strCName) as Sponsor, TE.dtmEventYr, TCST.strCSType, SUM(TCSS.monSponsorshipCost) as AMT
	FROM		TEvents as TE

				Join TCSponsorshipEvents as TCSE
				on TE.intEventID = TCSE.intEventID

				Join TCSponsorships as TCSS
				on TCSS.intCSponsorshipID = TCSE.intCSponsorshipID
						
				Join TCSponsorshipSponsors as TCSSS
				on TCSS.intCSponsorshipID = TCSSS.intCSponsorshipID

				Join TCSponsors as TCS
				on TCS.intCsponsorID = TCSSS.intCSponsorID

				Join TCSponsorTypes as TCST
				on TCST.intCSponsorTypeID = TCSS.intCSponsorTypeID

					 
				WHERE TCS.intCSponsorID NOT IN ( SELECT  TCS.intCSponsorID
						FROM  TEvents as TE

						Join TCSponsorshipEvents as TCSE
						on TE.intEventID = TCSE.intEventID

						Join TCSponsorships as TCSS
						on TCSS.intCSponsorshipID = TCSE.intCSponsorshipID
						
						Join TCSponsorshipSponsors as TCSSS
						on TCSS.intCSponsorshipID = TCSSS.intCSponsorshipID

						Join TCSponsors as TCS
						on TCS.intCsponsorID = TCSSS.intCSponsorID
						WHERE TE.intEventID = 4)

	Group By TCS.intCSponsorID, TCS.strCName, TE.dtmEventYr, TCST.strCSType
	Having COUNT(TCS.intCSponsorID) > 1 and SUM(TCSS.monSponsorshipCost) > 500
