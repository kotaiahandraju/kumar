insert into service1 (name, created_time) values ( 'Autospa', now());
update service1 set display_order = 30 where name = 'Autospa';
update service1 set is_bold = 1 , active =1 where name = 'Autospa';

update service1  set name = 'Auto Spa' where name = 'Autospa' ; 
update category1  set name = 'Auto Spa' where name = 'Autospa' ; 

update service1 set display_order = display_order + 1 where display_order > 35;

update service1 set display_order = 36 where name = 'Carpet Cleaning';


update service_unit1 set price = 2500.00 where id = 1064;

 update service_unit1 set price = 5000.00 where id = 1065;

 update service_unit1 set price = (15*580.00) where id = 1066;

 update service_unit1 set price = (20*660.0) where id = 1067;


 update service_unit1  set discount_price = (discount/100)* price;

 update service_unit1  set final_price = price - discount_price;

