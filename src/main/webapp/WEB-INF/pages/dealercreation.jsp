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
<!-- <script type='text/javascript' src='assets/js/jquery-1.10.2.min.js'></script> -->
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
 @media only screen and (min-width: 768px) {
.modal-dialog {
    width: 79%;
    margin: 30px auto;
}
}
table {
       border-collapse: inherit;
}
 .table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td
 {
 border: 0px solid black !important;
 }
table #dependent_table{
/* 	width: 100%; */
	counter-reset: rowNumber;
}

table tbody tr.rowInc{
	counter-increment: rowNumber;
}
table#dependent_table tbody tr td:first-child::before {
	content: counter(rowNumber);
/* 	min-width: 1em; */
/* 	margin-right: 0.5em; */
}

.addItemButton{
	cursor: pointer;font-size: small;background: green;color: white;padding: 3px 10px 3px 10px;
}

#ui-datepicker-div{
/* 	width: auto !important; */
}
.btn-danger {
border-radius:5px;
}
.fouser {
padding: 3px 14px 0px 11px;
    margin-left: 5px;
}
</style>

<div class="clearfix"></div>
	<ol class="breadcrumb">
    	<li><a href="dashboard">Home</a></li>
		<li>Dealer Creation</li>
	</ol>
   

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
	
	
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Dealer List</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Active List</label>
					<div class="table-responsive" id="tableId">
						<table class="table table-striped table-bordered datatables"
							id="example">
							<thead>
								<tr><th> Name</th><th>Shop Name</th><th>Address</th><th>city</th><th>Pin Code</th><th>GST Number</th><th>Phone Number</th><th>Email</th><th>Branch</th><th>Description</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				</div>
			</div>
		</div>
		
		<div class="top" id="moveTo">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Dealer Creation</h4>
					</div>
					<div style="margin-top:20px;" class="body">
                <div class="col-md-12">
                       
                    <span id="errorMsg"></span>
                        <div class="options"></div>
                           
                        
                    <form:form class="form-horizontal" modelAttribute="delarForm"  role="form" id="delar-form" action="addDealer" method="post">
                    <form:hidden path="id"/>
                          
                    		<div class="col-md-6">
                    		 <span id="errorMsg"></span>
                    		<h3>Business Information</h3>
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">Business Name <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="businessName" class="form-control  validate onlyCharacters"  placeholder="Business Name" onkeyup="removeBorder(this.id)" maxlength="20" />
								    </div>
                    			</div>
                    			
                    		        <div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label"> Business Address <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	 <form:input path="address" class="form-control  validate" placeholder="Address" onkeyup="removeBorder(this.id)" />
								      	<span class="hasError" id="lponumberError"></span>
								    </div>
                    			</div>
                    			
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">City/Town <span class="impColor">*</span></label>
								    <div class="col-md-6">
								   <form:input path="city" class="form-control  validate onlyCharacters" placeholder="City/Town" onkeyup="removeBorder(this.id)" maxlength="20" />
								      	<span class="hasError" id="ownercompanyError"></span>
								    </div>
                    			</div>
                    		
                                 <div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Pin code <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	
			                              <form:input path="pincode" class="form-control  validate numericOnly" placeholder="Pin code" maxlength="6" onkeyup="removeBorder(this.id)" />   
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
                    				<label for="focusedinput" class="col-md-4 control-label">Alternative Mobile</label>
								    <div class="col-md-6">
								    	<form:input path="alternativeNumber" value=""  class="form-control  mobile" placeholder="Alternative Mobile" onkeyup="removeBorder(this.id)" maxlength="13" />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    			
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">GST Number <span class="impColor">*</span></label>
								    <div class="col-md-6">

								    	<form:input path="gstno" class="form-control validate nospecialCharacter"  placeholder="GST Number"  maxlength="15" onkeyup="removeBorder(this.id)"/>
								      	<span class="hasError" id="expirydateError"></span>
								    </div>
                    			</div>
                    			</div>
                    	
                    	
                    	
                    	 
                    	<h3 class="col-md-5">Contact Information</h3>
                           
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
                    				<label for="focusedinput" class="col-md-4 control-label">ContactPhone Number <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="phoneNumber" value=""  class="form-control validate mobile" placeholder="Phone Number" onkeyup="removeBorder(this.id)" maxlength="10" />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    		
                    	<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Contact Email <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="email" value=""  class="form-control validate email" placeholder="Email" onkeyup="removeBorder(this.id)" maxlength="50"  />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    			
                    			
                    			<div class="form-group">
                    			
                    				<label for="focusedinput" class="col-md-4 control-label">Username<span class="impColor">*</span></label>
								    <div class="col-md-6">
								   	   <form:input path="username" class="form-control  validate " placeholder="Username" onkeyup="removeBorder(this.id)" maxlength="20"/>
								      	<span class="hasError" id="storeError"></span>
								    </div>
                    			</div>
              
                    			<%-- <div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Password<span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="password" class="form-control  validate"  placeholder="password" onkeyup="removeBorder(this.id)" maxlength="20" />
								    	<span class="hasError" id="storeError"></span>
								    </div>
                    			</div>
                    			 --%>
                    			
                    			
                    		
                    			<%-- <div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Branch <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="branchId" value=""  class="form-control validate" placeholder="Branch" />
								    	<form:select path="branchId" onfocus="removeBorder(this.id)"  class="form-control validate">
								    	<form:option value="">Select Branch</form:option>
								    	<form:options items="${branches }"/>
								    	</form:select>
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div> --%>
                    		
                    		
                    		
                    		
                    		
                    	
                    			
                    		</div>
                    		
                    		
                     
                    	
	                    <div class="panel-footer">
					      	<div class="row">
					      		<div class="col-sm-12">
					      			<div class="btn-toolbar text-center">
						      			<input type="submit" id="submit2" value="Submit" class="btn-primary btn"/>
						      			<input type="reset" value="Reset" class="btn-danger btn cancel"/>
					      			</div>
					      		</div>
					      	</div>
					      </div>
					</form:form>
					</div>
				</div>
				</div>
			</div>
		</div>
		</div>
                    
	</div> <!-- container -->
	<!-- Modal -->
	
  <div class="modal fade" id="ordersListModal"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog"> 
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body" id="modal_body">
				      
		      </div>
		      <div class="modal-footer">
		       <button type="button" class="btn btn-success" data-dismiss="modal" id="closeModel">Close</button>
		      </div>
		    </div>
		  </div>
