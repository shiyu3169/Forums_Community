CREATE DATABASE  IF NOT EXISTS `community` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `community`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: community
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `favoriteforums`
--

DROP TABLE IF EXISTS `favoriteforums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoriteforums` (
  `FavoriteForumID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `ForumID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FavoriteForumID`),
  KEY `FavoriteForum_fk_User` (`UserName`),
  KEY `FavoriteForum_fk_Fourm` (`ForumID`),
  CONSTRAINT `FavoriteForum_fk_Fourm` FOREIGN KEY (`ForumID`) REFERENCES `forums` (`ForumID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FavoriteForum_fk_User` FOREIGN KEY (`UserName`) REFERENCES `users` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriteforums`
--

LOCK TABLES `favoriteforums` WRITE;
/*!40000 ALTER TABLE `favoriteforums` DISABLE KEYS */;
INSERT INTO `favoriteforums` VALUES (1,'Zhenhuan',8),(2,'Zhenhuan',1);
/*!40000 ALTER TABLE `favoriteforums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `ForumID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` int(11) DEFAULT NULL,
  `ForumName` varchar(50) DEFAULT NULL,
  `Forum_Owner` varchar(50) DEFAULT NULL,
  `Forum_Category` varchar(63) DEFAULT NULL,
  `Forum_Description` varchar(255) DEFAULT NULL,
  `Forum_CreationTime` datetime NOT NULL,
  `Forum_LastPostTime` datetime DEFAULT NULL,
  `Forum_IsVerified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ForumID`),
  UNIQUE KEY `ForumName` (`ForumName`),
  KEY `Forum_fk_Forum` (`ParentID`),
  KEY `Forum_fk_User` (`Forum_Owner`),
  CONSTRAINT `Forum_fk_Forum` FOREIGN KEY (`ParentID`) REFERENCES `forums` (`ForumID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Forum_fk_User` FOREIGN KEY (`Forum_Owner`) REFERENCES `users` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (1,NULL,'Animal','admin','Animal','This is all about animals !!!!!!!!','2016-04-25 20:29:12','2016-04-25 20:33:28',0),(2,1,'Cats','admin','Forum_Category','Forum_Description','2016-04-25 20:29:12','2016-04-25 20:33:51',1),(8,1,'Dogs','Zhenhuan','Animal','This is all about dogs..','2016-04-25 20:32:35',NULL,0),(9,2,'Hello Kitty','admin','Fans, cats','Fans of hello kitty','2016-04-25 20:35:28',NULL,0),(10,2,'Doraemon','admin','cats, blue cats','About a blue cat','2016-04-25 20:37:04','2016-04-25 20:37:42',0);
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `PostID` int(11) NOT NULL AUTO_INCREMENT,
  `ThreadID` int(11) DEFAULT NULL,
  `ReplyToPost` int(11) DEFAULT NULL,
  `Post_Author` varchar(50) DEFAULT NULL,
  `Post_Content` longtext,
  `Post_CreationTime` datetime NOT NULL,
  `Post_LastModificationTime` datetime DEFAULT NULL,
  `Post_IsDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PostID`),
  KEY `Post_fk_Thread` (`ThreadID`),
  KEY `Post_fk_Post` (`ReplyToPost`),
  KEY `Post_Author_fk_User` (`Post_Author`),
  CONSTRAINT `Post_Author_fk_User` FOREIGN KEY (`Post_Author`) REFERENCES `users` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Post_fk_Post` FOREIGN KEY (`ReplyToPost`) REFERENCES `posts` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Post_fk_Thread` FOREIGN KEY (`ThreadID`) REFERENCES `threads` (`ThreadID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,NULL,'admin','Yes!!!! It is!!!','2016-04-25 20:29:12','2016-04-25 20:29:12',0),(2,1,NULL,'Zhenhuan','No it\'s not!','2016-04-25 20:33:11',NULL,0),(3,5,NULL,'Zhenhuan','Is that a dog?','2016-04-25 20:33:29',NULL,0),(4,2,NULL,'Zhenhuan','d','2016-04-25 20:33:51','2016-04-25 20:34:13',1),(5,6,NULL,'admin','lazy!!!!!!!!!!!!!!!','2016-04-25 20:37:42','2016-04-25 20:38:04',0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_information_after_post_inserted
	AFTER INSERT ON Posts
    FOR EACH ROW
BEGIN
	UPDATE Users
		SET User_LastPostTime = NOW() WHERE UserName = NEW.Post_Author;
	UPDATE Forums
		SET Forum_LastPostTime = NOW() WHERE ForumID = 
			(SELECT ForumID FROM Threads WHERE Threads.ThreadID = NEW.ThreadID LIMIT 1);
	UPDATE Threads
		SET Thread_LastUpdateTime = NOW(),
			Thread_LastUpdator = NEW.Post_Author
            WHERE Threads.ThreadID = NEW.ThreadID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER delete_thread_after_all_its_posts_have_been_deleted
	AFTER UPDATE ON Posts
    FOR EACH ROW
BEGIN
	IF NOT EXISTS (SELECT * FROM Posts WHERE ThreadID = NEW.ThreadID AND Post_IsDeleted = FALSE) THEN
    BEGIN
		UPDATE Threads SET Thread_IsDeleted = TRUE
			 WHERE ThreadID = NEW.ThreadID;
    END;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threads` (
  `ThreadID` int(11) NOT NULL AUTO_INCREMENT,
  `ForumID` int(11) DEFAULT NULL,
  `Thread_Title` varchar(255) DEFAULT NULL,
  `Thread_Author` varchar(50) DEFAULT NULL,
  `Thread_LastUpdator` varchar(50) DEFAULT NULL,
  `Thread_CreationTime` datetime DEFAULT NULL,
  `Thread_LastUpdateTime` datetime DEFAULT NULL,
  `Thread_IsSticky` tinyint(1) DEFAULT NULL,
  `Thread_IsDeleted` tinyint(1) DEFAULT NULL,
  `Thread_NumberOfViews` int(11) NOT NULL,
  PRIMARY KEY (`ThreadID`),
  KEY `Thread_fk_Forum` (`ForumID`),
  KEY `Thread_LastUpdator_fk_User` (`Thread_Author`),
  CONSTRAINT `Thread_Author_fk_User` FOREIGN KEY (`Thread_Author`) REFERENCES `users` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Thread_LastUpdator_fk_User` FOREIGN KEY (`Thread_Author`) REFERENCES `users` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Thread_fk_Forum` FOREIGN KEY (`ForumID`) REFERENCES `forums` (`ForumID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threads`
--

LOCK TABLES `threads` WRITE;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
INSERT INTO `threads` VALUES (1,1,'Is Hello Kitty cat?','admin','Zhenhuan','2016-04-25 20:29:12','2016-04-25 20:33:10',0,0,11),(2,2,'Is Hello Kitty cat?','admin','Zhenhuan','2016-04-25 20:29:12','2016-04-25 20:33:51',0,1,11),(5,1,'What is Hello Kitty?','Zhenhuan','Zhenhuan','2016-04-25 20:33:29','2016-04-25 20:33:28',0,0,9),(6,10,'This cat is lazy so he left nothing here...','admin','admin','2016-04-25 20:37:42','2016-04-25 20:37:42',0,0,3);
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friends`
--

DROP TABLE IF EXISTS `user_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friends` (
  `FriendID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `Friend_UserName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FriendID`),
  KEY `User_Friends_UserName_fk_Users` (`UserName`),
  KEY `User_Friends_Friend_UserName_fk_Users` (`Friend_UserName`),
  CONSTRAINT `User_Friends_Friend_UserName_fk_Users` FOREIGN KEY (`Friend_UserName`) REFERENCES `users` (`UserName`),
  CONSTRAINT `User_Friends_UserName_fk_Users` FOREIGN KEY (`UserName`) REFERENCES `users` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friends`
--

LOCK TABLES `user_friends` WRITE;
/*!40000 ALTER TABLE `user_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_messages`
--

DROP TABLE IF EXISTS `user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_messages` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `Sender` varchar(50) DEFAULT NULL,
  `Recipient` varchar(50) DEFAULT NULL,
  `Message_Title` varchar(255) DEFAULT NULL,
  `Message_Content` longtext,
  `Message_IsRead` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `User_Messages_Sender_fk_Users` (`Sender`),
  KEY `User_Messages_Recipient_fk_Users` (`Recipient`),
  CONSTRAINT `User_Messages_Recipient_fk_Users` FOREIGN KEY (`Recipient`) REFERENCES `users` (`UserName`),
  CONSTRAINT `User_Messages_Sender_fk_Users` FOREIGN KEY (`Sender`) REFERENCES `users` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_messages`
--

LOCK TABLES `user_messages` WRITE;
/*!40000 ALTER TABLE `user_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserName` varchar(50) NOT NULL,
  `User_Password` varchar(512) NOT NULL,
  `User_EMail` varchar(63) NOT NULL,
  `User_LoginIpAddress` varchar(45) NOT NULL,
  `User_RegisterationTime` datetime NOT NULL,
  `User_LastLoginTime` datetime NOT NULL,
  `User_LastPostTime` datetime DEFAULT NULL,
  `User_IsAdministrator` tinyint(1) NOT NULL,
  `User_IsBanned` tinyint(1) NOT NULL,
  `User_Gender` char(1) DEFAULT NULL,
  `User_Autobiography` longtext,
  `User_DateOfBirth` date DEFAULT NULL,
  `User_NumberOfNewMessages` int(11) NOT NULL,
  PRIMARY KEY (`UserName`),
  UNIQUE KEY `User_EMail` (`User_EMail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin','admin@admin.org','127.0.0.1','2016-04-25 20:29:12','2016-04-25 20:50:14','2016-04-25 20:37:42',1,0,NULL,'I\'m the god of this application',NULL,0),('Zhenhuan','password','zhenhuan@neu.edu','0:0:0:0:0:0:0:1','2016-04-25 20:31:59','2016-04-25 20:49:28','2016-04-25 20:33:51',0,0,'M','A cool guy',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'community'
--

--
-- Dumping routines for database 'community'
--
/*!50003 DROP FUNCTION IF EXISTS `add_forum_favorite_with_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_forum_favorite_with_user`(
	Given_ForumID INT,
    Given_UserName VARCHAR(50)
) RETURNS int(11)
BEGIN
	INSERT INTO FavoriteForums (ForumID, UserName) 
		VALUES (Given_ForumID, Given_UserName);
	RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_forum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_forum`(
	-- ForumID	INT,
    Given_ParentID	INT,	-- foreign key to ForumID
    Given_ForumName	VARCHAR(50), -- Forum can be identified by name
    
    Given_Forum_Owner	VARCHAR(50), -- foreign key to Users(Username) to speed up access
    Given_Forum_Category	VARCHAR(63),
    Given_Forum_Description VARCHAR(255),
    
    Given_Forum_CreationTime	DATETIME,
    -- Given_Forum_LastPostTime	DATETIME,
    
    Given_Forum_IsVerified	BOOLEAN
) RETURNS int(11)
BEGIN
	INSERT INTO Forums(
		ParentID,	-- foreign key to ForumID
		ForumName, -- Forum can be identified by name
    
		Forum_Owner, -- foreign key to Users(Username) to speed up access
		Forum_Category,
		Forum_Description,
    
		Forum_CreationTime,
		-- Forum_LastPostTime,
    
		Forum_IsVerified

    ) VALUES (
		Given_ParentID,	-- foreign key to ForumID
		Given_ForumName, -- Forum can be identified by name
    
		Given_Forum_Owner, -- foreign key to Users(Username) to speed up access
		Given_Forum_Category,
		Given_Forum_Description,
    
		Given_Forum_CreationTime,
		-- Given_Forum_LastPostTime,
    
		Given_Forum_IsVerified
	);
    RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_post` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_post`(
    Given_ThreadID	INT, -- foreign key to Threads(ThreadID)
    Given_ReplyToPost	INT, -- foreign key to Post(PostID)
    
    Given_Post_Author	VARCHAR(50),
    -- Given_Post_LastModifier	VARCHAR(50),
    
    Given_Post_Content	LONGTEXT,
    
    Given_Post_CreationTime	DATETIME,
    Given_Post_LastModificationTime	DATETIME,
    
    Given_Post_IsDeleted	BOOLEAN
) RETURNS int(11)
BEGIN
		INSERT INTO Posts(
			ThreadID, -- foreign key to Threads(ThreadID)
			ReplyToPost, -- foreign key to Post(PostID)
			
			Post_Author,
			-- Post_LastModifier,
			
			Post_Content,
			
			Post_CreationTime,
			Post_LastModificationTime,
			
			Post_IsDeleted
        ) VALUES (
			Given_ThreadID, -- foreign key to Threads(ThreadID)
			Given_ReplyToPost, -- foreign key to Post(PostID)
			
			Given_Post_Author,
			-- Given_Post_LastModifier,
			
			Given_Post_Content,
			
			Given_Post_CreationTime,
			Given_Post_LastModificationTime,
			
			Given_Post_IsDeleted
        );
        RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_thread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_thread`(
    Given_ForumID	INT, -- foreign key to Forums(ForumID)
    Given_Thread_Title	VARCHAR(255),
    Given_Thread_Author	VARCHAR(50), -- foreign key to Users(UserName) to speed up access
    Given_Thread_LastUpdator	VARCHAR(50),	-- the last replier or administortor who update it, foreign key to Users(UserName) to speed up access
    
    Given_Thread_CreationTime	DATETIME,
    Given_Thread_LastUpdateTime	DATETIME,
    
    Given_Thread_IsSticky	BOOLEAN,
    Given_Thread_IsDeleted	BOOLEAN
    -- Given_Thread_NumberOfViews	INT
) RETURNS int(11)
BEGIN
	INSERT INTO Threads(
		ForumID,
		Thread_Title,
		Thread_Author,
		Thread_LastUpdator,
    
		Thread_CreationTime,
		Thread_LastUpdateTime,
    
		Thread_IsSticky,
		Thread_IsDeleted,
        Thread_NumberOfViews
    ) VALUES (
		Given_ForumID,
		Given_Thread_Title,
		Given_Thread_Author,
		Given_Thread_LastUpdator,
    
		Given_Thread_CreationTime,
		Given_Thread_LastUpdateTime,
    
		Given_Thread_IsSticky,
		Given_Thread_IsDeleted,
        0
	);
    RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `create_user`(
    Given_UserName 	VARCHAR(50),    
    Given_User_Password	VARCHAR(512), -- in SHA3-512
    Given_User_EMail	VARCHAR(63),
    Given_User_LoginIpAddress	VARCHAR(45),        
    Given_User_IsAdministrator	BOOLEAN,
    Given_User_IsBanned	BOOLEAN,
    Given_User_RegisterationTime	DATETIME,
	Given_User_LastLoginTime	DATETIME,

    Given_User_Gender CHAR(1),
    Given_User_Autobiography LONGTEXT,
	Given_User_DateOfBirth	DATE,
    
    Given_User_NumberOfNewMessages INT
    -- OUT Out_RegisterationTime DATE,
    -- OUT Out_RegisterationTime DATE,
) RETURNS varchar(50) CHARSET utf8
BEGIN
	DECLARE result INT;
	INSERT INTO Users(
		UserName,
        User_Password,
        User_EMail,
        User_LoginIpAddress,
        User_IsAdministrator,
        User_IsBanned,
		User_RegisterationTime,
		User_LastLoginTime,
		User_Gender,
		User_Autobiography,
		User_DateOfBirth,
		User_NumberOfNewMessages
    ) VALUES (
		Given_UserName,
        Given_User_Password,
        Given_User_EMail,
        Given_User_LoginIpAddress,
        Given_User_IsAdministrator,
        Given_User_IsBanned,
		Given_User_RegisterationTime,
		Given_User_LastLoginTime,
		Given_User_Gender,
		Given_User_Autobiography,
        Given_User_DateOfBirth,
        Given_User_NumberOfNewMessages
	);
    RETURN Given_UserName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `is_forum_favorite_with_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_forum_favorite_with_user`(
	Given_ForumID INT,
    Given_UserName VARCHAR(50)
) RETURNS tinyint(1)
BEGIN
	RETURN EXISTS (SELECT * FROM FavoriteForums WHERE UserName = Given_UserName AND ForumID = Given_ForumID LIMIT 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `user_login_validation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `user_login_validation`(
	Given_UserName VARCHAR(50),
    Given_User_Password VARCHAR(512)) RETURNS tinyint(1)
BEGIN
	UPDATE Users SET User_LastLoginTime = NOW()
		WHERE UserName = Given_UserName AND User_Password = Given_User_Password AND User_IsBanned=FALSE LIMIT 1;
	RETURN EXISTS(SELECT * FROM Users 
		WHERE UserName = Given_UserName AND User_Password = Given_User_Password  AND User_IsBanned = FALSE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_forum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_forum`(
	Given_ForumID INT
)
BEGIN
	DELETE FROM Forums WHERE ForumID = Given_ForumID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(
	Given_UserName 	VARCHAR(50)
)
BEGIN
	DELETE FROM Users WHERE UserName = Given_UserName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_forums` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_forums`()
BEGIN
	SELECT * FROM Forums;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_child_forums` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_child_forums`(
	Given_ParentID INT)
BEGIN
	SELECT * FROM Forums WHERE ParentID = Given_ParentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_FavoriteForums_by_UserName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_FavoriteForums_by_UserName`(
	Given_UserName VARCHAR(50))
BEGIN
	SELECT * FROM FavoriteForums WHERE UserName = Given_UserName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_forum_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_forum_by_id`(
	Given_ForumID VARCHAR(50)
)
BEGIN
	SELECT * FROM Forums WHERE ForumID = Given_ForumID LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_post_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_post_by_id`(
	Given_PostID INT
)
BEGIN
	SELECT * FROM Posts WHERE PostID = Given_PostID LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_post_list_by_threadID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_post_list_by_threadID`(
	Given_ThreadID INT
)
BEGIN
	SELECT * FROM Posts WHERE ThreadID = Given_ThreadID AND Post_IsDeleted = FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_recent_threads_updated_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_recent_threads_updated_by_user`(
	Given_UserName VARCHAR(50)
)
BEGIN
	SELECT DISTINCT * FROM Posts 
		NATURAL JOIN Threads WHERE Posts.Post_Author = Given_UserName
			GROUP BY Posts.ThreadID
            ORDER BY Post_CreationTime LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_thread_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_thread_by_id`(
	Given_ThreadID INT
)
BEGIN
	UPDATE Threads SET Thread_NumberOFViews = Thread_NumberOFViews + 1;
	SELECT * FROM Threads WHERE ThreadID = Given_ThreadID LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_thread_list_by_forumID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_thread_list_by_forumID`(
	Given_ForumID INT
)
BEGIN
	SELECT * FROM Threads WHERE ForumID = Given_ForumID AND Thread_IsDeleted = FALSE ORDER BY Thread_IsSticky;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_by_name`(
	Given_UserName VARCHAR(50)
)
BEGIN
	SELECT * FROM Users WHERE UserName = Given_UserName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_forum_favorite_with_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_forum_favorite_with_user`(
	Given_ForumID INT,
    Given_UserName VARCHAR(50)
)
BEGIN
	DELETE FROM FavoriteForums 
		WHERE ForumID = Given_ForumID AND UserName = Given_UserName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_forum_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_forum_by_name`(
	Given_ForumName VARCHAR(50)
)
BEGIN
	SELECT * FROM Forums WHERE ForumName LIKE concat('%',Given_ForumName,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_forum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_forum`(
	Given_ForumID	INT,
    Given_ParentID	INT,	-- foreign key to ForumID
    Given_ForumName	VARCHAR(50), -- Forum can be identified by name
    
    Given_Forum_Owner	VARCHAR(50), -- foreign key to Users(Username) to speed up access
    Given_Forum_Category	VARCHAR(63),
    Given_Forum_Description VARCHAR(255),
    
    -- Given_Forum_CreationTime	DATETIME,
    -- Given_Forum_LastPostTime	DATETIME,
    
    Given_Forum_IsVerified	BOOLEAN
)
BEGIN
	UPDATE Forums SET
			ForumID = Given_ForumID,
			ParentID = Given_ParentID,	-- foreign key to ForumID
			ForumName = Given_ForumName, -- Forum can be identified by name
			
			Forum_Owner = Given_Forum_Owner, -- foreign key to Users(Username) to speed up access
			Forum_Category = Given_Forum_Category,
			Forum_Description = Given_Forum_Description,
			
			-- Given_Forum_CreationTime	DATETIME,
			-- Given_Forum_LastPostTime	DATETIME,
			
			Forum_IsVerified = Given_Forum_IsVerified
		WHERE ForumID = Given_ForumID;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_post` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_post`(
	Given_PostID	INT,
    -- Given_Post_LastModifier	VARCHAR(50),    
    Given_Post_Content	LONGTEXT,    
    Given_Post_LastModificationTime	DATETIME,    
    Given_Post_IsDeleted	BOOLEAN
)
BEGIN
	UPDATE Posts SET
		-- Post_LastModifier = Given_Post_LastModifier,    
		Post_Content = Given_Post_Content,    
		Post_LastModificationTime = Given_Post_LastModificationTime,    
		Post_IsDeleted = Given_Post_IsDeleted
		WHERE PostID = Given_PostID;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user`(
	Old_UserName 	VARCHAR(50),
	New_UserName VARCHAR(50),
    New_User_Password VARCHAR(512),
    New_User_EMail VARCHAR(63),
    New_User_IsAdministrator BOOLEAN,
    New_User_IsBanned BOOLEAN,
    New_User_Gender CHAR(1),
    New_User_Autobiography LONGTEXT,
    New_User_DateOfBirth DATE
)
BEGIN
	UPDATE Users SET 
		UserName = New_UserName,
		User_Password = New_User_Password,
		User_EMail = New_User_EMail,
		User_IsAdministrator = New_User_IsAdministrator,
		User_IsBanned = New_User_IsBanned,
		User_Gender = New_User_Gender,
		User_Autobiography = New_User_Autobiography,
		User_DateOfBirth = New_User_DateOfBirth
		WHERE UserName = Old_UserName LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-25 20:51:11
