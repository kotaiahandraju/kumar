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
table.dataTable tbody tr {
    background-color: #ffffff;
}
.table-striped tbody tr:nth-of-type(odd) {
    background-color: #fff !important;
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
@media print {
body {-webkit-print-color-adjust: exact;}
}
@media print {
.table-bordered {
    border: 1px solid #dee2e6;
}
.table-striped tbody tr:nth-of-type(odd) {
    background-color: rgba(0,0,0,.05);

    -webkit-print-color-adjust: exact; 
}}


#ui-datepicker-div{
/* 	width: auto !important; */
}
.invo {
padding-top:15px;
font-weight:600;
font-size:28px;
text-align:center;
}
.table-bordered {
    border: 1px solid #dee2e6;
}
.table-striped tbody tr:nth-of-type(odd) {
    background-color: rgba(0,0,0,.05);
}
</style>
<!-- <script src="jquery.PrintArea.js"></script> -->



	<div class="clearfix"></div>
	<ol class="breadcrumb" id="pbreadcrumb">
    	<li><a href="dashboard">Home</a></li>
		<li>My Cart</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container-fluid" id ="hideForInvoice">
		<div class="row" id="orderPlacement">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>My Cart List</h4>
						<span id="orderSuccessMsg"></span>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<div class="table-responsive" id="tableId">
						<table class="table table-bordered table-striped" id="example">
							<thead>
								<tr><th> Product Category</th><th>Product Subcategory</th><td>Item Code</td><th>Description</th><td>Quantity</td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
			<br>
					<div class="pull-right">
					<a href="orderplacing"><span class="btn btn-warning" ><!-- <i class="fa fa-shopping-cart"></i> --> ADD MORE ITEMS</span></a> 
					<span class="btn btn-danger"  onclick="ordePlacing();"><!-- <i class="fa fa-bolt" aria-hidden="true"></i> -->CONFIRM ORDER</span>
					</div>
				</div>
				</div>
			</div>
		</div>
		<!-- <div class="row" id="displayQuantityData" style="display: none;">
					<div class="table-responsive" id="tabledata">
						<table class="table "	id="example1">
							<thead>
								<tr><th> Product category</th><th>Product Sub category</th><td>Item Code</td><th>Description</th><td>quantity</td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div> -->
				</div>
				<div class="clearfix"></div>
				<div class="container-fluid " id="invoicediv" style="display: none;">
        			        			
<!-- 				<h1 class="invo"><b>Order Confirmed</b></h1><div class="clearfix"></div> -->
<!--     <label class="col-md-1" for="Invoiceid"><b>Invoice ID</b></label> -->
<!--     <span  type="invoice" class="col-md-11 " id="invoice">fsd</span> -->
<!--     <label class="col-md-1" for="Orderid"><b>Order ID &nbsp; &nbsp;</b></label> -->
<!--     <span type="order" class="col-md-11 " id="order">dfds</span> -->
								
									<h1 class="invo">Order Confirmed</h1>
							<div class="clearfix"></div>
    <label class="col-md-1" for="Invoiceid">Invoice ID</label>
    <span  type="invoice" class="col-md-11 " id="invoice">fsd</span>
							<div class="clearfix"></div>	
								
    <label class="col-md-1" for="Orderid">Order ID &nbsp; &nbsp;</label>
    <span type="order" class="col-md-11 " id="order">dfds</span>
								
								<div class="clearfix">
								</div>	
									<span class="table-responsive" id="tableIdm">
						<table class="table table-bordered table-striped">
							<thead>
								<tr  style="background:#4f8edc;color:#fff;"><th>Product Category</th><th>Product Subcategory</th><th>Item Code</th><th>Description</th><th>Price</th><th>Quantity</th><th>Total Amount</th>
								</tr>
							</thead>
							<tbody></tbody>
							<tfoot><tr><th colspan='6' style='text-align:right;' >Total</th><th id='grandtotal1'></th></tr></tfoot>
						</table>
					</span>
									
						<div align="center"><button onclick="printInvoice('#invoicediv')" id="printbtn" class="btn btn-primary">Print</button>
						<button onclick="cancelPrint()" id="cancelbtn" class="btn btn-primary">Cancel</button>		
							</div>	
        			</div>
        			
        					</div>	
			
				<!-- Invoice Model Start  -->
				
				 <!-- <div id="invoiceModal" data-backdrop="static" data-keyboard="false" role="dialog">
	<div class="modal-dialog">
		Modal content
		<div class="modal-content">
			<div class="modal-header" style="background: #166eaf;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="color: white;">Kumar Invoice </h4>
        	</div>
        	<div style="max-width:90%; margin:0 auto; background:#FFFFFF;" class="modal-body">
        		<div align="center" class="text"><span class="impColor0"></span></div>
        		<div class="row">
        			<div class="col-md-12">
				
							
								<div class="form-group">
									<label class="col-md-3 control-label no-padding-right">Invoice Id</label>
									<div class="col-md-3">
										<span id="invoiceId" class="form-control"></span> 
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-md-3 control-label no-padding-right">Order Id</label> 
									<div class="col-md-3">
										<span id="orderId" class="form-control"></span>
									</div>
								</div>
								
								<div class="form-group" id= "productsList">
									
									<div class="table-responsive" id="tabledata">
						<table class="table " id="example1">
							<thead>
								<tr><th></<th>Item Code</th><th>quantity</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
									
								</div>
								
        			</div>
        					</div>				
								
									<div class="panel-footer">
				      	
			      	</div>

                    		
                    	
                    		
                    		</div>
                    		
				</div> 
					
				</div> 
				</div> -->
				<!-- Invoice Model End -->	
