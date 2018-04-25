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
















































