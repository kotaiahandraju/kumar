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
               <li>LPO </li>
            </ol>
            <div class="clearfix"></div>
        <div class="container" id="lpoMain">
            <div class="row" id="row1">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>LPO List</h4>
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
                                		<th>LPO Number</th><th>Supplier name</th><th>Remarks</th><th>Supplier Address</th>
                                		<th>Supplier Contact no</th><th>Supplier Email</th><th>Total Amount</th>
                                		<th>Paid Amount</th><th>Due Amount</th><th>Status</th>
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
                        <h4>Add LPOs</h4>
                        <div class="options"></div>
                    </div>
	                <form:form modelAttribute="lpoForm" id="formId" action="lpoSave" class="form-horizontal" method="post" >
<table><tr><td>                    
                    <div class="panel-body">
                    	<div class="row">
                    		<%-- <div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">LPO Number <span class="impColor">*</span></label>
                    				<div class="col-md-6">
								      	<form:input type="text" path="lponumber" class="form-control validate" placeholder="LPO Number"/>
								  	</div>
                    			</div>
                    		</div> --%>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Supplier Name <span class="impColor">*</span></label>
                    				<div class="col-md-6">
		                            	<form:input type="hidden" path="id"/>
								      	<form:input type="text" path="suppliername" class="form-control validate" placeholder="Supplier Name"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Supplier Address <span class="impColor">*</span></label>
                    				<div class="col-md-6"> 
		                            	<form:input type="text" path="supplieraddress" class="form-control validate" placeholder="Supplier Address"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Supplier Contact No. <span class="impColor">*</span></label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="suppliercontactno" class="form-control numericOnly validate" placeholder="Supplier Contact No."/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Supplier Email <span class="impColor">*</span></label>
                    				<div class="col-md-6">
								      	<form:input type="text" path="supplieremail" class="form-control validate" placeholder="Supplier Email"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">LPO Amount(AED) <span class="impColor">*</span></label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="amount"  class="form-control validate numericOnly" placeholder="LPO Amount(AED)"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Paid Amount(AED)</label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="paidamount" onkeyup="PaidCalculation(this.value)" class="form-control numericOnly" placeholder="Paid Amount(AED)"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Due Amount(AED)</label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="dueamount" class="form-control numericOnly" placeholder="Due Amount(AED)"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-8">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-3 control-label">Remarks</label>
                    				<div class="col-md-9">
		                            	<form:textarea path="remarks" class="form-control" placeholder="Remarks" rows="5"></form:textarea>
								  	</div>
                    			</div>
                    		</div>
                    	</div>
                    	<div class="col-md-12">
                    		<div class="form-group">
								<table class="notPrintMe">
									<tr>
										<td style="height: 20px;" class="hideme"> 
											<span class="addItemButton" onclick="addMoreRowsForDependent(this.form);">Add Item</span>
										</td>
									</tr>
								</table>
                    		</div>
                    	</div>
                    	<div class="col-md-12">
                    		<div class="form-group">
