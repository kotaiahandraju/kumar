//aboutMyself, annualIncome, bodyType, bodyTypeName, caste, casteName, cm, 
//
//aboutMyself : "gdfdgd", annualIncome : "INR 2 Lakh to 4 Lakh", bodyType : "2", bodyTypeName : "Athletic", caste : "3", 
//casteName : "Viswabrahmin", cm : "175", companyName : "", complexion : "6", complexionName : "Medium", createProfileFor : "Self", 
//created_time : "2017-11-03 12:31:46.0", currentCity : "Vijayawada", currentCityName : "Vijayawada", currentCountry : "12", currentCountryName : "switzerland", 
//currentState : "AP", currentStateName : "switzerland", diet : "Veg", disability : "Physical Disability", dob : "02-November-1967", dosam : "Yes", dosamName : "", 
//drinking : "Occasionally", education : "4", educationName : "MBA", email : "andraju.kotaiah@gmail.com", firstName : "koti ",gender : "Female", 
//gotram : "gggg", haveChildren : null, height : "18", id : "8", image : "img/8612.png", inches : "5'9", lastName : "and", maritalStatus : "Married", 
//mobile : "999999999", monthlyIncome : null, motherTongue : "6", motherTongueName : "English", 
//occupation : "45", occupationName : "Housewife", 
//password : "Ý¹¶ŽjÇœ+«¤‘ð¨", rAgeFrom : "789", 
//rAgeTo : "ghf", rAnnualIncome : "INR 2 Lakh to 4 Lakh", rCaste : "3", rCountry : "3", rCreateProfileFor : "Friend", rDiet : "Non-Veg", rEducation : "14", 
//rHeight : "fghfhg", rMaritalStatus : "Married", rMotherTongue : "2", rOccupation : "45", rReligion : "3", rState : "AP", requiredStateName : "Australia",
//rWorkingWith : "Private Company", 
//religion : "1", religionName : "Hindu", requiredCasteName : "Viswabrahmin", requiredCountry : "Australia", requiredEducationName : "MBA", 
//requiredMotherTongue : "Hindi", requiredOccupationName : "Housewife", requiredReligionName : "Christian", role_id : "1", showall : null, 
//smoking : "No", star : "18", starName : "Purvabhadra", status : "1", updated_time : "2017-11-03 17:03:09.0", userId : "8", username : null, 
//userrequirementId : "5", workingWith : "Private Company", registerwith : ""

