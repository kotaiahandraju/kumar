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

</style>
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="#">Home</a></li>
               <li>Payment Status</li>
            </ol>
            <div class="clearfix"></div>
        <div class="container" id="lpoMain">
            <div class="row" id="row1">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Payment Status</h4>
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
    	'<thead><tr><th>Dealer Name</th><th>Amount</th><th>UTR Number</th><th> Payment Date </th><th></th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		
		 if(orderObj.confirm == "1"){
			var deleterow = "<a  ><i class='fa fa-check' style='color:#29c10d'></i></a>"
		}else{  
			var deleterow = "<a  ><i class='fa fa-times' style='color:#e40d0d'></i></a>"
		} 
		 if(orderObj.confirm == "0" || orderObj.confirm == null){
			 var checkbox = "<input class='checkall' type='checkbox' name='checkboxName' onclick='paymentConfirm("+ orderObj.empId+ ")'  id='"+orderObj.id+"'      />";
		 }else{
			 var checkbox="";
		 }
// 		var edit = "<a class='edit editIt' onclick='editProductType("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td title='"+orderObj.amount+"'>" + orderObj.amount + "</td>"
			+ "<td title='"+orderObj.qtr_number+"'>" + orderObj.qtr_number + "</td>"
			+ "<td title='"+orderObj.strpaymentDate+"'>" + orderObj.strpaymentDate + "</td>"
			+"<td>"+checkbox+"</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>"  + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function paymentConfirm(id){
	var checkstr=null;
		 checkstr = confirm('Are you sure you want to Confirm payment?');
		 if(checkstr == true){
			 var formData = new FormData();
				formData.append('confirm', 1);
				formData.append('id', id);
			 $.fn.makeMultipartRequest('POST', 'paymentConfirmStatus', false,formData, false, 'text', function(data) {
					var jsonobj = $.parseJSON(data);
					var alldata = jsonobj.allOrders1;
					console.log(jsonobj.allOrders1);
					showTableData(alldata);
					tooltip();
						});
		 }else{
		 $('#'+id).prop('checked', false);
		 }
}

	
$("#pageName").text("Payment Status");
$(".dealerpaymentconfirm").addClass("active");
</script>