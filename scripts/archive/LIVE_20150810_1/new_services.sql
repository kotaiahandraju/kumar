insert into category1 (name, description ) values ("Fitness", "Fitness");
insert into category1 (name, description ) values ("Autospa", "Autospa");

insert into service1(name,parent_category, page_name) (select  "Dietician", c.id,'pathologyOrder' from category1 c where c.name='Fitness'); 
insert into service1(name,parent_category, page_name) (select  "Yoga", c.id,'pathologyOrder' from category1 c where c.name='Fitness'); 
insert into service1(name,parent_category, page_name) (select  "Car Detailing", c.id,'pathologyOrder' from category1 c where c.name='Autospa'); 

insert into vendor1( first_name, last_name ) values ("Shikha", "Mishra");
insert into vendor1( first_name, last_name ) values ("Total Yoga", "Shivkumar");
insert into vendor1( first_name, last_name ) values ("Auto", "Krom");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician'); 
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "Krom" and s.name = 'Car Detailing');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Diet Beginner Crash", "Diet Beginner Crash, 1 Month, 1100 pm", 1100.00, 10.00 from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Diet Beginner", "Diet Beginner, 1 Month, 2200 pm", 2200.00, 10.00 from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Diet Intermediate Crash", "Diet Intermediate Crash, 2 Month's, 2200", 2200.00, 10.00 from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Diet Intermediate", "Diet Intermediate, 2 Month's, 4400", 4400.00, 10.00 from vendor1 v, service1 s where v.first_name = "Shikha" and v.last_name = "Mishra" and s.name = 'Dietician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
(select v.id , s.id , "Private Light Yoga", "Private Light Yoga, 2 Sessions/week, 4000 pm",4000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount) 
( select v.id , s.id ,"Private Medium Yoga", "Private Medium Yoga, 3 Sessions/week, 5000 pm",5000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Private Heavy Yoga", "Private Heavy Yoga, 5 Sessions/week, 7000 pm",7000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount) 
( select v.id , s.id ,"Private Weekend Yoga", "Private Weekend Yoga, Weekend Only, 5000 pm",5000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Light Yoga", "Group Light Yoga, 2 Sessions/week, 7500 pm", 7500.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Medium Yoga", "Group  Medium Yoga, 3 Sessions/week, 25000 pm", 25000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Heavy Yoga", "Group  Heavy Yoga, 5 Sessions/week, 37500 pm", 37500.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Weekend Yoga-1", "Group  Weekend Yoga, Weekend Only, 8500 pm", 8500.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Weekend Yoga-2", "Group  Weekend Yoga, Weekend Only, 27000 pm", 27000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Group Weekend Yoga-3", "Group  Weekend Yoga, Weekend Only, 40000 pm", 40000.00, 5 from vendor1 v, service1 s where v.first_name = "Total Yoga" and v.last_name = "Shivkumar" and s.name = 'Yoga');





insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Exterior Paint Protection - Platinum-1", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface    Warranty upto 3 years, small, 4300", 4300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,"Exterior Paint Protection - Platinum-2", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 years, Medium, 4900", 4900.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Exterior Paint Protection - Platinum-3", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 years, Large, 5900", 5900.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Exterior Paint Protection - Platinum-4", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 years, Higher end, 7400", 7400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Exterior Paint Protection - Gold-1", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 1 year, Small, 2400", 2400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Exterior Paint Protection - Gold-2", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 1 year, Medium, 2900", 2900.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,  "Exterior Paint Protection - Gold-3", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 1 year, Large, 3900", 3900.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Exterior Paint Protection - Gold-4", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 1 year, Higher end, 4600", 4600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Wax Polishing-1", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 months, Small,  1200", 1200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id ,"Wax Polishing-2", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 months, Medium, 1500", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Wax Polishing-3", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 months, Large,  2200", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Wax Polishing-4", "All Exterior paint surface, Plastic & Vinyl parts, Rubber & Tyre Surface Warranty upto 3 months, Higher end, 3000", 3000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,  "Maestro Treatment - Exterior-1", "Platinum Exterior Paint Protection + Water mark removal on all glasses
and Alloys protection,Warranty upto 3 years, Small, 6500", 6500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,"Maestro Treatment - Exterior-2", "Platinum Exterior Paint Protection + Water mark removal on all glasses
and Alloys protection,Warranty upto 3 years, Medium, 7200", 7200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,"Maestro Treatment - Exterior-3", "Platinum Exterior Paint Protection + Water mark removal on all glasses
and Alloys protection,Warranty upto 3 years, Large, 8500", 8500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount) 
( select v.id , s.id ,"Maestro Treatment - Exterior-4", "Platinum Exterior Paint Protection + Water mark removal on all glasses
and Alloys protection,Warranty upto 3 years, Higher end, 10500", 10500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Interior Enrichment Interior Chemical Treatment-1", "Roof, Seats, Dash board, floor carpet, Windshield & Glasses Warranty upto 1 year, Small, 1800", 1800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Interior Chemical Treatment-2", "Roof, Seats, Dash board, floor carpet, Windshield & Glasses Warranty upto 1 year, Medium, 2100", 2100.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Interior Chemical Treatment-3", "Roof, Seats, Dash board, floor carpet, Windshield & Glasses Warranty upto 1 year, Large, 2800", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Interior Chemical Treatment-4", "Roof, Seats, Dash board, floor carpet, Windshield & Glasses Warranty upto 1 year, Higher end, 3200", 3200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Maestro Treatment - Interior-1", "Interior Chemical Treatment + A/C Protection Warranty upto 1 year, Small, 2600", 2600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,  "Interior Enrichment Maestro Treatment - Interior-2", "Interior Chemical Treatment + A/C Protection Warranty upto 1 year, Medium, 3000", 3000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Interior Enrichment Maestro Treatment - Interior-3", "Interior Chemical Treatment + A/C Protection Warranty upto 1 year, Large, 3800", 3800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Interior Enrichment Maestro Treatment - Interior-4", "Interior Chemical Treatment + A/C Protection Warranty upto 1 year, Higher end, 4500", 4500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Glass Cleaning & Water mark removal (All Glasses)-1", "Water mark removal on all glass and windshield protection, Small, 2400", 2400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Glass Cleaning & Water mark removal (All Glasses)-2", "Water mark removal on all glass and windshield protection, Medium, 2600", 2600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,  "Glass Cleaning & Water mark removal (All Glasses)-3", "Water mark removal on all glass and windshield protection, Large, 2800", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Glass Cleaning & Water mark removal (All Glasses)-4", "Water mark removal on all glass and windshield protection, Higher end, 3200", 3200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Alloy Wheel Protection-1", "All Alloy wheels & Tyre surface Warranty upto 1 year, Small, 1300", 1300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Alloy Wheel Protection-2", "All Alloy wheels & Tyre surface Warranty upto 1 year, Medium, 1500", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Alloy Wheel Protection-3", "All Alloy wheels & Tyre surface Warranty upto 1 year, Large, 1700", 1700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Alloy Wheel Protection-4", "All Alloy wheels & Tyre surface Warranty upto 1 year, Higher end, 2000", 2000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "AC Protection-1", "A/C Duct, Dashboard Warranty upto 6 months, Small, 1000", 1000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "AC Protection-2", "A/C Duct, Dashboard Warranty upto 6 months, Medium, 1200", 1200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "AC Protection-3", "A/C Duct, Dashboard Warranty upto 6 months, Large, 1400", 1400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "AC Protection-4", "A/C Duct, Dashboard Warranty upto 6 months, Higher end, 1500", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Windshield Protection-1", "Windshield & side mirrors Warranty up to 8 months, Small, 1200", 1200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Windshield Protection-2", "Windshield & side mirrors Warranty up to 8 months, Medium, 1400", 1400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Windshield Protection-3", "Windshield & side mirrors Warranty up to 8 months, Large, 1600", 1600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Windshield Protection-4", "Windshield & side mirrors Warranty up to 8 months, Higher end, 1700", 1700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Headlight Restoration-1", "Headlight cleaning from outside, Small, 1000", 1000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Headlight Restoration-2", "Headlight cleaning from outside, Medium, 1200", 1200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Headlight Restoration-3", "Headlight cleaning from outside, Large, 1400", 1400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Headlight Restoration-4", "Headlight cleaning from outside, Higher end, 1400", 1400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Platinum Underbody Coat-1", "Entire underbody including wheels anti rust coating, Small, 2700", 2700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Platinum Underbody Coat-2", "Entire underbody including wheels anti rust coating, Medium, 3200", 3200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Platinum Underbody Coat-3", "Entire underbody including wheels anti rust coating, Large, 3700", 3700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Platinum Underbody Coat-4", "Entire underbody including wheels anti rust coating, Higher end, 4700", 4700.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Engine Coating/Lacquering-1", "Covers entire Engine area, Small, 1100", 1100.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Engine Coating/Lacquering-2", "Covers entire Engine area, Medium, 1300", 1300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Engine Coating/Lacquering-3", "Covers entire Engine area, Large, 1500", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Engine Coating/Lacquering-4", "Covers entire Engine area, Higher end, 2200", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Silencer Coating-1", "Covers entire Silencer, highly heated area, Small, 1100", 1100.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Silencer Coating-2", "Covers entire Silencer, highly heated area, Medium, 1300", 1300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Anti - Corrosion Silencer Coating-3", "Covers entire Silencer, highly heated area, Large, 1500", 1500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Anti - Corrosion Silencer Coating-4", "Covers entire Silencer, highly heated area, Higher end, 2200", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id ,"Foam based water wash-1", "All Exterior surface of car + interior vacuum cleaning, Medium, 300", 300.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Foam based water wash-2", "All Exterior surface of car + interior vacuum cleaning, Medium, 400", 400.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Foam based water wash-3", "All Exterior surface of car + interior vacuum cleaning, Large, 500", 500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Foam based water wash-4", "All Exterior surface of car + interior vacuum cleaning, Higher end, 600", 600.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Art Leather-1", "Warranty up to 1 year, Small, 6800", 6800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Art Leather-2", "Warranty up to 1 year, Medium, 8000", 8000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
(select v.id , s.id , "Seat Covering - Art Leather-3", "Warranty up to 1 year, Large, 9500", 9500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Luster Leather-1", "Warranty up to 2 years, Small, 8500", 8500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Luster Leather-2", "Warranty up to 2 years, Medium,10000", 10000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Luster Leather-3", "Warranty up to 2 years, Large, 12500", 12500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Slink Leather-1", "Warranty up to 2 years, Small, 12500", 12500.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Slink Leather-2","Warranty up to 2 years, Medium, 16000", 16000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Slink Leather-3", "Warranty up to 2 years, Large, 21000", 21000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Pure Leather-1", "Warranty up to 3 years, Small, 2200", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Pure Leather-2", "Warranty up to 3 years, Medium, 2200", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Seat Covering - Pure Leather-3", "Warranty up to 3 years, Large, 2200", 2200.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Slink Leather-1", "Warranty up to 2 years, Small, 2800", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Slink Leather-2", "Warranty up to 2 years, Medium, 2800", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Slink Leather-3", "Warranty up to 2 years, Large, 2800", 2800.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Pure Leather-1", "Warranty up to 3 years, Large, 4000", 4000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Pure Leather-2", "Warranty up to 3 years, Large, 4000", 4000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');
insert into service_unit1( vendor_id, service_id, name, description, price, discount)
( select v.id , s.id , "Door Pad - Pure Leather-3", "Warranty up to 3 years, Large, 4000", 4000.00, 10 from vendor1 v, service1 s where v.first_name = "Auto" and v.last_name = "krom" and s.name = 'Car Detailing');



UPDATE service1 SET active=1 WHERE name='Yoga';
UPDATE service1 SET active=1 WHERE name='Car Detailing';
UPDATE service1 SET active=1 WHERE name='Dietician';











insert into vendor1(first_name) values ("Sumukha");
insert into vendor1(first_name) values ("Curo Live");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Nursing Care'); 
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care'); 


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Nursing Care ", "Qualified Nurses for 24 hours Note the price may change according to the patient, 26000", 26000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold nuring care  ", "Qualified Nurses for day duty Note the price may change according to the patient, 22000", 22000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze nursing care-1", "Half a day Nursing services ,715", 715.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze nursing care-2", "12 Hours  nursing services,935",935.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze nursing care-3", "24 hours nursing services ,1375",1375.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "silver nursing care-1", "15 days 12 hours nursing services, 9360", 9360.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "silver nursing care-2", "15 days 24 hours nursing services,11520",11520.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum nursing care  services", "1 Month 12 hours nursing services,16520",16520.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id ,"Gold nursing care services", "1 Month 12 hours nursing services,20000",20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Nursing Care');

update service1 set page_name='pathologyOrder' where name='Nursing Care';
update service1 set page_name='pathologyOrder' where name='Home Care Taker';


insert into vendor1(first_name) values ("Spectrum");
insert into vendor1(first_name) values ("Optra care");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'PhysioTherapy'); 
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Spectrum" and s.name = 'PhysioTherapy'); 
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Optra care"  and s.name = 'PhysioTherapy'); 


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Quick Heal - Sports Injury-1", "5 days Physiotherapy at your home for fast recovery from sports injury, 2000", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Speedy Relief - Back Pain-1 ", "10 day  package for working professions for back pain , 3200", 3200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Back on track - Post orthopedic surgery-1", "15 days for any post orthopedic operated patient, 6000", 6000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Quick Heal - Sports Injury-2", "5 days Physiotherapy at your home for fast recovery from sports injury, 500", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Spectrum" and v.last_name = "Physiotherapy" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Speedy Relief - Back Pain-2", "10 day  package for working professions for back pain ,500",500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Spectrum" and v.last_name = "Physiotherapy" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Back on track - Post orthopedic surgery-2", "15 days for any post orthopedic operated patient,579",579.00, 5.00 from vendor1 v, service1 s where v.first_name = "Spectrum" and v.last_name = "Physiotherapy" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Perfect Recovery -  Neurorehabilitation", "20 days neuro rehabilitation ,662",662.00, 5.00 from vendor1 v, service1 s where v.first_name = "Spectrum" and v.last_name = "Physiotherapy" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Quick Heal - Sports Injury-3", "5 days Physiotherapy at your home for fast recovery from sports injury, 2500", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Optra care" and v.last_name = "Physiotherapy" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Speedy Relief - Back Pain-3", "10 day  package for working professions for back pain , 5000", 5000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Optra care" and v.last_name = "Physiotherapy" and s.name = 'PhysioTherapy');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Back on track - Post orthopedic surgery-3", "15 days for any post orthopedic operated patient, 7500", 7500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Optra care" and v.last_name = "Physiotherapy" and s.name = 'PhysioTherapy');

update service1 set page_name='pathologyOrder' where name='PhysioTherapy';


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze Elderly care-1 ", "Elderly care services for your loved one 12Hours/Day, 600", 600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze Elderly care-2", "Elderly care services for your loved one  24Hours/Day, 840", 840.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Elderly care-1", "Elderly care services for your loved one  1 Week(12Hours/Day), 3500", 3500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Elderly care-1 ", "Elderly care services for your loved one  1Week(24Hours/Day),4375",4375.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live"and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Elderly care-2", "Elderly care services for your loved one 15Days(12Hours/Day),7150",7150.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Elderly care-3", "Elderly care services for your loved one 15Days(24Hours/Day),9100",9100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold Elderly care-1", "Elderly care services for your loved one  1Month(12Hours/Day),11700",11700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Elderly care-2", "Elderly care services for your loved one  1Month(24Hours/Day),14950",14950.00, 5.00 from vendor1 v, service1 s where v.first_name = "Curo Live" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold Elderly care-2", "Elderly care services for your loved once Note the price may change according to the patient,16000",16000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bronze Elderly care-3", "Elderly care services for your loved one Note the price may change according to the patient,14000",14000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha" and s.name = 'Home Care Taker');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Elderly care-3", "Elderly care services for your loved one for 24 hours Note the price may change according to the patient,18000",18000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Sumukha"and s.name = 'Home Care Taker');

