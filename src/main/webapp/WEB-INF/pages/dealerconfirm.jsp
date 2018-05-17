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
.btn-danger {
border-radius:5px;
}
.fouser {
padding: 3px 14px 0px 11px;
    margin-left: 5px;
}
</style>



	<div class="clearfix"></div>
	<ol class="breadcrumb">
    	<li><a href="dashboard">Home</a></li>
		<li>Dealer Confirm</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Dealer Confirm  List</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Active List</label>
					<div class="table-responsive" id="tableId">
						<table class="table table-striped table-bordered datatables"
							id="example">
							<thead>
								<tr><th> Name</th><th>Shop Name</th><th>Address</th><th>city</th><th>Pin Code</th><th>GST Number</th><th>Phone Number</th><th>Email</th><th>Branch</th><th>Description</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				</div>
			</div>
		</div>
                    
	</div> <!-- container -->
<!-- 	model class -->
	<div class="container">
 <h2></h2>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Genarate Dealer login Id</h4>
        </div>
        <div class="modal-body">
       	 User Name:<input type="text" id="username" class="fouser" />
       	 <input type="hidden" id="userId"  />
		
        </div>
        <div class="modal-footer">
 	 <!-- Trigger the modal with a button -->
		  <button type="button" class="btn btn-primary "  onclick="genarateAuthDetails();">Submit</button>
  	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
      
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
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th> Name</th><th>Business Name</th><th>Address</th><th>city</th><th>Pin Code</th><th>GST Number</th><th>Shop Phone Number</th><th>Phone Number</th><th>Email</th><th>Branch</th><th>Description</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteDealer("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteDealer("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		if(orderObj.confirm == "1"){
			var confirm = "<a class='' >UsernameAssigned</i></a>"
		}else{  
			var confirm = "<a class='notAssigned' style='cursor:pointer; text-decoration:none; list-style:none;' onclick='dealerRegister("+ orderObj.id+ ")'>UsernameNotAssigned</a>"
		}
// 		var edit = "<a class='edit editIt' onclick='editEmpCreation("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td title='"+orderObj.businessName+"'>" + orderObj.businessName + "</td>"
			+ "<td title='"+orderObj.address+"'>" + orderObj.address + "</td>"
			+ "<td title='"+orderObj.city+"'>" + orderObj.city + "</td>"
			+ "<td title='"+orderObj.pincode+"'>" + orderObj.pincode + "</td>"
			+ "<td title='"+orderObj.gstno+"'>" + orderObj.gstno + "</td>"
			+ "<td title='"+orderObj.shop_phone+"'>" + orderObj.shop_phone + "</td>"
			+ "<td title='"+orderObj.phone_number+"'>" + orderObj.phone_number + "</td>"
			+ "<td title='"+orderObj.email+"'>" + orderObj.email + "</td>"
			+ "<td title='"+orderObj.branchname+"'>" + orderObj.branchname + "</td>"
			+ "<td title='"+orderObj.description+"'>" + orderObj.description + "</td>"
			
			+ "<td style='text-align: center;white-space: nowrap;'>" +confirm + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
		
	});
	if(isClick=='Yes') $('.datatables').dataTable();
	
}

var prodcutName='';

function editEmpCreation(id){
	$("#id").val(id);
	$("#branchId").val(serviceUnitArray[id].branchId);
	$("#name").val(serviceUnitArray[id].name);
	$("#username").val(serviceUnitArray[id].username);
	$("#password").val(serviceUnitArray[id].password);
	$("#roleId").val(serviceUnitArray[id].roleId);
	$("#email").val(serviceUnitArray[id].email);
	$("#phoneNumber").val(serviceUnitArray[id].phoneNumber);
	$("#status").val(serviceUnitArray[id].status);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteDealer(id,status){
	var checkstr=null;
	if(status == 0){
		 checkstr =  confirm('Are you sure you want to Deactivate?');
		 $('#inActive').prop('checked', false);
	}else{
		 checkstr =  confirm('Are you sure you want to Activate?');
		 $('#inActive').prop('checked', false);
	}
	if(checkstr == true){
		var formData = new FormData();
		formData.append('status', status);
		formData.append('id', id);
		
		$.fn.makeMultipartRequest('POST', 'deleteDealer', false,
				formData, false, 'text', function(data) {
			if(data != ""){
				var jsonobj = $.parseJSON(data);
				var alldata = jsonobj.allOrders1;
				console.log(jsonobj.allOrders1);
				showTableData(alldata);
				  tooltip();
	          
			}else{
// 				alert("Inactive List Empty");
				 showTableData("");
			}
		       // window.location.reload();
			
		});
	}
}

function dealerRegister(id) {
// 	alert("model"+id);
	$("#userId").val(id);
	
 	$("#myModal").modal();
 	
 	$("#username").val("");

}

function genarateAuthDetails() {
	
	var id=$("#userId").val();
	var username=$("#username").val().trim();
	if(username != ""){
		var formData = new FormData();
		formData.append('id', id);
		formData.append('username', username);
		
		$.fn.makeMultipartRequest('POST', 'authDetails', false,
				formData, false, 'text', function(data) {
			console.log(data);
			var jsonobj = $.parseJSON(data);
			var username_duplicate = jsonobj.duplicate;
			if(typeof username_duplicate != "undefined" && username_duplicate=="true"){
				alert("Username already exists. Please try another.");
				$("#myModal").modal("show");
				return false;
			}
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			showTableData(alldata);
			tooltip();
			$("#myModal").modal("hide");
				});
	}else{
		alert("Please enter user name")
		return false;
	}
	
}
function inactiveData() {
	
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
	}
		
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActiveDealer', false,
				formData, false, 'text', function(data) {
			if(data != ""){
				var jsonobj = $.parseJSON(data);
				var alldata = jsonobj.allOrders1;
				showTableData(alldata);
				  tooltip();
				  console.log(jsonobj);
	          
			}else{
				alert("Inactive List Empty");
			}
			
				});
	
}



$("#pageName").text("Dealer Confirm");
$(".dealerconfirm").addClass("active"); 
</script>