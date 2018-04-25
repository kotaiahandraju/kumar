DROP TABLE IF EXISTS `order_status_log2`;
CREATE TABLE `order_status_log2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
	`updated_time` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `order_id` int(11) ,
  `status_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The list of statuses for an order';

ALTER TABLE  `order_status_log2` ADD UNIQUE (
`order_id` 
);

insert ignore  into order_status_log2 (select * from order_status_log1 order by created_time desc);

update order_info1 oi , order_status_log2 lol2 set oi.status_id = lol2.status_id where oi.id = lol2.order_id;
