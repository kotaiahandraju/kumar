ALTER TABLE service1  ADD icon_img varchar(550);

update service1 set description = "All your home carpentry needs right from the scratch will be taken care by our best trained Carpenters."
where id = 13;

update service1 set description = "Worried about wiring or need to install a geyser. Our well trained electricians will fix’em up within no time."
where id = 4;

update service1 set description = "Seeking experts to paint your house? The experts are just one tap away from you. Book now!"
where id = 15;

update service1 set description = "Tired with pests all over the house? Hire the expert to safeguard your home from all kinds of pests."
where id = 12;

update service1 set description = "We have a dedicated and trained team who will take care of your pup from feeding to exercise and training."
where id = 9;

update service1 set description = "Tired with fixing up the leaking tap again & again? Switch to experts. Book now!"
where id = 14;

update service1 set description = "Feeling tired enough to clean your home. We have best home cleaning services who will refresh your home within a matter of time."
where id = 34;

update service1 set description = "Your life’s best thing isn’t working like it was? Our well trained technicians will fix all your mobile phone and tablet related issues."
where id = 45;

update service1 set description = "Be it a Sports injury or a lingering back pain, the treatment is possible in the comfort of your home."
where id = 6;

update service1 set description = "Feeling unsafe with diseases? Our specialists will provide you the best treatment along with diagnosis."
where id = 10;

update service1 set description = "Not having enough time to look after your loved ones? We have best caring team who will look after your loved ones."
where id = 11;

update service1 set description = "Got a medical emergency in the middle of night? No worries, get the highly professional doctor at your doorstep."
where id = 3;

update service1 set description = "Want to get fit again? Get the professional yoga experts at your doorstep with just a click."
where id = 40;

update service1 set description = "Worried about your home in your absence? We have the best Care takers on whom you can trust on."
where id = 7;

update service1 set description = "Be it a railing or a rolling shutter or a sliding gate, our experts will get it done for you."
where id = 16;



update service1 set description = "Looking for a trusted Chartered Accountant, get the best of them with just a tap of a click."
where id = 32;

update service1 set description = "Behind every successful Weddings there are great wedding planners. Find them here."
where id = 36;

update service1 set description = "Gaining weight day by day or having fear of losing it? Leave the worries to experts to get fit again."
where id = 39;

update service1 set description = "From cleaning to restoration both inside and out, experts will make your car look beautiful with hygiene and protection ."
where id = 41;

update service1 set description = "Get your carpets cleaned by experienced professionals being in the comfort of your home."
where id = 38;
update service1 set description = "Isn’t your home appliances running as they were? Hire the experts to get it fixed."
where id = 44;
update service1 set description = "Get the best professional photographers who will gift you memories along with every album."
where id = 49;




update service1 set 
icon_img ="nbdimages/serviceicons/ico_appliance_repair.png" where id=44;


update service1 set 
icon_img ="nbdimages/serviceicons/ico_car_detailing.png" where id=41;

update service1 set 
icon_img ="nbdimages/serviceicons/ico_carpentry.png" where id=13;

update service1 set 
icon_img ="nbdimages/serviceicons/ico_carpet_cleaning.png" where id=38;

update service1 set 
icon_img ="nbdimages/serviceicons/ico_cs.png" where id=32;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_dietician.png" where id=39;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_doctor.png" where id=3;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_electrician.png" where id=4;

update service1 set 
icon_img ="nbdimages/serviceicons/ico_electronic_repair.png" where id=43;

update service1 set 
icon_img ="nbdimages/serviceicons/ico_home_care_taker.png" where id=7;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_car_detailing.png" where id=41;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_home_cleaning_.png" where id=34;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_mobile_appliance_repair.png" where id=45;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_nursing_care.png" where id=11;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_painter.png" where id=15;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_pathology.png" where id=10;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_pestcontrol.png" where id=12;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_pet_care.png" where id=9;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_physiotheraphy.png" where id=6;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_plumber.png" where id=14;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_wedding_planner.png" where id=36;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_yoga.png" where id=40;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_fabrication.png" where id=16;
update service1 set 
icon_img ="nbdimages/serviceicons/ico_photography.png" where id=48;


UPDATE service1   SET img_url = REPLACE(img_url, '.png', '.jpg');




ALTER TABLE `order_info1` 
CHANGE COLUMN `ownername` `ownername` VARCHAR(210) NULL DEFAULT NULL ;

ALTER TABLE `order_info1` 
CHANGE COLUMN `contact_number` `contact_number` VARCHAR(210) NULL DEFAULT NULL ;

