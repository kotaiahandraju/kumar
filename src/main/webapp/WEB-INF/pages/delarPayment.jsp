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
td, th {
    padding: 0;
    text-align: center;
}
#ui-datepicker-div{
/* 	width: auto !important; */
}

</style>
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="dashboard">Home</a></li>
               <li>Add Payment</li>
            </ol>
            <div class="clearfix"></div>
        <div class="container-fluid" id="lpoMain">
            <div class="row" id="row1">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Add Payment List</h4>
                            <div class="options">   
                                <a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
                            </div>
                        </div>
                        <div class="panel-body collapse in">
                       <!--  <input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label> -->
                        <div class="table-responsive" id="tableId" >
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
                                <thead>
                                	<tr>
                                		<th>Amount</th><th>UTR Number</th><th> Payment Date </th>
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
                        <h4>Add Payment</h4>
                        <div class="options"></div>
                    </div>
	                <form:form  modelAttribute="delarpayment"  action="adddelarpayment" class="form-horizontal" method="post" >
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Amount <span class="impColor">*</span></label>
                    				<div class="col-md-6">
		                            	<form:input type="hidden" path="id"/>
								      	<form:input type="text" path="amount" class="form-control validate numericOnly" placeholder="Amount"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">UTR Number <span class="impColor">*</span></label>
                    				<div class="col-md-6">
								      	<form:input type="text" path="qtrNumber" class="form-control validate" placeholder="UTR Number"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Payment Date <span class="impColor">*</span></label>
                    				<div class="col-md-6">
								      	<form:input type="text" path="strpaymentDate" class="form-control validate" placeholder="Payment Date " readonly="true" onfocus="removeBorder(this.id)" onclick="removeBorder(this.id)"/>
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
					      			<input class="btn-primary btn " type="submit" id="submit1" value="Submit" />
					      			<input class="btn-danger btn  cancel" type="reset" id="clearData" value="Reset" />
				      			</div>
				      		</div>
				    	</div>
				    </div>
         			</form:form>				    
                </div>
            </div>
            


<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<script type="text/javascript">

/* $(document).ready(function() {
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
}); */
$(function() {
	$("#strpaymentDate").datepicker({
		dateFormat : "dd-M-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
		 maxDate: 0
	});
});
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
var data = {};


function showTableData(response){
	serviceUnitArray ={};
	serviceUnitArray1 ={};
	var table=$('#tableId').html('');
	
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>Amount</th><th>UTR Number</th><th> Payment Date </th><th>Payment Status</th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		
		 if(orderObj.confirm == "1"){
			var deleterow = "<a data-toggle='tooltip' title=' Received' ><i class='fa fa-check' style='color:#29c10d'></i></a>"
		}else{  
			var deleterow = "<a data-toggle='tooltip' title='Not Yet Received' ><i class='fa fa-times' style='color:#e40d0d'></i></a>"
		} 
// 		var edit = "<a class='edit editIt' onclick='editProductType("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.amount+"'>" + orderObj.amount + "</td>"
			+ "<td title='"+orderObj.qtrNumber+"'>" + orderObj.qtrNumber + "</td>"
			+ "<td title='"+orderObj.strpaymentDate+"'>" + orderObj.strpaymentDate + "</td>"
			+ "<td  style='text-align: center;white-space: nowrap;'>"  + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}




	
$("#pageName").text("Dealer Payment");
$(".delarpayment").addClass("active");
</script>