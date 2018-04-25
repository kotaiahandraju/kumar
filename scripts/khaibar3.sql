/*
SQLyog Community Edition- MySQL GUI v8.02 
MySQL - 5.5.27 : Database - khaibar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`khaibar` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `khaibar`;

/*Table structure for table `accessoriesmaster` */

DROP TABLE IF EXISTS `accessoriesmaster`;

CREATE TABLE `accessoriesmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `typeofaccessory` varchar(255) DEFAULT NULL,
  `suppliername` varchar(255) DEFAULT NULL,
  `madein` varchar(255) DEFAULT NULL,
  `lponumber` varchar(255) DEFAULT NULL,
  `accessoriesstatus` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accessoriesmaster` */

/*Table structure for table `companymaster` */

DROP TABLE IF EXISTS `companymaster`;

CREATE TABLE `companymaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `companycode` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `contactpersonname` varchar(255) DEFAULT NULL,
  `contactpersonmobile` varchar(255) DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `typeofcompany` varchar(255) DEFAULT NULL,
  `customertype` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `companymaster` */

/*Table structure for table `customermaster` */

DROP TABLE IF EXISTS `customermaster`;

CREATE TABLE `customermaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customerid` varchar(255) DEFAULT NULL,
  `customername` varchar(255) DEFAULT NULL,
  `customeraddress` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `landline` varchar(255) DEFAULT NULL,
  `authorizedperson` varchar(255) DEFAULT NULL,
  `contactperson` varchar(255) DEFAULT NULL,
  `customertype` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customermaster` */

/*Table structure for table `cylindermaster` */

DROP TABLE IF EXISTS `cylindermaster`;

CREATE TABLE `cylindermaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cylinderid` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  `cylinderstatus` varchar(255) DEFAULT NULL,
  `customerid` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `lponumber` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `madein` varchar(255) DEFAULT NULL,
  `expirydate` timestamp NULL DEFAULT NULL,
  `ownercompany` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cylindermaster` */

insert  into `cylindermaster`(`id`,`created_time`,`updated_time`,`cylinderid`,`size`,`capacity`,`cylinderstatus`,`customerid`,`location`,`lponumber`,`color`,`madein`,`expirydate`,`ownercompany`,`remarks`,`status`) values (1,'2017-11-29 17:45:26','2017-11-30 15:22:10','Cylinder1','1','11','2',NULL,'vij','345678','red','india','2017-11-30 00:00:00','charvikent','','1'),(2,'2017-11-29 20:06:43','2017-11-30 15:22:10','Cylinder2','1','11','2',NULL,'Gunutur','CYL2','Red','India','2017-12-29 00:00:00','Khaibar','Qwerty','1'),(3,'2017-11-30 16:19:53','2017-11-30 16:19:53','sdsdfs','3','44','1',NULL,'sdsdf','456465','sdfsdfs','sdfsdf','2017-11-27 00:00:00','sdfsd','sdfsdf','1');

/*Table structure for table `cylinderstatus` */

DROP TABLE IF EXISTS `cylinderstatus`;

CREATE TABLE `cylinderstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `cylinderstatus` */

insert  into `cylinderstatus`(`id`,`name`,`status`) values (1,'Empty','1'),(2,'FillingStation','1'),(3,'QualityCheck','1'),(4,'Truck','1'),(5,'DeliveryBoy','1');

/*Table structure for table `cylindertransaction` */

DROP TABLE IF EXISTS `cylindertransaction`;

CREATE TABLE `cylindertransaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cylindetId` varchar(255) DEFAULT NULL,
  `cylinderStatus` varchar(255) DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  `fillingStation` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `cylindertransaction` */

insert  into `cylindertransaction`(`id`,`created_time`,`updated_time`,`cylindetId`,`cylinderStatus`,`customerId`,`fillingStation`,`createdBy`) values (1,'2017-11-30 15:18:44','2017-11-30 15:18:44','Cylinder1','2',NULL,'1',NULL),(2,'2017-11-30 15:18:44','2017-11-30 15:18:44','Cylinder2','2',NULL,'1',NULL),(3,'2017-11-30 15:19:01','2017-11-30 15:19:01','Cylinder1','2',NULL,'1',NULL),(4,'2017-11-30 15:19:01','2017-11-30 15:19:01','Cylinder2','2',NULL,'1',NULL),(5,'2017-11-30 15:20:53','2017-11-30 15:20:53','Cylinder1','2',NULL,'1',NULL),(6,'2017-11-30 15:21:06','2017-11-30 15:21:06','Cylinder2','2',NULL,'1',NULL),(7,'2017-11-30 15:22:10','2017-11-30 15:22:10','Cylinder1','2',NULL,'1',NULL),(8,'2017-11-30 15:22:10','2017-11-30 15:22:10','Cylinder2','2',NULL,'1',NULL);

/*Table structure for table `cylindertypes` */

DROP TABLE IF EXISTS `cylindertypes`;

