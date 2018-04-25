insert into category1 (name, description,active ) values ("Photography", "Photography",1);

insert into service1(name,parent_category, page_name) (select  "Photography", c.id,'pathologyOrder' from category1 c where c.name='Photography');

insert into vendor1( first_name,address,mobile_number ) values ("ARB Photography","C315, Radiant Lakeview apartments, 
Karnashree layout, Medehalli, KR Puram post
Bangalore - 560049","8123085855");

insert into vendor_service1 ( vendor_id, service_id ) (select v.id , s.id from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service1 (name,is_bold,is_dummy,active) values ("Photography",1,0,1);

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Pixels (1-4 Hours)", "Pure Candid Photography with all the Editing and Photo Book NOTE Album Cost Extra",30000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold Pixels  (1-4 hours)", "Pure Candid Photography with Editing and album NOTE Album Cost Extra",20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Pixels  (1-4 hours)", "Semi Candid  with Coffee Table Size Album without Editing NOTE Album Cost Extra",10000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Platinum Pixels (4-8 hours)", "Pure Candid Photography with all the Editing and 15x24  Photo Book 200 pictures of your choice NOTE Album Cost Extra staring from 30000",30000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Gold Pixels  ( (4-8 hours)", "Pure Candid Photography with Editing and Album NOTE Album Cost Extra 12x20 Album Sheets with 30 Sheets and 180 Photos of your choice Starting from 20000",20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

insert into service_unit1( vendor_id, service_id,name, description, price, discount)
( select v.id , s.id , "Silver Pixels  (4-8 hours)", "Semi Candid  with Coffee Table Size Album without Editing 8x24 Album With 20 Sheets and 120 Photos selected by Customers NOTE Album Cost Extra",20000.00, 5.00 from vendor1 v, service1 s where v.first_name = "ARB Photography" and s.name = 'Photography');

update service1 set active=1 where name='Photography';

update service1 set display_order=43 where is_bold=1 and name='Photography';
update service1 set display_order=44 where name='Photography' and is_bold=0;
update service1 set display_order=45 where name='Coming Soon';
update service1 set display_order=46 where name='Beauty';


UPDATE  service1 SET  display_text = '<img  src="nbdimages/images/camera.jpg" alt="yoga image" class="img-responsive imageName" />
<h3 class = "textContentId"> We capture your golden moment in a snap</h3>
<p class = "textContentId"> Photography is an art which can bring your creativity to life.</p>
<p class = "textContentId2"> In Aurospaces, we do believe that “what it feels like is an art of observation”.</p>' where name  = 'Photography';





