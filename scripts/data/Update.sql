/*  PhysioTherapy new packages Start    */

insert into vendor1( first_name,address,mobile_number) values ("Balance physio clinic","no31/18,loyala layout,ward 3 shanthala town","9019796808");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Balance physio clinic " and s.name = 'PhysioTherapy'); 


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Quick Heal - Sports Injury", "5 days Physiotherapy at your home for fast recovery from sports injury", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Balance physio clinic" and s.name = 'PhysioTherapy');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Speedy Relief - Back Pain ", "10 day  package for working professions for back pain ", 4000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Balance physio clinic" and s.name = 'PhysioTherapy');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Back on track - Post orthopedic surgery", "15 days for any post orthopedic operated patient", 6000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Balance physio clinic" and s.name = 'PhysioTherapy');

/*  Yoga new packages start   */

insert into vendor1( first_name,last_name,address,mobile_number) values ('Shivakumar','P','C204 Brebcekestia,kaikondarhalli,sarjarpur Main rd','9980802351');
insert into vendor1( first_name,address,mobile_number) values ("Rothi Rai",'N0 67,2nd cross 5th main DRC post btindavannagar taverekere','8446609710');

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Shivakumar" and v.last_name = "P" and s.name = 'Yoga'); 
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Rothi Rai" and s.name = 'Yoga'); 


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Stress buster", "Yoga Classses for individuals 2 days per week 8 classes per month",3200.00, 5 from vendor1 v, service1 s where v.first_name = "Shivakumar" and v.last_name = "P" and s.name = 'Yoga');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Mind relax ", "Yoga Classses for individuals 3 days per week 12 classes per month",3600.00, 5 from vendor1 v, service1 s where v.first_name = "Shivakumar" and v.last_name = "P" and s.name = 'Yoga');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Small Group of 5 members", "Yoga classes for group of 5 people. Yoga classes for 2 days in a week and 8 classes per month per person  ",1000.00, 5 from vendor1 v, service1 s where v.first_name = "Shivakumar" and v.last_name = "P" and s.name = 'Yoga');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Medium Group of 10 members", "Yoga classes for group of 10 people. Yoga classes for 2 days in a week and 8 classes per month per person  ",1000.00, 5 from vendor1 v, service1 s where v.first_name = "Shivakumar" and v.last_name = "P" and s.name = 'Yoga');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "large Group of 15 members", "Yoga classes for group of 15 people. Yoga classes for 2 days in a week and 8 classes per month per person  ",1275.00, 5 from vendor1 v, service1 s where v.first_name = "Shivakumar" and v.last_name = "P" and s.name = 'Yoga');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Platinum ", "Yoga classes for group of 5 people. Yoga classes for 3 days in a week and 12 classes per month per person  ",1200.00, 5 from vendor1 v, service1 s where v.first_name = "Shivakumar" and v.last_name = "P" and s.name = 'Yoga');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Gold ", "Yoga classes for group of 10 people. Yoga classes for 3 days in a week and 12 classes per month per person  ",1020.00, 5 from vendor1 v, service1 s where v.first_name = "Shivakumar" and v.last_name = "P" and s.name = 'Yoga');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "silver ", "Yoga classes for group of 15 people. Yoga classes for 3 days in a week and 12 classes per month per person  ",900.00, 5 from vendor1 v, service1 s where v.first_name = "Shivakumar" and v.last_name = "P" and s.name = 'Yoga');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Fitness freek", "Yoga for individuals 5 days per week for 20 days ",4000.00, 5 from vendor1 v, service1 s where v.first_name = "Rothi Rai" and s.name = 'Yoga');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Special Treatment ", "Special Yoga Treatment for individuals ",6500.00, 5 from vendor1 v, service1 s where v.first_name = "Rothi Rai" and s.name = 'Yoga');



/*   curo live    */

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'PhysioTherapy');



insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Quick Heal - Sports Injury", "5 Days Physiotherapy Package for Sports Injury at your Doorstep for a Fast Recovery", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Speedy Relief - Back Pain ", "10 Days Package for Back Pain for Working Professionals", 3200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Back on Track - Post Orthopedic Surgery", "15 Days Package for any Post Orthopedic Operated Patient", 6000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'PhysioTherapy');







