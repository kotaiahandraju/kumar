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
 border: px solid black !important;
 }
 .mobile {
 width:40px;
 border:1px solid #ccc;
 }
 @media only screen and (max-width: 640px) and (min-width: 320px) {
 .modal-dialog {
    width: 100%;
    margin: 30px auto;
}
.modal-content {
box-shadow:none !important;
border:none !important;
}
#exampleModalLabel .col-md-4 {
width:400px;

}
 }
 .table-striped > tbody > tr:nth-of-type(2n+2) {
    background-color: #fff;
}
.modal-dialog {
    width: 90%;
    margin: 30px auto;
    background:#fff;
}
.table-striped > tbody > tr:nth-of-type(even) {
background:#fff;
}
 @media only screen  (max-width: 1366px) {
.modal-dialog {
    width: 90%;
    margin: 30px auto;
}
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
               <li>Orders List </li>
            </ol>
            <div class="clearfix"></div>
        <div class="container-fluid" id="lpoMain">
        
        
         <div class="row" id="moveTo">
            <div class="col-md-12 col-sm-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Select Dealer</h4>
                        <div class="options"></div>
                    </div>
	                <form:form  modelAttribute="orderLstForm"   class="form-horizontal" method="post" >
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Dealer : <span class="impColor">*</span></label>
                    				<div class="col-md-6">
                    					<form:select path="name" class="form-control " onchange="orederLists();">
								    	<form:option value="all">All</form:option>
								    	<form:options items="${dealersList }"></form:options>
								    	</form:select>
								    	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Delivery Status : </label>
                    				<div class="col-md-6">
                    					<form:select path="status" class="form-control " onchange="orederLists();">
                    					<form:option value="">--- Select Status ---</form:option>
								    	<form:option value="all">All</form:option>
								    	<form:option value="pending">Pending</form:option>
								    	<form:option value="partially">Partially delivered</form:option>
								    	<form:option value="completed">Completed</form:option>
								    	</form:select>
								    	</div>
                    			</div>
                    		</div>
                    	</div>
                    		
                    		</div>
                    		</form:form>
                    	</div>
                    </div>
                </div>
        
        
        
            <div class="row" id="row1">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Orders List</h4>
                            <div class="options">   
                                <a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
                            </div>
                        </div>
                        <div class="panel-body collapse in">
                   <!--      <input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label> -->
                        <div class="table-responsive" id="tableId" >
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
                                <thead>
                                	<tr>
                                		<th>Business Name</th><th>Product Category</th><th>Product Subcategory </th><th>Item Code</th><th>Item Description</th><th>Quantity</th>
                                	</tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                         </div>
                        </div>
                    </div>
                </div>
            </div>

           
            </div>
           <!--  <input type="submit" id="submitButton"/> -->


  
<div class="modal fade" id="orderListModal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog table-responsive"> 
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel"><span id="dealer_name_str"></span></h4>
		       <span class="col-md-2" style="width:9.5%"><b>Dealer Name :</b></span><span class="col-md-3" id="dname">as</span> <span class="col-md-2" style="width:8%"><b>Order ID :</b></span> <span class="col-md-3" id="kumarid">as</span><span class="col-md-2" style="width:8.8%"><b>Order Date :</b></span>  <span class="col-md-2" id="korderdDate">as</span><br>
		      </div>
		      <div class="modal-body" id="modal_body">
		      
				      
		      </div>
		      <div class="modal-footer">
		       <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
</div>

<div class="modal fade" id="historyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog table-responsive"> 
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel"><span id="dealer_name_str"></span></h4>
		       <span class="col-md-2" style="width:9.5%"><b>Dealer Name :</b></span><span class="col-md-3" id="dname"></span> <span class="col-md-2" style="width:8%"><b>Order ID :</b></span> <span class="col-md-3" id="kumarid2"></span> <span class="col-md-2" style="width:8.8%"><b>Order Date :</b></span>  <span class="col-md-2" id="korderdDate2"></span><br>
		      </div>
		      <div class="modal-body" id="history_modal_body">
		      
				      
		      </div>
		      <div class="modal-footer">
		       <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
</div>

<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<script type="text/javascript">

$(document).ready(function(){
    $("#submitButton").click(function(){
        $("#orderListModal").modal();
    });
});
/* $(document).ready(function() {
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
}); */
 var lstOrders =${all_orders};

// console.log(lstOrders);

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

var orderedDate =0;
function showTableData(response){
	serviceUnitArray ={};
	//serviceUnitArray1 ={};
	var table=$('#tableId').html('');
	
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>Ordered Date </th> <th>Order ID</th><th>Business Name</th><th>Total Items</th><th>Ordered by</th><th>Delivery Status</th><th>Delivered Items History</th></tr>'+
    	"</thead><tbody></tbody></table>"; 
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		
		orderedDate= orderObj.created_on;
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.created_on+"'>" + orderObj.created_on + "</td>"
			/* + "<td title='"+orderObj.orderId+"'>" + orderObj.orderId + "</td>" */
			+ '<td><a   href="#" type="button" onclick="getDealerOrdersItems(\''+orderObj.orderId+'\');">' + orderObj.orderId + '</a></td>'
			+ "<td title='"+orderObj.businessName+"'>" + orderObj.businessName + "</td>"
		
			+ "<td title='"+orderObj.total_quantity+"'>" + orderObj.total_quantity + "</td>"
			+ "<td title='"+orderObj.dealerName+"'>" + orderObj.dealerName + "</td>"
			+ "<td title='"+orderObj.completed_status+"'>" + orderObj.completed_status + "</td>"
		/* 	+ '<td><a   href="#"  onclick="getDealerOrdersItems(\''+orderObj.orderId+'\');">View Order</a></td>' */
			+ '<td><a href="#" type="button" onclick="getDeliveredItemsHistory(\''+orderObj.orderId+'\');">View History</a></td>'
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}
function getDealerOrdersItems(order_id){
	//event.preventDefault();
	
		$.ajax({
					type : "POST",
					url : "getItemsOfOrder.htm",
					data :"order_id="+order_id,
					 beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });displayDealerOrderItems
			             
			             
			          },
					success: function (response) {
		                	 $.unblockUI();
		                	 
		                 if(response != null ){
		                	 var resJson=JSON.parse(response);
		                	 displayDealerOrderItems(resJson.itemsList);
		                	}
		                 $('#orderListModal').modal('toggle');
	                		$('#orderListModal').modal('show');
		                 },
		             error: function (e) { 
		            	 $.unblockUI();
							console.log(e);
		             }
				});
	
}
function getDeliveredItemsHistory(order_id){
	//event.preventDefault();
	
		$.ajax({
					type : "POST",
					url : "getDeliveredItemsHistory.htm",
					data :"order_id="+order_id,
					 beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });
			          },
					success: function (response) {
		                	 $.unblockUI();
		                	 
		                 if(response != null ){
		                	 var resJson=JSON.parse(response);
		                	 displayHistory(resJson.itemsList);
		                	}
		                 $('#historyModal').modal('toggle');
	                		$('#historyModal').modal('show');
		                 },
		             error: function (e) { 
		            	 $.unblockUI();
							console.log(e);
		             }
				});
	
}
function displayDealerOrderItems(response){
	//serviceUnitArray ={};
	serviceUnitArray1 ={};
	$('#modal_body').html('');
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>Business Name</th><th>Product Category</th><th>Product Subcategory </th><th>Item Code</th><th>Item Description</th><th>Ordered Quantity</th><th>Delivered Quantity</th><th>Nullified Quantity</th><th>Pending Quantity</th><th>Deliver Quantity</th><th>Nullify Quantity</th><th ></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#modal_body").html(tableHead);
	$.each(response,function(i, orderObj) {
		
		  $('#dname').text(orderObj.dealerName);
		  $('#kumarid').text(orderObj.orderId);
		  $('#korderdDate').text(orderObj.created_time );
		  
		
		
		serviceUnitArray1[orderObj.id] = orderObj;
		//if(i==0)
			/* $("#dealer_name_str").html(orderObj.dealerName+"\'s order("+orderObj.orderId+") items"); */
		var text_field_str = '<td colspan="3" align="center">Completed</td>';
		if(typeof orderObj.pending_qty != "undefined"){
				var int_val = parseInt(orderObj.pending_qty);
				if(int_val>0){
					text_field_str = "<td><input type='text' width='40px'  maxlength ='4' class='mobile' id='qty"+orderObj.id+"' /></td>"
									+"<td><input type='text' width='40px'  maxlength ='4' class='mobile' id='nullify_qty"+orderObj.id+"' value='0'/></td>"
									+"<td><input type='button'   value='Submit' onclick='saveDeliverableItemsData("+orderObj.id+")' /></td>";
				}
		}
		var tblRow ="<tr id='row"+orderObj.id+"'>"
			+ "<td title='"+orderObj.businessName+"'>" + orderObj.businessName + "</td>"
			+ "<td title='"+orderObj.categeory+"'>" + orderObj.categeory + "</td>"
			+ "<td title='"+orderObj.subCategeory+"'>" + orderObj.subCategeory + "</td>"
			+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode + "</td>"
			+ "<td title='"+orderObj.itemdescrption+"'>" + orderObj.itemdescrption + "</td>"
			+ "<td title='"+orderObj.quantity+"'>" + orderObj.quantity + "</td>"
			+ "<td id='delivered_qty"+orderObj.id+"' title='"+orderObj.delivered_qty+"'>" + orderObj.delivered_qty + "</td>"
			+ "<td id='nullified_qty"+orderObj.id+"' title='"+orderObj.nullified_qty+"'>" + orderObj.nullified_qty + "</td>"
			+ "<td id='pending_qty"+orderObj.id+"' title='"+orderObj.pending_qty+"'>" + orderObj.pending_qty + "</td>"
			+ text_field_str
			//+ "<td>"+text_field_str+"</td>"
			//+ "<td><input type='button' id='deliverable_submit_btn' value='Submit' onclick='saveDeliverableItemsData("+orderObj.id+")' /></td>"
			+"</tr>";
		$(tblRow).appendTo("#modal_body tbody");
		
	});
	
	//$('#orderListModal').modal('show');
	//if(isClick=='Yes') $('.datatables').dataTable();
	
	$(".mobile").keydown(function (e) {
	    // Allow: backspace, delete, tab, escape, enter and .
	    if ($.inArray(e.keyCode, [8, 9, 27, 13]) !== -1 ||
	         // Allow: Ctrl+A, Command+A
	        (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
	         // Allow: home, end, left, right, down, up
	        (e.keyCode >= 35 && e.keyCode <= 40)) {
	             // let it happen, don't do anything
	             return;
	    }
	    // Ensure that it is a number and stop the keypress
	    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
	        e.preventDefault();
	    }
	});
}
function displayHistory(response){
	//serviceUnitArray ={};
	serviceUnitArray1 ={};
	$('#history_modal_body').html('');
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>Business Name</th><th>Delivered Product Category</th><th>Delivered Product Subcategory </th><th>Delivered  Item Code</th><th>Delivered Item Description</th><th>Delivered  Quantity</th><th>Delivered On</th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#history_modal_body").html(tableHead);
	$.each(response,function(i, orderObj) {
		
		  //$('#dname').text(orderObj.dealerName);
		  $('#kumarid2').text("Order ID:"+orderObj.order_id);
		  $('#korderdDate2').text("Ordered On:"+orderObj.ordered_date );
		  
		
		
		serviceUnitArray1[orderObj.id] = orderObj;
		if(i==0)
			/* $("#dealer_name_str").html(orderObj.dealerName+"\'s order("+orderObj.orderId+") items"); */
		var text_field_str = '<td colspan="2" align="center">Completed</td>';
		if(typeof orderObj.pending_qty != "undefined"){
				var int_val = parseInt(orderObj.pending_qty);
				if(int_val>0){
					text_field_str = "<td><input type='text' width='40px'  maxlength ='4' class='mobile' id='qty"+orderObj.id+"' /></td>"
									+"<td><input type='button'   value='Submit' onclick='saveDeliverableItemsData("+orderObj.id+")' /></td>";
				}
		}
		var tblRow ="<tr id='row"+orderObj.id+"'>"
			+ "<td title='"+orderObj.businessName+"'>" + orderObj.businessName + "</td>"
			+ "<td title='"+orderObj.categeory+"'>" + orderObj.categeory + "</td>"
			+ "<td title='"+orderObj.subCategeory+"'>" + orderObj.subCategeory + "</td>"
			+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode + "</td>"
			+ "<td title='"+orderObj.itemdescrption+"'>" + orderObj.itemdescrption + "</td>"
			+ "<td title='"+orderObj.dispatched_items_quantity+"'>" + orderObj.dispatched_items_quantity + "</td>"
			+ "<td title='"+orderObj.delivered_on+"'>" + orderObj.delivered_on + "</td>"
			//+ "<td>"+text_field_str+"</td>"
			//+ "<td><input type='button' id='deliverable_submit_btn' value='Submit' onclick='saveDeliverableItemsData("+orderObj.id+")' /></td>"
			+"</tr>";
		$(tblRow).appendTo("#history_modal_body tbody");
		
	});
	
	//$('#orderListModal').modal('show');
	//if(isClick=='Yes') $('.datatables').dataTable();
}	
		
		
		
		


