/*
-- Query: SELECT * FROM java.vendor_status
LIMIT 0, 1000

-- Date: 2015-12-05 13:49
*/
create table vendor_status( id int(20) not null auto_increment, statusname varchar(50) ,primary key(id));
INSERT INTO `vendor_status` (`id`,`statusname`) VALUES (1,'Rescheduled 1st time');
INSERT INTO `vendor_status` (`id`,`statusname`) VALUES (2,'Rescheduled 2st time');
INSERT INTO `vendor_status` (`id`,`statusname`) VALUES (3,'Work order form submitted');
INSERT INTO `vendor_status` (`id`,`statusname`) VALUES (4,'Paid');
INSERT INTO `vendor_status` (`id`,`statusname`) VALUES (5,'Visited');
INSERT INTO `vendor_status` (`id`,`statusname`) VALUES (6,'Cancelled');

 alter table order_info1 add column vendor_status int(20) default 0;
