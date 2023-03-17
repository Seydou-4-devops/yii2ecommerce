/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.5.5-10.4.24-MariaDB : Database - advanced
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`advanced` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `advanced`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `cat_icon` varchar(100) NOT NULL,
  `status` smallint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `meta_keyword` varchar(200) NOT NULL,
  `meta_description` longtext NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cat_id`,`cat_name`,`parent_id`,`cat_icon`,`status`,`created_at`,`updated_at`,`meta_keyword`,`meta_description`) values (1,'SPORT',0,'HH',1,'2023-03-16 09:23:19','2023-03-16 09:23:19','HHJ22','The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham'),(2,'HOMMES',0,'FDSGDGQ',1,'2023-03-16 09:01:36','2023-03-16 09:01:36','GJHGKG','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(3,'FEMMES',0,'ADddff',1,'2023-03-16 09:01:47','2023-03-16 09:01:47','fdhgjghkhjlkjrtsese','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(4,'ENFANTS',0,'dhjghgkhjlkjm',1,'2023-03-16 09:21:38','2023-03-16 09:21:38','dhuytfikuloimpo','The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham');

/*Table structure for table `color` */

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `color` */

/*Table structure for table `deliver` */

DROP TABLE IF EXISTS `deliver`;

CREATE TABLE `deliver` (
  `deli_id` int(11) NOT NULL AUTO_INCREMENT,
  `deli_name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`deli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `deliver` */

/*Table structure for table `made` */

DROP TABLE IF EXISTS `made`;

CREATE TABLE `made` (
  `made_id` int(11) NOT NULL AUTO_INCREMENT,
  `made_name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`made_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `made` */

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values ('m000000_000000_base',1678727815),('m130524_201442_init',1678727819),('m190124_110200_add_verification_token_column_to_user_table',1678727820);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` int(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `user_ship` varchar(100) NOT NULL,
  `email_ship` varchar(100) NOT NULL,
  `mobile_ship` varchar(100) NOT NULL,
  `address_ship` varchar(100) NOT NULL,
  `request` varchar(500) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `deliver_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `pro_id` int(10) NOT NULL,
  `pro_price` int(20) NOT NULL,
  `pro_amount` int(100) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payment` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(100) NOT NULL,
  `prod_image` varchar(200) NOT NULL,
  `prod_price` int(20) NOT NULL,
  `prod_sale_off` varchar(100) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `supplier_id` int(10) NOT NULL,
  `pro_size` varchar(10) NOT NULL,
  `pro_color` varchar(10) NOT NULL,
  `pro_made_id` int(10) NOT NULL,
  `description` longtext NOT NULL,
  `status` int(1) NOT NULL,
  `begin_date_sale_off` datetime NOT NULL,
  `end_date_sale_off` datetime NOT NULL,
  `meta_keyword` varchar(100) NOT NULL,
  `meta_description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`prod_id`,`prod_name`,`prod_image`,`prod_price`,`prod_sale_off`,`cat_id`,`supplier_id`,`pro_size`,`pro_color`,`pro_made_id`,`description`,`status`,`begin_date_sale_off`,`end_date_sale_off`,`meta_keyword`,`meta_description`,`created_at`,`updated_at`) values (1,'Easy Polo Balck Edition','http://localhost/advanced/frontend/web/images/home/product1.jpg',3000,'0',2,1,'2','2',1,'Easy Polo Balck Edition',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Easy Polo Balck Edition','Easy Polo Balck Edition','2023-03-16 12:53:49','2023-03-16 12:53:49'),(2,'Easy Polo Balck Edition 3','http://localhost/advanced/frontend/web/images/home/product2.jpg',2100,'0',3,1,'4','5',2,'Easy Polo Balck Edition 3',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Easy Polo Balck Edition 3','Easy Polo Balck Edition 3','2023-03-16 12:55:48','2023-03-16 12:55:48'),(3,'Easy Polo Balck Edition  2','http://localhost/advanced/frontend/web/images/home/product3.jpg',3012,'0',1,2,'2','4',2,'Easy Polo Balck Edition  2',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Easy Polo Balck Edition  2','Easy Polo Balck Edition  2','2023-03-16 12:56:15','2023-03-16 12:56:15'),(4,'Easy Polo Balck Edition  4','http://localhost/advanced/frontend/web/images/home/product4.jpg',4100,'0',1,1,'5','4',2,'Easy Polo Balck Edition  4',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Easy Polo Balck Edition  4','Easy Polo Balck Edition  4','2023-03-16 12:56:38','2023-03-16 12:56:38'),(5,'Easy Polo Balck Edition  5','http://localhost/advanced/frontend/web/images/home/product5.jpg',501,'0',1,2,'3','3',1,'Easy Polo Balck Edition  5',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Easy Polo Balck Edition  5','Easy Polo Balck Edition  5','2023-03-16 12:56:56','2023-03-16 12:56:56'),(6,'Easy Polo Balck Edition  1','http://localhost/advanced/frontend/web/images/home/product6.jpg',3012,'0',2,1,'4','2',1,'Easy Polo Balck Edition  1',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Easy Polo Balck Edition  1','Easy Polo Balck Edition  1','2023-03-16 12:57:18','2023-03-16 12:57:18');

/*Table structure for table `size` */

DROP TABLE IF EXISTS `size`;

CREATE TABLE `size` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `size` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(100) NOT NULL,
  `mobile` int(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`created_at`,`updated_at`,`verification_token`) values (1,'admin','FqewJ-mkNWWnN39RIV8TMLSxOXGzxUqc','$2y$13$kaVCjEJ8jYjAoOVoaaWT2ugQyzWatl4wK7OTlM9ANIVBjM9lbPTU2',NULL,'admin@admin.com',10,1678727876,1678727876,'Bm789ugTH-NTS3KaYLqVIQfX01vLvXdO_1678727876');

/*Table structure for table `wishlist` */

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `wis_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`wis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wishlist` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
