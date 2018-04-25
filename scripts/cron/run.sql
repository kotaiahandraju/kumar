insert ignore  into service_unit_happiness ( created_time , service_unit_id, served_number, happiness ) (select now(), service_unit_id, count(order_id) + 1, 80 from order_service_unit1 group by service_unit_id );
insert ignore into service_unit_happiness ( created_time, service_unit_id, happiness ) (select now(), service_unit_id , avg(happiness) from order_happiness group by service_unit_id);
update service_unit_happiness suh, service_unit1 su set suh.vendor_id = su.vendor_id where suh.service_unit_id = su.id;

insert ignore into service_unit_happiness (created_time, service_unit_id, happiness, time_to_serve,served_number) (select now(), id, 75, 3, 1 from service_unit1);

