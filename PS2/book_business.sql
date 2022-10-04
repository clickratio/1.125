DROP DATABASE IF EXISTS `bookbusiness`;
CREATE DATABASE IF NOT EXISTS `bookbusiness`; 
USE `bookbusiness`;

-- --------------------------------------
--  TABLE BOOK
-- --------------------------------------

CREATE TABLE `Book` (
	`Book_ID` 		int NOT NULL,
	`Title` 		varchar (20) NOT NULL,
	`ISBN` 			int NOT NULL,	
	`Language_Code` varchar (15) NULL ,
	`num_pages` 	int NULL,	
   	`edition` 		int NULL,	 
 	`genre` 		varchar (15) NULL ,   
	`Price` 		float NOT NULL,
	`Publication_Date` 		date NULL,
	`Publisher_ID` 	int NOT NULL,
	`royalties` 	float NOT NULL,

    
	PRIMARY KEY (`Book_ID`)
); 

-- --------------------------------------
--  TABLE PUBLISHER
-- --------------------------------------

CREATE TABLE `Publisher` (
	`Publisher_ID` 		int NOT NULL,			
	`Publisher_Name` 	varchar (20) NOT NULL ,
	`Publisher_Address` varchar (20) NOT NULL ,	
	`Publisher_Email` 	varchar (30) NULL ,
	`Publisher_Phone` 	int NULL,
    
	PRIMARY KEY (`Publisher_ID`) 

);

-- --------------------------------------
--  TABLE AUTHOR
-- --------------------------------------

CREATE TABLE `Author` (
	`Author_ID` 	int NOT NULL,	
	`Author_lName` 	varchar (20) NOT NULL ,
	`Author_fName` 	varchar (20) NOT NULL ,	
	`Author_Email` 	varchar (30) NULL ,
	`Author_Phone` 	int NULL,		
    
	PRIMARY KEY (`Author_ID`) 

);

-- --------------------------------------
--  TABLE EDITOR
-- --------------------------------------

CREATE TABLE `Editor` (
	`Editor_ID` 	int NOT NULL,			
	`Editor_lName` 	varchar (20) NOT NULL ,
	`Editor_fName` 	varchar (20) NOT NULL ,	
	`Editor_Email` 	varchar (30) NULL ,
	`Editor_Phone` 	int NULL,
    
	PRIMARY KEY (`Editor_ID`) 

);

-- --------------------------------------
--  TABLE CUSTOMER
-- --------------------------------------

CREATE TABLE `Customer` (
	`Customer_Account` 	varchar (20) NOT NULL ,				
	`Customer_lName` 	varchar (20) NOT NULL ,
	`Customer_fName` 	varchar (20) NOT NULL ,	
	`Customer_Email` 	varchar (30) NULL ,
	`Customer_Birthday` date NULL,
	`Customer_Phone` 	int NULL,
    
	PRIMARY KEY (`Customer_Account`) 

);

-- --------------------------------------
--  TABLE ORDER
-- --------------------------------------

CREATE TABLE `Orders` (
	`Order_ID` 			int NOT NULL,
	`Order_Price` 		float NULL,
	`Customer_Account` 	varchar (20) NOT NULL ,	
	`Order_Phone` 		int NULL,		
	`Order_lName` 		varchar (20) NOT NULL ,
	`Order_fName` 		varchar (20) NOT NULL ,	
	`Order_Address` 	varchar (30) NULL ,
	`Order_Date` date NULL,
    
	PRIMARY KEY (`Order_ID`) 

);

-- --------------------------------------
--  TABLE REVIEW
-- --------------------------------------

CREATE TABLE `Review` (
	`Review_ID` 		int NOT NULL,
	`Customer_Account` 	varchar (20) NOT NULL ,	
	`Review_Score` 		int NOT NULL,
	`Review_Title` 		varchar (20) NOT NULL ,
	`Review_Text` 		varchar (50) NOT NULL ,	
    
	PRIMARY KEY (`Review_ID`) 

);

-- --------------------------------------
--  Book Author Mapping
-- --------------------------------------

CREATE TABLE `BooktoAuthor` (
	`Book_ID` 			int NOT NULL,
	`Author_ID` 		int NOT NULL,
    
	PRIMARY KEY (`Book_ID`,`Author_ID`) 

);

-- --------------------------------------
--  Book Editor Mapping
-- --------------------------------------