update service1 set page_name='pathologyOrder' where name='Plumber';

insert into service1 (name,is_bold,active,is_dummy) values ('Fitness',1,0,1);
insert into service1 (name,is_bold,active,is_dummy) values ('Autospa',1,0,1);

update service1 set display_order=27 where name='Fitness';
update service1 set display_order=28 where name='Yoga';
update service1 set display_order=29 where name='Dietician';
update service1 set display_order=30 where name='Autospa';
update service1 set display_order=31 where name='Car Detailing';
update service1 set display_order=32 where name='Coming Soon';
update service1 set display_order=33 where name='Beauty';

insert into category1 (name, description,active ) values ("Finance", "Finance",1);
insert into service1(name,parent_category, page_name) (select  "CS", c.id,'pathologyOrder' from category1 c where c.name='Finance');
insert into vendor1( first_name, last_name ) values ("Ahelleya  ", "Alka");
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');
insert into service1 (name) value("Finance");
update service1 set parent_category=5 where name='Finance';

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kick Start Business", "Incorporation of a Private Limited Company with PAN and TANRs. 20000 (inclusive all),20000", 20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Partners Build Business", "Incorporation of a Limited Liability Partnership (LLP) with PAN & TANRs. 15000 (inclusive all),15000", 15000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Low Investment & Faster returns", "Shops & Establishment Registration Rs. 7,000 (inclusive all),7000", 7000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Register Your Trademark", "Trademark application Rs. 8,000 (inclusive all),8000", 8000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Change of Registered office", "Change of Registered office (within city limits),Rs.2,500 + Filing Fees", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Change of Registered office", "Change of Registered office (one state to another),Rs. 20,000 +Filing Fees+ actual Expenses", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Share Transfers", "Depends on the number of transfer transactions", 250.00, 0.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Change of Company Name", "Change of Name of the company without changing main objects,Rs. 5000 + actual Expenses", 5000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Change of Company Name", "Change of Name of the company with? main objects,Rs. 7000 + actual Expenses", 7000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Charge Creation /alteration", "Charge Creation /alteration,Rs. 1500 + actual Expenses", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Search Reports for Bank", "Search Reports for Bank,Rs. 3000", 3000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Basic Due Diligence based on MCA database", "Basic Due Diligence based on MCA database,Rs. 1500", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Multiple Financing? report", "Multiple Financing? report,Rs. 10,000", 10000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rights Issue", "Issueing of Rights,Rs. 5000 + actual Expenses", 5000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Private Placement", "Private Placement,Rs. 10,000+ actual Expenses", 10000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Annual Filing-Company", "Annual Filing-Company,Rs. 8000 +actuals", 8000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Annual Filing-LLP", "Annual Filing-LLP,Rs. 2000+ Actuals", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Monthly reatainer- depending on the quantum of work", "Monthly reatainer- depending on the quantum of work,Rs.2,000 to Rs.3,500 per month", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ahelleya" and v.last_name = "Alka" and s.name = 'CS');