DROP TABLE IF EXISTS `coupon1`;
CREATE TABLE `coupon1` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `code` varchar(255) NOT NULL,
 `percentage` varchar(255) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
 `service_id` int(11) NOT NULL DEFAULT '0',
 PRIMARY KEY (`id`)
)  ;



DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ;

INSERT INTO `users` VALUES (1,'2015-12-01 03:34:08','2016-01-08 16:40:53','admin','admin!123'),(2,'2016-01-05 22:35:59','2016-01-05 17:16:06','nestaway','nest1212'),(3,'2015-12-08 10:54:59','2015-12-08 10:54:59','aurospace','auro1212'),(4,'2015-12-08 14:25:30','2015-12-08 14:25:30','live flats','live1212'),(5,'2015-12-09 12:03:22','2015-12-11 07:58:31','zenify','zen1212'),(6,'2015-12-11 13:29:46','2015-12-11 13:29:46','bhavana','bhav1212'),(7,'2015-12-11 13:30:35','2015-12-11 13:30:35','atto communic','atto1212'),(8,'2015-12-11 13:31:00','2015-12-11 13:31:00','zolo','zolo1212'),(9,'2015-12-11 13:31:27','2015-12-11 13:31:27','bellavista','bella1212'),(10,'2016-01-04 13:24:04','2016-01-04 13:24:04','Home Shikari','auro1212'),(11,'2016-01-04 13:24:26','2016-01-04 13:24:26','SimplyGuest','auro1212'),(12,'2016-01-04 13:24:57','2016-01-04 13:24:57','Wishup','auro1212'),(13,'2016-01-04 13:25:19','2016-01-04 13:25:19','Atto Commuinc','auro1212'),(14,'2016-01-04 13:25:33','2016-01-04 13:25:33','Property Care','auro1212'),(15,'2016-01-04 13:25:50','2016-01-04 13:25:50','Next Solution','auro1212'),(16,'2016-01-04 13:26:25','2016-01-04 13:26:25','Sri Sai PG','auro1212'),(17,'2016-01-04 13:26:53','2016-01-04 13:26:53','DSR new PG','auro1212'),(18,'2016-01-04 13:27:19','2016-01-04 13:27:19','Madusudhan PG','auro1212'),(19,'2016-01-04 13:27:46','2016-01-04 13:27:46','SriMaruthi PG','AURO1212'),(20,'2016-01-04 13:28:09','2016-01-04 13:28:09','Divya PG ','AURO1212'),(21,'2016-01-04 13:28:39','2016-01-04 13:28:39','OM Sri venkat','auro1212'),(22,'2016-01-04 13:29:01','2016-01-04 13:29:01','Anish Bhargav','auro1212'),(23,'2016-01-04 13:29:26','2016-01-04 13:29:26','Kamal kuteera','auro1212'),(24,'2016-01-04 13:29:54','2016-01-04 13:29:54','Anjali PG ','auro1212'),(25,'2016-01-04 13:30:13','2016-01-04 13:30:13','Sri Meghana ','auro1212'),(26,'2016-01-04 13:30:28','2016-01-04 13:30:28','happy homes','auro1212'),(28,'2015-12-01 03:34:08','2016-01-05 17:15:41','Bhawani Enter','auro1212'),(29,'2016-01-08 10:49:07','2016-01-08 10:49:07','operation','auro1212');






DROP TABLE IF EXISTS `user_role1`;

CREATE TABLE `user_role1` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `userId` int(11)  NOT NULL DEFAULT '0',
 `roleId` int(11)  NOT NULL DEFAULT '0',
  
 PRIMARY KEY (`id`)
) ;


INSERT INTO `user_role1` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,2),(10,10,2),(11,11,2),(12,12,2),(13,13,2),(14,14,2),(15,15,2),(16,16,2),(17,17,2),(18,18,2),(19,19,2),(20,20,2),(21,21,2),(22,22,2),(23,23,2),(24,24,2),(25,25,2),(26,26,2),(28,28,2),(29,29,1);



INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ('auro30', 30, 0, 9);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 14);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 13);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 4);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 15);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 12);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 10);

INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ('auro30', 30, 0, 6);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 34);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 3);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 45);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 40);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 11);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 7);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 16);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 32);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 36);
INSERT INTO `coupon1` ( `code`, `percentage`, `price`, `service_id`) VALUES ( 'auro30', 30, 0, 44);

UPDATE order_info1
SET appointment_date=DATE_FORMAT(appointment_date,'2015-%m-%d') where year(appointment_date)<2015;