<table class="table table-bordered" id="dependent_table">
	<thead>
		<tr>
			<th style="width: 40px;"><span>Sno</span></th>
	        <th style="width: 200px"><span>Items</span></th>
	        <th style="width: 70px;"><span>Quantity</span></th>
	        <th><span>Price(AED)</span></th>
	        <th><span>Total Amount (AED)</span></th>
	        <th><span>Discount (AED)</span></th>
	        <th><span>Net Amount (AED)</span></th>
			<th style="width: 200px"><span>Manufacturing Date</span></th>
			<th style="width: 200px"><span>Expiry Date</span></th>
      </tr>
	</thead>
	<form:select path="item" id="item1" style="display:none;font-size: small;">
		<form:option value="" selected="selected" disabled="disabled">-- Select Item --</form:option>
		<form:options items="${items}"></form:options>
	</form:select>
    <tbody>
		<tr id="1" class="rowInc">
			<td></td>
			<td>
				<select name="item1" class="form-control validate" id="1item" style="width: 100%;font-size: small;" title="Select Product" onfocus="removeBorder(this.id),productRateFilter(this.id)" class="form-control">
					<option value="" selected="selected" disabled="disabled">-- Select Item --</option>
				</select>
			</td>
			<td><input name="unit" value="0" id="1unit" type="text" title="Unit" onkeydown="removeBorder(this.id);" class="form-control numericOnly" onkeyup="allcalculate(this.id)"/></td>
			<td><input name="rate" value="0.0" id="1rate" type="text" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)" class="form-control numericOnly"/></td>
			<td><input name="totalvalue" value="0.00" title="Total Value" id="1totalvalue" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
			<td><input name="discount" value="0.00" title="Discount" id="1discount" type="text" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)" class="form-control" /></td>
			<td><input name="taxable" value="0.00" title="Taxable Value" id="1taxable" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
			<td><input name="manufacturingdate" placeholder="Manufacturing Date" id="1manufacturingdate" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
			<td><input name="expirydate" placeholder="Expiry Date"  id="1expirydate" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="4"><h3 align="right"></h3></th>
			<th><span class="totalInvoiceValue"></span></th>
			<th><span class="totalDiscounts"></span></th>
			<th><span class="totalTaxableValue"></span></th>
		</tr>
	</tfoot>
    
</table>
                    		</div>
                    	</div>
                    </div>
					<div class="panel-footer hideme">
						<div class="row">
				      		<div class="col-sm-12">
				      			<div class="btn-toolbar pull-right">
					      			<input class="btn-primary btn" type="submit" id="submit1" value="Submit" />
					      			<input class="btn-danger btn cancel" type="reset" id="clearData" value="Reset" />
				      			</div>
				      		</div>
				    	</div>
				    </div>
</td>
</tr>
</table>				    
         			</form:form>				    
                </div>
            </div>
            
        </div>

        </div> <!-- container -->
<!--  -print Div -->
        
        
        <div class="container well" id="printDiv" style="display: none;">
       <div class="col-md-12 noPrint" style="padding: 5px;border-bottom: 2px solid;border-top: 2px solid;"  ><div class="col-md-4"><button class="printbtn btn-primary" onclick="PrintElem('#printDiv');">Print</button></div><div class="col-md-4"></div><div class="col-md-4" style="float:right;text-align: right;"><a style="cursor: pointer;float: right;color: red;" onclick="getBack()"><i class="fa fa-2x fa-close"></i></a></div>
</div><img src="../img/khaibarlogo.png" alt="KHAIBAR logo">
<br>
<br>
<div><h3 style="text-align:center;">LOCAL PURCHASE ORDER</h3></div>
	<table class="table table-bordered" align="center" style="min-width: 680px;min-height:200px" id="printTable">
	<thead> 
		<tr >
			<p><td colspan="2">Supplier : 	<span id="printSuplierName"></span></p>
				 <p style="width:250px"> <span id="printSuplieraddress" ></span></p>
				    </td>
				  <p><td colspan="3">LPO No. : <span id="printLpoNum"></span>, LPO Date :<span id="printLpoDate"> </span> </p>
			<p>This PO No. should appear on the invoice and all correspondence</td></p>
		</tr>
		
		
		<tr class="bordertopbottom">
			<th style="width:50px" class="bordertopbottom">S .No</th>
			<th style="width:550px" class="bordertopbottom">Description</th>
			<th style="width:50px" class="bordertopbottom">Qty</th>
		    <th style="width:130px" class="bordertopbottom">Unit Price (AED).</th>
		    <th style="width:150px" class="bordertopbottom">Total Amount (AED).</th>
		</tr>
		</thead>
		
		<tbody></tbody>
		<tfoot>
		<tr>
			<td style="padding-top: 300px">*Note*</td>
			<td style="padding-top: 300px">This is computer generated L.P.O. and does not require seal and signature.</td>
            <td></td>
            <td></td>
            <td></td>
		</tr>
		<tr class="bordertopbottom">
			<td colspan="4" id="numberToWords"> </td>
			<td id="printTotal"></td>
		</tr>
		</tfoot>
	</table>
	<div class="footer" id="printFooter" style="display: none;">
		<hr style="border-top: dotted 1px;" />
		<p style="text-align: center;"> P O BOX 14915, JURF – AJMAN, UAE |Email: admin@khaibargas.com|Website : www.khaibargas.com</p>
	</div>