update service1 set display_order=32 where name='Finance';
update service1 set display_order=33 where name='CS';
update service1 set display_order=34 where name='Coming Soon';
update service1 set display_order=35 where name='Beauty';

update service1 set is_bold=1 where name='Finance';
update service1 set active=1 where name='Finance';
update service1 set active=1 where name='CS';

insert into vendor1( first_name) values ("Royal Pet care");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "Small Dogs PUG POM SHITZU TERRIER Normal", 495.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "Small Dogs PUG POM SHITZU TERRIER Hairy", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "medium Dogs  COCKER BEAGLE LHASA Normal", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "medium Dogs COCKER BEAGLE LHASA Hairy", 595.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "Large Dogs LAB GSD GOLDEN HUSKY BOXER Normal", 650.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dog bath", "Large Dogs LAB GSD GOLDEN HUSKY BOXER Hairy", 795.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Small Dogs includes bath includeing hair cut nail clip and ear cleaning. Normal", 825.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Medium Dogs includes bath includeing hair cut nail clip and ear cleaning.  Normal",935.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Large Dogs includes bath includeing hair cut nail clip and ear cleaning. Normal ", 1090.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Small Dogs includes bath includeing hair cut nail clip and ear cleaning. Hairy", 825.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Medium Dogs includes bath includeing hair cut nail clip and ear cleaning.  Hairy", 1045.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "Large Dogs includes bath includeing hair cut nail clip and ear cleaning. Hairy", 1210.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "XL Dog (BathST.BERNARD ROT GRT DANE) includes bath Nail clip,hair cut and ear  Normal", 1210.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Dog bath", "XL Dog (BathST.BERNARD ROT GRT DANE) includes bath Nail clip,hair cut and ear  Normal", 1430.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Grooming", "Only Grooming no dog bath ", 330.00, 5.00 from vendor1 v, service1 s where v.first_name = "Royal Pet care" and s.name = 'Pet Care');



