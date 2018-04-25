/*      Nursing packages      */

insert into vendor1( first_name,address,mobile_number) values ("Sumukha","S J Elegence, No. 477, 45th Cross Rd, 8th Block, Jayanagar, Bengaluru, Karnataka 560070","9880024265");
insert into vendor1( first_name,address,mobile_number) values ("Curo Live"," Kristal Tavern, Bellandur Main Road, Bengaluru, Karnataka 560103","9886507410");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Nursing Care'); 
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name ='Nursing Care'); 


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Nursing Care ", "Qualified Nurses for 24 hours NOTE The price may change according to the patient condition", 26000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold Nuring Care  ", "Qualified Nurses for Day Duty NOTE The price may change according to the patient condition", 22000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze Nursing Care", "Half a Day Nursing Services", 715.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze Nursing Care", "12 Hours  Nursing Services",935.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze Nursing Care", "24 Hours Nursing Services",1375.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "silver Nursing Care", "15 Days 12 Hours Nursing Services", 9360.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "silver Nursing Care", "15 Days 24 Hours Nursing Services",11520.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Nursing Care", "1 Month 12 Hours Nursing Services",16520.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Gold Nursing Care ", "1 Month 24 Hours Nursing Services",20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');

update service1 set page_name='pathologyOrder' where name='Nursing Care';


/*      PhysioTherapy packages      */


insert into vendor1( first_name,address,mobile_number) values ("Spectrum","#p103 9th main sector12, LIC colony ","9845275324");
insert into vendor1( first_name,address,mobile_number) values ("Optra Care","285, 11th Main Road, Koramangala 4 Block, Koramangala, Bengaluru, Karnataka","9886150724");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'PhysioTherapy'); 
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Optra Care" and s.name = 'PhysioTherapy'); 

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Quick Heal - Sports Injury", "5 Days Physiotherapy Package for Sports Injury at your Doorstep for a Fast Recovery ", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Spectrum" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Speedy Relief - Back Pain", "10 Days Package for Back Pain for Working Professionals ",500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Spectrum" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Back on Track - Post Orthopedic Surgery", "15 Days Package for any Post Orthopedic Operated Patient",580.00, 5.00 from vendor1 v, service1 s where v.first_name = "Spectrum" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Perfect Recovery -  Neuro Rehabilitation", "20 Days Package for Neuro Rehabilitation ",660.00, 5.00 from vendor1 v, service1 s where v.first_name = "Spectrum" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Quick Heal - Sports Injury", "5 Days Physiotherapy Package for Sports Injury at your Doorstep for a Fast Recovery ", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Optra Care" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Speedy Relief - Back Pain", "10 Days Package for Back Pain for Working Professionals", 5000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Optra Care" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Back on Track - Post Orthopedic Surgery", "15 Days Package for any Post Orthopedic Operated Patient", 7500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Optra Care" and s.name = 'PhysioTherapy');

update service1 set page_name='pathologyOrder' where name='PhysioTherapy';


/*      jack on block services for carpenter,electrician,plumber and pest control         */


