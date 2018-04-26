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
<%--     <link rel="shortcut icon" href="${baseurl }/img/logo.jpeg"/> --%>
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
.navbar-nav li
{
	margin-left: 25px;
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
		$('[data-toggle="tooltip"]').tooltip();
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
            <a class="navbar-brand" href="javascript:void(0);"><img src="${baseurl }/assets/img/logo.png" class="img-responsive" style="    width: 132px;"></a>
            <div class="clearfix"></div>
        </div>
		<div class="masters">
	        <ul class="nav navbar-nav pull-right toolbar">
	            <li class="dropdown">
	                <a href="#" class="dropdown-toggle username" data-toggle="dropdown"><span class="hidden-xs">Master Admin <i class="fa fa-caret-down"></i></span><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt="Dangerfield" /></a>
	                <ul class="dropdown-menu userinfo arrow">
	                    <li class="username">
	                        <a href="#">
	                            <div class="pull-left"><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt=""/></div>
	                            <div class="pull-right"><h5>Master Admin!</h5><small>Logged in as <span>Master</span></small></div> 
	                        </a>
	                    </li>
	                    <li class="userlinks">
	                        <ul class="dropdown-menu">
	                            <li><a href="#">Edit Profile <i class="pull-right fa fa-pencil"></i></a></li>
	                            <li><a href="#">Change Password <i class="pull-right fa fa-cog"></i></a></li>
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
            
            <li class="dashboard"><a href="${baseurl }/admin/dashboard"> <span>Dashboard</span></a></li>&nbsp;
           
             <li class="productType"><a href="${baseurl }/admin/producttype"><span>Product Category</span></a></li>&emsp;
              <li class="productName"><a href="${baseurl }/admin/productName"> <span>Product Sub Category</span></a></li>&emsp;
              <li class="items"><a href="${baseurl }/admin/items"> <span>Product List</span></a></li>&emsp;
               <c:if test="${roleId=='1' }">
              <li class="employee"><a href="${baseurl }/admin/employee"> <span>Employees</span></a></li>
              <li class="branch"><a href="${baseurl }/admin/branchHome"> <span>Branch</span></a></li>
               <li class="branchcreation"><a href="${baseurl }/admin/branchCreation"> <span>Branch Creation</span></a></li>
              
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