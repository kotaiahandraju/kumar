<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>KPOMS</title>
    <link rel="shortcut icon" href="${baseurl }/img/logo1.jpeg"/> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${baseurl }/assets/css/styles.css">
    <link rel="stylesheet" href="${baseurl }/assets/css/animate.min.css">
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
    <!--[if lt IE 9]>
        <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
    <![endif]-->

    <!-- The following CSS are included as plugins and can be removed if unused-->

<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/datatables/dataTables.css' /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${baseurl }/assets/css/datepicker1.css" rel="stylesheet" type="text/css" />

<script type='text/javascript' src='${baseurl }/assets/js/jquery-1.10.2.min.js'></script>

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<script type='text/javascript' src="${baseurl }/js/jquery.blockUI.min.js" ></script>
<script type='text/javascript' src='${baseurl }/js/ajax.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
<link rel="stylesheet" href="${baseurl }/assets/css/select2.css">



<script type='text/javascript' src='${baseurl }/js/canvasjs.min.js'></script> 
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<style type="text/css">
@media only screen and (max-width: 320px) {
.oms {
font-size:11px !important;
line-height:5 !important;
}
#page-heading h1 {
font-size:34px !important;
}
.navbar-toggle {
margin-top:8px;
}
.pagination {
    display: inline;
    padding-left: 0;
    margin: 20px 0 !important;
    border-radius: 1px;
}
.toolbar.navbar-nav {
margin-top:3px !important;
}
.nav > li > a {
    position: relative;
    display: block;
    padding: 12px 25px;
    }
    .pagination > li > a, .pagination > li span {
    padding: 6px 15px;
    width: 100%;
}
}

@media only screen and (max-width: 640px) and (min-width: 325px) {
.carth {
margin-left:10px !important;
}
.pagination {
    display: inline;
    padding-left: 0;
    margin: 20px 0 !important;
    border-radius: 1px;
}
.pagination > li > a, .pagination > li span {
    padding: 6px 15px;
    width: 100%;
}
.nav > li > a {
    position: relative;
    display: block;
    padding: 12px 25px;
    }
.toolbar.navbar-nav {
margin-top:3px !important;
}
#page-heading h1 {
font-size:27px !important;
}
.navbar-toggle {
margin-top:17px;
}
.oms {
font-size:14px !important;
line-height:5 !important;
}
.focusedform .verticalcenter {
margin-top:50px;
}
}
@media only screen and (min-width:600px) and (max-width:640px){
.carth {
margin-left:300px !important;
}
}
@media only screen and (min-width: 1024px) {
.carth {
margin-left:643px !important;
}
.pagination {
display:inline-block;
}
}
@media only screen and (min-width: 1280px) {
.carth {
margin-left:593px !important;
}
.pagination {
display:inline-block;
}
}
@media only screen and (min-width: 1366px) {
.carth {
margin-left:678px !important;
}
.pagination {
display:inline-block;
}
}
@media only screen and (min-width: 1440px) {
.carth {
margin-left:680px !important;
}
}
@media only screen and (min-width: 1600px) {
.carth {
margin-left:700px !important;
}
}
.navbar-nav li
{
	/* margin-left: 25px; */
}
.carth {
margin-top: 18px;
    float: left !important;
    color: #fff;
    list-style: none;
    margin-left: 881px;
    font-size:18px;
}
 @media only screen and (max-width: 600px) and (min-width: 400px) {
 }
#page-container, #page-content{min-height: auto;}
.control-label {
	text-align: right;
	margin-bottom: 0;
    padding-top: 8px;
}
.impColor{color:red;}