insert into vendor1( first_name ,address,mobile_number) values ("Jack On Block","#9, 1st Main, 1st Cross, LIC Colony,Jayanagar,3rd Block, Bangalore, Karnataka 560011","9538812399");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Plumber');

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Capentry work for 1 Hour", "Capentry work for 1 Hour", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Capentry work for 90 Minutes", "Capentry work for 90 Minutes", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Capentry work for 0-120 Minutes", "Capentry work for 0 to 120 Minutes", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Capentry work for 0-180 Minutes", "Capentry work for 0 to 180 Minutes", 1050.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Electricianwork for 1 Hour ", "Electricianwork for 1 Hour", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Electrician work for 0-90 Minutes", "Electrician work for 0 to 90 Minutes", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Electrician work for 0-120 Minutes", "Electrician work for 0 to 120 Minutes", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Electrician work for 0-180 Minutes", "Electrician work for 0 to 180 Minutes", 1050.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Plumbing work for 1 Hour", "Plumbing work for 1 Hour", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Plumbing work for 0-90 Minutes", "Plumbing work for 0 to 90 Minutes", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Plumbing work for 0-90 Minutes", "Plumbing work for 0 to 90 Minutes", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1 BHK Bed Bugs GEL", "1 BHK Bed Bugs GEL", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "2 BHK Bed Bugs GEL", "2 BHK Bed Bugs GEL", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 BHK Bed Bugs GEL", "3 BHK Bed Bugs GEL", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "4 BHK Bed Bugs GEL", "4 BHK Bed Bugs GEL", 1600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1 BHK Bed Bugs SPRAY", "1 BHK Bed Bugs SPRAY", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "2 BHK  Bed Bugs SPRAY", "2 BHK  Bed Bugs SPRAY", 800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 BHK  Bed Bugs SPRAY", "3 BHK  Bed Bugs SPRAY", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "4 BHK  Bed Bugs SPRAY", "4 BHK  Bed Bugs SPRAY", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1 BHK Termites GEL", "1 BHK Termites GEL", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "2 BHK Termites GEL", "2 BHK Termites GEL", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 BHK Termites GEL", "3 BHK Termites GEL", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "4 BHK Termites GEL", "4 BHK Termites GEL", 1600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1 BHK Termites SPRAY", "1 BHK Termites SPRAY", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "2 BHK Termites SPRAY", "2 BHK Termites SPRAY", 800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 BHK Termites SPRAY", "3 BHK Termites SPRAY", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name,price, discount)
( select v.id , s.id , "4 BHK Termites SPRAY", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Carpentry work", "With Material Price Based On Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Lakshman" and v.last_name = "Ram" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Carpentry work", "With Material Price Based On Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ramu" and v.last_name = "Charan" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Carpentry work", "Without Material Price Based On Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ramu" and v.last_name = "Charan" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Small Carpentry work", "Carpentry work such as Table Repair fixing Tower Bolts etc (Starting from Rs. 500)", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Lakshman" and v.last_name = "Ram" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Small Carpentry work", "Carpentry work such as Table Repair fixing Tower Bolts etc (Starting from Rs. 500)", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ramu" and v.last_name = "Charan" and s.name = 'Carpentry');


update service1 set page_name='pathologyOrder' where name='Pest Control';

update service1 set page_name='pathologyOrder' where name='Plumber';

update service1 set page_name='pathologyOrder' where name='Electrician';

update service1 set page_name='pathologyOrder' where name='Carpentry';



/* Painter packages*/


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "royal luxury emulsion Per Sq Ft", 16.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "ICI stain paint Per Sq Ft", 22.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "ICI finex paint Per Sq Ft", 38.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "royal shine luxury emulsion Per Sq Ft", 22.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "royal fintex Per Sq Ft", 38.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "Lusture zinc paint Per Sq Ft", 44.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "permium lixury emulsion Per Sq Ft", 9.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "Tractor Emulsion Per Sq Ft", 6.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (with out material)", "Exterior soft finish Per Sq Ft", 6.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (with out material)", "Asian apex paint Per Sq Ft", 6.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (with out material)", "Asian apex ultima paint Per Sq Ft", 6.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "royal luxury emulsion Per Sq Ft", 27.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "ICI stain paint Per Sq Ft", 33.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "ICI finex paint Per Sq Ft", 49.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "royal shine luxury emulsion Per Sq Ft", 38.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "royal fintex Per Sq Ft", 52.80, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "Lusture zinc paint Per Sq Ft", 71.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "permium lixury emulsion Per Sq Ft", 18.70, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "Tractor Emulsion Per Sq Ft", 16.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (With Material)", "Exterior soft finisf Per Sq Ft", 60.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (With Material)", "Asian apex paint Per Sq Ft", 15.40, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (With Material)", "Asian apex ultima paint Per Sq Ft", 14.30, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "French Poolish including 1/2 to 6 inch beeding", 58.30, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "Melamyne Poolish including 1/2 to 6 inch beeding", 77.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "PU Poolish including 1/2 to 8 inch beeding", 77.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "ItalianPU Poolish including 1/2 to 8 inch beeding", 181.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "MRF PU Poolish including 1/2 to 8 inch beeding", 132.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "DUCO paint including 1/2 to 6  inch beeding", 187.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "lamination(poly coat) including 1/2 to 6  inch beeding", 368.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "French Poolish including 1/2 to 6 inch beeding", 88.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "Melamyne Poolish including 1/2 to 6 inch beeding", 115.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "PU Poolish including 1/2 to 8 inch beeding", 192.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "ItalianPU Poolish including 1/2 to 8 inch beeding", 297.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "MRF PU Poolish including 1/2 to 8 inch beeding", 242.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "DUCO paint including 1/2 to 6  inch beeding", 352.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "lamination(poly coat) including 1/2 to 6  inch beeding", 542.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "wood painting", 16.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "wood painting", 11.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood paintng (with material )", "wood painting", 27.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood paintng (with material )", "wood painting", 20.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Grill painting (with out material)", "Grill painting", 9.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Grill painting (with out material)", "Grill painting spray",77.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Grill painting with material", "Grill painting",16.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Grill painting with material", "Grill painting spray",132.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Exterior repainting (with out material)", "apex ultima",6.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Exterior repainting (with out material)", "ace paint",6.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Exterior repainting (with out material)", "cement base paint",3.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Exterior repainting (with out material)", "distemper wall paint",4.80, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior repainting with material", "apex ultima",9.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior repainting with material", "ace paint",9.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior repainting with material", "cement base paint",8.40, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior repainting with material", "distemper wall paint",7.20, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');


update service1 set page_name='pathologyOrder' where name='Painter';



/* Plumber packages */



insert into vendor1( first_name, last_name,address,mobile_number ) values ("Ranganath", "R","No.20, Laksmi Narasimha Nilaya, 1st Main Road, Uttaralli","9902196449");


insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Tap Fixing", "Any tap fixing in home", 300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Tap Fixing", "Any tap fixing in home", 300.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Tap Fixing", "Any tap fixing in home", 280.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Tap Fixing", "Any tap fixing in home", 130.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Bathroom Fixtures Replacement", "Bathroom Pusset Shower", 300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Bathroom Fixtures Replacement", "Bathroom Pusset Shower", 300.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Bathroom Fixtures Replacement", "Bathroom Pusset Shower", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Bathroom Fixtures Replacement", "Bathroom Pusset Shower", 130.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wall Tap Mixer Fitting", "Hot And Cold Mixer", 360.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wall Tap Mixer Fitting", "Hot And Cold Mixer", 360.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wall Tap Mixer Fitting", "Hot And Cold Mixer", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wall Tap Mixer Fitting", "Hot And Cold Mixer", 400.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Indian Type Commode Fixing", "Replacing Old Commode", 1410.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Indian Type Commode Fixing", "Replacing Old Commode", 1410.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Indian Type Commode Fixing", "Replacing Old Commode", 750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Indian Type Commode Fixing", "Replacing Old Commode", 1700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Indian Type Commode Fixing", "Fixing New Commode", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Indian Type Commode Fixing", "Fixing New Commode", 2400.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wall Mount Commode Fixing", "Replacing Old Commode", 2200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wall Mount Commode Fixing", "Replacing Old Commode", 2200.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wall Mount Commode Fixing", "Replacing Old Commode", 1750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wall Mount Commode Fixing", "Replacing Old Commode", 800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Motor Fixing", "Replacing Old Water Motor", 1800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Motor Fixing", "Replacing Old Commode", 1800.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Motor Fixing", "Replacing Old Commode", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Motor Fixing", "Replacing Old Commode", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Floor Mout Commode", "Replacing Old Water Motor iprice decided on inspection", 250.00,5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Floor Mout Commode", "Replacing Old Water Motor iprice decided on inspection", 250.00,5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Floor Mout Commode", "Replacing Old Water Motor iprice decided on inspection", 250.00,5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Floor Mout Commode", "Replacing Old Water Motor", 800.00,5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe Fixing", "Pipe Fixing price decided on Inspection", 250.00,5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe Fixing", "Pipe Fixing price decided on Inspection", 250.00,5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe Fixing", "Pipe Fixing price decided on Inspection", 250.00,5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe Fixing", "Pipe Fixing price decided on Inspection", 220.00,5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Tank Cleaning", "500 - 1500 ltrs", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Tank Cleaning", "500 - 1500 ltrs", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Tank Cleaning", "500 - 1500 ltrs", 260.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Tank Cleaning", "500 - 1500 ltrs", 340.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Tank Cleaning", "2000 - 5000 ltrs", 1440.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Tank Cleaning", "2000 - 5000 ltrs", 1440.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Tank Cleaning", "2000 - 5000 ltrs", 480.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Tank Cleaning", "2000 - 5000 ltrs", 340.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump Tank Cleaning", "Underground Upto 4000 ltrs", 1800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump Tank Cleaning", "Underground Upto 4000 ltrs", 1800.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump Tank Cleaning", "Underground Upto 4000 ltrs", 600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump Tank Cleaning", "Underground 4500 to 10000", 1800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump Tank Cleaning", "Underground 4500 to 10000", 1800.00, 5.00 from vendor1 v, service1 s where v.first_name ="K.V" and v.last_name = "Murthy"and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump Tank Cleaning", "Underground 4500 to 10000", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name ="Bala" and v.last_name = "krishna"and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump Tank Cleaning", "Underground 4500 to 10000", 800.00, 5.00 from vendor1 v, service1 s where v.first_name ="Ranganath" and v.last_name = "R"and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wash Basin / Sink Fitting", "Replacing Sink and Wash Basin", 600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wash Basin / Sink Fitting", "Replacing Sink and Wash Basin", 600.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wash Basin / Sink Fitting", "Replacing Sink and Wash Basin Price Based  On ispection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Wash Basin / Sink Fitting", "Replacing Sink and Wash Basin", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Proof Leaking", "Water Proof Leaking Price Based  On ispection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Proof Leaking", "Water Proof Leaking Price Based  On ispection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Proof Leaking", "Water Proof Leaking Price Based  On ispection", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Proof Leaking", "Water Proof Leaking Price Based  On ispection", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rain Water Pipe Fixing", "Fixing a Pipe For Rain Water Harvesting price based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rain Water Pipe Fixing", "Fixing a Pipe For Rain Water Harvesting price based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name ="K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rain Water Pipe Fixing", "Fixing a Pipe For Rain Water Harvesting price based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name ="Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rain Water Pipe Fixing", "Fixing a Pipe For Rain Water Harvesting price based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name ="Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kitchen Slab Fixing", "Fixing a Slab price based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kitchen Slab Fixing", "Fixing a Slab price based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kitchen Slab Fixing", "Fixing a Slab price based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kitchen Slab Fixing", "Fixing a Slab price based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Overhead Tank Fixing", "Replacing & Fixing", 720.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Overhead Tank Fixing", "Replacing & Fixing", 720.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Overhead Tank Fixing", "Replacing & Fixing", 1400.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Overhead Tank Fixing", "Replacing & Fixing", 850.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Solar Service", "Solar Cleaning", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Solar Service", "Solar Cleaning", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Solar Service", "Solar Cleaning", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Solar Service", "Solar Cleaning", 850.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Solar Service", "Chemical Service", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Solar Service", "Chemical Service", 2200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');



insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe Fixing ( GI) - Iron", "Pipe Fixing ( GI) - Iron Per Sq Ft", 220.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "Plumber" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe Fitting", "Pvc, Cvpc Per Sq Ft Price Based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe Fitting", "Pvc, Cvpc Per Sq Ft Price Based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe Fitting", "Pvc, Cvpc Per Sq Ft Price Based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe Fitting", "Pvc, Cvpc Per Sq Ft Price Based on Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe fixing ( Jindal)", "per Sq Ft Price Based On inspection ", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe fixing ( Jindal)", "per Sq Ft Price Based On inspection ", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe fixing ( Jindal)", "per Sq Ft Price Based On inspection ", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pipe fixing ( Jindal)", "per Sq Ft Price Based On inspection ", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "new wash basin fitting", "fitting a new wash basin", 450.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "new wash basin fitting", "fitting a new wash basin", 520.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Steel Sink Fixing", "New Fixing", 650.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Steel Sink Fixing", "New Fixing", 440.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bathroom Flash Tank", "Repair", 160.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bathroom Flash Tank", "Repair", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Casade Fkush Tank", "Repair Price decided On Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Casade Fkush Tank", "Repair Price decided On Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Casade Fkush Tank", "Repair", 750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Casade Fkush Tank", "Repair", 320.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Flush Wall Services", "Repair Price decided On Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Flush Wall Services", "Repair Price decided On Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Flush Wall Services", "Repair", 750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Flush Wall Services", "Repair", 420.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Concealed Flush Tank Services", "Repair Price decided On Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Concealed Flush Tank Services", "Repair Price decided On Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Concealed Flush Tank Services", "Repair", 750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Concealed Flush Tank Services", "Repair", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');



insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Toilet Floor Tiles Gap", "filling with white cement", 1120.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Toilet Floor Tiles Gap + Seepage Service", "filling with white cement", 1400.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Toilet Floor Tiles Gap", "filling with white cement", 1120.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Western Commode Fixing", "Replacing Commode Price Decided ON Inspection", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Azam" and v.last_name = "Pasha" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Western Commode Fixing", "Replacing Commode", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "K.V" and v.last_name = "Murthy" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Western Commode Fixing", "Replacing Commode", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Western Commode Fixing", "Replacing Commode", 210.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ranganath" and v.last_name = "R" and s.name = 'Plumber');


update service1 set page_name='pathologyOrder' where name='Plumber';


/*                 CS packages Start       */



insert into category1 (name, description,active ) values ("Finance", "Finance",1);
insert into service1(name,parent_category, page_name) (select  "CS", c.id,'pathologyOrder' from category1 c where c.name='Finance');
insert into vendor1( first_name, last_name,address,mobile_number ) values ("Ahelleya  ", "Alka","Koramangala 80 Feet Rd, 5th Block, Koramangala Industrial Layout, Koramangala, Bengaluru, Karnataka 560034","9324930003");
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');
insert into service1 (name,is_bold,active) value("Finance",1,1);


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kick Start Business", "Incorporation of a Private Limited Company with PAN and TAN Rs. 20000 (inclusive of all)", 20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Partners Build Business", "Incorporation of a Limited Liability Partnership (LLP) with PAN & TAN Rs. 15000 (inclusive of all)", 15000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Low Investment & Faster returns", "Shops & Establishment Registration Rs. 7,000 (inclusive of all)", 7000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Register Your Trademark", "Trademark Application Rs. 8,000 (inclusive of all)", 8000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Change of Registered office", "Change of Registered office,Rs.2,500 + Filing Fees", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Change of Registered Office (one state to another)", "Change of Registered Office (one state to another),Rs. 20,000 +Filing Fees+ actual Expenses", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Share Transfers", "Depends on the number of transfer transactions", 250.00, 0.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Change of Company Name", "Change of Name of the company without Changing Main Objects,Rs. 5000 + actual Expenses", 5000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Change of Company Name", "Change of Name of the company with Main Objects,Rs. 7000 + actual Expenses", 7000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Charge Creation /Alteration", "Charge Creation /alteration,Rs. 1500 + Actual Expenses", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Search Reports for Bank", "Search Reports for Bank,Rs. 3000", 3000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Basic Due Diligence based on MCA database", "Basic Due Diligence based on MCA database", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Multiple Financing? report", "Multiple Financing? report", 10000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rights Issue", "Issueing of Rights,Rs. 5000 + Actual Expenses", 5000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Private Placement", "Private Placement,Rs. 10,000+ Actual Expenses", 10000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Annual Filing-Company", "Annual Filing-Company,Rs. 8000 + Actuals", 8000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Annual Filing-LLP", "Annual Filing-LLP,Rs. 2000+ Actuals", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Monthly reatainer- depending on the quantum of work", "Rs.2,000 to Rs.3,500 per month", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');


update service1 set active=1 where name='CS';


/* Fabrication service start*/



update service1 set name='Fabrication' where name='Fabrication(Iron or Alluminium)';
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Railings", "Railings", 154.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Safety Grill", "Railings", 137.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sliding Gate", "Railings", 425.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rolling Shutter", "Railings", 209.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Stainless Railings", "Railings", 1260.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Stainless Gate", "SS Gate", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Window Grill", "Window Grill", 154.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication');

update service1 set page_name='pathologyOrder' where name='Fabrication';


/*  Cleaning services Start   */



insert into category1 (name, description,active ) values ("Home Cleaning", "Home Cleaning",1);

insert into service1(name,parent_category, page_name) (select  "Home cleaning", c.id,'pathologyOrder' from category1 c where c.name='Home Cleaning'); 


insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service1 (name,is_bold,is_dummy,active) values ("Home Cleaning",1,0,1);


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Toilet Cleaning", "One toilet, One Time Cleaning", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Toilet Cleaning", "Two toilets, One Time Cleaning", 2200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "sofa cleaning", "sofa shampooing", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kitchen cleaning", "Kitchen cleaning", 1750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Utility Package", "6 Services of Carpentry, Elecrician & Plumbing. 2 hours per call 12 hours in total", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Toilet Cleaning-3", "3 Toilet cleaning, Rs.2500", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pest Control", "2 Pest Control services valid for One Year Highly Effective on Gel and Spray", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Tank Cleaning", "2 Water Tank Cleaning services valid for One Year", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kitchen Cleaning-2", "2 Kitchen Cleaning services valid for One Year", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "sofa shamooping", "2 Sofa Shamooping  valid for One Year (Hygien and Dust Free)", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-Small", "Sump Cleaning for 0 to 2000 lts", 800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-Medium", "Sump Cleaning for 0 to 4000 lts", 1100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-Large", "Sump Cleaning for 0 to 6000 lts", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-XL", "Sump Cleaning for 0 to 8000 lts", 1800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-XXL", "Sump Cleaning for 0 to 10000 lts", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-Small", "Overhead Tank Cleaning 0 to 500", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-Medium", "Overhead Tank Cleaning 0 to 750", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-Large", "Overhead Tank Cleaning 0 to 1000", 800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-XL", "Overhead Tank Cleaning 0 to 1500", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-XXL", "Overhead Tank Cleaning 0 to 2000", 1100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');


update service1 set active=1 where name='Home cleaning' and is_bold=0;


/* Pest  service start*/


insert into vendor1( first_name,address,mobile_number) values ("Prassana","No 1051, ground floor 7th main3rd block","9620354021");
insert into vendor1( first_name,address,mobile_number) values ("Mohan","# 48, shivashree, 11th mail, sri hari layout jnanajyothi nagar 2nd stage ullal main road Bangalore 560056","9742274855");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval Cockroaches Flying Cockroaches Ants Red and Black For 1 BHK", 605.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval Cockroaches Flying Cockroaches Ants Red and Black For 1 BHK",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval Cockroaches Flying Cockroaches Ants Red and Black For 1 BHK",513.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval Cockroaches Flying Cockroaches Ants Red and Black For 1 BHK",500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rat Rattling", "Rodents (Rats industrial rat poison) For 1 BHK",440.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rat Rattling", "Rodents (Rats industrial rat poison) For 1 BHK",414.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed For 1 BHK",990.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed For 1 BHK",891.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed For 1 BHK",1100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed For 1 BHK",1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosqui ", "MOSQUITO  spray 1 BHK", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosqui ", "MOSQUITO  spray 1 BHK",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosqui", "MOSQUITO Fogging For 1BHK",1320.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Save Your Sugar ", "Ants (Black, Red) For 1 BHK",207.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval CockroachesFlying Cockroaches Ants Red and Black For 2 BHK",715.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval CockroachesFlying Cockroaches Ants Red and Black For 2 BHK",648.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval CockroachesFlying Cockroaches Ants Red and Black For 2 BHK",513.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval CockroachesFlying Cockroaches Ants Red and Black For 2 BHK",650.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rat Rattling ", "Rodents (Rats industrial rat poison) 2 BHK",550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rat Rattling", "Rodents (Rats industrial rat poison) 2 BHK",460.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed 2 BHK",1210.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed 2 BHK",1133.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed 2 BHK",1100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed 2 BHK",1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosqui ", "MOSQUITO  spray 2 BHK",550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosqui", "MOSQUITO  spray 2 BHK",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosqui", "MOSQUITO  fogging 2 BHK",1320.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Save Your Sugar", "Ants (Black Red) 2 BHK",230.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval CockroachesFlying CockroachesAnts red and black 3 BHK",660.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval CockroachesFlying CockroachesAnts red and black 3 BHK",756.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval CockroachesFlying CockroachesAnts red and black 3 BHK",684.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval CockroachesFlying CockroachesAnts red and black 3 BHK",800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rat Rattling", "Rodents (Rats industrial rat poison) 3 BHK",600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rat Rattling", "Rodents (Rats industrial rat poison) 3 BHK",517.5, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster ", "Bed Bugs (tablet canon gas) 24 hours place should be closed 3 bhk,Rs.1540",1540.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed 3 bhk,Rs.1485",1485.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed 3 bhk,Rs.1500",1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed 3 bhk,Rs.1400",1400.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosqui", "MOSQUITO  spray 3 BHK",550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosqui", "MOSQUITO  fogging 3 BHK",1320.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Save Your Sugar", "Ants (Black Red) 3 BHK",258.75, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creepy..Crawly..Gone..", "Oval CockroachesFlying CockroachesAnts red and black 4 BHK",798.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed 4 BHK",2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "The Bug Buster", "Bed Bugs (tablet canon gas) 24 hours place should be closed 4 BHK",2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Buzzy..Fizzy(SMALL) ", "Honey bee (below 10 Ft.)",550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Buzzy..Fizzy (SMALL)", "Honey bee (below 10 Ft.)",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Buzzy..Fizzy (MEDIUM)", "Honey bee (below 10 Ft.)",660.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Buzzy..Fizzy (MEDIUM)", "Honey bee (below 10 Ft.)",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Buzzy..Fizzy(LARGE)", "Honey bee (below 10 Ft.)",990.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Termites per Sq. ft", "TERMITES without smell Rs. Per Sq. Ft",4.40, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Termites per Sq. ft", "TERMITES without smell Rs. Per Sq. Ft",8.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Termites per Sq. ft", "TERMITES with smell Rs. Per Sq. Ft",3.3, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Termites per Sq. ft", "TERMITES with smell Rs. Per Sq. Ft",8.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');


update service1 set page_name='pathologyOrder' where name='Pest Control';



/* Home care packages Start  */

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Home Care Taker');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze Elderly care", "Elderly Care Services for your Loved Ones (12Hours/Day)", 600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze Elderly care", "Elderly Care Services for your Loved Ones (24Hours/Day)", 840.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Elderly care", "Elderly Care Services for your Loved Ones for 1 Week(12Hours/Day)", 3500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Elderly care", "Elderly  Care Services for your Loved Ones for 1 Week(24Hours/Day)",4375.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live"and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Elderly care", "Elderly Care Services for your Loved Ones for 15 Days(12Hours/Day)",7150.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Elderly care", "Elderly Care Services for your Loved Ones for 15 Days(24Hours/Day)",9100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold Elderly care", "Elderly Care Services for your Loved Ones for 1 Month(12Hours/Day)",11700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Elderly care", "Elderly Care Services for your Loved Ones for 1 Month(24Hours/Day)",14950.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold Elderly care", "Elderly Care Services for your Loved Ones NOTE (The Price may change according to the Patient condition)",16000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze Elderly care", "Elderly Care Services for your Loved Ones NOTE (The Price may change according to the Patient condition)",14000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Elderly care", "Elderly Care Services for your Loved Ones for 24 hours NOTE (The Price may change according to the Patient condition)",18000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha"and s.name = 'Home Care Taker');


update service1 set page_name='pathologyOrder' where name='Home Care Taker';


/*       Pet Care Packages Start    */



insert into vendor1( first_name,address,mobile_number) values ("Royal Pet care","No 31, 1st cross,opp R.B.I. layout Water Tank,sriraa layout,Puttenahalli,J.p>Nagar","9986709490");
insert into vendor1( first_name,address,mobile_number) values ("GIRISH","#6,21st BLOCK, NANDI SANKEERNA,ADUGODI,POLICE QTRS,ADUGODI BABGALORE-560030","9739062407");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "Small Dogs PUG POM SHITZU TERRIER Normal", 495.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog Training Per Month", "Dog Traing At Your Home ", 4500.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "Small Dogs PUG POM SHITZU TERRIER Hairy", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog Walking?", "30 mins per month one time", 4000.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "medium Dogs  COCKER BEAGLE LHASA Normal", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog Walking?", "30 min per month 2 times a day", 6500.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "medium Dogs COCKER BEAGLE LHASA Hairy", 595.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bathing", "Only Dog Bath ", 400.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "Large Dogs LAB GSD GOLDEN HUSKY BOXER Normal", 650.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog Grooming", "Grooming And Combing", 400.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "Large Dogs LAB GSD GOLDEN HUSKY BOXER Hairy", 795.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Nail Cliping", "Dog Nail Cliping", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Small Dogs includes bath includeing hair cut nail clip and ear cleaning. Normal", 825.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Vaccinations", "Dog Vaccinations (only handling charges no transportation)", 400.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Medium Dogs includes bath includeing hair cut nail clip and ear cleaning.  Normal",935.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Swimming", "Dog swimming half an hour per day with vehicle", 1100.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Large Dogs includes bath includeing hair cut nail clip and ear cleaning. Normal ", 1090.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Swimming", "Half an hour per day with out vehicle ", 850.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Small Dogs includes bath includeing hair cut nail clip and ear cleaning. Hairy", 825.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Boarding", "Dog Boarding per day with food ", 400.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Medium Dogs includes bath includeing hair cut nail clip and ear cleaning.  Hairy", 1045.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Breeders(puppy)", "one puppy sale", 600.00, 5.00 from vendor1 v, service1 s where v.first_name = "GIRISH" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Large Dogs includes bath includeing hair cut nail clip and ear cleaning. Hairy", 1210.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "XL Dog (BathST.BERNARD ROT GRT DANE) includes bath Nail clip,hair cut and ear  Normal", 1210.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "XL Dog (BathST.BERNARD ROT GRT DANE) includes bath Nail clip,hair cut and ear  Normal", 1430.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Grooming", "Only Grooming no dog bath ", 330.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');



update service1 set page_name='pathologyOrder' where name='Pet Care';


/* Wedding  service start*/


insert into category1 (name, description,active ) values ("Wedding", "Wedding",1);


insert into service1(name,parent_category, page_name) (select  "Wedding Planner", c.id,'pathologyOrder' from category1 c where c.name='Wedding');

insert into vendor1( first_name,address,mobile_number ) values ("Classy Traditions","No 13-7 Shreyas apartment ground floor, atmananda colony main road sultan Bangalore-560032.","9632093971");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Classy Traditions" and s.name = 'Wedding Planner'); 

insert into service1 (name,is_bold,is_dummy,active) values ("Wedding",1,0,1);


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Short and Sweet Wedding ", "Your Wedding Includes Veg Catering Decoration Invitation Photography Honey Moon packages Return Gifts Electricity charges and much more(starts from the given price)", 300000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Classy Traditions" and s.name = 'Wedding Planner');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Premium Wedding ", "Your Wedding Includes Veg Catering Decoration Invitation Photography Honey Moon packages Return Gifts Electricity charges and much more(starts from the given price)", 800000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Classy Traditions" and s.name = 'Wedding Planner');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Royal Wedding ", "Your Wedding Includes Veg Catering Decoration Invitation Photography Honey Moon packages Return Gifts Electricity charges and much more(starts from the given price)", 1500000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Classy Traditions" and s.name = 'Wedding Planner');

