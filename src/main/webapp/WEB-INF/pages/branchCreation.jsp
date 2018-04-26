<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="clearfix"></div>
	<ol class="breadcrumb">
    	<li><a href="#">Home</a></li>
		<li>Branch Creation</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Branch Creation List</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
					<div class="table-responsive" id="tableId">
						<table class="table table-striped table-bordered datatables"
							id="example">
							<thead>
								<tr>
									<th>Branch Name</th>
									<th>Employee Name</th>
									<th>Username</th>
									<th>Password</th>
									<th>Role</th>
									<th>Status</th>
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
						<h4>Branch Creation</h4>
					</div>
					<form:form modelAttribute="branchCreationForm" action="addBranchCreation" class="form-horizontal" method="Post" >
					<div class="panel-body">
						<div class="row">
						<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Branch Name<span class="impColor">*</span></label>
                    				<div class="col-md-6">
                    	<form:select path="branchname" value="" class="form-control validate">
								    	<form:option value="">-- Select Branch Name --</form:option>
								    	<form:options items="${branchName }"></form:options>
								    	</form:select>
								    	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Employee Name<span class="impColor">*</span></label>
                    				<div class="col-md-6">
                    	<form:select path="employeename" value="" class="form-control validate">
								    	<form:option value="">-- Select Employee Name --</form:option>
								    	<form:options items="${employeeName }"></form:options>
								    	</form:select>
								    	</div>
                    			</div>
                    		</div>
                    		
							<div class="col-md-6">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="username" class="col-md-4 control-label">Username <span class="impColor">*</span></label>
									<div class="col-md-7">
										<form:input path="userName" class="form-control validate" placeholder="Username"/>
									</div>
                    			</div>
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Password <span class="impColor">*</span></label>
                    				<div class="col-md-7">
                    				<form:input path="password" class="form-control validate" placeholder="Password"/>
                    				</div>
                    			</div>
                    			
							</div>
						</div>
                    </div>
                    <div class="panel-footer">
				      	<div class="row">
				      		<div class="col-sm-12">
				      			<div class="btn-toolbar text-center">
					      			<input class="btn-primary btn" type="submit" value="Submit" id="submit1"/>
					      			<input class="btn-danger btn cancel" type="reset" value="Reset" />
				      			</div>
				      		</div>
				    	</div>
					</div>
         			</form:form>				    
                </div>
            </div>
        </div>
	</div> <!-- container -->

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
    	'<thead><tr><th>Branch Name</th><th>Employee Name</th><th>UserName</th><th>Password</th><th>Status</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteBranchCreation("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteBranchCreation("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editBranchCreation("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.bName+"'>" + orderObj.bName + "</td>"
			+ "<td title='"+orderObj.empName+"'>" + orderObj.empName + "</td>"
			+ "<td title='"+orderObj.userName+"'>" + orderObj.userName + "</td>"
			+ "<td title='"+orderObj.password+"'>" + orderObj.password + "</td>"
			+ "<td title='"+orderObj.branchCreationStatus+"'>" + orderObj.branchCreationStatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
		
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

var prodcutName='';

function editBranchCreation(id){
	$("#id").val(id);
	$("#branchname").val(serviceUnitArray[id].branchname);
	$("#employeename").val(serviceUnitArray[id].employeename);
	$("#userName").val(serviceUnitArray[id].userName);
	$("#password").val(serviceUnitArray[id].password);
	$("#status").val(serviceUnitArray[id].status);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteBranchCreation(id,status){
	var checkstr=null;
	if(status == 0){
		 checkstr =  confirm('Are you sure you want to Deactivate?');
		 $('#inActive').prop('checked', false);
	}else{
		 checkstr =  confirm('Are you sure you want to Activate?');
		 $('#inActive').prop('checked', false);
	}
	if(checkstr == true){
		$.ajax({
			type : "POST",
			url : "branchCreationDelete.htm",
			data :"id="+id+"&status="+status,
			beforeSend : function() {
				$.blockUI({ message: 'Please wait' });
			},
			success: function (response) {
				if(response != null ){
					$.unblockUI();
		        	var resJson=JSON.parse(response);
		            showTableData(resJson.allOrders1);
		        	tooltip();
		            
		            //window.location.reload();
				}
		       // window.location.reload();
			},
			error: function (e) { 
		    	$.unblockUI();
				console.log(e);
			}
		});
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
		
		$.fn.makeMultipartRequest('POST', 'inActiveBranchCreation', false,
				formData, false, 'text', function(data) {
			if(data != ""){
				var resJson=JSON.parse(data);
	            showTableData(resJson);
				  tooltip();
	          
						console.log(resJson);
			}else{
				alert("Inactive List Empty");
			}
			
				});
	
}


function productNameFilter(productName){
	var productId = $("#producttype").val();
	if(productId.length !=0){
		$('#loadAjax').show();
	$.ajax({
		type : "POST",
		url : "getProductNameFilter.json",
		data : "productId=" + productId,
		dataType : "json",
		success : function(response) {
			 /* alert(response); */  
			var optionsForClass = "";
			optionsForClass = $("#productname").empty();
			optionsForClass.append(new Option("-- Choose Product --"));
			$.each(response, function(i, tests) {
				var id=tests.id;
				var productname=tests.productname;
				optionsForClass.append(new Option(productname, id));
			});
			$('#loadAjax').hide();
			if(productName!='') $('#productname').val(productName);
			$('#productName').trigger("chosen:updated");
		},
		error : function(e) {
			$('#loadAjax').hide();
		},
		statusCode : {
			406 : function() {
				$('#loadAjax').hide();
		
			}
		}
	});
	$('#loadAjax').hide();

	}
} 


$("#pageName").text("Branch Creation Master");
$(".branchcreation").addClass("active"); 
</script>