.view, .edit, .delete, .activate, .deactivate {cursor: pointer;}
.edit {color: blue;}
.deactivate {color: blue;}
.activate {color: red;}

 .impFiled {color: blue;}
 .panel-success {background-color: #4CAF50 !important;}

span.has-error,span.hasError
{
  font-weight:normal;
  border-color: #e73d4a;
  color:red;
  margin-top: -3px;
  display: block !important;
  position: absolute;
}
.btn-danger {
border-radius:5px;
}
.btn-warning {
border-radius:5px;
}
.error{color: red; font-weight: bold;}

.alert-success, .alert-warning, .alert-danger{color: white !important;}
.alert-success{background-color: #4CAF50 !important;}
.alert-warning{background-color: #ff6600 !important;}
.alert-danger{background-color: #d43f3a !important;}

.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}

.msgcss
{
/* 	width: 50% !important; */
/* 	font-weight: bold; */
	margin: auto;
	text-align: center;
	top: 3px !important;
	left:0;
	right:0;
	position: fixed;
	font-size: 14px;
	z-index:99999;
}
.navbar-brand {
    float: left;
    padding: 2px 27px;
    font-size: 18px;
    line-height: auto;
}
.oms {
color:#fff;
font-size:24px;
line-height:2;
}
.select2
{
/* 	max-width: 100% !important; */
/* 	width: 100% !important; */
}
</style>
<script type="text/javascript">
	var isClick = 'No';
		window.setTimeout(function() {
		    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
		        $(this).remove(); 
		    });
		}, 5000);
		
		
$(function() {
    $(".chzn-select").chosen();
	$(".select2").select2();
});

$(document).ready(function(){
	tooltip();
	cartCount();
});
function tooltip(){
	$('.view').attr('data-toggle','tooltip');
	$('.view').attr('data-original-title','View');
	$('.edit').attr('data-toggle','tooltip');
	$('.edit').attr('data-original-title','Edit');
	$('.delete').attr('data-toggle','tooltip');
	$('.delete').attr('data-original-title','Delete');
	$('.activate').attr('data-toggle','tooltip');
	$('.activate').attr('data-original-title','Activate');
	$('.printlpo').attr('data-toggle','tooltip');
	$('.printlpo').attr('data-original-title','Print');
	$('.deactivate').attr('data-toggle','tooltip');
	$('.deactivate').attr('data-original-title','Deactivate');
	$('.notAssigned').attr('data-toggle','tooltip');
	$('.notAssigned').attr('data-original-title','UsernameNotAssigned');
		$('[data-toggle="tooltip"]').tooltip();
}
function cartCount(){
	var formData = new FormData();
	$.fn.makeMultipartRequest('POST', 'countCartdetails', false, formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var count = jsonobj.count;
		$("#cartId").text(count);
	});
}
</script>
</head>

