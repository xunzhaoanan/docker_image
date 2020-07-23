# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.29)
# Database: dzq
# Generation Time: 2020-07-23 08:21:11 +0000
# ************************************************************

CREATE DATABASE `dzq`;
USE `dzq`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table dzqattachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqattachments`;

CREATE TABLE `dzqattachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件 id',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `type_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '类型数据ID(post_id,dialog_message_id…)',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件排序',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型(0帖子附件，1帖子图片，2帖子视频，3帖子音频，4消息图片)',
  `is_remote` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  `is_approved` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否合法',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件系统生成的名称',
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件原名称',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqcategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqcategories`;

CREATE TABLE `dzqcategories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类 id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类描述',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类图标',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `property` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性：0 正常 1 首页展示',
  `thread_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzqcategories` WRITE;
/*!40000 ALTER TABLE `dzqcategories` DISABLE KEYS */;

INSERT INTO `dzqcategories` (`id`, `name`, `description`, `icon`, `sort`, `property`, `thread_count`, `ip`, `created_at`, `updated_at`)
VALUES
	(1,'默认分类','默认分类','',0,0,0,'127.0.0.1','2020-07-23 16:14:58','2020-07-23 16:14:58');

/*!40000 ALTER TABLE `dzqcategories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzqdeny_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqdeny_users`;

CREATE TABLE `dzqdeny_users` (
  `user_id` bigint(20) unsigned NOT NULL,
  `deny_user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqdialog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqdialog`;

CREATE TABLE `dzqdialog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `dialog_message_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '最新消息ID',
  `sender_user_id` bigint(20) unsigned NOT NULL COMMENT '发送人UID',
  `recipient_user_id` bigint(20) unsigned NOT NULL COMMENT '收信人UID',
  `recipient_read_at` datetime DEFAULT NULL COMMENT '收信人阅读时间',
  `sender_read_at` datetime DEFAULT NULL COMMENT '发送人阅读时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `sender_user_id` (`sender_user_id`),
  KEY `recipient_user_id` (`recipient_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqdialog_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqdialog_message`;

CREATE TABLE `dzqdialog_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `dialog_id` bigint(20) unsigned NOT NULL COMMENT '会话ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `attachment_id` bigint(20) unsigned NOT NULL COMMENT '附件ID',
  `message_text` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqemoji
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqemoji`;

CREATE TABLE `dzqemoji` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表情 id',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表情分类',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表情地址',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表情符号',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzqemoji` WRITE;
/*!40000 ALTER TABLE `dzqemoji` DISABLE KEYS */;