</div> 

<!--  Modal -->
	<!-- 
<div class="container-fluid" id="moveTo">
            <div class="col-md-12 col-sm-12">
                <div class="panel panel-primary">
                 <h2 class="col-md-12" align="center">Dealer Creation</h2>
                 
				      
			</div>
                    
                </div> -->

</body>

<!-- <script type='text/javascript' src='js/customValidation.js'></script> -->
<script>

var usernamevalidation =false;
var emailvalidation =false;
var mobilevalidation =false;
var gstvalidation=false;
var editFields =0;




$('#username').blur(function() {
	var username=$(this).val();

	$.ajax({
				type : "GET",
				url : "checkUsername",
				data : {"username":username},
				dataType : "text",
				beforeSend : function() {
		             $.blockUI({ message: 'Please wait' });
		          }, 
				success : function(data) {
					if(data ==='true')
						{
	 					$('#username').css('border-color', 'red');
						 $('#errorMsg').text( "* Username already Exists ") ;
						 $('#errorMsg').css('color','red');
							setTimeout(function() { $("#errorMsg").text(''); }, 3000);
						 usernamevalidation =false;
						}
					else
						{
						$('#username').css('border-color', 'none');
						$('#submit1').prop('disabled', false);
						usernamevalidation =true;
						}
					
				},
				complete: function () {
		            
		            $.unblockUI();
		       },
				error :  function(e){$.unblockUI();console.log(e);}
				
			});

		}); 
		
		
		