function viewProfile(id){
		$('#dial1').html('');
		
		var username = serviceUnitArray[id].username;
		
		var registerwith = null; registerwith = serviceUnitArray[id].registerwith;
		if(registerwith == "" || registerwith == null || registerwith == "undefined"){registerwith = "---";}
		
		var executiveName = null; executiveName = serviceUnitArray[id].executiveName;
		if(executiveName == "" || executiveName == null || executiveName == "undefined"){executiveName = "---";}
		
		var email = null; email = serviceUnitArray[id].email;
		if(email == "" || email == null || email == "undefined"){email = "---";}
		
		var createProfileFor = null; createProfileFor = serviceUnitArray[id].createProfileFor;
		if(createProfileFor == "" || createProfileFor == null || createProfileFor == "undefined"){createProfileFor = "---";}		

		var gender = null; gender = serviceUnitArray[id].gender;
		if(gender == "" || gender == null || gender == "undefined"){gender = "---";}
		
		var firstName = null; firstName = serviceUnitArray[id].firstName;
		if(firstName == "" || firstName == null || firstName == "undefined"){firstName = "---";}
		
		var lastName = null; lastName = serviceUnitArray[id].lastName;
		if(lastName == "" || lastName == null || lastName == "undefined"){lastName = "---";}
		
		var dob = null; dob = serviceUnitArray[id].dob;
		if(dob == "" || dob == null || dob == "undefined"){dob = "---";}
		
		var religionName = null; religionName = serviceUnitArray[id].religionName;
		if(religionName == "" || religionName == null || religionName == "undefined"){religionName = "---";}

		var motherTongueName = null; motherTongueName = serviceUnitArray[id].motherTongueName;
		if(motherTongueName == "" || motherTongueName == null || motherTongueName == "undefined"){motherTongueName = "---";}
		
		var currentCountryName = null; currentCountryName = serviceUnitArray[id].currentCountryName;
		if(currentCountryName == "" || currentCountryName == null || currentCountryName == "undefined"){currentCountryName = "---";}
		
		var currentStateName = null; currentStateName = serviceUnitArray[id].currentStateName;
		if(currentStateName == "" || currentStateName == null || currentStateName == "undefined"){currentStateName = "---";}
		
		var currentCityName = null; currentCityName = serviceUnitArray[id].currentCityName;
		if(currentCityName == "" || currentCityName == null || currentCityName == "undefined"){currentCityName = "---";}
		
		var maritalStatus = null; maritalStatus = serviceUnitArray[id].maritalStatus;
		if(maritalStatus == "" || maritalStatus == null || maritalStatus == "undefined"){maritalStatus = "---";}
		
		var casteName = null; casteName = serviceUnitArray[id].casteName;
		if(casteName == "" || casteName == null || casteName == "undefined"){casteName = "---";}
		
		var gotram = null; gotram = serviceUnitArray[id].gotram;
		if(gotram == "" || gotram == null || gotram == "undefined"){gotram = "---";}
		
		var starName = null; starName = serviceUnitArray[id].starName;
		if(starName == "" || starName == null || starName == "undefined"){starName = "---";}
		
		var dosam = null; dosam = serviceUnitArray[id].dosam;
		if(dosam == "" || dosam == null || dosam == "undefined"){dosam = "---";}
		
		var dosamName = null; dosamName = serviceUnitArray[id].dosamName;
		if(dosamName == "" || dosamName == null || dosamName == "undefined"){dosamName = "---";}
		
		//
		var educationName = null; educationName = serviceUnitArray[id].educationName;
		if(educationName == "" || educationName == null || educationName == "undefined"){educationName = "---";}
		
		var workingWith = null; workingWith = serviceUnitArray[id].workingWith;
		if(workingWith == "" || workingWith == null || workingWith == "undefined"){workingWith = "---";}
		
		//
		var occupationName = null; occupationName = serviceUnitArray[id].occupationName;
		if(occupationName == "" || occupationName == null || occupationName == "undefined"){occupationName = "---";}
		
		var annualIncome = null; annualIncome = serviceUnitArray[id].annualIncome;
		if(annualIncome == "" || annualIncome == null || annualIncome == "undefined"){annualIncome = "---";}
		
		var diet = null; diet = serviceUnitArray[id].diet;
		if(diet == "" || diet == null || diet == "undefined"){diet = "---";}
		
		var smoking = null; smoking = serviceUnitArray[id].smoking;
		if(smoking == "" || smoking == null || smoking == "undefined"){smoking = "---";}
		
		var drinking = null; drinking = serviceUnitArray[id].drinking;
		if(drinking == "" || drinking == null || drinking == "undefined"){drinking = "---";}
		
		var height = null; height = serviceUnitArray[id].height;
		if(height == "" || height == null || height == "undefined"){height = "---";}
		
		var bodyTypeName = null; bodyTypeName = serviceUnitArray[id].bodyTypeName;
		if(bodyTypeName == "" || bodyTypeName == null || bodyTypeName == "undefined"){bodyTypeName = "---";}
		
		var complexionName = null; complexionName = serviceUnitArray[id].complexionName;
		if(complexionName == "" || complexionName == null || complexionName == "undefined"){complexionName = "---";}
		
		var mobile = null; mobile = serviceUnitArray[id].mobile;
		if(mobile == "" || mobile == null || mobile == "undefined"){mobile = "---";}
		
		var aboutMyself = null; aboutMyself = serviceUnitArray[id].aboutMyself;
		if(aboutMyself == "" || aboutMyself == null || aboutMyself == "undefined"){aboutMyself = "---";}
		
		var disability = null; disability = serviceUnitArray[id].disability;
		if(disability == "" || disability == null || disability == "undefined"){disability = "---";}
		
		var rAgeFrom = null; rAgeFrom = serviceUnitArray[id].rAgeFrom;
		if(rAgeFrom == "" || rAgeFrom == null || rAgeFrom == "undefined"){rAgeFrom = "---";}
		
		var rAgeTo = null; rAgeTo = serviceUnitArray[id].rAgeTo;
		if(rAgeTo == "" || rAgeTo == null || rAgeTo == "undefined"){rAgeTo = "---";}
		
		var rHeight = null; rHeight = serviceUnitArray[id].rHeight;
		if(rHeight == "" || rHeight == null || rHeight == "undefined"){rHeight = "---";}
		
		var rMaritalStatus = null; rMaritalStatus = serviceUnitArray[id].rMaritalStatus;
		if(rMaritalStatus == "" || rMaritalStatus == null || rMaritalStatus == "undefined"){rMaritalStatus = "---";}
		
		var requiredReligionName = null; requiredReligionName = serviceUnitArray[id].requiredReligionName;
		if(requiredReligionName == "" || requiredReligionName == null || requiredReligionName == "undefined"){requiredReligionName = "---";}
		
		var requiredCasteName = null; requiredCasteName = serviceUnitArray[id].requiredCasteName;
		if(requiredCasteName == "" || requiredCasteName == null || requiredCasteName == "undefined"){requiredCasteName = "---";}
		
		var requiredMotherTongue = null; requiredMotherTongue = serviceUnitArray[id].requiredMotherTongue;
		if(requiredMotherTongue == "" || requiredMotherTongue == null || requiredMotherTongue == "undefined"){requiredMotherTongue = "---";}
		
		var requiredCountry = null; requiredCountry = serviceUnitArray[id].requiredCountry;
		if(requiredCountry == "" || requiredCountry == null || requiredCountry == "undefined"){requiredCountry = "---";}
		
		//
		var requiredStateName = null; requiredStateName = serviceUnitArray[id].requiredStateName;
		if(requiredStateName == "" || requiredStateName == null || requiredStateName == "undefined"){requiredStateName = "---";}
		
		var requiredStateName = null; requiredStateName = serviceUnitArray[id].requiredStateName;
		if(requiredStateName == "" || requiredStateName == null || requiredStateName == "undefined"){requiredStateName = "---";}
		
		var requiredEducationName = null; requiredEducationName = serviceUnitArray[id].requiredEducationName;
		if(requiredEducationName == "" || requiredEducationName == null || requiredEducationName == "undefined"){requiredEducationName = "---";}
		
		var rWorkingWith = null; rWorkingWith = serviceUnitArray[id].rWorkingWith;
		if(rWorkingWith == "" || rWorkingWith == null || rWorkingWith == "undefined"){rWorkingWith = "---";}
		
		var requiredOccupationName = null; requiredOccupationName = serviceUnitArray[id].requiredOccupationName;
		if(requiredOccupationName == "" || requiredOccupationName == null || requiredOccupationName == "undefined"){requiredOccupationName = "---";}
		
		var rAnnualIncome = null; rAnnualIncome = serviceUnitArray[id].rAnnualIncome;
		if(rAnnualIncome == "" || rAnnualIncome == null || rAnnualIncome == "undefined"){rAnnualIncome = "---";}
		
		var rCreateProfileFor = null; rCreateProfileFor = serviceUnitArray[id].rCreateProfileFor;
		if(rCreateProfileFor == "" || rCreateProfileFor == null || rCreateProfileFor == "undefined"){rCreateProfileFor = "---";}
		
		var rDiet = null; rDiet = serviceUnitArray[id].rDiet;
		if(rDiet == "" || rDiet == null || rDiet == "undefined"){rDiet = "---";}
		
		

		 var tblRow = "<div class='container table-responsive'><div class='row'>"
		 		+ 	"<div class='col-sm-2'>"
		 		+		"<i class='fa fa-user' style='font-size: 10em;'></i>"
//	 	 		+		"<img class='img-responsive' src='../img/default.png' style='width: auto !important;height: 120px !important;'>"
		 		+ 	"</div>"
		 		+ 	"<div class='col-sm-10' style='border: 1px solid red;'>"
		 		+		"<table class='table table-hoverable table-condensed' style='width: 100%;'>"
				+			"<tr>"
				+				"<td><b>Profile Created for</b></td>"
				+				"<td>:</td><td>"+createProfileFor+"</td>"
				+				"<td><b><spring:message code='label.executiveName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+executiveName+"</td>"
				+			"</tr>"
				//Basic Information
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Basic Information</b></td></tr>"
				+			"<tr>"
				+				"<td><b>First Name</b></td>"
				+				"<td>:</td><td>"+firstName+"</td>"
				+				"<td><b>Last Name</b></td>"
				+				"<td>:</td><td>"+lastName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Gender</b></td>"
				+				"<td>:</td><td>"+gender+"</td>"
				+				"<td><b>Date of Birth</b></td>"
				+				"<td>:</td><td>"+dob+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Email</b></td>"
				+				"<td>:</td><td>"+email+"</td>"
				+				"<td><b>Caste</b></td>"
				+				"<td>:</td><td>"+casteName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Gothram</b></td>"
				+				"<td>:</td><td>"+gotram+"</td>"
				+				"<td><b>Nakshtram</b></td>"
				+				"<td>:</td><td>"+starName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Dosham</b></td>"
				+				"<td>:</td><td>"+dosam+"</td>"
				+				"<td><b>Dosham Name</b></td>"
				+				"<td>:</td><td>"+dosamName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Marital Status</b></td>"
				+				"<td>:</td><td colspan='4'>"+maritalStatus+"</td>"
				+			"</tr>"
				//Widow / Divorcee Details
//	 			+			mStatus
				+			"<tr>"
				+				"<td><b>Religion</b></td>"
				+				"<td>:</td><td>"+religionName+"</td>"
				+				"<td><b>Mother Tongue</b></td>"
				+				"<td>:</td><td>"+motherTongueName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Where you live</b></td>"
				+				"<td>:</td><td>"+currentCountryName+"</td>"
				+				"<td><b>You live in</b></td>"
				+				"<td>:</td><td>"+currentStateName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>City</b></td>"
				+				"<td>:</td><td>"+currentCityName+"</td>"
				+				"<td><b>Mobile</b></td>"
				+				"<td>:</td><td>"+mobile+"</td>"
				+			"</tr>"
				//Education & Job information
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Education &amp; Job Information</b></td></tr>"
				+			"<tr>"
				+				"<td><b>Education</b></td>"
				+				"<td>:</td><td>"+educationName+"</td>"
				+				"<td><b>Working with</b></td>"
				+				"<td>:</td><td>"+workingWith+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Occupation</b></td>"
				+				"<td>:</td><td>"+occupationName+"</td>"
				+				"<td><b>Annual Income</b></td>"
				+				"<td>:</td><td>"+annualIncome+"</td>"
				+			"</tr>"
				//Personal Details
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Personal Details</b></td></tr>"
				+			"<tr>"
				+				"<td><b>Diet</b></td>"
				+				"<td>:</td><td>"+diet+"</td>"
				+				"<td><b>Smoking</b></td>"
				+				"<td>:</td><td>"+smoking+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Drinking</b></td>"
				+				"<td>:</td><td>"+drinking+"</td>"
				+				"<td><b>Height</b></td>"
				+				"<td>:</td><td>"+height+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Body Type</b></td>"
				+				"<td>:</td><td>"+bodyTypeName+"</td>"
				+				"<td><b>Complexion</b></td>"
				+				"<td>:</td><td>"+complexionName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>About Yourself</b></td>"
				+				"<td>:</td><td>"+aboutMyself+"</td>"
				+				"<td><b>Any Disability</b></td>"
				+				"<td>:</td><td>"+disability+"</td>"
				+			"</tr>"
				//Life Partner Requirements
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Life Partner Requirements</b></td></tr>"
				+			"<tr>"
				+				"<td><b>Height</b></td>"
				+				"<td>:</td><td>"+rHeight+"</td>"
				+				"<td><b>Age</b></td>"
				+				"<td>:</td><td>"+rAgeFrom+" <b>to</b> "+rAgeTo+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Marital Status</b></td>"
				+				"<td>:</td><td colspan='4'>"+rMaritalStatus+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Religion</b></td>"
				+				"<td>:</td><td>"+religionName+"</td>"
				+				"<td><b>Caste</b></td>"
				+				"<td>:</td><td>"+requiredCasteName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Mother Tongue</b></td>"
				+				"<td>:</td><td>"+motherTongueName+"</td>"
				+				"<td><b>Where you live</b></td>"
				+				"<td>:</td><td>"+currentCountryName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>You live in</b></td>"
				+				"<td>:</td><td>"+currentStateName+"</td>"
				+				"<td><b>Education</b></td>"
				+				"<td>:</td><td>"+educationName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Working with</b></td>"
				+				"<td>:</td><td>"+workingWith+"</td>"
				+				"<td><b>Profession area</b></td>"
				+				"<td>:</td><td>"+requiredOccupationName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Annual Income</b></td>"
				+				"<td>:</td><td colspan='4'>"+rAnnualIncome+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Profile Created by</b></td>"
				+				"<td>:</td><td>"+rCreateProfileFor+"</td>"
				+				"<td><b>Diet</b></td>"
				+				"<td>:</td><td>"+rDiet+"</td>"
				+			"</tr>"
				+		"</table>"
//	 	 		+		"<div class='row'>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.createdByName' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+created_by+"</div>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.executiveName' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+executiveName+"</div>"
//	 	 		+		"</div>"
//	 	 		+		"<div class='row'>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.casteName' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+castname+"</div>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.subCaste' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+SubCaste+"</div>"
//	 	 		+		"</div>"
//	 	 		+		"<div class='row'>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.surName' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+sname+"</div>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.name' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+name+"</div>"
//	 	 		+		"</div>"
		 		+ 	"</div>"
		 		+ "</div></div>";
		 
		 $(tblRow).appendTo('#dial1');
		 $('#dial1').dialog({title: "Profile of "+username, width: 1199, height: 600, modal: true}).dialog('open');
//		 	$(window).scrollTop($('.wrapper').offset().top);
//		 	$(".view_list").hide();
//		 	$('#view_list1').hide();
	 }
