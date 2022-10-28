-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: fresh_db
-- ------------------------------------------------------
-- Server version	5.7.38-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 用户',6,'add_user'),(22,'Can change 用户',6,'change_user'),(23,'Can delete 用户',6,'delete_user'),(24,'Can view 用户',6,'view_user'),(25,'Can add 地址',7,'add_address'),(26,'Can change 地址',7,'change_address'),(27,'Can delete 地址',7,'delete_address'),(28,'Can view 地址',7,'view_address'),(29,'Can add 商品SPU',8,'add_goods'),(30,'Can change 商品SPU',8,'change_goods'),(31,'Can delete 商品SPU',8,'delete_goods'),(32,'Can view 商品SPU',8,'view_goods'),(33,'Can add 商品',9,'add_goodssku'),(34,'Can change 商品',9,'change_goodssku'),(35,'Can delete 商品',9,'delete_goodssku'),(36,'Can view 商品',9,'view_goodssku'),(37,'Can add 商品种类',10,'add_goodstype'),(38,'Can change 商品种类',10,'change_goodstype'),(39,'Can delete 商品种类',10,'delete_goodstype'),(40,'Can view 商品种类',10,'view_goodstype'),(41,'Can add 主页促销活动',11,'add_indexpromotionbanner'),(42,'Can change 主页促销活动',11,'change_indexpromotionbanner'),(43,'Can delete 主页促销活动',11,'delete_indexpromotionbanner'),(44,'Can view 主页促销活动',11,'view_indexpromotionbanner'),(45,'Can add 主页分类展示商品',12,'add_indextypegoodsbanner'),(46,'Can change 主页分类展示商品',12,'change_indextypegoodsbanner'),(47,'Can delete 主页分类展示商品',12,'delete_indextypegoodsbanner'),(48,'Can view 主页分类展示商品',12,'view_indextypegoodsbanner'),(49,'Can add 首页轮播商品',13,'add_indexgoodsbanner'),(50,'Can change 首页轮播商品',13,'change_indexgoodsbanner'),(51,'Can delete 首页轮播商品',13,'delete_indexgoodsbanner'),(52,'Can view 首页轮播商品',13,'view_indexgoodsbanner'),(53,'Can add 商品图片',14,'add_goodsimage'),(54,'Can change 商品图片',14,'change_goodsimage'),(55,'Can delete 商品图片',14,'delete_goodsimage'),(56,'Can view 商品图片',14,'view_goodsimage'),(57,'Can add 订单商品',15,'add_ordergoods'),(58,'Can change 订单商品',15,'change_ordergoods'),(59,'Can delete 订单商品',15,'delete_ordergoods'),(60,'Can view 订单商品',15,'view_ordergoods'),(61,'Can add 订单',16,'add_orderinfo'),(62,'Can change 订单',16,'change_orderinfo'),(63,'Can delete 订单',16,'delete_orderinfo'),(64,'Can view 订单',16,'view_orderinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_address`
--

DROP TABLE IF EXISTS `db_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_address_user_id_e5436d20_fk_db_user_id` (`user_id`),
  CONSTRAINT `db_address_user_id_e5436d20_fk_db_user_id` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_address`
--