$('#email').blur(function() {
	
		var cemail=$(this).val();
		
		var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		  if( regex.test(cemail))
			  {
			
			  
			  $.ajax({
					type : "GET",
					url : "checkemailexists",
					data : "cemail="+cemail+"&editFields="+editFields,
					dataType : "text",
					beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });
			          }, 
					success : function(data) {
						if(data ==='true')
							{
		 					$('#email').css('border-color', 'red');
							 $('#errorMsg').text( "* Email already Exists ") ;
							 $('#errorMsg').css('color','red');
								setTimeout(function() { $("#errorMsg").text(''); }, 3000);
								emailvalidation =false;
							}
						else
							{
							$('#email').css('border-color', 'none');
							$('#submit1').prop('disabled', false);
							emailvalidation =true;
							}
						
					},
					complete: function () {
			            
			            $.unblockUI();
			       },
					error :  function(e){$.unblockUI();console.log(e);}
					
				});
			  
			  
			  }
		 else
		  
		{
			
			  $('#email').css('border-color', 'red');
			  $('#errorMsg').text( "* Enter Valid Email ") ;
				 $('#errorMsg').css('color','red');
					setTimeout(function() { $("#errorMsg").text(''); }, 3000);
			 emailvalidation =false;
			  
		}

			}); 
			
			
			
			
			
			
$('#gstno').blur(function() {
	
	var cgstno=$(this).val();	  
		  $.ajax({
				type : "GET",
				url : "checkgstexists",
				data : "cgstno="+cgstno+"&editFields="+editFields,
				dataType : "text",
				beforeSend : function() {
		             $.blockUI({ message: 'Please wait' });
		          }, 
				success : function(data) {
					if(data ==='true')
						{
	 					$('#gstno').css('border-color', 'red');
						 $('#errorMsg').text( "* GstNo already Exists ") ;
						 $('#errorMsg').css('color','red');
							setTimeout(function() { $("#errorMsg").text(''); }, 3000);
							emailvalidation =false;
						}
					else
						{
						$('#gstno').css('border-color', 'red');
						  $('#errorMsg').text( "* Enter Valid Gstno ") ;
							 $('#errorMsg').css('color','red');
								setTimeout(function() { $("#errorMsg").text(''); }, 3000);
						 gstvalidation =false;
						}
					
				},
				complete: function () {
		            
		            $.unblockUI();
		       },
				error :  function(e){$.unblockUI();console.log(e);}
				
			});	
	
	  

		}); 
		
			
			
			
$('#phoneNumber').blur(function() {
	var phoneNumber=$(this).val();
	  if( phoneNumber.length == 10)
	  {
		  mobilevalidation =true;
		  
		  $.ajax({
				type : "GET",
				url : "checkmobileexists",
				data : "phoneNumber="+phoneNumber+"&editFields="+editFields,
				dataType : "text",
				beforeSend : function() {
		             $.blockUI({ message: 'Please wait' });
		          }, 
				success : function(data) {
					if(data ==='true')
						{
	 					$('#phoneNumber').css('border-color', 'red');
						 $('#errorMsg').text( "* ContactPhone Number already Exists ") ;
						 $('#errorMsg').css('color','red');
							setTimeout(function() { $("#errorMsg").text(''); }, 3000);
							emailvalidation =false;
						}
					else
						{
						$('#phoneNumber').css('border-color', 'none');
						$('#submit1').prop('disabled', false);
						emailvalidation =true;
						}
					
				},
				complete: function () {
		            
		            $.unblockUI();
		       },
				error :  function(e){$.unblockUI();console.log(e);}
				
			});
		  
		  
		  
		  
		  }
	 else
	  
	{
		
		  $('#phoneNumber').css('border-color', 'red');
		 $('#errorMsg').text( "* Enter Valid Mobile Number ") ;
		 $('#errorMsg').css('color','red');
			setTimeout(function() { $("#errorMsg").text(''); }, 3000);
		 mobilevalidation =false;
		  
	}

		}); 
		
			
			
			
$('#submit2').click(function(event) {
	
	//alert(usernamevalidation);
	
	
	if(usernamevalidation && emailvalidation && mobilevalidation)
	 {
		
		//alert("hello2");
	$('#submit1').trigger('click');
	
	 }
	else
		{
		showValidations();
		return false;
		
		}
	
});




