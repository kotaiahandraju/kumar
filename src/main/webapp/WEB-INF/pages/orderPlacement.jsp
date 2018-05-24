<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



<script src="${baseurl }/tablesearch/multifilter.js"></script>
<link rel="stylesheet" href="${baseurl }/tablesearch/style.css" />

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
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
    padding: 10px;
    line-height: 1.428571429;
    vertical-align: top;
    border-top: 1px solid #e6e7e8;
    
    width: 146px;
}
input {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    text-align: center;
}
.mobile {
width:40px;
}
#ui-datepicker-div{
/* 	width: auto !important; */
}
.table-responsive {
    overflow-x: auto;
    width: 100%;
}
.pull-right {
margin-bottom:8px;
}
</style>



	<div class="clearfix"></div>
	<ol class="breadcrumb">
    	<li><a href="dashboard">Home</a></li>
		<li>Order Product</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container-fluid">
		<div class="row" id="orderPlacement">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Order Product</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
<div class='container'>
<div class='filters'>
<div class='filter-container'>

</div>

<div class='filter-container'>

</div>
<div class='filter-container'>

</div>
<div class='clearfix'></div>
</div>
</div>

					<div class="panel-body collapse in">
					<input id="myInput" type="text" class="pull-right" placeholder="Search..">
					<div class="table-responsive" id="tableId">
						<table class="table table-bordered table-stripped "  width="100%" id="example">
							<thead>
								<tr><th>Product Sub Category</th><td>ItemCode</td><th>Description</th><td>quantity</td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
			<br>
					<div class="pull-right">
					<span class="btn btn-warning" onclick="addCart()"><i class="fa fa-shopping-cart"></i> ADD TO CART</span> 
					<span class="btn btn-danger" onclick="orderNow()"><!-- <i class="fa fa-bolt" aria-hidden="true"></i> -->PLACE ORDER</span>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="row" id="displayQuantityData" style="display: none;">
					<div class="table-responsive" id="tabledata" style="width:100%;">
						<table class="table table-bordered table-stripped " width="100%"
							id="example1">
							<thead>
								<tr><th> Product category</th><th>Product Sub category</th><th>Item Code</th><th>Description</th><td>quantity</td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				</div>
  <script type='text/javascript'>
    //<![CDATA[
      $(document).ready(function() {
        $('.filter').multifilter()
      })
    //]]>
  </script>

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
	var tableHead = "<table cellpadding='0' cellspacing='0' border='0'  class='table table-bordered table-striped' id='example1'>"
    	+"<thead><tr style='background-color: #f7f8fa;'><th style='width:25%'>Product Sub Category</th><th style='width:16%'>Item Code</th><th style='width:49%'>Description</th><th style='width:5%'>Quantity</th></tr>"
    	+"<tr><th><input autocomplete='off' class='filter' name='Product Sub Category' placeholder='Product Sub Category' data-col='Product Sub Category'/></th>"
    	+"<th><input autocomplete='off' class='filter' name='Item Code' placeholder='Item Code' data-col='Item Code'/></th>"
    	+"<th><input autocomplete='off' class='filter' name='Description' placeholder='Description' data-col='Description'/></th></tr>"
   		+ "</thead><tbody></tbody>"
    	+"</table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		serviceUnitArray[orderObj.id] = orderObj;
		
		var quantity ="<input type='text' name='quantity[]' maxlength='4' class='mobile' id='"+orderObj.id+"quantity' />"
		var tblRow = "<tr>"
				/* + "<td title='"+orderObj.productTypeName+"'>"+ orderObj.productTypeName + "</td>" */
				+ "<td title='"+orderObj.productIdName+"'>"	+ orderObj.productIdName + "</td>"
				+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode+ "</td>" 
				+ "<td title='"+orderObj.itemdescrption+"'>"+ orderObj.itemdescrption + "</td>"
				+ "<td >" + quantity+ "</td>"
		$(tblRow).appendTo("#tableId table tbody");
		
	});
	
	if(isClick=='Yes') $('.datatables').dataTable();
	
}

var quantity = [];  
var productId = []; 
var res="";
function addCart() {
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
	
	$.fn.makeMultipartRequest('POST', 'addtocart', false,
			formData, false, 'text', function(data) {
		if(data != ""){
			var jsonobj = $.parseJSON(data);
			var count = jsonobj.count;
			alert(jsonobj.msg);
			$("#cartId").text(count);
// 		window.location.href = "${baseurl}/admin/cartdetails";
			$('input[name^=quantity]').each(function(){
				$(this).val("");
			});
		}
		
	});
	
}

function orderNow() {
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
	
	$.fn.makeMultipartRequest('POST', 'addtocart', false,
			formData, false, 'text', function(data) {
		if(data != ""){
			var jsonobj = $.parseJSON(data);
			var count = jsonobj.count;
		window.location.href = "${baseurl}/admin/cartdetails";
			
		}
		
	});
	
}
	     
$("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#example1 tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });

$("#pageName").text("Order Product");
$(".orderplacing").addClass("active"); 
</script>