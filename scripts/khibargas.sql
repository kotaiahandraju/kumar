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
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cylindermaster` */

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
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fillingstationmaster` */

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
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lpomaster` */

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
  `servicedue` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `capacityoftruck` varchar(255) DEFAULT NULL,
  `lponumber` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `trucksmaster` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;




/*------------------------------------

24-nov */


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `khaibar_users` */

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