update service1 set display_order='36' where is_bold=1 and name='Wedding';
update service1 set display_order='37' where name='Wedding Planner' and is_bold=0;
update service1 set active=1 where name='Wedding Planner';


/* electrician vendor insert  */

insert into vendor1( first_name,last_name,address,mobile_number) values ("Masood", "Pasha k","Bharti nagar,k.kamraj road","9740064074");


insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Masood" and v.last_name = "Pasha k" and s.name = 'Electrician');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Fan Fixing", "New Fan Fixing",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Tube Light Fixing and Replacement", "New Tube Light Fixing and Replacement",180.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fan Point With Regulator Switch & Wiring", "Fan Point With Regulator Switch & Wiring",700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Earthing Including Labor Max 5 Ft.", "Earthing Including Labor Max 5 Ft.",3300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Only UPS Wiring ", "Only UPS Wiring  price on inspection ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Light Simple Fitting", "Light Simple Fitting",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Single phase meter board ( With cable fixing and digging )", "Single phase meter board ( With cable fixing and digging )",1650.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 Phase ( meter board fixing  cable fixing meter fixing 4 pole mcb )", "3 Phase ( meter board fixing  cable fixing meter fixing 4 pole mcb )",1925.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Panel board Fitting", "Panel board Fitting price decided on inspection ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Lighting Circuit", " (2.5per Sq. mm) with pipe setting inpection price ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Heating Circuit", "(4.0 Sq. mm) (Oven a/C geezer hub chimney point)  with pipe setting Inspection Price",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1kva installing", "1kva installing",1320.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fan Wall Mounting", "Fan Wall Mounting",180.00, 5.00 from vendor1 v, service1 s where v.first_name = "Selva" and s.name = 'Electrician');  


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Fan Fixing", "New Fan Fixing",163.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Tube Light Fixing and Replacement", "New Tube Light Fixing and Replacement",157.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fan Point With Regulator Switch & Wiring", "Fan Point With Regulator Switch & Wiring",650.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Only UPS Wiring ", "Only UPS Wiring  price on inspection ",250.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Light Simple Fitting", "Light Simple Fitting",250.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Single phase meter board ( With cable fixing and digging )", "Single phase meter board ( With cable fixing and digging )",1250.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 Phase ( meter board fixing  cable fixing meter fixing 4 pole mcb )", "3 Phase ( meter board fixing  cable fixing meter fixing 4 pole mcb )",1875.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Panel board Fitting", "Panel board Fitting price decided on inspection ",250.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Lighting Circuit", " (2.5per Sq. mm) with pipe setting inpection price ",250.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Heating Circuit", "(4.0 Sq. mm) (Oven a/C geezer hub chimney point)  with pipe setting ",250.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Geezer fitting", "Geezer fitting",438.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "wiring ( upto 5ft )", "wiring ( upto 5ft )",875.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "wiring ( upto 5ft )", "wiring ( upto 5ft )",875.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "wiring ( upto 10 ft )", "wiring ( upto 10 ft )",1375.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fan Wall Mounting", "Fan Wall Mounting",157.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Celling mount", "Celling mount",113.00, 5.00 from vendor1 v, service1 s where v.last_name = "Waseem" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Fan Fixing", "New Fan Fixing",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Tube Light Fixing and Replacement", "New Tube Light Fixing and Replacement",65.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Single Switch Light Fixing (% Amps)", "Single Switch Light Fixing (% Amps)",403.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Two Way Plug Point", "Two Way Plug Point",275.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fan Point With Regulator Switch & Wiring", "Fan Point With Regulator Switch & Wiring",660.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Earthing Including Labor Max 5 Ft.", "Earthing Including Labor Max 5 Ft.",2750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Earthing Incase Of Material ( Copper plate 1/1, copper wire with phile )", "Earthing Incase Of Material ( Copper plate 1/1, copper wire with phile )",16500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Apartments ( 2/2 copper plate copper patti GFI 1 ft  grof bold salt chorcoal digging )", "Apartments ( 2/2 copper plate copper patti GFI 1 ft  grof bold salt chorcoal digging )",33000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Only UPS Wiring ", "Only UPS Wiring ",4400.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Light Simple Fitting", "Light Simple Fitting",66.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Small Fancy Lights", "Small Fancy Lights",240.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Medium Fancy Lights ", "Medium Fancy Lights ",720.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Big Fancy Lights ", "Big Fancy Lights ",1800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fixing Plug Point 15 Amps", "Fixing Plug Point 15 Amps",770.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Single phase meter board ( With cable fixing and digging )", "Single phase meter board ( With cable fixing and digging )",6600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 Phase ( meter board fixing  cable fixing meter fixing 4 pole mcb )", "3 Phase ( meter board fixing  cable fixing meter fixing 4 pole mcb )",13200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dressing ( 8 way )", "Dressing ( 8 way )",880.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dressing ( 16 way )", "Dressing ( 16 way )",1870.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Panel board Fitting", "Panel board Fitting price decided on inspection ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Lighting Circuit", " (2.5per Sq. mm) with pipe setting inpection price ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Heating Circuit", "(4.0 Sq. mm) (Oven a/C geezer hub chimney point)  with pipe setting ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 plnas charges switch with cable and labor charges digging charges Over switch", "3 plnas charges switch with cable and labor charges digging charges Over switch ",13750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 plnas charges switch with cable and labor charges digging charges Over switch", "3 plnas charges switch with cable and labor charges digging charges Over switch ",13750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Masood Pasha k" and s.name = 'Electrician'); 

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Fan Fixing", "New Fan Fixing ",150.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "New Tube Light Fixing and Replacement", "New Tube Light Fixing and Replacement",150.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Single Switch Light Fixing (% Amps)", "Single Switch Light Fixing (% Amps)",150.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Two Way Plug Point", "Two Way Plug Point",150.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fan Point With Regulator Switch & Wiring", "Fan Point With Regulator Switch & Wiring",600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Earthing Incase Of Material ( Copper plate 1/1, copper wire with phile )", "Earthing Incase Of Material ( Copper plate 1/1, copper wire with phile )",14250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Only UPS Wiring ", "Only UPS Wiring  price on inspection ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Light Simple Fitting", "Light Simple Fitting",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Small Fancy Lights", "Small Fancy Lights",375.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Medium Fancy Lights ", "Medium Fancy Lights ",480.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Big Fancy Lights ", "Big Fancy Lights ",960.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Panel board Fitting", "Panel board Fitting price decided on inspection ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Lighting Circuit", " (2.5per Sq. mm) with pipe setting inpection price ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Heating Circuit", "(4.0 Sq. mm) (Oven a/C geezer hub chimney point)  with pipe setting ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fixing Lights and Wiring", "Fixing Lights and Wiring price on inspection ",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 Phase (repair)", "3 Phase (repair)",225.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1bhk wiring", "1bhk wiring",14950.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Geezer fitting", "Geezer fitting",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Geezer repair", "Geezer repair",250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "2bhk Wiring", "2bhk Wiring",19550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , " fixing and earthing  for 1bhk", " fixing and earthing  for 1bhk",8800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed Anzer" and s.name = 'Electrician');