</div>
<!-- end print div -->
 
<div id="dial1"></div>


<c:choose>
<c:when test="${empty param.lpoNum}">
   <script> var lpoNmberForPrint = "";</script>
</c:when>
<c:otherwise>
   <script> var lpoNmberForPrint = "${param.lpoNum}";</script>
</c:otherwise>
</c:choose>


<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<script type="text/javascript">

/* $(document).ready(function() {
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
}); */
var lstOrders =${allObjects};

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
// var serviceUnitArray ={};
// var serviceUnitArray1 ={};
var data = {};


function showTableData(response){
	serviceUnitArray ={};
	serviceUnitArray1 ={};
	var table=$('#tableId').html('');
	
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>LPO Number</th><th>Supplier name</th><th>Supplier Contact no</th><th>Supplier Email</th><th>Supplier Address</th><th>Total Amount</th><th>Paid Amount</th><th>Due Amount</th><th>Remarks</th><th>Status</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='lpoDelete("+ orderObj.id+ ",0)'><i class='fa fa-eye blue'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='lpoDelete("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash red'></i></a>"
		}
// 		alert(orderObj.lponumber);
		
		var edit = "<a class='edit editIt' id='edit"+orderObj.lponumber+"' onclick=viewDetails(this.id,1)><i style='color: orange;' class='fa fa-edit'></i></a>"
		var view = "<a class='view' id='"+orderObj.lponumber+"' onclick=viewDetails(this.id,0)><i class='fa fa-eye red'></i></a>"
		var printImage = "<a class='printlpo' id='print"+orderObj.lponumber+"' onclick=lpoPrint(this.id)><img src='../img/print1.jpg' alt='Paris' width='20' height='20'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		serviceUnitArray1[orderObj.lponumber] = orderObj;
		var tblRow ="<tr>"
			+ "<td id='"+orderObj.lponumber+"' style='text-align: center;cursor: pointer;color: red; text-decoration: underline;' onclick=viewDetails(this.id,0) title='"+orderObj.lponumber+"'>" + orderObj.lponumber + "</td>"
			+ "<td title='"+orderObj.suppliername+"'>" + orderObj.suppliername + "</td>"
			+ "<td title='"+orderObj.suppliercontactno+"'>" + orderObj.suppliercontactno + "</td>"
			+ "<td title='"+orderObj.supplieremail+"'>" + orderObj.supplieremail+ "</td>"
			+ "<td title='"+orderObj.supplieraddress+"'>" + orderObj.supplieraddress + "</td>"
			+ "<td title='"+orderObj.amount+"'>" + orderObj.amount + "</td>"
			+ "<td title='"+orderObj.paidamount+"'>" + orderObj.paidamount + "</td>"
			+ "<td title='"+orderObj.dueamount+"'>" + orderObj.dueamount + "</td>"
			+ "<td title='"+orderObj.remarks+"'>" + orderObj.remarks + "</td>"
			+ "<td title='"+orderObj.lpoStatus+"'>" + orderObj.lpoStatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + view + "&nbsp;&nbsp;" + edit + "&nbsp;&nbsp;" + deleterow + "&nbsp;&nbsp;"+printImage+"</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editLpo(id) {
	var inputs = $('input[type="text"]');
    inputs.removeAttr('placeholder');
    inputs.css('border','');
    inputs.addClass('default-class');
    inputs.css('color','black ');
	
	$("#id").val(id);
	$("#lponumber").val(serviceUnitArray[id].lponumber);
	$("#supplieraddress").val(serviceUnitArray[id].supplieraddress);
	$("#suppliercontactno").val(serviceUnitArray[id].suppliercontactno);
	$("#item").val(serviceUnitArray[id].item);
	$("#remarks").val(serviceUnitArray[id].remarks);
	$("#amount").val(serviceUnitArray[id].amount);
	$("#suppliername").val(serviceUnitArray[id].suppliername);
	$("#amount").val(serviceUnitArray[id].amount);
	$("#supplieremail").val(serviceUnitArray[id].supplieremail);
	$("#status").val(serviceUnitArray[id].status);
	$("#paidamount").val(serviceUnitArray[id].paidamount);
	$("#dueamount").val(serviceUnitArray[id].dueamount);
	
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function lpoDelete(id,status) {
	var checkstr=null;
	if(status == 0){
		 checkstr =  confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr =  confirm('Are you sure you want to Activate?');
	}
	if(checkstr == true){
		$.ajax({
					type : "POST",
					url : "lpoDelete.htm",
					data :"id="+id+"&status="+status,
					 beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });
			          },
					success: function (response) {
		                	 $.unblockUI();
		                 if(response != null ){
		                	 var resJson=JSON.parse(response);
		                	showTableData(resJson);
		                	tooltip();
		                	//window.location.reload();
		                	}
		                 window.location.reload();
		                 },
		             error: function (e) { 
		            	 $.unblockUI();
							console.log(e);
		             }
				});
	}
}