LOCK TABLES `db_address` WRITE;
/*!40000 ALTER TABLE `db_address` DISABLE KEYS */;
INSERT INTO `db_address` VALUES (1,'2022-06-27 18:54:05.834625','2022-06-27 18:54:05.834706',0,'董祖兴','广东省佛山市南海区','100000','15918897358',1,1),(2,'2022-06-28 09:54:31.893907','2022-06-28 09:54:31.893956',0,'董祖兴','广东省广州市白云区','100000','15918897358',1,2),(3,'2022-07-01 15:36:43.439341','2022-07-01 15:36:43.439462',0,'董祖兴','广东省佛山市南海区','100000','15918897353',1,3);
/*!40000 ALTER TABLE `db_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_goods`
--

DROP TABLE IF EXISTS `db_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_goods`
--

LOCK TABLES `db_goods` WRITE;
/*!40000 ALTER TABLE `db_goods` DISABLE KEYS */;
INSERT INTO `db_goods` VALUES (1,'2022-06-24 12:21:36.724598','2022-06-28 18:21:59.384151',0,'草莓'),(2,'2022-06-24 12:21:58.366691','2022-06-24 12:21:58.366757',0,'葡萄'),(3,'2022-06-24 12:22:08.872391','2022-06-24 12:22:08.872540',0,'柠檬'),(4,'2022-06-24 12:22:17.702811','2022-06-24 12:22:17.702904',0,'奇异果'),(5,'2022-06-24 12:22:30.348839','2022-06-24 12:22:30.348871',0,'青岛北极海捕大青虾'),(6,'2022-06-24 12:22:39.513715','2022-06-24 12:22:39.513762',0,'扇贝'),(7,'2022-06-24 12:22:49.075676','2022-06-24 12:22:49.075758',0,'冷冻秋刀鱼'),(8,'2022-06-24 12:22:59.545865','2022-06-24 12:22:59.545901',0,'基围虾'),(10,'2022-06-25 01:05:15.602247','2022-06-25 01:08:16.428945',0,'菲力牛排'),(11,'2022-06-25 01:08:35.424719','2022-06-25 01:08:35.424760',0,'猪肉'),(12,'2022-06-25 01:08:45.143286','2022-06-25 01:08:45.143317',0,'五花肉'),(13,'2022-06-25 01:08:54.664262','2022-06-25 01:08:54.664309',0,'战斧牛排');
/*!40000 ALTER TABLE `db_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_goods_image`
--

DROP TABLE IF EXISTS `db_goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_goods_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_goods_image_sku_id_a6e43dc8_fk_db_goods_sku_id` (`sku_id`),
  CONSTRAINT `db_goods_image_sku_id_a6e43dc8_fk_db_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `db_goods_sku` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_goods_image`
--

LOCK TABLES `db_goods_image` WRITE;
/*!40000 ALTER TABLE `db_goods_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_goods_sku`
--

DROP TABLE IF EXISTS `db_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_goods_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_goods_sku_type_id_6ecbf0ef_fk_db_goods_type_id` (`type_id`),
  KEY `db_goods_sku_goods_id_7e41e59b_fk_db_goods_id` (`goods_id`),
  CONSTRAINT `db_goods_sku_goods_id_7e41e59b_fk_db_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `db_goods` (`id`),
  CONSTRAINT `db_goods_sku_type_id_6ecbf0ef_fk_db_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `db_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_goods_sku`
--

LOCK TABLES `db_goods_sku` WRITE;
/*!40000 ALTER TABLE `db_goods_sku` DISABLE KEYS */;
INSERT INTO `db_goods_sku` VALUES (1,'2022-06-24 12:30:04.770421','2022-07-01 15:48:52.343953',0,'草莓','草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',0.01,'500','group1/M00/00/00/wKgBBGK1PcyAJZF9AADhpU9_Ylo8256477',1,9,1,1,1),(2,'2022-06-24 12:31:07.150014','2022-06-28 16:41:18.302400',0,'葡萄','草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',0.01,'500','group1/M00/00/00/wKgBBGK1PguAY-D1AAAjjiYTEkw3529485',6,4,1,2,1),(3,'2022-06-24 12:31:50.732902','2022-06-24 12:31:50.732934',0,'柠檬','草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。',0.01,'500','group1/M00/00/00/wKgBBGK1PjaAU6LnAAAgnaeGwNQ0983898',100,0,1,3,1),(4,'2022-06-24 12:32:35.882988','2022-06-28 09:54:50.984351',0,'奇异果','草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',0.01,'500','group1/M00/00/00/wKgBBGK1PmOASFF0AAAeuLYy0pU2287834',99,1,1,4,1),(5,'2022-06-25 00:47:40.875569','2022-06-25 00:47:40.875601',0,'青岛野生海捕大青虾','草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',0.01,'500','group1/M00/00/00/wKgBBGK16qyAIxVlAAAk0DN4-yE4758484',100,0,1,5,2),(6,'2022-06-25 00:48:23.438785','2022-06-25 00:48:23.438818',0,'扇贝','草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',0.01,'500','group1/M00/00/00/wKgBBGK16teAah1gAAAk8WCqqmI6800557',10,1,1,6,2),(7,'2022-06-25 00:49:04.527892','2022-06-28 09:41:30.365478',0,'冷冻秋刀鱼','草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',0.01,'500','group1/M00/00/00/wKgBBGK16wCAVTz4AAAkaP_7_187430644',9,3,1,6,2),(8,'2022-06-25 00:49:41.566424','2022-06-28 19:41:00.799011',0,'基围虾','草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',1000.00,'500','group1/M00/00/00/wKgBBGK16yWAXefsAAA5OS4Kl4c2537485',4,9,1,8,2),(9,'2022-06-25 01:09:47.541052','2022-06-25 10:53:15.447810',0,'菲力牛排','不错',0.01,'500','group1/M00/00/00/wKgBBGK2eJuALcBvAAISnSLERBM5558800',10,0,1,10,3),(10,'2022-06-25 01:11:08.539892','2022-06-25 10:54:15.965206',0,'猪肉','不错',0.01,'500','group1/M00/00/00/wKgBBGK2eNeAaEUPAAGqbqcqMag8865900',10,1,1,11,3),(11,'2022-06-25 01:11:37.672929','2022-06-25 10:54:26.285801',0,'五花肉','不错',0.01,'500','group1/M00/00/00/wKgBBGK2eOKASBLFAAD9gAwlysc1807963',10,2,1,12,3),(12,'2022-06-25 01:12:15.718256','2022-06-25 10:54:39.537552',0,'战斧牛排','不错',0.01,'200','group1/M00/00/00/wKgBBGK2eO-AAya1AAAf2fdu2Cc8854634',10,3,1,13,3);
/*!40000 ALTER TABLE `db_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_goods_type`
--

DROP TABLE IF EXISTS `db_goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_goods_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_goods_type`
--

LOCK TABLES `db_goods_type` WRITE;
/*!40000 ALTER TABLE `db_goods_type` DISABLE KEYS */;
INSERT INTO `db_goods_type` VALUES (1,'2022-06-24 11:35:33.883781','2022-06-24 11:35:33.883822',0,'新鲜水果','fruit','group1/M00/00/00/wKgBBGK1MQWAFWuRAAAmv27pX4k3081469'),(2,'2022-06-24 11:36:08.149937','2022-06-24 11:36:08.149976',0,'海鲜水产','seafood','group1/M00/00/00/wKgBBGK1MSiAbs9rAABHr3RQqFs0246019'),(3,'2022-06-24 11:36:27.574727','2022-06-24 11:36:27.574843',0,'猪牛羊肉','meet','group1/M00/00/00/wKgBBGK1MTuACntvAAAy1Tlm9So4596758'),(4,'2022-06-24 11:36:51.146557','2022-06-24 11:36:51.146604',0,'禽类蛋品','egg','group1/M00/00/00/wKgBBGK1MVOAO6lSAAAqR4DoSUg1189226'),(5,'2022-06-24 11:37:23.273609','2022-06-24 11:37:23.273669',0,'新鲜蔬菜','vegetables','group1/M00/00/00/wKgBBGK1MXOACv_rAAA-0ZoYkpM8683394'),(6,'2022-06-24 11:38:02.686869','2022-06-24 11:38:02.686983',0,'速冻食品','ice','group1/M00/00/00/wKgBBGK1MZqAHXCHAAA3sZPrVzQ7726302');
/*!40000 ALTER TABLE `db_goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_index_banner`
--

DROP TABLE IF EXISTS `db_index_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_index_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_index_banner_sku_id_422036c8_fk_db_goods_sku_id` (`sku_id`),
  CONSTRAINT `db_index_banner_sku_id_422036c8_fk_db_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `db_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_index_banner`
--

LOCK TABLES `db_index_banner` WRITE;
/*!40000 ALTER TABLE `db_index_banner` DISABLE KEYS */;
INSERT INTO `db_index_banner` VALUES (1,'2022-06-24 12:33:06.598370','2022-06-24 12:33:06.598404',0,'group1/M00/00/00/wKgBBGK1PoKALq6IAACpB-LsCdE7920878',0,1),(2,'2022-06-24 12:33:21.456825','2022-06-24 12:33:21.456869',0,'group1/M00/00/00/wKgBBGK1PpGARq7iAAC3B-z8J2c5923202',1,2),(3,'2022-06-24 12:33:35.171123','2022-06-24 12:33:35.171189',0,'group1/M00/00/00/wKgBBGK1Pp-AY9pmAAETwXb_pso7385068',2,3),(4,'2022-06-24 12:33:47.525328','2022-06-24 12:33:47.525362',0,'group1/M00/00/00/wKgBBGK1PquAa9qtAAD0akkXmFo1043020',3,4);
/*!40000 ALTER TABLE `db_index_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_index_promotion`
--

DROP TABLE IF EXISTS `db_index_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_index_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_index_promotion`
--

LOCK TABLES `db_index_promotion` WRITE;
/*!40000 ALTER TABLE `db_index_promotion` DISABLE KEYS */;
INSERT INTO `db_index_promotion` VALUES (1,'2022-06-24 11:38:35.617884','2022-06-24 11:38:35.617909',0,'吃货暑假','https://baidu.com','group1/M00/00/00/wKgBBGK1MbuAJLOKAAA2pLUeB600508521',0),(2,'2022-06-24 11:38:52.102923','2022-06-24 11:38:52.102955',0,'新鲜水果','https://baidu.com','group1/M00/00/00/wKgBBGK1McyAdfLOAAA98yvCs1I7346776',1);
/*!40000 ALTER TABLE `db_index_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_index_type_goods`
--

DROP TABLE IF EXISTS `db_index_type_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_index_type_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_index_type_goods_sku_id_bd841936_fk_db_goods_sku_id` (`sku_id`),
  KEY `db_index_type_goods_type_id_947ae7f1_fk_db_goods_type_id` (`type_id`),
  CONSTRAINT `db_index_type_goods_sku_id_bd841936_fk_db_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `db_goods_sku` (`id`),
  CONSTRAINT `db_index_type_goods_type_id_947ae7f1_fk_db_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `db_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_index_type_goods`
--

LOCK TABLES `db_index_type_goods` WRITE;
/*!40000 ALTER TABLE `db_index_type_goods` DISABLE KEYS */;
INSERT INTO `db_index_type_goods` VALUES (1,'2022-06-24 13:05:58.447004','2022-06-24 20:52:06.802069',0,1,0,1,1),(2,'2022-06-24 13:06:09.667103','2022-06-24 20:52:03.160045',0,1,1,2,1),(3,'2022-06-24 13:06:21.718168','2022-06-24 20:51:59.447488',0,1,2,3,1),(4,'2022-06-24 13:06:33.614588','2022-06-24 20:51:54.640611',0,1,3,4,1),(5,'2022-06-24 13:59:46.831820','2022-06-25 00:56:40.114814',0,1,0,5,2),(6,'2022-06-24 13:59:56.759227','2022-06-25 00:56:48.841747',0,1,1,6,2),(7,'2022-06-24 14:00:09.436833','2022-06-25 10:55:56.701683',0,1,2,7,2),(8,'2022-06-24 14:00:19.176074','2022-06-28 19:40:35.858529',0,1,3,8,2),(9,'2022-06-24 14:00:36.254230','2022-06-24 20:51:39.313131',0,1,0,1,3),(10,'2022-06-24 14:00:47.335800','2022-06-24 20:51:20.279526',0,1,1,2,3),(11,'2022-06-24 14:01:07.074045','2022-06-24 20:51:15.443451',0,1,2,3,3),(12,'2022-06-24 14:01:25.442224','2022-06-24 20:51:06.469088',0,1,3,4,3),(13,'2022-06-24 14:01:34.692340','2022-06-28 18:23:45.793484',0,1,0,1,4),(14,'2022-06-24 14:01:44.888767','2022-06-24 20:51:02.141824',0,1,1,2,4),(15,'2022-06-24 14:01:55.177489','2022-06-24 20:50:57.516388',0,1,2,3,4),(16,'2022-06-24 14:02:06.760882','2022-06-24 20:50:52.274599',0,1,3,4,4),(17,'2022-06-24 14:02:25.922214','2022-06-24 20:50:47.989685',0,1,0,1,5),(18,'2022-06-24 14:02:36.751265','2022-06-24 20:50:43.522798',0,1,1,2,5),(19,'2022-06-24 14:02:47.680254','2022-06-24 20:50:10.191708',0,1,2,3,5),(20,'2022-06-24 14:02:58.755505','2022-06-24 20:50:05.405160',0,1,3,4,5),(21,'2022-06-24 14:03:07.277122','2022-06-24 20:49:56.021894',0,1,0,1,6),(22,'2022-06-24 14:03:16.748958','2022-06-24 20:49:51.505665',0,1,1,2,6),(23,'2022-06-24 14:03:26.266093','2022-06-24 20:49:47.191256',0,1,2,3,6),(24,'2022-06-24 14:03:40.027763','2022-06-24 20:49:42.583260',0,1,3,4,6);
/*!40000 ALTER TABLE `db_index_type_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_order_goods`
--

DROP TABLE IF EXISTS `db_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_order_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `db_order_goods_order_id_b87e296e_fk_db_order_info_order_id` (`order_id`),
  KEY `db_order_goods_sku_id_6bd93d00_fk_db_goods_sku_id` (`sku_id`),
  CONSTRAINT `db_order_goods_order_id_b87e296e_fk_db_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `db_order_info` (`order_id`),
  CONSTRAINT `db_order_goods_sku_id_6bd93d00_fk_db_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `db_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_order_goods`
--

LOCK TABLES `db_order_goods` WRITE;
/*!40000 ALTER TABLE `db_order_goods` DISABLE KEYS */;
INSERT INTO `db_order_goods` VALUES (4,'2022-06-27 19:12:49.183985','2022-06-27 19:12:49.184040',0,1,0.01,'','202206271912491',1),(5,'2022-06-27 19:12:49.378293','2022-06-27 19:12:49.378327',0,1,0.01,'','202206271912491',2),(6,'2022-06-28 00:13:47.104289','2022-06-28 00:13:47.104341',0,1,0.01,'','202206280013471',8),(7,'2022-06-28 00:20:00.251879','2022-06-28 00:20:00.251953',0,1,0.01,'','202206280020001',8),(8,'2022-06-28 00:31:23.601268','2022-06-28 00:31:23.601302',0,1,0.01,'','202206280031231',8),(9,'2022-06-28 00:35:49.651710','2022-06-28 00:35:49.651749',0,1,0.01,'','202206280035491',8),(10,'2022-06-28 00:37:27.908713','2022-06-28 00:37:27.908755',0,1,0.01,'','202206280037271',8),(11,'2022-06-28 09:39:00.337681','2022-06-28 09:39:00.337761',0,1,0.01,'','202206280939001',1),(12,'2022-06-28 09:41:30.364283','2022-06-28 09:41:30.364328',0,1,0.01,'','202206280941301',7),(13,'2022-06-28 09:54:50.983664','2022-06-28 16:50:50.009054',0,1,0.01,'不错','202206280954502',4),(14,'2022-06-28 10:34:13.634938','2022-06-28 16:50:41.039574',0,1,0.01,'不错\r\n','202206281034132',2),(15,'2022-06-28 10:40:31.849455','2022-06-28 16:50:34.584998',0,1,0.01,'不错','202206281040312',2),(16,'2022-06-28 16:41:18.300271','2022-06-28 16:50:24.091857',0,1,0.01,'不错','202206281641182',2),(17,'2022-06-28 19:41:00.797915','2022-06-28 19:41:00.797963',0,1,1000.00,'','202206281941001',8),(18,'2022-07-01 15:29:16.448121','2022-07-01 15:29:16.448237',0,1,0.01,'','202207011529062',1),(19,'2022-07-01 15:37:48.583582','2022-07-01 15:37:48.583679',0,1,0.01,'','202207011537382',1),(20,'2022-07-01 15:38:00.312504','2022-07-01 15:38:00.312617',0,1,0.01,'','202207011537403',1),(21,'2022-07-01 15:41:14.590853','2022-07-01 15:41:14.590954',0,1,0.01,'','202207011541042',1),(22,'2022-07-01 15:48:20.764889','2022-07-01 15:48:20.764998',0,1,0.01,'','202207011548102',1),(23,'2022-07-01 15:49:51.771401','2022-07-01 15:49:51.771502',0,1,0.01,'','202207011549412',1),(24,'2022-07-01 15:50:03.546804','2022-07-01 15:50:03.546905',0,1,0.01,'','202207011549433',1);
/*!40000 ALTER TABLE `db_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_order_info`
--

DROP TABLE IF EXISTS `db_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_order_info` (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transit_price` decimal(10,2) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `trade_no` varchar(128) NOT NULL,
  `addr_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `db_order_info_addr_id_4d82028e_fk_db_address_id` (`addr_id`),
  KEY `db_order_info_user_id_623ef35e_fk_db_user_id` (`user_id`),
  CONSTRAINT `db_order_info_addr_id_4d82028e_fk_db_address_id` FOREIGN KEY (`addr_id`) REFERENCES `db_address` (`id`),
  CONSTRAINT `db_order_info_user_id_623ef35e_fk_db_user_id` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_order_info`
--

LOCK TABLES `db_order_info` WRITE;
/*!40000 ALTER TABLE `db_order_info` DISABLE KEYS */;
INSERT INTO `db_order_info` VALUES ('2022-06-27 19:12:49.172127','2022-06-27 19:12:49.406292',0,'202206271912491',1,2,0.02,10.00,1,'',1,1),('2022-06-28 00:13:47.081814','2022-06-29 00:05:43.717145',0,'202206280013471',3,1,0.01,10.00,4,'2022062922001481280506676076',1,1),('2022-06-28 00:20:00.243987','2022-06-29 00:06:26.421648',0,'202206280020001',3,1,0.01,10.00,4,'2022062922001481280506675965',1,1),('2022-06-28 00:31:23.589626','2022-06-29 00:05:09.585951',0,'202206280031231',3,1,0.01,10.00,4,'2022062922001481280506675964',1,1),('2022-06-28 00:35:49.636554','2022-06-29 00:04:49.226155',0,'202206280035491',3,1,0.01,10.00,4,'2022062922001481280506676075',1,1),('2022-06-28 00:37:27.891118','2022-06-29 00:04:29.034269',0,'202206280037271',3,1,0.01,10.00,4,'2022062922001481280506675963',1,1),('2022-06-28 09:39:00.316384','2022-06-29 00:03:55.907440',0,'202206280939001',3,1,0.01,10.00,4,'2022062922001481280506676074',1,1),('2022-06-28 09:41:30.344781','2022-06-29 00:03:21.239953',0,'202206280941301',3,1,0.01,10.00,4,'2022062922001481280506676073',1,1),('2022-06-28 09:54:50.979975','2022-06-28 16:50:50.014878',0,'202206280954502',3,1,0.01,10.00,5,'2022062822001481280506675551',2,2),('2022-06-28 10:34:13.627014','2022-06-28 16:50:41.049232',0,'202206281034132',3,1,0.01,10.00,5,'2022062822001481280506675942',2,2),('2022-06-28 10:40:31.832698','2022-06-28 16:50:34.588506',0,'202206281040312',3,1,0.01,10.00,5,'2022062822001481280506675939',2,2),('2022-06-28 16:41:18.276010','2022-06-28 16:50:24.095480',0,'202206281641182',3,1,0.01,10.00,5,'2022062822001481280506675957',2,2),('2022-06-28 19:41:00.790002','2022-06-28 19:41:37.226894',0,'202206281941001',3,1,1000.00,10.00,4,'2022062822001481280506676070',1,1),('2022-07-01 15:29:06.415003','2022-07-01 15:29:16.450559',0,'202207011529062',3,1,0.01,10.00,1,'',2,2),('2022-07-01 15:37:38.562486','2022-07-01 15:37:48.585836',0,'202207011537382',3,1,0.01,10.00,1,'',2,2),('2022-07-01 15:37:40.276310','2022-07-01 15:38:00.314898',0,'202207011537403',3,1,0.01,10.00,1,'',3,3),('2022-07-01 15:41:04.571601','2022-07-01 15:41:14.593062',0,'202207011541042',3,1,0.01,10.00,1,'',2,2),('2022-07-01 15:48:10.737185','2022-07-01 15:48:20.767302',0,'202207011548102',3,1,0.01,10.00,1,'',2,2),('2022-07-01 15:49:41.750539','2022-07-01 15:49:51.773732',0,'202207011549412',3,1,0.01,10.00,1,'',2,2),('2022-07-01 15:49:43.510296','2022-07-01 15:50:03.548925',0,'202207011549433',3,1,0.01,10.00,1,'',3,3);
/*!40000 ALTER TABLE `db_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_user`
--

DROP TABLE IF EXISTS `db_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_user`
--

LOCK TABLES `db_user` WRITE;
/*!40000 ALTER TABLE `db_user` DISABLE KEYS */;
INSERT INTO `db_user` VALUES (1,'pbkdf2_sha256$260000$sAcO9Z45wvBlk81c22hcAj$7rD1dAShwvRhdTnTc58pbXObhEGDSBqwi0IfOd2GAio=','2022-07-01 15:47:00.017447',1,'admin','','','508369826@qq.com',1,1,'2022-06-24 11:27:33.690940','2022-06-24 11:27:33.811990','2022-06-24 11:27:33.812001',0),(2,'pbkdf2_sha256$260000$mZOv1HWhDNAfM9FczEoDuj$Shb6FjILZJKYvYPjjRz653mVnyKBujuV9Tm1hVq7qXI=','2022-07-01 17:02:55.785956',0,'admin1','','','simple190503@163.com',0,1,'2022-06-24 21:35:54.967473','2022-06-24 21:35:55.104279','2022-06-24 21:35:55.108780',0),(3,'pbkdf2_sha256$260000$zJPPLt4NYNayJ2yGqoNhs1$Qd++xKzUqfKutita4Ypj2liqpoYbCJuW01RMHS6Dm3w=','2022-07-01 15:49:27.985417',0,'admin2','','','simple190503@163.com',0,1,'2022-06-28 19:27:25.628516','2022-06-28 19:27:25.764788','2022-06-28 19:27:25.767899',0),(4,'pbkdf2_sha256$260000$QK56oEZEbGNAOuLuga5VAJ$qrZIWkTe+jIPEuLNCVvq61PrVDy6TDP4z7dRHDBIu+8=',NULL,0,'admin3','','','simple190503@163.com',0,1,'2022-07-01 14:41:23.151856','2022-07-01 14:41:23.283449','2022-07-01 14:41:23.289370',0),(5,'pbkdf2_sha256$260000$CQ70PrLjj8pjutYTe5ec70$qX0Gudxa8WZR7NMsNb/8ncZyhB8CLx8275i0PldFyd8=',NULL,0,'admin4','','','simple190503@163.com',0,1,'2022-07-01 14:41:51.764700','2022-07-01 14:41:51.900318','2022-07-01 14:41:51.915894',0);
/*!40000 ALTER TABLE `db_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_user_groups`
--

DROP TABLE IF EXISTS `db_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_user_groups_user_id_group_id_4e607823_uniq` (`user_id`,`group_id`),
  KEY `db_user_groups_group_id_b432fca5_fk_auth_group_id` (`group_id`),
  CONSTRAINT `db_user_groups_group_id_b432fca5_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `db_user_groups_user_id_6ae08316_fk_db_user_id` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_user_groups`
--

LOCK TABLES `db_user_groups` WRITE;
/*!40000 ALTER TABLE `db_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_user_user_permissions`
--

DROP TABLE IF EXISTS `db_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_user_user_permissions_user_id_permission_id_ff552965_uniq` (`user_id`,`permission_id`),
  KEY `db_user_user_permiss_permission_id_f4793bd3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `db_user_user_permiss_permission_id_f4793bd3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `db_user_user_permissions_user_id_ca919cec_fk_db_user_id` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_user_user_permissions`
--

LOCK TABLES `db_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `db_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_db_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_db_user_id` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-06-24 11:35:34.101139','1','新鲜水果',1,'[{\"added\": {}}]',10,1),(2,'2022-06-24 11:36:08.157818','2','海鲜水产',1,'[{\"added\": {}}]',10,1),(3,'2022-06-24 11:36:27.586557','3','猪牛羊肉',1,'[{\"added\": {}}]',10,1),(4,'2022-06-24 11:36:51.153686','4','禽类蛋品',1,'[{\"added\": {}}]',10,1),(5,'2022-06-24 11:37:23.280856','5','新鲜蔬菜',1,'[{\"added\": {}}]',10,1),(6,'2022-06-24 11:38:02.694338','6','速冻食品',1,'[{\"added\": {}}]',10,1),(7,'2022-06-24 11:38:35.622478','1','IndexPromotionBanner object (1)',1,'[{\"added\": {}}]',11,1),(8,'2022-06-24 11:38:52.106604','2','IndexPromotionBanner object (2)',1,'[{\"added\": {}}]',11,1),(9,'2022-06-24 12:21:36.728236','1','Goods object (1)',1,'[{\"added\": {}}]',8,1),(10,'2022-06-24 12:21:58.369094','2','Goods object (2)',1,'[{\"added\": {}}]',8,1),(11,'2022-06-24 12:22:08.874994','3','Goods object (3)',1,'[{\"added\": {}}]',8,1),(12,'2022-06-24 12:22:17.706218','4','Goods object (4)',1,'[{\"added\": {}}]',8,1),(13,'2022-06-24 12:22:30.350454','5','Goods object (5)',1,'[{\"added\": {}}]',8,1),(14,'2022-06-24 12:22:39.516311','6','Goods object (6)',1,'[{\"added\": {}}]',8,1),(15,'2022-06-24 12:22:49.077150','7','Goods object (7)',1,'[{\"added\": {}}]',8,1),(16,'2022-06-24 12:22:59.547895','8','Goods object (8)',1,'[{\"added\": {}}]',8,1),(17,'2022-06-24 12:24:40.418832','9','Goods object (9)',1,'[{\"added\": {}}]',8,1),(18,'2022-06-24 12:26:11.728734','10','Goods object (10)',1,'[{\"added\": {}}]',8,1),(19,'2022-06-24 12:26:37.781874','10','Goods object (10)',3,'',8,1),(20,'2022-06-24 12:27:25.193318','11','Goods object (11)',1,'[{\"added\": {}}]',8,1),(21,'2022-06-24 12:27:38.832077','11','Goods object (11)',3,'',8,1),(22,'2022-06-24 12:30:04.773112','1','GoodsSKU object (1)',1,'[{\"added\": {}}]',9,1),(23,'2022-06-24 12:31:07.152777','2','GoodsSKU object (2)',1,'[{\"added\": {}}]',9,1),(24,'2022-06-24 12:31:50.735513','3','GoodsSKU object (3)',1,'[{\"added\": {}}]',9,1),(25,'2022-06-24 12:32:35.885908','4','GoodsSKU object (4)',1,'[{\"added\": {}}]',9,1),(26,'2022-06-24 12:33:06.843794','1','IndexGoodsBanner object (1)',1,'[{\"added\": {}}]',13,1),(27,'2022-06-24 12:33:21.462471','2','IndexGoodsBanner object (2)',1,'[{\"added\": {}}]',13,1),(28,'2022-06-24 12:33:35.176949','3','IndexGoodsBanner object (3)',1,'[{\"added\": {}}]',13,1),(29,'2022-06-24 12:33:47.530668','4','IndexGoodsBanner object (4)',1,'[{\"added\": {}}]',13,1),(30,'2022-06-24 13:05:58.594651','1','IndexTypeGoodsBanner object (1)',1,'[{\"added\": {}}]',12,1),(31,'2022-06-24 13:06:09.670853','2','IndexTypeGoodsBanner object (2)',1,'[{\"added\": {}}]',12,1),(32,'2022-06-24 13:06:21.720175','3','IndexTypeGoodsBanner object (3)',1,'[{\"added\": {}}]',12,1),(33,'2022-06-24 13:06:33.619445','4','IndexTypeGoodsBanner object (4)',1,'[{\"added\": {}}]',12,1),(34,'2022-06-24 13:59:46.975985','5','IndexTypeGoodsBanner object (5)',1,'[{\"added\": {}}]',12,1),(35,'2022-06-24 13:59:56.761480','6','IndexTypeGoodsBanner object (6)',1,'[{\"added\": {}}]',12,1),(36,'2022-06-24 14:00:09.439307','7','IndexTypeGoodsBanner object (7)',1,'[{\"added\": {}}]',12,1),(37,'2022-06-24 14:00:19.180129','8','IndexTypeGoodsBanner object (8)',1,'[{\"added\": {}}]',12,1),(38,'2022-06-24 14:00:36.257733','9','IndexTypeGoodsBanner object (9)',1,'[{\"added\": {}}]',12,1),(39,'2022-06-24 14:00:47.338760','10','IndexTypeGoodsBanner object (10)',1,'[{\"added\": {}}]',12,1),(40,'2022-06-24 14:01:07.077139','11','IndexTypeGoodsBanner object (11)',1,'[{\"added\": {}}]',12,1),(41,'2022-06-24 14:01:25.445246','12','IndexTypeGoodsBanner object (12)',1,'[{\"added\": {}}]',12,1),(42,'2022-06-24 14:01:34.694601','13','IndexTypeGoodsBanner object (13)',1,'[{\"added\": {}}]',12,1),(43,'2022-06-24 14:01:44.893704','14','IndexTypeGoodsBanner object (14)',1,'[{\"added\": {}}]',12,1),(44,'2022-06-24 14:01:55.181073','15','IndexTypeGoodsBanner object (15)',1,'[{\"added\": {}}]',12,1),(45,'2022-06-24 14:02:06.764855','16','IndexTypeGoodsBanner object (16)',1,'[{\"added\": {}}]',12,1),(46,'2022-06-24 14:02:25.925597','17','IndexTypeGoodsBanner object (17)',1,'[{\"added\": {}}]',12,1),(47,'2022-06-24 14:02:36.755132','18','IndexTypeGoodsBanner object (18)',1,'[{\"added\": {}}]',12,1),(48,'2022-06-24 14:02:47.683403','19','IndexTypeGoodsBanner object (19)',1,'[{\"added\": {}}]',12,1),(49,'2022-06-24 14:02:58.758791','20','IndexTypeGoodsBanner object (20)',1,'[{\"added\": {}}]',12,1),(50,'2022-06-24 14:03:07.283898','21','IndexTypeGoodsBanner object (21)',1,'[{\"added\": {}}]',12,1),(51,'2022-06-24 14:03:16.751708','22','IndexTypeGoodsBanner object (22)',1,'[{\"added\": {}}]',12,1),(52,'2022-06-24 14:03:26.268763','23','IndexTypeGoodsBanner object (23)',1,'[{\"added\": {}}]',12,1),(53,'2022-06-24 14:03:40.031376','24','IndexTypeGoodsBanner object (24)',1,'[{\"added\": {}}]',12,1),(54,'2022-06-24 14:03:54.704724','23','IndexTypeGoodsBanner object (23)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SKU\", \"\\u5c55\\u793a\\u987a\\u5e8f\"]}}]',12,1),(55,'2022-06-24 19:47:38.105016','1','IndexTypeGoodsBanner object (1)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(56,'2022-06-24 20:49:23.288258','2','IndexTypeGoodsBanner object (2)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(57,'2022-06-24 20:49:30.197246','3','IndexTypeGoodsBanner object (3)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(58,'2022-06-24 20:49:37.605055','4','IndexTypeGoodsBanner object (4)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(59,'2022-06-24 20:49:42.590270','24','IndexTypeGoodsBanner object (24)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(60,'2022-06-24 20:49:47.194124','23','IndexTypeGoodsBanner object (23)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(61,'2022-06-24 20:49:51.508216','22','IndexTypeGoodsBanner object (22)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(62,'2022-06-24 20:49:56.024797','21','IndexTypeGoodsBanner object (21)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(63,'2022-06-24 20:50:00.269401','20','IndexTypeGoodsBanner object (20)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(64,'2022-06-24 20:50:05.408498','20','IndexTypeGoodsBanner object (20)',2,'[]',12,1),(65,'2022-06-24 20:50:10.194531','19','IndexTypeGoodsBanner object (19)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(66,'2022-06-24 20:50:43.526123','18','IndexTypeGoodsBanner object (18)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(67,'2022-06-24 20:50:47.993311','17','IndexTypeGoodsBanner object (17)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(68,'2022-06-24 20:50:52.278386','16','IndexTypeGoodsBanner object (16)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(69,'2022-06-24 20:50:57.523845','15','IndexTypeGoodsBanner object (15)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(70,'2022-06-24 20:51:02.147544','14','IndexTypeGoodsBanner object (14)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(71,'2022-06-24 20:51:06.472442','12','IndexTypeGoodsBanner object (12)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(72,'2022-06-24 20:51:10.951488','11','IndexTypeGoodsBanner object (11)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(73,'2022-06-24 20:51:15.448299','11','IndexTypeGoodsBanner object (11)',2,'[]',12,1),(74,'2022-06-24 20:51:20.282652','10','IndexTypeGoodsBanner object (10)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(75,'2022-06-24 20:51:25.673575','9','IndexTypeGoodsBanner object (9)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(76,'2022-06-24 20:51:33.021952','8','IndexTypeGoodsBanner object (8)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(77,'2022-06-24 20:51:39.315989','9','IndexTypeGoodsBanner object (9)',2,'[]',12,1),(78,'2022-06-24 20:51:44.527431','6','IndexTypeGoodsBanner object (6)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(79,'2022-06-24 20:51:50.221671','5','IndexTypeGoodsBanner object (5)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(80,'2022-06-24 20:51:54.644186','4','IndexTypeGoodsBanner object (4)',2,'[]',12,1),(81,'2022-06-24 20:51:59.450923','3','IndexTypeGoodsBanner object (3)',2,'[]',12,1),(82,'2022-06-24 20:52:03.163144','2','IndexTypeGoodsBanner object (2)',2,'[]',12,1),(83,'2022-06-24 20:52:06.805617','1','IndexTypeGoodsBanner object (1)',2,'[]',12,1),(84,'2022-06-24 23:39:20.618652','1','GoodsSKU object (1)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u7b80\\u4ecb\"]}}]',9,1),(85,'2022-06-24 23:39:27.838553','1','GoodsSKU object (1)',2,'[]',9,1),(86,'2022-06-24 23:39:34.431854','2','GoodsSKU object (2)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u7b80\\u4ecb\"]}}]',9,1),(87,'2022-06-24 23:39:40.376292','4','GoodsSKU object (4)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u7b80\\u4ecb\"]}}]',9,1),(88,'2022-06-25 00:47:40.880829','5','GoodsSKU object (5)',1,'[{\"added\": {}}]',9,1),(89,'2022-06-25 00:48:23.443104','6','GoodsSKU object (6)',1,'[{\"added\": {}}]',9,1),(90,'2022-06-25 00:49:04.530419','7','GoodsSKU object (7)',1,'[{\"added\": {}}]',9,1),(91,'2022-06-25 00:49:41.570722','8','GoodsSKU object (8)',1,'[{\"added\": {}}]',9,1),(92,'2022-06-25 00:50:08.486070','5','IndexTypeGoodsBanner object (5)',2,'[]',12,1),(93,'2022-06-25 00:56:40.119821','5','IndexTypeGoodsBanner object (5)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SKU\"]}}]',12,1),(94,'2022-06-25 00:56:48.846212','6','IndexTypeGoodsBanner object (6)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SKU\"]}}]',12,1),(95,'2022-06-25 00:56:55.945882','7','IndexTypeGoodsBanner object (7)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SKU\"]}}]',12,1),(96,'2022-06-25 00:57:03.054972','8','IndexTypeGoodsBanner object (8)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SKU\"]}}]',12,1),(97,'2022-06-25 01:04:23.329296','9','Goods object (9)',3,'',8,1),(98,'2022-06-25 01:05:15.603907','10','Goods object (10)',1,'[{\"added\": {}}]',8,1),(99,'2022-06-25 01:08:16.431430','10','Goods object (10)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1SPU\\u540d\\u79f0\"]}}]',8,1),(100,'2022-06-25 01:08:35.425741','11','Goods object (11)',1,'[{\"added\": {}}]',8,1),(101,'2022-06-25 01:08:45.144595','12','Goods object (12)',1,'[{\"added\": {}}]',8,1),(102,'2022-06-25 01:08:54.666210','13','Goods object (13)',1,'[{\"added\": {}}]',8,1),(103,'2022-06-25 01:09:47.544456','9','GoodsSKU object (9)',1,'[{\"added\": {}}]',9,1),(104,'2022-06-25 01:10:31.042451','9','GoodsSKU object (9)',2,'[]',9,1),(105,'2022-06-25 01:11:08.616554','10','GoodsSKU object (10)',1,'[{\"added\": {}}]',9,1),(106,'2022-06-25 01:11:37.675620','11','GoodsSKU object (11)',1,'[{\"added\": {}}]',9,1),(107,'2022-06-25 01:12:15.722041','12','GoodsSKU object (12)',1,'[{\"added\": {}}]',9,1),(108,'2022-06-25 10:53:15.454521','9','GoodsSKU object (9)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u56fe\\u7247\"]}}]',9,1),(109,'2022-06-25 10:54:15.969099','10','GoodsSKU object (10)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u56fe\\u7247\"]}}]',9,1),(110,'2022-06-25 10:54:26.290794','11','GoodsSKU object (11)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u56fe\\u7247\"]}}]',9,1),(111,'2022-06-25 10:54:39.542240','12','GoodsSKU object (12)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u56fe\\u7247\"]}}]',9,1),(112,'2022-06-25 10:55:56.845806','7','IndexTypeGoodsBanner object (7)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(113,'2022-06-25 10:56:42.527442','13','IndexTypeGoodsBanner object (13)',2,'[{\"changed\": {\"fields\": [\"\\u5c55\\u793a\\u7c7b\\u578b\"]}}]',12,1),(114,'2022-06-28 18:21:59.387261','1','Goods object (1)',2,'[]',8,1),(115,'2022-06-28 18:23:45.862240','13','IndexTypeGoodsBanner object (13)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u7c7b\\u578b\"]}}]',12,1),(116,'2022-06-28 19:40:33.453175','8','GoodsSKU object (8)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u4ef7\\u683c\"]}}]',9,1),(117,'2022-06-28 19:40:35.910357','8','IndexTypeGoodsBanner object (8)',2,'[]',12,1),(118,'2022-07-01 15:40:06.087417','1','GoodsSKU object (1)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u5e93\\u5b58\"]}}]',9,1),(119,'2022-07-01 15:47:17.169345','1','GoodsSKU object (1)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u5e93\\u5b58\"]}}]',9,1),(120,'2022-07-01 15:48:52.390785','1','GoodsSKU object (1)',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u5e93\\u5b58\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'goods','goods'),(14,'goods','goodsimage'),(9,'goods','goodssku'),(10,'goods','goodstype'),(13,'goods','indexgoodsbanner'),(11,'goods','indexpromotionbanner'),(12,'goods','indextypegoodsbanner'),(15,'order','ordergoods'),(16,'order','orderinfo'),(5,'sessions','session'),(7,'user','address'),(6,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-06-23 18:03:15.014499'),(2,'contenttypes','0002_remove_content_type_name','2022-06-23 18:03:15.109053'),(3,'auth','0001_initial','2022-06-23 18:03:15.421702'),(4,'auth','0002_alter_permission_name_max_length','2022-06-23 18:03:15.497009'),(5,'auth','0003_alter_user_email_max_length','2022-06-23 18:03:15.518429'),(6,'auth','0004_alter_user_username_opts','2022-06-23 18:03:15.531633'),(7,'auth','0005_alter_user_last_login_null','2022-06-23 18:03:15.540161'),(8,'auth','0006_require_contenttypes_0002','2022-06-23 18:03:15.543704'),(9,'auth','0007_alter_validators_add_error_messages','2022-06-23 18:03:15.550900'),(10,'auth','0008_alter_user_username_max_length','2022-06-23 18:03:15.558393'),(11,'auth','0009_alter_user_last_name_max_length','2022-06-23 18:03:15.565979'),(12,'auth','0010_alter_group_name_max_length','2022-06-23 18:03:15.609630'),(13,'auth','0011_update_proxy_permissions','2022-06-23 18:03:15.616043'),(14,'auth','0012_alter_user_first_name_max_length','2022-06-23 18:03:15.625886'),(15,'user','0001_initial','2022-06-23 18:03:16.080574'),(16,'admin','0001_initial','2022-06-23 18:03:16.253038'),(17,'admin','0002_logentry_remove_auto_add','2022-06-23 18:03:16.286731'),(18,'admin','0003_logentry_add_action_flag_choices','2022-06-23 18:03:16.300802'),(19,'goods','0001_initial','2022-06-23 18:03:16.897506'),(20,'order','0001_initial','2022-06-23 18:03:16.986417'),(21,'order','0002_initial','2022-06-23 18:03:17.284946'),(22,'sessions','0001_initial','2022-06-23 18:03:17.339056');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-02 12:21:59