CREATE TABLE `cylindertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cylindertypes` */

insert  into `cylindertypes`(`id`,`created_time`,`updated_time`,`name`,`capacity`,`amount`) values (1,'2017-11-27 15:07:06','2017-12-01 12:31:05','Snmall - 11KG','11',NULL),(2,'2017-11-27 15:07:06','2017-12-01 12:31:13','Medium - 22KG','22',NULL),(3,'2017-11-27 15:07:06','2017-12-01 12:31:23','Large - 44KG','44',NULL);

/*Table structure for table `fillingstationmaster` */

DROP TABLE IF EXISTS `fillingstationmaster`;

CREATE TABLE `fillingstationmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gasavailability` varchar(255) DEFAULT NULL,
  `numberoffillingmachines` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `gascapacity` varchar(255) DEFAULT NULL,
  `availablegas` varchar(255) DEFAULT NULL,
  `unitpoint` varchar(255) DEFAULT NULL,
  `stationname` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `fillingstationmaster` */

insert  into `fillingstationmaster`(`id`,`created_time`,`updated_time`,`gasavailability`,`numberoffillingmachines`,`quantity`,`gascapacity`,`availablegas`,`unitpoint`,`stationname`,`status`) values (1,'2017-11-30 15:04:05','2017-11-30 15:04:05','456456','456','456465','456465','4654','4560','dgd','1');

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `items` */

insert  into `items`(`id`,`name`,`description`) values (1,'cylinder',NULL),(2,'truck',NULL);

/*Table structure for table `khaibar_users` */

DROP TABLE IF EXISTS `khaibar_users`;

CREATE TABLE `khaibar_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `khaibar_users` */

insert  into `khaibar_users`(`id`,`created_time`,`updated_time`,`userName`,`password`,`roleId`,`status`) values (1,NULL,'2017-11-24 17:18:09','admin','admin','1','1');

/*Table structure for table `lpomaster` */

DROP TABLE IF EXISTS `lpomaster`;

CREATE TABLE `lpomaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lponumber` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `suppliername` varchar(255) DEFAULT NULL,
  `supplieraddress` varchar(255) DEFAULT NULL,
  `suppliercontactno` varchar(255) DEFAULT NULL,
  `supplieremail` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `expiryDate` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `lpomaster` */

insert  into `lpomaster`(`id`,`created_time`,`updated_time`,`lponumber`,`item`,`remarks`,`suppliername`,`supplieraddress`,`suppliercontactno`,`supplieremail`,`amount`,`expiryDate`,`status`) values (1,'2017-11-30 15:47:58','2017-11-30 15:47:58','456465','6546544','6546545','4564','6456456','6456','564654','65465',NULL,'1'),(2,'2017-12-01 11:59:35','2017-12-01 11:59:35','l1wewe','1','sdsd','sdsd','sdsd','sdsd','sdsd','444','2017-12-02 00:00:00','1');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

/*Table structure for table `staffmaster` */

DROP TABLE IF EXISTS `staffmaster`;

CREATE TABLE `staffmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staffcode` varchar(255) DEFAULT NULL,
  `staffno` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `customertype` varchar(255) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `staffmaster` */

/*Table structure for table `storesmaster` */

DROP TABLE IF EXISTS `storesmaster`;

CREATE TABLE `storesmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `storeid` varchar(255) DEFAULT NULL,
  `storename` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `storesmaster` */

/*Table structure for table `tariffmaster` */

DROP TABLE IF EXISTS `tariffmaster`;

CREATE TABLE `tariffmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `assetcode` varchar(255) DEFAULT NULL,
  `assetdescription` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `alloweddiscount` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tariffmaster` */

/*Table structure for table `trucksmaster` */

DROP TABLE IF EXISTS `trucksmaster`;

CREATE TABLE `trucksmaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trucknumber` varchar(255) DEFAULT NULL,
  `registrationexpirydate` timestamp NULL DEFAULT NULL,
  `civildefensecardexpirydate` timestamp NULL DEFAULT NULL,
  `typeOfService` varchar(255) DEFAULT NULL,
  `servicedue` timestamp NULL DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `capacityoftruck` varchar(255) DEFAULT NULL,
  `lponumber` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `trucksmaster` */

insert  into `trucksmaster`(`id`,`created_time`,`updated_time`,`trucknumber`,`registrationexpirydate`,`civildefensecardexpirydate`,`typeOfService`,`servicedue`,`make`,`description`,`capacityoftruck`,`lponumber`,`status`) values (1,'2017-11-29 17:46:18','2017-11-30 17:09:43','789067','2026-11-20 00:00:00','2026-11-19 00:00:00','Agency Repairs','2026-11-19 00:00:00','india','Description','500','56789vc','1'),(2,'2017-11-30 17:08:10','2017-11-30 17:08:10','tryrtyrty','2017-11-06 00:00:00','2017-11-17 00:00:00','Maintenance','2017-11-17 00:00:00','sfdfsdf','sdfs','45645','dfsdfs','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
