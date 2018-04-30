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
                        <h4 align="center">Delar Registration</h4>
                        <div class="options"></div>
                        
                    <form:form class="form-horizontal" modelAttribute="delar"  role="form" id="delar-form" action="addDelar" method="post">
                    <div class="panel-body">
                    <form:hidden path="id"/>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Name <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="name" class="form-control  validate"  placeholder="Name" onkeyup="removeBorder(this.id)" maxlength="20" />
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Shop Name<span class="impColor">*</span></label>
								    <div class="col-md-6">
								   	   <form:input path="shopname" class="form-control  validate" placeholder="Shop Name" onkeyup="removeBorder(this.id)" maxlength="20"/>
								      	<span class="hasError" id="storeError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="clearfix"></div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Address <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	 <form:input path="address" class="form-control  validate" placeholder="Address" onkeyup="removeBorder(this.id)" />
								      	<span class="hasError" id="lponumberError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">City/Town <span class="impColor">*</span></label>
								    <div class="col-md-6">
								   <form:input path="city" class="form-control  validate" placeholder="City/Town" onkeyup="removeBorder(this.id)" maxlength="20" />
								      	<span class="hasError" id="ownercompanyError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="clearfix"></div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Pin code <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	
			                              <form:input path="pincode" class="form-control  validate mobile" placeholder="Pin code" maxlength="6" onkeyup="removeBorder(this.id)" />   
								      	<span class="hasError" id="colorError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Shop Phone Number <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="shopPhone" value="" class="form-control validate mobile" placeholder="Shop Phone Number"  maxlength="13"/>
								      	<span class="hasError" id="madeinError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">GST Number <span class="impColor">*</span></label>
								    <div class="col-md-6">

								    	<form:input path="gstno" class="form-control validate"  placeholder="GST Number"  onkeyup="removeBorder(this.id)"/>
								      	<span class="hasError" id="expirydateError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Phone Number <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="phoneNumber" value=""  class="form-control validate mobile" placeholder="Phone Number" onkeyup="removeBorder(this.id)" maxlength="10" />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Email</label>
								    <div class="col-md-6">
								    	<form:input path="email" value=""  class="form-control " placeholder="Email" />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
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
                    		
                    		<div class="col-md-12">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-2 control-label">Description</label>
								    <div class="col-md-9">
								    	<form:textarea path="description" class="form-control" placeholder="Description" rows="5"></form:textarea>
								      	<span class="hasError" id="remarksError"></span>
								    </div>
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