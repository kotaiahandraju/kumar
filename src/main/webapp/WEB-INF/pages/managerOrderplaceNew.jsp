<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
 <link rel="stylesheet" type="text/css" href="../assets/css/img.css">
 <script src="${baseurl }/tablesearch/multifilter.js"></script>
<link rel="stylesheet" href="${baseurl }/tablesearch/style.css" />
 <style>
 .mobile {
 margin-bottom:5px;
 width:100px;}
 .accordion0 {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 5px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 13px;
    transition: 0.4s;
    margin-bottom:-15px;
}

.active, .accordion0:hover {
    background-color: #ccc;
}

.accordion0:after {
    content: '\002B';
    color: #777;
    font-weight: bold;
    float: right;
    margin-left: 5px;
}

.active:after {
    content: "\2212";
}

.panel0 {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    margin-bottom:10px;
    margin-top:5px;
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

</style>



	<div class="clearfix"></div>
	<ol class="breadcrumb">
    	<li><a href="dashboard">Home</a></li>
		<li>Manager Order Product</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container-fluid">
	<div class="col-md-12 col-sm-12" style="padding-left:0px; padding-right:0px;">
				
					<h4>Select Dealer</h4>
				
				<form:form class="form-horizontal" modelAttribute="managerorderLstForm" action="" method="Post">
					
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-3 control-label">Select Dealer <span class="impColor">*</span>
									</label>
									<div class="col-md-5">
										<form:select path="delerId" class="form-control" onchange="managercartCount();">
								    	<form:option value="">-- Select Dealer --</form:option>
								    	<form:options items="${dealersList }"></form:options>
								    	</form:select>
									</div>
								</div>
							</div>
					
					
					<!-- <div class="panel-footer">
						<div class="row">
							<div class="col-sm-12">
								<div class="btn-toolbar text-center">
									<input class="btn-primary btn" type="submit" value="Submit" id="submit1"> <input class="btn-danger btn cancel" type="reset" value="Reset">
								</div>
							</div>
						</div>
					</div> -->
				</form:form>
		</div><div class="clearfix"></div>
		<div class="row" id="orderPlacement">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4> Manager Order Product</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<!-- <div class="table-responsive" id="tableId"> -->
					<div id="accordionEx" >
					
						
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
					<div class="table-responsive" id="tabledata">
						<table class="table "
							id="example1">
							<thead>
								<tr><th> Product category</th><th>Product Subcategory</th><th>Item Code</th><th>Description</th><td>quantity</td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				</div>
	<c:choose>
<c:when test="${empty param.dealerId}">
   <script> var delerId1 = "";</script>
</c:when>
<c:otherwise>
   <script> 
   var delerId1 = "${param.dealerId}";
   
   $("#delerId").val(delerId1);
   $(document).ready(function() {
   managercartCount();
   });
   </script>
</c:otherwise>
</c:choose>
 
<script type="text/javascript">
var subCategoryMap =${sub_category_map};

console.log(subCategoryMap);
if (subCategoryMap != "") {
	showTableData(subCategoryMap);
}

var damageId = 0;
// var serviceUnitArray ={};
var data = {};


function showTableData(sub_category_map){
	var table=$('#accordionEx').html('');
	serviceUnitArray = {};
	var protectType = null;
	/* var tableHead = "<table cellpadding='0' cellspacing='0' border='0'  class='table table-bordered table-striped' id='example1'>"
    	+"<thead><tr style='background-color: #f7f8fa;'><th style='width:25%'>Product Subcategory</th><th style='width:16%'>Item Code</th><th style='width:49%'>Description</th><th style='width:5%'>Quantity</th></tr>"
    	+"<tr><th><input autocomplete='off' class='filter' name='Product Sub Category' placeholder='Search Product Subcategory' data-col='Product Sub Category'/></th>"
    	+"<th><input autocomplete='off' class='filter' name='Item Code' placeholder='Search Item Code' data-col='Item Code'/></th>"
    	+"<th><input autocomplete='off' class='filter' name='Description' placeholder='Search Description' data-col='Description'/></th></tr>"
   		+ "</thead><tbody></tbody>"
    	+"</table>";
	$("#tableId").html(tableHead); */
	//$.each(response,function(i, orderObj) {
	$.each(sub_category_map,function(key,value) {
		//serviceUnitArray[orderObj.id] = orderObj;
		//var quantity ="<input type='text' name='quantity[]' maxlength='3' class='numericOnly' id='"+orderObj.id+"quantity' />"
		/* var tblRow = "<tr>"
				// + "<td title='"+orderObj.productTypeName+"'>"+ orderObj.productTypeName + "</td>" 
				+ "<td title='"+orderObj.productIdName+"'>"	+ orderObj.productIdName + "</td>"
				+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode+ "</td>" 
				+ "<td title='"+orderObj.itemdescrption+"'>"+ orderObj.itemdescrption + "</td>"
				+ "<td >" + quantity+ "</td>"
		$(tblRow).appendTo("#tableId table tbody"); */
		var prod_name = key.split("##")[0];
		var prod_id_name = key.split("##")[1];
		
		var subcategory_div = '<button class="accordion0">'+prod_id_name+'</button><div class="panel0">';
			
			
			/* '<div class="card">'
							+ '	<div class="card-header" role="tab" id="heading'+prod_name+'"> '
							+ '		<a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapse'+prod_name+'" aria-expanded="false" aria-controls="collapse'+prod_name+'">'
							+ '			<h5 class="mb-0">'
							+ '    			'+prod_id_name+' <i class="fa fa-angle-down rotate-icon"></i>'
							+ '			</h5>'
							+ '		</a>'
							+ '	</div>'
							+ '	<div id="collapse'+prod_name+'" class="collapse" role="tabpanel" aria-labelledby="heading'+prod_name+'" data-parent="#accordionEx">'
							+ '		<div class="card-body">'; */
		var val_map = value;
		$.each(val_map,function(key2,value2) {
			var itemcode = key2.split("##")[0];
			var id = key2.split("##")[1];
			var quantity ="<input type='text' name='quantity[]' maxlength='4' class='mobile' id='"+id+"quantity' />"
			subcategory_div		+='	<div class="col-md-4">'+itemcode+'</div><div class="col-md-6">'+value2+'</div><div class="col-md-2">'+quantity+'</div></br>';
		});	       
		

		subcategory_div		+=   '	</div>';
						
		$(subcategory_div).appendTo("#accordionEx");
		
	});
	//if(isClick=='Yes') $('.datatables').dataTable();
	
}

var quantity = [];  
var productId = []; 
var res="";

function addCart() {
	quantity = [];  
	productId = [];
	var dealerId=$("#delerId").val();
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
	}else if($("#delerId").val() == "" || $("#delerId").val()== null){
		$("#delerId").css("border","red solid 1px");
		alert("Please Select Dealer ");
		return false;
	}
	var formData = new FormData();
	formData.append('quantity', quantity);
	formData.append('productId', productId);
	formData.append('userId',dealerId);
	
	$.fn.makeMultipartRequest('POST', 'manageraddtocart', false,
			formData, false, 'text', function(data) {
		if(data != ""){
			var jsonobj = $.parseJSON(data);
			var count = jsonobj.count;
			alert(jsonobj.msg);
			$("#managercartId").text(count);
// 		window.location.href = "${baseurl}/admin/cartdetails";
			$('input[name^=quantity]').each(function(){
				$(this).val("");
			});
		}
		$('#tagId').attr('href','managercartdetails?dealerId='+dealerId);
		
	});
	
}

