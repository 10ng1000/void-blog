start transaction;
CREATE DATABASE blog CHARACTER SET utf8;
use blog;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
                         `id` mediumint(9) NOT NULL AUTO_INCREMENT,
                         `username` varchar(30) NOT NULL,
                         `password` char(32) NOT NULL,
                         `link` varchar(100) DEFAULT NULL,
                         `email` varchar(20) DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=1206227 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`,`link`,`email`) values (10080,'雨云天下','111111',NULL,NULL);

/*Table structure for table `admin_login_log` */

DROP TABLE IF EXISTS `admin_login_log`;

CREATE TABLE `admin_login_log` (
                                   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
                                   `admin_id` int(11) NOT NULL COMMENT '管理员ID',
                                   `date` timestamp NULL DEFAULT NULL COMMENT '登陆日期',
                                   `ip` varchar(30) DEFAULT NULL COMMENT '登陆IP',
                                   PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `admin_login_log` */

insert  into `admin_login_log`(`id`,`admin_id`,`date`,`ip`) values (25,10080,'2018-02-27 11:39:48','0:0:0:0:0:0:0:1'),(26,10080,'2018-02-27 13:34:29','0:0:0:0:0:0:0:1'),(27,10080,'2018-02-27 14:41:30','0:0:0:0:0:0:0:1'),(28,10080,'2018-02-27 15:18:22','0:0:0:0:0:0:0:1'),(29,10080,'2018-02-27 15:18:46','0:0:0:0:0:0:0:1'),(30,10080,'2018-02-27 15:28:14','0:0:0:0:0:0:0:1'),(31,10080,'2018-02-27 15:32:13','0:0:0:0:0:0:0:1'),(32,10080,'2018-02-27 15:51:58','0:0:0:0:0:0:0:1'),(33,10080,'2018-02-27 16:11:26','0:0:0:0:0:0:0:1'),(34,10080,'2018-02-27 16:21:32','0:0:0:0:0:0:0:1'),(35,10080,'2018-02-27 16:28:39','0:0:0:0:0:0:0:1'),(36,10080,'2018-02-27 16:43:33','0:0:0:0:0:0:0:1'),(37,10080,'2018-02-27 17:14:37','0:0:0:0:0:0:0:1'),(38,10080,'2018-02-27 17:40:24','0:0:0:0:0:0:0:1'),(39,10080,'2018-02-27 17:56:18','0:0:0:0:0:0:0:1'),(40,10080,'2018-03-13 17:37:35','0:0:0:0:0:0:0:1'),(41,10080,'2023-06-25 14:21:23','127.0.0.1'),(42,10080,'2023-06-25 14:21:23','127.0.0.1'),(43,10080,'2023-06-25 14:21:23','0:0:0:0:0:0:0:1'),(44,10080,'2023-06-25 14:27:45','127.0.0.1'),(45,10080,'2023-06-25 14:28:55','127.0.0.1'),(46,10080,'2023-06-25 14:45:45','127.0.0.1'),(47,10080,'2023-06-25 15:04:33','127.0.0.1'),(48,10080,'2023-06-25 15:12:02','127.0.0.1'),(49,10080,'2023-06-25 15:26:03','127.0.0.1'),(50,10080,'2023-06-25 15:37:01','127.0.0.1');

/*Table structure for table `article` */

/*Data for the table `article` */

/*Table structure for table `catalog` */

DROP TABLE IF EXISTS `catalog`;

CREATE TABLE `catalog` (
                           `id` mediumint(9) NOT NULL AUTO_INCREMENT,
                           `name` varchar(30) NOT NULL UNIQUE COMMENT '栏目名称',
                           PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `catalog` */

insert into catalog (id, name) values (5, '测试类别');

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
                           `id` mediumint(9) NOT NULL AUTO_INCREMENT,
                           `title` varchar(50) NOT NULL COMMENT '标题',
                           `keywords` varchar(150) NOT NULL COMMENT '关键字',
                           `desci` varchar(500) NOT NULL COMMENT '描述',
                           `pic` varchar(500) DEFAULT NULL COMMENT '图片地址',
                           `content` text NOT NULL COMMENT '内容',
                           `click` mediumint(9) NOT NULL DEFAULT '0' COMMENT '点击量',
                           `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发表日期',
                           `catalog_id` mediumint(9) NULL,
                           PRIMARY KEY (`id`),
                           Foreign KEY (catalog_id) references catalog(id)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

insert  into `article`(`title`,`keywords`,`desci`,`pic`,`content`,`click`,`time`,`catalog_id`) values
    ('http的请求与响应','http','指请求消息头的中请求消息数据的格式\r\n\r\n有三种用法。',
     NULL,
     '内容',
     0,'2023-06-25 14:48:15',5);


/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
                           `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
                           `article_id` bigint(20) NOT NULL COMMENT '文章id',
                           `content` text NOT NULL COMMENT '评论内容',
                           `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论日期',
                           `name` varchar(10) DEFAULT NULL COMMENT '留言者昵称',
                           `email` varchar(30) DEFAULT NULL COMMENT '留言者邮箱',
                           `parent_id` bigint(20) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `comment` */

insert  into `comment`(`id`,`article_id`,`content`,`date`,`name`,`email`,`parent_id`) values (1,93,'写的不错。','2017-09-16 16:10:48','追梦人',NULL,NULL),(9,91,'留言测试','2018-02-27 11:27:00','雨云天下','1651561615@qq.com',NULL),(11,104,'测试','2018-03-13 17:54:00','skiiy','wdadadwa@qq.com',NULL),(12,104,'1','2023-06-25 15:57:35','123','123@qq.com',11);

DROP VIEW IF EXISTS article_catalog;

CREATE VIEW article_catalog AS
SELECT a.id, a.title, a.keywords, a.desci, a.pic, a.content, a.click, a.time, a.catalog_id, c.name
FROM article as a left join catalog as c
                            on a.catalog_id = c.id;
commit;