-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: gfadmin
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '昵称',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理后台账号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'test11','aa123123','01ee7f6575a386e7fa80958367c4c9ae',NULL,NULL,'2020-05-01 12:26:26',NULL,1),(2,'test12','ccc','01ee7f6575a386e7fa80958367c4c9ae',NULL,NULL,'2020-05-01 12:26:26',NULL,1),(3,'test111','222','',NULL,NULL,'2021-05-16 11:16:07','2021-05-16 16:41:30',1),(4,'test113','123','01ee7f6575a386e7fa80958367c4c9ae',NULL,NULL,'2020-07-29 23:54:58',NULL,1),(5,'123123','bbbb','01ee7f6575a386e7fa80958367c4c9ae',NULL,NULL,'2020-08-03 22:05:23',NULL,1),(6,'aaa111','123123','04e8ed01f11478a9b15a5ade46ecf463',NULL,NULL,'2020-08-25 21:39:57',NULL,1),(7,'222aaaaa','12EEEE','9624fe5809b00f507989097f040d4339',NULL,NULL,'2020-09-28 00:06:07',NULL,1),(8,'test111','12322','359a443b76e08c685a24e9ca93820dfb',NULL,NULL,'2021-05-16 11:16:07',NULL,1),(9,'test144','2222','dd2299fa2599853d216100e1b59c7798',NULL,NULL,'2021-06-28 16:06:05',NULL,1);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_record`
--

DROP TABLE IF EXISTS `chat_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sender_id` int unsigned NOT NULL COMMENT '发送人',
  `receiver_id` int unsigned NOT NULL COMMENT '接收人',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态，0：未读 1：已读 2：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='聊天记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_record`
--

LOCK TABLES `chat_record` WRITE;
/*!40000 ALTER TABLE `chat_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatroom` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '群聊名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1:正常,0:不可用)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='聊天室';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatroom`
--

LOCK TABLES `chatroom` WRITE;
/*!40000 ALTER TABLE `chatroom` DISABLE KEYS */;
INSERT INTO `chatroom` VALUES (1,'公共聊天室',1,'2020-10-11 22:20:20',NULL),(2,'群聊',1,'2020-10-11 22:21:18',NULL),(3,'群聊',1,'2020-10-11 22:22:36',NULL),(4,'群聊',1,'2020-10-11 22:24:14',NULL);
/*!40000 ALTER TABLE `chatroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatroom_record`
--

DROP TABLE IF EXISTS `chatroom_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatroom_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sender_id` int unsigned NOT NULL COMMENT '发送人id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `room_id` int unsigned NOT NULL COMMENT '群聊id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='聊天室聊天记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatroom_record`
--

LOCK TABLES `chatroom_record` WRITE;
/*!40000 ALTER TABLE `chatroom_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatroom_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatroom_user`
--

DROP TABLE IF EXISTS `chatroom_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatroom_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `room_id` int unsigned NOT NULL COMMENT '群聊房间id',
  `user_id` int unsigned NOT NULL COMMENT '用户id',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户在群内昵称',
  `is_owner` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是群主',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='聊天室用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatroom_user`
--

LOCK TABLES `chatroom_user` WRITE;
/*!40000 ALTER TABLE `chatroom_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatroom_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `applicant_id` int unsigned NOT NULL COMMENT '申请人',
  `respondent_id` int unsigned NOT NULL COMMENT '被申请人',
  `message` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '验证留言',
  `create_time` datetime NOT NULL COMMENT '发起时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态，0：已申请 1：已同意 2：已解除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='好友关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户名称',
  `uid` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '客户唯一id',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '对话状态（1：机器人，2：排队中，3：人工对话）',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'','MTIzNDU2',NULL,NULL,4,'2020-09-28 23:01:56','2020-06-26 15:36:03'),(5,'','MTIzNDU=',NULL,NULL,1,'2020-09-01 16:08:24','2020-06-26 23:59:18'),(12,'','MTEx',NULL,NULL,1,'2020-06-27 11:03:38','2020-06-27 11:02:15'),(14,'','MTIz',NULL,NULL,1,'2020-11-15 14:52:40','2020-08-25 15:58:00'),(15,'','MTIzNA==',NULL,NULL,1,'2020-08-26 10:01:09','2020-08-25 22:34:32'),(17,'','JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0',NULL,NULL,1,'2020-09-11 12:44:23','2020-09-11 11:29:51'),(18,'','YWFhYQ==',NULL,NULL,1,'2020-09-11 15:59:38','2020-09-11 12:31:24'),(19,'','MzMzMw==',NULL,NULL,1,'2020-09-11 15:28:21','2020-09-11 14:08:13'),(20,'','MzRkZHM=',NULL,NULL,1,'2020-09-11 14:36:57','2020-09-11 14:18:30'),(21,'','OTk5OQ==',NULL,NULL,1,'2020-09-11 17:12:48','2020-09-11 16:55:29'),(22,'','MjIy',NULL,NULL,1,'2021-06-09 18:59:09','2020-09-11 16:55:35'),(23,'','MDAwMDA=',NULL,NULL,1,'2020-09-11 16:56:08','2020-09-11 16:56:08'),(24,'','ODg4ODg=',NULL,NULL,1,'2020-09-11 17:22:22','2020-09-11 17:22:22'),(25,'','c3Nz',NULL,NULL,1,'2020-09-11 17:45:20','2020-09-11 17:45:20'),(29,'','MzMz',NULL,NULL,1,'2021-06-09 19:02:01','2020-09-28 22:57:05'),(30,'','MjIyMQ==',NULL,NULL,1,'2020-10-02 20:44:03','2020-10-02 20:43:41'),(31,'','NTU=',NULL,NULL,1,'2021-05-06 19:32:40','2021-05-06 19:30:49'),(32,'','MTI=',NULL,NULL,1,'2021-05-17 12:21:25','2021-05-17 12:21:25'),(33,'333333','5577006791947779410',NULL,NULL,1,NULL,'2021-06-11 20:10:24');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30 13:12:41
