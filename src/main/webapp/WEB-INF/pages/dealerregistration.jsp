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

            <div class="col-md-12 col-sm-12">
                <div class="panel panel-primary">
                 <h2 class="col-md-10" align="center">Dealer Registration</h2>
                 <p class="col-md-2" style="padding-top:16px;font-size:16px;"><a href="LoginHome">Sign In</a></p>
                <div class="col-md-12">
                       
                   
                        <div class="options"></div>
                        
                    <form:form class="form-horizontal" modelAttribute="delar" action="validateOTP" role="form" id="delar-form"  method="post">
                    <div class="row" id="moveTo">
                    
                    <div class="panel-body">
                    <form:hidden path="id"/>
                    
                    		<div class="col-md-6">
                    		<h3>Business Information</h3>
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">Business Name <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="businessName" class="form-control  validate onlyCharacters"  placeholder="Business Name" onkeyup="removeBorder(this.id)" maxlength="20" />
								    </div>
                    			</div>
                    			
                    		        <div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Address <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	 <form:input path="address" class="form-control  validate" placeholder="Address" onkeyup="removeBorder(this.id)" />
								      	<span class="hasError" id="lponumberError"></span>
								    </div>
                    			</div>
                    			
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">City/Town <span class="impColor">*</span></label>
								    <div class="col-md-6">
								   <form:input path="city" class="form-control  validate" placeholder="City/Town" onkeyup="removeBorder(this.id)" maxlength="20" />
								      	<span class="hasError" id="ownercompanyError"></span>
								    </div>
                    			</div>
                    		
                                 <div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Pin code <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	
			                              <form:input path="pincode" class="form-control  validate mobile" placeholder="Pin code" maxlength="6" onkeyup="removeBorder(this.id)" />   
								      	<span class="hasError" id="colorError"></span>
								    </div>
                    			</div>   		
                    			
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Shop Phone Number <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="shopPhone" value="" class="form-control validate mobile" placeholder="Shop Phone Number"  onkeyup="removeBorder(this.id)" maxlength="13"/>
								      	<span class="hasError" id="madeinError"></span>
								    </div>
                    			</div>
                    			
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Landline/Alternative Number</label>
								    <div class="col-md-6">
								    	<form:input path="alternativeNumber" value=""  class="form-control validate mobile" placeholder="Landline/Alternative Number" onkeyup="removeBorder(this.id)" maxlength="13" />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    			
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">GST Number <span class="impColor">*</span></label>
								    <div class="col-md-6">

								    	<form:input path="gstno" class="form-control validate"  placeholder="GST Number"  onkeyup="removeBorder(this.id)"/>
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
								   	   <form:input path="name" class="form-control  validate onlyCharacters" placeholder="Contact Person Name" onkeyup="removeBorder(this.id)" maxlength="20"/>
								      	<span class="hasError" id="storeError"></span>
								    </div>
                    			</div>
              
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Designation <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="designation" class="form-control  validate onlyCharacters"  placeholder="Designation" onkeyup="removeBorder(this.id)" maxlength="20" />
								    	<span class="hasError" id="storeError"></span>
								    </div>
                    			</div>
           
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Contact Phone Number <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="phoneNumber" value=""  class="form-control validate mobile" placeholder="Phone Number" onkeyup="removeBorder(this.id)" maxlength="10" />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    		
                    	<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Contact Email <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="email" value=""  class="form-control validate email" placeholder="Email" onkeyup="removeBorder(this.id)" maxlength="20"  />
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
                    		
                    		</div>
                    	
                    			
                    		
					
					</div>
				       <div class="panel-footer">
					      	<div class="row">
					      		<div class="col-sm-12">
					      			<div class="btn-toolbar text-center">
						      			<input type="button" id="submit1" value="Submit" class="btn-primary btn" onclick="checkOTPValidate();" />
<!-- 										<button id="submit4" class="btn-primary btn" onclick="checkOTPValidate();">Submit</button> -->
						      			<input style="margin-left:20px;" type="reset" value="Reset" class="btn-danger btn cancel"/>
					      			</div>
					      		</div>
					      	</div>
					      </div>
					      </form:form>
					      </div>
					      
					      
			</div>
                    
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
                									$('#myModal').modal('toggle');
                									$('#myModal').modal('show');
                								}
             								});
                    				
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
                    								}else if(resJson.msg=="fail"){
                    									var otp_result = resJson.otp_result;
                    									if(otp_result=="count_exceeded"){
                    										alert("OTP limit for the day has been exceeded. Please try again later.");
                    										$('#myModal').modal('hide');
                    									}else if(otp_result=="mismatched"){
                    										//alert("OTPs mismatched! Please try again.");
                    										$("#displayMsg").html("OTPs mismatched! Please try again.");
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
                       					var mobileStr = jsonobj.mobileStr;
                       					if(msg != "undefined" && "success"==msg){
                       						$("#displayMsg").html("OTP has been resent on your mobile no. xxxxxxx"+mobileStr);
                       						$('#myModal').modal('show');
                       					}	
                       					
                       				});
                       			
                       		}
                    		
                    		
                    		</script>
    <script type='text/javascript' src='js/customValidation.js'></script>

</body>

</html>