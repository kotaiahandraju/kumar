alter table service_unit1 add column active tinyint(1) default 1; 

alter table vendor1 modify column map_icon varchar(100) null default null;

alter table vendor1 modify column photograph varchar(100) null;

 alter table service_unit1 add column is_admin_order tinyint(1) default 0;


alter table vendor1 add column password varchar(100) not null default "abc12345" ;