function orderNow() {
	quantity = [];  
	productId = [];
	var dealerId=$("#delerId").val();
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
	}else if($("#delerId").val() == "" || $("#delerId").val()== null){
		$("#delerId").css("border","red solid 1px");
		alert("Please Select Dealer ");
		return false;
	}
	var formData = new FormData();
	formData.append('quantity', quantity);
	formData.append('productId', productId);
	formData.append('userId', dealerId);
	$.fn.makeMultipartRequest('POST', 'manageraddtocart', false,
			formData, false, 'text', function(data) {
		$('#tagId').attr('href','managercartdetails?dealerId='+dealerId);
		if(data != ""){
			var jsonobj = $.parseJSON(data);
			var count = jsonobj.count;
		window.location.href = "${baseurl}/admin/managercartdetails?dealerId="+dealerId;
			
		}
		
	});
	
}
	
function managercartCount(){
	var userId=$("#delerId").val();
	var formData = new FormData();
	formData.append('userId', userId);
	$.fn.makeMultipartRequest('POST', 'managercountCartdetails', false, formData, false, 'text', function(data){
		$('#tagId').attr('href','managercartdetails?dealerId='+userId);
		var jsonobj = $.parseJSON(data);
		var count = jsonobj.count;
		$("#managercartId").text(count);
	
	});
}

var acc = document.getElementsByClassName("accordion0");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}

$("#pageName").text("Order Product");
$(".orderplacing").addClass("active"); 
</script>