/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.28 : Database - parking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`parking` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `parking`;

/*Table structure for table `card` */

DROP TABLE IF EXISTS `card`;

CREATE TABLE `card` (
  `card_id` varchar(50) NOT NULL,
  `seat_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_gender` varchar(1) NOT NULL,
  `user_addr` varchar(50) NOT NULL,
  `car_num` varchar(50) NOT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `card` */

insert  into `card`(`card_id`,`seat_id`,`user_name`,`user_gender`,`user_addr`,`car_num`) values ('20150521190631','20150521182303','李小龙','男','香语区A栋3-105','川A12345'),('20150521192828','20150521182304','黎明','男','香语区A栋3-106','川A12346'),('20150521192854','20150521182305','王林','女','香语区A栋3-107','川A12348'),('20150521192915','20150521182306','龙飞','男','香语区A栋3-108','川A12349'),('20150521193056','20150521182307','汪苏泷','男','香语区A栋3-109','川A12350');

/*Table structure for table `fixed` */

DROP TABLE IF EXISTS `fixed`;

CREATE TABLE `fixed` (
  `fixed_id` varchar(50) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  `out_date` date DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  PRIMARY KEY (`fixed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fixed` */

insert  into `fixed`(`fixed_id`,`card_id`,`entry_date`,`entry_time`,`out_date`,`out_time`) values ('20150522104145','20150521192915','2015-05-22','10:41:45','2015-09-25','10:23:34'),('20150925102400','20150521192828','2015-09-25','10:24:00','2015-09-25','10:24:07'),('20150925104659','20150521192854','2015-09-25','10:46:59','2015-09-25','17:29:04'),('20150925180626','20150521190631','2015-09-25','18:06:26','2015-12-01','19:04:56');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` varchar(50) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`) values ('r001','超级管理员'),('r002','普通管理员');

/*Table structure for table `seat` */

DROP TABLE IF EXISTS `seat`;

CREATE TABLE `seat` (
  `seat_id` varchar(50) NOT NULL,
  `seat_num` varchar(50) NOT NULL,
  `seat_section` varchar(50) NOT NULL,
  `seat_state` int(11) NOT NULL,
  `seat_tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seat` */

insert  into `seat`(`seat_id`,`seat_num`,`seat_section`,`seat_state`,`seat_tag`) values ('20150521182303','A1001','A区',1,'固定车主车位'),('20150521182304','A1002','A区',1,'固定车主车位'),('20150521182305','A1003','A区',1,'固定车主车位'),('20150521182306','A1004','A区',1,'固定车主车位'),('20150521182307','A1005','A区',1,'固定车主车位'),('20150521182308','A1006','A区',0,'固定车主车位'),('20150521182309','A1007','A区',0,'固定车主车位'),('20150521182310','A1008','A区',0,'固定车主车位'),('20150521182311','VIP1001','B区',0,'固定车主车位'),('20150521182312','VIP1002','B区',0,'固定车主车位'),('20150521182313','VIP1003','B区',0,'固定车主车位'),('20150521182314','VIP1004','B区',0,'固定车主车位'),('20150521182315','VIP1005','B区',0,'固定车主车位'),('20150521182316','VIP1007','B区',0,'固定车主车位'),('20150521182317','VIP1009','B区',0,'固定车主车位'),('20150521182318','VIP10010','B区',0,'固定车主车位'),('20150521182319','VIP10012','B区',0,'固定车主车位');

/*Table structure for table `temp` */

DROP TABLE IF EXISTS `temp`;

CREATE TABLE `temp` (
  `temp_id` varchar(50) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `car_num` varchar(50) NOT NULL,
  `entry_date` date NOT NULL,
  `entry_time` time NOT NULL,
  `out_date` date DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `temp_money` float DEFAULT NULL,
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `temp` */

insert  into `temp`(`temp_id`,`card_id`,`car_num`,`entry_date`,`entry_time`,`out_date`,`out_time`,`temp_money`) values ('20150925173007','川B23333','川B23333','2015-09-25','17:30:07','2015-11-28','21:29:26',20),('20150925203021','川B23333','川B23333','2015-09-25','20:30:21','2015-11-28','21:29:26',15),('20151201190239','川B11111','川B11111','2015-12-01','19:02:39','2015-12-01','19:04:24',3),('20151201190418','川F22222','川F22222','2015-12-01','19:04:18','2015-12-01','19:04:28',3);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `real_name` varchar(50) NOT NULL,
  `user_pwd` varchar(20) NOT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`role_id`,`user_name`,`real_name`,`user_pwd`,`user_phone`) values ('admin_01','r002','Lulu','鲁露','123123','13900000002'),('admin_02','r002','Ilin','依琳','123123','13900000003'),('SAdmin','r001','Jimi','吉米','123123','13900000001');

/*Table structure for table `v_card` */

DROP TABLE IF EXISTS `v_card`;

/*!50001 DROP VIEW IF EXISTS `v_card` */;
/*!50001 DROP TABLE IF EXISTS `v_card` */;

/*!50001 CREATE TABLE  `v_card`(
 `card_id` varchar(50) ,
 `seat_id` varchar(50) ,
 `user_name` varchar(50) ,
 `user_gender` varchar(1) ,
 `user_addr` varchar(50) ,
 `car_num` varchar(50) ,
 `seat_num` varchar(50) 
)*/;

/*Table structure for table `v_fixed` */

DROP TABLE IF EXISTS `v_fixed`;

/*!50001 DROP VIEW IF EXISTS `v_fixed` */;
/*!50001 DROP TABLE IF EXISTS `v_fixed` */;

/*!50001 CREATE TABLE  `v_fixed`(
 `fixed_id` varchar(50) ,
 `card_id` varchar(50) ,
 `entry_date` date ,
 `entry_time` time ,
 `out_date` date ,
 `out_time` time ,
 `car_num` varchar(50) ,
 `user_name` varchar(50) 
)*/;

/*Table structure for table `v_user` */

DROP TABLE IF EXISTS `v_user`;

/*!50001 DROP VIEW IF EXISTS `v_user` */;
/*!50001 DROP TABLE IF EXISTS `v_user` */;

/*!50001 CREATE TABLE  `v_user`(
 `user_id` varchar(50) ,
 `role_id` varchar(50) ,
 `user_name` varchar(50) ,
 `real_name` varchar(50) ,
 `user_pwd` varchar(20) ,
 `user_phone` varchar(50) ,
 `role_name` varchar(50) 
)*/;

/*View structure for view v_card */

/*!50001 DROP TABLE IF EXISTS `v_card` */;
/*!50001 DROP VIEW IF EXISTS `v_card` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_card` AS (select `card`.`card_id` AS `card_id`,`card`.`seat_id` AS `seat_id`,`card`.`user_name` AS `user_name`,`card`.`user_gender` AS `user_gender`,`card`.`user_addr` AS `user_addr`,`card`.`car_num` AS `car_num`,`seat`.`seat_num` AS `seat_num` from (`card` join `seat` on((`card`.`seat_id` = `seat`.`seat_id`)))) */;

/*View structure for view v_fixed */

/*!50001 DROP TABLE IF EXISTS `v_fixed` */;
/*!50001 DROP VIEW IF EXISTS `v_fixed` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_fixed` AS (select `fixed`.`fixed_id` AS `fixed_id`,`fixed`.`card_id` AS `card_id`,`fixed`.`entry_date` AS `entry_date`,`fixed`.`entry_time` AS `entry_time`,`fixed`.`out_date` AS `out_date`,`fixed`.`out_time` AS `out_time`,`card`.`car_num` AS `car_num`,`card`.`user_name` AS `user_name` from (`fixed` join `card` on((`fixed`.`card_id` = `card`.`card_id`)))) */;

/*View structure for view v_user */

/*!50001 DROP TABLE IF EXISTS `v_user` */;
/*!50001 DROP VIEW IF EXISTS `v_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user` AS (select `user`.`user_id` AS `user_id`,`user`.`role_id` AS `role_id`,`user`.`user_name` AS `user_name`,`user`.`real_name` AS `real_name`,`user`.`user_pwd` AS `user_pwd`,`user`.`user_phone` AS `user_phone`,`role`.`role_name` AS `role_name` from (`user` join `role` on((`user`.`role_id` = `role`.`role_id`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
