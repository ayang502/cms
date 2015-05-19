-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `cmsware_admin_sessions`
--

DROP TABLE IF EXISTS `cmsware_admin_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_admin_sessions` (
  `sId` varchar(32) NOT NULL DEFAULT '',
  `sIpAddress` varchar(16) DEFAULT NULL,
  `sUserName` varchar(32) DEFAULT NULL,
  `sUId` int(8) DEFAULT '0',
  `sGId` int(8) DEFAULT '0',
  `sGAuthData` mediumblob,
  `sGIsAdmin` tinyint(1) DEFAULT '0',
  `sLogInTime` int(10) DEFAULT '0',
  `sRunningTime` int(10) DEFAULT '0',
  `IpSecurity` tinyint(1) DEFAULT '0',
  `sData` longblob,
  PRIMARY KEY (`sId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_block_ip`
--

DROP TABLE IF EXISTS `cmsware_block_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_block_ip` (
  `Id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `IP` char(15) DEFAULT NULL,
  `ExpireTime` int(10) DEFAULT NULL,
  `Reason` char(250) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_category`
--

DROP TABLE IF EXISTS `cmsware_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_category` (
  `CateID` int(8) NOT NULL AUTO_INCREMENT,
  `TableID` int(8) DEFAULT '0',
  `Name` varchar(20) DEFAULT NULL,
  `ParentID` int(8) DEFAULT NULL,
  `OwnerID` varchar(20) DEFAULT NULL,
  `Disabled` tinyint(1) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `IndexNodeID` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CateID`),
  KEY `C_D` (`CateID`,`Disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_1`
--

DROP TABLE IF EXISTS `cmsware_collection_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_1` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT NULL,
  `ModifiedDate` int(10) DEFAULT NULL,
  `ApprovedDate` int(10) DEFAULT NULL,
  `PublishDate` int(10) DEFAULT NULL,
  `State` int(2) DEFAULT NULL,
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `TitleColor` varchar(7) DEFAULT NULL,
  `Author` varchar(20) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Photo` varchar(250) DEFAULT NULL,
  `SubTitle` varchar(250) DEFAULT NULL,
  `Content` longtext,
  `Keywords` varchar(250) DEFAULT NULL,
  `FromSite` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `CustomLinks` mediumtext,
  `Src` varchar(250) DEFAULT NULL,
  `IsImported` tinyint(1) DEFAULT '0',
  `SchoolID` varchar(250) DEFAULT NULL,
  `AgentID` varchar(250) DEFAULT NULL,
  `Pic1` varchar(250) DEFAULT NULL,
  `Pic2` varchar(250) DEFAULT NULL,
  `Pic3` varchar(250) DEFAULT NULL,
  `Agent_Name` varchar(250) DEFAULT NULL,
  `School_Name` varchar(250) DEFAULT NULL,
  `guest` varchar(20) DEFAULT NULL,
  `caseinfo` varchar(250) DEFAULT NULL,
  `USAER_SchoolID` varchar(250) DEFAULT NULL,
  `USAER_School_Name` varchar(250) DEFAULT NULL,
  `education` varchar(250) DEFAULT NULL,
  `MajorKeywords` varchar(250) DEFAULT NULL,
  `generalcode` text,
  `51offer_tag` varchar(250) DEFAULT NULL,
  `51offer_tag2` varchar(250) DEFAULT NULL,
  `51offer_tag3` varchar(250) DEFAULT NULL,
  `51offer_recommend` varchar(250) DEFAULT NULL,
  `Pic4` varchar(250) DEFAULT NULL,
  `sort` varchar(250) DEFAULT NULL,
  `pic5` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `invalid_date` varchar(250) DEFAULT NULL,
  `point_sort` varchar(250) DEFAULT NULL,
  `pic6` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM AUTO_INCREMENT=13800 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_11`
--

DROP TABLE IF EXISTS `cmsware_collection_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_11` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT '0',
  `State` int(2) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT '',
  `Src` varchar(250) DEFAULT '',
  `IsImported` tinyint(1) DEFAULT '0',
  `rank_year` varchar(250) DEFAULT NULL,
  `rank_type` varchar(250) DEFAULT NULL,
  `about_country` varchar(250) DEFAULT NULL,
  `about_SchoolID` varchar(250) DEFAULT NULL,
  `about_SchoolName` varchar(250) DEFAULT NULL,
  `about_School_E_Name` varchar(250) DEFAULT NULL,
  `rank_major_Name` varchar(250) DEFAULT NULL,
  `rank_major_E_Name` varchar(250) DEFAULT NULL,
  `rank` int(10) DEFAULT NULL,
  `Tuition` varchar(250) DEFAULT NULL,
  `Totalenrollment` varchar(250) DEFAULT NULL,
  `Acceptancerate` varchar(250) DEFAULT NULL,
  `6yeargraduationrate` varchar(250) DEFAULT NULL,
  `newuser_retention` varchar(250) DEFAULT NULL,
  `Score` varchar(250) DEFAULT NULL,
  `student_satisfaction` varchar(250) DEFAULT NULL,
  `research_quality` varchar(250) DEFAULT NULL,
  `entry_standards` varchar(250) DEFAULT NULL,
  `student_staff_ratio` varchar(250) DEFAULT NULL,
  `services_facilities` varchar(250) DEFAULT NULL,
  `completion` varchar(250) DEFAULT NULL,
  `good_honours` varchar(250) DEFAULT NULL,
  `graduate_prospects` varchar(250) DEFAULT NULL,
  `overall_score` varchar(250) DEFAULT NULL,
  `rank_major_Name_uk` varchar(250) DEFAULT NULL,
  `rank_major_E_Name_uk` varchar(250) DEFAULT NULL,
  `ucas_entry_points` varchar(250) DEFAULT NULL,
  `firsts` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM AUTO_INCREMENT=7949 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_12`
--

DROP TABLE IF EXISTS `cmsware_collection_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_12` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT '0',
  `State` int(2) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT '',
  `Src` varchar(250) DEFAULT '',
  `IsImported` tinyint(1) DEFAULT '0',
  `SchoolID` varchar(250) DEFAULT NULL,
  `Course_CName` varchar(250) DEFAULT NULL,
  `Course_EName` varchar(250) DEFAULT NULL,
  `Link_Grade` varchar(250) DEFAULT NULL,
  `Link_MajorIDs` mediumtext,
  `ProDire` varchar(250) DEFAULT NULL,
  `ProDire01` varchar(250) DEFAULT NULL,
  `ProDire02` varchar(250) DEFAULT NULL,
  `ProDire03` varchar(250) DEFAULT NULL,
  `ProDire04` varchar(250) DEFAULT NULL,
  `ProDire05` varchar(250) DEFAULT NULL,
  `ProDire06` varchar(250) DEFAULT NULL,
  `Edu_Level` int(10) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_2`
--

DROP TABLE IF EXISTS `cmsware_collection_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_2` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT NULL,
  `ModifiedDate` int(10) DEFAULT NULL,
  `ApprovedDate` int(10) DEFAULT NULL,
  `PublishDate` int(10) DEFAULT NULL,
  `State` int(2) DEFAULT NULL,
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `SoftSize` varchar(15) DEFAULT NULL,
  `Language` varchar(10) DEFAULT NULL,
  `SoftType` varchar(50) DEFAULT NULL,
  `Environment` varchar(50) DEFAULT NULL,
  `Star` int(2) DEFAULT '0',
  `Developer` varchar(250) DEFAULT NULL,
  `SoftKeywords` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `Download` mediumtext,
  `Photo` varchar(250) DEFAULT NULL,
  `LocalUpload` varchar(250) DEFAULT NULL,
  `CustomSoftLinks` mediumtext,
  `CustomLinks` mediumtext,
  `Src` varchar(250) DEFAULT NULL,
  `IsImported` tinyint(1) DEFAULT '0',
  `SchoolID` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_3`
--

DROP TABLE IF EXISTS `cmsware_collection_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_3` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT '0',
  `State` int(2) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `Src` varchar(250) DEFAULT NULL,
  `IsImported` tinyint(1) DEFAULT '0',
  `S_Name` varchar(250) DEFAULT NULL,
  `E_Name` varchar(250) DEFAULT NULL,
  `E_letter` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` longtext,
  `S_Url` varchar(250) DEFAULT NULL,
  `Telephone` mediumtext,
  `Address` varchar(250) DEFAULT NULL,
  `Post` varchar(250) DEFAULT NULL,
  `Times_Pm` varchar(250) DEFAULT NULL,
  `Wb_Pm` varchar(250) DEFAULT NULL,
  `Jrsb_Pm` varchar(250) DEFAULT NULL,
  `Uker_Pm` varchar(250) DEFAULT NULL,
  `Area` varchar(250) DEFAULT NULL,
  `City` text,
  `Life_Fear` varchar(250) DEFAULT NULL,
  `Jyl` varchar(250) DEFAULT NULL,
  `Hwxsbl` varchar(250) DEFAULT NULL,
  `Map` varchar(250) DEFAULT NULL,
  `Jyzx_Link` varchar(250) DEFAULT NULL,
  `AlumniURL` varchar(250) DEFAULT NULL,
  `Content` varchar(250) DEFAULT NULL,
  `ApplyFee` varchar(250) DEFAULT NULL,
  `TSRate` varchar(250) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  `Times_sort` varchar(250) DEFAULT NULL,
  `biz_agent` mediumtext,
  `AlumniCode` mediumtext,
  `BBSCode` mediumtext,
  `AgentID` varchar(250) DEFAULT NULL,
  `CourseType` varchar(250) DEFAULT NULL,
  `Comment_1` mediumtext,
  `Comment_2` mediumtext,
  `BBSCommURL` varchar(250) DEFAULT NULL,
  `Intro_s` mediumtext,
  `E_Name_s` varchar(250) DEFAULT NULL,
  `Times_Pm_2002` varchar(250) DEFAULT NULL,
  `Times_Pm_2003` varchar(250) DEFAULT NULL,
  `Times_Pm_2004` varchar(250) DEFAULT NULL,
  `Times_Pm_2005` varchar(250) DEFAULT NULL,
  `Times_Pm_2006` varchar(250) DEFAULT NULL,
  `Times_Pm_2007` varchar(250) DEFAULT NULL,
  `Times_Pm_2008` varchar(250) DEFAULT NULL,
  `Times_Pm_2009` varchar(250) DEFAULT NULL,
  `Times_Pm_2001` varchar(250) DEFAULT NULL,
  `Times_Pm_2000` varchar(250) DEFAULT NULL,
  `Times_Pm_2010` varchar(250) DEFAULT NULL,
  `Times_Pm_2011` varchar(250) DEFAULT NULL,
  `Times_Pm_2012` varchar(250) DEFAULT NULL,
  `coord_longitude` varchar(250) DEFAULT NULL,
  `coord_latitude` varchar(250) DEFAULT NULL,
  `QQgroup` varchar(250) DEFAULT NULL,
  `Tips` mediumtext,
  `Times_Pm_2013` varchar(250) DEFAULT NULL,
  `Times_Pm_2014` varchar(250) DEFAULT NULL,
  `Times_Pm_2015` varchar(250) DEFAULT NULL,
  `Intro_m` mediumtext,
  `country` varchar(250) DEFAULT NULL,
  `Edu_Level` varchar(250) DEFAULT NULL,
  `Nature` varchar(250) DEFAULT NULL,
  `IsPublic` varchar(250) DEFAULT NULL,
  `Lodge_Rules` text,
  `Scholarship` varchar(250) DEFAULT NULL,
  `Grade_Enter` varchar(250) DEFAULT NULL,
  `A_Ratio` varchar(20) DEFAULT NULL,
  `IsBoarder` varchar(250) DEFAULT NULL,
  `Students_Amount` varchar(250) DEFAULT NULL,
  `C_Students_Amount` varchar(250) DEFAULT NULL,
  `Chinese_A_Ratio` varchar(250) DEFAULT NULL,
  `Ib_Course` varchar(250) DEFAULT NULL,
  `Apply_Age_Begin` varchar(250) DEFAULT NULL,
  `Ielts_Score` varchar(250) DEFAULT NULL,
  `Toefl_Score` varchar(250) DEFAULT NULL,
  `Sat_Score` varchar(250) DEFAULT NULL,
  `Tuition` varchar(250) DEFAULT NULL,
  `Global_Pm` varchar(250) DEFAULT NULL,
  `Apply_Age_End` varchar(250) DEFAULT NULL,
  `Building_Time` text,
  `Intro_Location` mediumtext,
  `Intro_History` mediumtext,
  `Intro_Feature` mediumtext,
  `Intro_CollegeFeature` mediumtext,
  `Intro_Facility` mediumtext,
  `Intro_Accommodation` mediumtext,
  `mStar_5` text,
  `mstar_4` text,
  `mstar_3` text,
  `mStar_2` text,
  `mStar_1` text,
  `rec_reason` text,
  `food_info` text,
  `jyqj` text,
  `jxj_info` text,
  `famous_alumni` varchar(250) DEFAULT NULL,
  `checkCity` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `log2` varchar(250) DEFAULT NULL,
  `recommend_sort` varchar(250) DEFAULT NULL,
  `recommend_tag` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_4`
--

DROP TABLE IF EXISTS `cmsware_collection_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_4` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT '0',
  `State` int(2) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `Src` varchar(250) DEFAULT NULL,
  `IsImported` tinyint(1) DEFAULT '0',
  `Z_Name` varchar(250) DEFAULT NULL,
  `Z_E_Name` varchar(250) DEFAULT NULL,
  `SchoolID` int(10) DEFAULT NULL,
  `DegreeType` varchar(250) DEFAULT NULL,
  `DegreeType01` varchar(250) DEFAULT NULL,
  `DegreeType02` varchar(250) DEFAULT NULL,
  `DegreeType03` varchar(250) DEFAULT NULL,
  `DegreeType04` varchar(250) DEFAULT NULL,
  `ProDire` varchar(36) DEFAULT NULL,
  `ProDire01` varchar(36) DEFAULT NULL,
  `ProDire02` varchar(36) DEFAULT NULL,
  `ProDire03` varchar(36) DEFAULT NULL,
  `ProDire04` varchar(36) DEFAULT NULL,
  `MajorFW` varchar(1) DEFAULT NULL,
  `MajorUrl` varchar(250) DEFAULT NULL,
  `DegreeType05` varchar(250) DEFAULT NULL,
  `DegreeType06` varchar(250) DEFAULT NULL,
  `Z_E_Name_s` varchar(250) DEFAULT NULL,
  `ProDire05` varchar(36) DEFAULT NULL,
  `ProDire06` varchar(36) DEFAULT NULL,
  `Editor` varchar(250) DEFAULT NULL,
  `Edu_Level` int(10) DEFAULT NULL,
  `Data_Direction` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `链接专业ids` mediumtext,
  `open_time` varchar(250) DEFAULT NULL,
  `close_time` varchar(250) DEFAULT NULL,
  `run_time` varchar(250) DEFAULT NULL,
  `require_score` varchar(250) DEFAULT NULL,
  `require_listen` varchar(250) DEFAULT NULL,
  `require_speak` varchar(250) DEFAULT NULL,
  `require_read` varchar(250) DEFAULT NULL,
  `require_write` varchar(250) DEFAULT NULL,
  `cost` varchar(250) DEFAULT NULL,
  `mark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM AUTO_INCREMENT=28419 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_5`
--

DROP TABLE IF EXISTS `cmsware_collection_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_5` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT '0',
  `State` int(2) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `Src` varchar(250) DEFAULT NULL,
  `IsImported` tinyint(1) DEFAULT '0',
  `CompanyName` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `Area` varchar(250) DEFAULT NULL,
  `Country` varchar(250) DEFAULT NULL,
  `Province` varchar(250) DEFAULT NULL,
  `City` varchar(250) DEFAULT NULL,
  `Auth` varchar(250) DEFAULT NULL,
  `Telephone` varchar(250) DEFAULT NULL,
  `Fax` varchar(250) DEFAULT NULL,
  `E-mail` varchar(250) DEFAULT NULL,
  `SiteURL` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Postcode` varchar(250) DEFAULT NULL,
  `Feature` mediumtext,
  `Map` varchar(250) DEFAULT NULL,
  `Schools` mediumtext,
  `UkerAward` varchar(250) DEFAULT NULL,
  `TrustPoint` varchar(250) DEFAULT NULL,
  `ApplyNum` varchar(250) DEFAULT NULL,
  `VisaNum` varchar(250) DEFAULT NULL,
  `parent_id` varchar(250) DEFAULT NULL,
  `QQ` varchar(250) DEFAULT NULL,
  `MemberSince` varchar(250) DEFAULT NULL,
  `TopSchools` varchar(250) DEFAULT NULL,
  `Contact` varchar(250) DEFAULT NULL,
  `TrustPoint_plus` varchar(250) DEFAULT NULL,
  `BlogURL` varchar(250) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  `blogcode` mediumtext,
  `MSN` varchar(250) DEFAULT NULL,
  `UkerCeitified` varchar(1) DEFAULT NULL,
  `AvgRanking` varchar(250) DEFAULT NULL,
  `pic1` varchar(250) DEFAULT NULL,
  `pic2` varchar(250) DEFAULT NULL,
  `pic3` varchar(250) DEFAULT NULL,
  `Avatar` varchar(250) DEFAULT NULL,
  `Gender` varchar(250) DEFAULT NULL,
  `Position` varchar(250) DEFAULT NULL,
  `Department` varchar(250) DEFAULT NULL,
  `College` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_6`
--

DROP TABLE IF EXISTS `cmsware_collection_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_6` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT '0',
  `State` int(2) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `Src` varchar(250) DEFAULT NULL,
  `IsImported` tinyint(1) DEFAULT '0',
  `UserID` int(10) DEFAULT NULL,
  `score_TOEFL` varchar(250) DEFAULT NULL,
  `score_IELTS` varchar(250) DEFAULT NULL,
  `score_GMAT` varchar(250) DEFAULT NULL,
  `GotOffer` varchar(250) DEFAULT NULL,
  `ApplySchool_id` int(10) DEFAULT NULL,
  `ApplySchool_Name` varchar(250) DEFAULT NULL,
  `UserFullname` varchar(250) DEFAULT NULL,
  `gra_SchoolName` varchar(250) DEFAULT NULL,
  `gra_Specialty` varchar(250) DEFAULT NULL,
  `gra_Degree` varchar(250) DEFAULT NULL,
  `gra_AvgScore` varchar(250) DEFAULT NULL,
  `gra_Time` varchar(250) DEFAULT NULL,
  `UserGender` varchar(250) DEFAULT NULL,
  `UserAge` varchar(250) DEFAULT NULL,
  `UserProvince` varchar(250) DEFAULT NULL,
  `UserCity` varchar(250) DEFAULT NULL,
  `UserTel` varchar(250) DEFAULT NULL,
  `UserEmail` varchar(250) DEFAULT NULL,
  `ApplySchool_Specialty` varchar(250) DEFAULT NULL,
  `Apply_Degree` varchar(250) DEFAULT NULL,
  `ApplySchool_Spec` varchar(250) DEFAULT NULL,
  `UserQQ` varchar(250) DEFAULT NULL,
  `UserMSN` varchar(250) DEFAULT NULL,
  `matriculate_year` varchar(250) DEFAULT NULL,
  `matriculate_season` varchar(250) DEFAULT NULL,
  `other_school` mediumtext,
  `Calltime` varchar(250) DEFAULT NULL,
  `through` varchar(250) DEFAULT NULL,
  `channel` varchar(250) DEFAULT NULL,
  `Apply_country` varchar(250) DEFAULT NULL,
  `parentFullname` varchar(250) DEFAULT NULL,
  `gra_Time_month` varchar(250) DEFAULT NULL,
  `businesschannel` varchar(250) DEFAULT NULL,
  `Apply_country_bx` varchar(250) DEFAULT NULL,
  `other_rejection` mediumtext,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_7`
--

DROP TABLE IF EXISTS `cmsware_collection_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_7` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT '0',
  `State` int(2) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `Src` varchar(250) DEFAULT NULL,
  `IsImported` tinyint(1) DEFAULT '0',
  `SchoolID` mediumtext,
  `AgentID` varchar(250) DEFAULT NULL,
  `AgentCountry` varchar(250) DEFAULT NULL,
  `AgentProvince` varchar(250) DEFAULT NULL,
  `AgentCity` varchar(250) DEFAULT NULL,
  `AgentName` varchar(250) DEFAULT NULL,
  `FullName` varchar(250) DEFAULT NULL,
  `Gender` varchar(250) DEFAULT NULL,
  `Age` varchar(250) DEFAULT NULL,
  `Tel` varchar(250) DEFAULT NULL,
  `E-mail` varchar(250) DEFAULT NULL,
  `Province` varchar(250) DEFAULT NULL,
  `City` varchar(250) DEFAULT NULL,
  `IELTS` varchar(250) DEFAULT NULL,
  `GSchool` varchar(250) DEFAULT NULL,
  `GSpecialty` varchar(250) DEFAULT NULL,
  `AvgScore` varchar(250) DEFAULT NULL,
  `OfferSpecialtyID` varchar(250) DEFAULT NULL,
  `OfferSpecialtyType` varchar(250) DEFAULT NULL,
  `OfferDegree` varchar(250) DEFAULT NULL,
  `OfferTime` varchar(250) DEFAULT NULL,
  `OfferDoc` varchar(250) DEFAULT NULL,
  `through` varchar(250) DEFAULT NULL,
  `VisaExpire` varchar(250) DEFAULT NULL,
  `VisaType` varchar(250) DEFAULT NULL,
  `SchoolName` varchar(250) DEFAULT NULL,
  `UserID` varchar(10) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `msn` varchar(250) DEFAULT NULL,
  `yahoo` varchar(250) DEFAULT NULL,
  `OfferNo` varchar(250) DEFAULT NULL,
  `LeavingTime` varchar(250) DEFAULT NULL,
  `LeavingProvince` varchar(250) DEFAULT NULL,
  `LeavingCity` varchar(250) DEFAULT NULL,
  `Privacy` mediumtext,
  `Birthday` varchar(250) DEFAULT NULL,
  `Matriculate` varchar(250) DEFAULT NULL,
  `QQ` varchar(250) DEFAULT NULL,
  `add` varchar(250) DEFAULT NULL,
  `otheroffer` text,
  `otherrejection` text,
  `visainfo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_8`
--

DROP TABLE IF EXISTS `cmsware_collection_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_8` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT '0',
  `State` int(2) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT '',
  `Src` varchar(250) DEFAULT '',
  `IsImported` tinyint(1) DEFAULT '0',
  `AgentID` varchar(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Intro` text,
  `Personal` mediumtext,
  `Fullname` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_9`
--

DROP TABLE IF EXISTS `cmsware_collection_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_9` (
  `CollectionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT '0',
  `state` varchar(250) DEFAULT NULL,
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT '',
  `Src` varchar(250) DEFAULT '',
  `IsImported` tinyint(1) DEFAULT '0',
  `S_Name` varchar(250) DEFAULT NULL,
  `E_Name` varchar(250) DEFAULT NULL,
  `E_Name_s` varchar(250) DEFAULT NULL,
  `E_Name_standard` varchar(250) DEFAULT NULL,
  `E_letter` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` longtext,
  `Intro_s` text,
  `Tips` mediumtext,
  `QQgroup` varchar(250) DEFAULT NULL,
  `foundtime` int(10) DEFAULT NULL,
  `nature` text,
  `type` text,
  `students` varchar(250) DEFAULT NULL,
  `undergraduate_studen` varchar(250) DEFAULT NULL,
  `international_studen` varchar(250) DEFAULT NULL,
  `admission_rate` varchar(250) DEFAULT NULL,
  `tuition` int(10) DEFAULT NULL,
  `Life_Fear` varchar(250) DEFAULT NULL,
  `scholarship` varchar(250) DEFAULT NULL,
  `toefl` int(10) DEFAULT NULL,
  `sat` varchar(250) DEFAULT NULL,
  `state_s` varchar(250) DEFAULT NULL,
  `City` text,
  `Map` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Post` varchar(250) DEFAULT NULL,
  `Telephone` text,
  `S_Url` varchar(250) DEFAULT NULL,
  `coord_longitude` varchar(250) DEFAULT NULL,
  `coord_latitude` varchar(250) DEFAULT NULL,
  `USnews_Pm` int(10) DEFAULT NULL,
  `USnews_Pm_2015` int(10) DEFAULT NULL,
  `USnews_Pm_2014` int(10) DEFAULT NULL,
  `USnews_Pm_2013` int(10) DEFAULT NULL,
  `USnews_Pm_2012` int(10) DEFAULT NULL,
  `USnews_Pm_2011` int(10) DEFAULT NULL,
  `ARWU_Pm_2014` int(10) DEFAULT NULL,
  `ARWU_Pm_2013` int(10) DEFAULT NULL,
  `ARWU_Pm_2012` int(10) DEFAULT NULL,
  `ARWU_Pm_2011` int(10) DEFAULT NULL,
  `ARWU_Pm_2010` int(10) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`,`CateID`),
  UNIQUE KEY `CollectionID` (`CollectionID`),
  KEY `C_I` (`CateID`,`IsImported`),
  KEY `Src` (`Src`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_category`
--

DROP TABLE IF EXISTS `cmsware_collection_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_category` (
  `CateID` int(10) NOT NULL AUTO_INCREMENT,
  `TableID` int(8) DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `ParentID` int(8) DEFAULT '0',
  `Disabled` tinyint(1) DEFAULT '0',
  `NodeID` int(8) DEFAULT NULL,
  `SubNodeID` varchar(250) DEFAULT '0',
  `IndexNodeID` varchar(250) DEFAULT NULL,
  `TargetURL` text,
  `TargetURLArea` text,
  `UrlFilterRule` text,
  `RepeatCollection` tinyint(1) DEFAULT '0',
  `HiddenImported` tinyint(1) DEFAULT '1',
  `AutoImport` tinyint(1) DEFAULT '0',
  `UrlPageRule` text,
  `DelAfterImport` tinyint(1) DEFAULT '0',
  `InRunPlan` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`CateID`),
  KEY `C_D` (`CateID`,`Disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_collection_rules`
--

DROP TABLE IF EXISTS `cmsware_collection_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_collection_rules` (
  `RuleID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(10) NOT NULL DEFAULT '0',
  `ContentFieldID` int(8) DEFAULT '0',
  `TableID` int(8) DEFAULT '0',
  `Rule` text,
  PRIMARY KEY (`RuleID`,`CateID`),
  UNIQUE KEY `RuleID` (`RuleID`)
) ENGINE=MyISAM AUTO_INCREMENT=4880 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_1`
--

DROP TABLE IF EXISTS `cmsware_content_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_1` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(250) DEFAULT NULL,
  `TitleColor` varchar(7) DEFAULT NULL,
  `Author` varchar(20) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Photo` varchar(250) DEFAULT NULL,
  `SubTitle` varchar(250) DEFAULT NULL,
  `Content` longtext,
  `Keywords` varchar(250) DEFAULT NULL,
  `FromSite` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `CustomLinks` mediumtext,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(8) DEFAULT '0',
  `SchoolID` varchar(250) DEFAULT NULL,
  `AgentID` varchar(250) DEFAULT NULL,
  `Pic1` varchar(250) DEFAULT NULL,
  `Pic2` varchar(250) DEFAULT NULL,
  `Pic3` varchar(250) DEFAULT NULL,
  `Agent_Name` varchar(250) DEFAULT NULL,
  `School_Name` varchar(250) DEFAULT NULL,
  `guest` varchar(20) DEFAULT NULL,
  `caseinfo` varchar(250) DEFAULT NULL,
  `USAER_SchoolID` varchar(250) DEFAULT NULL,
  `USAER_School_Name` varchar(250) DEFAULT NULL,
  `education` varchar(250) DEFAULT NULL,
  `MajorKeywords` varchar(250) DEFAULT NULL,
  `generalcode` text,
  `51offer_tag` varchar(250) DEFAULT NULL,
  `51offer_tag2` varchar(250) DEFAULT NULL,
  `51offer_tag3` varchar(250) DEFAULT NULL,
  `51offer_recommend` varchar(250) DEFAULT NULL,
  `Pic4` varchar(250) DEFAULT NULL,
  `sort` varchar(250) DEFAULT NULL,
  `pic5` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `invalid_date` varchar(250) DEFAULT NULL,
  `point_sort` varchar(250) DEFAULT NULL,
  `pic6` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=143731 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_11`
--

DROP TABLE IF EXISTS `cmsware_content_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_11` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `rank_year` varchar(250) DEFAULT NULL,
  `rank_type` varchar(250) DEFAULT NULL,
  `about_country` varchar(250) DEFAULT NULL,
  `about_SchoolID` varchar(250) DEFAULT NULL,
  `about_SchoolName` varchar(250) DEFAULT NULL,
  `about_School_E_Name` varchar(250) DEFAULT NULL,
  `rank_major_Name` varchar(250) DEFAULT NULL,
  `rank_major_E_Name` varchar(250) DEFAULT NULL,
  `rank` int(10) DEFAULT NULL,
  `Tuition` varchar(250) DEFAULT NULL,
  `Totalenrollment` varchar(250) DEFAULT NULL,
  `Acceptancerate` varchar(250) DEFAULT NULL,
  `6yeargraduationrate` varchar(250) DEFAULT NULL,
  `newuser_retention` varchar(250) DEFAULT NULL,
  `Score` varchar(250) DEFAULT NULL,
  `student_satisfaction` varchar(250) DEFAULT NULL,
  `research_quality` varchar(250) DEFAULT NULL,
  `entry_standards` varchar(250) DEFAULT NULL,
  `student_staff_ratio` varchar(250) DEFAULT NULL,
  `services_facilities` varchar(250) DEFAULT NULL,
  `completion` varchar(250) DEFAULT NULL,
  `good_honours` varchar(250) DEFAULT NULL,
  `graduate_prospects` varchar(250) DEFAULT NULL,
  `overall_score` varchar(250) DEFAULT NULL,
  `rank_major_Name_uk` varchar(250) DEFAULT NULL,
  `rank_major_E_Name_uk` varchar(250) DEFAULT NULL,
  `ucas_entry_points` varchar(250) DEFAULT NULL,
  `firsts` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=14860 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_12`
--

DROP TABLE IF EXISTS `cmsware_content_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_12` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `SchoolID` varchar(250) DEFAULT NULL,
  `Course_CName` varchar(250) DEFAULT NULL,
  `Course_EName` varchar(250) DEFAULT NULL,
  `Link_Grade` varchar(250) DEFAULT NULL,
  `Link_MajorIDs` mediumtext,
  `ProDire` varchar(250) DEFAULT NULL,
  `ProDire01` varchar(250) DEFAULT NULL,
  `ProDire02` varchar(250) DEFAULT NULL,
  `ProDire03` varchar(250) DEFAULT NULL,
  `ProDire04` varchar(250) DEFAULT NULL,
  `ProDire05` varchar(250) DEFAULT NULL,
  `ProDire06` varchar(250) DEFAULT NULL,
  `Edu_Level` int(10) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=11658 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_2`
--

DROP TABLE IF EXISTS `cmsware_content_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_2` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `Title` varchar(250) DEFAULT NULL,
  `SoftSize` varchar(15) DEFAULT NULL,
  `Language` varchar(10) DEFAULT NULL,
  `SoftType` varchar(50) DEFAULT NULL,
  `Environment` varchar(50) DEFAULT NULL,
  `Star` int(2) DEFAULT '0',
  `Developer` varchar(250) DEFAULT NULL,
  `SoftKeywords` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `Download` mediumtext,
  `Photo` varchar(250) DEFAULT NULL,
  `LocalUpload` varchar(250) DEFAULT NULL,
  `CustomSoftLinks` mediumtext,
  `CustomLinks` mediumtext,
  `SchoolID` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_3`
--

DROP TABLE IF EXISTS `cmsware_content_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_3` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `S_Name` varchar(250) DEFAULT NULL,
  `E_Name` varchar(250) DEFAULT NULL,
  `E_letter` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` longtext,
  `S_Url` varchar(250) DEFAULT NULL,
  `Telephone` mediumtext,
  `Address` varchar(250) DEFAULT NULL,
  `Post` varchar(250) DEFAULT NULL,
  `Times_Pm` varchar(250) DEFAULT NULL,
  `Wb_Pm` varchar(250) DEFAULT NULL,
  `Jrsb_Pm` varchar(250) DEFAULT NULL,
  `Uker_Pm` varchar(250) DEFAULT NULL,
  `Area` varchar(250) DEFAULT NULL,
  `City` text,
  `Life_Fear` varchar(250) DEFAULT NULL,
  `Jyl` varchar(250) DEFAULT NULL,
  `Hwxsbl` varchar(250) DEFAULT NULL,
  `Map` varchar(250) DEFAULT NULL,
  `Jyzx_Link` varchar(250) DEFAULT NULL,
  `AlumniURL` varchar(250) DEFAULT NULL,
  `Content` varchar(250) DEFAULT NULL,
  `ApplyFee` varchar(250) DEFAULT NULL,
  `TSRate` varchar(250) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  `Times_sort` varchar(250) DEFAULT NULL,
  `biz_agent` mediumtext,
  `AlumniCode` mediumtext,
  `BBSCode` mediumtext,
  `AgentID` varchar(250) DEFAULT NULL,
  `CourseType` varchar(250) DEFAULT NULL,
  `Comment_1` mediumtext,
  `Comment_2` mediumtext,
  `BBSCommURL` varchar(250) DEFAULT NULL,
  `Intro_s` mediumtext,
  `E_Name_s` varchar(250) DEFAULT NULL,
  `Times_Pm_2002` varchar(250) DEFAULT NULL,
  `Times_Pm_2003` varchar(250) DEFAULT NULL,
  `Times_Pm_2004` varchar(250) DEFAULT NULL,
  `Times_Pm_2005` varchar(250) DEFAULT NULL,
  `Times_Pm_2006` varchar(250) DEFAULT NULL,
  `Times_Pm_2007` varchar(250) DEFAULT NULL,
  `Times_Pm_2008` varchar(250) DEFAULT NULL,
  `Times_Pm_2009` varchar(250) DEFAULT NULL,
  `Times_Pm_2001` varchar(250) DEFAULT NULL,
  `Times_Pm_2000` varchar(250) DEFAULT NULL,
  `Times_Pm_2010` varchar(250) DEFAULT NULL,
  `Times_Pm_2011` varchar(250) DEFAULT NULL,
  `Times_Pm_2012` varchar(250) DEFAULT NULL,
  `coord_longitude` varchar(250) DEFAULT NULL,
  `coord_latitude` varchar(250) DEFAULT NULL,
  `QQgroup` varchar(250) DEFAULT NULL,
  `Tips` mediumtext,
  `Times_Pm_2013` varchar(250) DEFAULT NULL,
  `Times_Pm_2014` varchar(250) DEFAULT NULL,
  `Times_Pm_2015` varchar(250) DEFAULT NULL,
  `Intro_m` mediumtext,
  `country` varchar(250) DEFAULT NULL,
  `Edu_Level` varchar(250) DEFAULT NULL,
  `Nature` varchar(250) DEFAULT NULL,
  `IsPublic` varchar(250) DEFAULT NULL,
  `Lodge_Rules` text,
  `Scholarship` varchar(250) DEFAULT NULL,
  `Grade_Enter` varchar(250) DEFAULT NULL,
  `A_Ratio` varchar(20) DEFAULT NULL,
  `IsBoarder` varchar(250) DEFAULT NULL,
  `Students_Amount` varchar(250) DEFAULT NULL,
  `C_Students_Amount` varchar(250) DEFAULT NULL,
  `Chinese_A_Ratio` varchar(250) DEFAULT NULL,
  `Ib_Course` varchar(250) DEFAULT NULL,
  `Apply_Age_Begin` varchar(250) DEFAULT NULL,
  `Ielts_Score` varchar(250) DEFAULT NULL,
  `Toefl_Score` varchar(250) DEFAULT NULL,
  `Sat_Score` varchar(250) DEFAULT NULL,
  `Tuition` varchar(250) DEFAULT NULL,
  `Global_Pm` varchar(250) DEFAULT NULL,
  `Apply_Age_End` varchar(250) DEFAULT NULL,
  `Building_Time` text,
  `Intro_Location` mediumtext,
  `Intro_History` mediumtext,
  `Intro_Feature` mediumtext,
  `Intro_CollegeFeature` mediumtext,
  `Intro_Facility` mediumtext,
  `Intro_Accommodation` mediumtext,
  `mStar_5` text,
  `mstar_4` text,
  `mstar_3` text,
  `mStar_2` text,
  `mStar_1` text,
  `rec_reason` text,
  `food_info` text,
  `jyqj` text,
  `jxj_info` text,
  `famous_alumni` varchar(250) DEFAULT NULL,
  `checkCity` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `log2` varchar(250) DEFAULT NULL,
  `recommend_sort` varchar(250) DEFAULT NULL,
  `recommend_tag` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=1464 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_4`
--

DROP TABLE IF EXISTS `cmsware_content_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_4` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `Z_Name` varchar(250) DEFAULT NULL,
  `Z_E_Name` varchar(250) DEFAULT NULL,
  `SchoolID` int(10) DEFAULT NULL,
  `DegreeType` varchar(250) DEFAULT NULL,
  `DegreeType01` varchar(250) DEFAULT NULL,
  `DegreeType02` varchar(250) DEFAULT NULL,
  `DegreeType03` varchar(250) DEFAULT NULL,
  `DegreeType04` varchar(250) DEFAULT NULL,
  `ProDire` varchar(36) DEFAULT NULL,
  `ProDire01` varchar(36) DEFAULT NULL,
  `ProDire02` varchar(36) DEFAULT NULL,
  `ProDire03` varchar(36) DEFAULT NULL,
  `ProDire04` varchar(36) DEFAULT NULL,
  `MajorFW` varchar(1) DEFAULT NULL,
  `MajorUrl` varchar(250) DEFAULT NULL,
  `DegreeType05` varchar(250) DEFAULT NULL,
  `DegreeType06` varchar(250) DEFAULT NULL,
  `Z_E_Name_s` varchar(250) DEFAULT NULL,
  `ProDire05` varchar(36) DEFAULT NULL,
  `ProDire06` varchar(36) DEFAULT NULL,
  `Editor` varchar(250) DEFAULT NULL,
  `Edu_Level` int(10) DEFAULT NULL,
  `Data_Direction` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `链接专业ids` mediumtext,
  `open_time` varchar(250) DEFAULT NULL,
  `close_time` varchar(250) DEFAULT NULL,
  `run_time` varchar(250) DEFAULT NULL,
  `require_score` varchar(250) DEFAULT NULL,
  `require_listen` varchar(250) DEFAULT NULL,
  `require_speak` varchar(250) DEFAULT NULL,
  `require_read` varchar(250) DEFAULT NULL,
  `require_write` varchar(250) DEFAULT NULL,
  `cost` varchar(250) DEFAULT NULL,
  `mark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=75529 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_5`
--

DROP TABLE IF EXISTS `cmsware_content_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_5` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `CompanyName` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `Area` varchar(250) DEFAULT NULL,
  `Country` varchar(250) DEFAULT NULL,
  `Province` varchar(250) DEFAULT NULL,
  `City` varchar(250) DEFAULT NULL,
  `Auth` varchar(250) DEFAULT NULL,
  `Telephone` varchar(250) DEFAULT NULL,
  `Fax` varchar(250) DEFAULT NULL,
  `E-mail` varchar(250) DEFAULT NULL,
  `SiteURL` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Postcode` varchar(250) DEFAULT NULL,
  `Feature` mediumtext,
  `Map` varchar(250) DEFAULT NULL,
  `Schools` mediumtext,
  `UkerAward` varchar(250) DEFAULT NULL,
  `TrustPoint` varchar(250) DEFAULT NULL,
  `ApplyNum` varchar(250) DEFAULT NULL,
  `VisaNum` varchar(250) DEFAULT NULL,
  `parent_id` varchar(250) DEFAULT NULL,
  `QQ` varchar(250) DEFAULT NULL,
  `MemberSince` varchar(250) DEFAULT NULL,
  `TopSchools` varchar(250) DEFAULT NULL,
  `Contact` varchar(250) DEFAULT NULL,
  `TrustPoint_plus` varchar(250) DEFAULT NULL,
  `BlogURL` varchar(250) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  `blogcode` mediumtext,
  `MSN` varchar(250) DEFAULT NULL,
  `UkerCeitified` varchar(1) DEFAULT NULL,
  `AvgRanking` varchar(250) DEFAULT NULL,
  `pic1` varchar(250) DEFAULT NULL,
  `pic2` varchar(250) DEFAULT NULL,
  `pic3` varchar(250) DEFAULT NULL,
  `Avatar` varchar(250) DEFAULT NULL,
  `Gender` varchar(250) DEFAULT NULL,
  `Position` varchar(250) DEFAULT NULL,
  `Department` varchar(250) DEFAULT NULL,
  `College` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_6`
--

DROP TABLE IF EXISTS `cmsware_content_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_6` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `UserID` int(10) DEFAULT NULL,
  `score_TOEFL` varchar(250) DEFAULT NULL,
  `score_IELTS` varchar(250) DEFAULT NULL,
  `score_GMAT` varchar(250) DEFAULT NULL,
  `GotOffer` varchar(250) DEFAULT NULL,
  `ApplySchool_id` int(10) DEFAULT NULL,
  `ApplySchool_Name` varchar(250) DEFAULT NULL,
  `UserFullname` varchar(250) DEFAULT NULL,
  `gra_SchoolName` varchar(250) DEFAULT NULL,
  `gra_Specialty` varchar(250) DEFAULT NULL,
  `gra_Degree` varchar(250) DEFAULT NULL,
  `gra_AvgScore` varchar(250) DEFAULT NULL,
  `gra_Time` varchar(250) DEFAULT NULL,
  `UserGender` varchar(250) DEFAULT NULL,
  `UserAge` varchar(250) DEFAULT NULL,
  `UserProvince` varchar(250) DEFAULT NULL,
  `UserCity` varchar(250) DEFAULT NULL,
  `UserTel` varchar(250) DEFAULT NULL,
  `UserEmail` varchar(250) DEFAULT NULL,
  `ApplySchool_Specialty` varchar(250) DEFAULT NULL,
  `Apply_Degree` varchar(250) DEFAULT NULL,
  `ApplySchool_Spec` varchar(250) DEFAULT NULL,
  `UserQQ` varchar(250) DEFAULT NULL,
  `UserMSN` varchar(250) DEFAULT NULL,
  `matriculate_year` varchar(250) DEFAULT NULL,
  `matriculate_season` varchar(250) DEFAULT NULL,
  `other_school` mediumtext,
  `Calltime` varchar(250) DEFAULT NULL,
  `through` varchar(250) DEFAULT NULL,
  `channel` varchar(250) DEFAULT NULL,
  `Apply_country` varchar(250) DEFAULT NULL,
  `parentFullname` varchar(250) DEFAULT NULL,
  `gra_Time_month` varchar(250) DEFAULT NULL,
  `businesschannel` varchar(250) DEFAULT NULL,
  `Apply_country_bx` varchar(250) DEFAULT NULL,
  `other_rejection` mediumtext,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=94978 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_7`
--

DROP TABLE IF EXISTS `cmsware_content_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_7` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `SchoolID` mediumtext,
  `AgentID` varchar(250) DEFAULT NULL,
  `AgentCountry` varchar(250) DEFAULT NULL,
  `AgentProvince` varchar(250) DEFAULT NULL,
  `AgentCity` varchar(250) DEFAULT NULL,
  `AgentName` varchar(250) DEFAULT NULL,
  `FullName` varchar(250) DEFAULT NULL,
  `Gender` varchar(250) DEFAULT NULL,
  `Age` varchar(250) DEFAULT NULL,
  `Tel` varchar(250) DEFAULT NULL,
  `E-mail` varchar(250) DEFAULT NULL,
  `Province` varchar(250) DEFAULT NULL,
  `City` varchar(250) DEFAULT NULL,
  `IELTS` varchar(250) DEFAULT NULL,
  `GSchool` varchar(250) DEFAULT NULL,
  `GSpecialty` varchar(250) DEFAULT NULL,
  `AvgScore` varchar(250) DEFAULT NULL,
  `OfferSpecialtyID` varchar(250) DEFAULT NULL,
  `OfferSpecialtyType` varchar(250) DEFAULT NULL,
  `OfferDegree` varchar(250) DEFAULT NULL,
  `OfferTime` varchar(250) DEFAULT NULL,
  `OfferDoc` varchar(250) DEFAULT NULL,
  `through` varchar(250) DEFAULT NULL,
  `VisaExpire` varchar(250) DEFAULT NULL,
  `VisaType` varchar(250) DEFAULT NULL,
  `SchoolName` varchar(250) DEFAULT NULL,
  `UserID` varchar(10) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `msn` varchar(250) DEFAULT NULL,
  `yahoo` varchar(250) DEFAULT NULL,
  `OfferNo` varchar(250) DEFAULT NULL,
  `LeavingTime` varchar(250) DEFAULT NULL,
  `LeavingProvince` varchar(250) DEFAULT NULL,
  `LeavingCity` varchar(250) DEFAULT NULL,
  `Privacy` mediumtext,
  `Birthday` varchar(250) DEFAULT NULL,
  `Matriculate` varchar(250) DEFAULT NULL,
  `QQ` varchar(250) DEFAULT NULL,
  `add` varchar(250) DEFAULT NULL,
  `otheroffer` text,
  `otherrejection` text,
  `visainfo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=9807 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_8`
--

DROP TABLE IF EXISTS `cmsware_content_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_8` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `AgentID` varchar(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Intro` text,
  `Personal` mediumtext,
  `Fullname` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_9`
--

DROP TABLE IF EXISTS `cmsware_content_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_9` (
  `ContentID` int(10) NOT NULL AUTO_INCREMENT,
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT '0',
  `LastModifiedUserID` int(8) DEFAULT '0',
  `ContributionUserID` int(8) DEFAULT '0',
  `ContributionID` int(10) DEFAULT '0',
  `S_Name` varchar(250) DEFAULT NULL,
  `E_Name` varchar(250) DEFAULT NULL,
  `E_Name_s` varchar(250) DEFAULT NULL,
  `E_Name_standard` varchar(250) DEFAULT NULL,
  `E_letter` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` longtext,
  `Intro_s` text,
  `Tips` mediumtext,
  `QQgroup` varchar(250) DEFAULT NULL,
  `foundtime` int(10) DEFAULT NULL,
  `nature` text,
  `type` text,
  `students` varchar(250) DEFAULT NULL,
  `undergraduate_studen` varchar(250) DEFAULT NULL,
  `international_studen` varchar(250) DEFAULT NULL,
  `admission_rate` varchar(250) DEFAULT NULL,
  `tuition` int(10) DEFAULT NULL,
  `Life_Fear` varchar(250) DEFAULT NULL,
  `scholarship` varchar(250) DEFAULT NULL,
  `toefl` int(10) DEFAULT NULL,
  `sat` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  `state_s` varchar(250) DEFAULT NULL,
  `City` text,
  `Map` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Post` varchar(250) DEFAULT NULL,
  `Telephone` text,
  `S_Url` varchar(250) DEFAULT NULL,
  `coord_longitude` varchar(250) DEFAULT NULL,
  `coord_latitude` varchar(250) DEFAULT NULL,
  `USnews_Pm` int(10) DEFAULT NULL,
  `USnews_Pm_2015` int(10) DEFAULT NULL,
  `USnews_Pm_2014` int(10) DEFAULT NULL,
  `USnews_Pm_2013` int(10) DEFAULT NULL,
  `USnews_Pm_2012` int(10) DEFAULT NULL,
  `USnews_Pm_2011` int(10) DEFAULT NULL,
  `ARWU_Pm_2014` int(10) DEFAULT NULL,
  `ARWU_Pm_2013` int(10) DEFAULT NULL,
  `ARWU_Pm_2012` int(10) DEFAULT NULL,
  `ARWU_Pm_2011` int(10) DEFAULT NULL,
  `ARWU_Pm_2010` int(10) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContentID`)
) ENGINE=MyISAM AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_fields`
--

DROP TABLE IF EXISTS `cmsware_content_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_fields` (
  `ContentFieldID` int(8) NOT NULL AUTO_INCREMENT,
  `TableID` int(8) NOT NULL DEFAULT '0',
  `FieldTitle` varchar(100) DEFAULT NULL,
  `FieldName` varchar(20) DEFAULT NULL,
  `FieldType` varchar(20) DEFAULT NULL,
  `FieldSize` varchar(20) DEFAULT NULL,
  `FieldInput` varchar(20) DEFAULT NULL,
  `FieldDefaultValue` varchar(250) DEFAULT NULL,
  `FieldInputFilter` varchar(20) DEFAULT NULL,
  `FieldInputPicker` varchar(20) DEFAULT NULL,
  `FieldInputTpl` varchar(250) DEFAULT NULL,
  `FieldDescription` mediumtext,
  `FieldOrder` mediumint(8) DEFAULT '0',
  `FieldListDisplay` tinyint(1) DEFAULT '0',
  `IsMainField` tinyint(1) DEFAULT '0',
  `IsTitleField` tinyint(1) DEFAULT '0',
  `FieldSearchable` tinyint(1) DEFAULT '0',
  `EnableContribution` tinyint(1) DEFAULT '1',
  `EnableCollection` tinyint(1) DEFAULT '1',
  `EnablePublish` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ContentFieldID`,`TableID`),
  UNIQUE KEY `ContentFiledID` (`ContentFieldID`),
  KEY `T_F` (`TableID`,`FieldListDisplay`)
) ENGINE=MyISAM AUTO_INCREMENT=644 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_index`
--

DROP TABLE IF EXISTS `cmsware_content_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_index` (
  `IndexID` int(10) NOT NULL AUTO_INCREMENT,
  `ContentID` int(10) NOT NULL DEFAULT '0',
  `NodeID` int(10) NOT NULL DEFAULT '0',
  `TableID` int(10) DEFAULT NULL,
  `ParentIndexID` int(8) DEFAULT '0',
  `Type` tinyint(1) DEFAULT '1',
  `PublishDate` int(10) DEFAULT '0',
  `SelfTemplate` varchar(250) DEFAULT NULL,
  `SelfPSN` varchar(250) DEFAULT NULL,
  `SelfPublishFileName` varchar(250) DEFAULT NULL,
  `SelfPSNURL` varchar(250) DEFAULT NULL,
  `SelfURL` varchar(250) DEFAULT NULL,
  `State` tinyint(2) DEFAULT '0',
  `URL` varchar(250) DEFAULT NULL,
  `Top` smallint(5) DEFAULT '0',
  `Pink` smallint(5) DEFAULT '0',
  `Sort` smallint(5) DEFAULT '0',
  PRIMARY KEY (`IndexID`,`ContentID`,`NodeID`),
  UNIQUE KEY `IndexID` (`IndexID`),
  KEY `N_P` (`NodeID`,`State`,`Top`,`PublishDate`,`Sort`),
  KEY `N_S` (`NodeID`,`State`),
  KEY `PID` (`ParentIndexID`),
  KEY `Type` (`Type`),
  KEY `Top` (`Top`),
  KEY `Pink` (`Pink`)
) ENGINE=MyISAM AUTO_INCREMENT=352439 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_content_table`
--

DROP TABLE IF EXISTS `cmsware_content_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_content_table` (
  `TableID` int(8) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `DSNID` int(8) DEFAULT '0',
  PRIMARY KEY (`TableID`),
  UNIQUE KEY `TableID` (`TableID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_1`
--

DROP TABLE IF EXISTS `cmsware_contribution_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_1` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT NULL,
  `ModifiedDate` int(10) DEFAULT NULL,
  `ApprovedDate` int(10) DEFAULT NULL,
  `OwnerID` int(8) DEFAULT NULL,
  `State` int(5) DEFAULT '0',
  `Title` varchar(250) DEFAULT NULL,
  `TitleColor` varchar(7) DEFAULT NULL,
  `Author` varchar(20) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Photo` varchar(250) DEFAULT NULL,
  `SubTitle` varchar(250) DEFAULT NULL,
  `Content` longtext,
  `Keywords` varchar(250) DEFAULT NULL,
  `FromSite` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `CustomLinks` mediumtext,
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `IndexNodeID` varchar(250) DEFAULT NULL,
  `ContributionDate` int(10) DEFAULT '0',
  `SchoolID` varchar(250) DEFAULT NULL,
  `AgentID` varchar(250) DEFAULT NULL,
  `Pic1` varchar(250) DEFAULT NULL,
  `Pic2` varchar(250) DEFAULT NULL,
  `Pic3` varchar(250) DEFAULT NULL,
  `Agent_Name` varchar(250) DEFAULT NULL,
  `School_Name` varchar(250) DEFAULT NULL,
  `guest` varchar(20) DEFAULT NULL,
  `caseinfo` varchar(250) DEFAULT NULL,
  `USAER_SchoolID` varchar(250) DEFAULT NULL,
  `USAER_School_Name` varchar(250) DEFAULT NULL,
  `education` varchar(250) DEFAULT NULL,
  `MajorKeywords` varchar(250) DEFAULT NULL,
  `generalcode` text,
  `51offer_tag` varchar(250) DEFAULT NULL,
  `51offer_tag2` varchar(250) DEFAULT NULL,
  `51offer_tag3` varchar(250) DEFAULT NULL,
  `51offer_recommend` varchar(250) DEFAULT NULL,
  `Pic4` varchar(250) DEFAULT NULL,
  `sort` varchar(250) DEFAULT NULL,
  `pic5` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `invalid_date` varchar(250) DEFAULT NULL,
  `point_sort` varchar(250) DEFAULT NULL,
  `pic6` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_11`
--

DROP TABLE IF EXISTS `cmsware_contribution_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_11` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `OwnerID` int(8) DEFAULT '0',
  `State` int(5) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT '',
  `IndexNodeID` varchar(250) DEFAULT '',
  `ContributionDate` int(10) DEFAULT '0',
  `rank_year` varchar(250) DEFAULT NULL,
  `rank_type` varchar(250) DEFAULT NULL,
  `about_country` varchar(250) DEFAULT NULL,
  `about_SchoolID` varchar(250) DEFAULT NULL,
  `about_SchoolName` varchar(250) DEFAULT NULL,
  `about_School_E_Name` varchar(250) DEFAULT NULL,
  `rank_major_Name` varchar(250) DEFAULT NULL,
  `rank_major_E_Name` varchar(250) DEFAULT NULL,
  `rank` int(10) DEFAULT NULL,
  `Tuition` varchar(250) DEFAULT NULL,
  `Totalenrollment` varchar(250) DEFAULT NULL,
  `Acceptancerate` varchar(250) DEFAULT NULL,
  `6yeargraduationrate` varchar(250) DEFAULT NULL,
  `newuser_retention` varchar(250) DEFAULT NULL,
  `Score` varchar(250) DEFAULT NULL,
  `student_satisfaction` varchar(250) DEFAULT NULL,
  `research_quality` varchar(250) DEFAULT NULL,
  `entry_standards` varchar(250) DEFAULT NULL,
  `student_staff_ratio` varchar(250) DEFAULT NULL,
  `services_facilities` varchar(250) DEFAULT NULL,
  `completion` varchar(250) DEFAULT NULL,
  `good_honours` varchar(250) DEFAULT NULL,
  `graduate_prospects` varchar(250) DEFAULT NULL,
  `overall_score` varchar(250) DEFAULT NULL,
  `rank_major_Name_uk` varchar(250) DEFAULT NULL,
  `rank_major_E_Name_uk` varchar(250) DEFAULT NULL,
  `ucas_entry_points` varchar(250) DEFAULT NULL,
  `firsts` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_12`
--

DROP TABLE IF EXISTS `cmsware_contribution_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_12` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `OwnerID` int(8) DEFAULT '0',
  `State` int(5) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT '',
  `IndexNodeID` varchar(250) DEFAULT '',
  `ContributionDate` int(10) DEFAULT '0',
  `SchoolID` varchar(250) DEFAULT NULL,
  `Course_CName` varchar(250) DEFAULT NULL,
  `Course_EName` varchar(250) DEFAULT NULL,
  `Link_Grade` varchar(250) DEFAULT NULL,
  `Link_MajorIDs` mediumtext,
  `ProDire` varchar(250) DEFAULT NULL,
  `ProDire01` varchar(250) DEFAULT NULL,
  `ProDire02` varchar(250) DEFAULT NULL,
  `ProDire03` varchar(250) DEFAULT NULL,
  `ProDire04` varchar(250) DEFAULT NULL,
  `ProDire05` varchar(250) DEFAULT NULL,
  `ProDire06` varchar(250) DEFAULT NULL,
  `Edu_Level` int(10) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_2`
--

DROP TABLE IF EXISTS `cmsware_contribution_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_2` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT NULL,
  `ModifiedDate` int(10) DEFAULT NULL,
  `ApprovedDate` int(10) DEFAULT NULL,
  `OwnerID` int(8) DEFAULT NULL,
  `State` int(2) DEFAULT NULL,
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `IndexNodeID` varchar(250) DEFAULT NULL,
  `ContributionDate` int(10) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `SoftSize` varchar(15) DEFAULT NULL,
  `Language` varchar(10) DEFAULT NULL,
  `SoftType` varchar(50) DEFAULT NULL,
  `Environment` varchar(50) DEFAULT NULL,
  `Star` int(2) DEFAULT '0',
  `Developer` varchar(250) DEFAULT NULL,
  `SoftKeywords` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `Download` mediumtext,
  `Photo` varchar(250) DEFAULT NULL,
  `LocalUpload` varchar(250) DEFAULT NULL,
  `CustomSoftLinks` mediumtext,
  `CustomLinks` mediumtext,
  `SchoolID` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_3`
--

DROP TABLE IF EXISTS `cmsware_contribution_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_3` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `OwnerID` int(8) DEFAULT '0',
  `State` int(5) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `IndexNodeID` varchar(250) DEFAULT NULL,
  `ContributionDate` int(10) DEFAULT '0',
  `S_Name` varchar(250) DEFAULT NULL,
  `E_Name` varchar(250) DEFAULT NULL,
  `E_letter` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` longtext,
  `S_Url` varchar(250) DEFAULT NULL,
  `Telephone` mediumtext,
  `Address` varchar(250) DEFAULT NULL,
  `Post` varchar(250) DEFAULT NULL,
  `Times_Pm` varchar(250) DEFAULT NULL,
  `Wb_Pm` varchar(250) DEFAULT NULL,
  `Jrsb_Pm` varchar(250) DEFAULT NULL,
  `Uker_Pm` varchar(250) DEFAULT NULL,
  `Area` varchar(250) DEFAULT NULL,
  `City` text,
  `Life_Fear` varchar(250) DEFAULT NULL,
  `Jyl` varchar(250) DEFAULT NULL,
  `Hwxsbl` varchar(250) DEFAULT NULL,
  `Map` varchar(250) DEFAULT NULL,
  `Jyzx_Link` varchar(250) DEFAULT NULL,
  `AlumniURL` varchar(250) DEFAULT NULL,
  `Content` varchar(250) DEFAULT NULL,
  `ApplyFee` varchar(250) DEFAULT NULL,
  `TSRate` varchar(250) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  `Times_sort` varchar(250) DEFAULT NULL,
  `biz_agent` mediumtext,
  `AlumniCode` mediumtext,
  `BBSCode` mediumtext,
  `AgentID` varchar(250) DEFAULT NULL,
  `CourseType` varchar(250) DEFAULT NULL,
  `Comment_1` mediumtext,
  `Comment_2` mediumtext,
  `BBSCommURL` varchar(250) DEFAULT NULL,
  `Intro_s` mediumtext,
  `E_Name_s` varchar(250) DEFAULT NULL,
  `Times_Pm_2002` varchar(250) DEFAULT NULL,
  `Times_Pm_2003` varchar(250) DEFAULT NULL,
  `Times_Pm_2004` varchar(250) DEFAULT NULL,
  `Times_Pm_2005` varchar(250) DEFAULT NULL,
  `Times_Pm_2006` varchar(250) DEFAULT NULL,
  `Times_Pm_2007` varchar(250) DEFAULT NULL,
  `Times_Pm_2008` varchar(250) DEFAULT NULL,
  `Times_Pm_2009` varchar(250) DEFAULT NULL,
  `Times_Pm_2001` varchar(250) DEFAULT NULL,
  `Times_Pm_2000` varchar(250) DEFAULT NULL,
  `Times_Pm_2010` varchar(250) DEFAULT NULL,
  `Times_Pm_2011` varchar(250) DEFAULT NULL,
  `Times_Pm_2012` varchar(250) DEFAULT NULL,
  `coord_longitude` varchar(250) DEFAULT NULL,
  `coord_latitude` varchar(250) DEFAULT NULL,
  `QQgroup` varchar(250) DEFAULT NULL,
  `Tips` mediumtext,
  `Times_Pm_2013` varchar(250) DEFAULT NULL,
  `Times_Pm_2014` varchar(250) DEFAULT NULL,
  `Times_Pm_2015` varchar(250) DEFAULT NULL,
  `Intro_m` mediumtext,
  `country` varchar(250) DEFAULT NULL,
  `Edu_Level` varchar(250) DEFAULT NULL,
  `Nature` varchar(250) DEFAULT NULL,
  `IsPublic` varchar(250) DEFAULT NULL,
  `Lodge_Rules` text,
  `Scholarship` varchar(250) DEFAULT NULL,
  `Grade_Enter` varchar(250) DEFAULT NULL,
  `A_Ratio` varchar(20) DEFAULT NULL,
  `IsBoarder` varchar(250) DEFAULT NULL,
  `Students_Amount` varchar(250) DEFAULT NULL,
  `C_Students_Amount` varchar(250) DEFAULT NULL,
  `Chinese_A_Ratio` varchar(250) DEFAULT NULL,
  `Ib_Course` varchar(250) DEFAULT NULL,
  `Apply_Age_Begin` varchar(250) DEFAULT NULL,
  `Ielts_Score` varchar(250) DEFAULT NULL,
  `Toefl_Score` varchar(250) DEFAULT NULL,
  `Sat_Score` varchar(250) DEFAULT NULL,
  `Tuition` varchar(250) DEFAULT NULL,
  `Global_Pm` varchar(250) DEFAULT NULL,
  `Apply_Age_End` varchar(250) DEFAULT NULL,
  `Building_Time` text,
  `Intro_Location` mediumtext,
  `Intro_History` mediumtext,
  `Intro_Feature` mediumtext,
  `Intro_CollegeFeature` mediumtext,
  `Intro_Facility` mediumtext,
  `Intro_Accommodation` mediumtext,
  `mStar_5` text,
  `mstar_4` text,
  `mstar_3` text,
  `mStar_2` text,
  `mStar_1` text,
  `rec_reason` text,
  `food_info` text,
  `jyqj` text,
  `jxj_info` text,
  `famous_alumni` varchar(250) DEFAULT NULL,
  `checkCity` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `log2` varchar(250) DEFAULT NULL,
  `recommend_sort` varchar(250) DEFAULT NULL,
  `recommend_tag` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_4`
--

DROP TABLE IF EXISTS `cmsware_contribution_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_4` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `OwnerID` int(8) DEFAULT '0',
  `State` int(5) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `IndexNodeID` varchar(250) DEFAULT NULL,
  `ContributionDate` int(10) DEFAULT '0',
  `Z_Name` varchar(250) DEFAULT NULL,
  `Z_E_Name` varchar(250) DEFAULT NULL,
  `SchoolID` int(10) DEFAULT NULL,
  `DegreeType` varchar(250) DEFAULT NULL,
  `DegreeType01` varchar(250) DEFAULT NULL,
  `DegreeType02` varchar(250) DEFAULT NULL,
  `DegreeType03` varchar(250) DEFAULT NULL,
  `DegreeType04` varchar(250) DEFAULT NULL,
  `ProDire` varchar(36) DEFAULT NULL,
  `ProDire01` varchar(36) DEFAULT NULL,
  `ProDire02` varchar(36) DEFAULT NULL,
  `ProDire03` varchar(36) DEFAULT NULL,
  `ProDire04` varchar(36) DEFAULT NULL,
  `MajorFW` varchar(1) DEFAULT NULL,
  `MajorUrl` varchar(250) DEFAULT NULL,
  `DegreeType05` varchar(250) DEFAULT NULL,
  `DegreeType06` varchar(250) DEFAULT NULL,
  `Z_E_Name_s` varchar(250) DEFAULT NULL,
  `ProDire05` varchar(36) DEFAULT NULL,
  `ProDire06` varchar(36) DEFAULT NULL,
  `Editor` varchar(250) DEFAULT NULL,
  `Edu_Level` int(10) DEFAULT NULL,
  `Data_Direction` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `链接专业ids` mediumtext,
  `open_time` varchar(250) DEFAULT NULL,
  `close_time` varchar(250) DEFAULT NULL,
  `run_time` varchar(250) DEFAULT NULL,
  `require_score` varchar(250) DEFAULT NULL,
  `require_listen` varchar(250) DEFAULT NULL,
  `require_speak` varchar(250) DEFAULT NULL,
  `require_read` varchar(250) DEFAULT NULL,
  `require_write` varchar(250) DEFAULT NULL,
  `cost` varchar(250) DEFAULT NULL,
  `mark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_5`
--

DROP TABLE IF EXISTS `cmsware_contribution_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_5` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `OwnerID` int(8) DEFAULT '0',
  `State` int(5) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `IndexNodeID` varchar(250) DEFAULT NULL,
  `ContributionDate` int(10) DEFAULT '0',
  `CompanyName` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `Area` varchar(250) DEFAULT NULL,
  `Country` varchar(250) DEFAULT NULL,
  `Province` varchar(250) DEFAULT NULL,
  `City` varchar(250) DEFAULT NULL,
  `Auth` varchar(250) DEFAULT NULL,
  `Telephone` varchar(250) DEFAULT NULL,
  `Fax` varchar(250) DEFAULT NULL,
  `E-mail` varchar(250) DEFAULT NULL,
  `SiteURL` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Postcode` varchar(250) DEFAULT NULL,
  `Feature` mediumtext,
  `Map` varchar(250) DEFAULT NULL,
  `Schools` mediumtext,
  `UkerAward` varchar(250) DEFAULT NULL,
  `TrustPoint` varchar(250) DEFAULT NULL,
  `ApplyNum` varchar(250) DEFAULT NULL,
  `VisaNum` varchar(250) DEFAULT NULL,
  `parent_id` varchar(250) DEFAULT NULL,
  `QQ` varchar(250) DEFAULT NULL,
  `MemberSince` varchar(250) DEFAULT NULL,
  `TopSchools` varchar(250) DEFAULT NULL,
  `Contact` varchar(250) DEFAULT NULL,
  `TrustPoint_plus` varchar(250) DEFAULT NULL,
  `BlogURL` varchar(250) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  `blogcode` mediumtext,
  `MSN` varchar(250) DEFAULT NULL,
  `UkerCeitified` varchar(1) DEFAULT NULL,
  `AvgRanking` varchar(250) DEFAULT NULL,
  `pic1` varchar(250) DEFAULT NULL,
  `pic2` varchar(250) DEFAULT NULL,
  `pic3` varchar(250) DEFAULT NULL,
  `Avatar` varchar(250) DEFAULT NULL,
  `Gender` varchar(250) DEFAULT NULL,
  `Position` varchar(250) DEFAULT NULL,
  `Department` varchar(250) DEFAULT NULL,
  `College` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_6`
--

DROP TABLE IF EXISTS `cmsware_contribution_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_6` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `OwnerID` int(8) DEFAULT '0',
  `State` int(5) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `IndexNodeID` varchar(250) DEFAULT NULL,
  `ContributionDate` int(10) DEFAULT '0',
  `UserID` int(10) DEFAULT NULL,
  `score_TOEFL` varchar(250) DEFAULT NULL,
  `score_IELTS` varchar(250) DEFAULT NULL,
  `score_GMAT` varchar(250) DEFAULT NULL,
  `GotOffer` varchar(250) DEFAULT NULL,
  `ApplySchool_id` int(10) DEFAULT NULL,
  `ApplySchool_Name` varchar(250) DEFAULT NULL,
  `UserFullname` varchar(250) DEFAULT NULL,
  `gra_SchoolName` varchar(250) DEFAULT NULL,
  `gra_Specialty` varchar(250) DEFAULT NULL,
  `gra_Degree` varchar(250) DEFAULT NULL,
  `gra_AvgScore` varchar(250) DEFAULT NULL,
  `gra_Time` varchar(250) DEFAULT NULL,
  `UserGender` varchar(250) DEFAULT NULL,
  `UserAge` varchar(250) DEFAULT NULL,
  `UserProvince` varchar(250) DEFAULT NULL,
  `UserCity` varchar(250) DEFAULT NULL,
  `UserTel` varchar(250) DEFAULT NULL,
  `UserEmail` varchar(250) DEFAULT NULL,
  `ApplySchool_Specialty` varchar(250) DEFAULT NULL,
  `Apply_Degree` varchar(250) DEFAULT NULL,
  `ApplySchool_Spec` varchar(250) DEFAULT NULL,
  `UserQQ` varchar(250) DEFAULT NULL,
  `UserMSN` varchar(250) DEFAULT NULL,
  `matriculate_year` varchar(250) DEFAULT NULL,
  `matriculate_season` varchar(250) DEFAULT NULL,
  `other_school` mediumtext,
  `Calltime` varchar(250) DEFAULT NULL,
  `through` varchar(250) DEFAULT NULL,
  `channel` varchar(250) DEFAULT NULL,
  `Apply_country` varchar(250) DEFAULT NULL,
  `parentFullname` varchar(250) DEFAULT NULL,
  `gra_Time_month` varchar(250) DEFAULT NULL,
  `businesschannel` varchar(250) DEFAULT NULL,
  `Apply_country_bx` varchar(250) DEFAULT NULL,
  `other_rejection` mediumtext,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_7`
--

DROP TABLE IF EXISTS `cmsware_contribution_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_7` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `OwnerID` int(8) DEFAULT '0',
  `State` int(5) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT NULL,
  `IndexNodeID` varchar(250) DEFAULT NULL,
  `ContributionDate` int(10) DEFAULT '0',
  `SchoolID` mediumtext,
  `AgentID` varchar(250) DEFAULT NULL,
  `AgentCountry` varchar(250) DEFAULT NULL,
  `AgentProvince` varchar(250) DEFAULT NULL,
  `AgentCity` varchar(250) DEFAULT NULL,
  `AgentName` varchar(250) DEFAULT NULL,
  `FullName` varchar(250) DEFAULT NULL,
  `Gender` varchar(250) DEFAULT NULL,
  `Age` varchar(250) DEFAULT NULL,
  `Tel` varchar(250) DEFAULT NULL,
  `E-mail` varchar(250) DEFAULT NULL,
  `Province` varchar(250) DEFAULT NULL,
  `City` varchar(250) DEFAULT NULL,
  `IELTS` varchar(250) DEFAULT NULL,
  `GSchool` varchar(250) DEFAULT NULL,
  `GSpecialty` varchar(250) DEFAULT NULL,
  `AvgScore` varchar(250) DEFAULT NULL,
  `OfferSpecialtyID` varchar(250) DEFAULT NULL,
  `OfferSpecialtyType` varchar(250) DEFAULT NULL,
  `OfferDegree` varchar(250) DEFAULT NULL,
  `OfferTime` varchar(250) DEFAULT NULL,
  `OfferDoc` varchar(250) DEFAULT NULL,
  `through` varchar(250) DEFAULT NULL,
  `VisaExpire` varchar(250) DEFAULT NULL,
  `VisaType` varchar(250) DEFAULT NULL,
  `SchoolName` varchar(250) DEFAULT NULL,
  `UserID` varchar(10) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `msn` varchar(250) DEFAULT NULL,
  `yahoo` varchar(250) DEFAULT NULL,
  `OfferNo` varchar(250) DEFAULT NULL,
  `LeavingTime` varchar(250) DEFAULT NULL,
  `LeavingProvince` varchar(250) DEFAULT NULL,
  `LeavingCity` varchar(250) DEFAULT NULL,
  `Privacy` mediumtext,
  `Birthday` varchar(250) DEFAULT NULL,
  `Matriculate` varchar(250) DEFAULT NULL,
  `QQ` varchar(250) DEFAULT NULL,
  `add` varchar(250) DEFAULT NULL,
  `otheroffer` text,
  `otherrejection` text,
  `visainfo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_8`
--

DROP TABLE IF EXISTS `cmsware_contribution_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_8` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `OwnerID` int(8) DEFAULT '0',
  `State` int(5) DEFAULT '0',
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT '',
  `IndexNodeID` varchar(250) DEFAULT '',
  `ContributionDate` int(10) DEFAULT '0',
  `AgentID` varchar(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Intro` text,
  `Personal` mediumtext,
  `Fullname` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_9`
--

DROP TABLE IF EXISTS `cmsware_contribution_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_9` (
  `ContributionID` int(10) NOT NULL AUTO_INCREMENT,
  `CateID` int(8) NOT NULL DEFAULT '0',
  `CreationDate` int(10) DEFAULT '0',
  `ModifiedDate` int(10) DEFAULT '0',
  `ApprovedDate` int(10) DEFAULT '0',
  `OwnerID` int(8) DEFAULT '0',
  `state` varchar(250) DEFAULT NULL,
  `NodeID` int(8) DEFAULT '0',
  `SubNodeID` varchar(250) DEFAULT '',
  `IndexNodeID` varchar(250) DEFAULT '',
  `ContributionDate` int(10) DEFAULT '0',
  `S_Name` varchar(250) DEFAULT NULL,
  `E_Name` varchar(250) DEFAULT NULL,
  `E_Name_s` varchar(250) DEFAULT NULL,
  `E_Name_standard` varchar(250) DEFAULT NULL,
  `E_letter` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` longtext,
  `Intro_s` text,
  `Tips` mediumtext,
  `QQgroup` varchar(250) DEFAULT NULL,
  `foundtime` int(10) DEFAULT NULL,
  `nature` text,
  `type` text,
  `students` varchar(250) DEFAULT NULL,
  `undergraduate_studen` varchar(250) DEFAULT NULL,
  `international_studen` varchar(250) DEFAULT NULL,
  `admission_rate` varchar(250) DEFAULT NULL,
  `tuition` int(10) DEFAULT NULL,
  `Life_Fear` varchar(250) DEFAULT NULL,
  `scholarship` varchar(250) DEFAULT NULL,
  `toefl` int(10) DEFAULT NULL,
  `sat` varchar(250) DEFAULT NULL,
  `state_s` varchar(250) DEFAULT NULL,
  `City` text,
  `Map` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Post` varchar(250) DEFAULT NULL,
  `Telephone` text,
  `S_Url` varchar(250) DEFAULT NULL,
  `coord_longitude` varchar(250) DEFAULT NULL,
  `coord_latitude` varchar(250) DEFAULT NULL,
  `USnews_Pm` int(10) DEFAULT NULL,
  `USnews_Pm_2015` int(10) DEFAULT NULL,
  `USnews_Pm_2014` int(10) DEFAULT NULL,
  `USnews_Pm_2013` int(10) DEFAULT NULL,
  `USnews_Pm_2012` int(10) DEFAULT NULL,
  `USnews_Pm_2011` int(10) DEFAULT NULL,
  `ARWU_Pm_2014` int(10) DEFAULT NULL,
  `ARWU_Pm_2013` int(10) DEFAULT NULL,
  `ARWU_Pm_2012` int(10) DEFAULT NULL,
  `ARWU_Pm_2011` int(10) DEFAULT NULL,
  `ARWU_Pm_2010` int(10) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ContributionID`,`CateID`),
  UNIQUE KEY `ContributionID` (`ContributionID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_contribution_note`
--

DROP TABLE IF EXISTS `cmsware_contribution_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_contribution_note` (
  `NoteID` int(8) NOT NULL AUTO_INCREMENT,
  `ContributionID` int(10) NOT NULL DEFAULT '0',
  `CateID` int(8) NOT NULL DEFAULT '0',
  `Note` text,
  `NoteUserID` int(8) DEFAULT NULL,
  `NoteUserName` varchar(50) DEFAULT NULL,
  `NoteDate` int(10) DEFAULT '0',
  PRIMARY KEY (`NoteID`,`ContributionID`,`CateID`),
  UNIQUE KEY `NoteID` (`NoteID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_action`
--

DROP TABLE IF EXISTS `cmsware_cwps_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_action` (
  `ActionID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `Action` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ActionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_group`
--

DROP TABLE IF EXISTS `cmsware_cwps_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_group` (
  `GroupID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(32) DEFAULT NULL,
  `Reserved` tinyint(1) DEFAULT '0',
  `RoleID` int(6) DEFAULT NULL,
  `SubRoleIDs` text,
  `OrderBy` tinyint(2) DEFAULT '0',
  `OpIDs` text,
  PRIMARY KEY (`GroupID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_oas`
--

DROP TABLE IF EXISTS `cmsware_cwps_oas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_oas` (
  `OASID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `OASUID` varchar(255) DEFAULT NULL,
  `OASName` varchar(20) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `ProvisionURL` varchar(255) DEFAULT NULL,
  `ProvisionPassword` varchar(32) DEFAULT NULL,
  `CWPSPassword` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`OASID`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_operator`
--

DROP TABLE IF EXISTS `cmsware_cwps_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_operator` (
  `OpID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `PID` int(6) DEFAULT NULL,
  `RID` int(6) DEFAULT NULL,
  `OpName` varchar(30) DEFAULT NULL,
  `Enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`OpID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_privilege`
--

DROP TABLE IF EXISTS `cmsware_cwps_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_privilege` (
  `PID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `PrivilegeUID` varchar(20) DEFAULT NULL,
  `PrivilegeName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `PrivilegeUID` (`PrivilegeUID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_resource`
--

DROP TABLE IF EXISTS `cmsware_cwps_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_resource` (
  `RID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `ResourceUID` varchar(20) DEFAULT NULL,
  `ResourceName` varchar(30) DEFAULT NULL,
  `OASIDs` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`RID`),
  UNIQUE KEY `ResourceUID` (`ResourceUID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_role`
--

DROP TABLE IF EXISTS `cmsware_cwps_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_role` (
  `RoleID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(30) DEFAULT NULL,
  `OpIDs` text,
  `RoleBaseUID` enum('Administrator','User','Guest') DEFAULT NULL,
  `Reserved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`RoleID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_sessions`
--

DROP TABLE IF EXISTS `cmsware_cwps_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_sessions` (
  `sId` varchar(32) NOT NULL DEFAULT '',
  `UserName` varchar(32) DEFAULT NULL,
  `UserID` int(8) DEFAULT '0',
  `GroupID` int(8) DEFAULT NULL,
  `LogInTime` int(10) DEFAULT '0',
  `RunningTime` int(10) DEFAULT '0',
  `Ip` varchar(16) DEFAULT NULL,
  `SessionData` blob,
  `IsCookieLogin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`sId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_soap`
--

DROP TABLE IF EXISTS `cmsware_cwps_soap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_soap` (
  `SoapID` varchar(30) NOT NULL DEFAULT '',
  `SoapName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SoapID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_user`
--

DROP TABLE IF EXISTS `cmsware_cwps_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_user` (
  `UserID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `GroupID` int(8) DEFAULT NULL,
  `UserName` varchar(32) DEFAULT NULL,
  `Password` varchar(32) DEFAULT NULL,
  `PassQuestion` varchar(30) DEFAULT NULL,
  `PassAnswer` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `NickName` varchar(32) DEFAULT NULL,
  `Gender` tinyint(1) DEFAULT NULL,
  `Birthday` date DEFAULT '0000-00-00',
  `QQ` varchar(20) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT '0',
  `RegisterDate` int(10) DEFAULT '0',
  `LastLoginTime` int(10) DEFAULT NULL,
  `SubGroupIDs` varchar(255) DEFAULT NULL,
  `RoleID` int(5) DEFAULT '0',
  `SubRoleIDs` varchar(255) DEFAULT NULL,
  `OpIDs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_user_extra`
--

DROP TABLE IF EXISTS `cmsware_cwps_user_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_user_extra` (
  `UserID` int(8) NOT NULL DEFAULT '0',
  `Phone` varchar(11) DEFAULT NULL,
  `Money` int(12) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_cwps_user_fields`
--

DROP TABLE IF EXISTS `cmsware_cwps_user_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_cwps_user_fields` (
  `FieldID` int(8) NOT NULL AUTO_INCREMENT,
  `FieldTitle` varchar(20) DEFAULT NULL,
  `FieldName` varchar(20) DEFAULT NULL,
  `FieldType` varchar(20) DEFAULT NULL,
  `FieldSize` varchar(20) DEFAULT NULL,
  `FieldInput` varchar(20) DEFAULT NULL,
  `FieldDescription` mediumtext,
  `FieldOrder` mediumint(8) DEFAULT '0',
  `FieldAccess` tinyint(1) DEFAULT '1',
  `FieldDataSource` text,
  PRIMARY KEY (`FieldID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_extra_publish`
--

DROP TABLE IF EXISTS `cmsware_extra_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_extra_publish` (
  `PublishID` int(8) NOT NULL AUTO_INCREMENT,
  `NodeID` int(8) DEFAULT '0',
  `PublishName` varchar(100) DEFAULT NULL,
  `SelfPSN` varchar(250) DEFAULT NULL,
  `SelfPSNURL` varchar(250) DEFAULT NULL,
  `PublishFileName` varchar(100) DEFAULT NULL,
  `Tpl` varchar(250) DEFAULT NULL,
  `Intro` text,
  `CreationUserID` int(8) DEFAULT NULL,
  `LastModifiedUserID` int(8) DEFAULT NULL,
  `CreationDate` int(10) DEFAULT NULL,
  `ModifiedDate` int(10) DEFAULT NULL,
  PRIMARY KEY (`PublishID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_group`
--

DROP TABLE IF EXISTS `cmsware_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_group` (
  `gId` mediumint(8) NOT NULL AUTO_INCREMENT,
  `gName` varchar(50) DEFAULT NULL,
  `gPass` varchar(32) DEFAULT '0',
  `gPublishAuth` varchar(50) DEFAULT NULL,
  `gInfo` text,
  `gIsAdmin` tinyint(1) DEFAULT '0',
  `canLoginAdmin` tinyint(1) DEFAULT '0',
  `canLogin` tinyint(1) DEFAULT '1',
  `canChangePW` tinyint(1) DEFAULT '1',
  `canTpl` tinyint(1) DEFAULT '0',
  `canNode` tinyint(1) DEFAULT '0',
  `canCollection` tinyint(1) DEFAULT '0',
  `ParentGID` mediumint(8) DEFAULT NULL,
  `canMakeG` tinyint(1) DEFAULT '0',
  `canMakeU` tinyint(1) DEFAULT '0',
  `CreationUserID` mediumint(8) DEFAULT NULL,
  UNIQUE KEY `gId` (`gId`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_keywords`
--

DROP TABLE IF EXISTS `cmsware_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_keywords` (
  `kId` double DEFAULT NULL,
  `keyword` varchar(765) DEFAULT NULL,
  `kReplace` varchar(765) DEFAULT NULL,
  `IsGlobal` double DEFAULT NULL,
  `NodeScope` varchar(765) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_keywords_111127`
--

DROP TABLE IF EXISTS `cmsware_keywords_111127`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_keywords_111127` (
  `kId` mediumint(8) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(250) DEFAULT NULL,
  `kReplace` text,
  `IsGlobal` tinyint(1) DEFAULT '1',
  `NodeScope` mediumtext,
  UNIQUE KEY `kId` (`kId`)
) ENGINE=MyISAM AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_keywords_130116`
--

DROP TABLE IF EXISTS `cmsware_keywords_130116`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_keywords_130116` (
  `kId` mediumint(8) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(250) DEFAULT NULL,
  `kReplace` text,
  `IsGlobal` tinyint(1) DEFAULT '1',
  `NodeScope` mediumtext,
  UNIQUE KEY `kId` (`kId`)
) ENGINE=MyISAM AUTO_INCREMENT=309 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_log_admin`
--

DROP TABLE IF EXISTS `cmsware_log_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_log_admin` (
  `LogID` int(10) NOT NULL AUTO_INCREMENT,
  `uName` char(50) DEFAULT NULL,
  `IP` char(15) DEFAULT NULL,
  `Action` char(100) DEFAULT NULL,
  `ActionURL` char(250) DEFAULT NULL,
  `Time` int(10) DEFAULT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=MyISAM AUTO_INCREMENT=297830 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_log_login`
--

DROP TABLE IF EXISTS `cmsware_log_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_log_login` (
  `LogID` int(10) NOT NULL AUTO_INCREMENT,
  `uName` char(50) DEFAULT NULL,
  `IP` char(15) DEFAULT NULL,
  `Time` int(10) DEFAULT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=MyISAM AUTO_INCREMENT=31374 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_node_fields`
--

DROP TABLE IF EXISTS `cmsware_node_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_node_fields` (
  `FieldID` int(8) NOT NULL AUTO_INCREMENT,
  `FieldTitle` varchar(20) DEFAULT NULL,
  `FieldName` varchar(20) DEFAULT NULL,
  `FieldType` varchar(20) DEFAULT NULL,
  `FieldSize` varchar(20) DEFAULT NULL,
  `FieldInput` varchar(20) DEFAULT NULL,
  `FieldDescription` mediumtext,
  `FieldOrder` mediumint(8) DEFAULT '0',
  `FieldAccess` tinyint(1) DEFAULT '1',
  `FieldDataSource` text,
  PRIMARY KEY (`FieldID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_base_comment`
--

DROP TABLE IF EXISTS `cmsware_plugin_base_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_base_comment` (
  `CommentID` int(10) NOT NULL AUTO_INCREMENT,
  `IndexID` int(10) DEFAULT '0',
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `Author` varchar(100) DEFAULT NULL,
  `CreationDate` int(10) DEFAULT NULL,
  `Ip` varchar(15) DEFAULT NULL,
  `Comment` text,
  `Approved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`CommentID`),
  KEY `IndexID` (`IndexID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=MyISAM AUTO_INCREMENT=25715 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_base_count`
--

DROP TABLE IF EXISTS `cmsware_plugin_base_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_base_count` (
  `Hits_Total` int(10) DEFAULT '0',
  `Hits_Today` int(10) DEFAULT '0',
  `Hits_Week` int(10) DEFAULT '0',
  `Hits_Month` int(10) DEFAULT '0',
  `Hits_Date` int(10) DEFAULT '0',
  `IndexID` int(10) NOT NULL DEFAULT '0',
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `CommentNum` int(10) DEFAULT '0',
  `TableID` int(5) DEFAULT '0',
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `CID` (`ContentID`),
  KEY `TID` (`TableID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_base_setting`
--

DROP TABLE IF EXISTS `cmsware_plugin_base_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_base_setting` (
  `TableID` int(6) unsigned NOT NULL DEFAULT '0',
  `CommentMode` tinyint(1) DEFAULT '0',
  `CommentTpl` varchar(250) DEFAULT NULL,
  `CommentCache` tinyint(1) DEFAULT '1',
  `CommentPageOffset` tinyint(3) DEFAULT '15',
  `CommentLength` int(10) DEFAULT NULL,
  `IpHidden` tinyint(1) DEFAULT '1',
  `AllowBBcode` tinyint(1) DEFAULT '0',
  `AllowSmilies` tinyint(1) DEFAULT '0',
  `AllowHtml` tinyint(1) DEFAULT '0',
  `AllowImgcode` tinyint(1) DEFAULT '0',
  `SearchMode` tinyint(1) DEFAULT '0',
  `SearchTpl` varchar(250) DEFAULT NULL,
  `SearchProTpl` varchar(250) DEFAULT NULL,
  `SearchPageOffset` tinyint(3) DEFAULT '15',
  `AllowSearchField` text,
  PRIMARY KEY (`TableID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_bbsi_access`
--

DROP TABLE IF EXISTS `cmsware_plugin_bbsi_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_bbsi_access` (
  `AccessID` int(10) NOT NULL AUTO_INCREMENT,
  `AccessType` int(1) NOT NULL DEFAULT '0',
  `Info` text,
  `OwnerID` int(10) DEFAULT '0',
  `ReadIndex` text,
  `ReadContent` text,
  `PostComment` text,
  `ReadComment` text,
  `AuthInherit` text,
  PRIMARY KEY (`AccessID`,`AccessType`),
  KEY `PermissionType` (`AccessType`,`OwnerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_bbsi_setting`
--

DROP TABLE IF EXISTS `cmsware_plugin_bbsi_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_bbsi_setting` (
  `ForegroundPath` varchar(250) DEFAULT NULL,
  `BBS` varchar(50) DEFAULT NULL,
  `DenyTpl` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_oas_access`
--

DROP TABLE IF EXISTS `cmsware_plugin_oas_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_oas_access` (
  `AccessID` int(10) NOT NULL AUTO_INCREMENT,
  `AccessType` tinyint(1) DEFAULT '1',
  `OwnerID` int(10) DEFAULT NULL,
  `AccessInherit` text,
  `Info` text,
  PRIMARY KEY (`AccessID`),
  UNIQUE KEY `AccessID` (`AccessID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_oas_access_map`
--

DROP TABLE IF EXISTS `cmsware_plugin_oas_access_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_oas_access_map` (
  `AccessID` int(10) NOT NULL DEFAULT '0',
  `PermissionKey` varchar(32) NOT NULL DEFAULT '',
  `AccessNodeIDs` text,
  PRIMARY KEY (`AccessID`,`PermissionKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_oas_permission`
--

DROP TABLE IF EXISTS `cmsware_plugin_oas_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_oas_permission` (
  `PermissionKey` varchar(32) NOT NULL DEFAULT '',
  `PermissionInfo` varchar(250) DEFAULT NULL,
  `Reserved` tinyint(1) DEFAULT '0',
  `OrderKey` int(5) DEFAULT '0',
  PRIMARY KEY (`PermissionKey`),
  UNIQUE KEY `PermissionKey` (`PermissionKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_oas_sessions`
--

DROP TABLE IF EXISTS `cmsware_plugin_oas_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_oas_sessions` (
  `sId` varchar(32) NOT NULL DEFAULT '',
  `UserName` varchar(32) DEFAULT NULL,
  `UserID` int(8) DEFAULT '0',
  `GroupID` int(8) DEFAULT '0',
  `LogInTime` int(10) DEFAULT '0',
  `RunningTime` int(10) DEFAULT '0',
  `Ip` varchar(16) DEFAULT NULL,
  `SessionData` blob,
  PRIMARY KEY (`sId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugin_oas_setting`
--

DROP TABLE IF EXISTS `cmsware_plugin_oas_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugin_oas_setting` (
  `key` varchar(32) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugins`
--

DROP TABLE IF EXISTS `cmsware_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugins` (
  `pId` int(10) NOT NULL AUTO_INCREMENT,
  `pName` varchar(250) DEFAULT NULL,
  `Path` varchar(250) DEFAULT NULL,
  `Info` text,
  `LicenseKey` text,
  `AccessGroup` text,
  `AccessUser` text,
  PRIMARY KEY (`pId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_plugins_oas_user`
--

DROP TABLE IF EXISTS `cmsware_plugins_oas_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_plugins_oas_user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_psn`
--

DROP TABLE IF EXISTS `cmsware_psn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_psn` (
  `PSNID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `PSN` varchar(250) DEFAULT NULL,
  `URL` varchar(250) DEFAULT NULL,
  `Description` mediumtext,
  `PermissionReadG` text,
  PRIMARY KEY (`PSNID`),
  UNIQUE KEY `PSNID` (`PSNID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_pubadminmasks`
--

DROP TABLE IF EXISTS `cmsware_pubadminmasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_pubadminmasks` (
  `pId` mediumint(8) NOT NULL AUTO_INCREMENT,
  `pName` varchar(50) DEFAULT NULL,
  `pInfo` varchar(250) DEFAULT NULL,
  `NodeList` text,
  `NodeExtraPublish` text,
  `NodeSetting` text,
  `ContentRead` text,
  `ContentWrite` text,
  `ContentApprove` text,
  `ContentPublish` text,
  `AuthInherit` text,
  UNIQUE KEY `pAId` (`pId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_1`
--

DROP TABLE IF EXISTS `cmsware_publish_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_1` (
  `IndexID` int(10) NOT NULL DEFAULT '0',
  `ContentID` int(10) DEFAULT NULL,
  `NodeID` int(10) DEFAULT NULL,
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `TitleColor` varchar(7) DEFAULT NULL,
  `Author` varchar(20) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Photo` varchar(250) DEFAULT NULL,
  `SubTitle` varchar(250) DEFAULT NULL,
  `Content` longtext,
  `Keywords` varchar(250) DEFAULT NULL,
  `FromSite` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `CustomLinks` mediumtext,
  `SchoolID` varchar(250) DEFAULT NULL,
  `AgentID` varchar(250) DEFAULT NULL,
  `Pic1` varchar(250) DEFAULT NULL,
  `Pic2` varchar(250) DEFAULT NULL,
  `Pic3` varchar(250) DEFAULT NULL,
  `Agent_Name` varchar(250) DEFAULT NULL,
  `School_Name` varchar(250) DEFAULT NULL,
  `guest` varchar(20) DEFAULT NULL,
  `caseinfo` varchar(250) DEFAULT NULL,
  `USAER_SchoolID` varchar(250) DEFAULT NULL,
  `USAER_School_Name` varchar(250) DEFAULT NULL,
  `education` varchar(250) DEFAULT NULL,
  `MajorKeywords` varchar(250) DEFAULT NULL,
  `generalcode` text,
  `51offer_tag` varchar(250) DEFAULT NULL,
  `51offer_tag2` varchar(250) DEFAULT NULL,
  `51offer_tag3` varchar(250) DEFAULT NULL,
  `51offer_recommend` varchar(250) DEFAULT NULL,
  `Pic4` varchar(250) DEFAULT NULL,
  `sort` varchar(250) DEFAULT NULL,
  `pic5` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `invalid_date` varchar(250) DEFAULT NULL,
  `point_sort` varchar(250) DEFAULT NULL,
  `pic6` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_11`
--

DROP TABLE IF EXISTS `cmsware_publish_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_11` (
  `IndexID` int(10) NOT NULL,
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `rank_year` varchar(250) DEFAULT NULL,
  `rank_type` varchar(250) DEFAULT NULL,
  `about_country` varchar(250) DEFAULT NULL,
  `about_SchoolID` varchar(250) DEFAULT NULL,
  `about_SchoolName` varchar(250) DEFAULT NULL,
  `about_School_E_Name` varchar(250) DEFAULT NULL,
  `rank_major_Name` varchar(250) DEFAULT NULL,
  `rank_major_E_Name` varchar(250) DEFAULT NULL,
  `rank` int(10) DEFAULT NULL,
  `Tuition` varchar(250) DEFAULT NULL,
  `Totalenrollment` varchar(250) DEFAULT NULL,
  `Acceptancerate` varchar(250) DEFAULT NULL,
  `6yeargraduationrate` varchar(250) DEFAULT NULL,
  `newuser_retention` varchar(250) DEFAULT NULL,
  `Score` varchar(250) DEFAULT NULL,
  `student_satisfaction` varchar(250) DEFAULT NULL,
  `research_quality` varchar(250) DEFAULT NULL,
  `entry_standards` varchar(250) DEFAULT NULL,
  `student_staff_ratio` varchar(250) DEFAULT NULL,
  `services_facilities` varchar(250) DEFAULT NULL,
  `completion` varchar(250) DEFAULT NULL,
  `good_honours` varchar(250) DEFAULT NULL,
  `graduate_prospects` varchar(250) DEFAULT NULL,
  `overall_score` varchar(250) DEFAULT NULL,
  `rank_major_Name_uk` varchar(250) DEFAULT NULL,
  `rank_major_E_Name_uk` varchar(250) DEFAULT NULL,
  `ucas_entry_points` varchar(250) DEFAULT NULL,
  `firsts` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_12`
--

DROP TABLE IF EXISTS `cmsware_publish_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_12` (
  `IndexID` int(10) NOT NULL,
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `SchoolID` varchar(250) DEFAULT NULL,
  `Course_CName` varchar(250) DEFAULT NULL,
  `Course_EName` varchar(250) DEFAULT NULL,
  `Link_Grade` varchar(250) DEFAULT NULL,
  `Link_MajorIDs` mediumtext,
  `ProDire` varchar(250) DEFAULT NULL,
  `ProDire01` varchar(250) DEFAULT NULL,
  `ProDire02` varchar(250) DEFAULT NULL,
  `ProDire03` varchar(250) DEFAULT NULL,
  `ProDire04` varchar(250) DEFAULT NULL,
  `ProDire05` varchar(250) DEFAULT NULL,
  `ProDire06` varchar(250) DEFAULT NULL,
  `Edu_Level` int(10) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_2`
--

DROP TABLE IF EXISTS `cmsware_publish_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_2` (
  `IndexID` int(10) NOT NULL DEFAULT '0',
  `ContentID` int(10) DEFAULT NULL,
  `NodeID` int(10) DEFAULT NULL,
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `SoftSize` varchar(15) DEFAULT NULL,
  `Language` varchar(10) DEFAULT NULL,
  `SoftType` varchar(50) DEFAULT NULL,
  `Environment` varchar(50) DEFAULT NULL,
  `Star` int(2) DEFAULT '0',
  `Developer` varchar(250) DEFAULT NULL,
  `SoftKeywords` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `Download` mediumtext,
  `Photo` varchar(250) DEFAULT NULL,
  `LocalUpload` varchar(250) DEFAULT NULL,
  `CustomSoftLinks` mediumtext,
  `CustomLinks` mediumtext,
  `SchoolID` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_3`
--

DROP TABLE IF EXISTS `cmsware_publish_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_3` (
  `IndexID` int(10) NOT NULL DEFAULT '0',
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `S_Name` varchar(250) DEFAULT NULL,
  `E_Name` varchar(250) DEFAULT NULL,
  `E_letter` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` longtext,
  `S_Url` varchar(250) DEFAULT NULL,
  `Telephone` mediumtext,
  `Address` varchar(250) DEFAULT NULL,
  `Post` varchar(250) DEFAULT NULL,
  `Times_Pm` varchar(250) DEFAULT NULL,
  `Wb_Pm` varchar(250) DEFAULT NULL,
  `Jrsb_Pm` varchar(250) DEFAULT NULL,
  `Uker_Pm` varchar(250) DEFAULT NULL,
  `Area` varchar(250) DEFAULT NULL,
  `City` text,
  `Life_Fear` varchar(250) DEFAULT NULL,
  `Jyl` varchar(250) DEFAULT NULL,
  `Hwxsbl` varchar(250) DEFAULT NULL,
  `Map` varchar(250) DEFAULT NULL,
  `Jyzx_Link` varchar(250) DEFAULT NULL,
  `AlumniURL` varchar(250) DEFAULT NULL,
  `Content` varchar(250) DEFAULT NULL,
  `ApplyFee` varchar(250) DEFAULT NULL,
  `TSRate` varchar(250) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  `Times_sort` varchar(250) DEFAULT NULL,
  `biz_agent` mediumtext,
  `AlumniCode` mediumtext,
  `BBSCode` mediumtext,
  `AgentID` varchar(250) DEFAULT NULL,
  `CourseType` varchar(250) DEFAULT NULL,
  `Comment_1` mediumtext,
  `Comment_2` mediumtext,
  `BBSCommURL` varchar(250) DEFAULT NULL,
  `Intro_s` mediumtext,
  `E_Name_s` varchar(250) DEFAULT NULL,
  `Times_Pm_2002` varchar(250) DEFAULT NULL,
  `Times_Pm_2003` varchar(250) DEFAULT NULL,
  `Times_Pm_2004` varchar(250) DEFAULT NULL,
  `Times_Pm_2005` varchar(250) DEFAULT NULL,
  `Times_Pm_2006` varchar(250) DEFAULT NULL,
  `Times_Pm_2007` varchar(250) DEFAULT NULL,
  `Times_Pm_2008` varchar(250) DEFAULT NULL,
  `Times_Pm_2009` varchar(250) DEFAULT NULL,
  `Times_Pm_2001` varchar(250) DEFAULT NULL,
  `Times_Pm_2000` varchar(250) DEFAULT NULL,
  `Times_Pm_2010` varchar(250) DEFAULT NULL,
  `Times_Pm_2011` varchar(250) DEFAULT NULL,
  `Times_Pm_2012` varchar(250) DEFAULT NULL,
  `coord_longitude` varchar(250) DEFAULT NULL,
  `coord_latitude` varchar(250) DEFAULT NULL,
  `QQgroup` varchar(250) DEFAULT NULL,
  `Tips` mediumtext,
  `Times_Pm_2013` varchar(250) DEFAULT NULL,
  `Times_Pm_2014` varchar(250) DEFAULT NULL,
  `Times_Pm_2015` varchar(250) DEFAULT NULL,
  `Intro_m` mediumtext,
  `country` varchar(250) DEFAULT NULL,
  `Edu_Level` varchar(250) DEFAULT NULL,
  `Nature` varchar(250) DEFAULT NULL,
  `IsPublic` varchar(250) DEFAULT NULL,
  `Lodge_Rules` text,
  `Scholarship` varchar(250) DEFAULT NULL,
  `Grade_Enter` varchar(250) DEFAULT NULL,
  `A_Ratio` varchar(20) DEFAULT NULL,
  `IsBoarder` varchar(250) DEFAULT NULL,
  `Students_Amount` varchar(250) DEFAULT NULL,
  `C_Students_Amount` varchar(250) DEFAULT NULL,
  `Chinese_A_Ratio` varchar(250) DEFAULT NULL,
  `Ib_Course` varchar(250) DEFAULT NULL,
  `Apply_Age_Begin` varchar(250) DEFAULT NULL,
  `Ielts_Score` varchar(250) DEFAULT NULL,
  `Toefl_Score` varchar(250) DEFAULT NULL,
  `Sat_Score` varchar(250) DEFAULT NULL,
  `Tuition` varchar(250) DEFAULT NULL,
  `Global_Pm` varchar(250) DEFAULT NULL,
  `Apply_Age_End` varchar(250) DEFAULT NULL,
  `Building_Time` text,
  `Intro_Location` mediumtext,
  `Intro_History` mediumtext,
  `Intro_Feature` mediumtext,
  `Intro_CollegeFeature` mediumtext,
  `Intro_Facility` mediumtext,
  `Intro_Accommodation` mediumtext,
  `mStar_5` text,
  `mstar_4` text,
  `mstar_3` text,
  `mStar_2` text,
  `mStar_1` text,
  `rec_reason` text,
  `food_info` text,
  `jyqj` text,
  `jxj_info` text,
  `famous_alumni` varchar(250) DEFAULT NULL,
  `checkCity` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `log2` varchar(250) DEFAULT NULL,
  `recommend_sort` varchar(250) DEFAULT NULL,
  `recommend_tag` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_4`
--

DROP TABLE IF EXISTS `cmsware_publish_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_4` (
  `IndexID` int(10) NOT NULL DEFAULT '0',
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `Z_Name` varchar(250) DEFAULT NULL,
  `Z_E_Name` varchar(250) DEFAULT NULL,
  `SchoolID` int(10) DEFAULT NULL,
  `DegreeType` varchar(250) DEFAULT NULL,
  `DegreeType01` varchar(250) DEFAULT NULL,
  `DegreeType02` varchar(250) DEFAULT NULL,
  `DegreeType03` varchar(250) DEFAULT NULL,
  `DegreeType04` varchar(250) DEFAULT NULL,
  `ProDire` varchar(36) DEFAULT NULL,
  `ProDire01` varchar(36) DEFAULT NULL,
  `ProDire02` varchar(36) DEFAULT NULL,
  `ProDire03` varchar(36) DEFAULT NULL,
  `ProDire04` varchar(36) DEFAULT NULL,
  `MajorFW` varchar(1) DEFAULT NULL,
  `MajorUrl` varchar(250) DEFAULT NULL,
  `DegreeType05` varchar(250) DEFAULT NULL,
  `DegreeType06` varchar(250) DEFAULT NULL,
  `Z_E_Name_s` varchar(250) DEFAULT NULL,
  `ProDire05` varchar(36) DEFAULT NULL,
  `ProDire06` varchar(36) DEFAULT NULL,
  `Editor` varchar(250) DEFAULT NULL,
  `Edu_Level` int(10) DEFAULT NULL,
  `Data_Direction` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `链接专业ids` mediumtext,
  `open_time` varchar(250) DEFAULT NULL,
  `close_time` varchar(250) DEFAULT NULL,
  `run_time` varchar(250) DEFAULT NULL,
  `require_score` varchar(250) DEFAULT NULL,
  `require_listen` varchar(250) DEFAULT NULL,
  `require_speak` varchar(250) DEFAULT NULL,
  `require_read` varchar(250) DEFAULT NULL,
  `require_write` varchar(250) DEFAULT NULL,
  `cost` varchar(250) DEFAULT NULL,
  `mark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`),
  KEY `MajorFW` (`MajorFW`),
  KEY `SchoolID` (`SchoolID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_5`
--

DROP TABLE IF EXISTS `cmsware_publish_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_5` (
  `IndexID` int(10) NOT NULL DEFAULT '0',
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `CompanyName` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` mediumtext,
  `Area` varchar(250) DEFAULT NULL,
  `Country` varchar(250) DEFAULT NULL,
  `Province` varchar(250) DEFAULT NULL,
  `City` varchar(250) DEFAULT NULL,
  `Auth` varchar(250) DEFAULT NULL,
  `Telephone` varchar(250) DEFAULT NULL,
  `Fax` varchar(250) DEFAULT NULL,
  `E-mail` varchar(250) DEFAULT NULL,
  `SiteURL` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Postcode` varchar(250) DEFAULT NULL,
  `Feature` mediumtext,
  `Map` varchar(250) DEFAULT NULL,
  `Schools` mediumtext,
  `UkerAward` varchar(250) DEFAULT NULL,
  `TrustPoint` varchar(250) DEFAULT NULL,
  `ApplyNum` varchar(250) DEFAULT NULL,
  `VisaNum` varchar(250) DEFAULT NULL,
  `parent_id` varchar(250) DEFAULT NULL,
  `QQ` varchar(250) DEFAULT NULL,
  `MemberSince` varchar(250) DEFAULT NULL,
  `TopSchools` varchar(250) DEFAULT NULL,
  `Contact` varchar(250) DEFAULT NULL,
  `TrustPoint_plus` varchar(250) DEFAULT NULL,
  `BlogURL` varchar(250) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  `blogcode` mediumtext,
  `MSN` varchar(250) DEFAULT NULL,
  `UkerCeitified` varchar(1) DEFAULT NULL,
  `AvgRanking` varchar(250) DEFAULT NULL,
  `pic1` varchar(250) DEFAULT NULL,
  `pic2` varchar(250) DEFAULT NULL,
  `pic3` varchar(250) DEFAULT NULL,
  `Avatar` varchar(250) DEFAULT NULL,
  `Gender` varchar(250) DEFAULT NULL,
  `Position` varchar(250) DEFAULT NULL,
  `Department` varchar(250) DEFAULT NULL,
  `College` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_6`
--

DROP TABLE IF EXISTS `cmsware_publish_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_6` (
  `IndexID` int(10) NOT NULL DEFAULT '0',
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `score_TOEFL` varchar(250) DEFAULT NULL,
  `score_IELTS` varchar(250) DEFAULT NULL,
  `score_GMAT` varchar(250) DEFAULT NULL,
  `GotOffer` varchar(250) DEFAULT NULL,
  `ApplySchool_id` int(10) DEFAULT NULL,
  `ApplySchool_Name` varchar(250) DEFAULT NULL,
  `UserFullname` varchar(250) DEFAULT NULL,
  `gra_SchoolName` varchar(250) DEFAULT NULL,
  `gra_Specialty` varchar(250) DEFAULT NULL,
  `gra_Degree` varchar(250) DEFAULT NULL,
  `gra_AvgScore` varchar(250) DEFAULT NULL,
  `gra_Time` varchar(250) DEFAULT NULL,
  `UserGender` varchar(250) DEFAULT NULL,
  `UserAge` varchar(250) DEFAULT NULL,
  `UserProvince` varchar(250) DEFAULT NULL,
  `UserCity` varchar(250) DEFAULT NULL,
  `UserTel` varchar(250) DEFAULT NULL,
  `UserEmail` varchar(250) DEFAULT NULL,
  `ApplySchool_Specialty` varchar(250) DEFAULT NULL,
  `Apply_Degree` varchar(250) DEFAULT NULL,
  `ApplySchool_Spec` varchar(250) DEFAULT NULL,
  `UserQQ` varchar(250) DEFAULT NULL,
  `UserMSN` varchar(250) DEFAULT NULL,
  `matriculate_year` varchar(250) DEFAULT NULL,
  `matriculate_season` varchar(250) DEFAULT NULL,
  `other_school` mediumtext,
  `Calltime` varchar(250) DEFAULT NULL,
  `through` varchar(250) DEFAULT NULL,
  `channel` varchar(250) DEFAULT NULL,
  `Apply_country` varchar(250) DEFAULT NULL,
  `parentFullname` varchar(250) DEFAULT NULL,
  `gra_Time_month` varchar(250) DEFAULT NULL,
  `businesschannel` varchar(250) DEFAULT NULL,
  `Apply_country_bx` varchar(250) DEFAULT NULL,
  `other_rejection` mediumtext,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_7`
--

DROP TABLE IF EXISTS `cmsware_publish_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_7` (
  `IndexID` int(10) NOT NULL DEFAULT '0',
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `SchoolID` mediumtext,
  `AgentID` varchar(250) DEFAULT NULL,
  `AgentCountry` varchar(250) DEFAULT NULL,
  `AgentProvince` varchar(250) DEFAULT NULL,
  `AgentCity` varchar(250) DEFAULT NULL,
  `AgentName` varchar(250) DEFAULT NULL,
  `FullName` varchar(250) DEFAULT NULL,
  `Gender` varchar(250) DEFAULT NULL,
  `Age` varchar(250) DEFAULT NULL,
  `Tel` varchar(250) DEFAULT NULL,
  `E-mail` varchar(250) DEFAULT NULL,
  `Province` varchar(250) DEFAULT NULL,
  `City` varchar(250) DEFAULT NULL,
  `IELTS` varchar(250) DEFAULT NULL,
  `GSchool` varchar(250) DEFAULT NULL,
  `GSpecialty` varchar(250) DEFAULT NULL,
  `AvgScore` varchar(250) DEFAULT NULL,
  `OfferSpecialtyID` varchar(250) DEFAULT NULL,
  `OfferSpecialtyType` varchar(250) DEFAULT NULL,
  `OfferDegree` varchar(250) DEFAULT NULL,
  `OfferTime` varchar(250) DEFAULT NULL,
  `OfferDoc` varchar(250) DEFAULT NULL,
  `through` varchar(250) DEFAULT NULL,
  `VisaExpire` varchar(250) DEFAULT NULL,
  `VisaType` varchar(250) DEFAULT NULL,
  `SchoolName` varchar(250) DEFAULT NULL,
  `UserID` varchar(10) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `msn` varchar(250) DEFAULT NULL,
  `yahoo` varchar(250) DEFAULT NULL,
  `OfferNo` varchar(250) DEFAULT NULL,
  `LeavingTime` varchar(250) DEFAULT NULL,
  `LeavingProvince` varchar(250) DEFAULT NULL,
  `LeavingCity` varchar(250) DEFAULT NULL,
  `Privacy` mediumtext,
  `Birthday` varchar(250) DEFAULT NULL,
  `Matriculate` varchar(250) DEFAULT NULL,
  `QQ` varchar(250) DEFAULT NULL,
  `add` varchar(250) DEFAULT NULL,
  `otheroffer` text,
  `otherrejection` text,
  `visainfo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_8`
--

DROP TABLE IF EXISTS `cmsware_publish_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_8` (
  `IndexID` int(10) NOT NULL,
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `AgentID` varchar(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Intro` text,
  `Personal` mediumtext,
  `Fullname` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_9`
--

DROP TABLE IF EXISTS `cmsware_publish_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_9` (
  `IndexID` int(10) NOT NULL,
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `S_Name` varchar(250) DEFAULT NULL,
  `E_Name` varchar(250) DEFAULT NULL,
  `E_Name_s` varchar(250) DEFAULT NULL,
  `E_Name_standard` varchar(250) DEFAULT NULL,
  `E_letter` varchar(250) DEFAULT NULL,
  `Logo` varchar(250) DEFAULT NULL,
  `Intro` longtext,
  `Intro_s` text,
  `Tips` mediumtext,
  `QQgroup` varchar(250) DEFAULT NULL,
  `foundtime` int(10) DEFAULT NULL,
  `nature` text,
  `type` text,
  `students` varchar(250) DEFAULT NULL,
  `undergraduate_studen` varchar(250) DEFAULT NULL,
  `international_studen` varchar(250) DEFAULT NULL,
  `admission_rate` varchar(250) DEFAULT NULL,
  `tuition` int(10) DEFAULT NULL,
  `Life_Fear` varchar(250) DEFAULT NULL,
  `scholarship` varchar(250) DEFAULT NULL,
  `toefl` int(10) DEFAULT NULL,
  `sat` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  `state_s` varchar(250) DEFAULT NULL,
  `City` text,
  `Map` varchar(250) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Post` varchar(250) DEFAULT NULL,
  `Telephone` text,
  `S_Url` varchar(250) DEFAULT NULL,
  `coord_longitude` varchar(250) DEFAULT NULL,
  `coord_latitude` varchar(250) DEFAULT NULL,
  `USnews_Pm` int(10) DEFAULT NULL,
  `USnews_Pm_2015` int(10) DEFAULT NULL,
  `USnews_Pm_2014` int(10) DEFAULT NULL,
  `USnews_Pm_2013` int(10) DEFAULT NULL,
  `USnews_Pm_2012` int(10) DEFAULT NULL,
  `USnews_Pm_2011` int(10) DEFAULT NULL,
  `ARWU_Pm_2014` int(10) DEFAULT NULL,
  `ARWU_Pm_2013` int(10) DEFAULT NULL,
  `ARWU_Pm_2012` int(10) DEFAULT NULL,
  `ARWU_Pm_2011` int(10) DEFAULT NULL,
  `ARWU_Pm_2010` int(10) DEFAULT NULL,
  `BonusHits` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_log`
--

DROP TABLE IF EXISTS `cmsware_publish_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_log` (
  `logID` int(8) NOT NULL AUTO_INCREMENT,
  `ContentID` int(10) NOT NULL DEFAULT '0',
  `NodeID` int(10) NOT NULL DEFAULT '0',
  `PSN` varchar(50) DEFAULT NULL,
  `FileName` varchar(100) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `URL` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`logID`,`ContentID`,`NodeID`),
  UNIQUE KEY `logID` (`logID`),
  KEY `C_P_F` (`ContentID`,`PSN`,`FileName`)
) ENGINE=MyISAM AUTO_INCREMENT=188755 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_publish_log2`
--

DROP TABLE IF EXISTS `cmsware_publish_log2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_publish_log2` (
  `logID` int(8) NOT NULL AUTO_INCREMENT,
  `ContentID` int(10) NOT NULL DEFAULT '0',
  `NodeID` int(10) NOT NULL DEFAULT '0',
  `PSN` varchar(50) DEFAULT NULL,
  `FileName` varchar(100) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `URL` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`logID`,`ContentID`,`NodeID`),
  UNIQUE KEY `logID` (`logID`),
  KEY `C_P_F` (`ContentID`,`PSN`,`FileName`)
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_resource`
--

DROP TABLE IF EXISTS `cmsware_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_resource` (
  `ResourceID` int(10) NOT NULL AUTO_INCREMENT,
  `NodeID` int(10) NOT NULL DEFAULT '0',
  `ParentID` int(10) DEFAULT '0',
  `Type` tinyint(1) DEFAULT '1',
  `Category` varchar(20) DEFAULT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `Path` varchar(250) DEFAULT NULL,
  `Size` int(10) DEFAULT NULL,
  `Info` varchar(250) DEFAULT NULL,
  `CreationDate` int(10) DEFAULT NULL,
  `ModifiedDate` int(10) DEFAULT NULL,
  `Src` varchar(250) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `CreationUserID` int(8) DEFAULT '0',
  PRIMARY KEY (`ResourceID`,`NodeID`),
  KEY `Path` (`Path`),
  KEY `Name` (`Name`),
  KEY `Src` (`Src`),
  KEY `Category` (`Category`),
  KEY `CUID` (`CreationUserID`)
) ENGINE=MyISAM AUTO_INCREMENT=65384 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_resource_ref`
--

DROP TABLE IF EXISTS `cmsware_resource_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_resource_ref` (
  `NodeID` int(10) DEFAULT '0',
  `IndexID` int(10) DEFAULT '0',
  `ResourceID` int(10) DEFAULT '0',
  `CollectionKey` char(32) DEFAULT NULL,
  KEY `I_R` (`IndexID`,`ResourceID`),
  KEY `N_I_R` (`NodeID`,`IndexID`,`ResourceID`),
  KEY `R_C` (`ResourceID`,`CollectionKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_sessions`
--

DROP TABLE IF EXISTS `cmsware_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_sessions` (
  `sId` varchar(32) NOT NULL DEFAULT '',
  `sIpAddress` varchar(16) DEFAULT NULL,
  `sUserName` varchar(32) DEFAULT NULL,
  `sUId` int(8) DEFAULT '0',
  `sLogInTime` int(10) DEFAULT '0',
  `sRunningTime` int(10) DEFAULT '0',
  PRIMARY KEY (`sId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_site`
--

DROP TABLE IF EXISTS `cmsware_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_site` (
  `NodeID` int(10) NOT NULL AUTO_INCREMENT,
  `NodeGUID` varchar(250) DEFAULT NULL,
  `TableID` int(8) DEFAULT '0',
  `ParentID` int(10) DEFAULT NULL,
  `RootID` int(10) DEFAULT '0',
  `InheritNodeID` int(8) DEFAULT '0',
  `NodeType` tinyint(1) DEFAULT '1',
  `NodeSort` tinyint(5) DEFAULT '0',
  `Name` varchar(250) DEFAULT NULL,
  `ContentPSN` varchar(250) DEFAULT NULL,
  `ContentURL` varchar(250) DEFAULT NULL,
  `ResourcePSN` varchar(250) DEFAULT NULL,
  `ResourceURL` varchar(250) DEFAULT NULL,
  `PublishMode` tinyint(1) DEFAULT '1',
  `IndexTpl` varchar(250) DEFAULT NULL,
  `IndexName` varchar(250) DEFAULT NULL,
  `ContentTpl` varchar(250) DEFAULT NULL,
  `ImageTpl` varchar(250) DEFAULT NULL,
  `SubDir` varchar(20) DEFAULT NULL,
  `PublishFileFormat` varchar(250) DEFAULT NULL,
  `IsComment` tinyint(1) DEFAULT '0',
  `CommentLength` int(10) DEFAULT NULL,
  `IsPrint` tinyint(1) DEFAULT '0',
  `IsGrade` tinyint(1) DEFAULT '0',
  `IsMail` tinyint(1) DEFAULT '0',
  `Disabled` tinyint(1) DEFAULT '0',
  `AutoPublish` tinyint(1) DEFAULT '1',
  `IndexPortalURL` varchar(250) DEFAULT NULL,
  `ContentPortalURL` varchar(250) DEFAULT NULL,
  `Pager` varchar(20) DEFAULT NULL,
  `Editor` varchar(50) DEFAULT NULL,
  `WorkFlow` int(8) DEFAULT '0',
  `PermissionManageG` mediumtext,
  `PermissionManageU` mediumtext,
  `PermissionReadG` mediumtext,
  `PermissionReadU` mediumtext,
  `PermissionWriteG` mediumtext,
  `PermissionWriteU` mediumtext,
  `PermissionApproveG` mediumtext,
  `PermissionApproveU` mediumtext,
  `PermissionPublishG` mediumtext,
  `PermissionPublishU` mediumtext,
  `PermissionInherit` mediumtext,
  `CreationUserID` int(8) DEFAULT NULL,
  `note` text,
  UNIQUE KEY `NodeID` (`NodeID`),
  KEY `P_D` (`ParentID`,`Disabled`),
  KEY `D` (`Disabled`),
  KEY `InheritNodeID` (`InheritNodeID`)
) ENGINE=MyISAM AUTO_INCREMENT=478 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_sys`
--

DROP TABLE IF EXISTS `cmsware_sys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_sys` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `varName` varchar(50) DEFAULT NULL,
  `varValue` text,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `var` (`varName`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_tasks`
--

DROP TABLE IF EXISTS `cmsware_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_tasks` (
  `TaskID` varchar(32) DEFAULT NULL,
  `TaskData` longblob,
  `TaskTime` int(10) DEFAULT '0',
  KEY `TID` (`TaskID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_tpl_cate`
--

DROP TABLE IF EXISTS `cmsware_tpl_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_tpl_cate` (
  `TCID` int(10) NOT NULL AUTO_INCREMENT,
  `CateName` varchar(50) DEFAULT NULL,
  `ParentTCID` int(10) DEFAULT '0',
  `ReadG` text,
  `WriteG` text,
  `ManageG` text,
  `ReadU` text,
  `WriteU` text,
  `ManageU` text,
  `Inherit` tinyint(1) DEFAULT '0',
  `CreationUserID` int(8) DEFAULT NULL,
  PRIMARY KEY (`TCID`),
  KEY `ParentTCID` (`ParentTCID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_tpl_data`
--

DROP TABLE IF EXISTS `cmsware_tpl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_tpl_data` (
  `TID` int(11) NOT NULL AUTO_INCREMENT,
  `TCID` int(10) DEFAULT '0',
  `TplName` varchar(50) DEFAULT NULL,
  `TplType` int(3) DEFAULT '0',
  `CreationUserID` int(5) DEFAULT NULL,
  `LastModifiedUserID` int(5) DEFAULT NULL,
  `CreationDate` int(10) DEFAULT NULL,
  `ModifiedDate` int(10) DEFAULT NULL,
  PRIMARY KEY (`TID`),
  KEY `NodeID` (`TCID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_tpl_vars`
--

DROP TABLE IF EXISTS `cmsware_tpl_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_tpl_vars` (
  `Id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `VarTitle` varchar(250) DEFAULT NULL,
  `VarName` varchar(50) DEFAULT NULL,
  `VarValue` text,
  `IsGlobal` tinyint(1) DEFAULT '1',
  `NodeScope` text,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_user`
--

DROP TABLE IF EXISTS `cmsware_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_user` (
  `uId` mediumint(10) NOT NULL AUTO_INCREMENT,
  `uGId` mediumint(8) DEFAULT '0',
  `uName` varchar(50) DEFAULT NULL,
  `uPass` varchar(32) DEFAULT NULL,
  `uInfo` text,
  `LastLoginDate` int(10) DEFAULT '0',
  `ApproveNum` int(8) DEFAULT '0',
  `ContributionNum` int(8) DEFAULT '0',
  `CallBackNum` int(8) DEFAULT '0',
  `NoContributionNum` int(8) DEFAULT '0',
  `CreationUserID` mediumint(8) DEFAULT NULL,
  UNIQUE KEY `uId` (`uId`),
  UNIQUE KEY `uName` (`uName`),
  KEY `uGId` (`uGId`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_workflow`
--

DROP TABLE IF EXISTS `cmsware_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_workflow` (
  `wID` int(8) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `Intro` text,
  PRIMARY KEY (`wID`),
  UNIQUE KEY `wID` (`wID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_workflow_record`
--

DROP TABLE IF EXISTS `cmsware_workflow_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_workflow_record` (
  `OpID` int(8) NOT NULL AUTO_INCREMENT,
  `wID` int(8) DEFAULT NULL,
  `Executor` int(8) DEFAULT NULL,
  `OpName` varchar(50) DEFAULT NULL,
  `StateBeforeOp` varchar(100) DEFAULT NULL,
  `StateAfterOp` varchar(100) DEFAULT NULL,
  `AppendNote` int(1) DEFAULT '0',
  `OpIntro` text,
  PRIMARY KEY (`OpID`),
  UNIQUE KEY `OpID` (`OpID`),
  KEY `wID` (`wID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmsware_workflow_state`
--

DROP TABLE IF EXISTS `cmsware_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsware_workflow_state` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `Name` char(30) DEFAULT NULL,
  `State` int(5) DEFAULT NULL,
  `System` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `State` (`State`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article`
--

DROP TABLE IF EXISTS `pe_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article` (
  `ArticleID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassID` int(10) DEFAULT NULL,
  `SpecialID` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleIntact` varchar(255) DEFAULT NULL,
  `Subheading` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `CopyFrom` varchar(255) DEFAULT NULL,
  `Inputer` varchar(20) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Keyword` varchar(255) DEFAULT NULL,
  `Hits` int(10) DEFAULT NULL,
  `UpdateTime` timestamp NULL DEFAULT NULL,
  `Hot` bit(1) NOT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` text,
  `IncludePic` int(10) DEFAULT NULL,
  `DefaultPicUrl` varchar(255) DEFAULT NULL,
  `UploadFiles` text,
  `ReadPoint` int(10) DEFAULT NULL,
  `PaginationType` int(10) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `TitleFontColor` varchar(7) DEFAULT NULL,
  `TitleFontType` int(10) DEFAULT NULL,
  `MaxCharPerPage` int(10) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) NOT NULL,
  `ReceiveUser` text,
  `Received` text,
  `AutoReceiveTime` int(10) DEFAULT NULL,
  `ReceiveType` int(10) DEFAULT NULL,
  `Intro` text,
  `PresentExp` int(10) DEFAULT NULL,
  `Copymoney` decimal(19,4) DEFAULT NULL,
  `IsPayed` bit(1) NOT NULL,
  `Beneficiary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Author` (`Author`),
  KEY `Beneficiary` (`Beneficiary`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassID` (`ClassID`),
  KEY `Deleted` (`Deleted`),
  KEY `Hits` (`Hits`),
  KEY `Inputer` (`Inputer`),
  KEY `IsPayed` (`IsPayed`),
  KEY `Keyword` (`Keyword`),
  KEY `OnTop` (`OnTop`),
  KEY `Passed` (`Passed`),
  KEY `SkinID` (`SkinID`),
  KEY `SpecialID` (`SpecialID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `UpdateTime` (`UpdateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article_1`
--

DROP TABLE IF EXISTS `pe_article_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article_1` (
  `ArticleID` int(11) NOT NULL,
  `ChannelID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `SpecialID` int(11) NOT NULL,
  `Title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `TitleIntact` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Subheading` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Author` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CopyFrom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Inputer` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `LinkUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Editor` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Keyword` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Hits` int(11) NOT NULL,
  `UpdateTime` datetime NOT NULL,
  `Hot` bit(1) DEFAULT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` longtext CHARACTER SET utf8 NOT NULL,
  `IncludePic` int(11) NOT NULL DEFAULT '0',
  `DefaultPicUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `UploadFiles` longtext CHARACTER SET utf8,
  `ReadPoint` int(11) DEFAULT NULL,
  `PaginationType` int(11) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL DEFAULT b'0',
  `SkinID` int(11) DEFAULT NULL,
  `TemplateID` int(11) DEFAULT NULL,
  `Stars` int(11) DEFAULT NULL,
  `TitleFontColor` varchar(7) CHARACTER SET utf8 DEFAULT NULL,
  `TitleFontType` int(11) DEFAULT NULL,
  `MaxCharPerPage` int(11) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) DEFAULT NULL,
  `ReceiveUser` longtext CHARACTER SET utf8,
  `Received` longtext CHARACTER SET utf8,
  `AutoReceiveTime` int(11) DEFAULT '0',
  `ReceiveType` int(11) DEFAULT '0',
  `Intro` longtext CHARACTER SET utf8,
  `PresentExp` int(11) DEFAULT '0',
  `Copymoney` decimal(19,4) DEFAULT '0.0000',
  `IsPayed` bit(1) DEFAULT NULL,
  `Beneficiary` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article_110819`
--

DROP TABLE IF EXISTS `pe_article_110819`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article_110819` (
  `ArticleID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassID` int(10) DEFAULT NULL,
  `SpecialID` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleIntact` varchar(255) DEFAULT NULL,
  `Subheading` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `CopyFrom` varchar(255) DEFAULT NULL,
  `Inputer` varchar(20) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Keyword` varchar(255) DEFAULT NULL,
  `Hits` int(10) DEFAULT NULL,
  `UpdateTime` timestamp NULL DEFAULT NULL,
  `Hot` bit(1) NOT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` text,
  `IncludePic` int(10) DEFAULT NULL,
  `DefaultPicUrl` varchar(255) DEFAULT NULL,
  `UploadFiles` text,
  `ReadPoint` int(10) DEFAULT NULL,
  `PaginationType` int(10) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `TitleFontColor` varchar(7) DEFAULT NULL,
  `TitleFontType` int(10) DEFAULT NULL,
  `MaxCharPerPage` int(10) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) NOT NULL,
  `ReceiveUser` text,
  `Received` text,
  `AutoReceiveTime` int(10) DEFAULT NULL,
  `ReceiveType` int(10) DEFAULT NULL,
  `Intro` text,
  `PresentExp` int(10) DEFAULT NULL,
  `Copymoney` decimal(19,4) DEFAULT NULL,
  `IsPayed` bit(1) NOT NULL,
  `Beneficiary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Author` (`Author`),
  KEY `Beneficiary` (`Beneficiary`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassID` (`ClassID`),
  KEY `Deleted` (`Deleted`),
  KEY `Hits` (`Hits`),
  KEY `Inputer` (`Inputer`),
  KEY `IsPayed` (`IsPayed`),
  KEY `Keyword` (`Keyword`),
  KEY `OnTop` (`OnTop`),
  KEY `Passed` (`Passed`),
  KEY `SkinID` (`SkinID`),
  KEY `SpecialID` (`SpecialID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `UpdateTime` (`UpdateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article_110830`
--

DROP TABLE IF EXISTS `pe_article_110830`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article_110830` (
  `ArticleID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassID` int(10) DEFAULT NULL,
  `SpecialID` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleIntact` varchar(255) DEFAULT NULL,
  `Subheading` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `CopyFrom` varchar(255) DEFAULT NULL,
  `Inputer` varchar(20) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Keyword` varchar(255) DEFAULT NULL,
  `Hits` int(10) DEFAULT NULL,
  `UpdateTime` timestamp NULL DEFAULT NULL,
  `Hot` bit(1) NOT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` text,
  `IncludePic` int(10) DEFAULT NULL,
  `DefaultPicUrl` varchar(255) DEFAULT NULL,
  `UploadFiles` text,
  `ReadPoint` int(10) DEFAULT NULL,
  `PaginationType` int(10) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `TitleFontColor` varchar(7) DEFAULT NULL,
  `TitleFontType` int(10) DEFAULT NULL,
  `MaxCharPerPage` int(10) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) NOT NULL,
  `ReceiveUser` text,
  `Received` text,
  `AutoReceiveTime` int(10) DEFAULT NULL,
  `ReceiveType` int(10) DEFAULT NULL,
  `Intro` text,
  `PresentExp` int(10) DEFAULT NULL,
  `Copymoney` decimal(19,4) DEFAULT NULL,
  `IsPayed` bit(1) NOT NULL,
  `Beneficiary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Author` (`Author`),
  KEY `Beneficiary` (`Beneficiary`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassID` (`ClassID`),
  KEY `Deleted` (`Deleted`),
  KEY `Hits` (`Hits`),
  KEY `Inputer` (`Inputer`),
  KEY `IsPayed` (`IsPayed`),
  KEY `Keyword` (`Keyword`),
  KEY `OnTop` (`OnTop`),
  KEY `Passed` (`Passed`),
  KEY `SkinID` (`SkinID`),
  KEY `SpecialID` (`SpecialID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `UpdateTime` (`UpdateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article_2`
--

DROP TABLE IF EXISTS `pe_article_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article_2` (
  `ArticleID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassID` int(10) DEFAULT NULL,
  `SpecialID` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleIntact` varchar(255) DEFAULT NULL,
  `Subheading` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `CopyFrom` varchar(255) DEFAULT NULL,
  `Inputer` varchar(20) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Keyword` varchar(255) DEFAULT NULL,
  `Hits` int(10) DEFAULT NULL,
  `UpdateTime` timestamp NULL DEFAULT NULL,
  `Hot` bit(1) NOT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` text,
  `IncludePic` int(10) DEFAULT NULL,
  `DefaultPicUrl` varchar(255) DEFAULT NULL,
  `UploadFiles` text,
  `ReadPoint` int(10) DEFAULT NULL,
  `PaginationType` int(10) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `TitleFontColor` varchar(7) DEFAULT NULL,
  `TitleFontType` int(10) DEFAULT NULL,
  `MaxCharPerPage` int(10) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) NOT NULL,
  `ReceiveUser` text,
  `Received` text,
  `AutoReceiveTime` int(10) DEFAULT NULL,
  `ReceiveType` int(10) DEFAULT NULL,
  `Intro` text,
  `PresentExp` int(10) DEFAULT NULL,
  `Copymoney` decimal(19,4) DEFAULT NULL,
  `IsPayed` bit(1) NOT NULL,
  `Beneficiary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Author` (`Author`),
  KEY `Beneficiary` (`Beneficiary`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassID` (`ClassID`),
  KEY `Deleted` (`Deleted`),
  KEY `Hits` (`Hits`),
  KEY `Inputer` (`Inputer`),
  KEY `IsPayed` (`IsPayed`),
  KEY `Keyword` (`Keyword`),
  KEY `OnTop` (`OnTop`),
  KEY `Passed` (`Passed`),
  KEY `SkinID` (`SkinID`),
  KEY `SpecialID` (`SpecialID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `UpdateTime` (`UpdateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article_3`
--

DROP TABLE IF EXISTS `pe_article_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article_3` (
  `ArticleID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassID` int(10) DEFAULT NULL,
  `SpecialID` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleIntact` varchar(255) DEFAULT NULL,
  `Subheading` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `CopyFrom` varchar(255) DEFAULT NULL,
  `Inputer` varchar(20) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Keyword` varchar(255) DEFAULT NULL,
  `Hits` int(10) DEFAULT NULL,
  `UpdateTime` timestamp NULL DEFAULT NULL,
  `Hot` bit(1) NOT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` text,
  `IncludePic` int(10) DEFAULT NULL,
  `DefaultPicUrl` varchar(255) DEFAULT NULL,
  `UploadFiles` text,
  `ReadPoint` int(10) DEFAULT NULL,
  `PaginationType` int(10) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `TitleFontColor` varchar(7) DEFAULT NULL,
  `TitleFontType` int(10) DEFAULT NULL,
  `MaxCharPerPage` int(10) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) NOT NULL,
  `ReceiveUser` text,
  `Received` text,
  `AutoReceiveTime` int(10) DEFAULT NULL,
  `ReceiveType` int(10) DEFAULT NULL,
  `Intro` text,
  `PresentExp` int(10) DEFAULT NULL,
  `Copymoney` decimal(19,4) DEFAULT NULL,
  `IsPayed` bit(1) NOT NULL,
  `Beneficiary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Author` (`Author`),
  KEY `Beneficiary` (`Beneficiary`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassID` (`ClassID`),
  KEY `Deleted` (`Deleted`),
  KEY `Hits` (`Hits`),
  KEY `Inputer` (`Inputer`),
  KEY `IsPayed` (`IsPayed`),
  KEY `Keyword` (`Keyword`),
  KEY `OnTop` (`OnTop`),
  KEY `Passed` (`Passed`),
  KEY `SkinID` (`SkinID`),
  KEY `SpecialID` (`SpecialID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `UpdateTime` (`UpdateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article_4`
--

DROP TABLE IF EXISTS `pe_article_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article_4` (
  `ArticleID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassID` int(10) DEFAULT NULL,
  `SpecialID` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleIntact` varchar(255) DEFAULT NULL,
  `Subheading` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `CopyFrom` varchar(255) DEFAULT NULL,
  `Inputer` varchar(20) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Keyword` varchar(255) DEFAULT NULL,
  `Hits` int(10) DEFAULT NULL,
  `UpdateTime` timestamp NULL DEFAULT NULL,
  `Hot` bit(1) NOT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` text,
  `IncludePic` int(10) DEFAULT NULL,
  `DefaultPicUrl` varchar(255) DEFAULT NULL,
  `UploadFiles` text,
  `ReadPoint` int(10) DEFAULT NULL,
  `PaginationType` int(10) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `TitleFontColor` varchar(7) DEFAULT NULL,
  `TitleFontType` int(10) DEFAULT NULL,
  `MaxCharPerPage` int(10) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) NOT NULL,
  `ReceiveUser` text,
  `Received` text,
  `AutoReceiveTime` int(10) DEFAULT NULL,
  `ReceiveType` int(10) DEFAULT NULL,
  `Intro` text,
  `PresentExp` int(10) DEFAULT NULL,
  `Copymoney` decimal(19,4) DEFAULT NULL,
  `IsPayed` bit(1) NOT NULL,
  `Beneficiary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Author` (`Author`),
  KEY `Beneficiary` (`Beneficiary`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassID` (`ClassID`),
  KEY `Deleted` (`Deleted`),
  KEY `Hits` (`Hits`),
  KEY `Inputer` (`Inputer`),
  KEY `IsPayed` (`IsPayed`),
  KEY `Keyword` (`Keyword`),
  KEY `OnTop` (`OnTop`),
  KEY `Passed` (`Passed`),
  KEY `SkinID` (`SkinID`),
  KEY `SpecialID` (`SpecialID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `UpdateTime` (`UpdateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article_5`
--

DROP TABLE IF EXISTS `pe_article_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article_5` (
  `ArticleID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassID` int(10) DEFAULT NULL,
  `SpecialID` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleIntact` varchar(255) DEFAULT NULL,
  `Subheading` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `CopyFrom` varchar(255) DEFAULT NULL,
  `Inputer` varchar(20) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Keyword` varchar(255) DEFAULT NULL,
  `Hits` int(10) DEFAULT NULL,
  `UpdateTime` timestamp NULL DEFAULT NULL,
  `Hot` bit(1) NOT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` text,
  `IncludePic` int(10) DEFAULT NULL,
  `DefaultPicUrl` varchar(255) DEFAULT NULL,
  `UploadFiles` text,
  `ReadPoint` int(10) DEFAULT NULL,
  `PaginationType` int(10) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `TitleFontColor` varchar(7) DEFAULT NULL,
  `TitleFontType` int(10) DEFAULT NULL,
  `MaxCharPerPage` int(10) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) NOT NULL,
  `ReceiveUser` text,
  `Received` text,
  `AutoReceiveTime` int(10) DEFAULT NULL,
  `ReceiveType` int(10) DEFAULT NULL,
  `Intro` text,
  `PresentExp` int(10) DEFAULT NULL,
  `Copymoney` decimal(19,4) DEFAULT NULL,
  `IsPayed` bit(1) NOT NULL,
  `Beneficiary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Author` (`Author`),
  KEY `Beneficiary` (`Beneficiary`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassID` (`ClassID`),
  KEY `Deleted` (`Deleted`),
  KEY `Hits` (`Hits`),
  KEY `Inputer` (`Inputer`),
  KEY `IsPayed` (`IsPayed`),
  KEY `Keyword` (`Keyword`),
  KEY `OnTop` (`OnTop`),
  KEY `Passed` (`Passed`),
  KEY `SkinID` (`SkinID`),
  KEY `SpecialID` (`SpecialID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `UpdateTime` (`UpdateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article_6`
--

DROP TABLE IF EXISTS `pe_article_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article_6` (
  `ArticleID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassID` int(10) DEFAULT NULL,
  `SpecialID` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleIntact` varchar(255) DEFAULT NULL,
  `Subheading` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `CopyFrom` varchar(255) DEFAULT NULL,
  `Inputer` varchar(20) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Keyword` varchar(255) DEFAULT NULL,
  `Hits` int(10) DEFAULT NULL,
  `UpdateTime` timestamp NULL DEFAULT NULL,
  `Hot` bit(1) NOT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` text,
  `IncludePic` int(10) DEFAULT NULL,
  `DefaultPicUrl` varchar(255) DEFAULT NULL,
  `UploadFiles` text,
  `ReadPoint` int(10) DEFAULT NULL,
  `PaginationType` int(10) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `TitleFontColor` varchar(7) DEFAULT NULL,
  `TitleFontType` int(10) DEFAULT NULL,
  `MaxCharPerPage` int(10) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) NOT NULL,
  `ReceiveUser` text,
  `Received` text,
  `AutoReceiveTime` int(10) DEFAULT NULL,
  `ReceiveType` int(10) DEFAULT NULL,
  `Intro` text,
  `PresentExp` int(10) DEFAULT NULL,
  `Copymoney` decimal(19,4) DEFAULT NULL,
  `IsPayed` bit(1) NOT NULL,
  `Beneficiary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Author` (`Author`),
  KEY `Beneficiary` (`Beneficiary`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassID` (`ClassID`),
  KEY `Deleted` (`Deleted`),
  KEY `Hits` (`Hits`),
  KEY `Inputer` (`Inputer`),
  KEY `IsPayed` (`IsPayed`),
  KEY `Keyword` (`Keyword`),
  KEY `OnTop` (`OnTop`),
  KEY `Passed` (`Passed`),
  KEY `SkinID` (`SkinID`),
  KEY `SpecialID` (`SpecialID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `UpdateTime` (`UpdateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_article_all_110807`
--

DROP TABLE IF EXISTS `pe_article_all_110807`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_article_all_110807` (
  `ArticleID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassID` int(10) DEFAULT NULL,
  `SpecialID` int(10) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `TitleIntact` varchar(255) DEFAULT NULL,
  `Subheading` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `CopyFrom` varchar(255) DEFAULT NULL,
  `Inputer` varchar(20) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `Editor` varchar(20) DEFAULT NULL,
  `Keyword` varchar(255) DEFAULT NULL,
  `Hits` int(10) DEFAULT NULL,
  `UpdateTime` timestamp NULL DEFAULT NULL,
  `Hot` bit(1) NOT NULL,
  `OnTop` bit(1) NOT NULL,
  `Elite` bit(1) NOT NULL,
  `Passed` bit(1) NOT NULL,
  `Content` text,
  `IncludePic` int(10) DEFAULT NULL,
  `DefaultPicUrl` varchar(255) DEFAULT NULL,
  `UploadFiles` text,
  `ReadPoint` int(10) DEFAULT NULL,
  `PaginationType` int(10) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `Stars` int(10) DEFAULT NULL,
  `TitleFontColor` varchar(7) DEFAULT NULL,
  `TitleFontType` int(10) DEFAULT NULL,
  `MaxCharPerPage` int(10) DEFAULT NULL,
  `ShowCommentLink` bit(1) NOT NULL,
  `Receive` bit(1) NOT NULL,
  `ReceiveUser` text,
  `Received` text,
  `AutoReceiveTime` int(10) DEFAULT NULL,
  `ReceiveType` int(10) DEFAULT NULL,
  `Intro` text,
  `PresentExp` int(10) DEFAULT NULL,
  `Copymoney` decimal(19,4) DEFAULT NULL,
  `IsPayed` bit(1) NOT NULL,
  `Beneficiary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Author` (`Author`),
  KEY `Beneficiary` (`Beneficiary`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassID` (`ClassID`),
  KEY `Deleted` (`Deleted`),
  KEY `Hits` (`Hits`),
  KEY `Inputer` (`Inputer`),
  KEY `IsPayed` (`IsPayed`),
  KEY `Keyword` (`Keyword`),
  KEY `OnTop` (`OnTop`),
  KEY `Passed` (`Passed`),
  KEY `SkinID` (`SkinID`),
  KEY `SpecialID` (`SpecialID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `UpdateTime` (`UpdateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pe_class`
--

DROP TABLE IF EXISTS `pe_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pe_class` (
  `ClassID` int(10) NOT NULL,
  `ChannelID` int(10) DEFAULT NULL,
  `ClassName` varchar(50) DEFAULT NULL,
  `ClassType` int(10) DEFAULT NULL,
  `OpenType` int(10) DEFAULT NULL,
  `ParentID` int(10) DEFAULT NULL,
  `ParentPath` varchar(50) DEFAULT NULL,
  `Depth` int(10) DEFAULT NULL,
  `RootID` int(10) DEFAULT NULL,
  `Child` int(10) DEFAULT NULL,
  `arrChildID` text,
  `PrevID` int(10) DEFAULT NULL,
  `NextID` int(10) DEFAULT NULL,
  `OrderID` int(10) DEFAULT NULL,
  `Readme` varchar(255) DEFAULT NULL,
  `Setting` int(10) DEFAULT NULL,
  `LinkUrl` varchar(255) DEFAULT NULL,
  `ClassPicUrl` varchar(255) DEFAULT NULL,
  `ClassDir` varchar(50) DEFAULT NULL,
  `ParentDir` text,
  `SkinID` int(10) DEFAULT NULL,
  `TemplateID` int(10) DEFAULT NULL,
  `ShowOnTop` bit(1) NOT NULL,
  `ShowOnIndex` bit(1) NOT NULL,
  `IsElite` bit(1) NOT NULL,
  `EnableAdd` bit(1) NOT NULL,
  `EnableProtect` bit(1) NOT NULL,
  `MaxPerPage` int(10) DEFAULT NULL,
  `DefaultItemTemplate` int(10) DEFAULT NULL,
  `DefaultItemSkin` int(10) DEFAULT NULL,
  `ItemListOrderType` int(10) DEFAULT NULL,
  `ItemOpenType` int(10) DEFAULT NULL,
  `ItemCount` int(10) DEFAULT NULL,
  `ClassPurview` tinyint(3) unsigned DEFAULT NULL,
  `EnableComment` bit(1) NOT NULL,
  `CheckComment` bit(1) NOT NULL,
  `PresentExp` int(10) DEFAULT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `ChannelID` (`ChannelID`),
  KEY `ClassType` (`ClassType`),
  KEY `NextID` (`NextID`),
  KEY `OrderID` (`OrderID`),
  KEY `ParentID` (`ParentID`),
  KEY `PrevID` (`PrevID`),
  KEY `RootID` (`RootID`),
  KEY `SkinID` (`SkinID`),
  KEY `TemplateID` (`TemplateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `IndexID` int(10) NOT NULL DEFAULT '0',
  `ContentID` int(10) DEFAULT '0',
  `NodeID` int(10) DEFAULT '0',
  `PublishDate` int(10) DEFAULT NULL,
  `URL` char(250) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `score_TOEFL` varchar(250) DEFAULT NULL,
  `score_IELTS` varchar(250) DEFAULT NULL,
  `score_GMAT` varchar(250) DEFAULT NULL,
  `GotOffer` varchar(250) DEFAULT NULL,
  `ApplySchool_id` int(10) DEFAULT NULL,
  `ApplySchool_Name` varchar(250) DEFAULT NULL,
  `UserFullname` varchar(250) DEFAULT NULL,
  `gra_SchoolName` varchar(250) DEFAULT NULL,
  `gra_Specialty` varchar(250) DEFAULT NULL,
  `gra_Degree` varchar(250) DEFAULT NULL,
  `gra_AvgScore` varchar(250) DEFAULT NULL,
  `gra_Time` varchar(250) DEFAULT NULL,
  `UserGender` varchar(250) DEFAULT NULL,
  `UserAge` varchar(250) DEFAULT NULL,
  `UserProvince` varchar(250) DEFAULT NULL,
  `UserCity` varchar(250) DEFAULT NULL,
  `UserTel` varchar(250) DEFAULT NULL,
  `UserEmail` varchar(250) DEFAULT NULL,
  `ApplySchool_Specialty` varchar(250) DEFAULT NULL,
  `Apply_Degree` varchar(250) DEFAULT NULL,
  `ApplySchool_Spec` varchar(250) DEFAULT NULL,
  `UserQQ` varchar(250) DEFAULT NULL,
  `UserMSN` varchar(250) DEFAULT NULL,
  `matriculate_year` varchar(250) DEFAULT NULL,
  `matriculate_season` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IndexID`),
  KEY `NodeID` (`NodeID`),
  KEY `ContentID` (`ContentID`),
  KEY `PublishDate` (`PublishDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-16 12:17:07