update service1 set page_name='pathologyOrder' where name='Pet Care';

update service1 set img_url = 'nbdimages/mobile/dietician.png' where name = 'Dietician';
update service1 set img_url = 'nbdimages/mobile/yoga.png' where name = 'Yoga';
update service1 set img_url = 'nbdimages/mobile/cardetailing.png' where name = 'Car Detailing';
update service1 set img_url = 'nbdimages/mobile/cs.png' where name = 'CS';


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Carpentry work-1", "With Material Price based on imspection,Rs.250", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Lakshman" and v.last_name = "Ram" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Carpentry work-2", "With Material Price based on imspection,Rs.250", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ramu" and v.last_name = "Charan" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Complete Carpentry work-3", "Without Material Price based on imspection,Rs.250", 250.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ramu" and v.last_name = "Charan" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Small Carpentry work-1", "carpentry work such as table repair fixing tower bolts etc starting from Rs. 500", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Lakshman" and v.last_name = "Ram" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Small Carpentry work-2", "carpentry work such as table repair fixing tower bolts etc starting from Rs. 500", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Ramu" and v.last_name = "Charan" and s.name = 'Carpentry');

update service1 set page_name='pathologyOrder' where name='Carpentry';

insert into category1 (name, description,active ) values ("Home Cleaning", "Home Cleaning",1);

insert into service1(name,parent_category, page_name) (select  "Home cleaning", c.id,'pathologyOrder' from category1 c where c.name='Home Cleaning'); 