INSERT INTO `dzqemoji` (`id`, `category`, `url`, `code`, `order`, `created_at`, `updated_at`)
VALUES
	(1,'qq','emoji/qq/kelian.gif',':kelian:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(2,'qq','emoji/qq/haqian.gif',':haqian:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(3,'qq','emoji/qq/woshou.gif',':woshou:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(4,'qq','emoji/qq/aixin.gif',':aixin:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(5,'qq','emoji/qq/zuohengheng.gif',':zuohengheng:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(6,'qq','emoji/qq/weixiao.gif',':weixiao:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(7,'qq','emoji/qq/jingkong.gif',':jingkong:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(8,'qq','emoji/qq/tiaopi.gif',':tiaopi:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(9,'qq','emoji/qq/touxiao.gif',':touxiao:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(10,'qq','emoji/qq/youling.gif',':youling:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(11,'qq','emoji/qq/caidao.gif',':caidao:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(12,'qq','emoji/qq/cahan.gif',':cahan:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(13,'qq','emoji/qq/hecai.gif',':hecai:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(14,'qq','emoji/qq/keai.gif',':keai:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(15,'qq','emoji/qq/ciya.gif',':ciya:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(16,'qq','emoji/qq/saorao.gif',':saorao:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(17,'qq','emoji/qq/jingxi.gif',':jingxi:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(18,'qq','emoji/qq/ku.gif',':ku:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(19,'qq','emoji/qq/piezui.gif',':piezui:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(20,'qq','emoji/qq/se.gif',':se:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(21,'qq','emoji/qq/xia.gif',':xia:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(22,'qq','emoji/qq/yinxian.gif',':yinxian:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(23,'qq','emoji/qq/zhouma.gif',':zhouma:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(24,'qq','emoji/qq/kulou.gif',':kulou:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(25,'qq','emoji/qq/xu.gif',':xu:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(26,'qq','emoji/qq/jingya.gif',':jingya:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(27,'qq','emoji/qq/doge.gif',':doge:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(28,'qq','emoji/qq/bizui.gif',':bizui:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(29,'qq','emoji/qq/yangtuo.gif',':yangtuo:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(30,'qq','emoji/qq/shouqiang.gif',':shouqiang:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(31,'qq','emoji/qq/baoquan.gif',':baoquan:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(32,'qq','emoji/qq/yun.gif',':yun:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(33,'qq','emoji/qq/lanqiu.gif',':lanqiu:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(34,'qq','emoji/qq/zhemo.gif',':zhemo:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(35,'qq','emoji/qq/guzhang.gif',':guzhang:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(36,'qq','emoji/qq/shengli.gif',':shengli:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(37,'qq','emoji/qq/zaijian.gif',':zaijian:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(38,'qq','emoji/qq/dabing.gif',':dabing:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(39,'qq','emoji/qq/deyi.gif',':deyi:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(40,'qq','emoji/qq/hanxiao.gif',':hanxiao:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(41,'qq','emoji/qq/kun.gif',':kun:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(42,'qq','emoji/qq/hexie.gif',':hexie:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(43,'qq','emoji/qq/daku.gif',':daku:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(44,'qq','emoji/qq/wozuimei.gif',':wozuimei:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(45,'qq','emoji/qq/xiaoku.gif',':xiaoku:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(46,'qq','emoji/qq/xigua.gif',':xigua:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(47,'qq','emoji/qq/huaixiao.gif',':huaixiao:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(48,'qq','emoji/qq/liulei.gif',':liulei:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(49,'qq','emoji/qq/lenghan.gif',':lenghan:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(50,'qq','emoji/qq/qiudale.gif',':qiudale:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(51,'qq','emoji/qq/zhayanjian.gif',':zhayanjian:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(52,'qq','emoji/qq/qiaoda.gif',':qiaoda:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(53,'qq','emoji/qq/baojin.gif',':baojin:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(54,'qq','emoji/qq/OK.gif',':OK:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(55,'qq','emoji/qq/xiaojiujie.gif',':xiaojiujie:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(56,'qq','emoji/qq/gouyin.gif',':gouyin:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(57,'qq','emoji/qq/youhengheng.gif',':youhengheng:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(58,'qq','emoji/qq/tuosai.gif',':tuosai:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(59,'qq','emoji/qq/nanguo.gif',':nanguo:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(60,'qq','emoji/qq/quantou.gif',':quantou:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(61,'qq','emoji/qq/haixiu.gif',':haixiu:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(62,'qq','emoji/qq/koubi.gif',':koubi:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(63,'qq','emoji/qq/qiang.gif',':qiang:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(64,'qq','emoji/qq/pijiu.gif',':pijiu:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(65,'qq','emoji/qq/bishi.gif',':bishi:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(66,'qq','emoji/qq/yiwen.gif',':yiwen:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(67,'qq','emoji/qq/liuhan.gif',':liuhan:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(68,'qq','emoji/qq/wunai.gif',':wunai:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(69,'qq','emoji/qq/aini.gif',':aini:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(70,'qq','emoji/qq/bangbangtang.gif',':bangbangtang:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(71,'qq','emoji/qq/penxue.gif',':penxue:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(72,'qq','emoji/qq/haobang.gif',':haobang:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(73,'qq','emoji/qq/qinqin.gif',':qinqin:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(74,'qq','emoji/qq/xiaoyanger.gif',':xiaoyanger:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(75,'qq','emoji/qq/fendou.gif',':fendou:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(76,'qq','emoji/qq/ganga.gif',':ganga:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(77,'qq','emoji/qq/shuai.gif',':shuai:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(78,'qq','emoji/qq/juhua.gif',':juhua:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(79,'qq','emoji/qq/baiyan.gif',':baiyan:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(80,'qq','emoji/qq/fanu.gif',':fanu:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(81,'qq','emoji/qq/jie.gif',':jie:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(82,'qq','emoji/qq/chi.gif',':chi:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(83,'qq','emoji/qq/kuaikule.gif',':kuaikule:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(84,'qq','emoji/qq/zhuakuang.gif',':zhuakuang:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(85,'qq','emoji/qq/shui.gif',':shui:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(86,'qq','emoji/qq/dan.gif',':dan:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(87,'qq','emoji/qq/aoman.gif',':aoman:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(88,'qq','emoji/qq/fadai.gif',':fadai:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(89,'qq','emoji/qq/leiben.gif',':leiben:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(90,'qq','emoji/qq/tu.gif',':tu:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(91,'qq','emoji/qq/weiqu.gif',':weiqu:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58'),
	(92,'qq','emoji/qq/xieyanxiao.gif',':xieyanxiao:',0,'2020-07-23 16:14:58','2020-07-23 16:14:58');

/*!40000 ALTER TABLE `dzqemoji` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzqfinance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqfinance`;

CREATE TABLE `dzqfinance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `income` decimal(10,2) unsigned NOT NULL COMMENT '用户充值金额',
  `withdrawal` decimal(10,2) unsigned NOT NULL COMMENT '用户提现金额',
  `order_count` int(10) unsigned NOT NULL COMMENT '订单数量',
  `order_amount` decimal(10,2) unsigned NOT NULL COMMENT '订单金额',
  `total_profit` decimal(10,2) unsigned NOT NULL COMMENT '平台盈利',
  `register_profit` decimal(10,2) unsigned NOT NULL COMMENT '注册收入',
  `master_portion` decimal(10,2) unsigned NOT NULL COMMENT '打赏贴的分成',
  `withdrawal_profit` decimal(10,2) unsigned NOT NULL COMMENT '提现手续费收入',
  `created_at` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqgroup_paid_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqgroup_paid_users`;

CREATE TABLE `dzqgroup_paid_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '所属用户',
  `group_id` bigint(20) unsigned NOT NULL COMMENT '用户组 id',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单 id',
  `operator_id` bigint(20) unsigned DEFAULT NULL COMMENT '操作人',
  `delete_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除类型：1到期删除，2管理员修改，3用户复购',
  `expiration_time` datetime NOT NULL COMMENT '用户组到期时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqgroup_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqgroup_permission`;

CREATE TABLE `dzqgroup_permission` (
  `group_id` bigint(20) unsigned NOT NULL COMMENT '用户组 id',
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzqgroup_permission` WRITE;
/*!40000 ALTER TABLE `dzqgroup_permission` DISABLE KEYS */;

INSERT INTO `dzqgroup_permission` (`group_id`, `permission`)
VALUES
	(6,'order.create'),
	(6,'trade.pay.order'),
	(7,'category1.viewThreads'),
	(7,'thread.viewPosts'),
	(7,'user.view'),
	(7,'viewThreads'),
	(7,'viewUserList'),
	(10,'attachment.create.0'),
	(10,'attachment.create.1'),
	(10,'cash.create'),
	(10,'category1.createThread'),
	(10,'category1.replyThread'),
	(10,'category1.viewThreads'),
	(10,'createThread'),
	(10,'createThreadLong'),
	(10,'dialog.create'),
	(10,'order.create'),
	(10,'thread.favorite'),
	(10,'thread.likePosts'),
	(10,'thread.reply'),
	(10,'thread.viewPosts'),
	(10,'trade.pay.order'),
	(10,'user.view'),
	(10,'userFollow.create'),
	(10,'viewThreads'),
	(10,'viewUserList');

/*!40000 ALTER TABLE `dzqgroup_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzqgroup_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqgroup_user`;

CREATE TABLE `dzqgroup_user` (
  `group_id` bigint(20) unsigned NOT NULL COMMENT '用户组 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `expiration_time` datetime DEFAULT NULL COMMENT '用户组到期时间',
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `dzqgroup_user_user_id_foreign` (`user_id`),
  CONSTRAINT `dzqgroup_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `dzqgroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dzqgroup_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dzqusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzqgroup_user` WRITE;
/*!40000 ALTER TABLE `dzqgroup_user` DISABLE KEYS */;

INSERT INTO `dzqgroup_user` (`group_id`, `user_id`, `expiration_time`)
VALUES
	(1,1,NULL);

/*!40000 ALTER TABLE `dzqgroup_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzqgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqgroups`;

CREATE TABLE `dzqgroups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组 id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户组名称',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '颜色',
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'icon',
  `default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示在用户名后',
  `is_paid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否收费：0不收费，1收费',
  `fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '收费金额',
  `days` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '付费获得天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzqgroups` WRITE;
/*!40000 ALTER TABLE `dzqgroups` DISABLE KEYS */;

INSERT INTO `dzqgroups` (`id`, `name`, `type`, `color`, `icon`, `default`, `is_display`, `is_paid`, `fee`, `days`)
VALUES
	(1,'管理员','','','',0,0,0,0.00,0),
	(6,'待付费','','','',0,0,0,0.00,0),
	(7,'游客','','','',0,0,0,0.00,0),
	(10,'普通会员','','','',1,0,0,0.00,0);

/*!40000 ALTER TABLE `dzqgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzqinvites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqinvites`;

CREATE TABLE `dzqinvites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '邀请 id',
  `group_id` bigint(20) unsigned NOT NULL COMMENT '默认用户组 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型:1普通用户2管理员',
  `code` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邀请码',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请码生效时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请码结束时间',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '邀请用户 id',
  `to_user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被邀请用户 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '邀请码状态:0失效1未使用2已使用3已过期',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqmigrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqmigrations`;

CREATE TABLE `dzqmigrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzqmigrations` WRITE;
/*!40000 ALTER TABLE `dzqmigrations` DISABLE KEYS */;

INSERT INTO `dzqmigrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2020_01_01_000001_create_users',1),
	(2,'2020_01_01_000002_create_groups',1),
	(3,'2020_01_01_000003_create_group_permission',1),
	(4,'2020_01_01_000004_create_group_user',1),
	(5,'2020_01_01_000005_create_categories',1),
	(6,'2020_01_01_000006_create_threads',1),
	(7,'2020_01_01_000007_create_posts',1),
	(8,'2020_01_01_000008_create_thread_user',1),
	(9,'2020_01_01_000009_create_post_user',1),
	(10,'2020_01_01_000010_create_post_mod',1),
	(11,'2020_01_01_000011_create_attachments',1),
	(12,'2020_01_01_000012_create_stop_words',1),
	(13,'2020_01_01_000013_create_operation_log',1),
	(14,'2020_01_01_000014_create_orders',1),
	(15,'2020_01_01_000015_create_pay_notify',1),
	(16,'2020_01_01_000016_create_user_wechats',1),
	(17,'2020_01_01_000017_create_user_wallets',1),
	(18,'2020_01_01_000018_create_user_wallet_cash',1),
	(19,'2020_01_01_000019_create_user_wallet_logs',1),
	(20,'2020_01_01_000020_create_user_login_fail_log',1),
	(21,'2020_01_01_000021_create_emoji',1),
	(22,'2020_01_01_000022_create_invites',1),
	(23,'2020_01_01_000023_create_mobile_codes',1),
	(24,'2020_01_01_000024_create_notifications',1),
	(25,'2020_01_01_000025_create_settings',1),
	(26,'2020_01_01_000026_create_user_follow',1),
	(27,'2020_01_01_000027_create_finance',1),
	(28,'2020_01_01_000028_create_dialog',1),
	(29,'2020_01_01_000029_create_dialog_message',1),
	(30,'2020_01_01_000030_create_notification_tpls',1),
	(31,'2020_01_01_000031_create_session_tokens',1),
	(32,'2020_01_01_000032_create_thread_video',1),
	(33,'2020_03_20_104938_add_order_to_attachments',1),
	(34,'2020_03_24_183227_create_user_wallet_fail_logs',1),
	(35,'2020_03_28_012029_alter_users',1),
	(36,'2020_04_14_101710_add_is_anonymous_to_orders',1),
	(37,'2020_04_14_104730_update_users_table',1),
	(38,'2020_04_14_174156_add_liked_count_to_users',1),
	(39,'2020_04_16_134237_create_post_mentions_user',1),
	(40,'2020_04_16_162908_add_free_words_to_threads',1),
	(41,'2020_04_17_152036_add_paid_count_to_threads',1),
	(42,'2020_04_20_185606_add_read_at_to_dialog',1),
	(43,'2020_04_23_143614_add_is_display_to_groups',1),
	(44,'2020_04_23_154946_create_topics',1),
	(45,'2020_04_23_155120_create_thread_topic',1),
	(46,'2020_04_26_111725_create_reports',1),
	(47,'2020_04_26_142056_create_deny_users',1),
	(48,'2020_04_30_150256_rename_operation_log_to_user_action_logs',1),
	(49,'2020_04_30_153136_create_operation_logs',1),
	(50,'2020_05_07_174510_add_location_to_posts',1),
	(51,'2020_05_08_172741_create_post_goods',1),
	(52,'2020_05_11_164733_create_group_paid_users',1),
	(53,'2020_05_11_164907_alter_add_expiration_time_to_groups',1),
	(54,'2020_05_11_165014_alter_add_groups_paid_mod',1),
	(55,'2020_05_11_165120_alter_add_group_id_to_orders',1),
	(56,'2020_05_11_175730_change_thread_video_columns',1),
	(57,'2020_05_21_191500_alter_user_wechats',1),
	(58,'2020_06_01_114859_alter_type_to_attachments',1),
	(59,'2020_06_01_172353_alter_attachment_to_dialog_message',1),
	(60,'2020_06_03_170416_alter_add_port_to_users',1),
	(61,'2020_06_03_170507_alter_add_port_to_posts',1),
	(62,'2020_06_08_155901_create_user_qq',1),
	(63,'2020_06_08_155901_create_user_qy_wechats',1),
	(64,'2020_06_10_105230_alter_add_foreign_key_to_user_follow',1),
	(65,'2020_06_10_115509_alter_bigint_to_all',1),
	(66,'2020_06_10_190229_alter_foreign_key_to_user_wechats',1),
	(67,'2020_06_12_185624_create_wechat_offiaccount_replies',1),
	(68,'2020_06_16_161128_change_threads_free_words_column_length',1),
	(69,'2020_06_23_170151_change_wechat_offiaccount_replies_column',1),
	(70,'2020_07_01_143404_change_user_wchats_user_id_to_null',1),
	(71,'2020_07_03_171957_change_timestamps_to_datetime',1),
	(72,'2020_07_15_183427_add_posts_reply_post_id_index',1);

/*!40000 ALTER TABLE `dzqmigrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzqmobile_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqmobile_codes`;

CREATE TABLE `dzqmobile_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '验证码 id',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证类型',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '验证状态',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `expired_at` datetime DEFAULT NULL COMMENT '验证码过期时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqnotification_tpls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqnotification_tpls`;

CREATE TABLE `dzqnotification_tpls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '模板状态:1开启0关闭',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '通知类型:0系统1微信2短信',
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `vars` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '可选的变量',
  `template_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模板ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzqnotification_tpls` WRITE;
/*!40000 ALTER TABLE `dzqnotification_tpls` DISABLE KEYS */;

INSERT INTO `dzqnotification_tpls` (`id`, `status`, `type`, `type_name`, `title`, `content`, `vars`, `template_id`)
VALUES
	(1,1,0,'新用户注册并加入后','欢迎加入{sitename}','{username}你好，你已经成为{sitename} 的{groupname} ，请你在发表言论时，遵守当地法律法规。祝你在这里玩的愉快。','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{sitename}\";s:12:\"站点名称\";s:11:\"{groupname}\";s:9:\"用户组\";}',''),
	(2,1,0,'注册审核通过通知','注册审核通知','{username}你好，你的注册申请已审核通过。','a:1:{s:10:\"{username}\";s:9:\"用户名\";}',''),
	(3,1,0,'注册审核不通过通知','注册审核通知','{username}你好，你的注册申请审核不通过，原因：{reason}','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:8:\"{reason}\";s:6:\"原因\";}',''),
	(4,1,0,'内容审核不通过通知','内容审核通知','{username}你好，你发布的内容 \"{content}\" 审核不通过，原因：{reason}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";s:8:\"{reason}\";s:6:\"原因\";}',''),
	(5,1,0,'内容审核通过通知','内容审核通知','{username}你好，你发布的内容 \"{content}\" 审核通过','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";}',''),
	(6,1,0,'内容删除通知','内容通知','{username}你好，你发布的内容 \"{content} \" 已删除，原因：{reason}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";s:8:\"{reason}\";s:6:\"原因\";}',''),
	(7,1,0,'内容精华通知','内容通知','{username}你好，你发布的内容 \"{content}\" 已设为精华','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";}',''),
	(8,1,0,'内容置顶通知','内容通知','{username}你好，你发布的内容 \"{content}\" 已置顶','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";}',''),
	(9,1,0,'内容修改通知','内容通知','{username}你好，你发布的内容 \"{content}\" 已被修改','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";}',''),
	(10,1,0,'用户禁用通知','用户通知','{username}你好，你的帐号已禁用，原因：{reason}','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:8:\"{reason}\";s:6:\"原因\";}',''),
	(11,1,0,'用户解除禁用通知','用户通知','{username}你好，你的帐号已解除禁用','a:1:{s:10:\"{username}\";s:9:\"用户名\";}',''),
	(12,1,0,'用户角色调整通知','角色通知','{username}你好，你的角色由{oldgroupname}变更为{newgroupname}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:14:\"{oldgroupname}\";s:12:\"老用户组\";s:14:\"{newgroupname}\";s:12:\"新用户组\";}',''),
	(13,0,1,'新用户注册并加入后','微信注册通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u597d\\uff0c\\u6b22\\u8fce\\u52a0\\u5165{sitename}\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u8bf7\\u4f60\\u5728\\u53d1\\u8868\\u8a00\\u8bba\\u65f6\\uff0c\\u9075\\u5b88\\u5f53\\u5730\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u3002\\u795d\\u4f60\\u5728\\u8fd9\\u91cc\\u73a9\\u7684\\u6109\\u5feb\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{sitename}\";s:12:\"站点名称\";s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(14,0,1,'注册审核通过通知','微信注册审核通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u6ce8\\u518c\\u7533\\u8bf7\\u5df2\\u5ba1\\u6838\\u901a\\u8fc7\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u795d\\u4f60\\u5728\\u8fd9\\u91cc\\u73a9\\u7684\\u6109\\u5feb\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(15,0,1,'注册审核不通过通知','微信注册审核通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u6ce8\\u518c\\u7533\\u8bf7\\u5ba1\\u6838\\u4e0d\\u901a\\u8fc7\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u91cd\\u65b0\\u63d0\\u4ea4\\u7533\\u8bf7\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{reason}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:6:\"时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";s:8:\"{reason}\";s:6:\"原因\";}',''),
	(16,0,1,'内容审核通过通知','微信内容审核通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u5ba1\\u6838\\u901a\\u8fc7\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(17,0,1,'内容审核不通过通知','微信内容审核通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5ba1\\u6838\\u4e0d\\u901a\\u8fc7\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{reason}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";s:8:\"{reason}\";s:6:\"原因\";}',''),
	(18,0,1,'内容删除通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u5220\\u9664\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{reason}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";s:8:\"{reason}\";s:6:\"原因\";}',''),
	(19,0,1,'内容精华通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u8bbe\\u4e3a\\u7cbe\\u534e\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(20,0,1,'内容置顶通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u7f6e\\u9876\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(21,0,1,'内容修改通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u88ab\\u4fee\\u6539\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(22,0,1,'帐号禁用通知','微信用户通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u5e10\\u53f7\\u5df2\\u7981\\u7528\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{reason}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";s:8:\"{reason}\";s:6:\"原因\";}',''),
	(23,0,1,'用户解除禁用通知','微信用户通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u5e10\\u53f7\\u5df2\\u89e3\\u9664\\u7981\\u7528\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(24,0,1,'用户角色调整通知','微信角色通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u89d2\\u8272\\u5df2\\u53d8\\u66f4\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{oldgroupname}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{newgroupname}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:9:\"用户名\";s:14:\"{oldgroupname}\";s:9:\"原角色\";s:14:\"{newgroupname}\";s:9:\"新角色\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(25,1,0,'内容回复通知','内容通知','','',''),
	(26,1,0,'内容点赞通知','内容通知','','',''),
	(27,1,0,'内容支付通知','内容通知','','',''),
	(28,1,0,'内容@通知','内容通知','','',''),
	(29,0,1,'内容回复通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"{username}\\u56de\\u590d\\u4e86\\u4f60\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{subject}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:5:{s:10:\"{username}\";s:18:\"回复人用户名\";s:9:\"{content}\";s:12:\"回复内容\";s:9:\"{subject}\";s:12:\"原文内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(30,0,1,'内容点赞通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"{username}\\u70b9\\u8d5e\\u4e86\\u4f60\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:18:\"点赞人用户名\";s:9:\"{content}\";s:12:\"点赞内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(31,0,1,'内容支付通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"{username}\\u652f\\u4ed8\\u4e86\\u4f60{money}\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{ordertype}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:6:{s:10:\"{username}\";s:15:\"支付用户名\";s:7:\"{money}\";s:6:\"金额\";s:9:\"{content}\";s:6:\"内容\";s:11:\"{ordertype}\";s:12:\"支付类型\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(32,0,1,'内容@通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"{username}@\\u4e86\\u4f60\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:13:\"@人用户名\";s:9:\"{content}\";s:7:\"@内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(33,1,0,'提现通知','财务通知','','',''),
	(34,1,0,'提现失败通知','财务通知','','',''),
	(35,0,1,'提现通知','微信财务通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u8d77\\u7684\\u63d0\\u73b0\\u8bf7\\u6c42\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{money}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{withdrawalStatus}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:7:\"{money}\";s:6:\"金额\";s:10:\"{dateline}\";s:12:\"申请时间\";s:18:\"{withdrawalStatus}\";s:12:\"提现状态\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),
	(36,0,1,'提现失败通知','微信财务通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u8d77\\u7684\\u63d0\\u73b0\\u8bf7\\u6c42\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{money}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{withdrawalStatus}\",\"color\":\"#173177\"},\"keyword4\":{\"value\":\"{reason}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:5:{s:7:\"{money}\";s:6:\"金额\";s:10:\"{dateline}\";s:12:\"申请时间\";s:18:\"{withdrawalStatus}\";s:12:\"提现状态\";s:8:\"{reason}\";s:6:\"原因\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}','');

/*!40000 ALTER TABLE `dzqnotification_tpls` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzqnotifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqnotifications`;

CREATE TABLE `dzqnotifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '通知 id',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通知类型',
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通知内容',
  `read_at` datetime DEFAULT NULL COMMENT '通知阅读时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `dzqnotifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqoperation_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqoperation_logs`;

CREATE TABLE `dzqoperation_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url路径',
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'body请求数据',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '日志类型:0后台操作',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqorders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqorders`;

CREATE TABLE `dzqorders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单 id',
  `order_sn` char(22) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `payment_sn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付编号',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '订单总金额',
  `master_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '站长分成金额',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '付款人 id',
  `payee_id` bigint(20) unsigned NOT NULL COMMENT '收款人 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '交易类型：1注册、2打赏、3付费主题、4付费用户组',
  `group_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户组 id',
  `thread_id` bigint(20) unsigned DEFAULT NULL COMMENT '主题 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态：0待付款；1已付款；2.取消订单；3支付失败；4订单过期',
  `payment_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '付款方式：微信（10：pc扫码，11：h5支付，12：微信内支付',
  `is_anonymous` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否匿名(0否1是)',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `dzqorders_thread_id_index` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqpay_notify
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqpay_notify`;

CREATE TABLE `dzqpay_notify` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付通知 id',
  `payment_sn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付编号',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '付款人 id',
  `trade_no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商户平台交易号',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0未接受到通知，1收到通知',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqpost_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqpost_goods`;

CREATE TABLE `dzqpost_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '帖子 id',
  `platform_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '平台商品 id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品标题',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品封面图',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品来源:0淘宝 1天猫 2京东 等',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品状态:0正常 1失效/下架',
  `ready_content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '预解析内容',
  `detail_content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '解析详情页地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_post` (`post_id`),
  KEY `idx_platform` (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqpost_mentions_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqpost_mentions_user`;

CREATE TABLE `dzqpost_mentions_user` (
  `post_id` bigint(20) unsigned NOT NULL,
  `mentions_user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_user_id`),
  KEY `dzqpost_mentions_user_mentions_user_id_foreign` (`mentions_user_id`),
  CONSTRAINT `dzqpost_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `dzqusers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dzqpost_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `dzqposts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqpost_mod
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqpost_mod`;

CREATE TABLE `dzqpost_mod` (
  `post_id` bigint(20) unsigned NOT NULL COMMENT '帖子 id',
  `stop_word` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发的敏感词，半角逗号隔开',
  PRIMARY KEY (`post_id`),
  CONSTRAINT `dzqpost_mod_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `dzqposts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqpost_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqpost_user`;

CREATE TABLE `dzqpost_user` (
  `post_id` bigint(20) unsigned NOT NULL COMMENT '帖子 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `dzqpost_user_user_id_foreign` (`user_id`),
  CONSTRAINT `dzqpost_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `dzqposts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dzqpost_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dzqusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqposts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqposts`;

CREATE TABLE `dzqposts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '回复 id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '发表用户 id',
  `thread_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联主题 id',
  `reply_post_id` bigint(20) unsigned DEFAULT NULL COMMENT '回复 id',
  `reply_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '回复用户 id',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `port` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '端口',
  `reply_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联回复数',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `longitude` decimal(10,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `latitude` decimal(10,7) unsigned NOT NULL DEFAULT '0.0000000' COMMENT '纬度',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `deleted_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '删除用户 id',
  `is_first` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否首个回复',
  `is_comment` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是回复回帖的内容',
  `is_approved` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否合法',
  PRIMARY KEY (`id`),
  KEY `dzqposts_user_id_foreign` (`user_id`),
  KEY `dzqposts_deleted_user_id_foreign` (`deleted_user_id`),
  KEY `dzqposts_thread_id_index` (`thread_id`),
  KEY `dzqposts_reply_post_id_index` (`reply_post_id`),
  CONSTRAINT `dzqposts_deleted_user_id_foreign` FOREIGN KEY (`deleted_user_id`) REFERENCES `dzqusers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `dzqposts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dzqusers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqreports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqreports`;

CREATE TABLE `dzqreports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '举报 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `thread_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '回复 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '举报类型:0个人主页 1主题 2评论/回复',
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '举报理由',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '举报状态:0未处理 1已处理',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqsession_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqsession_tokens`;

CREATE TABLE `dzqsession_tokens` (
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'token',
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作用域',
  `payload` text COLLATE utf8mb4_unicode_ci COMMENT '负载',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `expired_at` datetime NOT NULL COMMENT '过期时间',
  UNIQUE KEY `dzqsession_tokens_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqsettings`;

CREATE TABLE `dzqsettings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设置项 key',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT '设置项 value',
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default' COMMENT '设置项 tag',
  PRIMARY KEY (`key`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzqsettings` WRITE;
/*!40000 ALTER TABLE `dzqsettings` DISABLE KEYS */;

INSERT INTO `dzqsettings` (`key`, `value`, `tag`)
VALUES
	('miniprogram_video','1','wx_miniprogram'),
	('qcloud_sms','0','qcloud'),
	('qcloud_vod','0','qcloud'),
	('register_close','1','default'),
	('register_validate','0','default'),
	('site_author','1','default'),
	('site_close','0','default'),
	('site_id','23c1eea6d95f4710a8bd75f8c5747f28','default'),
	('site_install','2020-07-23 16:14:58','default'),
	('site_mode','public','default'),
	('site_name','demo','default'),
	('site_secret','Kujwhvp0hpuzSmkPEgAhEsv2B79RdCqT','default'),
	('support_file_ext','doc,docx,pdf,zip','default'),
	('support_img_ext','png,gif,jpg,jpeg,bmp,heic','default'),
	('support_max_size','5','default'),
	('user_count','1','default');

/*!40000 ALTER TABLE `dzqsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzqstop_words
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqstop_words`;

CREATE TABLE `dzqstop_words` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '敏感词 id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建用户 id',
  `ugc` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户内容处理方式',
  `username` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名处理方式',
  `find` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '敏感词或查找方式',
  `replacement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '替换词或替换规则',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqthread_topic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqthread_topic`;

CREATE TABLE `dzqthread_topic` (
  `thread_id` bigint(20) unsigned NOT NULL COMMENT '主题ID',
  `topic_id` bigint(20) unsigned NOT NULL COMMENT '话题ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`thread_id`,`topic_id`),
  KEY `dzqthread_topic_topic_id_foreign` (`topic_id`),
  CONSTRAINT `dzqthread_topic_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `dzqthreads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dzqthread_topic_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `dzqtopics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqthread_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqthread_user`;

CREATE TABLE `dzqthread_user` (
  `thread_id` bigint(20) unsigned NOT NULL COMMENT '主题 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`thread_id`,`user_id`),
  KEY `dzqthread_user_user_id_foreign` (`user_id`),
  CONSTRAINT `dzqthread_user_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `dzqthreads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dzqthread_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dzqusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqthread_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqthread_video`;

CREATE TABLE `dzqthread_video` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '音视频 id',
  `thread_id` bigint(20) unsigned NOT NULL COMMENT '主题 id',
  `post_id` bigint(20) unsigned NOT NULL COMMENT '帖子 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0 视频 1 音频',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '音视频状态：0 转码中 1 转码完成 2 转码失败',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '转码失败原因',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '媒体文件唯一标识',
  `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '视频高',
  `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '视频宽',
  `media_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '媒体播放地址',
  `cover_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '媒体封面地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `dzqthread_video_thread_id_index` (`thread_id`),
  KEY `dzqthread_video_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqthreads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqthreads`;

CREATE TABLE `dzqthreads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主题 id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建用户 id',
  `last_posted_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '最后回复用户 id',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT '分类 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0普通 1长文 2视频 3图片',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `free_words` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付费主题可免费阅读字数',
  `post_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `rewarded_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '打赏数',
  `paid_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付费数',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `deleted_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '删除用户 id',
  `is_approved` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否合法',
  `is_sticky` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `is_essence` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否加精',
  PRIMARY KEY (`id`),
  KEY `dzqthreads_user_id_foreign` (`user_id`),
  KEY `dzqthreads_last_posted_user_id_foreign` (`last_posted_user_id`),
  KEY `dzqthreads_deleted_user_id_foreign` (`deleted_user_id`),
  CONSTRAINT `dzqthreads_deleted_user_id_foreign` FOREIGN KEY (`deleted_user_id`) REFERENCES `dzqusers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `dzqthreads_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `dzqusers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `dzqthreads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dzqusers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqtopics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqtopics`;

CREATE TABLE `dzqtopics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '话题ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'user_id',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '话题名称',
  `thread_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzquser_action_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_action_logs`;

CREATE TABLE `dzquser_action_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '操作用户 id',
  `action` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `log_able_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型 id',
  `log_able_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模型',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzquser_follow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_follow`;

CREATE TABLE `dzquser_follow` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `from_user_id` bigint(20) unsigned NOT NULL COMMENT '关注人',
  `to_user_id` bigint(20) unsigned NOT NULL COMMENT '被关注人',
  `is_mutual` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否互相关注：0否 1是',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `dzquser_follow_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `dzqusers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dzquser_follow_to_user_id_foreign` FOREIGN KEY (`to_user_id`) REFERENCES `dzqusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzquser_login_fail_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_login_fail_log`;

CREATE TABLE `dzquser_login_fail_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志 id',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `count` tinyint(4) NOT NULL DEFAULT '1' COMMENT '错误次数',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `dzquser_login_fail_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzquser_qq
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_qq`;

CREATE TABLE `dzquser_qq` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'qq昵称',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别',
  `province` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzquser_qy_wechats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_qy_wechats`;

CREATE TABLE `dzquser_qy_wechats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `qy_userid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '企业微信企业用户id, corpid_userid联合全局唯一',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '企业微信昵称',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电话',
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '地址',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzquser_wallet_cash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_wallet_cash`;

CREATE TABLE `dzquser_wallet_cash` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '提现 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '提现用户 id',
  `cash_sn` bigint(20) unsigned NOT NULL COMMENT '提现交易编号',
  `cash_charge` decimal(10,2) unsigned NOT NULL COMMENT '提现手续费',
  `cash_actual_amount` decimal(10,2) unsigned NOT NULL COMMENT '实际提现金额',
  `cash_apply_amount` decimal(10,2) unsigned NOT NULL COMMENT '提现申请金额',
  `cash_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '提现状态：1：待审核，2：审核通过，3：审核不通过，4：待打款， 5，已打款， 6：打款失败',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注或原因',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `trade_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易号',
  `error_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误代码',
  `error_message` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易失败描叙',
  `refunds_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '返款状态，0未返款，1已返款',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzquser_wallet_fail_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_wallet_fail_logs`;

CREATE TABLE `dzquser_wallet_fail_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志 id',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `dzquser_wallet_fail_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzquser_wallet_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_wallet_logs`;

CREATE TABLE `dzquser_wallet_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '钱包明细 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '明细所属用户 id',
  `change_available_amount` decimal(10,2) NOT NULL COMMENT '变动可用金额',
  `change_freeze_amount` decimal(10,2) NOT NULL COMMENT '变动冻结金额',
  `change_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '10：提现冻结，11：提现成功，12：撤销提现解冻； 31：打赏收入，32：人工收入； 50：人工支出',
  `change_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变动描述',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联订单记录ID',
  `user_wallet_cash_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联提现记录ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzquser_wallets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_wallets`;

CREATE TABLE `dzquser_wallets` (
  `user_id` bigint(20) unsigned NOT NULL COMMENT '钱包所属人 id',
  `available_amount` decimal(10,2) unsigned NOT NULL COMMENT '可用金额',
  `freeze_amount` decimal(10,2) unsigned NOT NULL COMMENT '冻结金额',
  `wallet_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钱包状态:0正常，1冻结提现',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzquser_wallets` WRITE;
/*!40000 ALTER TABLE `dzquser_wallets` DISABLE KEYS */;

INSERT INTO `dzquser_wallets` (`user_id`, `available_amount`, `freeze_amount`, `wallet_status`, `created_at`, `updated_at`)
VALUES
	(1,0.00,0.00,0,'2020-07-23 16:14:58','2020-07-23 16:14:58');

/*!40000 ALTER TABLE `dzquser_wallets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzquser_wechats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzquser_wechats`;

CREATE TABLE `dzquser_wechats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户 id',
  `mp_openid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '公众号openid',
  `dev_openid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '开放平台openid',
  `min_openid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序openid',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信昵称',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别',
  `province` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '国家',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `privilege` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户特权信息',
  `unionid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `dzquser_wechats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dzqusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table dzqusers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqusers`;

CREATE TABLE `dzqusers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户 id',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `pay_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付密码',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '签名',
  `last_login_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登录 ip 地址',
  `last_login_port` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录端口',
  `register_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册ip',
  `register_port` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册端口',
  `register_reason` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册原因',
  `username_bout` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户名修改次数',
  `thread_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `follow_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注数',
  `fans_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `liked_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态：0正常 1禁用 2审核中 3审核拒绝 4审核忽略',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `identity` char(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '身份证号码',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `avatar_at` datetime DEFAULT NULL COMMENT '头像修改时间',
  `login_at` datetime DEFAULT NULL COMMENT '最后登录时间',
  `joined_at` datetime DEFAULT NULL COMMENT '付费加入时间',
  `expired_at` datetime DEFAULT NULL COMMENT '付费到期时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dzqusers_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dzqusers` WRITE;
/*!40000 ALTER TABLE `dzqusers` DISABLE KEYS */;

INSERT INTO `dzqusers` (`id`, `username`, `password`, `pay_password`, `mobile`, `signature`, `last_login_ip`, `last_login_port`, `register_ip`, `register_port`, `register_reason`, `username_bout`, `thread_count`, `follow_count`, `fans_count`, `liked_count`, `status`, `avatar`, `identity`, `realname`, `avatar_at`, `login_at`, `joined_at`, `expired_at`, `created_at`, `updated_at`)
VALUES
	(1,'admin','$2y$10$JFxa6LXnNEai6jlSvAF9WO1iMu.tdHsjEPVbZgvmwlGDpLnaAiuJa','','','','127.0.0.1',65327,'127.0.0.1',65272,'',0,0,0,0,0,0,'','','',NULL,'2020-07-23 16:15:25',NULL,NULL,'2020-07-23 16:14:58','2020-07-23 16:15:33');

/*!40000 ALTER TABLE `dzqusers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dzqwechat_offiaccount_replies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dzqwechat_offiaccount_replies`;

CREATE TABLE `dzqwechat_offiaccount_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `match_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '匹配类型:0全匹配1半匹配',
  `reply_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '消息回复类型',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '回复文本内容',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '素材ID',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '素材类型:1图片2视频3语音4图文',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '数据类型:0被关注回复1消息回复2关键词回复',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否开启:0关闭1开启',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
