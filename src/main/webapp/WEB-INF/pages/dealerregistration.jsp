<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="${baseurl }/assets/css/styles.css">
<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Kumar</title>
<script type='text/javascript' src='assets/js/jquery-1.10.2.min.js'></script>
<script type="text/javascript">
window.setTimeout(function() {
    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 5000);
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<script type='text/javascript' src='${baseurl }/js/ajax.js'></script>
  
                <script type='text/javascript' src="${baseurl }/js/jquery.blockUI.min.js" ></script>
				

<style type="text/css">
.impColor{color:red;}
.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}
body {
background:#fff; !important}
[class*="panel-"].panel .panel-body .panel-footer{
border-top: 0px solid #dddddd !important;
}
.loghead {
padding:5px;
background:#293f4b;
height:auto;
left:0;
top:0;
right:0;
position:fixed;
z-index:1;
}
.plogin  {
    margin-top: 10px !important;
    box-shadow: inset 0 0 0 1px rgba(255,255,255,0.7), inset 0 0 0 2px rgba(0,0,0,0), inset 0 0 0 3px rgba(0,0,0,0);
    background-color: rgba(0,0,0,0);
    border: 1px solid transparent;
    border-radius: 2px;
    box-sizing: border-box;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    font-size: 15px;
    font-weight: 600;
    height: 32px;
    line-height: 32px;
    overflow: hidden;
    outline-width: 1px;
    padding: 0;
    position: relative;
    text-align: center;
    text-decoration: none;
    transition-duration: 167ms;
    transition-property: background-color, box-shadow, color;
    transition-timing-function: cubic-bezier(0, 0, 0.2, 1);
    vertical-align: middle;
    z-index: 0;
    float:right;
}
.plogin a {
color:#fff !important;
padding:5px 15px;
list-style:none;
text-decoration:none;
}
.lfotter {
position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    background-color: #293f4b;
    color: white;
    text-align: center;
    padding:5px;
}
.oms {
color:#fff;
font-size:24px;
}
.lis {
list-style:none;
text-decoration:none !important;
}
.pb {
    background: rgba(255,255,255,0.7) !important;
    padding: 30px 40px !important;
}
@media only screen and (max-width: 640px) and (min-width: 320px) {
.loghead { 
position:absolute;
}
focusedform .lfotter {
position:relative;
}
.form-horizontal .control-label {
    text-align: right;
    margin-bottom: 0;
    padding-top: 7px;
    font-weight:normal;
  }
.oms {
font-size:12px;
}
.pb h4 {
font-size:18px !important;
}
.focusedform .verticalcenter {
margin-top:0px;
top:27%;
left:50%;
}
}
@media (min-width: 768px) {
  .form-horizontal .control-label {
    text-align: right;
    margin-bottom: 0;
    padding-top: 7px;
    font-weight:normal;
  }
}
@media only screen and (min-width:600px) and (max-width:640px){ 
.focusedform .verticalcenter {
margin-top:0px;
top:47%;
left:50%;
}
.oms {
font-size:11px;
}
focusedform .lfotter {
position:relative;
}

 .control-label {
 font-weight:normal;
font-family: 'Source Sans Pro', 'Segoe UI', 'Droid Sans', Tahoma, Arial, sans-serif;
font-size: 14px;
 }}
 .panel-heading {
    padding: 1px 15px !important; }
    .dr {
    margin-top:54px;
    }
</style>
   

</head>
<body>
<c:if test="${not empty msg}">
		<div class="msgcss row">
			<div class="col-sm-4 col-sm-offset-4">
				<div class="form-group">
					<div class="alert alert-${cssMsg} fadeIn animated">${msg}</div>
				</div>
			</div>
		</div>
	</c:if>
<div class="col-md-12 loghead">
  <div class="col-md-6 col-xs-6">
 <img  src="img/klogo1.png"/><span class="oms">Order Management System</span>
 </div>
 <div class="col-md-6 col-xs-4 pull-right">
 <p class="plogin" align="right"><a href="LoginHome">Join Now </a></p>
 </div>
</div>
<div class="clearfix"></div>
            <div class="col-md-12 col-sm-12 dr">
               <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Dealer Registration</h4>
                            <!-- <div class="options">   
                                <a href="" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
                            </div> -->
                        </div>
                        <div class="panel-body collapse in">
            
                <!--  <h2 align="center">Dealer Registration</h2> -->
                <!--  <p style="padding-top:16px;font-size:16px;"><a href="LoginHome">Sign In</a></p> -->
                <div class="col-md-12">
                       
                   
                        <div class="options"></div>
                        
                    <form:form class="form-horizontal" modelAttribute="delar" action="#" role="form" id="delar-form"  method="post">
                    <div class="row" id="moveTo">
                    
                   
                    <form:hidden path="id"/>
                    
                    		<div class="col-md-6">
                    		<h3>Business Information</h3>
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">Business Name <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="businessName" class="form-control  validate1 onlyCharacters "  placeholder="Business Name" onkeyup="removeBorder(this.id)" maxlength="20" />
								    </div>
                    			</div>
                    			
                    		        <div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Address <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	 <form:input path="address" class="form-control  validate1" placeholder="Address" onkeyup="removeBorder(this.id)" />
								      	<span class="hasError" id="lponumberError"></span>
								    </div>
                    			</div>
                    			
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">City/Town <span class="impColor">*</span></label>
								    <div class="col-md-6">
								   <form:input path="city" class="form-control  validate1" placeholder="City/Town" onkeyup="removeBorder(this.id)" maxlength="20" />
								      	<span class="hasError" id="ownercompanyError"></span>
								    </div>
                    			</div>
                    		
                                 <div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Pin code <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	
			                              <form:input path="pincode" class="form-control  validate1  mobile" placeholder="Pin code" maxlength="6" onkeyup="removeBorder(this.id)" />   
								      	<span class="hasError" id="colorError"></span>
								    </div>
                    			</div>   		
                    			
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Shop Phone Number <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="shopPhone" value="" class="form-control validate1  mobile " placeholder="Shop Phone Number"  onkeyup="removeBorder(this.id)" maxlength="13"/>
								      	<span class="hasError" id="madeinError"></span>
								    </div>
                    			</div>
                    			
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Landline/Alternative Number</label>
								    <div class="col-md-6"> 
								    	<form:input path="alternativeNumber" value=""  class="form-control validate1 mobile " placeholder="Landline/Alternative Number" onkeyup="removeBorder(this.id)" maxlength="13" />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    			
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">GST Number <span class="impColor">*</span></label>
								    <div class="col-md-6">

								    	<form:input path="gstno" class="form-control validate1"  placeholder="GST Number"  onkeyup="removeBorder(this.id)"/>
								      	<span class="hasError" id="expirydateError"></span>
								    </div>
                    			</div>
                    			</div>
                    	
                    	
                    	
                    	
                    	<h3 class="col-md-5">Contact Information</h3>
                           <div class="row" id="moveTo">
                    	<div class="col-md-6">
                       
                          
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">Contact Person Name<span class="impColor">*</span></label>
								    <div class="col-md-6">
								   	   <form:input path="name" class="form-control  validate1  onlyCharacters " placeholder="Contact Person Name" onkeyup="removeBorder(this.id)" maxlength="20"/>
								      	<span class="hasError" id="storeError"></span>
								    </div>
                    			</div>
              
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Designation <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="designation" class="form-control  validate1 onlyCharacters "  placeholder="Designation" onkeyup="removeBorder(this.id)" maxlength="20" />
								    	<span class="hasError" id="storeError"></span>
								    </div>
                    			</div>
           
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Contact Phone Number <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="phoneNumber" value=""  class="form-control validate1  mobile" placeholder="Phone Number" onkeyup="removeBorder(this.id)" maxlength="10" />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    		
                    	<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Contact Email <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="email" value=""  class="form-control validate1 " placeholder="Email" onkeyup="removeBorder(this.id)" maxlength="50"   />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    		
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Branch <span class="impColor">*</span></label>
								    <div class="col-md-6">
<%-- 								    	<form:input path="branchId" value=""  class="form-control validate" placeholder="Branch" /> --%>
								    	<form:select path="branchId" onfocus="removeBorder(this.id)"  class="form-control validate ">
								    	<form:option value="">Select Branch</form:option>
								    	<form:options items="${branches }"/>
								    	</form:select>
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    		
                    		</div>
                    		</div>
                    		
                    		
                    	
                    			
                    		
					
					
					      	<div class="row">
					      		<div class="col-sm-12">
					      		<div class="col-sm-4"></div>
					      			<div class="btn-toolbar text-center col-sm-4">
						      			<input type="button"  id="submit2"  value="Submit" class="btn-primary btn" onclick="checkOTPValidate();" />
<!-- 										<button id="submit4" class="btn-primary btn" onclick="checkOTPValidate();">Submit</button> -->
						      			<input style="margin-left:20px;" type="reset" value="Reset" class="btn-danger btn cancel"/>
					      			</div>
					      			<div class="col-sm-4"></div>
					      		</div>
					      	</div>
					     </div>
					      </form:form>
					      </div>
					      </div>
					      
			</div>
                    
                </div>
            <div class="clearfix"></div><br><br>
<div class="lfotter ">
<p> All Rights Reserved </p>
</div>    
     <div class="container">
  <!-- Trigger the modal with a button -->
<!--   <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->

  <!-- Modal -->
   <div class="modal fade" id="myModal"  role="dialog"  data-backdrop="static"  data-keyboard="false" >
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="exampleModalLabel">Otp Validation</h4>
						      </div>
						      <div class="modal-body">
						      <span id="displayMsg"></span> <br>
						     <input type="password" id="OTP" onkeydown="removeBorder(this.id)" maxlength="4" class="form-control numericOnly" placeholder="OTP" ><br>
						     <button type="button" class="btn btn-success" onclick="resendOtp();">Resend OTP</button>
						      </div>
						      <div class="modal-footer">
						       <button type="button" class="btn btn-success" onclick="dealerCreation();">Submit</button>
						      <!--   <button type="button"  class="btn btn-default" data-dismiss="modal">Close</button> -->
						      </div>
						    </div>
						  </div>
				</div>
  
</div>
                <!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="exampleModalLabel">Otp Validating</h4>
						      </div>
						      <div class="modal-body">
						     <input type="text" id="OTP">
						      </div>
						      <div class="modal-footer">
						       <button type="button" class="btn btn-success" data-dismiss="modal" onclick="dealerCreation();">Submit</button>
						        <button type="button"  class="btn btn-default" data-dismiss="modal">Close</button>
						      </div>
						    </div>
						  </div>
				</div> -->
               
                <script type="text/javascript">
                    		
                    		function checkOTPValidate() {
                    			if(customValidation1())
                    				{
                    				
                    			$('#OTP').val("");
                    			
                    			var phoneNumber = $("#phoneNumber").val();
                    			if(phoneNumber !=''){
                    				
                					var formData = new FormData();
                					formData.append('phoneNumber', phoneNumber);
                					
                					 $.fn.makeMultipartRequest('POST','validateOTP', false,formData, false, 'text', function(data) {
                								console.log(data);
                								var resJson = JSON.parse(data);
                								if(resJson.msg=="failed"){
                									alert("Mobile Numober Already Exist.")
                								}else{
                									var mobileStr = resJson.mobileStr;
                									$("#displayMsg").html("Enter OTP that has been sent on your mobile number xxxxxxx"+mobileStr);
                									//$('#myModal').modal('toggle');
                									$('#myModal').modal('show');
                									
                								}
             								});
                    				
                    			}
                    				}
                    			else
                    			{
                    				return false;
                    			}
                    			
                    			
                    		}
                    			

                        		function dealerCreation() {
                        			var id = $("#id").val();
                        			var businessName = $("#businessName").val();
                        			var address = $("#address").val();
                        			var city = $("#city").val();
                        			var pincode = $("#pincode").val();
                        			var shopPhone = $("#shopPhone").val();
                        			var alternativeNumber = $("#alternativeNumber").val();
                        			var gstno = $("#gstno").val();
                        			var name = $("#name").val();
                        			var designation = $("#designation").val();
                        			var phoneNumber = $("#phoneNumber").val();
                        			var email = $("#email").val();
                        			var branchId = $("#branchId").val();
                        			var OTP = $("#OTP").val().trim();
                        			 if(OTP==""){
                        				alert("Please enter valid OTP");
                        				$('#myModal').modal('show');
                        				return false;
                        			} 
                        			
                        			if(phoneNumber !=''){
                        				
                    					var formData = new FormData();
                    					formData.append('id', id);
                    					formData.append('businessName', businessName);
                    					formData.append('address', address);
                    					formData.append('city', city);
                    					formData.append('pincode', pincode);
                    					formData.append('shopPhone', shopPhone);
                    					formData.append('alternativeNumber', alternativeNumber);
                    					formData.append('gstno', gstno);
                    					formData.append('name', name);
                    					formData.append('designation', designation);
                    					formData.append('phoneNumber', phoneNumber);
                    					formData.append('OTP', OTP);
                    					formData.append('email', email);
                    					formData.append('branchId', branchId);
                    					
                    					
                    					 $.fn.makeMultipartRequest('POST','addDelar', false,formData, false, 'text', function(data) {
                    								console.log(data);
                    								var resJson = JSON.parse(data);
                    								//alert(resJson.msg);
                    								if(resJson.msg=="success"){
                    									alert(" Registered Successfully");
                    									$("#OTP").val('');
                    									$("#displayMsg").html("");
                    									//$('#myModal').modal('toggle');
                    									$('#myModal').modal('hide');
                    									window.location.reload();
                    								}else if(resJson.msg=="fail"){
                    									var otp_result = resJson.otp_result;
                    									if(otp_result=="count_exceeded"){
                    										alert("OTP limit for the day has been exceeded. Please try again later.");
                    										$('#myModal').modal('hide');
                    									}else if(otp_result=="mismatched"){
                    										//alert("OTPs mismatched! Please try again.");
                    										$("#displayMsg").html("OTPs mismatched! Please try again.");
                    										$("#displayMsg").css("color", "red");
                    										$('#myModal').modal('show');
                    									}
                    									//alert("Please enter valid OTP");
                    									//$('#myModal').modal('toggle');
                    									
                    								}
                 								});
                        				
                        			}
                    			
                    			

            				}
                       		function resendOtp(){
                       			var phoneNumber = $("#phoneNumber").val();
                       			var formData = new FormData();
                       			formData.append('phoneNumber', phoneNumber);
                       			
                       		 		$.fn.makeMultipartRequest('POST', 'resendOtp', false,
                       						formData, false, 'text', function(data){
                       					var jsonobj = $.parseJSON(data);
                       					var msg = jsonobj.message;
                       					var otp_result = jsonobj.otp_result;
                       					if(typeof otp_result != "undefined" && otp_result=="count_exceeded"){
                       						$("#displayMsg").html("OTP limit for the day has been exceeded. Please try again later.");
                       						$("#displayMsg").css("color","");
                       						$('#myModal').modal('show');
                       					}
                       					else{
                       						var mobileStr = jsonobj.mobileStr;
                           					if(msg != "undefined" && "success"==msg){
                           						$("#displayMsg").html("OTP has been resent on your mobile no. xxxxxxx"+mobileStr);
                           						$("#displayMsg").css("color","");
                           						$('#myModal').modal('show');
                           					}else{
                           						$("#displayMsg").html("Some problem occured!! Please try again.");
                           						$("#displayMsg").css("color","");
                           						$('#myModal').modal('show');
                           					}	
                       					}
                       						
                       					
                       				});
                       			
                       		}
                       		
                       		
                       		var idArray =null;
                       		
                       		function customValidation1()
                       		{
                       		
                       		var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
                       		$('.validate1').blur(function() {
                       			var id = $(this).attr('id');
                       			var placeholder = $(this).attr('placeholder');
                       			var value1 = $("#" + id).val();
                       			var value=$.trim(value1);
                       			if (value == null || value == "" || value == "undefined") {
                       				$('style').append(styleBlock);
                       				$("#" + id ).attr("placeholder", placeholder);
                       				$("#" + id ).css('border-color','#e73d4a');
                       				$("#" + id ).css('color','#e73d4a');
                       				$("#" + id ).addClass('placeholder-style your-class');
                       				
                       				if ($("#" + id+"_chosen").length)
                       				{
                       					$("#" + id+"_chosen").children('a').css('border-color','#e73d4a');
                       				}
//                       				$("#" + id + "Error").text("Please " + placeholder);
                       			} else {
                       				$("#" + id + "Error").text("");
                       			}
                       		});
                       		
                       		
                       		 idArray = $.makeArray($('.validate1').map(function() {
                       			return this.id;
                       		}));
                       		
                       		var validation1 = true;
                       		
                       	
                       			$.each(idArray, function(i, val) {
                       				var value = $("#" + idArray[i]).val();
                       				var placeholder = $("#" + idArray[i]).attr('placeholder');
                       				if (value == null || value == "" || value == "undefined") {
                       					$('style').append(styleBlock);
                       					$("#" + idArray[i] ).attr("placeholder", placeholder);
                       					$("#" + idArray[i] ).css('border-color','#e73d4a');
                       					$("#" + idArray[i] ).css('color','#e73d4a');
                       					$("#" + idArray[i] ).addClass('placeholder-style your-class');
                       					 var id11 = $("#" + idArray[i]+"_chosen").length;
                       					if ($("#" + idArray[i]+"_chosen").length)
                       					{
                       						$("#" + idArray[i]+"_chosen").children('a').css('border-color','#e73d4a');
                       					}
//                       					$("#" + idArray[i] + "Error").text("Please " + placeholder);
                       					validation1 = false;
                       				} 
                       			});
                       			if(validation1 && subValidation) {
                       				
                       				/* /* $("#submit2").attr("disabled",true);
                       				$("#submit2").val("Please wait...");
                       				$("form").submit();	 								
                       				event.preventDefault(); */
                       				return true;
                       			}else {
                       				return false;
                       				event.preventDefault();
                       			}
                       		
                       		
                       		}
                       		
                       		
                       		$('#email').blur(function() {
                       			
                       			
                       			
                       			var editFields =0;
                       			var cemail=$(this).val();
                       			
                       			var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                       			  if( regex.test(cemail))
                       				  {
                       				  subValidation =true;
                       				  }
                       			 else
                       			  
                       			{
                       				
                       				  $('#email').css('border-color', 'red');
                       				 alert("Enter Valid Email");
                       				  subValidation =false;
                       				  
                       			}

                       				}); 
                    		
                    		
                    		</script>
    <script type='text/javascript' src='js/customValidation.js'></script>

</body>

</html>