/* function getDealerOrdersList(order_id,event) {
	//event.preventDefault();
	var dealerId=$("#name").val();
	var order_id = 'Kumar-1-1739';
		$.ajax({
					type : "POST",
					url : "getItemsOfOrder.htm",
					data :"dealerId="+dealerId+"&order_id="+order_id,
					 beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });
			          },
					success: function (response) {
		                	 $.unblockUI();
		                 if(response != null ){
		                	 var resJson=JSON.parse(response);
		                	 displayDealerOrderItems(resJson.allOrders1);
		                	 $('#orderListModal').modal('toggle');
		                		$('#orderListModal').modal('show');
		                		alert("@@@@@@@");
		                	//window.location.reload();
		                	}
// 		                 window.location.reload();
		                 },
		             error: function (e) { 
		            	 $.unblockUI();
							console.log(e);
		             }
				});
		//event.preventDefault();
} */

function orederLists() {
	
	var dealerId=$("#name").val();
	var status=$("#status").val();
		$.ajax({
					type : "POST",
					url : "orederLists.htm",
					data :"dealerId="+dealerId+"&status="+status,
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

function saveDeliverableItemsData(objId){
	var order_id = serviceUnitArray1[objId].orderId;
	var product_id = serviceUnitArray1[objId].productId;
	var quantity = $("#qty"+objId).val();
	var pending_qty = serviceUnitArray1[objId].pending_qty;
	var nullify_qty = $("#nullify_qty"+objId).val();
	if((quantity=="undefined" && nullify_qty=="undefined") ||
	   (quantity==0 && nullify_qty==0)	|| (quantity.trim()=="" && nullify_qty.trim()=="")){
		alert("Enter some valid quantity and click Submit");
		return false;
	}
	if(quantity.trim()=="0"){
		alert("Invalid quantity for delivery");
		return false;
	}
	if(quantity!="undefined"){
		quantity = quantity.trim();
	}
	if(nullify_qty!="undefined"){
		nullify_qty = nullify_qty.trim();
	}
	if(quantity=="undefined" || quantity==""){
		quantity = 0;
	}
	if(nullify_qty=="undefined" || nullify_qty==""){
		nullify_qty = 0;
	}
	
	if((parseInt(quantity)+parseInt(nullify_qty))>parseInt(pending_qty)){
		alert("Quantity should not be greater than pending quantity.");
		return false;
	}
	var balance_qty = pending_qty - quantity - nullify_qty;
	$.ajax({
		type : "POST",
		url : "saveDispatchedItemsData.htm",
		data :"order_id="+order_id+"&product_id="+product_id+"&quantity="+quantity+"&balance_qty="+balance_qty+"&nullify_qty="+nullify_qty,
		 beforeSend : function() {
             $.blockUI({ message: 'Please wait' });
          },
		success: function (response) {
            	 $.unblockUI();
            	 var resJson=JSON.parse(response);
            	 var msg = resJson.message;
             if(typeof msg != "undefined"){
            	 	if(msg=="success"){
            	 		$("#qty"+objId).val("");
            	 		$("#nullify_qty"+objId).val("");
            	 		alert("Data saved successfully");
            	 		serviceUnitArray1[objId].pending_qty = balance_qty;
            	 		serviceUnitArray1[objId].delivered_qty = parseInt(serviceUnitArray1[objId].delivered_qty)+parseInt(quantity);
            	 		serviceUnitArray1[objId].nullified_qty = parseInt(serviceUnitArray1[objId].nullified_qty)+parseInt(nullify_qty);
            	 		$("#delivered_qty"+objId).html(serviceUnitArray1[objId].delivered_qty);
            	 		$("#nullified_qty"+objId).html(serviceUnitArray1[objId].nullified_qty);
            	 		$("#pending_qty"+objId).html(balance_qty);
            	 		
            	 		if(balance_qty==0){
            	 			//$("#modal_body tbody ")
            	 			$('#row'+objId).find("td").last().remove();
            	 			$('#row'+objId).find("td").last().remove();
            	 			$('#row'+objId).find("td").last().remove();
            	 			var new_td = '<td colspan="3" align="center">Completed</td>';
            	 			$(new_td).appendTo($('#row'+objId));
            	 		}
            	 	}else{
            	 		alert("Some problem occured! Please try again.");
            	 	}
             }
//              window.location.reload();
             },
         error: function (e) { 
        	 $.unblockUI();
				console.log(e);
         }
	});
}

$("#pageName").text("Delivery Status");
$(".orderslist").addClass("active");
</script>
