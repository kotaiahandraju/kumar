DROP TABLE IF EXISTS `service_unit_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_unit_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `service_unit_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `label` varchar(40) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `final_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS `service_unit_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_unit_map` (
  `id` int(11) NOT NULL ,
  `dup_id` int(11) NOT NULL ,
  `service_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(700) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

insert into service_unit_map (id, service_id, name, description) (select id, service_id, name, description from service_unit1);

update service_unit_map sum1 , service_unit1 s1 set sum1.dup_id = s1.id where s1.name = sum1.name and s1.description = sum1.description and s1.service_id = sum1.service_id;

insert into `service_unit_vendor` (
  `created_time`,
  `updated_time`,
  `service_unit_id` ,
  `vendor_id`,
  `price` ,
  `discount`,
  `label` ,
  `discount_price` ,
  `final_price`) (select created_time, updated_time, id,vendor_id, price, discount, label, discount_price , final_price from service_unit1);


update service_unit_vendor suv , service_unit_map sum set suv.service_unit_id = sum.dup_id where suv.service_unit_id = sum.id;
update order_service_unit1 suv , service_unit_map sum set suv.service_unit_id = sum.dup_id where suv.service_unit_id = sum.id;

delete from service_unit1 where id not in (select service_unit_id from service_unit_vendor);

ALTER TABLE  `service_unit1` ADD UNIQUE ( `service_id` , `name` , `description`);

ALTER TABLE  `service_unit1` DROP  `final_price` ;
ALTER TABLE  `service_unit1` DROP  `discount_price` ;
ALTER TABLE  `service_unit1` DROP  `discount` ;
ALTER TABLE  `service_unit1` DROP  `price` ;
DROP TABLE IF EXISTS `package_reviews`;
create table `package_reviews` (
`id` int(11) NOT NULL AUTO_INCREMENT, 
`created_time` timestamp NULL DEFAULT NULL,
`updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`service_unit_id` int(11) NOT NULL,
`name` varchar(255) DEFAULT NULL, 
`profile_pic` varchar(255) DEFAULT NULL,
`review` varchar(700) DEFAULT NULL, 
PRIMARY KEY (`id`) 
) ENGINE=InnoDB;

 insert into package_reviews(service_unit_id , profile_pic) (select suv.id,s.img_url from service_unit1 su,service1 s, service_unit_vendor suv where su.service_id= s.id and su.id = suv.service_unit_id); 