<script type="text/javascript">
 var listOrders1 =${allOrders1};
 
 $('#invoicediv').hide();

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
	var grandtotal =0.00;
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-striped  datatables" id="example1">'+
    	'<thead><tr  style="background:#f0f2f7;color:#383e4b;"><th> Product Category</th><th>Product Subcategory</th><td>Item Code</td><th>Description</th><th>Price</th><th>Quantity</th><th>Total Amount</th><th></th></tr>'+
    	"</thead><tbody></tbody><tfoot><tr><th colspan='6' style='text-align:right;' >Total</th><th id='grandtotal'>800</th></tr></tfoot></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		grandtotal =grandtotal+parseFloat(orderObj.totalamount);
		serviceUnitArray[orderObj.id] = orderObj;
		var quantity ="<input type='text' name='quantity[]' style='width:45px' onkeyup='pricecal(this.id)' value="+orderObj.quantity+" class='form-control validate mobile' maxlength='4' id='"+orderObj.productId+"quantity' />"
		var tblRow = "<tr>"
				+ "<td title='"+orderObj.productTypeName+"'>"+ orderObj.productTypeName + "</td>"
				+ "<td title='"+orderObj.productIdName+"'>"	+ orderObj.productIdName + "</td>"
				+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode+ "</td>" 
				+ "<td title='"+orderObj.itemdescrption+"'>"+ orderObj.itemdescrption + "</td>"
				+ "<td title='"+orderObj.itemprice+"' id='"+orderObj.productId+"price'>"+ orderObj.itemprice + "</td>"
				+ "<td >" + quantity+ "</td>"
				+ "<td title='"+orderObj.totalamount+"' name='totalamount[]' id='"+orderObj.productId+"totalamount'>"+ orderObj.totalamount + "</td>"
				+ "<th class='labelCss notPrintMe hideme' style='width: 10px;'><span><a href='javascript:void(0);' style='color: red; text-align:center;' onclick='removecartdata("
				+ orderObj.id + ");'><i class='btn btn-danger fa fa-trash' style='color: red;text-decoration: none;cursor: pointer;'></i></a></span></th>"
		$(tblRow).appendTo("#tableId table tbody");
		
	});
	$("#grandtotal").text(grandtotal);
	if(isClick=='Yes') $('.datatables').dataTable({ "pageLength": 50});
}

