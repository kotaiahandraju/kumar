<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
 <link rel="stylesheet" type="text/css" href="../assets/css/img.css">
 <style>
 .table > colgroup + thead > tr:first-child > th {
border-right:1px solid #006699 !important;
} 
 .table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td {
    border-top: 0;
    text-align: center;
}
 .table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td
 {
 border: px solid black !important;
 }
 @media (min-width: 768px) {
.modal-dialog {
    width: 997px;
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
              <li>Dashboard</li>
            </ol>
            <div class="clearfix"></div>
        <div class="container-fluid" id="lpoMain">
        
        	<div class="row" id="moveTo">
            <div class="col-md-12 col-sm-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Select Branch</h4>
                        <div class="options"></div>
                    </div>
	                <form:form  modelAttribute="orderLstForm"   class="form-horizontal" method="post" id="products_summary_form" name="products_summary_form">
                    <div class="panel-body">
                    	<div class="row">
                    	
                   		<c:if test="${cacheUserBean.roleId == '1'}">
                   		<div class="col-md-4">
                   			<div class="form-group">
                   				<label for="focusedinput" class="col-md-2 control-label" style="padding-top:8px;">Branch: </label>
                   				<div class="col-md-6">
                   					<form:select path="branchId" class="form-control " onchange="getProductsList()">
							    	<form:option value="all">All</form:option>
							    	<form:options items="${branches_list}" itemValue="id" itemLabel="branchname"/>
							    	</form:select>
							    	</div>
                   			</div>
                   		</div>
                   		</c:if>
                   		<!-- <div class="col-md-2">
                   			<div class="form-group">
                   				<div class=" ">
                   					<div class="btn btn-primary sub"   value="Search" onclick="getProductsList()">Submit</div>
							    </div>
                   			</div>
                   		</div> -->
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
                            <h4>Products Summary</h4>
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
                                		<th>Business Name</th><th>Product Categeory</th><th>Product Sub Categeory </th><th>Item Code</th><th>Item Description</th><th>Quantity</th>
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


  


<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<script type="text/javascript">


/* $(document).ready(function() {
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
}); */
var branches = ${branches_map};
 var lstOrders =${delivered_qty_list};
 createTableHeader(branches);
// console.log(lstOrders);

 if(lstOrders != ""){
 	showTableData(lstOrders,branches);
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
function createTableHeader(branch_map){
	//serviceUnitArray ={};
	//serviceUnitArray1 ={};
	var table=$('#tableId').html('');
	
	
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
	'<thead><tr style="background:#4e8ede; color:#fff;"><th colspan="3">Product</th>';
	$.each(branch_map,function(key, value) {
		var tempStr = '<th colspan="4" align="center" style="">'+value+'</th>';
		tableHead += tempStr;
	});
	var selected_val = $("#branchId").val();
	if(selected_val=="all"){
		tableHead += '<th colspan="4"  style="max-width:80px; min-width:80px;">Overall Orders</th>';
	}
	tableHead += '</tr><tr><th align="center">Category</th><th align="center">Subcategory</th><th align="center">Item Code</th>'; 
	$.each(branch_map,function(key, value) {
		var tempStr = '<th align="center"  style="max-width:80px; min-width:80px;">Ordered</th><th  style="max-width:90px; min-width:90px;">Delivered</th><th  style="max-width:80px; min-width:80px;">Nullified</th><th  style="max-width:80px; min-width:80px;">Pending</th>';
		tableHead += tempStr;
	});
	if(selected_val=="all"){
		tableHead += '<th align="center" style="max-width:80px; min-width:80px;">Ordered</th><th  style="max-width:90px; min-width:90px;">Delivered</th><th  style="max-width:80px; min-width:80px;">Nullified</th><th  style="max-width:100px; min-width:100px;">Pending</th>';
	}
	tableHead += '</tr></thead><tbody></tbody></table>';
	$("#tableId").html(tableHead);
	//if(isClick=='Yes') $('.datatables').dataTable();
}
function showTableData(prod_map,branch_map){
	/* var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
	'<thead><tr><th>key</th><th>value</th></tr>'+
	"</thead><tbody></tbody></table>"; 
$("#tableId").html(tableHead); */
	$.each(prod_map,function(key,value) {
		var total_ordered=0,total_delivered=0,total_nullified=0,total_pending=0;
		var tblRow ="<tr><td>" + key.split("##")[0] + "</td><td>" + key.split("##")[1] + "</td><td>" + key.split("##")[2] + "</td>";
		var branch_map = value;
		$.each(branch_map,function(key2,value2) {
			var quantities = value2.split(",");
			var pending_qty = parseInt(quantities[0]-(parseInt(quantities[1])+parseInt(quantities[2])));
			total_ordered += parseInt(quantities[0]);
			total_delivered += parseInt(quantities[1]);
			total_nullified += parseInt(quantities[2]);
			total_pending += pending_qty;
			var temp_td = "<td title='"+key2+"'>" + value2.split(",")[0] + "</td><td title='"+key2+"'>" + value2.split(",")[1] + "</td><td title='"+key2+"'>" + value2.split(",")[2] + "</td><td title='"+key2+"'>" + pending_qty + "</td>";
			tblRow += temp_td;
		});
		var selected_val = $("#branchId").val();
		if(selected_val=="all"){
			tblRow += "<td>" + total_ordered + "</td><td>" + total_delivered + "</td><td>" + total_nullified + "</td><td>" + total_pending + "</td>";
		}
		tblRow += "</tr>";
		
		$(tblRow).appendTo("#tableId table tbody");
	});
	//if(isClick=='Yes') $('.datatables').dataTable();
}
function getDealerOrdersItems(order_id){
	//event.preventDefault();
	
		$.ajax({
					type : "POST",
					url : "getItemsOfOrder.htm",
					data :"order_id="+order_id,
					 beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });
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
    	'<thead><tr><th>Business Name</th><th>Product Categeory</th><th>Product Sub Categeory </th><th>Item Code</th><th>Item Description</th><th>Ordered Quantity</th><th>Delivered Quantity</th><th>Pending Quantity</th><th colspan="3">Status</th></tr>'+
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
					text_field_str = "<td><input type='text'  maxlength ='3' class='mobile' id='qty"+orderObj.id+"' /></td>"
									+"<td><input type='text'  maxlength ='3' class='mobile' id='nullify_qty"+orderObj.id+"' value='0'/></td>"
									+"<td><input type='button'   value='Submit' onclick='saveDeliverableItemsData("+orderObj.id+")' /></td>";
				}
		}
		var tblRow ="<tr id='row"+orderObj.id+"'>"
			+ "<td title='"+orderObj.dealerName+"'>" + orderObj.dealerName + "</td>"
			+ "<td title='"+orderObj.categeory+"'>" + orderObj.categeory + "</td>"
			+ "<td title='"+orderObj.subCategeory+"'>" + orderObj.subCategeory + "</td>"
			+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode + "</td>"
			+ "<td title='"+orderObj.itemdescrption+"'>" + orderObj.itemdescrption + "</td>"
			+ "<td title='"+orderObj.quantity+"'>" + orderObj.quantity + "</td>"
			+ "<td title='"+orderObj.delivered_qty+"'>" + orderObj.delivered_qty + "</td>"
			//+ "<td title='"+orderObj.nullified_qty+"'>" + orderObj.nullified_qty + "</td>"
			+ "<td id='pending_qty"+orderObj.id+"' title='"+orderObj.pending_qty+"'>" + orderObj.pending_qty + "</td>"
			+ text_field_str
			//+ "<td>"+text_field_str+"</td>"
			//+ "<td><input type='button' id='deliverable_submit_btn' value='Submit' onclick='saveDeliverableItemsData("+orderObj.id+")' /></td>"
			+"</tr>";
		$(tblRow).appendTo("#modal_body tbody");
		
	});
	
	//$('#orderListModal').modal('show');
	//if(isClick=='Yes') $('.datatables').dataTable();
}
function displayHistory(response){
	//serviceUnitArray ={};
	serviceUnitArray1 ={};
	$('#history_modal_body').html('');
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>Business Name</th><th>Delivered Product Categeory</th><th>Delivered Product Sub Categeory </th><th>Delivered  Item Code</th><th>Delivered Item Description</th><th>Delivered  Quantity</th><th>Delivered On</th></tr>'+
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
					text_field_str = "<td><input type='text'  maxlength ='3' class='mobile' id='qty"+orderObj.id+"' /></td>"
									+"<td><input type='button'   value='Submit' onclick='saveDeliverableItemsData("+orderObj.id+")' /></td>";
				}
		}
		var tblRow ="<tr id='row"+orderObj.id+"'>"
			+ "<td title='"+orderObj.dealerName+"'>" + orderObj.dealerName + "</td>"
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
		
		$(".mobile").keydown(function (e) {
		    // Allow: backspace, delete, tab, escape, enter and .
		    if ($.inArray(e.keyCode, [8, 9, 27, 13, 110]) !== -1 ||
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
	var quantity = $("#qty"+objId).val().trim();
	var pending_qty = serviceUnitArray1[objId].pending_qty;
	var nullify_qty = $("#nullify_qty"+objId).val().trim();
	if(quantity==""){
		alert("Enter some quantity and click Submit");
		return false;
	}
	if(quantity>pending_qty){
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
            	 		alert("Data saved successfully");
            	 		serviceUnitArray1[objId].pending_qty = balance_qty;
            	 		$("#pending_qty"+objId).html(balance_qty);
            	 		if(balance_qty==0){
            	 			//$("#modal_body tbody ")
            	 			$('#row'+objId).find("td").last().remove();
            	 			$('#row'+objId).find("td").last().remove();
            	 			var new_td = '<td colspan="2" align="center">Completed</td>';
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

function getProductsList(){
	var branch_id = $("#branchId").val();
	$("#products_summary_form").attr("action","getProductsDeliveredQtyBranchWise.htm?branch_id="+branch_id);
	$("#products_summary_form").submit();
	/* $.ajax({
		type : "POST",
		url : "getProductsDeliveredQtyBranchWise.htm",
		data :"branch_id="+branch_id,
		 beforeSend : function() {
             $.blockUI({ message: 'Please wait' });
          },
		success: function (response) {
            	 $.unblockUI();
            	 var resJson=JSON.parse(response);
            	 var msg = resJson.message;
             if(typeof msg != "undefined"){
            	 	if(msg=="success"){
            	 		alert("Data saved successfully");
            	 		serviceUnitArray1[objId].pending_qty = balance_qty;
            	 		$("#pending_qty"+objId).html(balance_qty);
            	 		if(balance_qty==0){
            	 			//$("#modal_body tbody ")
            	 			$('#row'+objId).find("td").last().remove();
            	 			$('#row'+objId).find("td").last().remove();
            	 			var new_td = '<td colspan="2" align="center">Completed</td>';
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
	}); */
}
/* $(function(){
	var oTable = $('#example').dataTable( {
		"sScrollX": "100%",
		"sScrollXInner": "100%",
		"bScrollCollapse": true
	} );
	new $.fn.dataTable.FixedColumns( oTable );
} ); */
$(".dashboard").addClass("active");
</script>