insert into vendor1( first_name ) values ("Jack On Block");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service1 (name,is_bold,is_dummy,active,display_order) values ("Home Cleaning",1,0,1,34);


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Toilet Cleaning-1", "One time toilet cleaning for 1 No, Rs.1200", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Toilet Cleaning-2", "One time toilet cleaning for 2 No, Rs.2200", 2200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "sofa cleaning", "Sofa shampooing, Rs.350", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kitchen cleaning-1", "Kitchen cleaning, Rs.1750", 1750.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Utility Package", "6 Services of carpentry, elecrician & plumbing. 2 hours per per call 12 hours in total, Rs.2500", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Toilet Cleaning-3", "3 Toilet cleaning, Rs.2500", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Pest Control", "2 Pest control services valid for 1 year highly efective on gel and spray, Rs.2500", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Water Tank Cleaning", "2 Water tank cleaning services calid for one year, Rs.2500", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kitchen Cleaning-2", "2 Kitchen cleaing 1 year validity one year, Rs.2500", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "sofa shamooping", "2 Sofa shamooping  valid for one year with hygienic and dust free  , Rs.2500", 2500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-1", "Sump cleaning for 0 to 2000 lts , Rs.800", 800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-2", "Sump cleaning for 0 to 4000 lts, Rs.1100", 1100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-3", "Sump cleaning for 0 to 6000 lts, Rs.1500", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-4", "Sump cleaning for 0 to 8000 lts, Rs.1800", 1800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sump cleaing-5", "Sump cleaning for 0 to 10000 lts, Rs.2000", 2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-1", "Overhead tank cleaning 0 to 500, Rs.500", 500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-2", "Overhead tank cleaning 0 to 750, Rs.700", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-3", "Overhead tank cleaning 0 to 1000, Rs.800", 800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-4", "Overhead tank cleaning 0 to 1500, Rs.900", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Over Head tank cleaning-5", "Overhead tank cleaning 0 to 2000, Rs.1100", 1100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Home cleaning');


update service1 set display_order=35 where name='Home cleaning';
update service1 set display_order=36 where name='Coming Soon';
update service1 set display_order=37 where name='Beauty';
update service1 set active=1 where name='Home cleaning';


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Simple Piping", "Simple Piping,Rs.319", 319.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication(Iron or Alluminium)');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Railings", "Railings,Rs.154", 154.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication(Iron or Alluminium)');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Safety Grill", "Railings,Rs.137", 137.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication(Iron or Alluminium)');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Sliding Gate", "Railings,Rs.425", 425.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication(Iron or Alluminium)');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rolling Shutter", "Railings,Rs.209", 209.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication(Iron or Alluminium)');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "SS Railings", "Railings,Rs.1260", 1260.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication(Iron or Alluminium)');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "SS Gate", "SS Gate,Rs.1200", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication(Iron or Alluminium)');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Window Grill", "Window Grill,Rs.154", 154.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shahabuddin" and s.name = 'Fabrication(Iron or Alluminium)');

update service1 set page_name='pathologyOrder' where name='Fabrication(Iron or Alluminium)';
insert into vendor1( first_name) values ("Prassana");
insert into vendor1( first_name) values ("Mohan");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kill Cockroaches", "Oval CockroachesFlying CockroachesAnts red and black For 1 BHK,Rs.605", 605.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kill Cockroaches", "Oval CockroachesFlying CockroachesAnts red and black,Rs.540",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kill Cockroaches", "Oval CockroachesFlying CockroachesAnts red and black,Rs.513",513.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Kill Cockroaches", "Oval CockroachesFlying CockroachesAnts red and black,Rs.500",500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rodents", "Rodents (Rats industrial rat poison) For 1 BHK,Rs.440",440.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rodents", "Rodents (Rats industrial rat poison) For 1 BHK,Rs.414",414.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bed Bugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 1 BHK,Rs.990",990.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bed Bugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 1 BHK,Rs.891",891.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bed Bugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 1 BHK,Rs.1100",1100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bed Bugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 1 BHK,Rs.1200",1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosquito ", "MOSQUITO  (spray) 1 BHK,Rs.550", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosquito ", "MOSQUITO  (spray) 1 BHK,Rs.540",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosquito ", "MOSQUITO  fogging,Rs.1320",1320.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Ants ", "Ants (Black, Red) 1 BHK,Rs.207",207.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Oval Cockraches ", "Oval CockroachesFlying CockroachesAnts red and black 2 BHK,Rs.715",715.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Oval Cockraches ", "Oval CockroachesFlying CockroachesAnts red and black 2 BHK,Rs.648",648.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Oval Cockraches ", "Oval CockroachesFlying CockroachesAnts red and black 2 BHK,Rs.513",513.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Oval Cockraches ", "Oval CockroachesFlying CockroachesAnts red and black 2 BHK,Rs.650",650.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rodents ", "Rodents (Rats industrial rat poison) 2 BHK,Rs.550",550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rodents", "Rodents (Rats industrial rat poison) 2 BHK,Rs.460",460.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bed Bugs ", "Bed Bugs (tablet canon gas) 24 hours place should be closed 2 BHK,Rs.1210",1210.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bed Bugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 2 BHK,Rs.1133",1133.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bed Bugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 2 BHK,Rs.1100",1100.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bed Bugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 2 BHK,Rs.1200",1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosquito ", "MOSQUITO  (spray) 2 BHK,Rs.550",550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosquito", "MOSQUITO  (spray) 2 BHK,Rs.540",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosquito", "MOSQUITO  fogging 2 BHK,Rs.1320",1320.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Ants", "Ants (Black Red) 2 BHK,Rs.230",230.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Oval Cockroaches ", "Oval CockroachesFlying CockroachesAnts red and black 3 BHK,Rs.660",660.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Oval Cockroaches", "Oval CockroachesFlying CockroachesAnts red and black 3 BHK,Rs.756",756.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Oval Cockroaches", "Oval CockroachesFlying CockroachesAnts red and black 3 BHK,Rs.684",684.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Oval Cockroaches", "Oval CockroachesFlying CockroachesAnts red and black 3 BHK,Rs.800",800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rodents", "Rodents (Rats industrial rat poison) 3 BHK,Rs.600",600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Rodents", "Rodents (Rats industrial rat poison) 3 BHK,Rs.517",517.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bedbugs ", "Bed Bugs (tablet canon gas) 24 hours place should be closed 3 BHK,Rs.1540",1540.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bedbugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 3 BHK,Rs.1485",1485.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bedbugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 3 BHK,Rs.1500",1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bedbugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 3 BHK,Rs.1400",1400.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosquito ", "MOSQUITO  (spray) 3 BHK,Rs.550",550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Mosquito ", "MOSQUITO  fogging 3 BHK,Rs.1320",1320.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Ants", "Ants (Black Red) 3 BHK,Rs.258.75",258.75, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Cockroaches", "Oval CockroachesFlying CockroachesAnts red and black 4 BHK,Rs.798",798.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bedbugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 4 BHK,Rs.2000",2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Prassana" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Bedbugs", "Bed Bugs (tablet canon gas) 24 hours place should be closed 4 BHK,Rs.2000",2000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Homey bee (small) ", "Honey bee only below 10 Ft.,Rs.550",550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Homey bee (small)", "Honey bee only below 10 Ft.,Rs.540.00",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Honey Bee (medium)", "Honey bee only below 10 Ft.,Rs.660",660.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Honey Bee (medium)", "Honey bee only below 10 Ft.,Rs.540.00",540.00, 5.00 from vendor1 v, service1 s where v.first_name = "David" and v.last_name = "Lukeraj" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Honey Bee(big)", "Honey bee only below 10 Ft.,Rs.990",990.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Termites per Sq. ft", "TERMITES without smell Rs. Per Sq. Ft ,Rs.4.40",4.40, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Termites per Sq. ft", "TERMITES without smell Rs. Per Sq. Ft ,Rs.8.00",8.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Termites per Sq. ft", "TERMITES with smell Rs. Per Sq. Ft,Rs.3.40",3.40, 5.00 from vendor1 v, service1 s where v.first_name = "Mohommed" and v.last_name = "M" and s.name = 'Pest Control');
insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Termites per Sq. ft", "TERMITES with smell Rs. Per Sq. Ft,Rs.8.00",8.00, 5.00 from vendor1 v, service1 s where v.first_name = "Mohan" and s.name = 'Pest Control');


