<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
 <style>
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
</style>
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="#">Home</a></li>
               <li>LPO </li>
            </ol>
            <div class="clearfix"></div>
        <div class="container">
            <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>LPO List</h4>
                            <div class="options">   
                                <a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
                            </div>
                        </div>
                        <div class="panel-body collapse in">
                        <div class="table-responsive" id="tableId" >
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
                                <thead>
                                	<tr><th>LPO Number</th><th>Supplier name</th><th>Remarks</th><th>Supplier Address</th><th>Supplier Contact no</th><th>Supplier Email</th><th>Amount</th><th>Status</th></tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                         </div>
                        </div>
                    </div>
                </div>
            </div>
                    
            <div class="row" id="moveTo">
            <div class="col-md-10 col-md-offset-1 col-sm-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Add LPOs</h4>
                        <div class="options"></div>
                    </div>
	                <form:form modelAttribute="lpoForm" id="formId" action="lpoSave" class="form-horizontal" method="post" >
<table><tr><td>                    
                    <div class="panel-body">
<!--                     	<div class="row"> -->
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">LPO Number</label>
                    				<div class="col-md-6">
		                            	<form:input type="hidden" path="id"/>
								      	<form:input type="text" path="lponumber"  class="form-control validate" placeholder="LPO Number"/>
								  	</div>
                    			</div>
                    		</div>
                    		
                    	<!-- </div>
                    	<div class="row"> -->
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Supplier Name</label>
                    				<div class="col-md-6">
								      	<form:input type="text" path="suppliername"  class="form-control validate" placeholder="Supplier name"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Supplier Address</label>
                    				<div class="col-md-6"> 
		                            	<form:input type="text" path="supplieraddress"   class="form-control validate" placeholder="Supplier address"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Supplier Contact no</label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="suppliercontactno"   class="form-control validate" placeholder="Supplier contact no"/>
								  	</div>
                    			</div>
                    		</div>
                    	<!-- </div>
                    	<div class="row"> -->
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Supplier Email</label>
                    				<div class="col-md-6">
								      	<form:input type="text" path="supplieremail" class="form-control validate" placeholder="Supplier email"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">LPO Amount</label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="amount"  class="form-control validate numericOnly" placeholder=" Lpo Amount"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Paid Amount</label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="paidamount" onkeyup="PaidCalculation(this.value)"  class="form-control validate numericOnly" placeholder="Paid Amount"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Due Amount</label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="dueamount"  class="form-control  numericOnly" placeholder="Due Amount"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Remarks</label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="remarks"  class="form-control validate" placeholder="Remarks"/>
								  	</div>
                    			</div>
                    		</div>
                    		
                    		<%-- <div class="col-md-4">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-6 control-label">Made In</label>
                    				<div class="col-md-6">
		                            	<form:input  path="madein" class="form-control validate onlyCharacters" placeholder="Made in"/>
								  	</div>
                    			</div>
                    		</div> --%>
                    	</div>
                    	<!-- </div>
                    </div> -->
                    
                  <br><br> 
				    
<table class="notPrintMe">
 <tr>
 <td style="height: 20px;" class="hideme"> 
  <span class="hideme" onclick="addMoreRowsForDependent(this.form);" style="cursor: pointer;font-size: small;background: green;color: white;padding: 3px 10px 3px 10px;">
	Add Item
</span>
</td>
</tr>
</table>
				    
				    <table class="inventory" id="dependent_table">
    <thead>
      <tr>
        <th rowspan="2" ><span>Sl. No</span></th>
        <th rowspan="2" style="width:200px"><span >Items</span></th>
        <th rowspan="2"><span>Quantity</span></th>
        <th rowspan="2"><span>Price</span></th>
        <th rowspan="2"><span>Total Price</span></th>
        <th rowspan="2"><span>Disc</span></th>
        <th rowspan="2"><span>Total value</span></th>
         <th rowspan="2"><span>Manufacturing Date</span></th>
         <th rowspan="2"><span>Expiry Date</span></th>
      </tr>
    </thead>
 <form:select path="item" id="item1" style="display:none;font-size: small;">
	<form:option value="" selected="selected" disabled="disabled">-- Select Client --</form:option>
	<form:options items="${items}"></form:options>
</form:select>
<%-- <form:select path="cgst" id="cgst" style="display:none;font-size: small;">
	<form:option value="0.00" selected="selected" disabled="disabled">0.00</form:option>
	<form:options items="${cgst}"></form:options>
