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

</style>









<div class="clearfix"></div>
<ol class="breadcrumb">
	<li><a href="dashboard">Home</a></li>
	<li>Products List</li>
</ol>
<div class="clearfix"></div>
<div class="container-fluid" id="lpoMain">
	<div class="row" id="row1">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Products List</h4>
					<div class="options">
						<a href="javascript:;" class="panel-collapse"><i
							class="fa fa-chevron-down"></i></a>
					</div>
				</div>
				<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input"
						onclick="inactiveData();" id="inActive"> <label
						class="form-check-label">Show Inactive List</label>
					<div class="table-responsive" id="tableId">
						<table class="table table-striped table-bordered datatables"
							id="example">
							<thead>
								<tr>
									<th>Serial No</th>
									<th>Item Code</th>
									<th>Description</th>
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
					<h4>Add Product</h4>
				</div>
				<form:form modelAttribute="itemsForm" action="addItems"
					class="form-horizontal" method="Post">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Product
										Category <span class="impColor">*</span>
									</label>
									<div class="col-md-7">
										<form:select path="producttype" value=""
											class="form-control validate"
											onchange="productNameFilter('');">
											<form:option value="">-- Select Product Category --</form:option>
											<form:options items="${productType }"></form:options>
										</form:select>
									</div>
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Product
										SubCategory <span class="impColor">*</span>
									</label>
									<div class="col-md-7">
										<form:select path="productname" value=""
											class="form-control validate"
											onchange="removeBorder(this.id)">
											<form:option value="">-- Select Product SubCategory --</form:option>
											<%-- 								    	<form:options items="${productName }"></form:options> --%>
										</form:select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<form:hidden path="id" />
									<label for="focusedinput" class="col-md-4 control-label">Serial
										Number <span class="impColor">*</span>
									</label>
									<div class="col-md-7">
										<form:input path="serialno" class="form-control validate"
											placeholder="Serial Number" />
									</div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Item
										Code <span class="impColor">*</span>
									</label>
									<div class="col-md-7">
										<form:input path="itemcode" class="form-control validate"
											placeholder="Item Code" />
									</div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Description<span
										class="impColor">*</span></label>
									<div class="col-md-7">
										<form:textarea path="itemdescrption"
											class="form-control validate" placeholder="Description" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-12">
								<div class="btn-toolbar text-center">
									<input class="btn-primary btn" type="submit" value="Submit"
										id="submit1" /> <input class="btn-danger btn cancel"
										type="reset" value="Reset" />
								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<!-- container -->

<script type="text/javascript">
	var listOrders1 = ${allOrders1};

	console.log(listOrders1);
	if (listOrders1 != "") {
		showTableData(listOrders1);
	}

	var damageId = 0;
	// var serviceUnitArray ={};
	var data = {};

	function showTableData(response) {
		var table = $('#tableId').html('');
		serviceUnitArray = {};
		var protectType = null;
		var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'
				+ '<thead><tr><th>Serial Number</th><th>Item Code</th><th>Description</th><th>Product Category</th><th>Product Subcategory</th><th>Status</th><th></th></tr>'
				+ "</thead><tbody></tbody></table>";
		$("#tableId").html(tableHead);
		$.each(response, function(i, orderObj) {

			if (orderObj.status == "1") {
				var deleterow = "<a class='deactivate' onclick='deleteItem("
						+ orderObj.id + ",0)'><i class='fa fa-eye'></i></a>"
			} else {
				var deleterow = "<a class='activate' onclick='deleteItem("
						+ orderObj.id
						+ ",1)'><i class='fa fa-eye-slash'></i></a>"
			}
			var edit = "<a class='edit editIt' onclick='editItem("
					+ orderObj.id + ")'><i class='fa fa-edit'></i></a>"
			serviceUnitArray[orderObj.id] = orderObj;
			var tblRow = "<tr>" + "<td title='"+orderObj.serialno+"'>"
					+ orderObj.serialno + "</td>"
					+ "<td title='"+orderObj.itemcode+"'>" + orderObj.itemcode
					+ "</td>" + "<td title='"+orderObj.itemdescrption+"'>"
					+ orderObj.itemdescrption + "</td>"
					+ "<td title='"+orderObj.productTypeName+"'>"
					+ orderObj.productTypeName + "</td>"
					+ "<td title='"+orderObj.productIdName+"'>"
					+ orderObj.productIdName + "</td>"
					+ "<td title='"+orderObj.itemsStatus+"'>"
					+ orderObj.itemsStatus + "</td>"
					+ "<td style='text-align: center;white-space: nowrap;'>"
					+ edit + "&nbsp;&nbsp;" + deleterow + "</td>" + "</tr>";
			$(tblRow).appendTo("#tableId table tbody");

		});
	
		if (isClick == 'Yes')
			$('.datatables').dataTable();
		
	}

	var prodcutName = '';

	function editItem(id) {
		$("#id").val(id);
		$("#producttype").val(serviceUnitArray[id].productId);
		var productName = serviceUnitArray[id].productname;
		productNameFilter(productName);
		$("#itemcode").val(serviceUnitArray[id].itemcode);
		$("#serialno").val(serviceUnitArray[id].serialno);
		$("#itemdescrption").val(serviceUnitArray[id].itemdescrption);
		$("#itemsStatus").val(serviceUnitArray[id].itemsStatus);
		$("#status").val(serviceUnitArray[id].status);
		$("#submit1").val("Update");
		$(window).scrollTop($('#moveTo').offset().top);
	}

	function deleteItem(id, status) {
		var checkstr = null;
		if (status == 0) {
			checkstr = confirm('Are you sure you want to Deactivate?');
			$('#inActive').prop('checked', false);
		} else {
			checkstr = confirm('Are you sure you want to Activate?');
			$('#inActive').prop('checked', false);
		}
		if (checkstr == true) {
			$.ajax({
				type : "POST",
				url : "itemDelete.htm",
				data : "id=" + id + "&status=" + status,
				beforeSend : function() {
					$.blockUI({
						message : 'Please wait'
					});
				},
				success : function(response) {
					if (response != null) {
						$.unblockUI();
						var resJson = JSON.parse(response);
						showTableData(resJson.allOrders1);
						tooltip();

						//window.location.reload();
					}
					// window.location.reload();
				},
				error : function(e) {
					$.unblockUI();
					console.log(e);
				}
			});
		}
	}
	function inactiveData() {

		var status = "0";
		if ($('#inActive').is(":checked") == true) {
			status = "0";
		} else {
			status = "1";
		}

		var formData = new FormData();
		formData.append('status', status);

		$.fn.makeMultipartRequest('POST', 'inActiveItem', false, formData,
				false, 'text', function(data) {
					if (data != "") {
						var resJson = JSON.parse(data);
						showTableData(resJson);
						tooltip();

						console.log(resJson);
					} else {
						alert("Inactive List Empty");
					}

				});

	}

	function productNameFilter(productName) {
		var productId = $("#producttype").val();
		if (productId.length != 0) {
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
						var id = tests.id;
						var productname = tests.productname;
						optionsForClass.append(new Option(productname, id));
					});
					$('#loadAjax').hide();
					if (productName != '')
						$('#productname').val(productName);
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

	$("#pageName").text("Product List Master");
	$(".items").addClass("active");
</script>