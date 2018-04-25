  alter table location1 add column `latitude` double DEFAULT '0',
  add column `longitude` double DEFAULT '0';

  alter table service1 add column `keywords` varchar(500);
  alter table service1 modify  column `description` varchar(500);
   alter table coupon modify column vendor_code varchar(255) null;
alter table service_unit1 drop column is_admin_order;
alter table order_info1 add column is_admin_order int(1) default 0;

alter table order_status_log1 add column vendor_id int(11) ;
update order_info1 oi1, order_status_log1 osl set osl.vendor_id = oi1.vendor_id where osl.order_id = oi1.id;
alter table vendor1  modify column password varchar(100) ;

 update service_unit_vendor set final_price = price ;
 update service_unit1 set img_url = concat( replace (SUBSTRING_INDEX(img_url, '/', 2), '/' , ' '), substring(img_url ,11));
 update service_unit1 set img_url = trim(img_url);
  update service_unit_happiness set served_number =1;