</form:select>
<form:select path="prdescription" id="prdescription" style="display:none;font-size: small;">
	<form:option value="" selected="selected" disabled="disabled">-- Select Product --</form:option>
	<form:options items="${prdescription}"></form:options>
</form:select>
<form:select path="prate" id="prate" style="display:none;font-size: small;">
	<form:option value="0.00" selected="selected" disabled="disabled">0.00</form:option>
	<form:options items="${prate}"></form:options>
</form:select> --%>
    <tbody>
		<tr id="1" class="rowInc">
			<td></td>
<!-- 			<td><input name="item" id="1item" type="text" onkeydown="removeBorder(this.id);" class="form-control " /></td> -->
			<td>
				<select name="item1" id="1item" style="width: 100%;font-size: small;" title="Select Product" onchange="removeBorder(this.id),productRateFilter(this.id)" class="form-control">
					<option value="" selected="selected" disabled="disabled">-- Select Item --</option>
				</select>
			</td>
			<td><input name="unit" value="0" id="1unit" type="text" title="Unit" onkeydown="removeBorder(this.id);" class="form-control numericOnly" onkeyup="allcalculate(this.id)"/></td>
			<td><input name="rate" value="0.0" id="1rate" type="text" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)" class="form-control numericOnly"/></td>
			<td><input name="totalvalue" value="0.00" title="Total Value" id="1totalvalue" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
			<td><input name="discount" value="0.00" title="Discount" id="1discount" type="text" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)" class="form-control" /></td>
			<td><input name="taxable" value="0.00" title="Taxable Value" id="1taxable" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
			<td><input name="manufacturingdate"  title="Taxable Value" id="1manufacturingdate" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
			<td><input name="expirydate"   id="1expirydate" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
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
  
  
  <!-- <table class="balance">
    <tr>
      <th><span>Total Invoice value</span></th>
      <td><span class="totalInvoiceValue"></span></td>
    </tr>
    <tr>
      <th><span>Total Discounts</span></th>
      <td><span class="totalDiscounts"></span></td>
    </tr>
    <tr>
      <th><span>Total Taxable value</span></th>
      <td><span class="totalTaxableValue"></span></td>
    </tr>
    <tr>
      <th><span>Grand Total</span></th>
      <td><span class="grandTotal"></span></td>
    </tr>
    <tr>
      <th><span>Round Off</span></th>
      <td><span class="roundOff"></span></td>
    </tr>
  </table> -->
				     <div class="panel-footer">
				      	<div class="row">
				      		<div class="col-sm-12">
				      			<div class="btn-toolbar pull-right">
					      			<input class="btn-primary btn" type="submit" id="submit1" value="Submit" />
					      			<input class="btn-danger btn" type="reset" id="clearData" onclick="dataClear();" value="Reset" />
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
 
<div id="dial1"></div>
<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<script type="text/javascript">

$(document).ready(function() {
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
});
var lstOrders =${allObjects};

console.log(lstOrders);
$(document).ready(function(){
	showTableData(lstOrders);
});
$(function() {
// 	var listOrders=JSON.parse(lstOrders);
	
	
	var dummyItems = $("#item1").html();
	$("#1item").empty();
	$(dummyItems).appendTo("#1item");
	
});


</script>


<script>
$(function() {
	$("#1expirydate").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	$("#1manufacturingdate").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
});
var damageId = 0;
var serviceUnitArray ={};
var serviceUnitArray1 ={};
var data = {};


function showTableData(response){
	
	var table=$('#tableId').html('');
	
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>LPO Number</th><th>Supplier name</th><th>Remarks</th><th>Supplier Address</th><th>Supplier Contact no</th><th>Supplier Email</th><th>Amount</th><th>Status</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a data-toggle='tooltip' title='Deactivate' onclick='lpoDelete("+ orderObj.id+ ",0)'><i class='fa fa-bell green'></i></a>"
		}else{  
			var deleterow = "<a data-toggle='tooltip' title='Activate' onclick='lpoDelete("+ orderObj.id+ ",1)'><i class='fa fa-bell-o red'></i></a>"
		}