function showValidations(){
	
	
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
//			$("#" + idArray[i] + "Error").text("Please " + placeholder);
			validation = false;
		} 
	});
	
}





var listOrders1 =${allOrders1};

console.log(listOrders1);
if (listOrders1 != "") {
	showTableData(listOrders1);
}

var damageId = 0;
// var serviceUnitArray ={};
var data = {};


function showTableData(response){
	var table=$('#tableId').html('');
	serviceUnitArray = {};
	var protectType = null;
	var tableHeadm = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th> Name</th><th>Business Name</th><th>Address</th><th>city</th><th>GST Number</th><th>Phone Number</th><th>Branch</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHeadm);
	$.each(response,function(i, orderObj) {
		
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteDealer("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteDealer("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		if(orderObj.confirm == "1"){
			var confirm = "<a class='' >UsernameAssigned</i></a>"
		}else{  
			var confirm = "<a class='notAssigned' style='cursor:pointer; text-decoration:none; list-style:none;' onclick='dealerRegister("+ orderObj.id+ ")'>UsernameNotAssigned</a>"
		}
 		var edit = "<a class='edit editIt' onclick='editEmpCreation("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ '<td><a href="#" onclick="displayDelerDetails('+ orderObj.id+ ');">'+orderObj.businessName+'</a></td>'
			/* + "<td title='"+orderObj.businessName+"'>" + orderObj.businessName + "</td>" */
			+ "<td title='"+orderObj.address+"'>" + orderObj.address + "</td>"
			+ "<td title='"+orderObj.city+"'>" + orderObj.city + "</td>"
			/* + "<td title='"+orderObj.pincode+"'>" + orderObj.pincode + "</td>" */
			+ "<td title='"+orderObj.gstno+"'>" + orderObj.gstno + "</td>"
		/* 	+ "<td title='"+orderObj.shop_phone+"'>" + orderObj.shop_phone + "</td>" */
			+ "<td title='"+orderObj.phone_number+"'>" + orderObj.phone_number + "</td>"
			/* + "<td title='"+orderObj.email+"'>" + orderObj.email + "</td>" */
			+ "<td title='"+orderObj.branchname+"'>" + orderObj.branchname + "</td>"
			/* + "<td title='"+orderObj.description+"'>" + orderObj.description + "</td>" */
			
			+ "<td style='text-align: center;white-space: nowrap;'>"  + deleterow + "&nbsp;&nbsp;"+edit+ "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
		
	});
	if(isClick=='Yes') $('.datatables').dataTable();
	
}

var prodcutName='';

function editEmpCreation(id){
	editFields =id;
	
	
	
	$("#id").val(id);
	$("#businessName").val(serviceUnitArray[id].businessName);
	$("#address").val(serviceUnitArray[id].address);
	$("#city").val(serviceUnitArray[id].city);
	$("#pincode").val(serviceUnitArray[id].pincode);
	$("#shopPhone").val(serviceUnitArray[id].shop_phone);
	$("#alternativeNumber").val(serviceUnitArray[id].alternativeNumber);
	$("#gstno").val(serviceUnitArray[id].gstno);
	$("#name").val(serviceUnitArray[id].name);
	$("#phoneNumber").val(serviceUnitArray[id].phone_number);
	$("#email").val(serviceUnitArray[id].email);
	$("#username").val(serviceUnitArray[id].username);
	$("#designation").val(serviceUnitArray[id].designation);
	$("#submit2").val("Update");
	document.getElementById("username").readOnly  = true;
	$(window).scrollTop($('#moveTo').offset().top);
	
	usernamevalidation =true;
	emailvalidation =true;
	mobilevalidation=true;
	gstvalidation=true;
}

function deleteDealer(id,status){
	var checkstr=null;
	if(status == 0){
		 checkstr =  confirm('Are you sure you want to Deactivate?');
		 $('#inActive').prop('checked', false);
	}else{
		 checkstr =  confirm('Are you sure you want to Activate?');
		 $('#inActive').prop('checked', false);
	}
	if(checkstr == true){
		var formData = new FormData();
		formData.append('status', status);
		formData.append('id', id);
		
		$.fn.makeMultipartRequest('POST', 'deleteDealer', false,
				formData, false, 'text', function(data) {
			if(data != ""){
				var jsonobj = $.parseJSON(data);
				var alldata = jsonobj.allOrders1;
				console.log(jsonobj.allOrders1);
				showTableData(alldata);
				  tooltip();
	          
			}else{
// 				alert("Inactive List Empty");
				 showTableData("");
			}
		       // window.location.reload();
			
		});
	}
}