<body class="horizontal-nav ">
	<c:if test="${not empty msg}">
		<div class="msgcss row">
			<div class="col-sm-4 col-sm-offset-4">
				<div class="form-group">
					<div class="alert alert-${cssMsg} fadeIn animated">${msg}</div>
				</div>
			</div>
		</div>
	</c:if>
	<div class="msgcss row" style="visibility: hidden" >
			<div class="col-sm-4 col-sm-offset-4">
				<div class="form-group">
					<div class="alert alert-success fadeIn animated" id="msg"></div>
				</div>
			</div>
		</div>

    <header class="navbar navbar-inverse navbar-fixed-top" role="banner">
        <div class="navbar-header pull-left">
            <a class="navbar-brand" href="dashboard"><img src="${baseurl }/img/klogo1.png" class="img-responsive" style="    width: 132px;"></a>
            <span class="oms">Order Management System</span>
            <div class="clearfix"></div>
        </div>
          <c:if test="${cacheUserBean.roleId=='3' }">
        <a href="cartdetails"><li class="pull-right carth"><i class="fa fa-shopping-cart"></i> Cart <span class="badge" id="cartId"></span> </li></a>
        </c:if>
		<div class="masters">
	        <ul class="nav navbar-nav pull-right toolbar">
	            <li class="dropdown">
	            <c:if test="${cacheUserBean.roleId=='1' }">
	                <a href="#" class="dropdown-toggle username" data-toggle="dropdown"><span class="hidden-xs">Master Admin <i class="fa fa-caret-down"></i></span><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt="Dangerfield" /></a>
	                <ul class="dropdown-menu userinfo arrow">
	                    <li class="username">
	                        <a href="#">
	                            <div class="pull-left"><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt=""/></div>
	                            <div class="pull-right"><h5>Master Admin!</h5><small>Logged in as <span>${cacheUserBean.userName}</span></small></div> 
	                        </a>
	                    </li>
	            </c:if>
	            <c:if test="${cacheUserBean.roleId=='2' }">
	                <a href="#" class="dropdown-toggle username" data-toggle="dropdown"><span class="hidden-xs">Branch Manager <i class="fa fa-caret-down"></i></span><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt="Dangerfield" /></a>
	                <ul class="dropdown-menu userinfo arrow">
	                    <li class="username">
	                        <a href="#">
	                            <div class="pull-left"><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt=""/></div>
	                            <div class="pull-right"><h5>Branch Manager!</h5><small>Logged in as <span>${cacheUserBean.userName}</span></small></div> 
	                        </a>
	                    </li>
	            </c:if>
	            <c:if test="${cacheUserBean.roleId=='3' }">
	                <a href="#" class="dropdown-toggle username" data-toggle="dropdown"><span class="hidden-xs">Dealer <i class="fa fa-caret-down"></i></span><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt="Dangerfield" /></a>
	                <ul class="dropdown-menu userinfo arrow">
	                    <li class="username">
	                        <a href="#">
	                            <div class="pull-left"><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt=""/></div>
	                            <div class="pull-right"><h5>Dealer!</h5><small>Logged in as <span>${cacheUserBean.userName}</span></small></div> 
	                        </a>
	                    </li>
	            </c:if>
	                
	                    <li class="userlinks">
	                        <ul class="dropdown-menu">
	                           <!--  <li><a href="../dealerregistration">Edit Profile <i class="pull-right fa fa-pencil"></i></a></li> -->
	                            <li><a href="changePassword">Change Password <i class="pull-right fa fa-cog"></i></a></li>
	                            <li class="divider"></li>
	                            <li><a href="../logoutHome" class="text-right">Sign Out</a></li>
	                        </ul>
	                    </li>
	                </ul>
	            </li>
	        </ul>
        </div>
    </header>

    <nav class="navbar navbar-default yamm top20" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <i class="fa fa-bars"></i>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse" id="horizontal-navbar" style="padding:0px">
            <ul class="nav navbar-nav">
            
            <li class="dashboard"><a href="${baseurl }/admin/dashboard"><i class="fa fa-dashboard"></i>
             <span>Dashboard</span></a></li>&emsp;
               <c:if test="${roleId=='1' }">
               <li class="branch"><a href="${baseurl }/admin/branchHome"><i class="fa fa-university"></i> <span>Branch</span></a></li>
                <li class="productType"><a href="${baseurl }/admin/producttype"><i class="fa fa-clone"></i>

 <span>Product Category</span></a></li>&emsp;
              <li class="productName"><a href="${baseurl }/admin/productName"><i class="fa fa-bookmark"></i>

               <span>Product Sub Category</span></a></li>&emsp;
              <li class="items"><a href="${baseurl }/admin/items"><i class="fa fa-list-alt"></i>

               <span>Product List</span></a></li>&emsp;
              <li class="employee"><a href="${baseurl }/admin/employeeCreation"><i class="fa fa-users"></i> <span>Employees</span></a></li>
              <li class="items"><a href="${baseurl }/admin/getProductsDeliveredQtyBranchWise"><i class="fa fa-users"></i> <span>Padma</span></a></li>
              </c:if>
			 <c:if test="${roleId=='2' }">
			  <li class="productType"><a href="${baseurl }/admin/producttype"><i class="fa fa-clone"></i>

			  <span>Product Category</span></a></li>&emsp;
              <li class="productName"><a href="${baseurl }/admin/productName"><i class="fa fa-bookmark"></i> <span>Product Sub Category</span></a></li>&emsp;
              <li class="items"><a href="${baseurl }/admin/items"><i class="fa fa-list-alt"></i> <span>Product List</span></a></li>&emsp;
               <li class="dealercreation"><a href="${baseurl }/admin/dealercreation"> <i class="fa fa-user-secret"></i><span>Dealer Creation </span></a></li>
			   <li class="dealerconfirm"><a href="${baseurl }/admin/dealeraccountconfirm"><i class="fa fa-check-square"></i><span> Confirm  Dealer</span></a></li>
			    <li class="dealerpaymentconfirm"><a href="${baseurl }/admin/dealerpaymentconfirm"><i class="fa fa-bolt"></i><span>Confirm Payments </span></a></li>
			    <li class="orderslist"><a href="${baseurl }/admin/orderslist"><i class="fa fa-clipboard"></i>

<span>Delivery Status</span></a></li>
			   
			 </c:if>
			  <c:if test="${roleId=='3' }">
			  <li class="delarpayment"><a href="${baseurl }/admin/delarpayment"> <i class="fa fa-bookmark"></i><span>Payment Information</span></a></li>
			  <li class="orderplacing"><a href="${baseurl }/admin/orderplacing"><i class="fa fa-clipboard"></i> <span>Order Product</span></a></li>
			   <li class="ordersList"><a href="${baseurl }/admin/myorderLists"><i class="fa fa-first-order"></i>

 <span>My Orders</span></a></li>
			 </c:if>
				
			</ul>
		</div>
    </nav>

    <div id="page-container">
    	<div id="page-content" style="min-height: auto;">
    		<div id="wrap">
	        <div id="page-heading" class="row">
	        	<div class="col-md-6">
					<h1 id="pageName"></h1>
					
				</div>
				<div class="col-md-6">
					<div class="options">
		                <div class="btn-toolbar">
		                   <!--  <a href="#" class="btn btn-danger "><span id="cylinderCount1"></span><br />Cylinders</a>
		                    <a href="#" class="btn btn-warning"><span id="customerCount1"></span><br />Customers</a>
		                    <a href="#" class="btn btn-info"><span id="totalGas1"></span><br />Gas in Kgs</a> -->
		                </div>
	            	</div>
	            </div>
	            <div class="clearfix"></div>
	        </div>
<!-- Header ends Here -->