// 		alert(orderObj.lponumber);
		
		var edit = "<a id='edit"+orderObj.lponumber+"' data-toggle='tooltip' title='Edit'  onclick=viewDetails(this.id,1)><i class='fa fa-pencil green'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		serviceUnitArray1[orderObj.lponumber] = orderObj;
		var tblRow ="<tr>"
			+ "<td id='"+orderObj.lponumber+"' style='text-align: center;cursor: pointer;color: red; text-decoration: underline;' onclick=viewDetails(this.id,0) title='"+orderObj.lponumber+"'>" + orderObj.lponumber + "</td>"
						+ "<td title='"+orderObj.suppliername+"'>" + orderObj.suppliername + "</td>"
						+ "<td title='"+orderObj.remarks+"'>" + orderObj.remarks + "</td>"
						+ "<td title='"+orderObj.suppliercontactno+"'>" + orderObj.suppliercontactno + "</td>"
						+ "<td title='"+orderObj.supplieremail+"'>" + orderObj.supplieremail+ "</td>"
						+ "<td title='"+orderObj.supplieraddress+"'>" + orderObj.supplieraddress + "</td>"
						+ "<td title='"+orderObj.amount+"'>" + orderObj.amount + "</td>"
						+ "<td title='"+orderObj.lpoStatus+"'>" + orderObj.lpoStatus + "</td>"
						+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;|&nbsp;" + deleterow + "</td>"
						
						+"</tr>";
				$(tblRow).appendTo("#tableId table tbody");
			});
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
		 checkstr =  confirm('Are you sure you want to Deactivate this?');
	}else{
		 checkstr =  confirm('Are you sure you want to Activate this?');
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
		                	 //var resJson=JSON.parse(response);
		                	//showTableData(resJson);
		                	//alert("Delete Sucessfully");
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
				$('#'+number+'item').focus();
				return false;
			}
			
		} 
	dependentRowCount++;
	var dependentRow1 = '<tr class="rowInc" role="row" id="'+dependentRowCount+'">'
			+ '<td class="labelCss"></td>'
			+ '<td class="inputCss"><select title="Select Item" name="item1" style="width: 100%;font-size: small;" id="'
			+ dependentRowCount
			+ 'item" class="form-control" onchange="removeBorder(this.id),productRateFilter(this.id)"><option>Select</option></select></td>'
			+ '<td class="inputCss"><input title="Unit" name="unit" id="'
			+ dependentRowCount
			+ 'unit" type="text" value="0" class="form-control numericOnly" onkeyup="allcalculate(this.id)" onkeydown="removeBorder(this.id);"/></td>'
			+ '<td class="inputCss"><input name="rate" id="'
			+ dependentRowCount
			+ 'rate" type="text" value="0.0" class="form-control numericOnly" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)"/></td>'
			+ '<td class="labelCss"><input title="Total Value" name="totalvalue" id="'
			+ dependentRowCount
			+ 'totalvalue" value="0.00" type="text"  class="form-control" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ '<td class="inputCss"><input title="Discount" name="discount" id="'
			+ dependentRowCount
			+ 'discount" value="0.00" type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)"/></td>'
			+ '<td class="labelCss"><input title="Taxable Value" name="taxable" id="'
			+ dependentRowCount
			+ 'taxable" value="0.00" type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ '<td class="labelCss" ><input title="Taxable Value" name="manufacturingdate" id="'
			+ dependentRowCount
			+ 'manufacturingdate"  type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ '<td class="labelCss" ><input title="Taxable Value" name="expirydate" id="'
			+ dependentRowCount
			+ 'expirydate"  type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ "<th class='labelCss notPrintMe hideme' style='width: 10px;'><span><a href='javascript:void(0);' style='color: red;' onclick='removeDependentRow("
			+ dependentRowCount + ");'><i class='fa fa-trash' style='color: red;text-decoration: none;cursor: pointer;'></i></a></span></th>" +
			 + "</tr>";
	$(dependentRow1).appendTo("#dependent_table tbody");
	$("#"+dependentRowCount+"manufacturingdate").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	$("#"+dependentRowCount+"expirydate").datepicker({
		dateFormat : "dd-MM-yy",
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
					$(".hideme").hide();
					$("#submit1").hide();
					$("#clearData").hide();
				}else{
					$(".hideme").show();
					$("#submit1").show();
					$("#clearData").show();
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
					$("#submit1").hide();
					$("#clearData").hide();
				}else{
					$(".hideme").show();
					$("#submit1").show();
					$("#clearData").show();
				}
			}
			j++;
			
		});
		priceCalculator();
	});
	if(value=="0"){
		$(".hideme").hide();
		$("#submit1").hide();
		$("#clearData").hide();
	}else{
		$(".hideme").show();
		$("#submit1").show();
		$("#clearData").show();
	}
}

function PaidCalculation(value){
	var amount = $("#amount").val();
	if(amount !="" && value !=""){
		$("#dueamount").val(parseInt(amount)-parseInt(value));
	}
}

$("#pageName").text("LPO Master");
$(".lpo").addClass("active");
</script>