update service1 set page_name='pathologyOrder' where name='Pest Control';


update service1 set name = 'Fabrication' where id = 16;
update service1 set display_order=34 where id=40;


 update service1 set active = 1;

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "Royal luxury emulsion Per Sq Ft,Rs.16.50", 16.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "ICI stain paint Per Sq Ft,Rs.22.50", 22.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "ICI finex paint Per Sq Ft,Rs.38.50", 38.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "Royal shine luxury emulsion Per Sq Ft,Rs.22.00", 22.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "Royal fintex Per Sq Ft,Rs.38.50", 38.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "Lusture zinc paint Per Sq Ft,Rs.44.00", 44.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "Premium luxuary emulsion Per Sq Ft,Rs.9.00", 9.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior Painting  (with out material)", "Tractor Emulsion Per Sq Ft,Rs.6.60", 6.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (with out material)", "Exterior soft finish Per Sq Ft,Rs.6.60", 6.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (with out material)", "Asian apex paint Per Sq Ft,Rs.6.60", 6.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (with out material)", "Asian apex ultima paint Per Sq Ft,Rs.6.60", 6.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "Royal luxury emulsion Per Sq Ft,Rs.27.50", 27.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "ICI stain paint Per Sq Ft,Rs.33.00", 33.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "ICI finex paint Per Sq Ft,Rs.49.50", 49.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "Royal shine luxury emulsion Per Sq Ft,Rs.38.50", 38.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "Royal fintex Per Sq Ft,Rs.52.80", 52.80, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "Lusture zinc paint Per Sq Ft,Rs.71.50", 71.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "Permium lixury emulsion Per Sq Ft,Rs.18.70", 18.70, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Interrior  Painting (with material)", "Tractor Emulsion Per Sq Ft,Rs.16.50", 16.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (with out material)", "Exterior soft finisf Per Sq Ft,Rs.60.50", 60.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (with out material)", "Asian apex paint Per Sq Ft,Rs.15.40", 15.40, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior (with out material)", "Asian apex ultima paint Per Sq Ft,Rs.14.30", 14.30, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "French Poolish including 1/2 to 6 inch beeding,Rs.58.30", 58.30, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "Melamyne Poolish including 1/2 to 6 inch beeding,Rs.77.00", 77.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "PU Poolish including 1/2 to 8 inch beeding,Rs.77.00", 77.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "ItalianPU Poolish including 1/2 to 8 inch beeding,Rs.181.50", 181.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "MRF PU Poolish including 1/2 to 8 inch beeding,Rs.132.00", 132.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "DUCO paint including 1/2 to 6  inch beeding,Rs.187.00", 187.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "Lamination(poly coat) including 1/2 to 6  inch beeding,Rs.368.50", 368.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "French Poolish including 1/2 to 6 inch beeding,Rs.88.50", 88.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "Melamyne Poolish including 1/2 to 6 inch beeding,Rs.115.50", 115.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "PU Poolish including 1/2 to 8 inch beeding,Rs.192.50", 192.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "ItalianPU Poolish including 1/2 to 8 inch beeding,Rs.297.50", 297.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "MRF PU Poolish including 1/2 to 8 inch beeding,Rs.242.00", 242.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "DUCO paint including 1/2 to 6  inch beeding,Rs.352.50", 352.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "Lamination(poly coat) including 1/2 to 6  inch beeding,Rs.542.00", 542.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "Wood painting,Rs.16.50", 16.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood Poolish (with out material)", "Wood painting,Rs.11.00", 11.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood paintng (with material )", "Wood painting ,Rs.27.50", 27.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Wood paintng (with material )", "Wood painting ,Rs.20.00", 20.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Grill painting (with out material)", "Grill painting ,Rs.9.00", 9.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Grill painting (with out material)", "Grill painting spray ,Rs.77.00",77.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Grill painting with material", "Grill painting ,Rs.16.50",16.50, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Grill painting with material", "Grill painting spray ,Rs.132.00",132.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Exterior repainting (with out material)", "Apex ultima,Rs.6.00",6.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Exterior repainting (with out material)", "Ace paint,Rs.6.00",6.00, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Exterior repainting (with out material)", "Cement base paint,Rs.3.60",3.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Exterior repainting (with out material)", "Distemper wall paint,Rs.4.80",4.80, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior repainting with material", "Apex ultima,Rs.9.60",9.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior repainting with material", "Ace paint,Rs.8.40",9.60, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior repainting with material", "Cement base paint,Rs.7.20",7.20, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Exterior repainting with material", "Distemper wall paint,Rs.7.20",7.20, 5.00 from vendor1 v, service1 s where v.first_name = "Syed" and v.last_name = "Shamshuddin" and s.name = 'Painter');