/*   Clean pro vendor packages  */

insert into vendor1( first_name,address,mobile_number ) values ("Clean Pro","No. 2, 12th Main, Vasanthanagar, Palace Road, Bengaluru, Karnataka 560052","9844030100");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Clean Home ", "1BHK Hygiene Cleaning ", 5000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Sweet Home", "2BHK Empty Flat Cleaning ", 6200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Sweet Home", "2BHK Occupied Flat Cleaning ", 6500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Super Clean", "3BHK Empty Flat Cleaning ", 6800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Super Clean", "3BHK Occupied Flat Cleaning ", 7200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Combo Clean", "2 Bathrooms and kitchen ", 3500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Shiney Shower Room ", "Bathroom Cleaning Services per Bathroom ", 1000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');


insert into service1(name,parent_category, page_name) (select  "Carpet Cleaning", c.id,'pathologyOrder' from category1 c where c.name='Home Cleaning');

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Carpet Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Tidy Finishng", "Carpet Cleaning Less then 5000 Sq Ft NOTE Price Based on per Sq ft ",2.50, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Carpet Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Tidy Finishng", "Carpet Cleaning More then 5000 Sq Ft NOTE Price Based on per Sq ft ",1.50, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Carpet Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Chair Clean ", "Chair Shampooing per Chair",40, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Carpet Cleaning');