function dataClear(){
	
	
	$("#id").val('');
	$("#lponumber").val('');
	$("#item").val('');
	$("#remarks").val('');
	$("#amount").val('');
	$("#suppliername").val("");
	$("#suplieraddress").val("");
	$("#supliercontactno").val("");
	$("#amount").val("");
}
$(function() {
	$("#expiryDate1").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
});
function showexpiryDate(value){
	if(value=="1"){
		 $('#exporydatediv').show();
	}else{
		$('#exporydatediv').hide();
	}
}





var dependentRowCount = 1;
var validates = true;
var rowvalidate = false;

function addMoreRowsForDependent() {
	rowvalidate =false;
	var rowid =$('#dependent_table tbody tr:last').attr('id');
	console.log(rowid);
	    var number = parseInt(rowid.match(/[0-9]+/)[0], 10);
	    var item = $('#' + number + 'item').val();
		var qty = $('#'+number+'unit').val();
		var rate =  $('#' + number + 'rate').val();
	    
		 if(item == "" || item == null || item == "undefined" )
		{
			if(item == "" || item == null || item == "undefined")
			{
				$('#'+number+'item').css('color','red');
				$('#'+number+'item').css("border-color","#e73d4a");
				$('#'+number+'item').attr("placeholder","Enter Product Description");
				$('#'+number+'item').addClass('your-class');
// 				$('#'+number+'item').focus();
				return false;
			}
			
		} 
	dependentRowCount++;
	var dependentRow1 = '<tr class="rowInc" role="row" id="'+dependentRowCount+'">'
			+ '<td class="labelCss"></td>'
			+ '<td class="inputCss"><select title="Select Item" name="item1" style="width: 100%;font-size: small;" id="'
			+ dependentRowCount
			+ 'item" class="form-control validate" onchange="removeBorder(this.id),productRateFilter(this.id)"><option>Select</option></select></td>'
			+ '<td class="inputCss"><input title="Unit" name="unit" id="'
			+ dependentRowCount
			+ 'unit" type="text" value="0" class="form-control numericOnly" onkeyup="allcalculate(this.id)" onkeydown="removeBorder(this.id);"/></td>'
			+ '<td class="inputCss"><input name="rate" id="'
			+ dependentRowCount
			+ 'rate" type="text" value="0.0" class="form-control numericOnly" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)"/></td>'
// 			+ '<td class="inputCss"><select title="Select Rate" name="rate" style="width: 100%;font-size: small;" id="'
// 			+ dependentRowCount
// 			+ 'rate" class="form-control" onchange="removeBorder(this.id);"></select></td>'
			+ '<td class="labelCss"><input title="Total Value" name="totalvalue" id="'
			+ dependentRowCount
			+ 'totalvalue" value="0.00" type="text"  class="form-control" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ '<td class="inputCss"><input title="Discount" name="discount" id="'
			+ dependentRowCount
			+ 'discount" value="0.00" type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)"/></td>'
			+ '<td class="labelCss"><input title="Taxable Value" name="taxable" id="'
			+ dependentRowCount
			+ 'taxable" value="0.00" type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ '<td class="labelCss" ><input placeholder="Manufacturing Date" name="manufacturingdate" id="'
			+ dependentRowCount
			+ 'manufacturingdate"  type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ '<td class="labelCss" ><input placeholder="Expiry Date" name="expirydate" id="'
			+ dependentRowCount
			+ 'expirydate"  type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ "<th class='labelCss notPrintMe hideme' style='width: 10px;'><span><a href='javascript:void(0);' style='color: red;' onclick='removeDependentRow("
			+ dependentRowCount + ");'><i class='fa fa-trash' style='color: red;text-decoration: none;cursor: pointer;'></i></a></span></th>" +
			 + "</tr>";
	$(dependentRow1).appendTo("#dependent_table tbody");
	$("#"+dependentRowCount+"manufacturingdate").datepicker({
		dateFormat : "dd-M-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	$("#"+dependentRowCount+"expirydate").datepicker({
		dateFormat : "dd-M-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	var dummyItem1 = $('#item1').html();
	$('#'+dependentRowCount+'item').empty();
	$(dummyItem1).appendTo('#'+dependentRowCount+'item');
	
}

function removeDependentRow(dependentRowCount) {
	jQuery('#' + dependentRowCount).remove();
	priceCalculator();
	
	
}
function allcalculate(id){
	     var unit=0.00;
	     var rate=0.00;
	     var total1 =0.00;
	     var discount=0.00;

	
	var number = parseInt(id.match(/[0-9]+/)[0], 10);
	unit = $('#' + number + 'unit').val();
	rate = $('#' + number + 'rate').val();
	total1 =  unit * rate;

	taxable = $('#' + number + 'taxable').val();
	
	$('#' + number + 'totalvalue').val(total1.toFixed(2));
	
	total = $('#' + number + 'totalvalue').val();
	discount = $('#' + number + 'discount').val();
	var result = total - discount;
	$('#' + number + 'taxable').val(result.toFixed(2));
	
	
	
	priceCalculator();
}
function priceCalculator(){
	 var globelTotalValue = 0.00;
		var globalDiscount = 0.00;
		var globalTaxable = 0.00;
		var grandTotal = 0.00;
	var array = $.makeArray($('tbody tr[id]').map(function() {
		  return this.id;
		}));
		console.log(array);
	 for(var i=0;i<array.length;i++){
		 var discount = 0.00;
			var total = 0.00;
			var taxable = 0.00;
			
			
			
		total = $('#' + array[i] + 'totalvalue').val();
		globelTotalValue = globelTotalValue + parseFloat(total);
		
		 discount = $('#' + array[i] + 'discount').val();
		 if(discount == ""){
			 discount = 0.00;
		 }
		globalDiscount = globalDiscount + parseFloat(discount);
		
		taxable = $('#' + array[i] + 'taxable').val();
		globalTaxable = globalTaxable+parseFloat(taxable);
		
		
		
		$(".totalInvoiceValue").text(globelTotalValue.toFixed(2));
		$(".totalDiscounts").text(globalDiscount.toFixed(2));
		$(".totalTaxableValue").text(globalTaxable.toFixed(2));
		
		
	 }
	 grandTotal = globalTaxable;
	 $("#amount").val(grandTotal);
	 var paidamount =$("#paidamount").val();
	 if(paidamount.trim().length == 0){
		 $("#dueamount").val(grandTotal);
	 }else{
		 $("#dueamount").val(parseInt(grandTotal)-parseInt(paidamount));
	 }
// 	 alert(grandTotal);
	 $(".grandTotal").text(grandTotal.toFixed(2));
// 	 $(".roundOff").text(Math.round(grandTotal).toFixed(2));
}

function viewDetails(id,value){
	id = id.replace("edit", "");
$("#dependent_table tbody").find("tr:gt(0)").remove();
dependentRowCount = 1;
	var LpoId = serviceUnitArray1[id].id;
	editLpo(LpoId);
	$('#dial1').html('');
	var formData = new FormData();
    formData.append('lponumber', id);
	$.fn.makeMultipartRequest('POST', 'viewLPOdetails', false,
			formData, false, 'text', function(data){
		var lponumbertitle=null;
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		
			var j=1;
		$.each(alldata,	function(i, orderObj) {
			if(j == 1){
				
				$("#1item").val(orderObj.itemid);
				$("#1unit").val(orderObj.quantity);
				$("#1rate").val(orderObj.price);
				$("#1totalvalue").val(orderObj.totalprice); 
				$("#1discount").val(orderObj.discount);
				$("#1taxable").val(orderObj.grandtotal);
				$("#1manufacturingdate").val(orderObj.manufacturingdate);
				$("#1expirydate").val(orderObj.expirydate);
				if(value=="0"){
					$("#id").val(0);
					$(".hideme").hide();
				}else{
					$(".hideme").show();
				}
			}else{
				addMoreRowsForDependent();
				$("#"+j+"item").val(orderObj.itemid);
				$("#"+j+"unit").val(orderObj.quantity);

				$("#"+j+"rate").val(orderObj.price);
				$("#"+j+"totalvalue").val(orderObj.totalprice); 
				$("#"+j+"discount").val(orderObj.discount);
				$("#"+j+"taxable").val(orderObj.grandtotal);
				$("#"+j+"manufacturingdate").val(orderObj.manufacturingdate);
				$("#"+j+"expirydate").val(orderObj.expirydate);
				if(value=="0"){
					$(".hideme").hide();
				}else{
					$(".hideme").show();
				}
			}
			j++;
			
		});
		priceCalculator();
	});
}

function PaidCalculation(value){
	var amount = $("#amount").val();
	if(amount !="" && value !=""){
		$("#dueamount").val(parseInt(amount)-parseInt(value));
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
		
		$.fn.makeMultipartRequest('POST', 'inActiveLPO', false,
				formData, false, 'text', function(data) {
			var resJson=JSON.parse(data);
            showTableData(resJson);
            tooltip();
					console.log(resJson);
				});
}
	function lpoPrint(id){
	//alert(this.id);
	 var printId=id;
	 
	//window.location.href="lpoPrintHome";
	$("#lpoMain").hide();
	$("#printDiv").show();
var	id = printId.replace("print", "");

	var formData = new FormData();
    formData.append('lponumber', id);
	$.fn.makeMultipartRequest('POST', 'viewLPOdetails', false,
			formData, false, 'text', function(data){
		var lponumbertitle=null;
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		//alert(alldata);
		var j=1;
		var numberToWords="";
		$.each(alldata,function(i, orderObj) {
			
		var dependentRow1 = '<tr><td>'+j+'</td><td>'+orderObj.name+'</td><td>'+orderObj.quantity+'</td><td>'+orderObj.price+'</td><td>'+orderObj.grandtotal+'</td></tr>'
		  j++;
		$("#printTotal").text(orderObj.amount);
		//alert(convert_number(orderObj.amount));
		numberToWords=convert_number(parseInt(orderObj.amount));
		$("#printSuplierName").text(orderObj.suppliername);
		$("#printSuplieraddress").text(orderObj.supplieraddress);
		$("#printLpoNum").text(orderObj.lponumber);
		$("#printLpoDate").text(orderObj.lpoDate);
$(dependentRow1).appendTo("#printTable tbody");
		});
		
		$("#numberToWords").text("AED.  "+numberToWords);
	});
	
}


function convert_number(number)
{
   if ((number < 0) || (number > 999999999)) 
   { 
       return "NUMBER OUT OF RANGE!";
   }
   var Gn = Math.floor(number / 10000000);  / Crore / 
   number -= Gn * 10000000; 
   var kn = Math.floor(number / 100000);     / lakhs / 
   number -= kn * 100000; 
   var Hn = Math.floor(number / 1000);      / thousand / 
   number -= Hn * 1000; 
   var Dn = Math.floor(number / 100);       / Tens (deca) / 
   number = number % 100;               / Ones / 
   var tn= Math.floor(number / 10); 
   var one=Math.floor(number % 10); 
   var res = ""; 

   if (Gn>0) 
   { 
       res += (convert_number(Gn) + " CRORE"); 
   } 
   if (kn>0) 
   { 
           res += (((res=="") ? "" : " ") + 
           convert_number(kn) + " LAKH"); 
   } 
   if (Hn>0) 
   { 
       res += (((res=="") ? "" : " ") +
           convert_number(Hn) + " THOUSAND"); 
   } 

   if (Dn) 
   { 
       res += (((res=="") ? "" : " ") + 
           convert_number(Dn) + " HUNDRED"); 
   } 


   var ones = Array("", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX","SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN","FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN","NINETEEN"); 
var tens = Array("", "", "TWENTY", "THIRTY", "FOURTY", "FIFTY", "SIXTY","SEVENTY", "EIGHTY", "NINETY"); 

   if (tn>0 || one>0) 
   { 
       if (!(res=="")) 
       { 
           res += " AND "; 
       } 
       if (tn < 2) 
       { 
           res += ones[tn * 10 + one]; 
       } 
       else 
       { 

           res += tens[tn];
           if (one>0) 
           { 
               res += ("-" + ones[one]); 
           } 
       } 
   }

   if (res=="")
   { 
       res = "zero"; 
   } 
   return res;
}

function PrintElem(elem)
{
	$(".noPrint").hide();
	$(".printbtn").hide();
	 $("#printFooter").show();
    Popup($(elem).html());
    
}


function Popup(data)
{
	var mywindow = window.open('','new div');

    var is_chrome = Boolean(mywindow.chrome);
    var isPrinting = false;
    mywindow.document.write('<html><head><title>Lpo Details</title> <link rel="stylesheet" type="text/css" href="../assets/css/img.css"><link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css"></head><body>');
    mywindow.document.write(data);
   
    mywindow.document.write('</body></html>');
    mywindow.document.close(); // necessary for IE >= 10 and necessary before onload for chrome

$(".printbtn").show();
$(".noPrint").show();
$("#printFooter").hide();
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
	
	
	
   /* var mywindow = window.open('', 'new div');
    mywindow.document.write('<html><head><title>Donor Details</title></head><body>');
    mywindow.document.write(data);
    mywindow.document.write('</body></html>');
    mywindow.print();
    mywindow.close();
    $(".printbtn").show();*/
    return true;
}
if(lpoNmberForPrint!=""){
	lpoPrint(lpoNmberForPrint);
}
function getBack(){
	$("#lpoMain").show();
	$("#printDiv").hide();
	ChangeUrl('lpoNum', 'lpoHome?lpoNum=');

}

function ChangeUrl(page, url) {
    if (typeof (history.pushState) != "undefined") {
        var obj = { Page: page, Url: url };
        history.pushState(obj, obj.Page, obj.Url);
    } else {
        alert("Browser does not support HTML5.");
    }
}

$("#pageName").text("LPO Master");
$(".lpo").addClass("active");
</script>