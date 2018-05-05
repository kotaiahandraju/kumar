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
<div class="row" id="moveTo">
            <div class="col-md-12 col-sm-12">
                <div class="panel panel-primary">
                <div class="col-md-12">
                        <h2 align="center">Dealer Registration</h2>
                   
                        <div class="options"></div>
                        
                    <form:form class="form-horizontal" modelAttribute="delar"  role="form" id="delar-form" action="addDelar" method="post">
                    <div class="panel-body">
                    <form:hidden path="id"/>
                    
                    		<div class="col-md-6">
                    		<h3>Business Information</h3>
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">Business Name <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="name" class="form-control  validate"  placeholder="Name" onkeyup="removeBorder(this.id)" maxlength="20" />
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
                    				<label for="focusedinput" class="col-md-4 control-label">Landline/Alternative Number<span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="alternativeNumber" value=""  class="form-control validate mobile" placeholder="Landline/Alternative Number" onkeyup="removeBorder(this.id)" maxlength="10" />
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
                           <h4 class="col-md-1"><a href="LoginHome">Sign In</a></h4>
                    	<div class="col-md-6">
                       
                          
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">Contact Person Name<span class="impColor">*</span></label>
								    <div class="col-md-6">
								   	   <form:input path="shopname" class="form-control  validate" placeholder="Contact Person Name" onkeyup="removeBorder(this.id)" maxlength="20"/>
								      	<span class="hasError" id="storeError"></span>
								    </div>
                    			</div>
              
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Designation <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="designation" class="form-control  validate"  placeholder="Designation" onkeyup="removeBorder(this.id)" maxlength="20" />
								    	<span class="hasError" id="storeError"></span>
								    </div>
                    			</div>
           
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">ContactPhone Number <span class="impColor">*</span></label>
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
								    	<form:select path="branchId" onfocus="removeBorder(this.id)"  class="form-control validate">
								    	<form:option value="">Select Branch</form:option>
								    	<form:options items="${branches }"/>
								    	</form:select>
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    		
                    		
                    		
                    		
                    		
                    	
                    			
                    		</div>
                    		
                    		
                     
                    	
	                    <div class="panel-footer">
					      	<div class="row">
					      		<div class="col-sm-12">
					      			<div class="btn-toolbar text-center">
						      			<input type="submit" id="submit1" value="Submit" class="btn-primary btn"/>
						      			<input type="reset" value="Reset" class="btn-danger btn cancel"/>
					      			</div>
					      		</div>
					      	</div>
					      </div>
					</form:form>
					</div>
				      
			</div>
                    
                </div>

</body>
<script type='text/javascript' src='js/customValidation.js'></script>
</html>