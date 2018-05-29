<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
 <link rel="stylesheet" type="text/css" href="../assets/css/img.css">
 <link href="../assets/css/datepicker1.css" rel="stylesheet" type="text/css" />
 <style>
 .table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td
 {
 border: 0px solid black !important;
 }
  @media (min-width: 768px) {
.modal-dialog {
    width: 957px;
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
.sub {
width:100px;
}
.form-horizontal .control-label {
padding-top:2px;
}
.lbl {
padding-top:8px;
}

</style>
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="#">Home</a></li>
               <li>My Orders </li>
            </ol>
            <div class="clearfix"></div>
        <div class="container-fluid" id="lpoMain">
        
        
          <div class="row" id="moveTo">
            <div class="col-md-12 col-sm-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Select Status</h4>
                        <div class="options"></div>
                    </div>
	                <form:form  modelAttribute="orderLstForm"   class="form-horizontal" method="post" >
                    <div class="panel-body">
                    	<div class="row">
                    	<div class="col-md-3">
                   			<div class="form-group">
                   				<label for="focusedinput" class="col-md-4 control-label">From Date: </label>
                   				<div class="col-md-6">
                   					<input type="text" id="from_date" value="" />
							    </div>
                   			</div>
                   		</div>
                   		<div class="col-md-3">
                   			<div class="form-group">
                   				<label for="focusedinput" class="col-md-3 control-label">To Date: </label>
                   				<div class="col-md-6">
                   					<input type="text" id="to_date" value="" />
							    </div>
                   			</div>
                   		</div>
                   		<div class="col-md-4">
                   			<div class="form-group">
                   				<label for="focusedinput" class="col-md-2 control-label" style="padding-top:8px;">Branch: </label>
                   				<div class="col-md-6">
                   					<form:select path="branchId" class="form-control validate" >
                   					<form:option value="">--- Select Branch ---</form:option>
							    	<form:option value="all">All</form:option>
							    	<form:options items="${branches_list}" itemValue="id" itemLabel="branchname"/>
							    	</form:select>
							    	</div>
                   			</div>
                   		</div>
                   		<div class="col-md-2">
                   			<div class="form-group">
                   				<div class=" ">
                   					<input class="btn btn-primary sub"   value="Submit" onclick="getOrdersList()" />
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
                        <!-- <input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label> -->
                        <div class="table-responsive" id="tableId" >
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
                                <thead>
                                	<tr>
                                		<th>Dealer Name</th><th>Product Categeory</th><th>Product Sub Categeory </th><th>Item Code</th><th>Item Description</th><th>Quantity</th>
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
            


<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<script type="text/javascript">

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
	$("#from_date").datepicker({
	    dateFormat: "dd-M-yy",
	    changeDate : true,
		changeMonth : true,
		changeYear : true
//	 	maxDate :0,
		//yearRange: '1964:' + ss,
		 //defaultDate: '01-January-1964'
	});
	$("#to_date").datepicker({
	    dateFormat: "dd-M-yy",
	    changeDate : true,
		changeMonth : true,
		changeYear : true
//	 	maxDate :0,
		//yearRange: '1964:' + ss,
		 //defaultDate: '01-January-1964'
	});
});

var damageId = 0;
// var serviceUnitArray ={};
// var serviceUnitArray1 ={};
var data = {};


function showTableData(response){
	var list_type = "${list_type}";
	serviceUnitArray ={};
	//serviceUnitArray1 ={};
	var table=$('#tableId').html('');
	
	var protectType = null;
	var temp_td = '';
	if(list_type=="delivered"){
		temp_td = '<th>Delivered On</th>';
	}
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>Ordered Date </th><th>Order ID</th><th>Firm Name</th><th>Branch Name</th><th>Total Items</th><th>Delivery Status</th>'+temp_td+'</tr>'+
    	"</thead><tbody></tbody></table>"; 
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		temp_td = '';
		if(list_type=="delivered"){
			temp_td = "<td title='"+orderObj.delivered_on+"'>" + orderObj.delivered_on + "</td>";
		}
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			//+ "<td title='"+orderObj.dealerName+"'>" + orderObj.dealerName + "</td>"
			+ "<td title='"+orderObj.created_on+"'>" + orderObj.created_on + "</td>"
			+ "<td title='"+orderObj.orderId+"'>" + orderObj.orderId + "</td>"
			+ "<td title='"+orderObj.businessName+"'>" + orderObj.businessName + "</td>"
			+ "<td title='"+orderObj.branch_name+"'>" + orderObj.branch_name + "</td>"
			+ "<td title='"+orderObj.total_quantity+"'>" + orderObj.total_quantity + "</td>"
		/* 	+ "<td title='"+orderObj.dealerName+"'>" + orderObj.dealerName + "</td>" */
			+ "<td title='"+orderObj.completed_status+"'>" + orderObj.completed_status + "</td>"
			+temp_td
			//+ '<td><a href="#" onclick="getDealerOrdersItems(\''+orderObj.orderId+'\');">View Order</a></td>'
			//+ '<td><a href="#" onclick="getDeliveredItemsHistory(\''+orderObj.orderId+'\');">View History</a></td>'
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function getOrdersList() {
	var list_type = "${list_type}";
	var from_date = $("#from_date").val();
	var to_date = $("#to_date").val();
	var branch_id=$("#branchId").val();
		$.ajax({
					type : "POST",
					url : "reportAllOrders.htm",
					data :"from_date="+from_date+"&to_date="+to_date+"&branch_id="+branch_id+"&list_type="+list_type,
					 beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });
			          },
					success: function (response) {
		                	 $.unblockUI();
		                 if(response != null ){
		                	 var resJson=JSON.parse(response);
		                	showTableData(resJson.all_orders);
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




var listtype = "${list_type}";
if(listtype=="delivered"){
	$("#pageName").text("Delivered Orders");
	$(".deliveredOrders").addClass("active");
}else{
	$("#pageName").text("All Orders");
	$(".allOrders").addClass("active");
}
</script>
