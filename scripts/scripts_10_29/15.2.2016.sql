alter table vendor1 modify column serving_city int(11) DEFAULT '0';
update vendor1 set serving_city='24';

update service1 set 
icon_img ="nbdimages/serviceicons/ico_laundry.png" where id=51;

update service1 set description = "We take care of your laundry and dry cleaning so you don't need to lift a finger."
where id = 51;

update service1 set 
img_url ="/images/ico/mapicon/srv_fabrication.jpg" where id=51;

update category1 set 
img_url ="nbdimages/mobile/laundry.png" where id=12;

update service1 set display_text = '
 <img  src="nbdimages/images/physiotheraphy.png" alt="laundry image" class="img-responsive imageName" /> 
<h3 class = "textContentId">We take care of your laundry and dry cleaning so you dont need to lift a finger.</h3>
<p class = "textContentId1"> From Online ordering to convenient drop off stations and at home pickup and delivery system, we offer the reasonably priced, high-quality dry cleaning and laundry services. </p>
<p class = "textContentId2">  
We have modeled our business on three key benefits to our customers which are 1- At your door, 2- Expert care, 3- Competitive pricing </p>
' where id =51;



