-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: recordms
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `accesscontrol`
--

DROP TABLE IF EXISTS `accesscontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesscontrol` (
  `userid` varchar(32) NOT NULL,
  `recordtypeid` varchar(32) NOT NULL,
  `accesspermission` varchar(64) NOT NULL,
  PRIMARY KEY (`userid`,`recordtypeid`),
  KEY `accesscontrol_ibfk_2` (`recordtypeid`) USING BTREE,
  CONSTRAINT `accesscontrol_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accesscontrol_ibfk_2` FOREIGN KEY (`recordtypeid`) REFERENCES `recordtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesscontrol`
--

LOCK TABLES `accesscontrol` WRITE;
/*!40000 ALTER TABLE `accesscontrol` DISABLE KEYS */;
INSERT INTO `accesscontrol` VALUES ('0vljRLdvZdKXxuDNsGgzWL','29xqBnVfF87HNmcggl7M8F',''),('0vljRLdvZdKXxuDNsGgzWL','2JVfJTZfR6cbjJ8Be4gDPx','39,40,41,42,44'),('2SEoVdd8x56ovbw8MhjcMI','08PRCM7Fhffa25_t9kiKMd',''),('2SEoVdd8x56ovbw8MhjcMI','0DS-d1N7p58bSzvwFMkk1g',''),('2SEoVdd8x56ovbw8MhjcMI','16N5ewUi5czocWuPmZnb7L','39,40,41,42,44'),('2SEoVdd8x56ovbw8MhjcMI','1ilY3KXZ13dUEcdLicNhlj','39,40,41,42,44'),('2SEoVdd8x56ovbw8MhjcMI','1pO-IIygh3IXgZXKwmmeTQ',''),('2SEoVdd8x56ovbw8MhjcMI','2DsgnvVbdceFR9X1keWV1h',''),('2SEoVdd8x56ovbw8MhjcMI','2QKlVFhd97AEFH8tN6paz7',''),('2SEoVdd8x56ovbw8MhjcMI','2whF7KZiJdxFFlAY3sol0-','');
/*!40000 ALTER TABLE `accesscontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archives`
--

DROP TABLE IF EXISTS `archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archives` (
  `borrowunits` varchar(255) DEFAULT NULL,
  `borrowtime` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowPerson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `borrowNo` varchar(255) DEFAULT NULL,
  `borrowTitle` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  `returntime` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `returnPerson` varchar(255) DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isread` varchar(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archives`
--

LOCK TABLES `archives` WRITE;
/*!40000 ALTER TABLE `archives` DISABLE KEYS */;
INSERT INTO `archives` VALUES ('bdt','2017-07-19 16:00:00',1,'bdt','123456789','查阅','JX13-2016-1-0001','宿迁市2013年江苏省出洋中学新生花名册','马志兴','2017-07-19 16:00:00',NULL,0,NULL,'2017-07-20 07:10:16','0');
/*!40000 ALTER TABLE `archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivesaudit`
--

DROP TABLE IF EXISTS `archivesaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivesaudit` (
  `subject` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `applytime` timestamp NULL DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `recordid` varchar(255) DEFAULT NULL,
  `recordtypeid` varchar(255) DEFAULT NULL,
  `accesspermission` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isread` varchar(2) DEFAULT '0',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deadline` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivesaudit`
--

LOCK TABLES `archivesaudit` WRITE;
/*!40000 ALTER TABLE `archivesaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivesaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authgroup`
--

DROP TABLE IF EXISTS `authgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authgroup` (
  `authgroupid` varchar(32) NOT NULL,
  `authgroupname` varchar(32) NOT NULL,
  PRIMARY KEY (`authgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authgroup`
--

LOCK TABLES `authgroup` WRITE;
/*!40000 ALTER TABLE `authgroup` DISABLE KEYS */;
INSERT INTO `authgroup` VALUES ('2dddf','数据模板管理'),('accesscontrol','访问控制'),('ascmmk','档案查询'),('aww','档案类型管理'),('caa','库房管理'),('ceee','用户管理'),('cefiiii','用户组管理'),('celoo','权限管理'),('cvdee','通用数据维护'),('dffff2','全宗管理'),('fcccc','数据管理'),('sdccc','档案归档'),('vvvvv3','数据字典管理');
/*!40000 ALTER TABLE `authgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `authorityId` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `authgroupid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`authorityId`),
  KEY `authority_ibfk_1` (`authgroupid`) USING BTREE,
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`authgroupid`) REFERENCES `authgroup` (`authgroupid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES ('1','registeruser','注册用户','注册用户','ceee'),('11','createvolume','创建案卷','创建案卷','sdccc'),('12','export','导出目录','导出目录','sdccc'),('13','createfonds','创建全宗','创建全宗','dffff2'),('14','deletefonds','删除全宗','删除全宗','dffff2'),('15','editfonds','编辑全宗','编辑全宗','dffff2'),('16','outputsetting','导出设置','导出设置','sdccc'),('18','intohouse','归档入库','归档入库','sdccc'),('19','indexexport','索引导出','索引导出','fcccc'),('2','deleteuser','删除用户','删除用户','ceee'),('20','recordedit','档案编辑','档案编辑','fcccc'),('21','createrecordtype','创建档案类型','创建档案类型','aww'),('22','editrecordtype','编辑档案类型','编辑档案类型','aww'),('23','deleterecordtype','删除档案类型','删除档案类型','aww'),('24','createstorehouse','创建库房','创建库房','caa'),('25','editstorehouse','编辑库房','编辑库房','caa'),('26','deletestorehouse','删除库房','删除库房','caa'),('27','viewvolumeinner','查看卷内','查看卷内','sdccc'),('28','createrole','创建角色','创建角色','celoo'),('29','editrole','编辑角色','编辑角色','celoo'),('3','edituser','编辑用户','编辑用户','ceee'),('30','deleterole','删除角色','删除角色','celoo'),('31','createtemplate','创建模板','创建模板','2dddf'),('32','edittemplate','编辑模板','编辑模板','2dddf'),('33','deletetemplate','删除模板','删除模板','2dddf'),('34','createusergroup','创建用户组','创建用户组','cefiiii'),('35','editusergroup','编辑用户组','编辑用户组','cefiiii'),('36','deleteusergroup','删除用户组','删除用户组','cefiiii'),('37','search','档案查询','档案查询','ascmmk'),('38','createuser','创建用户','创建用户','ceee'),('39','uploadfile','上传附件','上传附件','accesscontrol'),('4','viewuser','查看用户','查看用户','ceee'),('40','viewfile','查看附件','查看附件','accesscontrol'),('41','downloadfile','下载附件','下载附件','accesscontrol'),('42','print','打印','打印','accesscontrol'),('43','accesscontrol','访问控制','访问控制','celoo'),('44','accessrecord','访问档案','访问档案','accesscontrol'),('45','viewteminfo','查看模板信息','查看模板信息','2dddf'),('5','uploadfile','上传档案文件','上传档案文件','sdccc'),('6','recordinfo','信息录入','信息录入','sdccc'),('7','checkapply','审批申请','审批申请','sdccc'),('8','viewtree','查看档案树','查看档案树','sdccc'),('9','buildvolume','组卷','组卷','sdccc');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backupsave`
--

DROP TABLE IF EXISTS `backupsave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backupsave` (
  `id` varchar(32) NOT NULL,
  `sqlpath` varchar(128) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backupsave`
--

LOCK TABLES `backupsave` WRITE;
/*!40000 ALTER TABLE `backupsave` DISABLE KEYS */;
/*!40000 ALTER TABLE `backupsave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_dmt_document`
--

DROP TABLE IF EXISTS `bdt_dmt_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_dmt_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `BDT_DMT_recordid_recordid` (`recordid`),
  CONSTRAINT `BDT_DMT_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `bdt_dmt_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_dmt_document`
--

LOCK TABLES `bdt_dmt_document` WRITE;
/*!40000 ALTER TABLE `bdt_dmt_document` DISABLE KEYS */;
INSERT INTO `bdt_dmt_document` VALUES ('06alaZzBx8k809HpSJ4wC-','bdt_dmt_record/0iWD4UDu95up0akNgNI2iz/2017-办公室-永久-3-0007.mp4','0iWD4UDu95up0akNgNI2iz','2017-07-20 09:23:20'),('06K7oiBSJ51ae60xuqOd02','bdt_dmt_record/1_ZUWAxgt7d9QJukoOUZwU/2017-办公室-永久-3-0004.flv','1_ZUWAxgt7d9QJukoOUZwU','2017-07-20 09:23:21'),('0dccXxHdV2M9rbDz2KoxHm','bdt_dmt_record/0urxM3jeB1lUhSTRWVvRiy/2017-办公室-永久-3-0005.mp4','0urxM3jeB1lUhSTRWVvRiy','2017-07-20 09:23:20'),('0DphfTTapd5Vpj5nFm6o3E','bdt_dmt/0Dsqoh7fR7YFSXDxkcjpyG/2017-办公室-永久-3-0002.flv','0Dsqoh7fR7YFSXDxkcjpyG','2017-07-20 09:22:26'),('0wuTU9Utd1VaH3G6LrgnUG','bdt_dmt/2fZFSl5Gt3cHin_wY1Dj15/2017-办公室-永久-3-0001.flv','2fZFSl5Gt3cHin_wY1Dj15','2017-07-20 09:06:38'),('2mb2O1Y6R4Xr3QJ_sHJUZi','bdt_dmt/1nq-xvAQ18LaX3X9VETxUP/2017-办公室-永久-3-0003.flv','1nq-xvAQ18LaX3X9VETxUP','2017-07-20 09:22:49'),('3-K89MGnR3HXJCpYKUF5jo','bdt_dmt_record/3IFQOu1Q90KFGJIPfx1dvT/2017-办公室-永久-3-0006.mp4','3IFQOu1Q90KFGJIPfx1dvT','2017-07-20 09:23:21'),('3Jiy0LCrxeSXC7peFdnuVQ','bdt_dmt_record/2czhYTvSNbsUWs4hYksskI/2017-办公室-永久-3-0008.mp4','2czhYTvSNbsUWs4hYksskI','2017-07-20 09:23:21');
/*!40000 ALTER TABLE `bdt_dmt_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_dmt_piece`
--

DROP TABLE IF EXISTS `bdt_dmt_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_dmt_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_dmt_piece`
--

LOCK TABLES `bdt_dmt_piece` WRITE;
/*!40000 ALTER TABLE `bdt_dmt_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdt_dmt_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_dmt_piecedocument`
--

DROP TABLE IF EXISTS `bdt_dmt_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_dmt_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `BDT_DMT_pieceid_pieceid` (`recordid`),
  CONSTRAINT `BDT_DMT_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `bdt_dmt_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_dmt_piecedocument`
--

LOCK TABLES `bdt_dmt_piecedocument` WRITE;
/*!40000 ALTER TABLE `bdt_dmt_piecedocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdt_dmt_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_dmt_record`
--

DROP TABLE IF EXISTS `bdt_dmt_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_dmt_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_dmt_record`
--

LOCK TABLES `bdt_dmt_record` WRITE;
/*!40000 ALTER TABLE `bdt_dmt_record` DISABLE KEYS */;
INSERT INTO `bdt_dmt_record` VALUES ('0Dsqoh7fR7YFSXDxkcjpyG','2017-办公室-永久-3-0002',NULL,'46','9','13','2','作业视频(整理)','','','','1','0X6KlzGHpe0WWpHvoz7gIF','superadmin','','2017-07-17 08:50:37','2017-07-20 09:22:26'),('0iWD4UDu95up0akNgNI2iz','2017-办公室-永久-3-0007',NULL,'46','9','13','7','作业视频(盖章)','','','','1','0X6KlzGHpe0WWpHvoz7gIF','superadmin',NULL,'2017-07-17 08:50:38',NULL),('0urxM3jeB1lUhSTRWVvRiy','2017-办公室-永久-3-0005',NULL,'46','9','13','5','作业视频(补扫)','','','','1','0X6KlzGHpe0WWpHvoz7gIF','superadmin',NULL,'2017-07-17 08:50:38',NULL),('1nq-xvAQ18LaX3X9VETxUP','2017-办公室-永久-3-0003',NULL,'46','9','13','3','作业视频(扫描)','','','','1','0X6KlzGHpe0WWpHvoz7gIF','superadmin','','2017-07-17 08:50:37','2017-07-20 09:22:49'),('1_ZUWAxgt7d9QJukoOUZwU','2017-办公室-永久-3-0004',NULL,'46','9','13','4','作业视频(优化)','','','','1','0X6KlzGHpe0WWpHvoz7gIF','superadmin','','2017-07-17 08:50:38','2017-07-20 09:24:16'),('2czhYTvSNbsUWs4hYksskI','2017-办公室-永久-3-0008',NULL,'46','9','13','8','作业视频(还原)','','','','1','0X6KlzGHpe0WWpHvoz7gIF','superadmin',NULL,'2017-07-17 08:50:38',NULL),('2fZFSl5Gt3cHin_wY1Dj15','2017-办公室-永久-3-0001',NULL,'46','9','13','1','作业视频(分件)','','','','1','0X6KlzGHpe0WWpHvoz7gIF','superadmin','','2017-07-17 08:50:37','2017-07-20 09:06:38'),('3IFQOu1Q90KFGJIPfx1dvT','2017-办公室-永久-3-0006',NULL,'46','9','13','6','作业视频(标注)','','','','1','0X6KlzGHpe0WWpHvoz7gIF','superadmin',NULL,'2017-07-17 08:50:38',NULL);
/*!40000 ALTER TABLE `bdt_dmt_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_dmt_volume`
--

DROP TABLE IF EXISTS `bdt_dmt_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_dmt_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_dmt_volume`
--

LOCK TABLES `bdt_dmt_volume` WRITE;
/*!40000 ALTER TABLE `bdt_dmt_volume` DISABLE KEYS */;
INSERT INTO `bdt_dmt_volume` VALUES ('0X6KlzGHpe0WWpHvoz7gIF','2017-办公室-永久-3',NULL,'46','9','13','作业视频','','','','1','superadmin','2017-07-17 08:50:28',NULL);
/*!40000 ALTER TABLE `bdt_dmt_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_gs_document`
--

DROP TABLE IF EXISTS `bdt_gs_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_gs_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `BDT_GS_recordid_recordid` (`recordid`),
  CONSTRAINT `BDT_GS_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `bdt_gs_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_gs_document`
--

LOCK TABLES `bdt_gs_document` WRITE;
/*!40000 ALTER TABLE `bdt_gs_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdt_gs_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_gs_piece`
--

DROP TABLE IF EXISTS `bdt_gs_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_gs_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_gs_piece`
--

LOCK TABLES `bdt_gs_piece` WRITE;
/*!40000 ALTER TABLE `bdt_gs_piece` DISABLE KEYS */;
INSERT INTO `bdt_gs_piece` VALUES ('1etl15rDJezVLBrU0AdpVW','2017-办公室-永久-2',NULL,'46','9','13','2','公司资质','','','','1',NULL,'superadmin','','2017-07-17 06:56:31','2017-07-17 07:25:45'),('3WwiIxiG96nrt-r0dRxjB8','2017-办公室-永久-1',NULL,'46','9','13','1','公司简介','','','1-1','1',NULL,'superadmin','','2017-07-17 06:56:31','2017-07-17 07:01:55');
/*!40000 ALTER TABLE `bdt_gs_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_gs_piecedocument`
--

DROP TABLE IF EXISTS `bdt_gs_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_gs_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `BDT_GS_pieceid_pieceid` (`recordid`),
  CONSTRAINT `BDT_GS_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `bdt_gs_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_gs_piecedocument`
--

LOCK TABLES `bdt_gs_piecedocument` WRITE;
/*!40000 ALTER TABLE `bdt_gs_piecedocument` DISABLE KEYS */;
INSERT INTO `bdt_gs_piecedocument` VALUES ('3BPnZPE9BaHrxCe0itEtYw','bdt_gs/1etl15rDJezVLBrU0AdpVW/2017-办公室-永久-2.DOC','1etl15rDJezVLBrU0AdpVW','2017-07-17 07:25:46'),('3PleDrlpda_9Ffaxn5IZhA','bdt_gs/3WwiIxiG96nrt-r0dRxjB8/2017-办公室-永久-1.DOC','3WwiIxiG96nrt-r0dRxjB8','2017-07-17 07:01:55');
/*!40000 ALTER TABLE `bdt_gs_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_gs_record`
--

DROP TABLE IF EXISTS `bdt_gs_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_gs_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_gs_record`
--

LOCK TABLES `bdt_gs_record` WRITE;
/*!40000 ALTER TABLE `bdt_gs_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdt_gs_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdt_gs_volume`
--

DROP TABLE IF EXISTS `bdt_gs_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdt_gs_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdt_gs_volume`
--

LOCK TABLES `bdt_gs_volume` WRITE;
/*!40000 ALTER TABLE `bdt_gs_volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdt_gs_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkinfo`
--

DROP TABLE IF EXISTS `checkinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkinfo` (
  `recordid` varchar(255) NOT NULL,
  `tableid` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkinfo`
--

LOCK TABLES `checkinfo` WRITE;
/*!40000 ALTER TABLE `checkinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dailyback`
--

DROP TABLE IF EXISTS `dailyback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dailyback` (
  `cronexpression` varchar(32) NOT NULL,
  `week` int(6) NOT NULL,
  PRIMARY KEY (`week`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailyback`
--

LOCK TABLES `dailyback` WRITE;
/*!40000 ALTER TABLE `dailyback` DISABLE KEYS */;
/*!40000 ALTER TABLE `dailyback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deadline`
--

DROP TABLE IF EXISTS `deadline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deadline` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `no` char(32) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deadline`
--

LOCK TABLES `deadline` WRITE;
/*!40000 ALTER TABLE `deadline` DISABLE KEYS */;
INSERT INTO `deadline` VALUES (13,'永久','1','Y'),(14,'10年','1','D10'),(15,'30年','1','D30');
/*!40000 ALTER TABLE `deadline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defaultexport`
--

DROP TABLE IF EXISTS `defaultexport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defaultexport` (
  `eid` varchar(255) NOT NULL DEFAULT '',
  `fontsize` smallint(4) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `lineheight` float DEFAULT NULL,
  `pagesize` smallint(4) DEFAULT NULL,
  `colWidth` varchar(255) DEFAULT NULL,
  `style` varchar(32) DEFAULT NULL,
  `direction` tinyint(1) DEFAULT NULL,
  `leftmargin` float DEFAULT NULL,
  `bottommargin` float DEFAULT NULL,
  `topmargin` float DEFAULT NULL,
  `rightmargin` float DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultexport`
--

LOCK TABLES `defaultexport` WRITE;
/*!40000 ALTER TABLE `defaultexport` DISABLE KEYS */;
INSERT INTO `defaultexport` VALUES ('2111',11,'默认模板标题',2,15,'11','A4',0,3,3,3,2);
/*!40000 ALTER TABLE `defaultexport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `no` char(32) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (9,'办公室','1','BGS'),(10,'国土局','1','GTJ'),(11,'期刊','1','QK'),(12,'教学','1','JX'),(13,'多媒体','1','DMT'),(14,'不动产','1','BDC'),(15,'文书','1','WS'),(16,'照片','1','ZP'),(17,'行政','1','XZ'),(18,'基建','1','JJ'),(19,'人事','1','RS'),(20,'教学13','1','JX13'),(21,'231','-1','1231');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `description` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
INSERT INTO `description` VALUES (1,'测试描述','1'),(2,'测试描述2','1'),(3,'测试描述3','1'),(4,'测试描述4','1');
/*!40000 ALTER TABLE `description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fonds`
--

DROP TABLE IF EXISTS `fonds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fonds` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `fondsNo` varchar(32) NOT NULL,
  `shid` varchar(32) NOT NULL,
  `des` varchar(32) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `shid` (`shid`) USING BTREE,
  CONSTRAINT `fonds_ibfk_1` FOREIGN KEY (`shid`) REFERENCES `storehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fonds`
--

LOCK TABLES `fonds` WRITE;
/*!40000 ALTER TABLE `fonds` DISABLE KEYS */;
INSERT INTO `fonds` VALUES ('26arH10gJ8FaQ2oCSSOCE4','高校','GX','3ZGhoQjeBdaEs11J31742K','GX','2017-07-17 03:51:10'),('308rKwdBd0VpvDidWIBqup','国土局','GTJ','3ZGhoQjeBdaEs11J31742K','GTJ','2017-07-17 03:50:32'),('3d8JfKGad4eXhCYjGbFkUH','BDT','BDT','3ZGhoQjeBdaEs11J31742K','BDT','2017-07-17 03:50:05'),('3QaQ_beBV7AptN_q7mZ97t','政府行业','ZF','3ZGhoQjeBdaEs11J31742K','ZF','2017-07-17 03:50:54');
/*!40000 ALTER TABLE `fonds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fullback`
--

DROP TABLE IF EXISTS `fullback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fullback` (
  `cronexpression` varchar(32) NOT NULL,
  `week` int(6) NOT NULL,
  PRIMARY KEY (`week`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fullback`
--

LOCK TABLES `fullback` WRITE;
/*!40000 ALTER TABLE `fullback` DISABLE KEYS */;
/*!40000 ALTER TABLE `fullback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtj_bdc_document`
--

DROP TABLE IF EXISTS `gtj_bdc_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gtj_bdc_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GTJ_BDC_recordid_recordid` (`recordid`),
  CONSTRAINT `GTJ_BDC_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `gtj_bdc_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gtj_bdc_document`
--

LOCK TABLES `gtj_bdc_document` WRITE;
/*!40000 ALTER TABLE `gtj_bdc_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `gtj_bdc_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtj_bdc_piece`
--

DROP TABLE IF EXISTS `gtj_bdc_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gtj_bdc_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `column1` varchar(255) DEFAULT NULL,
  `column2` varchar(255) DEFAULT NULL,
  `column3` varchar(255) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gtj_bdc_piece`
--

LOCK TABLES `gtj_bdc_piece` WRITE;
/*!40000 ALTER TABLE `gtj_bdc_piece` DISABLE KEYS */;
INSERT INTO `gtj_bdc_piece` VALUES ('1NqHuZ1I91To49nX4jNDpb','2016-106530-1',NULL,'45','10','13','3','马智星','','11','','106530','X京房权证昌字第792号','昌平区宁馨苑19号楼5单元1层','1',NULL,'superadmin',NULL,'2017-07-21 03:05:22',NULL),('33biQ6gVlfB9fNBLy2pOzW','2016-208976-1',NULL,'45','10','13','2','徐梅','','11','','208976','X京房权证昌字第392号','昌平区回龙观镇金榜园2单元','1',NULL,'superadmin',NULL,'2017-07-21 03:05:22',NULL),('3KgtO1oPB10qo0SZCaoBDh','2016-123456-1',NULL,'45','10','13','1','张燕','','11','','123456','X京房权证昌字第372号','昌平区宁馨苑19号楼5层2单元','1',NULL,'superadmin',NULL,'2017-07-21 03:05:22',NULL);
/*!40000 ALTER TABLE `gtj_bdc_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtj_bdc_piecedocument`
--

DROP TABLE IF EXISTS `gtj_bdc_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gtj_bdc_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GTJ_BDC_pieceid_pieceid` (`recordid`),
  CONSTRAINT `GTJ_BDC_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `gtj_bdc_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gtj_bdc_piecedocument`
--

LOCK TABLES `gtj_bdc_piecedocument` WRITE;
/*!40000 ALTER TABLE `gtj_bdc_piecedocument` DISABLE KEYS */;
INSERT INTO `gtj_bdc_piecedocument` VALUES ('1AHYUdWo99UFF_lPX0yByF','gtj_bdc_piece/1NqHuZ1I91To49nX4jNDpb/2016-106530-1.pdf','1NqHuZ1I91To49nX4jNDpb','2017-07-21 03:09:07'),('3B0SRO0fx7OE_z59SNYv9C','gtj_bdc_piece/3KgtO1oPB10qo0SZCaoBDh/2016-123456-1.pdf','3KgtO1oPB10qo0SZCaoBDh','2017-07-21 03:09:10'),('3U3sudyUJ6WXvEXz93IOSl','gtj_bdc_piece/33biQ6gVlfB9fNBLy2pOzW/2016-208976-1.pdf','33biQ6gVlfB9fNBLy2pOzW','2017-07-21 03:09:09');
/*!40000 ALTER TABLE `gtj_bdc_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtj_bdc_record`
--

DROP TABLE IF EXISTS `gtj_bdc_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gtj_bdc_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gtj_bdc_record`
--

LOCK TABLES `gtj_bdc_record` WRITE;
/*!40000 ALTER TABLE `gtj_bdc_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `gtj_bdc_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtj_bdc_volume`
--

DROP TABLE IF EXISTS `gtj_bdc_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gtj_bdc_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gtj_bdc_volume`
--

LOCK TABLES `gtj_bdc_volume` WRITE;
/*!40000 ALTER TABLE `gtj_bdc_volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `gtj_bdc_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_123_document`
--

DROP TABLE IF EXISTS `gx_123_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_123_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_123_recordid_recordid` (`recordid`),
  CONSTRAINT `GX_123_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `gx_123_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_123_document`
--

LOCK TABLES `gx_123_document` WRITE;
/*!40000 ALTER TABLE `gx_123_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_123_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_123_piece`
--

DROP TABLE IF EXISTS `gx_123_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_123_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_123_piece`
--

LOCK TABLES `gx_123_piece` WRITE;
/*!40000 ALTER TABLE `gx_123_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_123_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_123_piecedocument`
--

DROP TABLE IF EXISTS `gx_123_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_123_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_123_pieceid_pieceid` (`recordid`),
  CONSTRAINT `GX_123_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `gx_123_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_123_piecedocument`
--

LOCK TABLES `gx_123_piecedocument` WRITE;
/*!40000 ALTER TABLE `gx_123_piecedocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_123_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_123_record`
--

DROP TABLE IF EXISTS `gx_123_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_123_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `index1` varchar(4) DEFAULT NULL,
  `column1` varchar(123) DEFAULT NULL,
  `index0` varchar(4) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_123_record`
--

LOCK TABLES `gx_123_record` WRITE;
/*!40000 ALTER TABLE `gx_123_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_123_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_123_volume`
--

DROP TABLE IF EXISTS `gx_123_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_123_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `index0` varchar(4) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_123_volume`
--

LOCK TABLES `gx_123_volume` WRITE;
/*!40000 ALTER TABLE `gx_123_volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_123_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jj_document`
--

DROP TABLE IF EXISTS `gx_jj_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jj_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_JJ_recordid_recordid` (`recordid`),
  CONSTRAINT `GX_JJ_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `gx_jj_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jj_document`
--

LOCK TABLES `gx_jj_document` WRITE;
/*!40000 ALTER TABLE `gx_jj_document` DISABLE KEYS */;
INSERT INTO `gx_jj_document` VALUES ('1vB3WYMRt6foSAwmq_dJM8','gx_jj_record/0PWxY71DhcNED1QPyZQwSA/2000-办公室-永久-1-0005.pdf','0PWxY71DhcNED1QPyZQwSA','2017-07-17 05:55:23'),('2ENNo0tvt1vqzetKIDpUA3','gx_jj_record/2kA4matg12OUWStN0JXKZr/2000-办公室-永久-1-0003.pdf','2kA4matg12OUWStN0JXKZr','2017-07-17 05:55:25'),('2o2m57K9t2b9ZXvHem0yhf','gx_jj_record/3Qz01rrAB69pyhItna1loA/2000-办公室-永久-1-0001.pdf','3Qz01rrAB69pyhItna1loA','2017-07-17 05:55:26'),('2Rqy2CbJpeVa2yrEB8UDSh','gx_jj_record/2tKzkKMIt5CUs6ZBUA_HXG/2000-办公室-永久-1-0006.pdf','2tKzkKMIt5CUs6ZBUA_HXG','2017-07-17 05:55:26'),('2XBolxWbxbW8Ljq9Zb78c9','gx_jj_record/2idh9k5j1dbUpYggPUFnZk/2000-办公室-永久-1-0002.pdf','2idh9k5j1dbUpYggPUFnZk','2017-07-17 05:55:24'),('32amCTgsBbMEp29HCVZCOa','gx_jj_record/3UnMRyWBV93WQv1bCZSH1Q/2000-办公室-永久-1-0004.pdf','3UnMRyWBV93WQv1bCZSH1Q','2017-07-17 05:55:27'),('3Iv-J8Q-t7886R2icImnRI','gx_jj_record/1BGVSVHWp1rWniEw4EG89W/2000-办公室-永久-1-0007.pdf','1BGVSVHWp1rWniEw4EG89W','2017-07-17 05:55:24');
/*!40000 ALTER TABLE `gx_jj_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jj_piece`
--

DROP TABLE IF EXISTS `gx_jj_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jj_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jj_piece`
--

LOCK TABLES `gx_jj_piece` WRITE;
/*!40000 ALTER TABLE `gx_jj_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_jj_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jj_piecedocument`
--

DROP TABLE IF EXISTS `gx_jj_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jj_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_JJ_pieceid_pieceid` (`recordid`),
  CONSTRAINT `GX_JJ_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `gx_jj_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jj_piecedocument`
--

LOCK TABLES `gx_jj_piecedocument` WRITE;
/*!40000 ALTER TABLE `gx_jj_piecedocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_jj_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jj_record`
--

DROP TABLE IF EXISTS `gx_jj_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jj_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jj_record`
--

LOCK TABLES `gx_jj_record` WRITE;
/*!40000 ALTER TABLE `gx_jj_record` DISABLE KEYS */;
INSERT INTO `gx_jj_record` VALUES ('0PWxY71DhcNED1QPyZQwSA','2000-办公室-永久-1-0005',NULL,'56','9','13','5','目录','','2','1-5','1','3yQSpRX6xd6E6FbqqJ0XEc','superadmin',NULL,'2017-07-17 05:55:08',NULL),('1BGVSVHWp1rWniEw4EG89W','2000-办公室-永久-1-0007',NULL,'56','9','13','7','东立面','','2','1-7','1','3yQSpRX6xd6E6FbqqJ0XEc','superadmin',NULL,'2017-07-17 05:55:08',NULL),('2idh9k5j1dbUpYggPUFnZk','2000-办公室-永久-1-0002',NULL,'56','9','13','2','南立面','','2','1-2','1','3yQSpRX6xd6E6FbqqJ0XEc','superadmin',NULL,'2017-07-17 05:55:07',NULL),('2kA4matg12OUWStN0JXKZr','2000-办公室-永久-1-0003',NULL,'56','9','13','3','北立面','','2','1-3','1','3yQSpRX6xd6E6FbqqJ0XEc','superadmin',NULL,'2017-07-17 05:55:07',NULL),('2tKzkKMIt5CUs6ZBUA_HXG','2000-办公室-永久-1-0006',NULL,'56','9','13','6','屋顶平面图','','2','1-6','1','3yQSpRX6xd6E6FbqqJ0XEc','superadmin',NULL,'2017-07-17 05:55:08',NULL),('3Qz01rrAB69pyhItna1loA','2000-办公室-永久-1-0001',NULL,'56','9','13','1','单元首层平面图','','2','1-1','1','3yQSpRX6xd6E6FbqqJ0XEc','superadmin',NULL,'2017-07-17 05:55:07',NULL),('3UnMRyWBV93WQv1bCZSH1Q','2000-办公室-永久-1-0004',NULL,'56','9','13','4','乙2单元首层平面图','','2','1-4','1','3yQSpRX6xd6E6FbqqJ0XEc','superadmin',NULL,'2017-07-17 05:55:08',NULL);
/*!40000 ALTER TABLE `gx_jj_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jj_volume`
--

DROP TABLE IF EXISTS `gx_jj_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jj_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jj_volume`
--

LOCK TABLES `gx_jj_volume` WRITE;
/*!40000 ALTER TABLE `gx_jj_volume` DISABLE KEYS */;
INSERT INTO `gx_jj_volume` VALUES ('3yQSpRX6xd6E6FbqqJ0XEc','2000-办公室-永久-1',NULL,'56','9','13','基建图纸','','','','1','superadmin','2017-07-17 05:55:00',NULL);
/*!40000 ALTER TABLE `gx_jj_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jx_document`
--

DROP TABLE IF EXISTS `gx_jx_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jx_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_JX_recordid_recordid` (`recordid`),
  CONSTRAINT `GX_JX_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `gx_jx_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jx_document`
--

LOCK TABLES `gx_jx_document` WRITE;
/*!40000 ALTER TABLE `gx_jx_document` DISABLE KEYS */;
INSERT INTO `gx_jx_document` VALUES ('2SOky34pN9Yrqb1i8ol-Gq','gx_jx_record/0L1OgzoJFfF8BM-kqdyqn3/JX13-2016-1-0001.jpg','0L1OgzoJFfF8BM-kqdyqn3','2017-07-18 03:25:35');
/*!40000 ALTER TABLE `gx_jx_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jx_piece`
--

DROP TABLE IF EXISTS `gx_jx_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jx_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `column1` varchar(99) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jx_piece`
--

LOCK TABLES `gx_jx_piece` WRITE;
/*!40000 ALTER TABLE `gx_jx_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_jx_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jx_piececontent1`
--

DROP TABLE IF EXISTS `gx_jx_piececontent1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jx_piececontent1` (
  `col0` varchar(3) NOT NULL,
  `col1` varchar(99) NOT NULL,
  `col2` varchar(18) NOT NULL,
  `col3` varchar(99) NOT NULL,
  `col4` varchar(99) NOT NULL,
  `recordId` varchar(32) NOT NULL,
  `sourcefile` varchar(255) NOT NULL,
  `pagenum` varchar(32) NOT NULL,
  KEY `gx_jx_piececontent1_index` (`recordId`) USING BTREE,
  CONSTRAINT `gx_jx_piececontent1_foreignkey` FOREIGN KEY (`recordId`) REFERENCES `gx_jx_piece` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jx_piececontent1`
--

LOCK TABLES `gx_jx_piececontent1` WRITE;
/*!40000 ALTER TABLE `gx_jx_piececontent1` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_jx_piececontent1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jx_piecedocument`
--

DROP TABLE IF EXISTS `gx_jx_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jx_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_JX_pieceid_pieceid` (`recordid`),
  CONSTRAINT `GX_JX_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `gx_jx_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jx_piecedocument`
--

LOCK TABLES `gx_jx_piecedocument` WRITE;
/*!40000 ALTER TABLE `gx_jx_piecedocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_jx_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jx_record`
--

DROP TABLE IF EXISTS `gx_jx_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jx_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jx_record`
--

LOCK TABLES `gx_jx_record` WRITE;
/*!40000 ALTER TABLE `gx_jx_record` DISABLE KEYS */;
INSERT INTO `gx_jx_record` VALUES ('0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001',NULL,'45','20','13','1','宿迁市2013年江苏省出洋中学新生花名册','','','','1','01Vs0q8_B2pUcNIW97xNTj','superadmin','gx_jx_recordcontent1','2017-07-18 03:24:31','2017-07-18 03:30:58');
/*!40000 ALTER TABLE `gx_jx_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jx_recordcontent1`
--

DROP TABLE IF EXISTS `gx_jx_recordcontent1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jx_recordcontent1` (
  `col0` varchar(3) NOT NULL,
  `col1` varchar(99) NOT NULL,
  `col2` varchar(18) NOT NULL,
  `col3` varchar(99) NOT NULL,
  `col4` varchar(99) NOT NULL,
  `recordId` varchar(32) NOT NULL,
  `sourcefile` varchar(255) NOT NULL,
  `pagenum` varchar(32) NOT NULL,
  KEY `gx_jx_recordcontent1_index` (`recordId`) USING BTREE,
  CONSTRAINT `gx_jx_recordcontent1_foreignkey` FOREIGN KEY (`recordId`) REFERENCES `gx_jx_record` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jx_recordcontent1`
--

LOCK TABLES `gx_jx_recordcontent1` WRITE;
/*!40000 ALTER TABLE `gx_jx_recordcontent1` DISABLE KEYS */;
INSERT INTO `gx_jx_recordcontent1` VALUES ('1','陈迪','321322199703222000','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('2','颜康','321322199805107000','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('3','孙慧','340602199404160620','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('4','马志兴','130681199003152239','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('5','訾佳兴','220282198903055612','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('6','汪丽','220282198903055613','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('7','郭兴丽','220282198903055614','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('8','赵红艳','220282198903055615','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('9','赵文俊','220282198903055616','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('10','郑楠','220282198903055617','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('11','许英哲','220282198903055618','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('12','张三','0','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('13','李四','0','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0'),('14','罗文涛','0','汉族','汽车专业与维修','0L1OgzoJFfF8BM-kqdyqn3','JX13-2016-1-0001.jpg','0');
/*!40000 ALTER TABLE `gx_jx_recordcontent1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_jx_volume`
--

DROP TABLE IF EXISTS `gx_jx_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_jx_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `column2` varchar(99) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_jx_volume`
--

LOCK TABLES `gx_jx_volume` WRITE;
/*!40000 ALTER TABLE `gx_jx_volume` DISABLE KEYS */;
INSERT INTO `gx_jx_volume` VALUES ('01Vs0q8_B2pUcNIW97xNTj','JX13-2016-1',NULL,'45','20','13','宿迁市新生花名册','','','','BDT','1','superadmin','2017-07-18 03:23:20',NULL);
/*!40000 ALTER TABLE `gx_jx_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_qk_document`
--

DROP TABLE IF EXISTS `gx_qk_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_qk_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_QK_recordid_recordid` (`recordid`),
  CONSTRAINT `GX_QK_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `gx_qk_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_qk_document`
--

LOCK TABLES `gx_qk_document` WRITE;
/*!40000 ALTER TABLE `gx_qk_document` DISABLE KEYS */;
INSERT INTO `gx_qk_document` VALUES ('0kIg6l2EdesG1BN6uJD5o5','gx_qk_record/0yZ3aDgOR3-ENNwnNZygLy/2001-QK-永久-1-0007.JPG','0yZ3aDgOR3-ENNwnNZygLy','2017-07-17 05:00:42'),('0pOhrUPyZ1laf8ASU86tW8','gx_qk_record/0TE3mkFaBexUwobqKaMZDc/2001-QK-永久-1-0005.jpg','0TE3mkFaBexUwobqKaMZDc','2017-07-17 05:00:42'),('13b7IfGqBd8VIt9TA1j7NK','gx_qk_record/2KtliXQjRdh9jyj8K4_KtO/2001-QK-永久-1-0002.jpg','2KtliXQjRdh9jyj8K4_KtO','2017-07-17 05:00:42'),('14TSRnxJhePpAcnuzU9grd','gx_qk_record/0D2UBgUI5fIoda8Z-Ypmb1/2001-QK-永久-1-0006.jpg','0D2UBgUI5fIoda8Z-Ypmb1','2017-07-17 05:00:41'),('1gMeO7kQNcXUqxpRem161M','gx_qk_record/3ZQWk1GlF4sWIHYbM6vH1u/2001-QK-永久-1-0003.jpg','3ZQWk1GlF4sWIHYbM6vH1u','2017-07-17 05:00:42'),('1wAdShSGd4cr2E9extPj_n','gx_qk_record/1GRr7-U9Zaa9wD1O9w3844/2001-QK-永久-1-0001.jpg','1GRr7-U9Zaa9wD1O9w3844','2017-07-28 05:36:27'),('3iz8OdaCV4TolkYMXToicp','gx_qk_record/2l5mub6ct9ApVsrM_KZGP9/2001-QK-永久-1-0004.jpg','2l5mub6ct9ApVsrM_KZGP9','2017-07-17 05:00:42');
/*!40000 ALTER TABLE `gx_qk_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_qk_piece`
--

DROP TABLE IF EXISTS `gx_qk_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_qk_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_qk_piece`
--

LOCK TABLES `gx_qk_piece` WRITE;
/*!40000 ALTER TABLE `gx_qk_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_qk_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_qk_piecedocument`
--

DROP TABLE IF EXISTS `gx_qk_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_qk_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_QK_pieceid_pieceid` (`recordid`),
  CONSTRAINT `GX_QK_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `gx_qk_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_qk_piecedocument`
--

LOCK TABLES `gx_qk_piecedocument` WRITE;
/*!40000 ALTER TABLE `gx_qk_piecedocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_qk_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_qk_record`
--

DROP TABLE IF EXISTS `gx_qk_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_qk_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_qk_record`
--

LOCK TABLES `gx_qk_record` WRITE;
/*!40000 ALTER TABLE `gx_qk_record` DISABLE KEYS */;
INSERT INTO `gx_qk_record` VALUES ('0D2UBgUI5fIoda8Z-Ypmb1','2001-QK-永久-1-0006',NULL,'55','9','13','6','厦门康桥','','','','1','0eoNbBpx59IbM5DqM9YTSH','superadmin',NULL,'2017-07-17 04:57:17',NULL),('0TE3mkFaBexUwobqKaMZDc','2001-QK-永久-1-0005',NULL,'55','9','13','5','期刊','','','','1','0eoNbBpx59IbM5DqM9YTSH','superadmin',NULL,'2017-07-17 04:57:17',NULL),('0yZ3aDgOR3-ENNwnNZygLy','2001-QK-永久-1-0007',NULL,'55','9','13','7','武汉地质学院','','','','1','0eoNbBpx59IbM5DqM9YTSH','superadmin',NULL,'2017-07-17 04:57:17',NULL),('1GRr7-U9Zaa9wD1O9w3844','2001-QK-永久-1-0001',NULL,'55','9','13','1','校园擂台赛','','','','1','0eoNbBpx59IbM5DqM9YTSH','superadmin',NULL,'2017-07-17 04:57:16',NULL),('2KtliXQjRdh9jyj8K4_KtO','2001-QK-永久-1-0002',NULL,'55','9','13','2','办学成果固本求真陪树人','','','','1','0eoNbBpx59IbM5DqM9YTSH','superadmin',NULL,'2017-07-17 04:57:17',NULL),('2l5mub6ct9ApVsrM_KZGP9','2001-QK-永久-1-0004',NULL,'55','9','13','4','人文天下','','','','1','0eoNbBpx59IbM5DqM9YTSH','superadmin',NULL,'2017-07-17 04:57:17',NULL),('3ZQWk1GlF4sWIHYbM6vH1u','2001-QK-永久-1-0003',NULL,'55','9','13','3','肖家河小学','','','','1','0eoNbBpx59IbM5DqM9YTSH','superadmin',NULL,'2017-07-17 04:57:17',NULL);
/*!40000 ALTER TABLE `gx_qk_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_qk_volume`
--

DROP TABLE IF EXISTS `gx_qk_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_qk_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_qk_volume`
--

LOCK TABLES `gx_qk_volume` WRITE;
/*!40000 ALTER TABLE `gx_qk_volume` DISABLE KEYS */;
INSERT INTO `gx_qk_volume` VALUES ('0eoNbBpx59IbM5DqM9YTSH','2001-QK-永久-1',NULL,'55','9','13','期刊','','','','1','superadmin','2017-07-17 04:57:08',NULL);
/*!40000 ALTER TABLE `gx_qk_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_rs_document`
--

DROP TABLE IF EXISTS `gx_rs_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_rs_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_RS_recordid_recordid` (`recordid`),
  CONSTRAINT `GX_RS_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `gx_rs_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_rs_document`
--

LOCK TABLES `gx_rs_document` WRITE;
/*!40000 ALTER TABLE `gx_rs_document` DISABLE KEYS */;
INSERT INTO `gx_rs_document` VALUES ('05-nCNS891gVrZVQg8IX3t','gx_rs_record/2SwkVCi2VdPVvotzGmC1CP/GX-RS-2016-Y-2-05.pdf','2SwkVCi2VdPVvotzGmC1CP','2017-07-18 07:21:43'),('07mCPGX-l0rqRg2eMGhG6V','gx_rs_record/3GyIGJO3h0xoE5WpSVZdH7/GX-RS-2016-Y-7-02.pdf','3GyIGJO3h0xoE5WpSVZdH7','2017-07-18 07:23:14'),('09Jk_rRPd8squ9ZGZ5tNhQ','gx_rs_record/3w5gSf75Z4upsHxPpzHfzg/GX-RS-2016-Y-3-05.pdf','3w5gSf75Z4upsHxPpzHfzg','2017-07-18 07:22:45'),('0Br4YnqKFaTo6G1yli8nk7','gx_rs_record/1k7gWeYMh79FeexI_cifOB/GX-RS-2016-Y-5-09.pdf','1k7gWeYMh79FeexI_cifOB','2017-07-18 07:24:45'),('0cQGktgbxc_HyLhnE43OEp','gx_rs_record/2MEf9oY1VfTG4_vpt9BBTQ/GX-RS-2016-Y-8-07.pdf','2MEf9oY1VfTG4_vpt9BBTQ','2017-07-18 07:23:28'),('0dw26AqyR23pqXcIJdK6Nz','gx_rs_record/1_rPGgWIxd8rVhuBkPBdkr/GX-RS-2016-Y-3-07.pdf','1_rPGgWIxd8rVhuBkPBdkr','2017-07-18 07:22:44'),('0fJitBX013FoeLzF2OiA6y','gx_rs_record/0vg40VnwNejVcKQqAqWq5v/GX-RS-2016-Y-9-01.pdf','0vg40VnwNejVcKQqAqWq5v','2017-07-18 07:24:05'),('0Gu8Ws4XV5YaQK_7bmKZum','gx_rs_record/3KYAcZPPV95Hvodfzigj1b/GX-RS-2016-Y-6-03.pdf','3KYAcZPPV95Hvodfzigj1b','2017-07-18 07:22:24'),('0hH0BarXF9PrdpVdiskO5z','gx_rs_record/1M86JJ1217KHvfDQcB3JYx/GX-RS-2016-Y-8-04.pdf','1M86JJ1217KHvfDQcB3JYx','2017-07-18 07:23:28'),('0LcEV-PQp2Ca7iJVjs7kSO','gx_rs_record/1GUajpi9B2bVnZB4JvmAo6/GX-RS-2016-Y-10-06.pdf','1GUajpi9B2bVnZB4JvmAo6','2017-07-18 07:21:22'),('0L_gRnr4R4r8Kt9UoPVB59','gx_rs_record/3IWMZ-oCBatUfULcVyQoZm/GX-RS-2016-Y-9-04.pdf','3IWMZ-oCBatUfULcVyQoZm','2017-07-18 07:24:08'),('0No54kRpFau8f7HMiTSppL','gx_rs_record/2OdgpxPgt5J977a9kbH8Ey/GX-RS-2016-Y-1-04.pdf','2OdgpxPgt5J977a9kbH8Ey','2017-07-18 07:24:28'),('0NQGKChMF0Cb0LpSP3gJFb','gx_rs_record/37RPnFNEdbcUOVWFhF9hdh/GX-RS-2016-Y-8-01.pdf','37RPnFNEdbcUOVWFhF9hdh','2017-07-18 07:23:30'),('0ofzIzgX16tGx6-KTc-1Kd','gx_rs_record/0bGvDPIUBbB8SrgyvSMHja/GX-RS-2016-Y-3-03.pdf','0bGvDPIUBbB8SrgyvSMHja','2017-07-18 07:22:41'),('0oxQ7HwQZ848X0Cn3bAxkX','gx_rs_record/2ykGF9jgh6SGPDBvw1rd0-/GX-RS-2016-Y-1-06.pdf','2ykGF9jgh6SGPDBvw1rd0-','2017-07-18 07:24:28'),('0PfHxitSpdMoXeNge19tjS','gx_rs_record/18v71T7VtdOWHBNQ43vuIT/GX-RS-2016-Y-4-07.pdf','18v71T7VtdOWHBNQ43vuIT','2017-07-18 07:23:44'),('0pRCZHDDF5-pj3bg0Ge2ry','gx_rs_record/0IhBQjH9x8ob-F20f-obtF/GX-RS-2016-Y-6-02.pdf','0IhBQjH9x8ob-F20f-obtF','2017-07-18 07:22:22'),('0QYHMmn_h4Zbg7DCCkG1eB','gx_rs_record/3DWgPLNIlepXyTz9ioLbh4/GX-RS-2016-Y-1-01.pdf','3DWgPLNIlepXyTz9ioLbh4','2017-07-18 07:24:29'),('0rvk7Pz4d2FVljZ0awurMg','gx_rs_record/1pRD_Lf1xbZGQDPWvcXMml/GX-RS-2016-Y-2-04.pdf','1pRD_Lf1xbZGQDPWvcXMml','2017-07-18 07:21:41'),('0Sr5HUvqx2nGOsRSxSw73E','gx_rs_record/3BK_TFeRJ7bqE-R5mZAXlp/GX-RS-2016-Y-3-02.pdf','3BK_TFeRJ7bqE-R5mZAXlp','2017-07-18 07:22:45'),('0TRnuukO55JVg-qpcK-4OS','gx_rs_record/0UNSg5g2paN8hJPXvVjfJx/GX-RS-2016-Y-7-05.pdf','0UNSg5g2paN8hJPXvVjfJx','2017-07-18 07:23:10'),('0VI2NnwwF50X6Ey7xeNNc1','gx_rs_record/0Fbv3_-6l8aUNR93YEM9xL/GX-RS-2016-Y-1-05.pdf','0Fbv3_-6l8aUNR93YEM9xL','2017-07-18 07:24:26'),('0wQGgjJ455Hp9TaYHCCWQ8','gx_rs_record/3pLj7vuLd7qUUC7JbCgOeq/GX-RS-2016-Y-6-09.pdf','3pLj7vuLd7qUUC7JbCgOeq','2017-07-18 07:22:25'),('0WuicCYCVaFE5Vq7uPiief','gx_rs_record/0SOGv1YVJeRUSbPlIuHd6p/GX-RS-2016-Y-2-03.pdf','0SOGv1YVJeRUSbPlIuHd6p','2017-07-18 07:21:40'),('1-v35Zp4ZdaGgmv0gLNeWw','gx_rs_record/0eL2hIfZd4JriFGUaFGVLA/GX-RS-2016-Y-1-08.pdf','0eL2hIfZd4JriFGUaFGVLA','2017-07-18 07:24:25'),('15rVDrcel9vbV6MrFK1kpZ','gx_rs_record/3I1qcBHkd49oLweGx4yCBF/GX-RS-2016-Y-4-04.pdf','3I1qcBHkd49oLweGx4yCBF','2017-07-18 07:23:46'),('17CKPy6Sdd1F6akDPAQMgu','gx_rs_record/0Z2uhgTthduqBdS1bjPxWj/GX-RS-2016-Y-6-08.pdf','0Z2uhgTthduqBdS1bjPxWj','2017-07-18 07:22:23'),('17vyqdeZ96d9oOYBBO_Sba','gx_rs_record/2t_ymrKCBdoo_n0U-AX1fC/GX-RS-2016-Y-8-02.pdf','2t_ymrKCBdoo_n0U-AX1fC','2017-07-18 07:23:29'),('1DT5Md8hV6w8WdGGCTqtkX','gx_rs_record/2EPbb7FNN50oayR3ZkUiKz/GX-RS-2016-Y-5-06.pdf','2EPbb7FNN50oayR3ZkUiKz','2017-07-18 07:24:46'),('1HC7agPLZbG89_m5rdl6qn','gx_rs_record/3SonjqnB9c4FcliI1FpZ5s/GX-RS-2016-Y-5-05.pdf','3SonjqnB9c4FcliI1FpZ5s','2017-07-18 07:24:47'),('1K9at0rWJ1wrprshL_wEWe','gx_rs_record/3_ngpR1zF3zElrMzxxfMjW/GX-RS-2016-Y-9-06.pdf','3_ngpR1zF3zElrMzxxfMjW','2017-07-18 07:24:09'),('1my9jUDPBbbbCrihb6FPgK','gx_rs_record/0VzZWwMTt5Vbn9FLM1Xk-6/GX-RS-2016-Y-7-06.pdf','0VzZWwMTt5Vbn9FLM1Xk-6','2017-07-18 07:23:10'),('1PCREUUZ9a7WKy7pd0p3zC','gx_rs_record/3Fz5eJ3AF2yUyIZhH3t05c/GX-RS-2016-Y-9-05.pdf','3Fz5eJ3AF2yUyIZhH3t05c','2017-07-18 07:24:08'),('1QMuwHnyVda9l5u0NidpqK','gx_rs_record/1uoByW9Rx2-bwjIVZZO8nJ/GX-RS-2016-Y-4-09.pdf','1uoByW9Rx2-bwjIVZZO8nJ','2017-07-18 07:23:45'),('1qN8BU3MB6ipUh18bKwclb','gx_rs_record/0QXYebKUJ0bqiEZylxorAX/GX-RS-2016-Y-4-02.pdf','0QXYebKUJ0bqiEZylxorAX','2017-07-18 07:23:43'),('1r1AH3eMl3O8HVWDC0mnYv','gx_rs_record/2z7kCXc1x3x8SKUcjdMfr-/GX-RS-2016-Y-10-03.pdf','2z7kCXc1x3x8SKUcjdMfr-','2017-07-18 07:21:24'),('1T1IR4hdt0OootKIgzMC0Y','gx_rs_record/1jL3Ek77he_H5-8Yah0p9e/GX-RS-2016-Y-5-01.pdf','1jL3Ek77he_H5-8Yah0p9e','2017-07-18 07:24:45'),('1vQ-pkYfB3opTZOH1-paXR','gx_rs_record/2yFvrqEYN8krxmj8AFQGE-/GX-RS-2016-Y-2-09.pdf','2yFvrqEYN8krxmj8AFQGE-','2017-07-18 07:21:43'),('1WdAr9KXJarVJZMkY6HlWe','gx_rs_record/0kJZywFoR7h8Dam8O7Lr5g/GX-RS-2016-Y-8-03.pdf','0kJZywFoR7h8Dam8O7Lr5g','2017-07-18 07:23:26'),('1wiB2D2KF9xapdbOoybe-w','gx_rs_record/3z1GIkOddcZqBGx3Nzftf4/GX-RS-2016-Y-6-07.pdf','3z1GIkOddcZqBGx3Nzftf4','2017-07-18 07:22:25'),('1WK0Ksrstaiq1yKCUxlHYo','gx_rs_record/2chUcAMIJ4MUd8lHc9Vp44/GX-RS-2016-Y-5-08.pdf','2chUcAMIJ4MUd8lHc9Vp44','2017-07-18 07:24:46'),('1_XNP_3KNePb9VbboYEQae','gx_rs_record/3G5IjJkDJcppt8xr3nSwsB/GX-RS-2016-Y-4-05.pdf','3G5IjJkDJcppt8xr3nSwsB','2017-07-18 07:23:46'),('264u_jPgV1LUMDXu7tp7DJ','gx_rs_record/1z8Vl6zM96ybblRymFjWln/GX-RS-2016-Y-3-01.pdf','1z8Vl6zM96ybblRymFjWln','2017-07-18 07:22:43'),('26eszyRrx9taQxrm0nJ9Rs','gx_rs_record/2knUM2Rd1fEHTHhv0769dj/GX-RS-2016-Y-4-03.pdf','2knUM2Rd1fEHTHhv0769dj','2017-07-18 07:23:46'),('2bAyUMpJRbhrnpmir2Vw_a','gx_rs_record/0aN1T8OuJbLaPsH6d19oof/GX-RS-2016-Y-6-06.pdf','0aN1T8OuJbLaPsH6d19oof','2017-07-18 07:22:21'),('2CIrCZ7ud4ZE25-W8v4Rx5','gx_rs_record/10vN_hAK5cuXiTKX2TegQ1/GX-RS-2016-Y-9-09.pdf','10vN_hAK5cuXiTKX2TegQ1','2017-07-18 07:24:06'),('2DPGbEGHp9OXD9AoXZ5tWu','gx_rs_record/1Zu1h9EOtczrN95MhlL1wN/GX-RS-2016-Y-7-04.pdf','1Zu1h9EOtczrN95MhlL1wN','2017-07-18 07:23:13'),('2EIUYNNdJeZbXz9M2lTQuJ','gx_rs_record/3-0auI-dpdwHXZ1v1EuNw9/GX-RS-2016-Y-1-03.pdf','3-0auI-dpdwHXZ1v1EuNw9','2017-07-18 07:24:29'),('2ES1Jqbmtdrp9caZQmPXxA','gx_rs_record/2hsq47napdUUvgG3ZW3MLg/GX-RS-2016-Y-5-03.pdf','2hsq47napdUUvgG3ZW3MLg','2017-07-18 07:24:46'),('2f7DT5ca5ekXzeQJeJItAR','gx_rs_record/12BFuvWUJ8oV3V3kRH_NS4/GX-RS-2016-Y-5-07.pdf','12BFuvWUJ8oV3V3kRH_NS4','2017-07-18 07:24:44'),('2FT6aEYkZ5T8X4HHJyjOeQ','gx_rs_record/0T7XaU2bV7X8GgGkDMaPnH/GX-RS-2016-Y-1-07.pdf','0T7XaU2bV7X8GgGkDMaPnH','2017-07-18 07:24:27'),('2GCsDnHaZ1KGxn3RFB_EGb','gx_rs_record/16hb86U-N5tXTrfu4JDDzf/GX-RS-2016-Y-7-03.pdf','16hb86U-N5tXTrfu4JDDzf','2017-07-18 07:23:11'),('2GL0gUZIV8QbvhWVUIdF6e','gx_rs_record/0oxnCO67N8W8ZyT3k9xBqQ/GX-RS-2016-Y-1-09.pdf','0oxnCO67N8W8ZyT3k9xBqQ','2017-07-18 07:24:26'),('2mSw8CnOtekaCovLHZsKBx','gx_rs_record/0tQi3vHN51jpzV94sPrzD8/GX-RS-2016-Y-4-01.pdf','0tQi3vHN51jpzV94sPrzD8','2017-07-18 07:23:43'),('2nZgDLNq50DX6W_CqEKsXG','gx_rs_record/3uZmj-attfOac76SCnUSsf/GX-RS-2016-Y-9-02.pdf','3uZmj-attfOac76SCnUSsf','2017-07-18 07:24:08'),('2pX74LU-FahEUqUbMdkLnw','gx_rs_record/1yAdRTGL14srEAR32WmUDX/GX-RS-2016-Y-3-08.pdf','1yAdRTGL14srEAR32WmUDX','2017-07-18 07:22:43'),('2pxf_GHdJcbG1aZNqrQ4Tw','gx_rs_record/1S-lbcTvF8JFoQWd_ttRi-/GX-RS-2016-Y-7-01.pdf','1S-lbcTvF8JFoQWd_ttRi-','2017-07-18 07:23:12'),('2qqfD3LyB7DHtqGjqyXOhm','gx_rs_record/0STfnBLep1mUxPpQwxDRkV/GX-RS-2016-Y-6-01.pdf','0STfnBLep1mUxPpQwxDRkV','2017-07-18 07:22:22'),('2udlvgO759dadT98JAHykj','gx_rs_record/3-cZysPSd1Yb-BAF6GOB0X/GX-RS-2016-Y-2-02.pdf','3-cZysPSd1Yb-BAF6GOB0X','2017-07-18 07:21:44'),('2ySBUGdeta6H2nxoFVe4js','gx_rs_record/07uUiCEF98jVCPZSwb8_Hp/GX-RS-2016-Y-8-08.pdf','07uUiCEF98jVCPZSwb8_Hp','2017-07-18 07:23:26'),('2YwFsdiyt0nWLmxiW-CyR-','gx_rs_record/0WjhrT-Mt4fE-xfPhNYm4v/GX-RS-2016-Y-4-06.pdf','0WjhrT-Mt4fE-xfPhNYm4v','2017-07-18 07:23:44'),('2z6xm8lCpfvbQ7OcRDWLSi','gx_rs_record/2zGNCdpIt1Fr4UPKd1uq-V/GX-RS-2016-Y-8-06.pdf','2zGNCdpIt1Fr4UPKd1uq-V','2017-07-18 07:23:30'),('2zFhqU7ON5_ow0OOTqat-q','gx_rs_record/0Xp20T91td_pyaR35y2c3a/GX-RS-2016-Y-3-06.pdf','0Xp20T91td_pyaR35y2c3a','2017-07-18 07:22:42'),('2Zipssf3pd3URp9nsxgs6x','gx_rs_record/27kVugX1hdgUnUHc8-fHCQ/GX-RS-2016-Y-7-09.pdf','27kVugX1hdgUnUHc8-fHCQ','2017-07-18 07:23:14'),('2_pQGnYo53IXA0y7h3qlmA','gx_rs_record/2FwsK4ba1bw8COEAx0tBhI/GX-RS-2016-Y-9-07.pdf','2FwsK4ba1bw8COEAx0tBhI','2017-07-18 07:24:06'),('30bh2j3aR79V22pB_nZmCd','gx_rs_record/39uCb9e8Vd7HhAB5ku79ad/GX-RS-2016-Y-2-01.pdf','39uCb9e8Vd7HhAB5ku79ad','2017-07-18 07:21:44'),('37oRcGIzVewUvh_j6Q0hfn','gx_rs_record/2LWmrVBYhbdE8JOgbH475Z/GX-RS-2016-Y-8-09.pdf','2LWmrVBYhbdE8JOgbH475Z','2017-07-18 07:23:28'),('392jM1rOt8N9iyGiIXc_vB','gx_rs_record/1VVWBmSERbfFL-x3Yr9cvf/GX-RS-2016-Y-3-04.pdf','1VVWBmSERbfFL-x3Yr9cvf','2017-07-18 07:22:42'),('3ApXqw5WNezqsT6RDp1rNS','gx_rs_record/1SkexO3XV7lGMR2FhxNyaM/GX-RS-2016-Y-1-02.pdf','1SkexO3XV7lGMR2FhxNyaM','2017-07-18 07:24:27'),('3bI51utDFaNpeKVnPjE6uX','gx_rs_record/2LzOvMWJJ5IU3FaVBcgfYV/GX-RS-2016-Y-6-05.pdf','2LzOvMWJJ5IU3FaVBcgfYV','2017-07-18 07:22:24'),('3C9KpS3E91bVaOvDQpaSZn','gx_rs_record/2HwXNWXnJ2wXHeiIYQl3aX/GX-RS-2016-Y-2-06.pdf','2HwXNWXnJ2wXHeiIYQl3aX','2017-07-18 07:21:42'),('3czX3ySqB7v9MByh5CaxaX','gx_rs_record/2F4etVbTJ9F9mpkauhgQF1/GX-RS-2016-Y-2-08.pdf','2F4etVbTJ9F9mpkauhgQF1','2017-07-18 07:21:42'),('3DFpcK6KN0aEYVWy0BGfMJ','gx_rs_record/0-Xyi0wHZ83HvjoHUq1Ng7/GX-RS-2016-Y-5-02.pdf','0-Xyi0wHZ83HvjoHUq1Ng7','2017-07-18 07:24:43'),('3hh56iqmR4382uza87E1G0','gx_rs_record/2R_voI5Yhez8FJHW9XWyeJ/GX-RS-2016-Y-10-02.pdf','2R_voI5Yhez8FJHW9XWyeJ','2017-07-18 07:21:23'),('3jJOMGpVt3aF7smF2hy1Iw','gx_rs_record/1KGvmWRh193X_mqZedZqCn/GX-RS-2016-Y-7-07.pdf','1KGvmWRh193X_mqZedZqCn','2017-07-18 07:23:12'),('3miLn-6y1f7aura7jPfarM','gx_rs_record/0w1YQrNlJ9Yri6CtY3STC-/GX-RS-2016-Y-10-04.pdf','0w1YQrNlJ9Yri6CtY3STC-','2017-07-18 07:21:17'),('3mUULBmfh7Y9b0ywWlx-FE','gx_rs_record/14b3lzZJp7MoEjXjpeifMQ/GX-RS-2016-Y-10-07.pdf','14b3lzZJp7MoEjXjpeifMQ','2017-07-18 07:21:20'),('3nkXOjJVB8sbn_Yg4Lv7sg','gx_rs_record/0iC_IYCclcErNxsxdEFxEq/GX-RS-2016-Y-9-08.pdf','0iC_IYCclcErNxsxdEFxEq','2017-07-18 07:24:04'),('3pGV5_XfF1coUMrQ9EFszQ','gx_rs_record/2NfE4W9eh3NWa7W_bKmEgT/GX-RS-2016-Y-10-08.pdf','2NfE4W9eh3NWa7W_bKmEgT','2017-07-18 07:21:23'),('3RMIMOSqR7HryEGuM5UPw4','gx_rs_record/3jgD0k9KNbiraUMLfYUlFk/GX-RS-2016-Y-5-04.pdf','3jgD0k9KNbiraUMLfYUlFk','2017-07-18 07:24:47'),('3RziezCkFed9CRIe4opbLm','gx_rs_record/0U6J4vU2d239XjHLFAD1Bc/GX-RS-2016-Y-8-05.pdf','0U6J4vU2d239XjHLFAD1Bc','2017-07-18 07:23:27'),('3THjl-Cct8ZUi0o7N-cW3V','gx_rs_record/2dapI2tYl2Mrw3oKVKYUZi/GX-RS-2016-Y-6-04.pdf','2dapI2tYl2Mrw3oKVKYUZi','2017-07-18 07:22:23'),('3TVQTYgEFbyp2ZUF0OcJea','gx_rs_record/3jg3ETt9F7uUrR_SB_iOnZ/GX-RS-2016-Y-4-08.pdf','3jg3ETt9F7uUrR_SB_iOnZ','2017-07-18 07:23:47'),('3VRKI-oEVaopemRmHZi3FS','gx_rs_record/0W4gLmoG1eeHkcEnrQRdgM/GX-RS-2016-Y-3-09.pdf','0W4gLmoG1eeHkcEnrQRdgM','2017-07-18 07:22:42'),('3WBxH2G4xaKH7GaoABfdiw','gx_rs_record/1AcyH1mRl9E8RUiblCouaO/GX-RS-2016-Y-7-08.pdf','1AcyH1mRl9E8RUiblCouaO','2017-07-18 07:23:11'),('3WtqQ1kDBdRHeRp76eQ3iy','gx_rs_record/1x39rsOiRa48olo6lLj2RS/GX-RS-2016-Y-10-05.pdf','1x39rsOiRa48olo6lLj2RS','2017-07-18 07:21:22'),('3Yb82PJnJ7jVLVWstZvUtm','gx_rs_record/3lS_A-84F5kowYDMoeNF3H/GX-RS-2016-Y-10-09.pdf','3lS_A-84F5kowYDMoeNF3H','2017-07-18 07:21:24'),('3YfCPJRsxclFqY6k_3NyVi','gx_rs_record/1FPHT_TmR79o-bneSi8F8-/GX-RS-2016-Y-10-01.pdf','1FPHT_TmR79o-bneSi8F8-','2017-07-18 07:21:21'),('3YgGSw79V1D9zBrhZhtKzd','gx_rs_record/19DT6sMzJdcHAN7Frkh4eU/GX-RS-2016-Y-2-07.pdf','19DT6sMzJdcHAN7Frkh4eU','2017-07-18 07:21:41'),('3zWb9dHmd3tXYSXM3oKvSJ','gx_rs_record/2pRm79pet4KGspBW6NZycm/GX-RS-2016-Y-9-03.pdf','2pRm79pet4KGspBW6NZycm','2017-07-18 07:24:07');
/*!40000 ALTER TABLE `gx_rs_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_rs_piece`
--

DROP TABLE IF EXISTS `gx_rs_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_rs_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_rs_piece`
--

LOCK TABLES `gx_rs_piece` WRITE;
/*!40000 ALTER TABLE `gx_rs_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_rs_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_rs_piecedocument`
--

DROP TABLE IF EXISTS `gx_rs_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_rs_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_RS_pieceid_pieceid` (`recordid`),
  CONSTRAINT `GX_RS_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `gx_rs_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_rs_piecedocument`
--

LOCK TABLES `gx_rs_piecedocument` WRITE;
/*!40000 ALTER TABLE `gx_rs_piecedocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_rs_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_rs_record`
--

DROP TABLE IF EXISTS `gx_rs_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_rs_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_rs_record`
--

LOCK TABLES `gx_rs_record` WRITE;
/*!40000 ALTER TABLE `gx_rs_record` DISABLE KEYS */;
INSERT INTO `gx_rs_record` VALUES ('0-Xyi0wHZ83HvjoHUq1Ng7','GX-RS-2016-Y-5-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','2I0Ia2wDZ1pbVXN7_0lXC5','superadmin',NULL,'2017-07-18 07:20:47',NULL),('07uUiCEF98jVCPZSwb8_Hp','GX-RS-2016-Y-8-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','3i0jmh-JZ2898LERP2ybUI','superadmin',NULL,'2017-07-18 07:20:51',NULL),('0aN1T8OuJbLaPsH6d19oof','GX-RS-2016-Y-6-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','319mqBUQ175Xq6ToVNx_QK','superadmin',NULL,'2017-07-18 07:20:49',NULL),('0bGvDPIUBbB8SrgyvSMHja','GX-RS-2016-Y-3-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','6','','1','3KBA3hfwtbUFzivbPyEEFt','superadmin',NULL,'2017-07-18 07:20:45',NULL),('0eL2hIfZd4JriFGUaFGVLA','GX-RS-2016-Y-1-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','3hUPsRJxxd-WH8AfNSQc6-','superadmin',NULL,'2017-07-18 07:20:44',NULL),('0Fbv3_-6l8aUNR93YEM9xL','GX-RS-2016-Y-1-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','3hUPsRJxxd-WH8AfNSQc6-','superadmin',NULL,'2017-07-18 07:20:43',NULL),('0iC_IYCclcErNxsxdEFxEq','GX-RS-2016-Y-9-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','27TMFn7qR96G6Hz0X4iXn3','superadmin',NULL,'2017-07-18 07:20:52',NULL),('0IhBQjH9x8ob-F20f-obtF','GX-RS-2016-Y-6-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','319mqBUQ175Xq6ToVNx_QK','superadmin',NULL,'2017-07-18 07:20:48',NULL),('0kJZywFoR7h8Dam8O7Lr5g','GX-RS-2016-Y-8-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','6','','1','3i0jmh-JZ2898LERP2ybUI','superadmin',NULL,'2017-07-18 07:20:50',NULL),('0lb-8hS-pbYUa9cp2t3aes','GX-BDC-2000-D10-1-1',NULL,'56','14','14','1','111111111111','','0','222','1','0Z6SM-iwF8uH4SPRZr7ZVu','superadmin','','2017-07-26 03:38:45',NULL),('0oxnCO67N8W8ZyT3k9xBqQ','GX-RS-2016-Y-1-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','2','','1','3hUPsRJxxd-WH8AfNSQc6-','superadmin',NULL,'2017-07-18 07:20:44',NULL),('0QXYebKUJ0bqiEZylxorAX','GX-RS-2016-Y-4-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','238l6BVXd9rWCAFYG7bfu2','superadmin',NULL,'2017-07-18 07:20:46',NULL),('0SOGv1YVJeRUSbPlIuHd6p','GX-RS-2016-Y-2-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','6','','1','2atTWla_d4UogAtwWSKFM7','superadmin',NULL,'2017-07-18 07:20:44',NULL),('0STfnBLep1mUxPpQwxDRkV','GX-RS-2016-Y-6-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','319mqBUQ175Xq6ToVNx_QK','superadmin',NULL,'2017-07-18 07:20:48',NULL),('0T7XaU2bV7X8GgGkDMaPnH','GX-RS-2016-Y-1-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','3hUPsRJxxd-WH8AfNSQc6-','superadmin',NULL,'2017-07-18 07:20:44',NULL),('0tQi3vHN51jpzV94sPrzD8','GX-RS-2016-Y-4-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','238l6BVXd9rWCAFYG7bfu2','superadmin',NULL,'2017-07-18 07:20:46',NULL),('0U6J4vU2d239XjHLFAD1Bc','GX-RS-2016-Y-8-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','3i0jmh-JZ2898LERP2ybUI','superadmin',NULL,'2017-07-18 07:20:51',NULL),('0UNSg5g2paN8hJPXvVjfJx','GX-RS-2016-Y-7-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','28avrcaRh3aFhEIZnAVDD6','superadmin',NULL,'2017-07-18 07:20:50',NULL),('0vg40VnwNejVcKQqAqWq5v','GX-RS-2016-Y-9-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','27TMFn7qR96G6Hz0X4iXn3','superadmin',NULL,'2017-07-18 07:20:51',NULL),('0VzZWwMTt5Vbn9FLM1Xk-6','GX-RS-2016-Y-7-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','28avrcaRh3aFhEIZnAVDD6','superadmin',NULL,'2017-07-18 07:20:50',NULL),('0w1YQrNlJ9Yri6CtY3STC-','GX-RS-2016-Y-10-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','3','','1','05a3ryLelaeERhqOFO3wUr','superadmin',NULL,'2017-07-18 07:20:53',NULL),('0W4gLmoG1eeHkcEnrQRdgM','GX-RS-2016-Y-3-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','2','','1','3KBA3hfwtbUFzivbPyEEFt','superadmin',NULL,'2017-07-18 07:20:46',NULL),('0WjhrT-Mt4fE-xfPhNYm4v','GX-RS-2016-Y-4-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','238l6BVXd9rWCAFYG7bfu2','superadmin',NULL,'2017-07-18 07:20:47',NULL),('0Xp20T91td_pyaR35y2c3a','GX-RS-2016-Y-3-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','3KBA3hfwtbUFzivbPyEEFt','superadmin',NULL,'2017-07-18 07:20:46',NULL),('0Z2uhgTthduqBdS1bjPxWj','GX-RS-2016-Y-6-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','319mqBUQ175Xq6ToVNx_QK','superadmin',NULL,'2017-07-18 07:20:49',NULL),('10vN_hAK5cuXiTKX2TegQ1','GX-RS-2016-Y-9-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','1','','1','27TMFn7qR96G6Hz0X4iXn3','superadmin',NULL,'2017-07-18 07:20:52',NULL),('12BFuvWUJ8oV3V3kRH_NS4','GX-RS-2016-Y-5-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','2I0Ia2wDZ1pbVXN7_0lXC5','superadmin',NULL,'2017-07-18 07:20:48',NULL),('14b3lzZJp7MoEjXjpeifMQ','GX-RS-2016-Y-10-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','05a3ryLelaeERhqOFO3wUr','superadmin',NULL,'2017-07-18 07:20:53',NULL),('16hb86U-N5tXTrfu4JDDzf','GX-RS-2016-Y-7-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','6','','1','28avrcaRh3aFhEIZnAVDD6','superadmin',NULL,'2017-07-18 07:20:50',NULL),('18v71T7VtdOWHBNQ43vuIT','GX-RS-2016-Y-4-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','238l6BVXd9rWCAFYG7bfu2','superadmin',NULL,'2017-07-18 07:20:47',NULL),('19DT6sMzJdcHAN7Frkh4eU','GX-RS-2016-Y-2-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','2atTWla_d4UogAtwWSKFM7','superadmin',NULL,'2017-07-18 07:20:45',NULL),('1AcyH1mRl9E8RUiblCouaO','GX-RS-2016-Y-7-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','28avrcaRh3aFhEIZnAVDD6','superadmin',NULL,'2017-07-18 07:20:50',NULL),('1FPHT_TmR79o-bneSi8F8-','GX-RS-2016-Y-10-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','05a3ryLelaeERhqOFO3wUr','superadmin',NULL,'2017-07-18 07:20:52',NULL),('1GUajpi9B2bVnZB4JvmAo6','GX-RS-2016-Y-10-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','05a3ryLelaeERhqOFO3wUr','superadmin',NULL,'2017-07-18 07:20:53',NULL),('1jL3Ek77he_H5-8Yah0p9e','GX-RS-2016-Y-5-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','2I0Ia2wDZ1pbVXN7_0lXC5','superadmin',NULL,'2017-07-18 07:20:47',NULL),('1k7gWeYMh79FeexI_cifOB','GX-RS-2016-Y-5-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','2','','1','2I0Ia2wDZ1pbVXN7_0lXC5','superadmin',NULL,'2017-07-18 07:20:48',NULL),('1KGvmWRh193X_mqZedZqCn','GX-RS-2016-Y-7-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','28avrcaRh3aFhEIZnAVDD6','superadmin',NULL,'2017-07-18 07:20:50',NULL),('1M86JJ1217KHvfDQcB3JYx','GX-RS-2016-Y-8-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','3','','1','3i0jmh-JZ2898LERP2ybUI','superadmin',NULL,'2017-07-18 07:20:51',NULL),('1pRD_Lf1xbZGQDPWvcXMml','GX-RS-2016-Y-2-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','3','','1','2atTWla_d4UogAtwWSKFM7','superadmin',NULL,'2017-07-18 07:20:44',NULL),('1S-lbcTvF8JFoQWd_ttRi-','GX-RS-2016-Y-7-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','28avrcaRh3aFhEIZnAVDD6','superadmin',NULL,'2017-07-18 07:20:49',NULL),('1SkexO3XV7lGMR2FhxNyaM','GX-RS-2016-Y-1-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','3hUPsRJxxd-WH8AfNSQc6-','superadmin',NULL,'2017-07-18 07:20:43',NULL),('1uoByW9Rx2-bwjIVZZO8nJ','GX-RS-2016-Y-4-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','2','','1','238l6BVXd9rWCAFYG7bfu2','superadmin',NULL,'2017-07-18 07:20:47',NULL),('1VVWBmSERbfFL-x3Yr9cvf','GX-RS-2016-Y-3-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','3','','1','3KBA3hfwtbUFzivbPyEEFt','superadmin',NULL,'2017-07-18 07:20:45',NULL),('1x39rsOiRa48olo6lLj2RS','GX-RS-2016-Y-10-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','05a3ryLelaeERhqOFO3wUr','superadmin',NULL,'2017-07-18 07:20:53',NULL),('1yAdRTGL14srEAR32WmUDX','GX-RS-2016-Y-3-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','3KBA3hfwtbUFzivbPyEEFt','superadmin',NULL,'2017-07-18 07:20:46',NULL),('1z8Vl6zM96ybblRymFjWln','GX-RS-2016-Y-3-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','3KBA3hfwtbUFzivbPyEEFt','superadmin',NULL,'2017-07-18 07:20:45',NULL),('1Zu1h9EOtczrN95MhlL1wN','GX-RS-2016-Y-7-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','3','','1','28avrcaRh3aFhEIZnAVDD6','superadmin',NULL,'2017-07-18 07:20:50',NULL),('1_rPGgWIxd8rVhuBkPBdkr','GX-RS-2016-Y-3-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','3KBA3hfwtbUFzivbPyEEFt','superadmin',NULL,'2017-07-18 07:20:46',NULL),('27kVugX1hdgUnUHc8-fHCQ','GX-RS-2016-Y-7-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','2','','1','28avrcaRh3aFhEIZnAVDD6','superadmin',NULL,'2017-07-18 07:20:50',NULL),('2chUcAMIJ4MUd8lHc9Vp44','GX-RS-2016-Y-5-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','2I0Ia2wDZ1pbVXN7_0lXC5','superadmin',NULL,'2017-07-18 07:20:48',NULL),('2dapI2tYl2Mrw3oKVKYUZi','GX-RS-2016-Y-6-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','3','','1','319mqBUQ175Xq6ToVNx_QK','superadmin',NULL,'2017-07-18 07:20:49',NULL),('2EPbb7FNN50oayR3ZkUiKz','GX-RS-2016-Y-5-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','2I0Ia2wDZ1pbVXN7_0lXC5','superadmin',NULL,'2017-07-18 07:20:48',NULL),('2F4etVbTJ9F9mpkauhgQF1','GX-RS-2016-Y-2-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','2atTWla_d4UogAtwWSKFM7','superadmin',NULL,'2017-07-18 07:20:45',NULL),('2FwsK4ba1bw8COEAx0tBhI','GX-RS-2016-Y-9-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','27TMFn7qR96G6Hz0X4iXn3','superadmin',NULL,'2017-07-18 07:20:52',NULL),('2hsq47napdUUvgG3ZW3MLg','GX-RS-2016-Y-5-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','6','','1','2I0Ia2wDZ1pbVXN7_0lXC5','superadmin',NULL,'2017-07-18 07:20:47',NULL),('2HwXNWXnJ2wXHeiIYQl3aX','GX-RS-2016-Y-2-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','2atTWla_d4UogAtwWSKFM7','superadmin',NULL,'2017-07-18 07:20:45',NULL),('2knUM2Rd1fEHTHhv0769dj','GX-RS-2016-Y-4-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','6','','1','238l6BVXd9rWCAFYG7bfu2','superadmin',NULL,'2017-07-18 07:20:46',NULL),('2LWmrVBYhbdE8JOgbH475Z','GX-RS-2016-Y-8-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','2','','1','3i0jmh-JZ2898LERP2ybUI','superadmin',NULL,'2017-07-18 07:20:51',NULL),('2LzOvMWJJ5IU3FaVBcgfYV','GX-RS-2016-Y-6-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','319mqBUQ175Xq6ToVNx_QK','superadmin',NULL,'2017-07-18 07:20:49',NULL),('2MEf9oY1VfTG4_vpt9BBTQ','GX-RS-2016-Y-8-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','3i0jmh-JZ2898LERP2ybUI','superadmin',NULL,'2017-07-18 07:20:51',NULL),('2NfE4W9eh3NWa7W_bKmEgT','GX-RS-2016-Y-10-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','05a3ryLelaeERhqOFO3wUr','superadmin',NULL,'2017-07-18 07:20:53',NULL),('2OdgpxPgt5J977a9kbH8Ey','GX-RS-2016-Y-1-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','3','','1','3hUPsRJxxd-WH8AfNSQc6-','superadmin',NULL,'2017-07-18 07:20:43',NULL),('2pRm79pet4KGspBW6NZycm','GX-RS-2016-Y-9-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','1','','1','27TMFn7qR96G6Hz0X4iXn3','superadmin',NULL,'2017-07-18 07:20:51',NULL),('2R_voI5Yhez8FJHW9XWyeJ','GX-RS-2016-Y-10-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','05a3ryLelaeERhqOFO3wUr','superadmin',NULL,'2017-07-18 07:20:52',NULL),('2SwkVCi2VdPVvotzGmC1CP','GX-RS-2016-Y-2-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','2atTWla_d4UogAtwWSKFM7','superadmin',NULL,'2017-07-18 07:20:44',NULL),('2t_ymrKCBdoo_n0U-AX1fC','GX-RS-2016-Y-8-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','3i0jmh-JZ2898LERP2ybUI','superadmin',NULL,'2017-07-18 07:20:50',NULL),('2yFvrqEYN8krxmj8AFQGE-','GX-RS-2016-Y-2-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','2','','1','2atTWla_d4UogAtwWSKFM7','superadmin',NULL,'2017-07-18 07:20:45',NULL),('2ykGF9jgh6SGPDBvw1rd0-','GX-RS-2016-Y-1-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','3hUPsRJxxd-WH8AfNSQc6-','superadmin',NULL,'2017-07-18 07:20:43',NULL),('2z7kCXc1x3x8SKUcjdMfr-','GX-RS-2016-Y-10-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','6','','1','05a3ryLelaeERhqOFO3wUr','superadmin',NULL,'2017-07-18 07:20:53',NULL),('2zGNCdpIt1Fr4UPKd1uq-V','GX-RS-2016-Y-8-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','3i0jmh-JZ2898LERP2ybUI','superadmin',NULL,'2017-07-18 07:20:51',NULL),('3-0auI-dpdwHXZ1v1EuNw9','GX-RS-2016-Y-1-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','6','','1','3hUPsRJxxd-WH8AfNSQc6-','superadmin',NULL,'2017-07-18 07:20:43',NULL),('3-cZysPSd1Yb-BAF6GOB0X','GX-RS-2016-Y-2-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','2atTWla_d4UogAtwWSKFM7','superadmin',NULL,'2017-07-18 07:20:44',NULL),('37RPnFNEdbcUOVWFhF9hdh','GX-RS-2016-Y-8-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','3i0jmh-JZ2898LERP2ybUI','superadmin',NULL,'2017-07-18 07:20:50',NULL),('39uCb9e8Vd7HhAB5ku79ad','GX-RS-2016-Y-2-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','2atTWla_d4UogAtwWSKFM7','superadmin',NULL,'2017-07-18 07:20:44',NULL),('3BK_TFeRJ7bqE-R5mZAXlp','GX-RS-2016-Y-3-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','3KBA3hfwtbUFzivbPyEEFt','superadmin',NULL,'2017-07-18 07:20:45',NULL),('3DWgPLNIlepXyTz9ioLbh4','GX-RS-2016-Y-1-01',NULL,'45','19','13','1','履历材料','反映个人自然情况、经历、家庭和社会关系等基本情况为主要内容的履历材料','5','','1','3hUPsRJxxd-WH8AfNSQc6-','superadmin',NULL,'2017-07-18 07:20:43',NULL),('3Fz5eJ3AF2yUyIZhH3t05c','GX-RS-2016-Y-9-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','27TMFn7qR96G6Hz0X4iXn3','superadmin',NULL,'2017-07-18 07:20:52',NULL),('3G5IjJkDJcppt8xr3nSwsB','GX-RS-2016-Y-4-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','238l6BVXd9rWCAFYG7bfu2','superadmin',NULL,'2017-07-18 07:20:47',NULL),('3GyIGJO3h0xoE5WpSVZdH7','GX-RS-2016-Y-7-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','28avrcaRh3aFhEIZnAVDD6','superadmin',NULL,'2017-07-18 07:20:49',NULL),('3I1qcBHkd49oLweGx4yCBF','GX-RS-2016-Y-4-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','3','','1','238l6BVXd9rWCAFYG7bfu2','superadmin',NULL,'2017-07-18 07:20:46',NULL),('3IWMZ-oCBatUfULcVyQoZm','GX-RS-2016-Y-9-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','2','','1','27TMFn7qR96G6Hz0X4iXn3','superadmin',NULL,'2017-07-18 07:20:52',NULL),('3jg3ETt9F7uUrR_SB_iOnZ','GX-RS-2016-Y-4-08',NULL,'45','19','13','8','处分材料','违犯党纪、政纪、国法受到纪律检查部门、监察部门或其他审理部门，对其所犯错误进行调查处理形成的材料','2','','1','238l6BVXd9rWCAFYG7bfu2','superadmin',NULL,'2017-07-18 07:20:47',NULL),('3jgD0k9KNbiraUMLfYUlFk','GX-RS-2016-Y-5-04',NULL,'45','19','13','4','学历、培训、评聘专业技术职务与评定岗位技能的材料','个人的学历、学位，培训和评聘专业技术职务评定岗位技能的审批材料','3','','1','2I0Ia2wDZ1pbVXN7_0lXC5','superadmin',NULL,'2017-07-18 07:20:48',NULL),('3KYAcZPPV95Hvodfzigj1b','GX-RS-2016-Y-6-03',NULL,'45','19','13','3','鉴定、考察、考核材料','组织人事部门通过各种途径，对基本情况形成的评价性材料及个人所写的自我鉴定材料','6','','1','319mqBUQ175Xq6ToVNx_QK','superadmin',NULL,'2017-07-18 07:20:48',NULL),('3lS_A-84F5kowYDMoeNF3H','GX-RS-2016-Y-10-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','2','','1','05a3ryLelaeERhqOFO3wUr','superadmin',NULL,'2017-07-18 07:20:53',NULL),('3pLj7vuLd7qUUC7JbCgOeq','GX-RS-2016-Y-6-09',NULL,'45','19','13','9','录用、任免、工资待遇、退休等组织审批材料','由组织办理的任免、选举、授衔、晋级、录用、聘用、复员退伍、转业、工资待遇、出国、离退休及退职材料；各种代表会代表登记表等材料','2','','1','319mqBUQ175Xq6ToVNx_QK','superadmin',NULL,'2017-07-18 07:20:49',NULL),('3SonjqnB9c4FcliI1FpZ5s','GX-RS-2016-Y-5-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','2I0Ia2wDZ1pbVXN7_0lXC5','superadmin',NULL,'2017-07-18 07:20:48',NULL),('3uZmj-attfOac76SCnUSsf','GX-RS-2016-Y-9-02',NULL,'45','19','13','2','自传材料','本人撰写的个人经历、成长过程、思想演变及家庭情况、社会关系的自传性质的材料','4','','1','27TMFn7qR96G6Hz0X4iXn3','superadmin',NULL,'2017-07-18 07:20:51',NULL),('3w5gSf75Z4upsHxPpzHfzg','GX-RS-2016-Y-3-05',NULL,'45','19','13','5','政治历史情况的审查材料','对政治历史、经历、出身、社会关系、党籍、参加工作时间等问题进行审查形成的材料','2','','1','3KBA3hfwtbUFzivbPyEEFt','superadmin',NULL,'2017-07-18 07:20:45',NULL),('3z1GIkOddcZqBGx3Nzftf4','GX-RS-2016-Y-6-07',NULL,'45','19','13','7','奖励材料','县团级以上单位形成的，经组织正式命名授予的各种奖励或表彰的材料','5','','1','319mqBUQ175Xq6ToVNx_QK','superadmin',NULL,'2017-07-18 07:20:49',NULL),('3_ngpR1zF3zElrMzxxfMjW','GX-RS-2016-Y-9-06',NULL,'45','19','13','6','加入党、团材料','参加中国共产党、共青团及民主党派的有关材料','2','','1','27TMFn7qR96G6Hz0X4iXn3','superadmin',NULL,'2017-07-18 07:20:52',NULL);
/*!40000 ALTER TABLE `gx_rs_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_rs_volume`
--

DROP TABLE IF EXISTS `gx_rs_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_rs_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_rs_volume`
--

LOCK TABLES `gx_rs_volume` WRITE;
/*!40000 ALTER TABLE `gx_rs_volume` DISABLE KEYS */;
INSERT INTO `gx_rs_volume` VALUES ('05a3ryLelaeERhqOFO3wUr','GX-RS-2016-Y-10',NULL,'45','19','13','李玲玉','','','1-10','1','superadmin','2017-07-18 07:20:35',NULL),('0Z6SM-iwF8uH4SPRZr7ZVu','GX-RS-2016-Y-11',NULL,'56','14','14','11',NULL,'11','22','1','superadmin','2017-07-26 03:39:23',NULL),('238l6BVXd9rWCAFYG7bfu2','GX-RS-2016-Y-4',NULL,'45','19','13','许英哲','','','1-4','1','superadmin','2017-07-18 07:20:34',NULL),('27TMFn7qR96G6Hz0X4iXn3','GX-RS-2016-Y-9',NULL,'45','19','13','张强','','','1-9','1','superadmin','2017-07-18 07:20:35',NULL),('28avrcaRh3aFhEIZnAVDD6','GX-RS-2016-Y-7',NULL,'45','19','13','孙慧','','','1-7','1','superadmin','2017-07-18 07:20:35',NULL),('2atTWla_d4UogAtwWSKFM7','GX-RS-2016-Y-2',NULL,'45','19','13','李四','','','1-2','1','superadmin','2017-07-18 07:20:34',NULL),('2I0Ia2wDZ1pbVXN7_0lXC5','GX-RS-2016-Y-5',NULL,'45','19','13','郑楠','','','1-5','1','superadmin','2017-07-18 07:20:34',NULL),('319mqBUQ175Xq6ToVNx_QK','GX-RS-2016-Y-6',NULL,'45','19','13','罗文涛','','','1-6','1','superadmin','2017-07-18 07:20:34',NULL),('3hUPsRJxxd-WH8AfNSQc6-','GX-RS-2016-Y-1',NULL,'45','19','13','张三','','','1-1','1','superadmin','2017-07-18 07:20:34',NULL),('3i0jmh-JZ2898LERP2ybUI','GX-RS-2016-Y-8',NULL,'45','19','13','王兵','','','1-8','1','superadmin','2017-07-18 07:20:35',NULL),('3KBA3hfwtbUFzivbPyEEFt','GX-RS-2016-Y-3',NULL,'45','19','13','马志兴','','','1-3','1','superadmin','2017-07-18 07:20:34',NULL);
/*!40000 ALTER TABLE `gx_rs_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_xz_document`
--

DROP TABLE IF EXISTS `gx_xz_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_xz_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_XZ_recordid_recordid` (`recordid`),
  CONSTRAINT `GX_XZ_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `gx_xz_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_xz_document`
--

LOCK TABLES `gx_xz_document` WRITE;
/*!40000 ALTER TABLE `gx_xz_document` DISABLE KEYS */;
INSERT INTO `gx_xz_document` VALUES ('0Yb0_fwnJ6rUwB0uTuLUvc','gx_xz_record/1NguQANI99iaX6coWTIr4Q/2001-XZ-永久-1-0002.doc','1NguQANI99iaX6coWTIr4Q','2017-07-18 07:28:03'),('3guOKjh_d4RGhU6CBHFIrf','gx_xz_record/2rwmjXWDp3MW7ACjUZNrnj/2001-XZ-永久-1-0001.doc','2rwmjXWDp3MW7ACjUZNrnj','2017-07-18 07:28:04');
/*!40000 ALTER TABLE `gx_xz_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_xz_piece`
--

DROP TABLE IF EXISTS `gx_xz_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_xz_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `column1` varchar(10) DEFAULT NULL,
  `column2` varchar(99) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_xz_piece`
--

LOCK TABLES `gx_xz_piece` WRITE;
/*!40000 ALTER TABLE `gx_xz_piece` DISABLE KEYS */;
INSERT INTO `gx_xz_piece` VALUES ('1oNwnNjztf5bgZ9hCeWjQ_',NULL,NULL,'56','14','14',NULL,'1','','1','','','','0',NULL,'superadmin','','2017-07-21 03:37:48',NULL);
/*!40000 ALTER TABLE `gx_xz_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_xz_piecedocument`
--

DROP TABLE IF EXISTS `gx_xz_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_xz_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_XZ_pieceid_pieceid` (`recordid`),
  CONSTRAINT `GX_XZ_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `gx_xz_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_xz_piecedocument`
--

LOCK TABLES `gx_xz_piecedocument` WRITE;
/*!40000 ALTER TABLE `gx_xz_piecedocument` DISABLE KEYS */;
INSERT INTO `gx_xz_piecedocument` VALUES ('3Byx143Nt8AXTxQ2rxw5CO','gx_xz/1oNwnNjztf5bgZ9hCeWjQ_/王力宏-龙的传人(CCTV音乐频道).mp3','1oNwnNjztf5bgZ9hCeWjQ_','2017-07-21 03:37:48');
/*!40000 ALTER TABLE `gx_xz_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_xz_record`
--

DROP TABLE IF EXISTS `gx_xz_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_xz_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `column5` varchar(99) DEFAULT NULL,
  `column6` varchar(99) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_xz_record`
--

LOCK TABLES `gx_xz_record` WRITE;
/*!40000 ALTER TABLE `gx_xz_record` DISABLE KEYS */;
INSERT INTO `gx_xz_record` VALUES ('1NguQANI99iaX6coWTIr4Q','2001-XZ-永久-1-0002',NULL,'55','9','13','2','关于对张三等15名同学的处分决定','','','','2002\\02\\03','北京博睿思达数字科技有限公司','1','0hgokgElV1Lr5SePXn64uE','superadmin',NULL,'2017-07-18 07:27:49',NULL),('2rwmjXWDp3MW7ACjUZNrnj','2001-XZ-永久-1-0001',NULL,'55','9','13','1','关于举办第四届大学生辩论赛的通知','','','','2002\\02\\02','北京博睿思达数字科技有限公司','1','0hgokgElV1Lr5SePXn64uE','superadmin',NULL,'2017-07-18 07:27:49',NULL);
/*!40000 ALTER TABLE `gx_xz_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_xz_volume`
--

DROP TABLE IF EXISTS `gx_xz_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_xz_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `column3` varchar(10) DEFAULT NULL,
  `column4` varchar(99) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_xz_volume`
--

LOCK TABLES `gx_xz_volume` WRITE;
/*!40000 ALTER TABLE `gx_xz_volume` DISABLE KEYS */;
INSERT INTO `gx_xz_volume` VALUES ('0hgokgElV1Lr5SePXn64uE','2001-XZ-永久-1',NULL,'55','9','13','行政发文','','','','200101','北京博睿思达数字科技有限公司','1','superadmin','2017-07-18 07:27:40',NULL);
/*!40000 ALTER TABLE `gx_xz_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_zp_document`
--

DROP TABLE IF EXISTS `gx_zp_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_zp_document` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_ZP_recordid_recordid` (`recordid`),
  CONSTRAINT `GX_ZP_recordid_recordid` FOREIGN KEY (`recordid`) REFERENCES `gx_zp_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_zp_document`
--

LOCK TABLES `gx_zp_document` WRITE;
/*!40000 ALTER TABLE `gx_zp_document` DISABLE KEYS */;
INSERT INTO `gx_zp_document` VALUES ('035rGR-Ud5E82ApBiLc3Ek','gx_zp_record/0uLDUer4d5vUPN-9V0s8mB/2015-办公室-永久-1-0003.png','0uLDUer4d5vUPN-9V0s8mB','2017-07-17 05:47:42'),('0Ebg8GHB17SHCHn4KPazMB','gx_zp_record/0XbfrIaUpf9G7e227zBkJ6/2015-办公室-永久-1-0002.png','0XbfrIaUpf9G7e227zBkJ6','2017-07-17 05:47:42'),('0eX7NUYAF6m8jLHZOqfLdj','gx_zp_record/0vaNHvzQ13jGsRXKqJwxV9/2015-办公室-永久-1-0010.png','0vaNHvzQ13jGsRXKqJwxV9','2017-07-17 05:47:42'),('0H3N3XRi19kpFiVjm1jwJC','gx_zp_record/0AVMIuv_JbEp-_oow46hXH/2015-办公室-永久-1-0004.png','0AVMIuv_JbEp-_oow46hXH','2017-07-17 05:47:42'),('0PN5EbFtd6dG_947NvOQEX','gx_zp_record/0dOsaL8FtbyETrlYZ7EhVJ/2015-办公室-永久-1-0005.png','0dOsaL8FtbyETrlYZ7EhVJ','2017-07-17 05:47:42'),('1OG1daY6x3ho80yuTtW2GJ','gx_zp_record/38Ji4cDv56XG5m8bDvo-dY/2015-办公室-永久-1-0006.png','38Ji4cDv56XG5m8bDvo-dY','2017-07-17 05:47:43'),('2e63BcEsl7tag71XVK0GNB','gx_zp_record/3C03fqc5J7-X1rvoLtyfZl/2015-办公室-永久-1-0007.png','3C03fqc5J7-X1rvoLtyfZl','2017-07-17 05:47:43'),('36SPNizdN2pH-WcKv4th3H','gx_zp_record/1oXP0p_TRaKHFqxf9cxf-x/2015-办公室-永久-1-0008.png','1oXP0p_TRaKHFqxf9cxf-x','2017-07-17 05:47:42'),('3GUrvFsZhaar1iBSCncy1c','gx_zp_record/2wfNJPjLNba9v8ZawXz6E0/2015-办公室-永久-1-0009.png','2wfNJPjLNba9v8ZawXz6E0','2017-07-17 05:47:43'),('3yVUyX23N5Yq-BLzX6Hpje','gx_zp_record/3VfDIqeyF6MrmsMtqmRAi-/2015-办公室-永久-1-0001.png','3VfDIqeyF6MrmsMtqmRAi-','2017-07-17 05:47:43');
/*!40000 ALTER TABLE `gx_zp_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_zp_piece`
--

DROP TABLE IF EXISTS `gx_zp_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_zp_piece` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_zp_piece`
--

LOCK TABLES `gx_zp_piece` WRITE;
/*!40000 ALTER TABLE `gx_zp_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_zp_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_zp_piecedocument`
--

DROP TABLE IF EXISTS `gx_zp_piecedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_zp_piecedocument` (
  `id` varchar(32) NOT NULL,
  `path` varchar(128) DEFAULT NULL,
  `recordid` varchar(32) DEFAULT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GX_ZP_pieceid_pieceid` (`recordid`),
  CONSTRAINT `GX_ZP_pieceid_pieceid` FOREIGN KEY (`recordid`) REFERENCES `gx_zp_piece` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_zp_piecedocument`
--

LOCK TABLES `gx_zp_piecedocument` WRITE;
/*!40000 ALTER TABLE `gx_zp_piecedocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `gx_zp_piecedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_zp_record`
--

DROP TABLE IF EXISTS `gx_zp_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_zp_record` (
  `id` varchar(32) NOT NULL,
  `recordNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `sequencNo` varchar(3) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `volumeid` varchar(32) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `tableid` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_zp_record`
--

LOCK TABLES `gx_zp_record` WRITE;
/*!40000 ALTER TABLE `gx_zp_record` DISABLE KEYS */;
INSERT INTO `gx_zp_record` VALUES ('0AVMIuv_JbEp-_oow46hXH','2015-办公室-永久-1-0004',NULL,'39','9','13','4','2013年北京高校档案工作会','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:19',NULL),('0dOsaL8FtbyETrlYZ7EhVJ','2015-办公室-永久-1-0005',NULL,'39','9','13','5','2009年度北京高校档案工作年会','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:19',NULL),('0uLDUer4d5vUPN-9V0s8mB','2015-办公室-永久-1-0003',NULL,'39','9','13','3','博睿思达许总工作报告','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:18',NULL),('0vaNHvzQ13jGsRXKqJwxV9','2015-办公室-永久-1-0010',NULL,'39','9','13','10','2013届优秀华业生风采','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:19',NULL),('0XbfrIaUpf9G7e227zBkJ6','2015-办公室-永久-1-0002',NULL,'39','9','13','2','2010年北京高校档案工作年会荣誉证书','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:18',NULL),('1oXP0p_TRaKHFqxf9cxf-x','2015-办公室-永久-1-0008',NULL,'39','9','13','8','1998届研究生毕业留念','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:19',NULL),('2wfNJPjLNba9v8ZawXz6E0','2015-办公室-永久-1-0009',NULL,'39','9','13','9','领导接见海关工作会议全体代表','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:19',NULL),('38Ji4cDv56XG5m8bDvo-dY','2015-办公室-永久-1-0006',NULL,'39','9','13','6','北京博睿思达数字科技有限公司许总工作报告','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:19',NULL),('3C03fqc5J7-X1rvoLtyfZl','2015-办公室-永久-1-0007',NULL,'39','9','13','7','2010届国际贸易学专业硕士研究生毕业合影','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:19',NULL),('3VfDIqeyF6MrmsMtqmRAi-','2015-办公室-永久-1-0001',NULL,'39','9','13','1','2010年北京高校档案工作年会参会留影','','','','1','1ttrEyHHBb1pxqlUq3cX1H','superadmin',NULL,'2017-07-17 05:44:18',NULL);
/*!40000 ALTER TABLE `gx_zp_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gx_zp_volume`
--

DROP TABLE IF EXISTS `gx_zp_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gx_zp_volume` (
  `id` varchar(32) NOT NULL,
  `volumeNo` varchar(255) DEFAULT NULL,
  `fondsid` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `department` varchar(3) DEFAULT NULL,
  `deadline` varchar(4) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `pagenum` varchar(8) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `checkstatus` varchar(4) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gx_zp_volume`
--

LOCK TABLES `gx_zp_volume` WRITE;
/*!40000 ALTER TABLE `gx_zp_volume` DISABLE KEYS */;
INSERT INTO `gx_zp_volume` VALUES ('1ttrEyHHBb1pxqlUq3cX1H','2015-办公室-永久-1',NULL,'39','9','13','精彩时刻','','','','1','superadmin','2017-07-17 05:43:35',NULL);
/*!40000 ALTER TABLE `gx_zp_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index0`
--

DROP TABLE IF EXISTS `index0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index0` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `no` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index0`
--

LOCK TABLES `index0` WRITE;
/*!40000 ALTER TABLE `index0` DISABLE KEYS */;
INSERT INTO `index0` VALUES (1,'刑事类','1','XS'),(2,'民事类','1','MS');
/*!40000 ALTER TABLE `index0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index1`
--

DROP TABLE IF EXISTS `index1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index1` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `no` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index1`
--

LOCK TABLES `index1` WRITE;
/*!40000 ALTER TABLE `index1` DISABLE KEYS */;
INSERT INTO `index1` VALUES (7,'法律顾问类','1','A'),(8,'其他非诉讼法律事务','1','B'),(9,'凡例','1','C'),(10,'123','-1','123');
/*!40000 ALTER TABLE `index1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indextable`
--

DROP TABLE IF EXISTS `indextable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indextable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indextable` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indextable`
--

LOCK TABLES `indextable` WRITE;
/*!40000 ALTER TABLE `indextable` DISABLE KEYS */;
INSERT INTO `indextable` VALUES (1,'index0','诉讼种类'),(2,'index1','非诉讼种类');
/*!40000 ALTER TABLE `indextable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `tableid` varchar(32) NOT NULL,
  `piecetableid` varchar(32) NOT NULL,
  `columnid` varchar(32) NOT NULL,
  `columnname` varchar(32) NOT NULL,
  `columnwidth` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES ('gx_jx_recordcontent1','gx_jx_piececontent1','col0','序号','3'),('gx_jx_recordcontent1','gx_jx_piececontent1','col1','姓名','99'),('gx_jx_recordcontent1','gx_jx_piececontent1','col2','身份证号','18'),('gx_jx_recordcontent1','gx_jx_piececontent1','col3','民族','99'),('gx_jx_recordcontent1','gx_jx_piececontent1','col4','专业','99');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `operator` varchar(32) NOT NULL,
  `event` varchar(1000) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(32) DEFAULT 'action'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES ('superadmin','superadmin创建了档案类型--文书。','2016-12-13 05:29:10','action'),('superadmin','在通用数据部门中删除了--资产处','2016-12-13 05:29:40','action'),('superadmin','在通用数据部门中删除了--财务处','2016-12-13 05:29:43','action'),('superadmin','在通用数据保管期限中删除了--10年','2016-12-13 05:29:55','action'),('superadmin','在通用数据保管期限中添加了--10年','2016-12-13 05:30:01','action'),('superadmin','在通用数据保管期限中删除了--永久','2016-12-13 05:30:12','action'),('superadmin','在通用数据保管期限中添加了--永久','2016-12-13 05:30:18','action'),('superadmin','在通用数据年度中添加了--1981','2016-12-13 05:31:26','action'),('superadmin','在通用数据年度中添加了--1984','2016-12-13 05:31:35','action'),('superadmin','在通用数据年度中添加了--1985','2016-12-13 05:31:48','action'),('superadmin','在通用数据年度中添加了--1986','2016-12-13 05:31:53','action'),('superadmin','在通用数据年度中添加了--1987','2016-12-13 05:32:05','action'),('superadmin','在通用数据年度中添加了--1988','2016-12-13 05:32:09','action'),('superadmin','在通用数据年度中添加了--1989','2016-12-13 05:32:14','action'),('superadmin','在通用数据年度中添加了--1990','2016-12-13 05:32:22','action'),('superadmin','在通用数据年度中添加了--1991','2016-12-13 05:32:27','action'),('superadmin','在通用数据年度中添加了--1992','2016-12-13 05:32:32','action'),('superadmin','在通用数据年度中添加了--1993','2016-12-13 05:32:41','action'),('superadmin','在通用数据年度中添加了--1994','2016-12-13 05:32:45','action'),('superadmin','在通用数据年度中添加了--1995','2016-12-13 05:32:49','action'),('superadmin','在通用数据年度中添加了--1996','2016-12-13 05:33:04','action'),('superadmin','在通用数据年度中添加了--1997','2016-12-13 05:33:08','action'),('superadmin','在通用数据年度中添加了--1998','2016-12-13 05:33:12','action'),('superadmin','在通用数据年度中添加了--1999','2016-12-13 05:33:17','action'),('superadmin','在通用数据年度中添加了--2000','2016-12-13 05:33:21','action'),('superadmin','在通用数据年度中添加了--2001','2016-12-13 05:33:42','action'),('superadmin','在通用数据年度中添加了--2002','2016-12-13 05:33:47','action'),('superadmin','在通用数据年度中添加了--2003','2016-12-13 05:33:51','action'),('superadmin','在通用数据年度中添加了--2004','2016-12-13 05:33:56','action'),('superadmin','在通用数据年度中添加了--2005','2016-12-13 05:34:00','action'),('superadmin','在通用数据年度中添加了--2006','2016-12-13 05:34:04','action'),('superadmin','在通用数据年度中添加了--2007','2016-12-13 05:34:08','action'),('superadmin','在通用数据年度中添加了--2008','2016-12-13 05:34:13','action'),('superadmin','在通用数据年度中添加了--2009','2016-12-13 05:34:17','action'),('superadmin','在通用数据年度中添加了--2010','2016-12-13 05:34:22','action'),('superadmin','在通用数据年度中添加了--2011','2016-12-13 05:34:27','action'),('superadmin','在通用数据年度中删除了--2011','2016-12-13 05:34:30','action'),('superadmin','在通用数据年度中添加了--2012','2016-12-13 05:34:36','action'),('superadmin','在通用数据年度中添加了--2013','2016-12-13 05:34:40','action'),('superadmin','在通用数据年度中添加了--2015','2016-12-13 05:34:45','action'),('superadmin','备份当前数据库，备份原因:测试','2016-12-14 06:00:35','action'),('superadmin','删除某个时间节点的数据库备份，id为:0KYoTOJYF4LW9vzAl-WCsj','2016-12-14 06:06:42','action'),('superadmin','备份当前数据库，备份原因:临时','2016-12-14 06:06:50','action'),('superadmin','备份当前数据库，备份原因:临时','2016-12-14 06:06:50','action'),('superadmin','删除某个时间节点的数据库备份，id为:1GjFZEFYp7lHPF3MCXT2Jr','2016-12-14 06:07:24','action'),('superadmin','删除某个时间节点的数据库备份，id为:0DnSYY6qJa1rtbisKgF-b8','2016-12-14 06:07:26','action'),('superadmin','备份当前数据库，备份原因:临时','2016-12-14 06:07:34','action'),('superadmin','备份当前数据库，备份原因:临时','2016-12-14 06:07:34','action'),('superadmin','备份当前数据库，备份原因:临时','2016-12-14 06:07:34','action'),('superadmin','备份当前数据库，备份原因:111','2016-12-14 06:17:12','action'),('superadmin','备份当前数据库，备份原因:111','2016-12-14 06:17:12','action'),('superadmin','备份当前数据库，备份原因:111','2016-12-14 06:17:13','action'),('superadmin','备份当前数据库，备份原因:111','2016-12-14 06:17:13','action'),('superadmin','备份当前数据库，备份原因:333','2016-12-14 06:50:48','action'),('superadmin','删除某个时间节点的数据库备份，id为:0ReMZ7gRh8K91A3JC_1512','2016-12-14 06:51:35','action'),('superadmin','删除某个时间节点的数据库备份，id为:1EAN8xJftb-8t1kLbMqM72','2016-12-14 06:51:38','action'),('superadmin','删除某个时间节点的数据库备份，id为:1SC13vmKle8oc65Y5DHI80','2016-12-14 06:51:41','action'),('superadmin','删除某个时间节点的数据库备份，id为:2-4PDqmVtf6rIRVLtzY5bf','2016-12-14 06:51:43','action'),('superadmin','删除某个时间节点的数据库备份，id为:2s90ubpdB8Mq0QJq9xjolS','2016-12-14 06:51:46','action'),('superadmin','删除某个时间节点的数据库备份，id为:0dW0XWaXZ3wrtq5VDsgQTh','2016-12-14 06:51:48','action'),('superadmin','删除某个时间节点的数据库备份，id为:0WD0rnJDxefHNwdN5C_kJz','2016-12-14 06:51:51','action'),('superadmin','删除某个时间节点的数据库备份，id为:2htKr5lgl8_EaaIwmOzyCW','2016-12-14 06:51:53','action'),('superadmin','备份当前数据库，备份原因:11','2016-12-14 06:52:00','action'),('superadmin','备份当前数据库，备份原因:11','2016-12-14 06:52:00','action'),('superadmin','删除某个时间节点的数据库备份，id为:306pp9U5Z9vFN7EZSvuMtg','2016-12-14 06:53:39','action'),('superadmin','删除某个时间节点的数据库备份，id为:1EnWp1SUd7qbS-A66TYrhY','2016-12-14 06:53:42','action'),('superadmin','备份当前数据库，备份原因:ffff','2016-12-14 07:06:02','action'),('superadmin','备份当前数据库，备份原因:ffff','2016-12-14 07:06:02','action'),('superadmin','备份当前数据库，备份原因:ffff','2016-12-14 07:06:02','action'),('superadmin','备份当前数据库，备份原因:11','2016-12-14 07:22:08','action'),('superadmin','备份当前数据库，备份原因:11','2016-12-14 07:22:10','action'),('superadmin','删除某个时间节点的数据库备份，id为:08fBp51M53Xa1FGbcuEqMb','2016-12-14 07:22:41','action'),('superadmin','删除某个时间节点的数据库备份，id为:1hWWTorHN0vaBc0ZZxsg_a','2016-12-14 07:22:44','action'),('superadmin','删除某个时间节点的数据库备份，id为:1d011ml6Z7mrNPLkppyyh5','2016-12-14 07:22:47','action'),('superadmin','删除某个时间节点的数据库备份，id为:1ycED41ax1-pcqXtID6QfP','2016-12-14 07:22:51','action'),('superadmin','备份当前数据库，备份原因:test','2016-12-14 07:23:17','action'),('superadmin','删除某个时间节点的数据库备份，id为:3Vqz5487Ra4bBhsY1BOwy6','2016-12-14 07:36:51','action'),('superadmin','删除某个时间节点的数据库备份，id为:2AaH5Z51N3VagtDez6OiBS','2016-12-14 07:36:54','action'),('superadmin','在按卷查询－此次查询显示10条案卷:协会成立批文;赴日考察报告;1983-1994大事记;1979-1992大事记;1979-1988大事记;宣传资料;照片;中国船东互保协会第一届董事会文件;中国船东互保协会董事会、会员大会文件;中国船东互保协会一九八四年协会发文;','2017-06-07 08:26:39','action'),('superadmin','在按卷查询－此次查询显示案卷（协会成立批文）的30条卷内','2017-06-07 08:26:41','action'),('superadmin','点击查看了卷内（讨论成立中国船东互保协会的几个问题）的详情页面','2017-06-07 08:26:42','action'),('superadmin','点击查看了卷内（关于转发《民政部人事部关于全国性社会团体专职工作人员人事管理问题的通知》的通知）的详情页面','2017-06-07 08:26:47','action'),('superadmin','superadmin更新了档案--JX13-2016-1-0001。','2017-07-18 03:30:57','action'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:31:06','check'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:31:06','check'),('superadmin','在按件查询－此次查询显示1条','2017-07-18 03:33:16','action'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:33:19','check'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:42:40','check'),('superadmin','在按件查询－此次查询显示1条','2017-07-18 03:43:56','action'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:44:01','check'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:44:14','check'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:44:14','check'),('superadmin','在按件查询－此次查询显示1条','2017-07-18 03:45:46','action'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:53:02','check'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:58:04','check'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-18 03:58:04','check'),('superadmin','点击查看了卷内（加入党、团材料）的详情页面','2017-07-18 07:25:00','check'),('superadmin','点击查看了卷内（加入党、团材料）的详情页面','2017-07-18 07:25:00','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 06:21:58','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 06:21:58','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 06:22:56','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 06:22:57','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 06:22:57','check'),('superadmin','在按卷查询－此次查询显示1条案卷:李伶玉;','2017-07-20 07:04:39','check'),('superadmin','在按卷查询－此次查询显示案卷（李伶玉）的9条卷内','2017-07-20 07:04:42','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 07:04:44','check'),('superadmin','在按件查询－此次查询显示1条','2017-07-20 07:08:58','action'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-20 07:09:01','check'),('superadmin','点击查看了卷内（加入党、团材料）的详情页面','2017-07-20 07:11:02','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 07:30:07','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 07:30:07','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 07:43:09','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-20 07:43:09','check'),('superadmin','点击查看了卷内（政治历史情况的审查材料）的详情页面','2017-07-20 07:48:51','check'),('superadmin','点击查看了卷内（政治历史情况的审查材料）的详情页面','2017-07-20 07:48:51','check'),('superadmin','点击查看了卷内（处分材料）的详情页面','2017-07-20 08:32:10','check'),('superadmin','superadmin更新了档案--2017-办公室-永久-3-0001。','2017-07-20 09:06:38','action'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-20 09:06:46','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-20 09:06:46','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-20 09:08:59','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-20 09:08:59','check'),('superadmin','点击查看了卷内（2010年北京高校档案工作年会荣誉证书）的详情页面','2017-07-20 09:10:18','check'),('superadmin','点击查看了卷内（2010年北京高校档案工作年会荣誉证书）的详情页面','2017-07-20 09:10:18','check'),('superadmin','点击查看了卷内（2010年北京高校档案工作年会荣誉证书）的详情页面','2017-07-20 09:10:18','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-20 09:14:25','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-20 09:14:25','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-20 09:14:25','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-20 09:14:25','check'),('superadmin','点击查看了卷内（关于举办第四届大学生辩论赛的通知）的详情页面','2017-07-20 09:14:42','check'),('superadmin','点击查看了卷内（关于举办第四届大学生辩论赛的通知）的详情页面','2017-07-20 09:14:42','check'),('superadmin','点击查看了卷内（关于举办第四届大学生辩论赛的通知）的详情页面','2017-07-20 09:14:42','check'),('superadmin','点击查看了卷内（关于举办第四届大学生辩论赛的通知）的详情页面','2017-07-20 09:14:42','check'),('superadmin','点击查看了卷内（关于举办第四届大学生辩论赛的通知）的详情页面','2017-07-20 09:14:42','check'),('superadmin','在按卷查询－此次查询显示1条案卷:行政发文;','2017-07-20 09:15:15','check'),('superadmin','在按卷查询－此次查询显示案卷（行政发文）的2条卷内','2017-07-20 09:15:16','check'),('superadmin','点击查看了卷内（关于对张三等15名同学的处分决定）的详情页面','2017-07-20 09:15:17','check'),('superadmin','在按卷查询－此次查询显示1条案卷:宿迁市新生花名册;','2017-07-20 09:15:35','check'),('superadmin','在按卷查询－此次查询显示1条案卷:宿迁市新生花名册;','2017-07-20 09:15:35','check'),('superadmin','在按卷查询－此次查询显示案卷（宿迁市新生花名册）的1条卷内','2017-07-20 09:15:36','check'),('superadmin','点击查看了卷内（宿迁市2013年江苏省出洋中学新生花名册）的详情页面','2017-07-20 09:15:38','check'),('superadmin','superadmin更新了档案--2017-办公室-永久-3-0002。','2017-07-20 09:22:26','action'),('superadmin','superadmin更新了档案--2017-办公室-永久-3-0003。','2017-07-20 09:22:49','action'),('superadmin','superadmin更新了档案--2017-办公室-永久-3-0004。','2017-07-20 09:24:16','action'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-21 01:11:23','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-21 01:11:23','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-21 01:11:23','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-21 01:11:23','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-21 01:13:18','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-21 01:13:19','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-21 01:13:19','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-21 01:13:19','check'),('superadmin','superadmin创建了档案类型--不动产。','2017-07-21 01:21:54','action'),('superadmin','superadmin删除了档案类型--不动产。','2017-07-21 01:23:18','action'),('superadmin','superadmin创建了档案类型--不动产。','2017-07-21 01:37:41','action'),('superadmin','superadmin删除了档案类型--不动产。','2017-07-21 01:38:24','action'),('superadmin','superadmin创建了档案类型--BDC。','2017-07-21 01:40:11','action'),('superadmin','通过了新档案---马志兴(申请人：superadmin)的认证申请','2017-07-21 01:42:21','action'),('superadmin','点击查看了按件（马志兴）的详情页面','2017-07-21 01:43:09','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:22:39','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:22:39','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:22:39','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:23:15','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:23:16','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:23:16','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:24:07','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:24:07','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:24:35','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:24:36','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:45:56','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:45:57','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:50','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:50','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:50','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:50','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:50','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:50','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:51','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:51','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:51','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:51','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:51','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:52','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:52','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:47:54','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:04','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:05','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:05','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:05','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:05','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:05','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:05','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:05','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:05','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:06','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:06','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:06','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:06','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:48:06','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:48:27','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:48:28','check'),('superadmin','点击查看了卷内（作业视频(还原)）的详情页面','2017-07-21 02:48:40','check'),('superadmin','点击查看了卷内（作业视频(还原)）的详情页面','2017-07-21 02:48:41','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:56:56','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:56:56','check'),('superadmin','点击查看了卷内（作业视频(扫描)）的详情页面','2017-07-21 02:56:56','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:57:03','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:57:04','check'),('superadmin','点击查看了卷内（作业视频(整理)）的详情页面','2017-07-21 02:57:04','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:57:12','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:57:12','check'),('superadmin','点击查看了卷内（作业视频(分件)）的详情页面','2017-07-21 02:57:12','check'),('superadmin','点击查看了卷内（作业视频(优化)）的详情页面','2017-07-21 02:57:23','check'),('superadmin','点击查看了卷内（作业视频(优化)）的详情页面','2017-07-21 02:57:23','check'),('superadmin','点击查看了卷内（作业视频(优化)）的详情页面','2017-07-21 02:57:23','check'),('superadmin','点击查看了卷内（作业视频(补扫)）的详情页面','2017-07-21 02:57:28','check'),('superadmin','点击查看了卷内（作业视频(补扫)）的详情页面','2017-07-21 02:57:28','check'),('superadmin','点击查看了卷内（作业视频(补扫)）的详情页面','2017-07-21 02:57:28','check'),('superadmin','点击查看了卷内（作业视频(标注)）的详情页面','2017-07-21 02:57:33','check'),('superadmin','点击查看了卷内（作业视频(标注)）的详情页面','2017-07-21 02:57:33','check'),('superadmin','点击查看了卷内（作业视频(标注)）的详情页面','2017-07-21 02:57:33','check'),('superadmin','点击查看了卷内（作业视频(盖章)）的详情页面','2017-07-21 02:57:37','check'),('superadmin','点击查看了卷内（作业视频(盖章)）的详情页面','2017-07-21 02:57:37','check'),('superadmin','点击查看了卷内（作业视频(盖章)）的详情页面','2017-07-21 02:57:37','check'),('superadmin','点击查看了卷内（作业视频(还原)）的详情页面','2017-07-21 02:58:24','check'),('superadmin','点击查看了卷内（作业视频(还原)）的详情页面','2017-07-21 02:58:24','check'),('superadmin','点击查看了卷内（作业视频(还原)）的详情页面','2017-07-21 02:58:24','check'),('superadmin','点击查看了卷内（作业视频(还原)）的详情页面','2017-07-21 02:58:24','check'),('superadmin','点击查看了卷内（作业视频(还原)）的详情页面','2017-07-21 02:58:24','check'),('superadmin','点击查看了卷内（作业视频(盖章)）的详情页面','2017-07-21 02:58:29','check'),('superadmin','点击查看了卷内（作业视频(盖章)）的详情页面','2017-07-21 02:58:29','check'),('superadmin','点击查看了卷内（作业视频(盖章)）的详情页面','2017-07-21 02:58:29','check'),('superadmin','点击查看了卷内（作业视频(盖章)）的详情页面','2017-07-21 02:58:29','check'),('superadmin','点击查看了卷内（作业视频(盖章)）的详情页面','2017-07-21 02:58:29','check'),('superadmin','点击查看了卷内（作业视频(标注)）的详情页面','2017-07-21 02:58:35','check'),('superadmin','点击查看了卷内（作业视频(标注)）的详情页面','2017-07-21 02:58:35','check'),('superadmin','点击查看了卷内（作业视频(标注)）的详情页面','2017-07-21 02:58:35','check'),('superadmin','点击查看了卷内（作业视频(标注)）的详情页面','2017-07-21 02:58:35','check'),('superadmin','点击查看了卷内（作业视频(标注)）的详情页面','2017-07-21 02:58:35','check'),('superadmin','删除某个时间节点的数据库备份，id为:0HeEGDjHRaKUK89JYaj66p','2017-07-21 03:24:54','action'),('superadmin','删除某个时间节点的数据库备份，id为:2Q4fKm_Kh0c91_AA5azTSt','2017-07-21 03:24:58','action'),('superadmin','删除某个时间节点的数据库备份，id为:1U0Vi8Ubdb48kyNUMQR9RI','2017-07-21 03:25:01','action'),('superadmin','备份当前数据库，备份原因:1','2017-07-21 03:25:09','action'),('superadmin','全量备份表达式修改，修改后表达式为:[0 31 11 ? * 5]','2017-07-21 03:27:31','action'),('superadmin','在通用数据部门中添加了--231','2017-07-21 03:29:27','action'),('superadmin','在通用数据部门中删除了--231','2017-07-21 03:29:51','action'),('superadmin','在通用数据非诉讼种类中添加了--123','2017-07-21 03:30:25','action'),('superadmin','superadmin创建了档案类型--123。','2017-07-21 03:31:11','action'),('superadmin','在通用数据非诉讼种类中删除了--123','2017-07-21 03:32:00','action'),('superadmin','superadmin删除了档案类型--123。','2017-07-21 03:32:46','action'),('superadmin','superadmin创建了档案类型--123。','2017-07-21 03:33:29','action'),('superadmin','删除某个时间节点的数据库备份，id为:0QobBbvwp3pbd3ThzwMinu','2017-07-21 03:55:34','action'),('superadmin','增量备份表达式修改，修改后表达式为:[]','2017-07-21 03:55:40','action'),('superadmin','全量备份表达式修改，修改后表达式为:[]','2017-07-21 03:55:40','action'),('superadmin','全量备份表达式修改，修改后表达式为:[]','2017-07-21 03:55:40','action'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-21 03:56:38','check'),('superadmin','点击查看了卷内（履历材料）的详情页面','2017-07-21 03:56:38','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-21 03:56:49','check'),('superadmin','点击查看了卷内（自传材料）的详情页面','2017-07-21 03:56:49','check'),('superadmin','通过了新档案---111111111111(申请人：superadmin)的认证申请','2017-07-26 03:39:04','action'),('superadmin','在按卷查询－此次查询显示（2001-QK-永久-1）案卷（期刊）的7条卷内','2017-07-28 05:49:06','check'),('superadmin','点击查看了（2001-QK-永久-1-0002）卷内（办学成果固本求真陪树人）的详情页面','2017-07-28 05:49:08','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 05:50:03','check'),('superadmin','在按卷查询－此次查询显示（2001-QK-永久-1）案卷（期刊）的7条卷内','2017-07-28 06:20:08','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 06:20:09','check'),('superadmin','在按卷查询－此次查询显示（2001-QK-永久-1）案卷（期刊）的7条卷内','2017-07-28 06:21:48','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 06:21:49','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 06:22:49','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 06:26:49','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 06:36:13','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 06:42:18','check'),('superadmin','在按卷查询－此次查询显示（2001-QK-永久-1）案卷（期刊）的7条卷内','2017-07-28 06:42:58','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 06:42:59','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 06:46:52','check'),('superadmin','点击查看了（2001-QK-永久-1-0001）卷内（校园擂台赛）的详情页面','2017-07-28 06:52:54','check'),('superadmin','批量导出卷内（2001-XZ-永久-1-0002）关于对张三等15名同学的处分决定、批量导出卷内（2001-XZ-永久-1-0001）关于举办第四届大学生辩论赛的通知、','2017-07-31 08:10:15','action');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outputorder`
--

DROP TABLE IF EXISTS `outputorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outputorder` (
  `recordtype` varchar(32) NOT NULL,
  `outputcolorder` varchar(255) NOT NULL,
  `fontsize` smallint(4) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `category` varchar(8) NOT NULL,
  `lineheight` float DEFAULT NULL,
  `pagesize` smallint(4) DEFAULT NULL,
  `colWidth` varchar(255) DEFAULT NULL,
  `style` varchar(32) DEFAULT NULL,
  `direction` tinyint(1) DEFAULT NULL,
  `leftmargin` float DEFAULT NULL,
  `bottommargin` float DEFAULT NULL,
  `topmargin` float DEFAULT NULL,
  `rightmargin` float DEFAULT NULL,
  KEY `outputorder_ibfk_1` (`recordtype`) USING BTREE,
  CONSTRAINT `outputorder_ibfk_1` FOREIGN KEY (`recordtype`) REFERENCES `recordtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outputorder`
--

LOCK TABLES `outputorder` WRITE;
/*!40000 ALTER TABLE `outputorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `outputorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending`
--

DROP TABLE IF EXISTS `pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending` (
  `id` varchar(32) NOT NULL,
  `volumeid` varchar(32) NOT NULL,
  `recordids` varchar(255) NOT NULL COMMENT '用于储存拼接好的recordid。例如：  dkadjdjsakdj,djsdadsd,dsjdadj',
  `fondNo` varchar(5) NOT NULL,
  `recordtype` varchar(5) NOT NULL,
  `status` varchar(16) NOT NULL COMMENT '0-审核中;1-审核通过;-1驳回审核',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending`
--

LOCK TABLES `pending` WRITE;
/*!40000 ALTER TABLE `pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordtype`
--

DROP TABLE IF EXISTS `recordtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordtype` (
  `id` varchar(32) NOT NULL DEFAULT '0',
  `fondsid` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `volumetable` varchar(32) NOT NULL,
  `recordtable` varchar(32) NOT NULL,
  `temtableindex` int(4) DEFAULT '0',
  `volumenoindex` int(11) NOT NULL DEFAULT '0',
  `typeNo` varchar(32) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fondsid` (`fondsid`) USING BTREE,
  CONSTRAINT `recordtype_ibfk_1` FOREIGN KEY (`fondsid`) REFERENCES `fonds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordtype`
--

LOCK TABLES `recordtype` WRITE;
/*!40000 ALTER TABLE `recordtype` DISABLE KEYS */;
INSERT INTO `recordtype` VALUES ('08PRCM7Fhffa25_t9kiKMd','26arH10gJ8FaQ2oCSSOCE4','行政','GX_XZ_volume','GX_XZ_record',0,0,'XZ','2017-07-17 06:16:27'),('0DS-d1N7p58bSzvwFMkk1g','26arH10gJ8FaQ2oCSSOCE4','期刊','GX_QK_volume','GX_QK_record',0,0,'QK','2017-07-17 03:56:59'),('16N5ewUi5czocWuPmZnb7L','26arH10gJ8FaQ2oCSSOCE4','教学','GX_JX_volume','GX_JX_record',1,0,'JX','2017-07-18 03:17:40'),('1ilY3KXZ13dUEcdLicNhlj','26arH10gJ8FaQ2oCSSOCE4','人事','GX_RS_volume','GX_RS_record',0,0,'RS','2017-07-18 01:34:48'),('1pO-IIygh3IXgZXKwmmeTQ','3d8JfKGad4eXhCYjGbFkUH','公司','BDT_GS_volume','BDT_GS_record',0,0,'GS','2017-07-17 04:03:54'),('1Xxi9HLzB7Qay2UJCfzLkr','26arH10gJ8FaQ2oCSSOCE4','123','GX_123_volume','GX_123_record',0,0,'123','2017-07-21 03:33:28'),('2DsgnvVbdceFR9X1keWV1h','26arH10gJ8FaQ2oCSSOCE4','照片','GX_ZP_volume','GX_ZP_record',0,0,'ZP','2017-07-17 04:02:50'),('2QKlVFhd97AEFH8tN6paz7','3d8JfKGad4eXhCYjGbFkUH','多媒体','BDT_DMT_volume','BDT_DMT_record',0,0,'DMT','2017-07-17 08:31:00'),('2WEOSBOb97tWlIPRT1jbtM','308rKwdBd0VpvDidWIBqup','BDC','GTJ_BDC_volume','GTJ_BDC_record',0,0,'BDC','2017-07-21 01:40:11'),('2whF7KZiJdxFFlAY3sol0-','26arH10gJ8FaQ2oCSSOCE4','基建','GX_JJ_volume','GX_JJ_record',0,0,'JJ','2017-07-17 04:01:44');
/*!40000 ALTER TABLE `recordtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `reserved1` varchar(32) DEFAULT NULL,
  `reserved2` varchar(32) DEFAULT NULL,
  `reservedi1` bigint(20) DEFAULT NULL,
  `reservedi2` bigint(20) DEFAULT NULL,
  `reservedd1` decimal(20,0) DEFAULT NULL,
  `reservedd2` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'SUPER ADMIN','档案管理员',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'USER','档案协管员',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleauthority`
--

DROP TABLE IF EXISTS `roleauthority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleauthority` (
  `roleId` int(11) NOT NULL,
  `authorityId` varchar(32) NOT NULL,
  PRIMARY KEY (`roleId`,`authorityId`),
  KEY `FK_Relationship_13` (`authorityId`) USING BTREE,
  CONSTRAINT `roleauthority_ibfk_1` FOREIGN KEY (`authorityId`) REFERENCES `authority` (`authorityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleauthority_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleauthority`
--

LOCK TABLES `roleauthority` WRITE;
/*!40000 ALTER TABLE `roleauthority` DISABLE KEYS */;
INSERT INTO `roleauthority` VALUES (1,'1'),(1,'11'),(2,'11'),(1,'12'),(1,'13'),(1,'14'),(1,'15'),(1,'16'),(1,'18'),(1,'19'),(1,'2'),(1,'20'),(2,'20'),(1,'21'),(1,'22'),(1,'23'),(1,'24'),(1,'25'),(1,'26'),(1,'27'),(1,'28'),(1,'29'),(1,'3'),(1,'30'),(1,'31'),(1,'32'),(1,'33'),(1,'34'),(1,'35'),(1,'36'),(2,'37'),(1,'38'),(1,'39'),(1,'4'),(1,'40'),(1,'41'),(1,'42'),(1,'43'),(1,'44'),(1,'45'),(1,'5'),(1,'6'),(2,'6'),(1,'7'),(1,'8'),(2,'8'),(1,'9');
/*!40000 ALTER TABLE `roleauthority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `tabletype` varchar(255) DEFAULT NULL,
  `id` varchar(32) NOT NULL,
  `ruleorder` varchar(225) NOT NULL,
  `recordtypeid` varchar(32) NOT NULL,
  `chineserule` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rule_ibfk_1` (`recordtypeid`) USING BTREE,
  CONSTRAINT `rule_ibfk_1` FOREIGN KEY (`recordtypeid`) REFERENCES `recordtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES ('_record','06DEt5CJ12MEGJH2tzddlP','fondsid-department-year-deadline-sequencNo','0DS-d1N7p58bSzvwFMkk1g','全宗-部门-年度-保管期限-顺序号'),('_piece','0Lse26ShZd5G7exTkzFJ7D','fondsid-department-year-deadline-sequencNo','1ilY3KXZ13dUEcdLicNhlj','全宗-部门-年度-保管期限-顺序号'),('_piece','0_-IBIUIB709ejzGH2vBjM','fondsid-department-year-deadline-sequencNo','08PRCM7Fhffa25_t9kiKMd','全宗-部门-年度-保管期限-顺序号'),('_record','0_NsaDV21dJXPD4BvYOO3t','fondsid-department-year-deadline-sequencNo','1Xxi9HLzB7Qay2UJCfzLkr','全宗-部门-年度-保管期限-顺序号'),('_record','1aKJLaxFN4fGv0YLptLzoH','fondsid-department-year-deadline-sequencNo','2QKlVFhd97AEFH8tN6paz7','全宗-部门-年度-保管期限-顺序号'),('_record','1d0O2LCjh5b8AGQnlNTaxE','fondsid-department-year-deadline-sequencNo','2WEOSBOb97tWlIPRT1jbtM','全宗-部门-年度-保管期限-顺序号'),('_record','1ipRxDcMFe0X3ThgwNKk-z','fondsid-department-year-deadline-sequencNo','2DsgnvVbdceFR9X1keWV1h','全宗-部门-年度-保管期限-顺序号'),('_record','1kuEuVOzZ0QEwr6hXr7EEq','fondsid-department-year-deadline-sequencNo','08PRCM7Fhffa25_t9kiKMd','全宗-部门-年度-保管期限-顺序号'),('_piece','1U62zJ3yh0Cpy50rEWj68m','fondsid-department-year-deadline-sequencNo','1Xxi9HLzB7Qay2UJCfzLkr','全宗-部门-年度-保管期限-顺序号'),('_piece','1WRznpywp4SrjQrYjdQY_9','fondsid-department-year-deadline-sequencNo','2DsgnvVbdceFR9X1keWV1h','全宗-部门-年度-保管期限-顺序号'),('_piece','1Xl7lPM0F2rGTz1PqWQ0LB','fondsid-department-year-deadline-sequencNo','16N5ewUi5czocWuPmZnb7L','全宗-部门-年度-保管期限-顺序号'),('_piece','20LW_ckUJ8MVls34_uVWyW','fondsid-department-year-deadline-sequencNo','2QKlVFhd97AEFH8tN6paz7','全宗-部门-年度-保管期限-顺序号'),('_record','29J8G8lnV7rWQXUAFfgG7d','fondsid-department-year-deadline-sequencNo','2whF7KZiJdxFFlAY3sol0-','全宗-部门-年度-保管期限-顺序号'),('_piece','2h8id6LiF7ba9bcNinHIxb','fondsid-department-year-deadline-sequencNo','0DS-d1N7p58bSzvwFMkk1g','全宗-部门-年度-保管期限-顺序号'),('_piece','2HhfbkKFJauqbH1UC109fC','fondsid-year-column1-sequencNo','2WEOSBOb97tWlIPRT1jbtM','全宗-年度-业务编号-3位顺序号'),('_piece','2msgyIszhahaJEXwD7baCQ','fondsid-department-year-deadline-sequencNo','2whF7KZiJdxFFlAY3sol0-','全宗-部门-年度-保管期限-顺序号'),('_piece','2OtKwSePl65Urx7fOYedzZ','fondsid-department-year-deadline-sequencNo','1pO-IIygh3IXgZXKwmmeTQ','全宗-部门-年度-保管期限-顺序号'),('_record','2tEg7I1PB8NV6Y1PChXsqq','fondsid-department-year-deadline-sequencNo','16N5ewUi5czocWuPmZnb7L','全宗-部门-年度-保管期限-顺序号'),('_record','3C2icZofp0mFShVA-9kJTZ','fondsid-department-year-deadline-sequencNo','1pO-IIygh3IXgZXKwmmeTQ','全宗-部门-年度-保管期限-顺序号'),('_record','3Tw-cvBEFcwXH-9IueVxdX','fondsid-department-year-deadline-sequencNo','1ilY3KXZ13dUEcdLicNhlj','全宗-部门-年度-保管期限-顺序号');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id` varchar(32) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `port` varchar(8) DEFAULT NULL,
  `server_username` varchar(20) DEFAULT NULL,
  `server_pwd` varchar(32) DEFAULT NULL,
  `server_type` varchar(20) DEFAULT NULL,
  `edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES ('1','123.56.179.29','8080','root','jtang123','data','2016-09-23 14:29:43'),('2','123.56.179.29','8080','root','jtang123','application','2016-09-23 14:29:43'),('3','123.56.179.29','8080','root','jtang123','file','2016-09-23 14:29:43'),('4','123.56.179.29','8080','root','jtang123','backups','2016-09-23 14:29:43');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(2) NOT NULL DEFAULT '1',
  `title` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'ccc','abc','2016-10-27 00:00:06','-1','标题1'),(2,'ccc','abc2','2016-10-18 00:36:27','-1','标题2'),(3,'ccc','abc3','2016-10-18 00:36:26','-1','标题3'),(4,'ccc','abc4','2016-10-18 00:36:24','-1','标题4'),(5,'ccc','abc5','2016-10-18 00:36:22','-1','标题5'),(6,'ccc','abc','2016-10-18 00:36:20','-1','标题6'),(7,'ccc','abc2','2016-10-18 00:36:19','-1','标题7'),(8,'ccc','abc3','2016-10-18 00:36:17','-1','标题8'),(9,'ccc','abc4','2016-10-18 00:36:15','-1','标题9'),(10,'ccc','abc5','2016-10-18 00:36:14','-1','标题10'),(11,'ccc','abc','2016-10-18 00:36:34','-1',''),(12,'ccc','abc2','2016-10-18 00:36:36','-1',''),(13,'ccc','abc3','2016-10-18 00:36:37','-1',''),(14,'ccc','abc4','2016-10-18 00:36:39','-1',''),(15,'ccc','abc5','2016-10-18 00:36:40','-1',''),(16,'superadmin','dadasddasdsadsda','2016-10-18 00:36:32','-1',''),(17,'superadmin','dasdsadsadasdasd','2016-09-18 07:06:48','-1',''),(18,'superadmin','dasdsadsadasdasd','2016-09-18 07:06:51','-1',''),(19,'superadmin','dasdasdasdasdsdasdasdasdadas','2016-09-18 07:06:46','-1',''),(20,'superadmin','dasdsadsadsadasdasdasdas','2016-09-18 07:06:03','-1',''),(21,'superadmin','dasdsdasdasdasd','2016-09-18 07:05:01','-1',''),(22,'superadmin','dasdsdasdasdasddasdsadsad','2016-09-18 07:03:25','-1',''),(23,'superadmin','dasdsddas','2016-09-18 07:06:57','-1',''),(24,'superadmin','内容','2016-10-18 00:36:42','-1','标题'),(25,'superadmin','内容1','2016-10-18 00:36:30','-1','biaoti'),(26,'superadmin','这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容','2016-10-03 11:54:37','-1','新建标题'),(27,'superadmin','各位用户，兹定于本周三上午9：30于档案馆进行软件使用培训。请准时参加。','2016-10-27 00:00:23','-1','关于软件培训的公告'),(28,'superadmin','各位用户，本软件定于2016-10-18日进行升级。升级期间系统无法登录使用，特此通知。','2016-10-18 00:36:01','1','关于软件升级的通知'),(29,'superadmin','各位用户：\n本软件定于2016-10-26日进行版本升级','2016-10-26 23:59:06','1','软件版本更新的通知'),(30,'superadmin','关于软件测试的通知关于软件测试的通知关于软件测试的通知','2016-11-20 02:21:03','1','关于软件测试的通知');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station_mail`
--

DROP TABLE IF EXISTS `station_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station_mail` (
  `mailid` varchar(32) NOT NULL,
  `form_user` varchar(32) DEFAULT NULL,
  `to_user` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_mail`
--

LOCK TABLES `station_mail` WRITE;
/*!40000 ALTER TABLE `station_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `station_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouse`
--

DROP TABLE IF EXISTS `storehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouse` (
  `id` varchar(32) NOT NULL,
  `no` varchar(4) NOT NULL,
  `name` varchar(32) NOT NULL,
  `location` varchar(32) NOT NULL,
  `totalcabinet` int(11) NOT NULL,
  `floorpercab` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouse`
--

LOCK TABLES `storehouse` WRITE;
/*!40000 ALTER TABLE `storehouse` DISABLE KEYS */;
INSERT INTO `storehouse` VALUES ('3ZGhoQjeBdaEs11J31742K','18','BDT','BDT',18,18,'2016-12-13 05:23:47');
/*!40000 ALTER TABLE `storehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strecord`
--

DROP TABLE IF EXISTS `strecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strecord` (
  `stid` varchar(32) NOT NULL,
  `temperature` varchar(8) NOT NULL,
  `moisture` varchar(8) NOT NULL,
  `recordtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strecord`
--

LOCK TABLES `strecord` WRITE;
/*!40000 ALTER TABLE `strecord` DISABLE KEYS */;
INSERT INTO `strecord` VALUES ('3ZGhoQjeBdaEs11J31742K','25','80','2017-07-21 03:53:28'),('3ZGhoQjeBdaEs11J31742K','25','80','2017-07-21 03:53:28');
/*!40000 ALTER TABLE `strecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablefield`
--

DROP TABLE IF EXISTS `tablefield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablefield` (
  `type` varchar(8) DEFAULT NULL,
  `fieldid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `recordtypeid` varchar(32) DEFAULT NULL,
  `fieldNo` varchar(3) NOT NULL,
  `fieldname` varchar(20) DEFAULT NULL,
  `length` varchar(20) DEFAULT NULL,
  `tabletype` varchar(255) DEFAULT NULL,
  `valueorindex` varchar(2) DEFAULT NULL,
  `idorvalue` varchar(2) DEFAULT NULL,
  `zeronum` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`fieldid`),
  KEY `tablefield_ibfk_1` (`recordtypeid`) USING BTREE,
  CONSTRAINT `tablefield_ibfk_1` FOREIGN KEY (`recordtypeid`) REFERENCES `recordtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=785 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablefield`
--

LOCK TABLES `tablefield` WRITE;
/*!40000 ALTER TABLE `tablefield` DISABLE KEYS */;
INSERT INTO `tablefield` VALUES (NULL,259,'档号','0DS-d1N7p58bSzvwFMkk1g','','recordNo','255','_record',NULL,'0','0'),(NULL,260,'全宗','0DS-d1N7p58bSzvwFMkk1g','','fondsid','2','_record',NULL,'0','0'),(NULL,261,'年度','0DS-d1N7p58bSzvwFMkk1g','','year','4','_record',NULL,'0','0'),(NULL,262,'部门','0DS-d1N7p58bSzvwFMkk1g','','department','3','_record',NULL,'0','0'),(NULL,263,'保管期限','0DS-d1N7p58bSzvwFMkk1g','','deadline','4','_record',NULL,'0','0'),(NULL,264,'顺序号','0DS-d1N7p58bSzvwFMkk1g','','sequencNo','3','_record',NULL,'0','0'),(NULL,265,'题名','0DS-d1N7p58bSzvwFMkk1g','','subject','255','_record',NULL,'0','0'),(NULL,266,'备注','0DS-d1N7p58bSzvwFMkk1g','','description','100','_record',NULL,'0','0'),('1',267,'页数','0DS-d1N7p58bSzvwFMkk1g','','pagenum','8','_record','0','0','0'),('1',268,'物理位置','0DS-d1N7p58bSzvwFMkk1g','','address','32','_record','0','0','0'),(NULL,269,'档号','0DS-d1N7p58bSzvwFMkk1g','','recordNo','255','_piece',NULL,'0','0'),(NULL,270,'全宗','0DS-d1N7p58bSzvwFMkk1g','','fondsid','2','_piece',NULL,'0','0'),(NULL,271,'年度','0DS-d1N7p58bSzvwFMkk1g','','year','4','_piece',NULL,'1','0'),(NULL,272,'部门','0DS-d1N7p58bSzvwFMkk1g','','department','3','_piece',NULL,'1','0'),(NULL,273,'保管期限','0DS-d1N7p58bSzvwFMkk1g','','deadline','4','_piece',NULL,'1','0'),(NULL,274,'顺序号','0DS-d1N7p58bSzvwFMkk1g','','sequencNo','3','_piece',NULL,'0','0'),(NULL,275,'题名','0DS-d1N7p58bSzvwFMkk1g','','subject','255','_piece',NULL,'0','0'),(NULL,276,'备注','0DS-d1N7p58bSzvwFMkk1g','','description','100','_piece',NULL,'0','0'),('1',277,'页数','0DS-d1N7p58bSzvwFMkk1g','','pagenum','8','_piece','0','0','0'),('1',278,'物理位置','0DS-d1N7p58bSzvwFMkk1g','','address','32','_piece','0','0','0'),(NULL,279,'案卷号','0DS-d1N7p58bSzvwFMkk1g','','volumeNo','255','_volume',NULL,'0','0'),(NULL,280,'全宗','0DS-d1N7p58bSzvwFMkk1g','','fondsid','2','_volume',NULL,'0','0'),(NULL,281,'年度','0DS-d1N7p58bSzvwFMkk1g','','year','4','_volume',NULL,'1','0'),(NULL,282,'部门','0DS-d1N7p58bSzvwFMkk1g','','department','3','_volume',NULL,'1','0'),(NULL,283,'保管期限','0DS-d1N7p58bSzvwFMkk1g','','deadline','4','_volume',NULL,'1','0'),(NULL,284,'题名','0DS-d1N7p58bSzvwFMkk1g','','subject','255','_volume',NULL,'0','0'),(NULL,285,'备注','0DS-d1N7p58bSzvwFMkk1g','','description','100','_volume',NULL,'0','0'),('1',286,'总页数','0DS-d1N7p58bSzvwFMkk1g','','pagenum','8','_volume','0','0','0'),('1',287,'物理位置','0DS-d1N7p58bSzvwFMkk1g','','address','32','_volume','0','0','0'),(NULL,346,'档号','2whF7KZiJdxFFlAY3sol0-','','recordNo','255','_record',NULL,'0','0'),(NULL,347,'全宗','2whF7KZiJdxFFlAY3sol0-','','fondsid','2','_record',NULL,'0','0'),(NULL,348,'年度','2whF7KZiJdxFFlAY3sol0-','','year','4','_record',NULL,'0','0'),(NULL,349,'部门','2whF7KZiJdxFFlAY3sol0-','','department','3','_record',NULL,'0','0'),(NULL,350,'保管期限','2whF7KZiJdxFFlAY3sol0-','','deadline','4','_record',NULL,'0','0'),(NULL,351,'顺序号','2whF7KZiJdxFFlAY3sol0-','','sequencNo','3','_record',NULL,'0','0'),(NULL,352,'题名','2whF7KZiJdxFFlAY3sol0-','','subject','255','_record',NULL,'0','0'),(NULL,353,'备注','2whF7KZiJdxFFlAY3sol0-','','description','100','_record',NULL,'0','0'),('1',354,'页数','2whF7KZiJdxFFlAY3sol0-','','pagenum','8','_record','0','0','0'),('1',355,'物理位置','2whF7KZiJdxFFlAY3sol0-','','address','32','_record','0','0','0'),(NULL,356,'档号','2whF7KZiJdxFFlAY3sol0-','','recordNo','255','_piece',NULL,'0','0'),(NULL,357,'全宗','2whF7KZiJdxFFlAY3sol0-','','fondsid','2','_piece',NULL,'0','0'),(NULL,358,'年度','2whF7KZiJdxFFlAY3sol0-','','year','4','_piece',NULL,'1','0'),(NULL,359,'部门','2whF7KZiJdxFFlAY3sol0-','','department','3','_piece',NULL,'1','0'),(NULL,360,'保管期限','2whF7KZiJdxFFlAY3sol0-','','deadline','4','_piece',NULL,'1','0'),(NULL,361,'顺序号','2whF7KZiJdxFFlAY3sol0-','','sequencNo','3','_piece',NULL,'0','0'),(NULL,362,'题名','2whF7KZiJdxFFlAY3sol0-','','subject','255','_piece',NULL,'0','0'),(NULL,363,'备注','2whF7KZiJdxFFlAY3sol0-','','description','100','_piece',NULL,'0','0'),('1',364,'页数','2whF7KZiJdxFFlAY3sol0-','','pagenum','8','_piece','0','0','0'),('1',365,'物理位置','2whF7KZiJdxFFlAY3sol0-','','address','32','_piece','0','0','0'),(NULL,366,'案卷号','2whF7KZiJdxFFlAY3sol0-','','volumeNo','255','_volume',NULL,'0','0'),(NULL,367,'全宗','2whF7KZiJdxFFlAY3sol0-','','fondsid','2','_volume',NULL,'0','0'),(NULL,368,'年度','2whF7KZiJdxFFlAY3sol0-','','year','4','_volume',NULL,'0','0'),(NULL,369,'部门','2whF7KZiJdxFFlAY3sol0-','','department','3','_volume',NULL,'0','0'),(NULL,370,'保管期限','2whF7KZiJdxFFlAY3sol0-','','deadline','4','_volume',NULL,'0','0'),(NULL,371,'题名','2whF7KZiJdxFFlAY3sol0-','','subject','255','_volume',NULL,'0','0'),(NULL,372,'备注','2whF7KZiJdxFFlAY3sol0-','','description','100','_volume',NULL,'0','0'),('1',373,'总页数','2whF7KZiJdxFFlAY3sol0-','','pagenum','8','_volume','0','0','0'),('1',374,'物理位置','2whF7KZiJdxFFlAY3sol0-','','address','32','_volume','0','0','0'),(NULL,404,'档号','2DsgnvVbdceFR9X1keWV1h','','recordNo','255','_record',NULL,'0','0'),(NULL,405,'全宗','2DsgnvVbdceFR9X1keWV1h','','fondsid','2','_record',NULL,'0','0'),(NULL,406,'年度','2DsgnvVbdceFR9X1keWV1h','','year','4','_record',NULL,'0','0'),(NULL,407,'部门','2DsgnvVbdceFR9X1keWV1h','','department','3','_record',NULL,'0','0'),(NULL,408,'保管期限','2DsgnvVbdceFR9X1keWV1h','','deadline','4','_record',NULL,'0','0'),(NULL,409,'顺序号','2DsgnvVbdceFR9X1keWV1h','','sequencNo','3','_record',NULL,'0','0'),(NULL,410,'题名','2DsgnvVbdceFR9X1keWV1h','','subject','255','_record',NULL,'0','0'),(NULL,411,'备注','2DsgnvVbdceFR9X1keWV1h','','description','100','_record',NULL,'0','0'),('1',412,'页数','2DsgnvVbdceFR9X1keWV1h','','pagenum','8','_record','0','0','0'),('1',413,'物理位置','2DsgnvVbdceFR9X1keWV1h','','address','32','_record','0','0','0'),(NULL,414,'档号','2DsgnvVbdceFR9X1keWV1h','','recordNo','255','_piece',NULL,'0','0'),(NULL,415,'全宗','2DsgnvVbdceFR9X1keWV1h','','fondsid','2','_piece',NULL,'0','0'),(NULL,416,'年度','2DsgnvVbdceFR9X1keWV1h','','year','4','_piece',NULL,'1','0'),(NULL,417,'部门','2DsgnvVbdceFR9X1keWV1h','','department','3','_piece',NULL,'1','0'),(NULL,418,'保管期限','2DsgnvVbdceFR9X1keWV1h','','deadline','4','_piece',NULL,'1','0'),(NULL,419,'顺序号','2DsgnvVbdceFR9X1keWV1h','','sequencNo','3','_piece',NULL,'0','0'),(NULL,420,'题名','2DsgnvVbdceFR9X1keWV1h','','subject','255','_piece',NULL,'0','0'),(NULL,421,'备注','2DsgnvVbdceFR9X1keWV1h','','description','100','_piece',NULL,'0','0'),('1',422,'页数','2DsgnvVbdceFR9X1keWV1h','','pagenum','8','_piece','0','0','0'),('1',423,'物理位置','2DsgnvVbdceFR9X1keWV1h','','address','32','_piece','0','0','0'),(NULL,424,'案卷号','2DsgnvVbdceFR9X1keWV1h','','volumeNo','255','_volume',NULL,'0','0'),(NULL,425,'全宗','2DsgnvVbdceFR9X1keWV1h','','fondsid','2','_volume',NULL,'0','0'),(NULL,426,'年度','2DsgnvVbdceFR9X1keWV1h','','year','4','_volume',NULL,'0','0'),(NULL,427,'部门','2DsgnvVbdceFR9X1keWV1h','','department','3','_volume',NULL,'0','0'),(NULL,428,'保管期限','2DsgnvVbdceFR9X1keWV1h','','deadline','4','_volume',NULL,'0','0'),(NULL,429,'题名','2DsgnvVbdceFR9X1keWV1h','','subject','255','_volume',NULL,'0','0'),(NULL,430,'备注','2DsgnvVbdceFR9X1keWV1h','','description','100','_volume',NULL,'0','0'),('1',431,'总页数','2DsgnvVbdceFR9X1keWV1h','','pagenum','8','_volume','0','0','0'),('1',432,'物理位置','2DsgnvVbdceFR9X1keWV1h','','address','32','_volume','0','0','0'),(NULL,433,'档号','1pO-IIygh3IXgZXKwmmeTQ','','recordNo','255','_record',NULL,'0','0'),(NULL,434,'全宗','1pO-IIygh3IXgZXKwmmeTQ','','fondsid','2','_record',NULL,'0','0'),(NULL,435,'年度','1pO-IIygh3IXgZXKwmmeTQ','','year','4','_record',NULL,'0','0'),(NULL,436,'部门','1pO-IIygh3IXgZXKwmmeTQ','','department','3','_record',NULL,'0','0'),(NULL,437,'保管期限','1pO-IIygh3IXgZXKwmmeTQ','','deadline','4','_record',NULL,'0','0'),(NULL,438,'顺序号','1pO-IIygh3IXgZXKwmmeTQ','','sequencNo','3','_record',NULL,'0','0'),(NULL,439,'题名','1pO-IIygh3IXgZXKwmmeTQ','','subject','255','_record',NULL,'0','0'),(NULL,440,'备注','1pO-IIygh3IXgZXKwmmeTQ','','description','100','_record',NULL,'0','0'),('1',441,'页数','1pO-IIygh3IXgZXKwmmeTQ','','pagenum','8','_record','0','0','0'),('1',442,'物理位置','1pO-IIygh3IXgZXKwmmeTQ','','address','32','_record','0','0','0'),(NULL,443,'档号','1pO-IIygh3IXgZXKwmmeTQ','','recordNo','255','_piece',NULL,'0','0'),(NULL,444,'全宗','1pO-IIygh3IXgZXKwmmeTQ','','fondsid','2','_piece',NULL,'0','0'),(NULL,445,'年度','1pO-IIygh3IXgZXKwmmeTQ','','year','4','_piece',NULL,'1','0'),(NULL,446,'部门','1pO-IIygh3IXgZXKwmmeTQ','','department','3','_piece',NULL,'1','0'),(NULL,447,'保管期限','1pO-IIygh3IXgZXKwmmeTQ','','deadline','4','_piece',NULL,'1','0'),(NULL,448,'顺序号','1pO-IIygh3IXgZXKwmmeTQ','','sequencNo','3','_piece',NULL,'0','0'),(NULL,449,'题名','1pO-IIygh3IXgZXKwmmeTQ','','subject','255','_piece',NULL,'0','0'),(NULL,450,'备注','1pO-IIygh3IXgZXKwmmeTQ','','description','100','_piece',NULL,'0','0'),('1',451,'页数','1pO-IIygh3IXgZXKwmmeTQ','','pagenum','8','_piece','0','0','0'),('1',452,'物理位置','1pO-IIygh3IXgZXKwmmeTQ','','address','32','_piece','0','0','0'),(NULL,453,'案卷号','1pO-IIygh3IXgZXKwmmeTQ','','volumeNo','255','_volume',NULL,'0','0'),(NULL,454,'全宗','1pO-IIygh3IXgZXKwmmeTQ','','fondsid','2','_volume',NULL,'0','0'),(NULL,455,'年度','1pO-IIygh3IXgZXKwmmeTQ','','year','4','_volume',NULL,'0','0'),(NULL,456,'部门','1pO-IIygh3IXgZXKwmmeTQ','','department','3','_volume',NULL,'0','0'),(NULL,457,'保管期限','1pO-IIygh3IXgZXKwmmeTQ','','deadline','4','_volume',NULL,'0','0'),(NULL,458,'题名','1pO-IIygh3IXgZXKwmmeTQ','','subject','255','_volume',NULL,'0','0'),(NULL,459,'备注','1pO-IIygh3IXgZXKwmmeTQ','','description','100','_volume',NULL,'0','0'),('1',460,'总页数','1pO-IIygh3IXgZXKwmmeTQ','','pagenum','8','_volume','0','0','0'),('1',461,'物理位置','1pO-IIygh3IXgZXKwmmeTQ','','address','32','_volume','0','0','0'),(NULL,497,'档号','08PRCM7Fhffa25_t9kiKMd','','recordNo','255','_record',NULL,'0','0'),(NULL,498,'全宗','08PRCM7Fhffa25_t9kiKMd','','fondsid','2','_record',NULL,'0','0'),(NULL,499,'年度','08PRCM7Fhffa25_t9kiKMd','','year','4','_record',NULL,'0','0'),(NULL,500,'部门','08PRCM7Fhffa25_t9kiKMd','','department','3','_record',NULL,'0','0'),(NULL,501,'保管期限','08PRCM7Fhffa25_t9kiKMd','','deadline','4','_record',NULL,'0','0'),(NULL,502,'顺序号','08PRCM7Fhffa25_t9kiKMd','','sequencNo','3','_record',NULL,'0','0'),(NULL,503,'题名','08PRCM7Fhffa25_t9kiKMd','','subject','255','_record',NULL,'0','0'),(NULL,504,'备注','08PRCM7Fhffa25_t9kiKMd','','description','100','_record',NULL,'0','0'),('1',505,'页数','08PRCM7Fhffa25_t9kiKMd','','pagenum','8','_record','0','0','0'),('1',506,'物理位置','08PRCM7Fhffa25_t9kiKMd','','address','32','_record','0','0','0'),('1',507,'时间','08PRCM7Fhffa25_t9kiKMd','','column5','99','_record','0','0','0'),('1',508,'归档单位','08PRCM7Fhffa25_t9kiKMd','','column6','99','_record','0','0','0'),(NULL,509,'档号','08PRCM7Fhffa25_t9kiKMd','','recordNo','255','_piece',NULL,'0','0'),(NULL,510,'全宗','08PRCM7Fhffa25_t9kiKMd','','fondsid','2','_piece',NULL,'0','0'),(NULL,511,'年度','08PRCM7Fhffa25_t9kiKMd','','year','4','_piece',NULL,'1','0'),(NULL,512,'部门','08PRCM7Fhffa25_t9kiKMd','','department','3','_piece',NULL,'1','0'),(NULL,513,'保管期限','08PRCM7Fhffa25_t9kiKMd','','deadline','4','_piece',NULL,'1','0'),(NULL,514,'顺序号','08PRCM7Fhffa25_t9kiKMd','','sequencNo','3','_piece',NULL,'0','0'),(NULL,515,'题名','08PRCM7Fhffa25_t9kiKMd','','subject','255','_piece',NULL,'0','0'),(NULL,516,'备注','08PRCM7Fhffa25_t9kiKMd','','description','100','_piece',NULL,'0','0'),('1',517,'页数','08PRCM7Fhffa25_t9kiKMd','','pagenum','8','_piece','0','0','0'),('1',518,'物理位置','08PRCM7Fhffa25_t9kiKMd','','address','32','_piece','0','0','0'),('1',519,'时间','08PRCM7Fhffa25_t9kiKMd','','column1','10','_piece','0','0','0'),('1',520,'归档单位','08PRCM7Fhffa25_t9kiKMd','','column2','99','_piece','0','0','0'),(NULL,521,'案卷号','08PRCM7Fhffa25_t9kiKMd','','volumeNo','255','_volume',NULL,'0','0'),(NULL,522,'全宗','08PRCM7Fhffa25_t9kiKMd','','fondsid','2','_volume',NULL,'0','0'),(NULL,523,'年度','08PRCM7Fhffa25_t9kiKMd','','year','4','_volume',NULL,'0','0'),(NULL,524,'部门','08PRCM7Fhffa25_t9kiKMd','','department','3','_volume',NULL,'0','0'),(NULL,525,'保管期限','08PRCM7Fhffa25_t9kiKMd','','deadline','4','_volume',NULL,'0','0'),(NULL,526,'题名','08PRCM7Fhffa25_t9kiKMd','','subject','255','_volume',NULL,'0','0'),(NULL,527,'备注','08PRCM7Fhffa25_t9kiKMd','','description','100','_volume',NULL,'0','0'),('1',528,'总页数','08PRCM7Fhffa25_t9kiKMd','','pagenum','8','_volume','0','0','0'),('1',529,'物理位置','08PRCM7Fhffa25_t9kiKMd','','address','32','_volume','0','0','0'),('1',530,'时间','08PRCM7Fhffa25_t9kiKMd','','column3','10','_volume','0','0','0'),('1',531,'归档单位','08PRCM7Fhffa25_t9kiKMd','','column4','99','_volume','0','0','0'),(NULL,532,'档号','2QKlVFhd97AEFH8tN6paz7','','recordNo','255','_record',NULL,'0','0'),(NULL,533,'全宗','2QKlVFhd97AEFH8tN6paz7','','fondsid','2','_record',NULL,'0','0'),(NULL,534,'年度','2QKlVFhd97AEFH8tN6paz7','','year','4','_record',NULL,'0','0'),(NULL,535,'部门','2QKlVFhd97AEFH8tN6paz7','','department','3','_record',NULL,'0','0'),(NULL,536,'保管期限','2QKlVFhd97AEFH8tN6paz7','','deadline','4','_record',NULL,'0','0'),(NULL,537,'顺序号','2QKlVFhd97AEFH8tN6paz7','','sequencNo','3','_record',NULL,'0','0'),(NULL,538,'题名','2QKlVFhd97AEFH8tN6paz7','','subject','255','_record',NULL,'0','0'),(NULL,539,'备注','2QKlVFhd97AEFH8tN6paz7','','description','100','_record',NULL,'0','0'),('1',540,'页数','2QKlVFhd97AEFH8tN6paz7','','pagenum','8','_record','0','0','0'),('1',541,'物理位置','2QKlVFhd97AEFH8tN6paz7','','address','32','_record','0','0','0'),(NULL,542,'档号','2QKlVFhd97AEFH8tN6paz7','','recordNo','255','_piece',NULL,'0','0'),(NULL,543,'全宗','2QKlVFhd97AEFH8tN6paz7','','fondsid','2','_piece',NULL,'0','0'),(NULL,544,'年度','2QKlVFhd97AEFH8tN6paz7','','year','4','_piece',NULL,'1','0'),(NULL,545,'部门','2QKlVFhd97AEFH8tN6paz7','','department','3','_piece',NULL,'1','0'),(NULL,546,'保管期限','2QKlVFhd97AEFH8tN6paz7','','deadline','4','_piece',NULL,'1','0'),(NULL,547,'顺序号','2QKlVFhd97AEFH8tN6paz7','','sequencNo','3','_piece',NULL,'0','0'),(NULL,548,'题名','2QKlVFhd97AEFH8tN6paz7','','subject','255','_piece',NULL,'0','0'),(NULL,549,'备注','2QKlVFhd97AEFH8tN6paz7','','description','100','_piece',NULL,'0','0'),('1',550,'页数','2QKlVFhd97AEFH8tN6paz7','','pagenum','8','_piece','0','0','0'),('1',551,'物理位置','2QKlVFhd97AEFH8tN6paz7','','address','32','_piece','0','0','0'),(NULL,552,'案卷号','2QKlVFhd97AEFH8tN6paz7','','volumeNo','255','_volume',NULL,'0','0'),(NULL,553,'全宗','2QKlVFhd97AEFH8tN6paz7','','fondsid','2','_volume',NULL,'0','0'),(NULL,554,'年度','2QKlVFhd97AEFH8tN6paz7','','year','4','_volume',NULL,'0','0'),(NULL,555,'部门','2QKlVFhd97AEFH8tN6paz7','','department','3','_volume',NULL,'0','0'),(NULL,556,'保管期限','2QKlVFhd97AEFH8tN6paz7','','deadline','4','_volume',NULL,'0','0'),(NULL,557,'题名','2QKlVFhd97AEFH8tN6paz7','','subject','255','_volume',NULL,'0','0'),(NULL,558,'备注','2QKlVFhd97AEFH8tN6paz7','','description','100','_volume',NULL,'0','0'),('1',559,'总页数','2QKlVFhd97AEFH8tN6paz7','','pagenum','8','_volume','0','0','0'),('1',560,'物理位置','2QKlVFhd97AEFH8tN6paz7','','address','32','_volume','0','0','0'),(NULL,561,'档号','1ilY3KXZ13dUEcdLicNhlj','','recordNo','255','_record',NULL,'0','0'),(NULL,562,'全宗','1ilY3KXZ13dUEcdLicNhlj','','fondsid','2','_record',NULL,'0','0'),(NULL,563,'年度','1ilY3KXZ13dUEcdLicNhlj','','year','4','_record',NULL,'0','0'),(NULL,564,'部门','1ilY3KXZ13dUEcdLicNhlj','','department','3','_record',NULL,'0','0'),(NULL,565,'保管期限','1ilY3KXZ13dUEcdLicNhlj','','deadline','4','_record',NULL,'0','0'),(NULL,566,'顺序号','1ilY3KXZ13dUEcdLicNhlj','','sequencNo','3','_record',NULL,'0','0'),(NULL,567,'材料名称','1ilY3KXZ13dUEcdLicNhlj','','subject','255','_record',NULL,'0','0'),(NULL,568,'备注','1ilY3KXZ13dUEcdLicNhlj','','description','100','_record',NULL,'0','0'),('1',569,'页数','1ilY3KXZ13dUEcdLicNhlj','','pagenum','8','_record','0','0','0'),('1',570,'物理位置','1ilY3KXZ13dUEcdLicNhlj','','address','32','_record','0','0','0'),(NULL,571,'档号','1ilY3KXZ13dUEcdLicNhlj','','recordNo','255','_piece',NULL,'0','0'),(NULL,572,'全宗','1ilY3KXZ13dUEcdLicNhlj','','fondsid','2','_piece',NULL,'0','0'),(NULL,573,'年度','1ilY3KXZ13dUEcdLicNhlj','','year','4','_piece',NULL,'1','0'),(NULL,574,'部门','1ilY3KXZ13dUEcdLicNhlj','','department','3','_piece',NULL,'1','0'),(NULL,575,'保管期限','1ilY3KXZ13dUEcdLicNhlj','','deadline','4','_piece',NULL,'1','0'),(NULL,576,'顺序号','1ilY3KXZ13dUEcdLicNhlj','','sequencNo','3','_piece',NULL,'0','0'),(NULL,577,'姓名','1ilY3KXZ13dUEcdLicNhlj','','subject','255','_piece',NULL,'0','0'),(NULL,578,'备注','1ilY3KXZ13dUEcdLicNhlj','','description','100','_piece',NULL,'0','0'),('1',579,'页数','1ilY3KXZ13dUEcdLicNhlj','','pagenum','8','_piece','0','0','0'),('1',580,'物理位置','1ilY3KXZ13dUEcdLicNhlj','','address','32','_piece','0','0','0'),(NULL,581,'案卷号','1ilY3KXZ13dUEcdLicNhlj','','volumeNo','255','_volume',NULL,'0','0'),(NULL,582,'全宗','1ilY3KXZ13dUEcdLicNhlj','','fondsid','2','_volume',NULL,'0','0'),(NULL,583,'年度','1ilY3KXZ13dUEcdLicNhlj','','year','4','_volume',NULL,'1','0'),(NULL,584,'部门','1ilY3KXZ13dUEcdLicNhlj','','department','3','_volume',NULL,'1','0'),(NULL,585,'保管期限','1ilY3KXZ13dUEcdLicNhlj','','deadline','4','_volume',NULL,'1','0'),(NULL,586,'姓名','1ilY3KXZ13dUEcdLicNhlj','','subject','255','_volume',NULL,'0','0'),(NULL,587,'备注','1ilY3KXZ13dUEcdLicNhlj','','description','100','_volume',NULL,'0','0'),('1',588,'总页数','1ilY3KXZ13dUEcdLicNhlj','','pagenum','8','_volume','0','0','0'),('1',589,'物理位置','1ilY3KXZ13dUEcdLicNhlj','','address','32','_volume','0','0','0'),(NULL,590,'档号','16N5ewUi5czocWuPmZnb7L','','recordNo','255','_record',NULL,'0','0'),(NULL,591,'全宗','16N5ewUi5czocWuPmZnb7L','','fondsid','2','_record',NULL,'0','0'),(NULL,592,'年度','16N5ewUi5czocWuPmZnb7L','','year','4','_record',NULL,'0','0'),(NULL,593,'部门','16N5ewUi5czocWuPmZnb7L','','department','3','_record',NULL,'0','0'),(NULL,594,'保管期限','16N5ewUi5czocWuPmZnb7L','','deadline','4','_record',NULL,'0','0'),(NULL,595,'顺序号','16N5ewUi5czocWuPmZnb7L','','sequencNo','3','_record',NULL,'0','0'),(NULL,596,'题名','16N5ewUi5czocWuPmZnb7L','','subject','255','_record',NULL,'0','0'),(NULL,597,'备注','16N5ewUi5czocWuPmZnb7L','','description','100','_record',NULL,'0','0'),('1',598,'页数','16N5ewUi5czocWuPmZnb7L','','pagenum','8','_record','0','0','0'),('1',599,'物理位置','16N5ewUi5czocWuPmZnb7L','','address','32','_record','0','0','0'),(NULL,600,'档号','16N5ewUi5czocWuPmZnb7L','','recordNo','255','_piece',NULL,'0','0'),(NULL,601,'全宗','16N5ewUi5czocWuPmZnb7L','','fondsid','2','_piece',NULL,'0','0'),(NULL,602,'年度','16N5ewUi5czocWuPmZnb7L','','year','4','_piece',NULL,'1','0'),(NULL,603,'部门','16N5ewUi5czocWuPmZnb7L','','department','3','_piece',NULL,'1','0'),(NULL,604,'保管期限','16N5ewUi5czocWuPmZnb7L','','deadline','4','_piece',NULL,'1','0'),(NULL,605,'顺序号','16N5ewUi5czocWuPmZnb7L','','sequencNo','3','_piece',NULL,'0','0'),(NULL,606,'题名','16N5ewUi5czocWuPmZnb7L','','subject','255','_piece',NULL,'0','0'),(NULL,607,'备注','16N5ewUi5czocWuPmZnb7L','','description','100','_piece',NULL,'0','0'),('1',608,'页数','16N5ewUi5czocWuPmZnb7L','','pagenum','8','_piece','0','0','0'),('1',609,'物理位置','16N5ewUi5czocWuPmZnb7L','','address','32','_piece','0','0','0'),('1',610,'归档单位','16N5ewUi5czocWuPmZnb7L','','column1','99','_piece','0','0','0'),(NULL,611,'案卷号','16N5ewUi5czocWuPmZnb7L','','volumeNo','255','_volume',NULL,'0','0'),(NULL,612,'全宗','16N5ewUi5czocWuPmZnb7L','','fondsid','2','_volume',NULL,'0','0'),(NULL,613,'年度','16N5ewUi5czocWuPmZnb7L','','year','4','_volume',NULL,'0','0'),(NULL,614,'部门','16N5ewUi5czocWuPmZnb7L','','department','3','_volume',NULL,'0','0'),(NULL,615,'保管期限','16N5ewUi5czocWuPmZnb7L','','deadline','4','_volume',NULL,'0','0'),(NULL,616,'题名','16N5ewUi5czocWuPmZnb7L','','subject','255','_volume',NULL,'0','0'),(NULL,617,'备注','16N5ewUi5czocWuPmZnb7L','','description','100','_volume',NULL,'0','0'),('1',618,'总页数','16N5ewUi5czocWuPmZnb7L','','pagenum','8','_volume','0','0','0'),('1',619,'物理位置','16N5ewUi5czocWuPmZnb7L','','address','32','_volume','0','0','0'),('1',620,'归档单位','16N5ewUi5czocWuPmZnb7L','','column2','99','_volume','0','0','0'),(NULL,685,'档号','2WEOSBOb97tWlIPRT1jbtM','','recordNo','255','_record',NULL,'0','0'),(NULL,686,'全宗','2WEOSBOb97tWlIPRT1jbtM','','fondsid','2','_record',NULL,'0','0'),(NULL,687,'年度','2WEOSBOb97tWlIPRT1jbtM','','year','4','_record',NULL,'0','0'),(NULL,688,'部门','2WEOSBOb97tWlIPRT1jbtM','','department','3','_record',NULL,'0','0'),(NULL,689,'保管期限','2WEOSBOb97tWlIPRT1jbtM','','deadline','4','_record',NULL,'0','0'),(NULL,690,'顺序号','2WEOSBOb97tWlIPRT1jbtM','','sequencNo','3','_record',NULL,'0','0'),(NULL,691,'题名','2WEOSBOb97tWlIPRT1jbtM','','subject','255','_record',NULL,'0','0'),(NULL,692,'备注','2WEOSBOb97tWlIPRT1jbtM','','description','100','_record',NULL,'0','0'),('1',693,'页数','2WEOSBOb97tWlIPRT1jbtM','','pagenum','8','_record','0','0','0'),('1',694,'物理位置','2WEOSBOb97tWlIPRT1jbtM','','address','32','_record','0','0','0'),(NULL,695,'档号','2WEOSBOb97tWlIPRT1jbtM','','recordNo','255','_piece',NULL,'0','0'),(NULL,696,'全宗','2WEOSBOb97tWlIPRT1jbtM','','fondsid','2','_piece',NULL,'0','0'),(NULL,697,'年度','2WEOSBOb97tWlIPRT1jbtM','','year','4','_piece',NULL,'1','0'),(NULL,698,'部门','2WEOSBOb97tWlIPRT1jbtM','','department','3','_piece',NULL,'1','0'),(NULL,699,'保管期限','2WEOSBOb97tWlIPRT1jbtM','','deadline','4','_piece',NULL,'1','0'),(NULL,700,'顺序号','2WEOSBOb97tWlIPRT1jbtM','','sequencNo','3','_piece',NULL,'0','0'),(NULL,701,'产权人','2WEOSBOb97tWlIPRT1jbtM','','subject','255','_piece',NULL,'0','0'),(NULL,702,'备注','2WEOSBOb97tWlIPRT1jbtM','','description','100','_piece',NULL,'0','0'),('1',703,'页数','2WEOSBOb97tWlIPRT1jbtM','','pagenum','8','_piece','0','0','0'),('1',704,'物理位置','2WEOSBOb97tWlIPRT1jbtM','','address','32','_piece','0','0','0'),('1',705,'业务编号','2WEOSBOb97tWlIPRT1jbtM','','column1','255','_piece','0','0','0'),('1',706,'产权证号','2WEOSBOb97tWlIPRT1jbtM','','column2','255','_piece','0','0','0'),('1',707,'房屋座落','2WEOSBOb97tWlIPRT1jbtM','','column3','255','_piece','0','0','0'),(NULL,708,'案卷号','2WEOSBOb97tWlIPRT1jbtM','','volumeNo','255','_volume',NULL,'0','0'),(NULL,709,'全宗','2WEOSBOb97tWlIPRT1jbtM','','fondsid','2','_volume',NULL,'0','0'),(NULL,710,'年度','2WEOSBOb97tWlIPRT1jbtM','','year','4','_volume',NULL,'0','0'),(NULL,711,'部门','2WEOSBOb97tWlIPRT1jbtM','','department','3','_volume',NULL,'0','0'),(NULL,712,'保管期限','2WEOSBOb97tWlIPRT1jbtM','','deadline','4','_volume',NULL,'0','0'),(NULL,713,'题名','2WEOSBOb97tWlIPRT1jbtM','','subject','255','_volume',NULL,'0','0'),(NULL,714,'备注','2WEOSBOb97tWlIPRT1jbtM','','description','100','_volume',NULL,'0','0'),('1',715,'总页数','2WEOSBOb97tWlIPRT1jbtM','','pagenum','8','_volume','0','0','0'),('1',716,'物理位置','2WEOSBOb97tWlIPRT1jbtM','','address','32','_volume','0','0','0'),(NULL,752,'档号','1Xxi9HLzB7Qay2UJCfzLkr','','recordNo','255','_record',NULL,'0','0'),(NULL,753,'全宗','1Xxi9HLzB7Qay2UJCfzLkr','','fondsid','2','_record',NULL,'0','0'),(NULL,754,'年度','1Xxi9HLzB7Qay2UJCfzLkr','','year','4','_record',NULL,'0','0'),(NULL,755,'部门','1Xxi9HLzB7Qay2UJCfzLkr','','department','3','_record',NULL,'0','0'),(NULL,756,'保管期限','1Xxi9HLzB7Qay2UJCfzLkr','','deadline','4','_record',NULL,'0','0'),(NULL,757,'顺序号','1Xxi9HLzB7Qay2UJCfzLkr','','sequencNo','3','_record',NULL,'0','0'),(NULL,758,'题名','1Xxi9HLzB7Qay2UJCfzLkr','','subject','255','_record',NULL,'0','0'),(NULL,759,'备注','1Xxi9HLzB7Qay2UJCfzLkr','','description','100','_record',NULL,'0','0'),('1',760,'页数','1Xxi9HLzB7Qay2UJCfzLkr','','pagenum','8','_record','0','0','0'),('1',761,'物理位置','1Xxi9HLzB7Qay2UJCfzLkr','','address','32','_record','0','0','0'),('1',762,'非诉讼种类','1Xxi9HLzB7Qay2UJCfzLkr','','index1','4','_record','1','0','0'),('1',763,'123','1Xxi9HLzB7Qay2UJCfzLkr','','column1','123','_record','0','0','0'),('1',764,'诉讼种类','1Xxi9HLzB7Qay2UJCfzLkr','','index0','4','_record','1','0','0'),(NULL,765,'档号','1Xxi9HLzB7Qay2UJCfzLkr','','recordNo','255','_piece',NULL,'0','0'),(NULL,766,'全宗','1Xxi9HLzB7Qay2UJCfzLkr','','fondsid','2','_piece',NULL,'0','0'),(NULL,767,'年度','1Xxi9HLzB7Qay2UJCfzLkr','','year','4','_piece',NULL,'1','0'),(NULL,768,'部门','1Xxi9HLzB7Qay2UJCfzLkr','','department','3','_piece',NULL,'1','0'),(NULL,769,'保管期限','1Xxi9HLzB7Qay2UJCfzLkr','','deadline','4','_piece',NULL,'1','0'),(NULL,770,'顺序号','1Xxi9HLzB7Qay2UJCfzLkr','','sequencNo','3','_piece',NULL,'0','0'),(NULL,771,'题名','1Xxi9HLzB7Qay2UJCfzLkr','','subject','255','_piece',NULL,'0','0'),(NULL,772,'备注','1Xxi9HLzB7Qay2UJCfzLkr','','description','100','_piece',NULL,'0','0'),('1',773,'页数','1Xxi9HLzB7Qay2UJCfzLkr','','pagenum','8','_piece','0','0','0'),('1',774,'物理位置','1Xxi9HLzB7Qay2UJCfzLkr','','address','32','_piece','0','0','0'),(NULL,775,'案卷号','1Xxi9HLzB7Qay2UJCfzLkr','','volumeNo','255','_volume',NULL,'0','0'),(NULL,776,'全宗','1Xxi9HLzB7Qay2UJCfzLkr','','fondsid','2','_volume',NULL,'0','0'),(NULL,777,'年度','1Xxi9HLzB7Qay2UJCfzLkr','','year','4','_volume',NULL,'0','0'),(NULL,778,'部门','1Xxi9HLzB7Qay2UJCfzLkr','','department','3','_volume',NULL,'0','0'),(NULL,779,'保管期限','1Xxi9HLzB7Qay2UJCfzLkr','','deadline','4','_volume',NULL,'0','0'),(NULL,780,'题名','1Xxi9HLzB7Qay2UJCfzLkr','','subject','255','_volume',NULL,'0','0'),(NULL,781,'备注','1Xxi9HLzB7Qay2UJCfzLkr','','description','100','_volume',NULL,'0','0'),('1',782,'总页数','1Xxi9HLzB7Qay2UJCfzLkr','','pagenum','8','_volume','0','0','0'),('1',783,'物理位置','1Xxi9HLzB7Qay2UJCfzLkr','','address','32','_volume','0','0','0'),('1',784,'诉讼种类','1Xxi9HLzB7Qay2UJCfzLkr','','index0','4','_volume','1','0','0');
/*!40000 ALTER TABLE `tablefield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `tableid` varchar(32) NOT NULL,
  `piecetableid` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `recordtypeid` varchar(32) NOT NULL,
  `description` varchar(32) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tableid`),
  KEY `template_ibfk_1` (`recordtypeid`) USING BTREE,
  CONSTRAINT `template_ibfk_1` FOREIGN KEY (`recordtypeid`) REFERENCES `recordtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES ('gx_jx_recordcontent1','gx_jx_piececontent1','新生','16N5ewUi5czocWuPmZnb7L','新生花名册','2017-07-18 03:19:13');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` varchar(32) NOT NULL,
  `roleId` int(11) NOT NULL,
  `userName` varchar(32) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `usergroup` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `teamname` varchar(32) DEFAULT NULL,
  `teampeonum` int(11) DEFAULT NULL,
  `schoolname` varchar(32) DEFAULT NULL,
  `teachername` varchar(32) DEFAULT NULL,
  `applydata` varchar(128) DEFAULT NULL,
  `checkresult` tinyint(1) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT NULL,
  `description` varchar(32) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `editTime` timestamp NULL DEFAULT NULL,
  `lastLogin` timestamp NULL DEFAULT NULL,
  `lastIP` varchar(32) DEFAULT NULL,
  `reserved1` varchar(32) DEFAULT NULL,
  `reserved2` varchar(32) DEFAULT NULL,
  `reserved3` varchar(32) DEFAULT NULL,
  `reservedi1` bigint(20) DEFAULT NULL,
  `reservedi2` bigint(20) DEFAULT NULL,
  `reservedd1` decimal(20,0) DEFAULT NULL,
  `reservedd2` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_Relationship_8` (`roleId`) USING BTREE,
  KEY `user_ibfk_2` (`usergroup`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`usergroup`) REFERENCES `usergroup` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0vljRLdvZdKXxuDNsGgzWL',2,'孙','0BDC050FC15CC32831C2C490F1800CF8','',NULL,'',NULL,NULL,NULL,NULL,NULL,1,NULL,'','2017-07-11 07:39:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('122dssdsfdsf',1,'superadmin','AC497CFABA23C4184CB03B97E8C51E0A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,'2016-03-14 08:50:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2SEoVdd8x56ovbw8MhjcMI',2,'admin','1C15EE5F9469C19E0F7CAD3BFB4C31C4','',NULL,'',NULL,NULL,NULL,NULL,NULL,1,NULL,'','2017-07-20 07:21:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `id` varchar(32) NOT NULL,
  `groupname` varchar(32) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroupauth`
--

DROP TABLE IF EXISTS `usergroupauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroupauth` (
  `usergroupid` varchar(32) NOT NULL,
  `authid` varchar(32) NOT NULL,
  PRIMARY KEY (`usergroupid`,`authid`),
  KEY `usergroupauth_ibfk_2` (`authid`) USING BTREE,
  CONSTRAINT `usergroupauth_ibfk_1` FOREIGN KEY (`usergroupid`) REFERENCES `usergroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usergroupauth_ibfk_2` FOREIGN KEY (`authid`) REFERENCES `authority` (`authorityId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroupauth`
--

LOCK TABLES `usergroupauth` WRITE;
/*!40000 ALTER TABLE `usergroupauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroupauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` varchar(2) NOT NULL,
  `no` char(32) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (39,'2015','1','2015'),(40,'2010','1','2010'),(41,'2011','1','2011'),(42,'2012','1','2012'),(43,'2013','1','2013'),(44,'2014','1','2014'),(45,'2016','1','2016'),(46,'2017','1','2017'),(47,'2009','1','2009'),(48,'2008','1','2008'),(49,'2007','1','2007'),(50,'2006','1','2006'),(51,'2005','1','2005'),(52,'2004','1','2004'),(53,'2003','1','2003'),(54,'2002','1','2002'),(55,'2001','1','2001'),(56,'2000','1','2000');
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-31 16:12:56