CREATE TABLE `BooktoEditor` (
	`Book_ID` 			int NOT NULL,
	`Editor_ID` 		int NOT NULL,
    
	PRIMARY KEY (`Book_ID`,`Editor_ID`) 

);

-- --------------------------------------
--  Book Order Mapping
-- --------------------------------------

CREATE TABLE `BooktoOrder` (
	`Book_ID` 		int NOT NULL,
	`Order_ID` 		int NOT NULL,
    
	PRIMARY KEY (`Book_ID`,`Order_ID`) 

);

-- --------------------------------------
--  Book Review Mapping
-- --------------------------------------

CREATE TABLE `BooktoReview` (

	`Book_ID` 		int NOT NULL,
	`Review_ID` 	int NOT NULL,
    
	PRIMARY KEY (`Book_ID`,`Review_ID`) 

);



-- --------------------------------------
--  POPULATE Books
-- --------------------------------------

INSERT INTO `Book` VALUES(1,'Harry Potter and the Half-Blood Prince',439785960,'eng',652,1,'YA',5,'2006-09-06',1,0.1);
INSERT INTO `Book` VALUES(2,'Harry Potter and the Order of the Phoenix',439358078,'eng',870,2,'YA',6,'2004-09-01',1,0.2);
INSERT INTO `Book` VALUES(31,'The Lord of the Rings',618517650,'eng',1184,3,'comedy',2,'2004-10-21',4,0.2);

INSERT INTO `Author` VALUES(1,'Rowling','JK','rowling@gmail.com',1184);
INSERT INTO `Author` VALUES(2,'Tolkien','JRR','JRR@gmail.com',1333);
INSERT INTO `Author` VALUES(3,'Writer','Ghost','ghost@gmail.com',333);

INSERT INTO `Editor` VALUES(1,'Rowl','FF','rowl@gmail.com',446);
INSERT INTO `Editor` VALUES(2,'Tolk','RR','RR@gmail.com',2123);
INSERT INTO `Editor` VALUES(3,'Chang','Alex','aa@gmail.com',4821);

INSERT INTO `Publisher` VALUES(1,'Scholastic Inc.','231 Albany st., Cambridge, MA 02139','sch@gmail.com',44446);
INSERT INTO `Publisher` VALUES(4,'Houghton Mifflin Harcourt','1 main st., Cambridge, MA 02139','hou@gmail.com',99446);

INSERT INTO `Customer` VALUES(1,'Willians','John','jw@gmail.com','1980-02-16',9831);
INSERT INTO `Customer` VALUES(2,'Yao','Jenny','jy@gmail.com','1994-02-08',37134);
INSERT INTO `Customer` VALUES(3,'Chang','Alex','ac@gmail.com','1990-03-04',99134);

INSERT INTO `Orders` VALUES(1,NULL,1,1245,'Chang','Alex','9831 boston','2022-10-01');
INSERT INTO `Orders` VALUES(2,NULL,2,91245,'Chang','Alex','11 NY','2022-10-02');
INSERT INTO `Orders` VALUES(3,NULL,3,6666,'Yao','Jenny','98 DC','2022-01-01');
INSERT INTO `Orders` VALUES(4,NULL,2,91245,'Chang','Alex','11 NY','2022-10-02');
INSERT INTO `Orders` VALUES(5,NULL,3,6666,'Yao','Jenny','98 DC','2022-01-01');

INSERT INTO `BooktoAuthor` VALUES(1,1);
INSERT INTO `BooktoAuthor` VALUES(1,3);
INSERT INTO `BooktoAuthor` VALUES(2,1);
INSERT INTO `BooktoAuthor` VALUES(2,3);
INSERT INTO `BooktoAuthor` VALUES(31,2);


INSERT INTO `BooktoEditor` VALUES(1,1);
INSERT INTO `BooktoEditor` VALUES(2,1);
INSERT INTO `BooktoEditor` VALUES(31,2);
INSERT INTO `BooktoEditor` VALUES(1,3);
INSERT INTO `BooktoEditor` VALUES(31,3);

INSERT INTO `BooktoOrder` VALUES(1,1);
INSERT INTO `BooktoOrder` VALUES(1,2);
INSERT INTO `BooktoOrder` VALUES(2,2);
INSERT INTO `BooktoOrder` VALUES(1,3);
INSERT INTO `BooktoOrder` VALUES(2,3);
INSERT INTO `BooktoOrder` VALUES(3,3);
INSERT INTO `BooktoOrder` VALUES(3,4);
INSERT INTO `BooktoOrder` VALUES(2,5);