var quantity = [];  
var productId = []; 
var res="";
var amount =[];
$("#invoiceModal").hide();
function ordePlacing() {
	quantity = [];  
	productId = [];
	 res="";
	 amount =[];
	 var table = $('#example1').DataTable();
	table.$('input[name^=quantity]').each(function(){
		if($.trim($(this).val()) != ""){
			console.log(this.id);
			
			quantity.push($(this).val());
			var str = this.id; 
			res= str.replace("quantity", "");
		    console.log(res);
		    productId.push(res);
		    amount.push($("#"+res+"price").text());
		}
	});
	
	console.log(quantity);
	console.log(productId); 
	/* if(productId == "" || productId== null){
		alert("No Products selected ");
		return false;
	} */
	var formData = new FormData();
	formData.append('quantity', quantity);
	formData.append('productId', productId);
	formData.append('amount', amount);
	
	$.fn.makeMultipartRequest('POST', 'dealerorderproducts', false,
			formData, false, 'text', function(data) {
		console.log(data);
		if(data != ""){
			var jsonobj = $.parseJSON(data);
			var orderId = jsonobj[0].orderId;
			var invoiceId = jsonobj[0].invoiceId;
		
			$('#orderSuccessMsg').text("Order Sucessfully");
			$('#cartId').text("0");
			   $('#invoice').text(invoiceId);
			   $('#order').text(orderId);
			   
			   if (listOrders1 != "") {
					showTableDataOnInvoice(listOrders1);
				}
			   
			   $('#orderPlacement').hide();
			   $('#invoicediv').show();
			   
			/* var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table datatables" id="example1">'+
	    	'<thead><tr><th>Product Name</th><th>Item Code</th><th>Quantity</th><th>Price<i class="fas fa-rupee-sign"></i></th><th></th></tr>'+
	    	"</thead><tbody></tbody></table>";
		$("#productsList").html(tableHead); */
		
		/* $.each(result[0], function(key, value){
		    console.log(key, value);
		}); */
		/* $.each(jsonobj[1],function(key, value) {
			//produ = orderObj[1];
			//var quantity ="<input type='text' name='quantity[]' value="+orderObj.quantity+" class='numericOnly' id='"+orderObj.productId+"quantity' />"
			var tblRow = "<tr>"
					+ "<td title=''></td>"
					+ "<td title='"+key+"'>"+ key + "</td>"
					+ "<td title='"+value+"'>"+ value + "</td>"
					+ "<td title=''></td>"
			//$(tblRow).appendTo("#productsList table tbody");
			
		}); */
		
			 /* $("#hideForInvoice").hide();			
			$("#invoiceModal").show();
			
			$("#invoiceId").text(invoiceId);
			$("#orderId").text(orderId);  */
			
		//window.location.href = "${baseurl}/admin/cartdetails";
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
	/* 	showTableDataOnInvoice(allOrders); */
	
	listOrders1 =allOrders;
	    /*  console.log("hello"+listOrders1); */
		var count = jsonobj.count;
		$("#cartId").text(count);
		alert(jsonobj.msg);
		
	});
}

function showTableDataOnInvoice(response){
	var table=$('#tableId').html('');
	serviceUnitArray = {};
	var grandtotal =0.00;
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-striped  " id="example1">'+
    	'<thead><tr style="background:#f0f2f7;color:#383e4b;"><th> Product Category</th><th>Product Subcategory</th><td>Item Code</td><th>Description</th><th>Price</th><th>Quantity</th><th>Total Amount</th><th></th></tr>'+
    	"</thead><tbody></tbody><tfoot><tr><th colspan='6' style='text-align:right;' >Total</th><th></th></tr></tfoot></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		grandtotal =grandtotal+parseFloat(orderObj.totalamount);
		serviceUnitArray[orderObj.id] = orderObj;
		var quantity ="<input type='text'  name='quantity[]'  value="+orderObj.quantity+" class='form-control validate mobile' id='"+orderObj.productId+"quantity' />"
		var tblRow = "<tr>"
				+ "<td title='"+orderObj.productTypeName+"'>"+ orderObj.productTypeName + "</td>"
				+ "<td title='"+orderObj.productIdName+"'>"	+ orderObj.productIdName + "</td>"
				+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode+ "</td>" 
				+ "<td title='"+orderObj.itemdescrption+"'>"+ orderObj.itemdescrption + "</td>"
				+ "<td title='"+orderObj.itemprice+"' id='"+orderObj.productId+"price'>"+ orderObj.itemprice + "</td>"
				+ "<td title='"+orderObj.quantity+"'>"+ orderObj.quantity + "</td>"
				+ "<td title='"+orderObj.totalamount+"' id='"+orderObj.productId+"totalamount'>"+ orderObj.totalamount + "</td>"
		$(tblRow).appendTo("#tableIdm table tbody");
		
	});
	$("#grandtotal1").text(grandtotal);
}



function printInvoice(elem)
{
	$(".noPrint").hide();
	$("#printbtn").hide();
    $("#cancelbtn").hide();

	 $("#printFooter").show();
    Popup($(elem).html());
    
}


function Popup(data)
{
	var mywindow = window.open('','new div');

    var is_chrome = Boolean(mywindow.chrome);
    var isPrinting = false;
    mywindow.document.write('<html><head><title>Order Details</title><style>.invo {padding-top:15px;font-weight:600;text-align: center;}@media print{table { page-break-after:auto }tr    { page-break-inside:avoid; page-break-after:auto }td    { page-break-inside:avoid; page-break-after:auto }thead { display:table-header-group }tfoot { display:table-footer-group }}table { page-break-inside:auto }   div   { page-break-inside:avoid; }  thead { display:table-header-group }  tfoot { display:table-footer-group }</style><link rel="stylesheet" type="text/css" href="../assets/css/img.css"><link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css"></head><body>');
    mywindow.document.write(data);
   
    mywindow.document.write('</body></html>');
    mywindow.document.close(); // necessary for IE >= 10 and necessary before onload for chrome

$(".printbtn").show();
$(".noPrint").show();
$("#printbtn").show();
$("#cancelbtn").show();
    if (is_chrome) {
        mywindow.onload = function() { // wait until all resources loaded 
            mywindow.focus(); // necessary for IE >= 10
            mywindow.print();  // change window to mywindow
            mywindow.close();// change window to mywindow
        };
    
    
   } else {
        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10

        mywindow.print();
        mywindow.close();
   }
    
	
  
    return true;
}




function cancelPrint() {
	window.location.href="orderplacing";
}

function pricecal(id){
	
	 var id =  id.replace("quantity", ""); 
	 var quantity = $("#"+id+"quantity").val();
	 var count=0;
	 
	  if(quantity == ""){
		  quantity =0; 
	  }
	   var price =$("#"+id+"price").text();
	   var totalamount = price*quantity ;
		$("#"+id+"totalamount").text(totalamount);
		
		$('td[name^=totalamount]').each(function(){
			if($.trim($(this).text()) != ""){
				console.log(this.id);
				count += parseInt($(this).text());
				
			}
		});
		console.log("-------------grandtotal--------- :"+count);
	
		$("#grandtotal").text(count);
	  
	}



$("#pageName").text("Cart Details");

// $(".orderplacing").addClass("active"); 
</script>