<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
    	<li><a href="#">Home</a></li>
		<li>Order Placement</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row" id="orderPlacement">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Order Placement</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
					<div class="table-responsive" id="tableId">
						<table class="table "
							id="example">
							<thead>
								<tr><th> Product category</th><th>Product Sub category</th><td>Item Code</td><th>Description</th><td>quantity</td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<input type="button" value="Place" onclick="orderPopup();">
				</div>
				</div>
			</div>
		</div>
		<div class="row" id="displayQuantityData" style="display: none;">
					<div class="table-responsive" id="tabledata">
						<table class="table "
							id="example1">
							<thead>
								<tr><th> Product category</th><th>Product Sub category</th><td>Item Code</td><th>Description</th><td>quantity</td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				</div>

<script type="text/javascript">
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
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table datatables" id="example1">'+
    	'<thead><tr><th> Product category</th><th>Product Sub category</th><td>Item Code</td><th>Description</th><td>Quantity</td></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		serviceUnitArray[orderObj.id] = orderObj;
		var quantity ="<input type='text' name='quantity[]' id='"+orderObj.id+"quantity' />"
		var tblRow = "<tr>"
				+ "<td title='"+orderObj.productTypeName+"'>"+ orderObj.productTypeName + "</td>"
				+ "<td title='"+orderObj.productIdName+"'>"	+ orderObj.productIdName + "</td>"
				+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode+ "</td>" 
				+ "<td title='"+orderObj.itemdescrption+"'>"+ orderObj.itemdescrption + "</td>"
				+ "<td >" + quantity+ "</td>"
		$(tblRow).appendTo("#tableId table tbody");
		
	});
	if(isClick=='Yes') $('.datatables').dataTable();
	
}

function orderPopup() {
	var quantity = [];  
	var id = []; 
	var res="";
	
	 var table=$('#tabledata').html('');
	var tableHead = '<table  cellpadding="0" cellspacing="0" border="0" class="table datatables" id="example1">'+
	'<thead><tr><th> Product category</th><th>Product Sub category</th><td>Item Code</td><th>Description</th><td>Quantity</td></tr>'+
	"</thead><tbody></tbody></table>";
	$("#tabledata").html(tableHead);

	$('input[name^=quantity]').each(function(){
		$("#orderPlacement").hide();
		 $("#displayQuantityData").show();
		if($(this).val() != ""){
			console.log(this.id);
			quantity.push($(this).val());
			var str = this.id; 
			res= str.replace("quantity", "");
		    console.log(res);
			id.push(res);
			

			var tblRow = "<tr id='resDel'>"
						+ "<td title='"+serviceUnitArray[res].productTypeName+"'>"+ serviceUnitArray[res].productTypeName + "</td>"
						+ "<td title='"+serviceUnitArray[res].productIdName+"'>"	+ serviceUnitArray[res].productIdName + "</td>"
						+ "<td title='"+serviceUnitArray[res].itemcode+"'>" + serviceUnitArray[res].itemcode+ "</td>" 
						+ "<td title='"+serviceUnitArray[res].itemdescrption+"'>"+ serviceUnitArray[res].itemdescrption + "</td>"
						+ "<td >" + $(this).val()+ "</td>"
						+"<td id='"+res+"delete' onclick='deleteRow(this.id);'><a  <i class='fa fa-trash' aria-hidden='true'></i></a> </td>"
						$(tblRow).appendTo("#tabledata table tbody");
			
		}
		
	});
	console.log(quantity);
	console.log(id); 
	
}

	function deleteRow(id) {
		console.log(id);
		  $("#resDel").remove(); //Deleting the Row (tr) Element 
	}
	     


var prodcutName='';

function editEmpCreation(id){
	$("#id").val(id);
	$("#branchId").val(serviceUnitArray[id].branchId);
	$("#name").val(serviceUnitArray[id].name);
	$("#username").val(serviceUnitArray[id].username);
	$("#password").val(serviceUnitArray[id].password);
	$("#roleId").val(serviceUnitArray[id].roleId);
	$("#email").val(serviceUnitArray[id].email);
	$("#phoneNumber").val(serviceUnitArray[id].phoneNumber);
	$("#status").val(serviceUnitArray[id].status);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteEmpCreation(id,status){
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
		
		$.fn.makeMultipartRequest('POST', 'deleteEmpCreation', false,
				formData, false, 'text', function(data) {
			if(data != ""){
				var resJson=JSON.parse(data);
	            showTableData(resJson);
				  tooltip();
	          
						console.log(resJson);
			}else{
// 				alert("Inactive List Empty");
				 showTableData("");
			}
		       // window.location.reload();
			
		});
	}
}

function dealerRegister(id) {
	alert("model"+id);
	$("#userId").val(id);
	
 	$("#myModal").modal();

}

function genarateAuthDetails() {
	
	var userId=$("#userId").val();
	var username=$("#username").val();
		var formData = new FormData();
		formData.append('userId', userId);
		formData.append('username', username);
		
		$.fn.makeMultipartRequest('POST', 'inActiveEmployeeCreation', false,
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
function inactiveData() {
	
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
	}
		
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActiveEmployeeCreation', false,
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


function productNameFilter(productName){
	var productId = $("#producttype").val();
	if(productId.length !=0){
		$('#loadAjax').show();
	$.ajax({
		type : "POST",
		url : "getProductNameFilter.json",
		data : "productId=" + productId,
		dataType : "json",
		success : function(response) {
			 /* alert(response); */  
			var optionsForClass = "";
			optionsForClass = $("#productname").empty();
			optionsForClass.append(new Option("-- Choose Product --"));
			$.each(response, function(i, tests) {
				var id=tests.id;
				var productname=tests.productname;
				optionsForClass.append(new Option(productname, id));
			});
			$('#loadAjax').hide();
			if(productName!='') $('#productname').val(productName);
			$('#productName').trigger("chosen:updated");
		},
		error : function(e) {
			$('#loadAjax').hide();
		},
		statusCode : {
			406 : function() {
				$('#loadAjax').hide();
		
			}
		}
	});
	$('#loadAjax').hide();

	}
} 


$("#pageName").text("Order Placement");
$(".orderPlacement").addClass("active"); 
</script>