update service1 set active=1 where name='Carpet Cleaning';

update service1 set display_order=39 where name='Appliance Repair';
update service1 set display_order=40 where name='Electronics Repair';
update service1 set display_order=41 where name='Home Appliance Repair ';
update service1 set display_order=42 where name='Mobile Repair Service';



/*   Yoga,Dietician and Car detailing Start  */


 insert into category1 (name, description ) values ("Fitness", "Fitness");
insert into category1 (name, description ) values ("Autospa", "Autospa");

insert into service1(name,parent_category, page_name) (select  "Dietician", c.id,'pathologyOrder' from category1 c where c.name='Fitness'); 
insert into service1(name,parent_category, page_name) (select  "Yoga", c.id,'pathologyOrder' from category1 c where c.name='Fitness'); 
insert into service1(name,parent_category, page_name) (select  "Car Detailing", c.id,'pathologyOrder' from category1 c where c.name='Autospa'); 

insert into service1(name,is_bold,active) values ("Fitness",1,1);

insert into vendor1( first_name, last_name,address,mobile_number ) values ("Shikha", "Mishra","Abhishek Apartment, 1st Main, Koramangala 1st Block, Bangalore- 560034, Near Jakkasandra Bus Stop","9008140044");
insert into vendor1( first_name, last_name,address,mobile_number ) values ("Total Yoga", "Shivkumar","#277,1st main, Indiranagar, Banglore560038.","9900097056");
insert into vendor1( first_name,address,mobile_number) values ("Auto Krom"," #87,14th main, sector 4, HSR layout, Bangalore-560102","9986993789");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician'); 
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Private Light Yoga", "Private Light Yoga, 2 Sessions/week",4000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount) 
( select v.id , s.id ,"Private Medium Yoga", "Private Medium Yoga, 3 Sessions/week",5000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Private Heavy Yoga", "Private Heavy Yoga, 5 Sessions/week",7000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount) 
( select v.id , s.id ,"Private Weekend Yoga", "Private Weekend Yoga,Saturday/Sunday Only",5000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Light Yoga", "Group Light Yoga, 2 Sessions/week,Size ( 2-5 ) persons", 7500.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Medium Yoga", "Group  Medium Yoga, 3 Sessions/week,Size ( 6-10 ) persons", 25000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Heavy Yoga", "Group  Heavy Yoga, 5 Sessions/week,Size (11-15 ) persons", 37500.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Weekend Yoga-1", "Group  Weekend Yoga, Saturday/Sunday Only,Size ( 2-5 ) persons", 8500.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Weekend Yoga-2", "Group  Weekend Yoga, Saturday/Sunday Only,Size ( 6-10 ) persons", 27000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Weekend Yoga-3", "Group  Weekend Yoga, Saturday/Sunday Only,Size ( 11-15 ) persons", 40000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Diet Beginner Crash", "Diet Beginner Crash, 1 Month", 1100.00, 10.00 from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Diet Beginner", "Diet Beginner, 1 Month", 2200.00, 10.00 from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Diet Intermediate Crash", "Diet Intermediate Crash, 2 Month s", 2200.00, 10.00 from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Diet Intermediate", "Diet Intermediate, 2 Month s", 4400.00, 10.00 from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician');



insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Exterior Paint Protection - Platinum", "All Exterior Paint Surface, Plastic & Vinyl parts, Rubber & Tyre SurfaceWarranty upto 3 Years,small", 4300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,"Exterior Paint Protection - Platinum", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 years, Medium", 4900.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Exterior Paint Protection - Platinum", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 years, Large", 5900.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Exterior Paint Protection - Platinum", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 years, Higher end", 7400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Exterior Paint Protection - Gold", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 1 year, Small", 2400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Exterior Paint Protection - Gold", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 1 year, Medium", 2900.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,  "Exterior Paint Protection - Gold", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 1 year, Large", 3900.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Exterior Paint Protection - Gold", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 1 year, Higher end, 4600", 4600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Wax Polishing", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 months, Small", 1200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id ,"Wax Polishing", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 months, Medium", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Wax Polishing", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 months, Large", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Wax Polishing", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface, Warranty upto 3 months, Higher end", 3000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,  "Maestro Treatment - Exterior", "Platinum Exterior Paint Protection
+Water mark removal on all glasses and Alloys protection,Warranty upto 3 year, Small", 6500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,"Maestro Treatment - Exterior", "Platinum Exterior Paint Protection + Water mark removal on all glasses
and Alloys protection,Warranty upto 3 years, Medium", 7200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,"Maestro Treatment - Exterior", "Platinum Exterior Paint Protection + Water mark removal on all glasses
and Alloys protection,Warranty upto 3 years, Large", 8500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,"Maestro Treatment - Exterior", "Platinum Exterior Paint Protection + Water mark removal on all glasses
and Alloys protection,Warranty upto 3 years, Higher end", 10500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Interior Enrichment Interior Chemical Treatment", "Roof, Seats, Dash board, floor carpet, Windshield & Glasses Warranty upto 1 year, Small", 1800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Interior Chemical Treatment", "Roof, Seats, Dash board, floor carpet, Windshield & Glasses Warranty upto 1 year, Medium", 2100.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Interior Chemical Treatment", "Roof, Seats, Dash board, floor carpet, Windshield & Glasses Warranty upto 1 year, Large", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Interior Chemical Treatment", "Roof, Seats, Dash board, floor carpet, Windshield & Glasses Warranty upto 1 year, Higher end", 3200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Maestro Treatment - Interior", "Interior Chemical Treatment + A/C Protection Warranty upto 1 year, Small", 2600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,  "Interior Enrichment Maestro Treatment - Interior", "Interior Chemical Treatment + A/C Protection Warranty upto 1 year, Medium", 3000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Interior Enrichment Maestro Treatment - Interior", "Interior Chemical Treatment + A/C Protection Warranty upto 1 year, Large", 3800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Maestro Treatment - Interior", "Interior Chemical Treatment + A/C Protection Warranty upto 1 year, Higher end", 4500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Glass Cleaning & Water mark removal (All Glasses)-1", "Water mark removal on all glass and windshield protection, Small", 2400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Glass Cleaning & Water mark removal (All Glasses)-2", "Water mark removal on all glass and windshield protection, Medium", 2600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,  "Glass Cleaning & Water mark removal (All Glasses)-3", "Water mark removal on all glass and windshield protection, Large", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Glass Cleaning & Water mark removal (All Glasses)", "Water mark removal on all glass and windshield protection, Higher end", 3200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Alloy Wheel Protection", "All Alloy wheels & Tyre surface Warranty upto 1 year, Small", 1300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Alloy Wheel Protection", "All Alloy wheels & Tyre surface Warranty upto 1 year, Medium", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Alloy Wheel Protection", "All Alloy wheels & Tyre surface Warranty upto 1 year, Large, 1700", 1700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Alloy Wheel Protection", "All Alloy wheels & Tyre surface Warranty upto 1 year, Higher end, 2000", 2000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "AC Protection", "A/C Duct, Dashboard Warranty upto 6 months, Small", 1000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "AC Protection", "A/C Duct, Dashboard Warranty upto 6 months, Medium", 1200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "AC Protection", "A/C Duct, Dashboard Warranty upto 6 months, Large", 1400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "AC Protection", "A/C Duct, Dashboard Warranty upto 6 months, Higher end", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Windshield Protection", "Windshield & side mirrors Warranty up to 8 months, Small", 1200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Windshield Protection", "Windshield & side mirrors Warranty up to 8 months, Medium", 1400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Windshield Protection", "Windshield & side mirrors Warranty up to 8 months, Large", 1600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Windshield Protection", "Windshield & side mirrors Warranty up to 8 months, Higher end", 1700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Headlight Restoration", "Headlight cleaning from outside, Small", 1000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Headlight Restoration", "Headlight cleaning from outside, Medium", 1200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Headlight Restoration", "Headlight cleaning from outside, Large", 1400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Headlight Restoration", "Headlight cleaning from outside, Higher end", 1400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Platinum Underbody Coat", "Entire underbody including wheels anti rust coating, Small", 2700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Platinum Underbody Coat", "Entire underbody including wheels anti rust coating, Medium", 3200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Platinum Underbody Coat", "Entire underbody including wheels anti rust coating, Large", 3700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Platinum Underbody Coat", "Entire underbody including wheels anti rust coating, Higher end", 4700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Engine Coating/Lacquering", "Covers entire Engine area, Small", 1100.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Engine Coating/Lacquering", "Covers entire Engine area, Medium", 1300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Engine Coating/Lacquering", "Covers entire Engine area, Large", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Engine Coating/Lacquering", "Covers entire Engine area, Higher end", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Silencer Coating", "Covers entire Silencer, highly heated area, Small", 1100.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Silencer Coating", "Covers entire Silencer, highly heated area, Medium", 1300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Silencer Coating", "Covers entire Silencer, highly heated area, Large", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Anti - Corrosion Silencer Coating", "Covers entire Silencer, highly heated area, Higher end, 2200", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Foam based water wash", "All Exterior surface of car + interior vacuum cleaning, Medium", 300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Foam based water wash", "All Exterior surface of car + interior vacuum cleaning, Medium", 400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Foam based water wash", "All Exterior surface of car + interior vacuum cleaning, Large", 500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Foam based water wash", "All Exterior surface of car + interior vacuum cleaning, Higher end", 600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Art Leather", "Warranty up to 1 year, Small", 6800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Art Leather", "Warranty up to 1 year, Medium", 8000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Seat Covering - Art Leather", "Warranty up to 1 year, Large", 9500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Luster Leather", "Warranty up to 2 years, Small, 8500", 8500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Luster Leather", "Warranty up to 2 years, Medium", 10000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Luster Leather", "Warranty up to 2 years, Large", 12500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Slink Leather", "Warranty up to 2 years, Small", 12500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Slink Leather","Warranty up to 2 years, Medium", 16000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Slink Leather", "Warranty up to 2 years, Large", 21000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Pure Leather", "Warranty up to 3 years, Small, 2200", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Pure Leather", "Warranty up to 3 years, Medium, 2200", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Pure Leather", "Warranty up to 3 years, Large", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Slink Leather", "Warranty up to 2 years, Small", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Slink Leather", "Warranty up to 2 years, Medium", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Slink Leather", "Warranty up to 2 years, Large", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Pure Leather", "Warranty up to 3 years, Large", 4000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Pure Leather", "Warranty up to 3 years, Large", 4000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom" and s.name = 'Car Detailing');

insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Pure Leather", "Warranty up to 3 years, Large", 4000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto Krom"  and s.name = 'Car Detailing');



UPDATE service1 SET active=1 WHERE name='Yoga';
UPDATE service1 SET `active`='1' WHERE `name`='Car Detailing';
UPDATE service1 SET `active`='1' WHERE `name`='Dietician';





/* Appliance service start*/


insert into category1 (name, description,active ) values ("Appliance Repair", "Appliance Repair",1);

insert into service1(name,parent_category, page_name) (select  "Electronics Repair", c.id,'pathologyOrder' from category1 c where c.name='Appliance Repair');

insert into service1(name,parent_category, page_name) (select  "Home Appliance Repair ", c.id,'pathologyOrder' from category1 c where c.name='Appliance Repair');

insert into service1(name,parent_category, page_name) (select  "Mobile Repair Service", c.id,'pathologyOrder' from category1 c where c.name='Appliance Repair');


insert into vendor1( first_name,address,mobile_number ) values ("Tech hub","# 201, 1st Floor, 28th Main, &th Cross, HSR Layout, Sector-1,Bangalore-560102","9972102609");
insert into vendor1( first_name,address,mobile_number ) values ("Dhanraj","No 201, 1st floor, 2nd main, 7th cross, HSR Layout Sector-1 Bangalore-560102","9972102609");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Tech hub" and s.name = 'Electronics Repair');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appliance Repair');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Mobile Repair Service');

insert into service1 (name,is_bold,is_dummy,active) values ("Appliance Repair",1,0,1);


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Antique to Restoration", "Desktop Repair Formatting PC Hardware Repair and Replacement (Minimum charges per Home Visit) ",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Tech hub" and s.name = 'Electronics Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fix and Shine ", "Repair your Laptop and Fix your Broken Screen (Minimum charges per Home Visit)",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Tech hub" and s.name = 'Electronics Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Print Easy ", "Printer Repair and Services (Minimum charges per Home Visit) ",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Tech hub" and s.name = 'Electronics Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Burnt Ovens", "Oven Repair (Minimum charges per Home Visit)",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Blank Telecast ", "Television Repair and Service of all kinds of LCD LED Plasma TV (Minimum charges per Home Visit) ",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Grinder Repair ", "Grinders and Mixers Repair and Service (Minimum charges per Home Visit) ",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Vacuum Cleaner", "Vacuum Cleaner Repair and Service (Minimum charges per Home Visit)",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Poor Sound Quality ", "Home Theatre System Repair (Minimum charges per Home Visit)",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dead kitchen  ", "Electric Rice Cooker Repair (Minimum charges per Home Visit)",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Cracked Screen  ", "Shattered Mobile or Tablet Screen and Mobile Phone Repair (Minimum charges per Home Visit)",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Mobile Repair Service');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Boost Your Mobile ", "Update your Android Windows iOS phones (Minimum charges per Home Visit)",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Mobile Repair Service');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Flashback ", "Data Recovering and Anti-Virus Updates ",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Mobile Repair Service');


