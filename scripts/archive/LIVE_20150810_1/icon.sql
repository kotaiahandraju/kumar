update vendor1 v1, vendor_service1 vs1, service1 s1, category1 c1 set v1.map_icon = concat ( '/images/ico/mapicon/map_', lower(c1.name),'.png')  where vs1.vendor_id = v1.id and vs1.service_id = s1.id and c1.id = s1.parent_category;

UPDATE vendor1 SET map_icon = REPLACE(map_icon, ' ', '_') WHERE map_icon LIKE '% %';

update service1 set name = trim(name);
update category1 set name = trim(name);

update service1 set img_url  = concat ( '/images/ico/mapicon/srv_', lower(name),'.png')  ;
UPDATE service1 SET img_url = REPLACE(img_url, ' ','_') WHERE img_url LIKE '% %';

update  category1 ss1 set ss1.img_url  = concat ( 'nbdimages/mobile/', lower(ss1.name),'.png')  ;
UPDATE category1 SET img_url = REPLACE(img_url, ' ', '_') WHERE img_url LIKE '% %';


update vendor1 v1, vendor_service1 vs1, service1 s1
set v1.map_icon = concat ( '/images/ico/mapicon/map_', lower(s1.name),'.png')  
where vs1.vendor_id = v1.id and vs1.service_id = s1.id;

UPDATE vendor1 SET map_icon = REPLACE(map_icon, ' ', '_') WHERE map_icon LIKE '% %';




update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/electrician/electrician_fan.jpg' where su.service_id = s.id and s.name ='Electrician'
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/car_detailing/cardetailing_all.jpg' where su.service_id = s.id and s.name ='Car Detailing';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/carpentry/carpentry_carpentry.jpg' where su.service_id = s.id and s.name ='Carpentry';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/carpet_cleaning/carpet_cleaning.jpg' where su.service_id = s.id and s.name ='Carpet Cleaning';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/cs/cs_partner.jpg' where su.service_id = s.id and s.name ='CS';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/dietician/dietitian_beginner.jpg' where su.service_id = s.id and s.name ='Dietician';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/electronics_repair/electronics_desktop.jpg' where su.service_id = s.id and s.name ='Electronics Repair';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/fabrication/fabrication_gate.jpg' where su.service_id = s.id and s.name ='Fabrication';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/home_appliance_repair/home_appliances_blank.jpg' where su.service_id = s.id and s.name ='Home Appliance Repair';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/home_care_taker/home_care_taker_bronze.jpg' where su.service_id = s.id and s.name ='Home Care Taker';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/home_cleaning/homecleaning_clean.jpg' where su.service_id = s.id and s.name ='Home cleaning';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/mobile_repair_service/mobile_boost.jpg' where su.service_id = s.id and s.name ='Mobile Repair Service';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/nursing_care/nursing_care_bronze.jpg' where su.service_id = s.id and s.name ='Nursing Care';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/painter/painting_grill.jpg' where su.service_id = s.id and s.name ='Painter';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/pathology/package_five.jpg' where su.service_id = s.id and s.name ='Pathology';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/pest_control/pest_control_bed_bug.jpg' where su.service_id = s.id and s.name ='Pest Control';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/pet_care/petcare_dog_bath.jpg' where su.service_id = s.id and s.name ='Pet Care';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/photography/photography_one.jpg' where su.service_id = s.id and s.name ='Photography';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/physiotherapy/physiotherapy_back.jpg' where su.service_id = s.id and s.name ='PhysioTherapy';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/plumber/plumber_fixing.jpg' where su.service_id = s.id and s.name ='Plumber';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/wedding_planner/wedding_planner_premium.jpg' where su.service_id = s.id and s.name ='Wedding Planner';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/yoga/yoga_first.jpg' where su.service_id = s.id and s.name ='Yoga';
update service_unit1 su, service1 s set su.img_url='/nbdimages/mobile/package/car_detailing/cardetailing_clean.jpg' where su.service_id = s.id and s.name ='Car Detailing';
