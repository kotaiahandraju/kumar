<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
 <link rel="stylesheet" type="text/css" href="../assets/css/img.css">
 <style>
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

</style>
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="dashboard">Home</a></li>
               <li>Product Subcategory </li>
            </ol>
            <div class="clearfix"></div>
        <div class="container-fluid" id="lpoMain">
            <div class="row" id="row1">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Product Subcategory List</h4>
                            <div class="options">   
                                <a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
                            </div>
                        </div>
                        <div class="panel-body collapse in">
                        <input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
                        <div class="table-responsive" id="tableId" >
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
                                <thead>
                                	<tr>
                                		<th>Product Name</th><th>Status</th>
                                	</tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                         </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" id="moveTo">
            <div class="col-md-12 col-sm-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Add Subcategory</h4>
                        <div class="options"></div>
                    </div>
	                <form:form modelAttribute="productnameForm" id="formId" action="addProductname" class="form-horizontal" method="post" enctype="multipart/form-data" >
                    <div class="panel-body">
                    	<div class="row">
                    	<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Product Category <span class="impColor">*</span></label>
                    				<div class="col-md-6">
                    	<form:select path="producttype" value="" class="form-control validate" >
								    	<form:option value="">-- Select Category --</form:option>
								    	<form:options items="${productType }"></form:options>
								    	</form:select>
								    	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Product Subcategory <span class="impColor">*</span></label>
                    				<div class="col-md-6">
		                            	<form:input type="hidden" path="id"/>
								      	<form:input type="text" path="productname" class="form-control validate" placeholder="Product Subcategory"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    			
                    			<img id="imageId" style="display: none;    width: 20%;" src=""><span id="imageLable" style="display: none;"></span>
                    			<label for="focusedinput" class="col-md-4 control-label">File Upload<span class="impColor">*</span></label>
													<input id="imagePath" name="imagePath" type="hidden" value="">
													<input type="file" name="file" class="col-md-8" style="margin-top: 2%;" id="documents" onchange="">
													<span class="hasError" id="documentsError"></span>
                    			
								  	</div>
                    			</div>
                    		</div>
                    	</div>
                    		
                    		</div>
                    	</div>
                    </div>
					<div class="panel-footer hideme">
						<div class="row">
				      		<div class="col-sm-12">
				      			<div class="btn-toolbar pull-right">
					      			<input class="btn-primary btn" type="submit" id="submit1" value="Submit" />
					      			<input class="btn-danger btn cancel" type="reset" id="clearData" value="Cancel" />
				      			</div>
				      		</div>
				    	</div>
				    </div>
         			</form:form>				    
                </div>
            </div>
            
        <!-- container -->
<!--  -print Div -->
        
        
 <script type="text/javascript">

var lstOrders =${allOrders1};

console.log(lstOrders);

if(lstOrders != ""){
	showTableData(lstOrders);
}

