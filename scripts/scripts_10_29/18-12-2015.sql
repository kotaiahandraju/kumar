alter table order_info1 add column no_bhk varchar(30) default null;
alter table order_info1 add column completionDate DATETIME  default null;
alter table order_info1 add column billingto varchar(30) default null;

alter table order_info1 add column ownername varchar(30) default null;

 /*  update location1 set is_dummy=0 where display_order=26;
update location1 set display_order=25 where name ="Hyderabad";
update location1 set display_order=26 where name ="Coming Soon"; */