/* photography packages Start  */


insert into category1 (name, description,active ) values ("Photography", "Photography",1);

insert into service1(name,parent_category, page_name) (select  "Photography", c.id,'pathologyOrder' from category1 c where c.name='Photography');

insert into vendor1( first_name ) values ("ARB Photography");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service1 (name,is_bold,is_dummy,active) values ("Photography",1,0,1);

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Pixels (1-4 hours)", "Pure candid Photographhy with all the Editing and photo book Note Album cost Extra, Rs.30000",30000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold Pixels  (1-4 hours)", "Pure Candid Photographer with editing and album Note Album Cost Extra, Rs.20000",20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Pixels  (1-4 hours)", "Semi Candid  with coffee table size Album without editing Note Album Cost Extra, Rs.10000",10000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Pixels (4-8 hours)", "Pure candid Photographhy with all the Editing and 15x24  photo book 200 pictures of your choise Note Album cost Extra staring from 300000, Rs.30000",30000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold Pixels  ( (4-8 hours)", "Pure Candid Photographer with editing and album Note Album Cost Extra 12x20 albumsheets with30 sheets and 180 pics of your choise Starting from 20000, Rs.20000",20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Pixels  (4-8 hours)", "Semi Candid  with coffee table size Album without editing 8x24 Album With 20 Sheets and 120 Pics selected by customers Note Album Cost Extra, Rs.20000",20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

update service1 set active=1 where name='Photography';



update service1 set display_order=27 where name='Fitness';
update service1 set display_order=28 where name='Yoga';
update service1 set display_order=29 where name='Dietician';
update service1 set display_order=30 where name='Autospa';
update service1 set display_order=31 where name='Car Detailing'; 
update service1 set display_order=32 where name='Finance';
update service1 set display_order=33 where name='CS';  
update service1 set display_order=34 where name='Home Cleaning' and is_bold=1;
update service1 set display_order=35 where name='Home cleaning';
update service1 set display_order=36 where name='Carpet Cleaning';
update service1 set display_order=37 where name='Wedding';
update service1 set display_order=38 where name='Wedding Planer';
update service1 set display_order=39 where name='Appliance Repair';
update service1 set display_order=40 where name='Electronics Repair';
update service1 set display_order=41 where name='Home Appliance Repair';
update service1 set display_order=42 where name='Mobile Repair Service';
update service1 set display_order=43 where is_bold=1 and name='Photography';
update service1 set display_order=44 where name='Photography' and is_bold=0;
update service1 set display_order=45 where name='Coming Soon';
update service1 set display_order=46 where name='Beauty';
update service1 set active=1 where name='Electronics Repair';
update service1 set active=1 where name='Home Appliance Repair';
update service1 set active=1 where name='Mobile Repair Service';

delete from service_unit1 where description is null;


UPDATE  `service1` SET  `display_text` = '<img  src="nbdimages/images/yoga.jpg" alt="yoga image" class="img-responsive imageName" />
  <h3 class = "textContentId"> Looking for Professional Yoga guidance?</h3>
	 <p class = "textContentId1">  We have the best yoga professionals </p>
	  <p class = "textContentId2">  Flexible packages to suit every need</p>
		 <p class = "textContentId3">  Learn Yoga under their guidance from the comfort of your home.</p>' where name  = 'Yoga';


UPDATE  `service1` SET  `display_text` = '
<img  src="nbdimages/images/CS.jpg" alt="company secretary" class="img-responsive imageName" />
 <h3 class = "textContentId"> Not sure of regulations and compliance issues for your business?</h3>
<p class = "textContentId1"> As a small business, help us help you focus on your core business while our 
	professional company secretaries take care of regulatory compliances. </p>
' where name  = 'CS';


UPDATE  `service1` SET  `display_text` = ' <img  src="nbdimages/images/cleaning.jpg" alt="Home Cleaning" class="img-responsive imageName" />
<h3 class = "textContentId"> Need professional help to clean your house?</h3>
 <p class = "textContentId"> If you need to get your house ready for a party, or need help in clearing out the after effects of a party, Auro
 professionals will help you  do the job at a time of your convenience. </p>

 <p  class = "textContentId2"> Order a home cleaning service from Auro. </p>'
 where name = 'Home cleaning';

UPDATE  `service1` SET  `display_text` = '
<img  src="nbdimages/images/dietician.jpg" alt="yoga image" class="img-responsive imageName" />
 <h3 class = "textContentId"> Worried about your unmanageable diet?</h3>
  <p class = "textContentId"> Dealing with weight issues? Eating too much or too little? Unable to contain hunger pangs due to your diet?
	Unable to stay away from binge eating? </p>

	<p  class = "textContentId2"> Get a professional dietician from Auro to help you deal with your diet issues.</p>
	'
 where name  = 'Dietician';

UPDATE  `service1` SET  `display_text` = '
<img  src="nbdimages/images/car_wash.jpg" alt="Car Detailing" class="img-responsive imageName" />
 <h3 class = "textContentId"> An extra special way to cleanse, condition and protect your car.</h3>
  <p class = "textContentId1">
	A car is a pride and passion,  of everyone and we care for it. </p>
	 <p class = "textContentId2">
	 We provide the best car detailing service by cleansing , polishing and waxing the complete car because we know YOU LOVE YOUR CAR & WE LOVE OUR CUSTOMERS!!!
	 </p>'
 where name = 'Car Detailing';
 
 
 
 
UPDATE  service1 SET  display_text = '<img  src="nbdimages/images/wedding.jpg" alt="yoga image" class="img-responsive imageName" />
<h3 class = "textContentId"> Wedding is a path that paves way for two people into a beautiful journey called life.</h3>
<p class = "textContentId"> In the special event of wedding, we make your work hassle free and we make sure that “none miss the fun”!!! </p>
<p class = "textContentId2"> We at Aurospaces have professional wedding planners who make your wedding a special ceremony of love&happiness.</p>' where name  = 'Wedding Planner';


UPDATE  service1 SET  display_text = '<img  src="nbdimages/images/camera.jpg" alt="yoga image" class="img-responsive imageName" />
<h3 class = "textContentId"> We capture your golden moment in a snap</h3>
<p class = "textContentId"> Photography is an art which can bring your creativity to life.</p>
<p class = "textContentId2"> In Aurospaces, we do believe that “what it feels like is an art of observation”.</p>' where name  = 'Photography';


UPDATE  service1 SET  display_text = '<img  src="nbdimages/images/electronic repair.jpg" alt="yoga image" class="img-responsive imageName" />
<h3 class = "textContentId"> Screen broken? Battery exhausted? Laptop slow down?</h3>
<p class = "textContentId"> Gadgets breaking down is like loosing connection from the real world.</p>
<p class = "textContentId2"> At Aurospaces  we provide solutions by simplifying technology and making it work for you through our professionals.</p>' where name  = 'Electronics Repair';


UPDATE  service1 SET  display_text = '<img  src="nbdimages/images/mobile reapir.jpg" alt="yoga image" class="img-responsive imageName" />
<h3 class = "textContentId"> Get your mobile repaired before you get disconnected.</h3>
<p class = "textContentId"> At Auro , we make sure all your mobile phone troubles are handled by the experts.</p>
<p class = "textContentId2"> Get your phone fixed and unlocked with a smile.</p>' where name  = 'Mobile Repair Service';


UPDATE  service1 SET  display_text = '<img  src="nbdimages/images/Home appliance.jpg" alt="yoga image" class="img-responsive imageName" />
<h3 class = "textContentId"> Work delayed because of your broken appliance???</h3>
<p class = "textContentId"> Affordable appliance repair service with reputable, caring technician to make your life simple and easy.</p>
<p class = "textContentId2"> Trust Auro when it comes to handling home appliance repair at your doosrstep. Yes, your place, your time.</p>' where name  = 'Home Appliance Repair ';


UPDATE  service1 SET  display_text = '<img  src="nbdimages/images/carpet cleaning.jpg" alt="yoga image" class="img-responsive imageName" />
<h3 class = "textContentId"> Your healthy home starts here with AURO</h3>
<p class = "textContentId"> At Auro we promise you to provide the cleanest healthiest long lasting carpet cleaning service with our experts here.</p>' where name  = 'Carpet Cleaning';


update service1 set display_order   = 1 where id = 2;

update service1 set display_order   = 34 where id = 35;

update service1 set display_order   = 36 where id = 37;

update service1 set display_order   = 37 where id = 36;