update service1 set page_name='pathologyOrder' where name='Painter';




insert into category1 (name, description,active ) values ("Wedding", "Wedding",1);


insert into service1(name,parent_category, page_name) (select  "Wedding Planner", c.id,'pathologyOrder' from category1 c where c.name='Wedding');

insert into vendor1( first_name ) values ("Classy Traditions");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Classy Traditions" and s.name = 'Wedding Planner'); 

insert into service1 (name,is_bold,is_dummy,active) values ("Wedding",1,0,1);


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Short and Sweet Wedding ", "Your wedding includes Veg Catering Decor Invitation Photography Hooney Moon packages return gifts electricity charges and much more strarts from the given price, Rs.300000", 300000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Classy Traditions" and s.name = 'Wedding Planner');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Premium Wedding ", "Your wedding includes Veg Catering Decor Invitation Photography Hooney Moon packages return gifts electricity charges and much more strarts from the given price, Rs.800000", 800000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Classy Traditions" and s.name = 'Wedding Planner');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Royal Wedding ", "Your wedding includes Veg Catering Decor Invitation Photography Hooney Moon packages return gifts electricity charges and much more strarts from the given price, Rs.1500000", 1500000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Classy Traditions" and s.name = 'Wedding Planner');

update service1 set display_order='36' where is_bold=1 and name='Wedding';
update service1 set display_order='37' where name='Wedding Planner';
update service1 set display_order='38' where name='Coming Soon';
update service1 set display_order='39' where name='Beauty';




insert into category1 (name, description,active ) values ("Appaliance Repair", "Appaliance Repair",1);

insert into service1(name,parent_category, page_name) (select  "Electronics Repair", c.id,'pathologyOrder' from category1 c where c.name='Appaliance Repair');

insert into service1(name,parent_category, page_name) (select  "Home Appaliance Repair ", c.id,'pathologyOrder' from category1 c where c.name='Appaliance Repair');

insert into service1(name,parent_category, page_name) (select  "Mobile Repair Service", c.id,'pathologyOrder' from category1 c where c.name='Appaliance Repair');


insert into vendor1( first_name ) values ("Tech hub");
insert into vendor1( first_name ) values ("Dhanraj");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Tech hub" and s.name = 'Electronics Repair');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appaliance Repair');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Mobile Repair Service');

insert into service1 (name,is_bold,is_dummy,active) values ("Appaliance Repair",1,0,1);


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Antique to Restoreation ", "Desktop Repair formating PC hardware repair and repalcement min charges for home visit , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Tech hub" and s.name = 'Electronics Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Fix and Shine ", "Repair your laptop fix your brken screen and  Min charges per home visit, Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Tech hub" and s.name = 'Electronics Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Print Easy ", "Printer Repair and services at your door step Min repair charges per home visit , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Tech hub" and s.name = 'Electronics Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Burnt ovens", "Oven Repair min charges per home visit , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appaliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Blank Telecast ", "Television Repairs and services all kinds of lcd led plasma tv  min charges per home visit , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appaliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Grinder Repair ", "All kinds of Grinders and Mixers repairs and services with min charges per home visit , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appaliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dirty Cleaing Vaccum", "Get your vaccum cleaner repaired and serviced at your door step at min charges per home visit , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appaliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Poor Sound Quality ", "Get your home theater system repaired Min charges repair charges per home visit , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appaliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Dead kitchen  ", "Electric Rice cooker repairs min repair charges per home vist , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Home Appaliance Repair');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Creacked Screen ", "Shattered mobile or tablet screen mobile phone repair at your door step min charges per home visit , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Mobile Repair Service');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Boost Your Mobile", "Update your android windows ios phones min charges repair at your door step, Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Mobile Repair Service');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Flashback ", "Data recovering and anti virus updates , Rs.300",300.00, 5.00 from vendor1 v, service1 s where v.first_name = "Dhanraj" and s.name = 'Mobile Repair Service');


