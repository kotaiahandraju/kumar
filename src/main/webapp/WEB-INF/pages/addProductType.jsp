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
#headId{
color:#000 !important;
font-size: 15px;}


</style>
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="dashboard">Home</a></li>
               <li>Product Category </li>
            </ol>
            <div class="clearfix"></div>
        <div class="container-fluid" id="lpoMain">
            <div class="row" id="row1">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Product Category List</h4>
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
                                		<th>Product Category</th><th>Status</th>
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
                    <div class="panel-heading" id="headId">
                        <h4>Create Product Category</h4>
                        <div class="options"></div>
                    </div>
	                <form:form  modelAttribute="productForm"  action="addProductType" class="form-horizontal" method="post" >
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Product Category <span class="impColor">*</span></label>
                    				<div class="col-md-6">
		                            	<form:input type="hidden" path="id"/>
								      	<form:input type="text" path="producttype" class="form-control validate" placeholder="Product Type"/>
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
            <BR><BR>


<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<script type="text/javascript">

/* $(document).ready(function() {
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
}); */
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
    	'<thead><tr><th>Product Category</th><th>Status</th><th style="text-align:center">Actions</th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate btn btn-danger' onclick='deleteProductType("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate btn btn-success' onclick='deleteProductType("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		if(orderObj.productstatus == "Active"){
			var active =  "<td title='"+orderObj.productstatus+"'><span class='badge badge-success'>" + orderObj.productstatus +"</span></td>"
		}else{  
			var active = "<td title='"+orderObj.productstatus+"'><span class='badge badge-danger'>" + orderObj.productstatus +"</span></td>"
		}
		var edit = "<a class='edit editIt btn btn-info' onclick='editProductType("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.producttype+"'>" + orderObj.producttype + "</td>"
			+ active
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editProductType(id) {
	
	$("#id").val(id);
	
	$("#producttype").val(serviceUnitArray[id].producttype);
	$("#status").val(serviceUnitArray[id].status);
	$("#submit1").val("Update");
	$("#headId").text("Update Product Category");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteProductType(id,status) {
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
					url : "deleteproducttype.htm",
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


function inactiveData() {
	
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
	}
		
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActiveProductType', false,
				formData, false, 'text', function(data) {
			if(data != ""){
				var resJson=JSON.parse(data);
	            showTableData(resJson);
				  tooltip();
	          
						console.log(resJson);
			}else{
				alert("Inactive List Empty");
				$('#inActive').prop('checked', false);
			}
				});
}
	
$("#pageName").text("Product Category Master");
$(".productType").addClass("active");
</script>