$(function() {
// 	var listOrders=JSON.parse(lstOrders);
	
	var dummyItems = $("#item1").html();
	$("#1item").empty();
	$(dummyItems).appendTo("#1item");
	
	$("#1expirydate").datepicker({
		dateFormat : "dd-M-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	$("#1manufacturingdate").datepicker({
		dateFormat : "dd-M-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
});
var damageId = 0;
// var serviceUnitArray ={};
// var serviceUnitArray1 ={};
var data = {};


function showTableData(response){
	serviceUnitArray ={};
	serviceUnitArray1 ={};
	var table=$('#tableId').html('');
	
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>Product Category</th><th>Product Subcategory</th><th>Image</th><th>Status</th><th  style="text-align:center">Actions</th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate btn btn-danger' onclick='deleteProductName("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate btn btn-danger' onclick='deleteProductName("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		if(orderObj.productnameStatus == "Active"){
			var active =  "<td title='"+orderObj.productnameStatus+"'><span class='badge badge-success'>" + orderObj.productnameStatus +"</span></td>"
		}else{  
			var active = "<td title='"+orderObj.productnameStatus+"'><span class='badge badge-warning'>" + orderObj.productnameStatus +"</span></td>"
		}
		var edit = "<a class='edit editIt btn btn-info' onclick='editProductName("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
// 		alert(orderObj.lponumber);
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.producttype+"'>" + orderObj.producttype + "</td>"
			+ "<td title='"+orderObj.productname+"'>" + orderObj.productname + "</td>"
			+ "<td title='image'><img style='width: 50px;height: 40px;' src='../../../"+orderObj.documents +"'></td>"
			+ active
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editProductName(id) {
	$("#id").val(id);
	$("#productname").val(serviceUnitArray[id].productname);
	$("#producttype").val(serviceUnitArray[id].productId);
	
	$("#documents").css('color', 'transparent');
	$("#imageId").show();
	$("#imageLable").show();
	$("#dynamicImage").remove();
	
	var editImage=serviceUnitArray[id].documents;
	var replaceImage=editImage.replace("documents/","");
	$("#imageId").attr("src","${baseurl }/"+editImage);
	$("#imageLable").text(replaceImage);
	$("#imagePath").val(editImage);
		
	$("#status").val(serviceUnitArray[id].status);
	
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteProductName(id,status) {
	var checkstr=null;
	if(status == 0){
		 checkstr =  confirm('Are you sure you want to Deactivate?');
		 $('#inActive').prop('checked', false);
	}else{
		 checkstr =  confirm('Are you sure you want to Activate?');
		 $('#inActive').prop('checked', false);
	}
	if(checkstr == true){
		$.ajax({
					type : "POST",
					url : "deleteProductName.htm",
					data :"id="+id+"&status="+status,
					 beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });
			          },
					success: function (response) {
		                	 $.unblockUI();
		                 if(response != null ){
		                	 var resJson=JSON.parse(response);
		                	showTableData(resJson.allOrders1);
		                	tooltip();
		                	//window.location.reload();
		                	}
// 		                 window.location.reload();
		                 },
		             error: function (e) { 
		            	 $.unblockUI();
							console.log(e);
		             }
				});
	}
}

function dataClear(){
	
	
	$("#id").val('');
	$("#lponumber").val('');
	$("#item").val('');
	$("#remarks").val('');
	$("#amount").val('');
	$("#suppliername").val("");
	$("#suplieraddress").val("");
	$("#supliercontactno").val("");
	$("#amount").val("");
}
$(function() {
	$("#expiryDate1").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
});
function showexpiryDate(value){
	if(value=="1"){
		 $('#exporydatediv').show();
	}else{
		$('#exporydatediv').hide();
	}
}



	
	
$("#documents").change(function(e) {
	
	$("#dynamicImage").remove();
	  $("#imageId").hide();
	  $("#imageLable").hide();
	  var checkExtension=$("#documents").val();
	  var file_size = $('#documents')[0].files[0].size;
	  
	  var fileOK = false;
	  
	  var ext=checkExtension.substring(checkExtension.lastIndexOf(".")+1,checkExtension.length).toLowerCase();
	  var validFiles=["bmp","gif","png","jpg","jpeg"];
	    for (var i=0; i<validFiles.length; i++)
	    {
	      if (validFiles[i] == ext)
	    	  fileOK= true;
	     		
	    } 
	 
	 
	if(fileOK == true){
		 	if(file_size>64000) {
	    	    alert("File size is greater than 8kb, Please Choose Small Image");
	    	    $("#documents").css('color', 'transparent');
	    		  	return false;
	    		  } 
		 for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
		        
		        var file = e.originalEvent.srcElement.files[i];
		        
		        var img = document.createElement("img");
		        img.id='dynamicImage';
//		         img.setAttribute('width', '50%');
		        img.setAttribute('style', 'width: 60px;height: 60px;');
		        var reader = new FileReader();
		        reader.onloadend = function() {
		             img.src = reader.result;
		        }
		        reader.readAsDataURL(file);
		        $("#documents").before(img);
//		         $("#imageId").css('width', '20%');
		    }
	}else{
		alert("Please Choose Image Only");
		$("#documents").css('color', 'transparent');
	}
   
});
	
	
	

function inactiveData() {
	
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
	}
		
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActiveProductName', false,
				formData, false, 'text', function(data) {
			
			if(data != ""){
				var resJson=JSON.parse(data);
	            showTableData(resJson);
				  tooltip();
	          
						console.log(resJson);
			}else{
				alert("Inactive List Empty");
			}
				});
}

$("#clearData").click(function(){
	$("#dynamicImage").remove();
	 $("#imageId").hide();
	 $("#imageLable").hide();
});

$("#pageName").text("Product Subcategory Master");
$(".productName").addClass("active");
</script>