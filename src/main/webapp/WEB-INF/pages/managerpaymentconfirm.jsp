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
 [class*="panel-"].panel .panel-body {
    padding: 20px;
    border-left: 1px solid #dddddd;
    border-right: 1px solid #dddddd;
    border-bottom: none;
    background-color: #fff;
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
.btn-danger {
border-radius:5px;
}
#ui-datepicker-div{
/* 	width: auto !important; */
}
.editpay {

padding-left:0px;
padding-right:0px;
}
td, th {
    padding: 0;
    text-align: center;
}

</style>
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="dashboard">Home</a></li>
               <li>Confirm Payment</li>
            </ol>
            <div class="clearfix"></div>
        <div class="container-fluid" id="lpoMain">
            <div class="row" id="row1">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Confirm Payment</h4>
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
            
            <!-- 	model class -->
	<div class="container">
 <h2></h2>
  <!-- Modal -->
  <div class="modal fade" id="paymentStatusModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="col-md-12 editpay">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Edit Payment Status</h4>
                        <div class="options"></div>
                    </div>
	                <form >
                    <div class="panel-body">
                    	<div class="row">
                    		
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Payment Status<span class="impColor">*</span></label>
                    					<div class="col-md-1"></div>
                    				<div class="col-md-6">
		                            	<input type="hidden" id="id"/>
								      	<select id="confirm" class="form-control validate numericOnly">
								      	<option value="0">Not Yet Received</option>
								      	<option value="1">Received</option>
								      	</select>
								  	</div>
                    			</div>
                    		<div class="clearfix"></div></br>
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Comment</label>
                    				<div class="col-md-1"></div>
                    				<div class="col-md-6">
								      	<textarea id="comment" class="form-control validate" placeholder="Comment" style="padding:5px 24px;"></textarea>
								  	</div>
                    			</div>
                    		
                    		
                    	</div>
                    		
                    		</div>
                    	</div>
                    </div>
                     <div class="modal-footer">
 	 <!-- Trigger the modal with a button -->
		  <button type="button"  id="updatePaymentSubmit" class="btn btn-primary"  onclick="updatePaymentStatus();">Submit</button>
  	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
       
        </form>
        
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
    	'<thead><tr><th>Dealer Name</th><th>Amount</th><th>UTR Number</th><th> Payment Date </th><th>Payment Status</th><th>Add Comment </th><th> Confirmation Status </th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		
		 if(orderObj.confirm == "1"){
			var confirm = "<a  data-toggle='tooltip' title=' Received'  ><i class='fa fa-check' style='color:#29c10d'></i></a>"
		}else{  
			var confirm = "<a  data-toggle='tooltip' title='Not yet Received'  ><i class='fa fa-times' style='color:#e40d0d'></i></a>"
		} 
		 if(orderObj.confirm == "0" || orderObj.confirm == null){
			 var checkbox = "<input class='checkall' type='checkbox' name='checkboxName' onclick='paymentConfirm("+ orderObj.id+ ")'  id='"+orderObj.id+"'      />";
		 }else{
			 var checkbox="";
		 }
		 if(orderObj.comment == "" || orderObj.comment == null){
			 orderObj.comment= "--";
		 }
	var edit = "<a class='edit editIt btn btn-info' onclick='editPaymentStatus("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td title='"+orderObj.amount+"'>" + orderObj.amount + "</td>"
			+ "<td title='"+orderObj.qtr_number+"'>" + orderObj.qtr_number + "</td>"
			+ "<td title='"+orderObj.strpaymentDate+"'>" + orderObj.strpaymentDate + "</td>"
// 			+"<td>"+checkbox+"</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>"  + confirm + "</td>"
			+"<td title='"+orderObj.comment+"'>" + orderObj.comment + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

/* function paymentConfirm(id){
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
} */

function updatePaymentStatus(){
	var id =$("#id").val();
	var confirm=$("#confirm").val();
	var comment=$("#comment").val()
	var checkstr=null;
		// checkstr = confirm('Are you sure you want to Confirm payment?');
		 //if(checkstr == true){
			 var formData = new FormData();
				formData.append('confirm', confirm);
				formData.append('id', id);
				formData.append('comment',comment);
			 $.fn.makeMultipartRequest('POST', 'paymentConfirmStatus', false,formData, false, 'text', function(data) {
					var jsonobj = $.parseJSON(data);
					var alldata = jsonobj.allOrders1;
					console.log(jsonobj.allOrders1);
					showTableData(alldata);
					$("#paymentStatusModal").modal("hide");
					tooltip();
						});
		// }else{
		// $('#'+id).prop('checked', false);
		// }
} 

function editPaymentStatus(id) {
	
	$("#paymentStatusModal").modal();
	$("#id").val(id);
	$("#confirm").val(serviceUnitArray[id].confirm);
	
	
	$("#updatePaymentSubmit").val("Update");
	//$(window).scrollTop($('#moveTo').offset().top);
}


	
$("#pageName").text("Confirm Payment");
$(".dealerpaymentconfirm").addClass("active");
</script>