function dealerRegister(id) {
// 	alert("model"+id);
	$("#userId").val(id);
	
 	$("#myModal").modal();
 	
 	$("#username").val("");

}

function genarateAuthDetails() {
	
	var id=$("#userId").val();
	var username=$("#username").val().trim();
	if(username != ""){
		var formData = new FormData();
		formData.append('id', id);
		formData.append('username', username);
		
		$.fn.makeMultipartRequest('POST', 'authDetails', false,
				formData, false, 'text', function(data) {
			console.log(data);
			var jsonobj = $.parseJSON(data);
			var username_duplicate = jsonobj.duplicate;
			if(typeof username_duplicate != "undefined" && username_duplicate=="true"){
				alert("Username already exists. Please try another.");
				$("#myModal").modal("show");
				return false;
			}
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			showTableData(alldata);
			tooltip();
			$("#myModal").modal("hide");
				});
	}else{
		alert("Please enter user name")
		return false;
	}
	
}
function inactiveData() {
	
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
	}
		
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActiveDealer', false,
				formData, false, 'text', function(data) {
			if(data != ""){
				var jsonobj = $.parseJSON(data);
				var alldata = jsonobj.allOrders1;
				showTableData(alldata);
				  tooltip();
				  console.log(jsonobj);
	          
			}else{
				alert("Inactive List Empty");
			}
			
				});
	
}

function getDealerDetails(id){
	//$("#myModal").modal();
	
	 
	
	 
	 alert(id);
	 displayDelerDetails(id);
// 		$('#myModal1').modal();
	
}
$("#closeModel").click(function(){
	
	 displayDelerDetails("");
	
});

function displayDelerDetails(id){
	
//alert(id);
$('#ordersListModal').modal('toggle');
	
	var table=$('#modal_body').html('');
	serviceUnitArray1 = {};
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead style="background:#4f8edc; color:#ffffff;"><tr><th> Name</th><th>Business Name</th><th>Designation</th><th>Address</th><th>city</th><th>Pin Code</th><th>GST Number</th><th>Shop Number</th><th>Phone Number</th><th>Email</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#modal_body").html(tableHead);
/* 	$.each(response,function(i, orderObj) { */
		
		//serviceUnitArray1[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+serviceUnitArray[id].name+"'>" + serviceUnitArray[id].name + "</td>"
			+ "<td title='"+serviceUnitArray[id].businessName+"'>" + serviceUnitArray[id].businessName + "</td>"
			+ "<td title='"+serviceUnitArray[id].designation+"'>" + serviceUnitArray[id].designation + "</td>"
			+ "<td title='"+ serviceUnitArray[id].address+"'>" + serviceUnitArray[id].address + "</td>"
			+ "<td title='"+serviceUnitArray[id].city+"'>" + serviceUnitArray[id].city + "</td>"
		    + "<td title='"+serviceUnitArray[id].pincode+"'>" + serviceUnitArray[id].pincode + "</td>" 
			+ "<td title='"+serviceUnitArray[id].gstno+"'>" + serviceUnitArray[id].gstno + "</td>"
		 	+ "<td title='"+serviceUnitArray[id].shop_phone+"'>" + serviceUnitArray[id].shop_phone + "</td>" 
			+ "<td title='"+serviceUnitArray[id].phone_number+"'>" + serviceUnitArray[id].phone_number + "</td>"
			+ "<td title='"+serviceUnitArray[id].email+"'>" + serviceUnitArray[id].email + "</td>" 
			+"</tr>";
		$(tblRow).appendTo("#modal_body tbody");
		
}
	




$("#pageName").text("Dealer Creation");
$(".dealercreation").addClass("active");

		

</script>
