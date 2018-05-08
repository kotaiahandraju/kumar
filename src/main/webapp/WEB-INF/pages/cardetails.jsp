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
		<li>My Cart</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row" id="orderPlacement">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>My Cart List</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
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
			<br>
					<div class="pull-right">
					<a href="orderplacing"><span class="btn btn-warning" ><i class="fa fa-shopping-cart"></i> CONTINUE ORDER</span></a> 
					<span class="btn btn-danger"  onclick="ordePlacing();"><i class="fa fa-bolt" aria-hidden="true"></i> ORDER NOW</span>
					</div>
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
    	'<thead><tr><th> Product category</th><th>Product Sub category</th><td>Item Code</td><th>Description</th><th>Quantity</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		serviceUnitArray[orderObj.id] = orderObj;
		var quantity ="<input type='text' name='quantity[]' value="+orderObj.quantity+" class='numericOnly' id='"+orderObj.id+"quantity' />"
		var tblRow = "<tr>"
				+ "<td title='"+orderObj.productTypeName+"'>"+ orderObj.productTypeName + "</td>"
				+ "<td title='"+orderObj.productIdName+"'>"	+ orderObj.productIdName + "</td>"
				+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode+ "</td>" 
				+ "<td title='"+orderObj.itemdescrption+"'>"+ orderObj.itemdescrption + "</td>"
				+ "<td >" + quantity+ "</td>"
				+ "<th class='labelCss notPrintMe hideme' style='width: 10px;'><span><a href='javascript:void(0);' style='color: red;' onclick='removecartdata("
				+ orderObj.id + ");'><i class='fa fa-trash' style='color: red;text-decoration: none;cursor: pointer;'></i></a></span></th>"
		$(tblRow).appendTo("#tableId table tbody");
		
	});
	if(isClick=='Yes') $('.datatables').dataTable();
	
}

var quantity = [];  
var productId = []; 
var res="";

function ordePlacing() {
	quantity = [];  
	productId = [];
	 res="";
	$('input[name^=quantity]').each(function(){
		if($.trim($(this).val()) != ""){
			console.log(this.id);
			quantity.push($(this).val());
			var str = this.id; 
			res= str.replace("quantity", "");
		    console.log(res);
		    productId.push(res);
		}
	});
	console.log(quantity);
	console.log(productId); 
	if(productId == "" || productId== null){
		alert("No Products selected ");
		return false;
	}
	var formData = new FormData();
	formData.append('quantity', quantity);
	formData.append('productId', productId);
	
	$.fn.makeMultipartRequest('POST', 'dealerorderproducts', false,
			formData, false, 'text', function(data) {
		if(data != ""){
			var jsonobj = $.parseJSON(data);
			var count = jsonobj.count;
			alert(jsonobj.msg);
			$("#cartId").text(count);
		window.location.href = "${baseurl}/admin/cartdetails";
		}
		
	});
	
}


function removecartdata(id){
	var formData = new FormData();
	formData.append('id', id);
	
	$.fn.makeMultipartRequest('POST', 'deletecart', false,
			formData, false, 'text', function(data) {
		var jsonobj = $.parseJSON(data);
		var allOrders = jsonobj.allOrders1;
		showTableData(allOrders);
		var count = jsonobj.count;
		$("#cartId").text(count);
		alert(jsonobj.msg);
		
	});
}

$("#pageName").text("My Cart");
// $(".orderplacing").addClass("active"); 
</script>