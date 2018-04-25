DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `name` varchar(100) NOT NULL,
    `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;


 insert into users (created_time, name , password) values (now(), "admin", "auro1212");
 insert into users (created_time, name , password) values (now(), "nestaway", "nest1212");
 
 insert into role (roleId , roleName ) values(4, "Partner");
 
  alter table order_info1  add column user_id int(11) default 1;
  
  alter table order_info1 add column   `watsup_location` varchar(255) DEFAULT NULL;
  alter table order_info1 add column   `priority` varchar(255) DEFAULT NULL;
  alter table order_info1 add column  `customer_name` varchar(255) DEFAULT NULL;
  alter table order_info1 add column  `client_order_id` varchar(255) DEFAULT NULL;
  
 update vendor1 set password='123456';
  alter table order_status_log1 add column comments varchar(500) default null;
  
  
DROP TABLE IF EXISTS `aurospaces_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aurospaces_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`order_id` int(11) ,
	`aurospaces_log` varchar(255) null ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 DROP TABLE IF EXISTS `client_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`order_id` int(11) ,
	`client_log` varchar(255) null ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

alter table order_info1 add column vendor_service_charge double(10,2) default 0.0;
alter table order_info1 add column goods_charge double(10,2) default 0.0;
alter table order_info1 add column margin_value double(10,2) default 0.0;
alter table order_info1 add column no_of_hours_work int(11) default 0;
alter table order_info1 add column transportaion_charge double(10,2) default 0.0;
alter table order_info1 add column no_of_visits int(11) default 0;
alter table order_info1 add column fixed_charge double(10,2) default 0;
alter table order_info1 add column auro_log_id int(11) default 0;
alter table order_info1 add column client_log_id int(11) default 0;
alter table order_info1 add column invoice_file varchar(255) default null;
alter table order_info1 add column feedback_form varchar(255) default null;
alter table order_info1 add column region_id int(11) default 0;


 DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`name` varchar(255) ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*by the date of 6th nov*/

alter table client_order_log add column user_id int(11) default 0;
alter table aurospaces_order_log add column user_id int(11) default 0;

/*afternoon*/

alter table order_info1 add column auro_log varchar(255) default '';
alter table order_info1 add column client_log varchar(255) default '';


