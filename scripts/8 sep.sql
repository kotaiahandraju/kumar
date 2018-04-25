/*
SQLyog Community Edition- MySQL GUI v8.02 
MySQL - 5.5.27 : Database - hrms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`hrms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hrms`;

/*Table structure for table `leaves` */

DROP TABLE IF EXISTS `leaves`;

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `leaveType` int(11) DEFAULT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `accept` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `leaves` */

insert  into `leaves`(`id`,`created_time`,`updated_time`,`fromDate`,`toDate`,`leaveType`,`employeeId`,`accept`,`email`,`reason`) values (1,'2017-09-07 00:00:00','2017-09-07 14:37:02','2017-09-11','2017-09-18',0,2,0,NULL,NULL),(2,'2017-09-07 00:00:00','2017-09-07 14:36:29','2017-09-19','2017-09-20',3,3,0,NULL,NULL),(4,'2017-09-07 00:00:00','2017-09-07 14:37:20','2017-09-19','2017-09-26',2,3,0,NULL,NULL);

/* Procedure structure for procedure `leaves_sproc` */

/*!50003 DROP PROCEDURE IF EXISTS  `leaves_sproc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `leaves_sproc`(
  IN inid INT,
  in increatedtime date,
in inleaveType int,
  IN infromdate Date,
IN intodate Date,
in inemployeeid int,
in inaccept int,
in inemail varchar(250),
in inreason varchar(250),
out result varchar(255)
)
BEGIN
 
if  (inid !=0 ) then
update leaves set leaveType = inleaveType,fromDate=infromdate,toDate=intodate,employeeId=inemployeeid,accept=inaccept,email=inemail,reason=inreason where id=inid;
 set result = 'updated';
END IF;	
if (inid =0 ) then
   insert into leaves (created_time, leaveType , fromDate,toDate,employeeId,accept,email,reason ) values( increatedtime,inleaveType,infromdate,intodate,inemployeeid,inaccept,inemail,inreason );
set result ='insert';
END IF; 
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*  Employee & Timesheet tables & sprocs   */

/*
SQLyog Community Edition- MySQL GUI v8.02 
MySQL - 5.7.19-log : Database - hrms
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`hrms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hrms`;

/*Table structure for table `dependent_info` */

DROP TABLE IF EXISTS `dependent_info`;

CREATE TABLE `dependent_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) DEFAULT NULL,
  `dependentName` varchar(255) DEFAULT NULL,
  `dependentRelation` varchar(255) DEFAULT NULL,
  `dependentDob` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `dependent_info` */

/*Table structure for table `education` */

DROP TABLE IF EXISTS `education`;

CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) DEFAULT NULL,
  `schoolName` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `qualifiedIn` varchar(255) DEFAULT NULL,
  `schoolCompletionDate` varchar(255) DEFAULT NULL,
  `additionalNotes` varchar(255) DEFAULT NULL,
  `interests` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `education` */



/*Table structure for table `employee_type` */

DROP TABLE IF EXISTS `employee_type`;

CREATE TABLE `employee_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` date DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `employee_type` */

insert  into `employee_type`(`id`,`created_time`,`updated_time`,`name`) values (1,'2017-08-12','2017-08-12 11:18:37','Permanent'),(2,'2017-08-12','2017-08-12 11:18:41','On contract'),(3,'2017-08-12','2017-08-12 11:18:45','Temporary'),(4,'2017-08-12','2017-08-12 11:18:51','Trainee');

/*Table structure for table `gender` */

DROP TABLE IF EXISTS `gender`;

CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` date DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `gender` */

insert  into `gender`(`id`,`created_time`,`updated_time`,`name`) values (1,'2017-08-12','2017-08-12 11:21:31','Male'),(2,'2017-08-12','2017-08-12 11:21:34','Female');

/*Table structure for table `locations` */

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` date DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `locations` */

insert  into `locations`(`id`,`created_time`,`updated_time`,`name`) values (1,'2017-08-12','2017-08-12 11:16:09','Guntur'),(2,'2017-08-12','2017-08-12 11:16:11','Amaravathi'),(3,'2017-08-12','2017-08-12 11:16:15','Vijayawada');

/*Table structure for table `marital_status` */

DROP TABLE IF EXISTS `marital_status`;

CREATE TABLE `marital_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` date DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `marital_status` */

insert  into `marital_status`(`id`,`created_time`,`updated_time`,`name`) values (1,'2017-08-12','2017-08-12 11:20:55','Single'),(2,'2017-08-12','2017-08-12 11:20:57','Married'),(3,'2017-08-12','2017-08-12 11:21:00','Devorced');



/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` date DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`id`,`created_time`,`updated_time`,`name`) values (1,'2017-08-11','2017-08-11 00:23:40','Admin'),(2,'2017-08-11','2017-09-04 16:29:45','Manager'),(3,'2017-08-11','2017-09-04 16:29:50','Director'),(4,'2017-08-11','2017-09-04 16:29:55','Team Incharge'),(5,'2017-08-11','2017-09-04 16:30:00','Team Member');

/*Table structure for table `source_of_hire` */

DROP TABLE IF EXISTS `source_of_hire`;

CREATE TABLE `source_of_hire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` date DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `source_of_hire` */