update service1 set display_order=38 where name='Appaliance Repair';
update service1 set display_order=39 where name='Electronics Repair';
update service1 set display_order=40 where name='Home Appaliance Repair';
update service1 set display_order=41 where name='Mobile Repair Service';
update service1 set display_order=42 where name='Coming Soon';
update service1 set display_order=43 where name='Beauty';
update service1 set active=1 where name='Electronics Repair';
update service1 set active=1 where name='Home Appaliance Repair';
update service1 set active=1 where name='Mobile Repair Service';





insert into vendor1( first_name ) values ("Clean Pro");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Clean home ", "1BHK hygiene cleaning , Rs.5000", 5000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Sweet Home-1 ", "2BHK Empty Flat cleaning , Rs.6200", 6200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Home Sweet Home-2 ", "2BHK occupied Flat Claning, Rs.6500", 6500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Super Clean-1", "3BHK Empty Falt Cleaning , Rs.6800", 6800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Super Clean-2", "3BHK Occupied Flat Cleaing, Rs.7200", 7200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Combo clean", "2 Bathroom and kitchen , Rs.3500", 3500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Shiney Shower Room ", "Bathroom cleaning services per bathroom , Rs.1000", 1000.00, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Home cleaning');


insert into service1(name,parent_category, page_name) (select  "Carpet Cleaning", c.id,'pathologyOrder' from category1 c where c.name='Home Cleaning');

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Carpet Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Tidy Finishn -1 ", "Carpet cleaing less then 5000 Sq Ft Note Price based on per Sq ft , Rs.2.5",2.50, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Carpet Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Tidy Finishn -2 ", "Carpet cleaing More then 5000 Sq Ft Note Price based on per Sq ft , Rs.1.5",1.50, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Carpet Cleaning');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Chair Clean ", "Chair Shampooing per Chair, Rs.40",40, 5.00 from vendor1 v, service1 s where v.first_name = "Clean Pro" and s.name = 'Carpet Cleaning');

update service1 set active=1 where name='Carpet Cleaning';
update service1 set display_order=36 where name='Carpet Cleaning';
update service1 set display_order=37 where name='Wedding';
update service1 set display_order=38 where name='Wedding Planer';
update service1 set display_order=39 where name='Appaliance Repair';
update service1 set display_order=40 where name='Electronics Repair';
update service1 set display_order=41 where name='Home Appaliance Repair ';
update service1 set display_order=42 where name='Mobile Repair Service';
update service1 set display_order=43 where name='Coming Soon';
update service1 set display_order=44 where name='Beauty';

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Plumber');
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');


insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "capentry work for one hour", "capentry work for one hour, Rs.350", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "capentry work for 90 min", "capentry work for 90 min, Rs.550", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "capentry work for to 120mins", "capentry work for 0-120mins, Rs.700", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "capentry work for 0 to 180 mins", "capentry work for 0-180 mins, Rs.1050", 1050.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Carpentry');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Electricain  work for 1 hour ", "Electricain  work for 1 hour , Rs.350", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Electricain work for 0 to 90 min ", "Electricain work for 0-90 min , Rs.550", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Electricain  work for 0 to 120mins ", "Electricain  work for 0-120min , Rs.700", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Electricain  work for 0 to 180 mins ", "Electricain  work for 0-180 mins  , Rs.1050", 1050.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Electrician');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Plumbing work for 1 hour ", "Plumbing work for 1 hour , Rs.350", 350.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Plumbing work for 0-90 mins", "Plumbing work for 0 to 90 min, Rs.550", 550.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Plumbing work for 0-90 mins", "Plumbing work for 0 to 90 min, Rs.700", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Plumber');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1 BHK bed bugs GEL", "1 BHK bed bugs GEL, Rs.900", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "2 BHK bed bugs GEL", "2 BHK bed bugs GEL, Rs.1200", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 BHK bed bugs GEL", "3 BHK bed bugs GEL, Rs.1500", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "4 BHK bed bugs GEL", "4 BHK bed bugs GEL, Rs.1600", 1600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1 BHK bed bugs SPRAY", "1 BHK bed bugs SPRAY, Rs.700", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "2 BHK bed bugs SPRAY", "2 BHK bed bugs SPRAY, Rs.800", 800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 BHK bed bugs SPRAY", "3 BHK bed bugs SPRAY, Rs.900", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "4 BHK bed bugs SPRAY", "4 BHK bed bugs SPRAY, Rs.1200", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1 BHK TERMTES GEL", "1 BHK TERMTES GEL, Rs.900", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "2 BHK TERMTES GEL", "2 BHK TERMTES GEL, Rs.1200", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 BHK TERMTES GEL", "3 BHK TERMTES GEL, Rs.1500", 1500.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "4 BHK TERMTES GEL", "4 BHK TERMTES GEL, Rs.1600", 1600.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "1 BHK TERMITS SPRAY", "1 BHK TERMITS SPRAY, Rs.700", 700.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "2 BHK TERMITS SPRAY", "2 BHK TERMITS SPRAY, Rs.800", 800.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "3 BHK TERMITS SPRAY", "3 BHK TERMITS SPRAY, Rs.900", 900.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "4 BHK TERMITS SPRAY", "4 BHK TERMITS SPRAY, Rs.1200", 1200.00, 5.00 from vendor1 v, service1 s where v.first_name = "Jack On Block" and s.name = 'Pest Control');




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

update service1 set display_order=43 where is_bold=1 and name='Photography';
update service1 set display_order=44 where name='Photography' and is_bold=0;
update service1 set display_order=45 where name='Coming Soon';
update service1 set display_order=46 where name='Beauty';

update service1 set active=1;




insert into vendor1( first_name) values ("Balakrishna");
insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "Bala" and v.last_name = "krishna" and s.name = 'Plumber');


