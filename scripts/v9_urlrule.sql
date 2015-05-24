-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: phpcmsv922
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
-- Table structure for table `v9_urlrule`
--

DROP TABLE IF EXISTS `v9_urlrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v9_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v9_urlrule`
--

LOCK TABLES `v9_urlrule` WRITE;
/*!40000 ALTER TABLE `v9_urlrule` DISABLE KEYS */;
INSERT INTO `v9_urlrule` VALUES (1,'content','category',1,'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html','news/china/1000.html'),(6,'content','category',0,'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}','index.php?m=content&c=index&a=lists&catid=1&page=1'),(11,'content','show',1,'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html','2010/catdir_0720/1_2.html'),(12,'content','show',1,'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html','it/product/2010/0720/1_2.html'),(16,'content','show',0,'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}','index.php?m=content&c=index&a=show&catid=1&id=1'),(17,'content','show',0,'show-{$catid}-{$id}-{$page}.html','show-1-2-1.html'),(18,'content','show',0,'content-{$catid}-{$id}-{$page}.html','content-1-2-1.html'),(30,'content','show',0,'list-{$catid}-{$page}.html','list-1-1.html'),(31,'content','show',1,'{$id}.html','1000.html'),(32,'content','show',1,'{$year}/{$month}/{$day}/{$id}.html','2015/05/24/1000.html'),(33,'content','show',1,'sitemap_{$id}.xml','sitemap_1000.xml '),(34,'content','show',1,'@strtotime({$year}-{$month}-{$day})d{$id}.html','{TimeStamp}d{ContentID}.html'),(35,'content','category',1,'{$categorydir}/index.html','index.html');
/*!40000 ALTER TABLE `v9_urlrule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-24 22:41:44