insert  into `source_of_hire`(`id`,`created_time`,`updated_time`,`name`) values (1,'2017-08-12','2017-08-12 11:14:46','Direct'),(2,'2017-08-12','2017-08-12 11:14:48','Referral'),(3,'2017-08-12','2017-08-12 11:14:50','Web'),(4,'2017-08-12','2017-08-12 11:14:51','New Paper'),(5,'2017-08-12','2017-08-12 11:14:55','Advertisement');

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` date DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`id`,`created_time`,`updated_time`,`name`) values (1,'2017-08-12','2017-08-12 11:17:22','Active'),(2,'2017-08-12','2017-08-12 11:17:25','Terminated'),(3,'2017-08-12','2017-08-12 11:17:27','Deceased'),(4,'2017-08-12','2017-08-12 11:17:29','Resigned');



/*Table structure for table `work_experience` */

DROP TABLE IF EXISTS `work_experience`;

CREATE TABLE `work_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) DEFAULT NULL,
  `prevComp` varchar(255) DEFAULT NULL,
  `prevJob` varchar(255) DEFAULT NULL,
  `prevFromDate` varchar(255) DEFAULT NULL,
  `prevToDate` varchar(255) DEFAULT NULL,
  `prevJobDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `work_experience` */

/*
SQLyog Community Edition- MySQL GUI v8.02 
MySQL - 5.7.19-log : Database - hrms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`hrms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hrms`;

/*Table structure for table `dependent_info` */

DROP TABLE IF EXISTS `dependent_info`;

CREATE TABLE `dependent_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) DEFAULT NULL,
  `dependentName` varchar(255) DEFAULT NULL,
  `dependentRelation` varchar(255) DEFAULT NULL,
  `dependentDob` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `dependent_info` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `firstName` varchar(200) DEFAULT NULL,
  `lastName` varchar(200) DEFAULT NULL,
  `nickName` varchar(200) DEFAULT NULL,
  `emailId` varchar(200) DEFAULT NULL,
  `departmentId` varchar(200) DEFAULT NULL,
  `designationId` varchar(200) DEFAULT NULL,
  `workLocation` varchar(200) DEFAULT NULL,
  `reportingTo` varchar(200) DEFAULT NULL,
  `dateOfJoin` date DEFAULT NULL,
  `sourceOfHire` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `seatingLocation` varchar(200) DEFAULT NULL,
  `employeeType` varchar(200) DEFAULT NULL,
  `workPhone` varchar(200) DEFAULT NULL,
  `phoneExtension` varchar(200) DEFAULT NULL,
  `employeeRole` varchar(200) DEFAULT NULL,
  `contactNum` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `alternateEmail` varchar(200) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `maritalStatus` varchar(200) DEFAULT NULL,
  `jobDesc` varchar(200) DEFAULT NULL,
  `aboutMe` varchar(1000) DEFAULT NULL,
  `expertise` varchar(200) DEFAULT NULL,
  `dateOfExit` date DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`id`,`emp_id`,`created_time`,`updated_time`,`firstName`,`lastName`,`nickName`,`emailId`,`departmentId`,`designationId`,`workLocation`,`reportingTo`,`dateOfJoin`,`sourceOfHire`,`status`,`seatingLocation`,`employeeType`,`workPhone`,`phoneExtension`,`employeeRole`,`contactNum`,`address`,`alternateEmail`,`dob`,`tags`,`maritalStatus`,`jobDesc`,`aboutMe`,`expertise`,`dateOfExit`,`gender`) values (1,51,'2017-09-06 17:00:37','2017-09-06 17:00:37','manager1','last name1','sdf','manager1@charvikent.com','5','1','','',NULL,'','','','','','','2','','','',NULL,'','','','','',NULL,'2'),(2,52,'2017-09-07 11:26:03','2017-09-07 11:26:03','team member1','mer1 last nameemb','member1 nick name','member1@charvikent.com','5','5','2','1','2015-09-05','1','1','Guntur','3','05-September-2015','123','5','8885006665','member1 address1','member1otheremail@charvikent.com','1981-09-04','member1 tagessss','2','member1 job desc','member1 about me','member1 ask me','2016-09-04','2'),(3,53,'2017-09-05 18:38:42','2017-09-05 18:38:42','manager2','manager2 lAST NAME','','MANAGER2@CHARVIKENT.COM','8','1','','',NULL,'','','','','','','2','','','',NULL,'','','','','',NULL,''),(4,54,'2017-09-07 12:12:59','2017-09-07 12:12:59','team member2','member2 last name','','member2@charvikent.com','5','2','','1',NULL,'','','','','','','5','','','',NULL,'','','','','',NULL,''),(32,50,NULL,'2017-09-16 14:50:46','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `group_users` */

DROP TABLE IF EXISTS `group_users`;

CREATE TABLE `group_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdTime` date DEFAULT NULL,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_id` int(11) DEFAULT NULL,
  `empId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

/*Data for the table `group_users` */

insert  into `group_users`(`id`,`createdTime`,`updatedTime`,`group_id`,`empId`,`roleId`) values (5,'2017-09-13','2017-09-13 15:28:24',2,0,0),(11,'2017-09-15','2017-09-15 18:27:20',7,0,0),(12,'2017-09-15','2017-09-15 18:27:20',7,0,0),(13,'2017-09-15','2017-09-15 18:27:20',7,0,0),(14,'2017-09-15','2017-09-15 18:27:20',7,0,0),(15,'2017-09-15','2017-09-15 18:27:20',7,0,0),(16,'2017-09-15','2017-09-15 18:27:20',7,0,0),(17,'2017-09-15','2017-09-15 18:27:20',7,1,1),(47,'2017-09-15','2017-09-15 19:51:16',1,1,1),(48,'2017-09-15','2017-09-15 19:51:16',1,4,5),(49,'2017-09-15','2017-09-15 19:51:16',1,3,5);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdTime` date DEFAULT NULL,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `groupEmailId` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `groups` */

insert  into `groups`(`id`,`createdTime`,`updatedTime`,`name`,`description`,`groupEmailId`) values (1,'2017-09-15','2017-09-15 18:50:27','gp1','gp1 desc','gp1@charvikent.com'),(2,'2017-09-13','2017-09-13 15:28:24','gp2','gp2 desc','gp2@charvikent.com'),(7,'2017-09-15','2017-09-15 18:26:15','gp3','gp3 desc','gp3@charvikent.com'),(13,'2017-09-15','2017-09-15 21:06:45','gpp','gpp','gpp');

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` date DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `clientId` varchar(255) DEFAULT NULL,
  `projectcost` double(11,2) DEFAULT '0.00',
  `projectManager` varchar(11) DEFAULT NULL,
  `project_users` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `projects` */

insert  into `projects`(`id`,`created_time`,`updated_time`,`name`,`clientId`,`projectcost`,`projectManager`,`project_users`) values (1,'2017-08-05','2017-09-07 16:18:47','HRMS','1',0.00,'sss','1,4,'),(2,'2017-08-06','2017-09-05 14:43:49','DMS','2',0.00,NULL,'70,51'),(3,'2017-08-04','2017-09-05 14:44:29','TEMPLE PACK','3',0.00,NULL,'64,67'),(4,'2017-09-05','2017-09-07 16:14:14','HRMS NEW','1',0.00,'','1,2,');

/*Table structure for table `time_logs` */

DROP TABLE IF EXISTS `time_logs`;

CREATE TABLE `time_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `projId` varchar(255) DEFAULT NULL,
  `jobId` varchar(255) DEFAULT NULL,
  `workItem` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `loggedHoursType` varchar(50) DEFAULT NULL,
  `loggedHours` varchar(255) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `billableStatus` varchar(255) DEFAULT NULL,
  `linked_time_sheet` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

/*Data for the table `time_logs` */

insert  into `time_logs`(`id`,`created_time`,`updated_time`,`projId`,`jobId`,`workItem`,`date`,`description`,`loggedHoursType`,`loggedHours`,`startTime`,`endTime`,`billableStatus`,`linked_time_sheet`) values (22,'2017-08-30 00:00:00','2017-09-06 17:14:21','1','17','implementation of tie sheets','2017-08-29','testing on 29th aug','HOURS','08:00','','','billable','0'),(30,'2017-08-30 00:00:00','2017-09-06 17:14:22','1','17','implementation of timesheet','2017-08-28','testing on 30th aug','undefined','08:00','','','billable','0'),(32,'2017-08-30 00:00:00','2017-09-06 17:14:22','1','17','implementation of timesheet','2017-08-27','testing on 30th aug','HOURS','10:00','','','billable','0'),(33,'2017-08-30 00:00:00','2017-09-06 17:14:26','1','17','wwwwww','2017-08-30','ddddddddddd','HOURS','10:00','','','billable','0'),(35,'2017-09-05 00:00:00','2017-09-11 14:53:12','4','29','coding','2017-09-04','','HOURS','08:00','','','billable','8'),(37,'2017-09-06 00:00:00','2017-09-11 14:13:27','1','28','gggggggggggg','2017-09-06','3rd tomelog','HOURS','10:00','','','billable','5'),(38,'2017-09-06 00:00:00','2017-09-11 17:03:13','1','28','hhhhhhhhhhh','2017-09-01','3th tomelog','HOURS','07:00','','','billable','9'),(41,'2017-09-06 00:00:00','2017-09-11 17:06:30','1','28','kkkkkkkkkk','2017-08-30','7th log','HOURS','08:00','','','billable','10'),(43,'2017-09-06 00:00:00','2017-09-11 17:06:30','1','28','mmmmmmmm','2017-08-29','8th log','HOURS','09:00','','','billable','10'),(44,'2017-09-06 00:00:00','2017-09-11 17:06:30','1','28','nnnnnn','2017-08-03','9th log','HOURS','08:00','','','billable','10'),(45,'2017-09-06 00:00:00','2017-09-11 17:06:30','1','28','pppp','2017-08-05','10th log','HOURS','06:00','','','billable','10'),(46,'2017-09-06 00:00:00','2017-09-11 17:06:30','1','28','qqqqqqqqq','2017-08-07','11th log','HOURS','06:00','','','billable','10'),(47,'2017-09-07 00:00:00','2017-09-11 14:53:12','4','29','new item1','2017-09-06','20th log','HOURS','09:00','','','billable','8'),(48,'2017-09-07 00:00:00','2017-09-11 14:53:12','4','29','new item3','2017-09-07','23rd log','HOURS','07:00','','','billable','8'),(49,'2017-09-07 00:00:00','2017-09-11 17:03:13','4','29','new item4','2017-09-01','24th log','HOURS','09:00','','','billable','9'),(51,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','new item6','2017-08-02','log 6','HOURS','06:00','','','billable','10'),(52,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','new item 7','2017-08-03','log 7','HOURS','07:00','','','billable','10'),(53,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','new item 8','2017-08-04','log 8','HOURS','08:00','','','billable','10'),(54,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','new item12','2017-08-07','log 12','HOURS','10:00','','','billable','10'),(55,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 13','2017-08-08','log 13','HOURS','06:00','','','billable','10'),(56,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 14','2017-08-09','log 14','HOURS','07:00','','','billable','10'),(57,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 16','2017-08-11','log 16','HOURS','07:00','','','billable','10'),(58,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 17','2017-08-14','log 17','HOURS','07:00','','','billable','10'),(59,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 18','2017-08-21','log 18','HOURS','08:00','','','billable','10'),(60,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 19','2017-08-22','log 19','HOURS','08:00','','','billable','10'),(61,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 20','2017-08-23','log 20','HOURS','07:00','','','billable','10'),(62,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 21','2017-08-28','log 21 ','HOURS','09:00','','','billable','10'),(63,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 22','2017-08-29','log 22','HOURS','06:00','','','billable','10'),(64,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 23','2017-08-30','log 23','HOURS','','','','billable','10'),(65,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','log 24','2017-08-31','log 24','HOURS','06:00','','','billable','10'),(66,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 25','2017-08-25','log 25','HOURS','06:00','','','billable','10'),(67,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 26','2017-08-24','log 26','HOURS','06:00','','','billable','10'),(68,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','item 26','2017-08-26','log 26','HOURS','07:00','','','billable','10'),(69,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','cccccc','2017-08-06','ccccccccc','HOURS','07:00','','','billable','10'),(70,'2017-09-07 00:00:00','2017-09-11 17:03:13','4','29','ddddddddddd','2017-09-03','dddddddddddd','HOURS','07:00','','','billable','9'),(71,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','fffffffffff','2017-08-13','ffffffffffff','HOURS','07:00','','','billable','10'),(72,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','gggggggg','2017-08-20','ggggggggggggg','HOURS','07:00','','','billable','10'),(73,'2017-09-07 00:00:00','2017-09-11 17:06:30','4','29','hhhhhhhhh','2017-08-27','hhhhhhhhhhhh','HOURS','07:00','','','billable','10'),(74,'2017-09-07 00:00:00','2017-09-07 00:00:00','4','29','nnnnnnnnnnnnn','2017-07-19','nnnnnnnnn','HOURS','07:00','','','billable','0'),(75,'2017-09-07 00:00:00','2017-09-14 15:20:34','4','29','23','2017-07-12','23','HOURS','07:00','','','billable','12'),(76,'2017-09-07 00:00:00','2017-09-14 15:20:34','4','29','2525','2017-07-10','25','HOURS','07:00','','','billable','12'),(77,'2017-09-12 00:00:00','2017-09-14 12:18:20','4','30','item 111','2017-09-04','log created by manager 1','HOURS','08:00','','','billable','11'),(78,'2017-09-15 00:00:00','2017-09-15 00:00:00','4','30','t1','2017-09-01','t1','HOURS','07:00','','','billable','0'),(79,'2017-09-15 00:00:00','2017-09-15 00:00:00','4','30','t2','2017-09-02','t2 desc','HOURS','08:00','','','billable','0'),(80,'2017-09-15 00:00:00','2017-09-15 00:00:00','1','31','dddddddd','2017-09-05','ddddddddd','HOURS','07:00','','','billable','0');

/*Table structure for table `time_sheets` */

DROP TABLE IF EXISTS `time_sheets`;

CREATE TABLE `time_sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timeSheetName` varchar(255) DEFAULT '  ',
  `period` varchar(255) DEFAULT NULL,
  `empId` varchar(20) DEFAULT NULL,
  `submittedHours` varchar(20) DEFAULT NULL,
  `approvedHours` varchar(20) DEFAULT NULL,
  `timesheetStatus` varchar(50) DEFAULT ' ',
  `description` varchar(255) DEFAULT NULL,
  `displayDate` varchar(50) DEFAULT NULL,
  `billableHours` varchar(50) DEFAULT NULL,
  `nonBillableHours` varchar(50) DEFAULT NULL,
  `periodStart` varchar(50) DEFAULT NULL,
  `periodEnd` varchar(50) DEFAULT NULL,
  `clientId` varchar(255) DEFAULT NULL,
  `projectId` varchar(255) DEFAULT NULL,
  `jobId` varchar(255) DEFAULT NULL,
  `billableStatus` varchar(255) DEFAULT NULL,
  `time_log_ids` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `time_sheets` */

insert  into `time_sheets`(`id`,`created_time`,`updated_time`,`timeSheetName`,`period`,`empId`,`submittedHours`,`approvedHours`,`timesheetStatus`,`description`,`displayDate`,`billableHours`,`nonBillableHours`,`periodStart`,`periodEnd`,`clientId`,`projectId`,`jobId`,`billableStatus`,`time_log_ids`) values (8,'2017-09-11 14:53:12','2017-09-11 14:53:12','Timesheet(04-Sep-2017 - 10-Sep-2017)','LAST_WEEK','1','45:0','0','Draft','timesheet 1','04-Sep-2017 - 10-Sep-2017','45:0','0:0','04-Sep-2017','10-Sep-2017','all','all','all','all',NULL),(9,'2017-09-11 17:03:13','2017-09-11 17:03:13','Timesheet(01-Sep-2017 - 30-Sep-2017)','THIS_MONTH','1','29:0','0','Draft','timesheet 2','01-Sep-2017 - 30-Sep-2017','29:0','0:0','01-Sep-2017','30-Sep-2017','all','all','all','all',NULL),(10,'2017-09-11 17:06:30','2017-09-11 17:06:30','Timesheet(01-Aug-2017 - 30-Aug-2017)','LAST_MONTH','1','194:0','0','Draft','timesheet 3','01-Aug-2017 - 30-Aug-2017','194:0','0:0','01-Aug-2017','30-Aug-2017','all','all','all','all',NULL),(11,'2017-09-14 12:18:20','2017-09-14 12:18:20','Timesheet(04-Sep-2017 - 10-Sep-2017)','LAST_WEEK','2','8:0','0','Draft','last week time sheet on 14th sept','04-Sep-2017 - 10-Sep-2017','8:0','0:0','04-Sep-2017','10-Sep-2017','all','all','all','all',NULL),(12,'2017-09-14 17:48:18','2017-09-14 17:48:18','Timesheet(01-July-2017 - 15-July-2017)','THIS_WEEK','1','14:0','0','Draft','time sheet for 1-15 of july updated','01-July-2017 - 15-July-2017','14:0','0:0','01-July-2017','15-July-2017','all','all','all','all',NULL);

/* Procedure structure for procedure `employee_delete_sproc` */

/*!50003 DROP PROCEDURE IF EXISTS  `employee_delete_sproc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_delete_sproc`(IN emp_rec_id int(11), IN employee_id int(11), out isDeleted varchar(50))
BEGIN
	DECLARE `should_rollback` BOOL DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `should_rollback` = TRUE;
 
	START TRANSACTION; 
		set isDeleted = 'false';
                ## delete all related entries in related tables.
                DELETE FROM work_experience WHERE emp_id = emp_rec_id;
		DELETE FROM education WHERE emp_id = employee_id;
		DELETE FROM dependent_info WHERE emp_id = emp_rec_id;
		DELETE FROM employee WHERE id = emp_rec_id;
	IF should_rollback then
		set isDeleted = 'false';
		rollback;
	else
		commit;
		set isDeleted = 'true';
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `employee_sproc` */

/*!50003 DROP PROCEDURE IF EXISTS  `employee_sproc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_sproc`(IN id int(11),IN employee_id int(11),IN prev_employee_id int(11),
	in created_time varchar(255),in updated_time varchar(255),
	in f_name varchar(255),in l_name varchar(255),in nick_name varchar(255),in email_id varchar(255),
	in dept_id varchar(255),in designation_id varchar(255),in work_loc varchar(255),in reporting_to varchar(255),
	in date_of_join Date,in source_of_hire varchar(255),in emp_status varchar(255),
	in seating_loc varchar(255),in emp_type varchar(255),in work_phone varchar(255),
	in phone_ext varchar(255),in empRole varchar(255),in contact_num varchar(255),
	in emp_address varchar(255),in alt_email varchar(255),in d_o_b date,
	in tags varchar(255),in marital_status varchar(255),in job_desc varchar(255),
	in about_me varchar(255),in expertise varchar(255),in d_o_e date,
	in gender varchar(255),in prev_comp varchar(255),in prev_job varchar(255),
	in p_from_date varchar(255),in p_to_date varchar(255),in p_job_desc varchar(255),
	in school_name varchar(255),in qualification varchar(255),in qualified_in varchar(255),
	in s_c_d varchar(255),in add_notes varchar(255),in interests varchar(255),
	in d_name varchar(255),in d_relation varchar(255), in d_dob varchar(255),
	IN exp_length int(11),IN edu_length int(11),IN dependents_lengh int(11),IN password varchar(200),
	OUT result varchar(255))
BEGIN
	DECLARE empCount int default 0;
	DECLARE cnt int default 0;
	DECLARE last_isert_emp_rec_id int default 0;
	DECLARE `should_rollback` BOOL DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `should_rollback` = TRUE;
 
START TRANSACTION; 
 
### 0 means new recored
  if id = 0  then 
	
	  select count(*) into empCount from employee where emp_id = employee_id
					and upper(firstName) = upper(f_name) 
					and upper(lastName) = upper(l_name) and upper(emailId) = upper(email_id);
	  if empCount > 0 then
	     set result = 'duplicate';
	  else
	     insert into employee(emp_id,created_time, updated_time, firstName,   lastName,   emailId,    nickName,  departmentId, designationId,  workLocation, reportingTo,
		dateOfJoin,   sourceOfHire,   status,   seatingLocation,   employeeType,   workPhone,   phoneExtension, employeeRole,
		contactNum,   address,   alternateEmail,   dob,   tags,   maritalStatus,   jobDesc,   aboutMe,  expertise,   
		dateOfExit,   gender) values(employee_id,created_time,updated_time,f_name,l_name,email_id,nick_name,dept_id,designation_id,work_loc,reporting_to,date_of_join,source_of_hire,
		emp_status,seating_loc,emp_type,work_phone,phone_ext,empRole,contact_num,emp_address,alt_email,d_o_b,tags,
		marital_status,job_desc,about_me,expertise,d_o_e,gender);
		
		set last_isert_emp_rec_id = LAST_INSERT_ID();
		insert into users(name,email,password,mobile,rolId,empId) values(concat(f_name,' ',l_name),email_id,
								password,contact_num,empRole,last_isert_emp_rec_id);
		
		#############  INSERT INTO EXPERIENCE TABLE  #################
		label1: LOOP
				IF cnt < exp_length THEN
					set cnt = cnt + 1;
					select @comp := SUBSTRING_INDEX(SUBSTRING_INDEX(prev_comp,'##',cnt),'##',-1);
					select @job := SUBSTRING_INDEX(SUBSTRING_INDEX(prev_job,'##',cnt),'##',-1);
					select @from_date := SUBSTRING_INDEX(SUBSTRING_INDEX(p_from_date,'##',cnt),'##',-1);
					select @to_date := SUBSTRING_INDEX(SUBSTRING_INDEX(p_to_date,'##',cnt),'##',-1);
					select @job_desc := SUBSTRING_INDEX(SUBSTRING_INDEX(p_job_desc,'##',cnt),'##',-1);
					insert into work_experience(emp_id,prevComp,prevJob,prevFromDate,prevToDate,prevJobDesc) 
						values (last_isert_emp_rec_id,@comp,@job,@from_date,@to_date,@job_desc);
				
					ITERATE label1;
				END IF;
			LEAVE label1;
		END LOOP label1;
		#############  Education  #################
		set cnt = 0;
		label1: LOOP
				IF cnt < edu_length THEN
					set cnt = cnt + 1;
					select @school_name := SUBSTRING_INDEX(SUBSTRING_INDEX(school_name,'##',cnt),'##',-1);
					select @qualification := SUBSTRING_INDEX(SUBSTRING_INDEX(qualification,'##',cnt),'##',-1);
					select @qualifiedIn := SUBSTRING_INDEX(SUBSTRING_INDEX(qualified_in,'##',cnt),'##',-1);
					select @schoolCompletionDate := SUBSTRING_INDEX(SUBSTRING_INDEX(s_c_d,'##',cnt),'##',-1);
					select @additionalNotes := SUBSTRING_INDEX(SUBSTRING_INDEX(add_notes,'##',cnt),'##',-1);
					select @interests := SUBSTRING_INDEX(SUBSTRING_INDEX(interests,'##',cnt),'##',-1);
					insert into education(emp_id,schoolName,qualification,qualifiedIn,schoolCompletionDate,additionalNotes,interests) 
						values (last_isert_emp_rec_id,@school_name,@qualification,@qualifiedIn,@schoolCompletionDate,@additionalNotes,@interests);
				
					ITERATE label1;
				END IF;
			LEAVE label1;
		END LOOP label1;
		#############  Dependent Data  #################
		set cnt = 0;
		label1: LOOP
				IF cnt < dependents_lengh THEN
					set cnt = cnt + 1;
					select @dependent_name := SUBSTRING_INDEX(SUBSTRING_INDEX(d_name,'##',cnt),'##',-1);
					select @dependent_relation := SUBSTRING_INDEX(SUBSTRING_INDEX(d_relation,'##',cnt),'##',-1);
					select @dependent_DOB := SUBSTRING_INDEX(SUBSTRING_INDEX(d_dob,'##',cnt),'##',-1);
					
					insert into dependent_info(emp_id,dependentName,dependentRelation,dependentDob) 
						values (last_isert_emp_rec_id,@dependent_name,@dependent_relation,@dependent_DOB);
				
					ITERATE label1;
				END IF;
			LEAVE label1;
		END LOOP label1;
	     set result = 'insert success';
	  end if;  
######### id != 0 means UPDATE existing record ###############################################
   else 
	select count(*) into empCount from employee where emp_id = employee_id
					and upper(firstName) = upper(f_name) 
					and upper(lastName) = upper(l_name) and upper(emailId) = upper(email_id);
	if empCount > 0 and prev_employee_id != employee_id then
		set result = 'duplicate';
	else
		update employee emp set emp.emp_id=employee_id, emp.created_time=created_time, emp.updated_time=updated_time, firstName=f_name, 
			lastName=l_name, emailId=email_id, nickName=nick_name,
			departmentId=dept_id, designationId=designation_id, workLocation=work_loc,
			reportingTo=reporting_to, dateOfJoin=date_of_join, sourceOfHire=source_of_hire, status=emp_status, 
			seatingLocation=seating_loc, employeeType=emp_type, workPhone=work_phone, 
			phoneExtension=phone_ext, employeeRole=empRole, contactNum=contact_num, address=emp_address, 
			alternateEmail=alt_email, dob=d_o_b, tags=tags, maritalStatus=marital_status, 
			jobDesc=job_desc, aboutMe=about_me,  expertise=expertise, dateOfExit=d_o_e, gender=gender
			WHERE emp.id = id;
			
			#############  UPDATE EXPERIENCE TABLE  #################
			delete from work_experience where emp_id = id;
			SET cnt = 0;
			label1: LOOP
					IF cnt < exp_length THEN
						set cnt = cnt + 1;
						select @comp := SUBSTRING_INDEX(SUBSTRING_INDEX(prev_comp,'##',cnt),'##',-1);
						select @job := SUBSTRING_INDEX(SUBSTRING_INDEX(prev_job,'##',cnt),'##',-1);
						select @from_date := SUBSTRING_INDEX(SUBSTRING_INDEX(p_from_date,'##',cnt),'##',-1);
						select @to_date := SUBSTRING_INDEX(SUBSTRING_INDEX(p_to_date,'##',cnt),'##',-1);
						select @job_desc := SUBSTRING_INDEX(SUBSTRING_INDEX(p_job_desc,'##',cnt),'##',-1);
						
						insert into work_experience(emp_id,prevComp,prevJob,prevFromDate,prevToDate,prevJobDesc) 
							values (id,@comp,@job,@from_date,@to_date,@job_desc);
						
							ITERATE label1;
					END IF;
				LEAVE label1;
			END LOOP label1;
			#############  UPDATE Education TABLE  #################
			delete from education where emp_id = id;
			set cnt = 0;
			label1: LOOP
					IF cnt < edu_length THEN
						set cnt = cnt + 1;
						select @school_name := SUBSTRING_INDEX(SUBSTRING_INDEX(school_name,'##',cnt),'##',-1);
						select @qualification := SUBSTRING_INDEX(SUBSTRING_INDEX(qualification,'##',cnt),'##',-1);
						select @qualifiedIn := SUBSTRING_INDEX(SUBSTRING_INDEX(qualified_in,'##',cnt),'##',-1);
						select @schoolCompletionDate := SUBSTRING_INDEX(SUBSTRING_INDEX(s_c_d,'##',cnt),'##',-1);
						select @additionalNotes := SUBSTRING_INDEX(SUBSTRING_INDEX(add_notes,'##',cnt),'##',-1);
						select @interests := SUBSTRING_INDEX(SUBSTRING_INDEX(interests,'##',cnt),'##',-1);
						
						insert into education(emp_id,schoolName,qualification,qualifiedIn,
							schoolCompletionDate,additionalNotes,interests) 
							values (id,@school_name,@qualification,@qualifiedIn,
							@schoolCompletionDate,@additionalNotes,@interests);
					
						ITERATE label1;
					END IF;
				LEAVE label1;
			END LOOP label1;
			#############  UPDATE DEPENDENT_INFO TABLE  #################
			delete from dependent_info where emp_id = id;
			set cnt = 0;
			label1: LOOP
					IF cnt < dependents_lengh THEN
						set cnt = cnt + 1;
						select @dependent_name := SUBSTRING_INDEX(SUBSTRING_INDEX(d_name,'##',cnt),'##',-1);
						select @dependent_relation := SUBSTRING_INDEX(SUBSTRING_INDEX(d_relation,'##',cnt),'##',-1);
						select @dependent_DOB := SUBSTRING_INDEX(SUBSTRING_INDEX(d_dob,'##',cnt),'##',-1);
						
						insert into dependent_info(emp_id,dependentName,dependentRelation,dependentDob) 
							values (id,@dependent_name,@dependent_relation,@dependent_DOB);
					
						ITERATE label1;
					END IF;
				LEAVE label1;
			END LOOP label1;
			set result = 'update success';
		end if;
   end if;
   IF should_rollback then
	set result = 'rolledback';
	rollback;
   else
	commit;
   end if;
  
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `groups_delete_sproc` */

/*!50003 DROP PROCEDURE IF EXISTS  `groups_delete_sproc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `groups_delete_sproc`(IN groupId int(11), out isDeleted bool)
BEGIN
	DECLARE `should_rollback` BOOL DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `should_rollback` = TRUE;
 
	START TRANSACTION; 
		DELETE FROM groups WHERE id = groupId;
                ## delete all related entries from related tables.
                DELETE FROM group_users WHERE group_id = groupId;
	IF should_rollback then
		set isDeleted = false;
		rollback;
	else
		commit;
		set isDeleted = true;
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `groups_sproc` */

/*!50003 DROP PROCEDURE IF EXISTS  `groups_sproc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `groups_sproc`(in id int(11),in createdtime date,
	in name varchar(255),in description varchar(255),in email varchar(255),in userids varchar(255),in roleids varchar(255),
	IN users_length int(11), out result varchar(255))
BEGIN
	DECLARE existing_rec_count int default 0;
	DECLARE cnt int default 0;
	DECLARE grp_id int default 0;
	DECLARE `should_rollback` BOOL DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `should_rollback` = TRUE;
 
START TRANSACTION; 
	select count(*) into existing_rec_count from groups gp where gp.name = name and gp.groupEmailId = email;
	if (existing_rec_count > 0 and id = 0) then
		set result = 'duplicate';
	else
		############### 0 means new recored
		if id = 0  then 
			insert into groups(createdTime,name,description,groupEmailId) 
				values(createdtime,name,description,email);
			set grp_id = last_insert_id();
			SET CNT = 0;
			label1: LOOP
				IF cnt < users_length THEN
					set cnt = cnt + 1;
					select @empid := SUBSTRING_INDEX(SUBSTRING_INDEX(userids,',',cnt),',',-1);
					select @roleid := SUBSTRING_INDEX(SUBSTRING_INDEX(roleids,',',cnt),',',-1);
					insert into group_users(createdTime,group_id,empId,roleId) 
						values (createdtime,grp_id,@empid,@roleid);
					
						ITERATE label1;
				END IF;
				LEAVE label1;
			END LOOP label1;
			set result = 'insert success';
		######### update record
		else
			update groups gp set gp.createdTime = createdtime, gp.name = name, gp.description = description,
						groupEmailId = email where gp.id = id ;
			#############  UPDATE group_users TABLE  #################
			delete from group_users where group_id = id;
			SET CNT = 0;
			label1: LOOP
				IF cnt < users_length THEN
					set cnt = cnt + 1;
					select @empid := SUBSTRING_INDEX(SUBSTRING_INDEX(userids,',',cnt),',',-1);
					select @roleid := SUBSTRING_INDEX(SUBSTRING_INDEX(roleids,',',cnt),',',-1);
					insert into group_users(createdTime,group_id,empId,roleId) 
						values (createdtime,id,@empid,@roleid);
					
						ITERATE label1;
				END IF;
				LEAVE label1;
			END LOOP label1;
			set result = 'update success';
		end if;
	end if;
   
       
	IF should_rollback then
		set result = 'rolledback';
		rollback;
	else
		commit;
	end if;
	
  END */$$
DELIMITER ;

/* Procedure structure for procedure `projectsproc` */

/*!50003 DROP PROCEDURE IF EXISTS  `projectsproc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `projectsproc`(
  IN inid INT,
  in increatedtime date,
in inname varchar(200),
  IN inclientId varchar(200),
IN inprojectcost Double(10,2),
in inprojectManager varchar(200),
in project_users varchar(200),
out result varchar(255)
)
BEGIN
 DECLARE empCount int default 0;
DECLARE dumpId int default 0;
select id into dumpId  from projects  where name = inname ;
  select count(*) into empCount  from projects  where name = inname ;
if  (inid !=0 ) then
if(dumpId=inid  or empCount=0)
then
update projects set name = inname,clientId=inclientId,projectcost=inprojectcost,projectManager=inprojectManager,project_users=project_users  where id=inid;
 set result = 'updated';
else 
set result ='duplicate';
END IF;	
end if;
if (inid =0 and empCount = 0 ) then
   insert into projects ( created_time,name,clientId,projectcost,projectManager,project_users ) values(increatedtime,inname,inclientId,inprojectcost,inprojectManager,project_users);  
set result ='insert';
END IF; 
if (inid =0 and empCount >0 ) then
   
set result ='duplicate';
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `time_logs_sproc` */

/*!50003 DROP PROCEDURE IF EXISTS  `time_logs_sproc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `time_logs_sproc`(in id varchar(255),in created_time timestamp,in updated_time timestamp,
	in proj_id varchar(255),in job_id varchar(255),in work_item varchar(255),in date timestamp,in description varchar(255),
	in logged_time_type varchar(50),in logged_hours varchar(255),in startTime varchar(50),in endTime varchar(50), in billable_status varchar(255),OUT result varchar(255))
BEGIN
	DECLARE existing_rec_count int default 0;
	DECLARE `should_rollback` BOOL DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `should_rollback` = TRUE;
 
START TRANSACTION; 
	select count(*) into existing_rec_count from time_logs tl where tl.projId = proj_id and tl.jobId = job_id
			##and tl.workItem = work_item 
			and tl.date = date;
	if (existing_rec_count > 0 and id = 0) then
		set result = 'duplicate';
	else
		############### 0 means new recored
		if id = 0  then 
			insert into time_logs(created_time,updated_time,projId,jobId,workItem,date,description,
				loggedHoursType,loggedHours,startTime,endTime,billableStatus) 
			values(created_time,updated_time,proj_id,job_id,work_item,date,description,logged_time_type,
				logged_hours,startTime,endTime,billable_status);
			set result = 'insert success';
		######### update record
		else
			update time_logs tl set tl.created_time = created_time, tl.updated_time = updated_time ,projId = proj_id,
				jobId = job_id, workItem = work_item, tl.date = date, tl.description = description,
				loggedHoursType=logged_time_type,tl.loggedHours = logged_hours,startTime=startTime,endTime=endTime, billableStatus = billable_status 
				where tl.id = id;
			set result = 'update success';
		end if;
	end if;
   
       
	IF should_rollback then
		set result = 'rolledback';
		rollback;
	else
		commit;
	end if;
	
  END */$$
DELIMITER ;

/* Procedure structure for procedure `time_sheet_sproc` */

/*!50003 DROP PROCEDURE IF EXISTS  `time_sheet_sproc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `time_sheet_sproc`(IN id int(11),in created_time varchar(255),
		in updated_time varchar(255),   in timesheetname varchar(100),in displayDate varchar(50),
		in description varchar(200),in billableHours varchar(50),in nonBillableHours varchar(50),
		in periodStart varchar(50),in periodEnd varchar(50), in empid varchar(50),   in submittedhours varchar(20),
		in approvedhours varchar(20),in timesheetstatus varchar(50),in period varchar(255),in emp_name varchar(255),
		in clientid varchar(255),in projectid varchar(255),in jobid varchar(255),   
		in billable_status varchar(255),in time_log_ids varchar(255),
		in modified_log_ids varchar(255),in modified_log_values varchar(255),IN modified_logs_length int(11),
		OUT result varchar(255),OUT lastinsertid varchar(255))
BEGIN
	DECLARE existing_rec_count int default 0;  
	DECLARE `should_rollback` BOOL DEFAULT FALSE;  
	DECLARE cnt int default 0;  
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `should_rollback` = TRUE;  
	
    START TRANSACTION;  
	 select count(*) into existing_rec_count from time_sheets ts where ts.period = period and ts.empId = empid 
			and ts.clientId = clientid    and ts.projectId = projectid and ts.jobId = jobid; 
	 if (existing_rec_count > 0 and id = 0) then   
		set result = 'duplicate'; 
	 else   ############### id = 0 means new recored 
		if id = 0  then     
			insert into time_sheets(created_time,updated_time,timeSheetName,empId,displayDate,description,billableHours,nonBillableHours, 
					periodStart,periodEnd,submittedHours,approvedHours,  timesheetStatus,period,clientId,projectId,jobId,billableStatus)
			      values(created_time,updated_time,timesheetname,empid,displayDate,description,billableHours,nonBillableHours,     
					periodStart,periodEnd,submittedhours,approvedhours,     
					timesheetstatus,period,clientid,projectid,jobid,billable_status);
			set lastinsertid = LAST_INSERT_ID();
			
			update time_logs tl set tl.linked_time_sheet = lastinsertid where FIND_IN_SET(tl.id, time_log_ids)>0;
			set result = 'insert success';  
			
		else  ########### update record    
			update time_sheets ts set ts.created_time=created_time, ts.updated_time=updated_time,     
				ts.timeSheetName=timesheetname,ts.displayDate=displayDate,ts.description=description,ts.billableHours=billableHours,
				ts.nonBillableHours=nonBillableHours,      ts.periodStart=periodStart,ts.periodEnd=periodEnd,ts.empId=empid,
				ts.submittedHours=submittedhours,ts.approvedHours=approvedhours,ts.timesheetStatus=timesheetstatus,    
				ts.period=period, ts.clientId=clientid,ts.projectId=projectid,     ts.jobId=jobid, billableStatus=billable_status 
				where ts.id = id; 
			set cnt = 0;
			label1: LOOP
				IF cnt < modified_logs_length THEN
					set cnt = cnt + 1;
					select @log_id := SUBSTRING_INDEX(SUBSTRING_INDEX(modified_log_ids,',',cnt),',',-1);
					select @log_value := SUBSTRING_INDEX(SUBSTRING_INDEX(modified_log_values,',',cnt),',',-1);
					update time_logs tl set tl.loggedHours = @log_value  where tl.id = @log_id;
					ITERATE label1;
				END IF;
			   LEAVE label1;
			END LOOP label1;
			
			set result = 'update success';  
		end if;  
	  end if;  
		IF should_rollback then   
			set result = 'rolledback';   
			rollback;  
		else   
			commit;  
		end if;  
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;



