<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <!-- Icons -->
    <link href="${baseurl }/newcss/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="${baseurl }/newcss/flag-icon.min.css" rel="stylesheet">
  <link href="${baseurl }/newcss/font-awesome.min.css" rel="stylesheet">
  <link href="${baseurl }/newcss/simple-line-icons.min.css" rel="stylesheet">

  <!-- Main styles for this application -->
<!--   <link href="css/style.css" rel="stylesheet"> -->

  <!-- Styles required by this views -->
  <link href="${baseurl }/newcss/daterangepicker.min.css" rel="stylesheet">
  <link href="${baseurl }/newcss/gauge.min.css" rel="stylesheet">
  <link href="${baseurl }/newcss/toastr.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="${baseurl }/img/logo1.jpeg"/> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
    <!--[if lt IE 9]>
        <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
    <![endif]-->

    <!-- The following CSS are included as plugins and can be removed if unused-->
  <link href="${baseurl }/newcss/dataTables.bootstrap4.min.css" rel="stylesheet">
  
<%-- <link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' />  --%>
<%-- <link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' />  --%>
<%-- <link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' />  --%>
<%-- <link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' />  --%>
<%-- <link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' />  --%>
<%-- <link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' />  --%>
<%-- <link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/datatables/dataTables.css' />  --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%-- <link href="${baseurl }/assets/css/datepicker1.css" rel="stylesheet" type="text/css" /> --%>

<script type='text/javascript' src='${baseurl }/assets/js/jquery-1.10.2.min.js'></script>
<script type='text/javascript' src='${baseurl }/assets/js/jqueryui-1.10.3.min.js'></script> 

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

.toolbar.navbar-nav {
margin-top:3px !important;
}
.nav > li > a {
    position: relative;
    display: block;
    padding: 12px 25px;
    }
  
}

@media only screen and (max-width: 640px) and (min-width: 325px) {
.carth {
margin-left:10px !important;
    margin-top: 6px !important;
}
.modal-dialog {
    width: 100%;
    margin: 30px auto;
    background:#fff;
}
.modal-content {
box-shadow:none !important;
border:none !important;

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

}
@media only screen and (min-width: 1280px) {
.carth {
margin-left:570px !important;
}

}
@media only screen and (min-width: 1366px) {
.carth {
margin-left:631px !important;
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

 <body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
  <header class="app-header navbar">
    <button class="navbar-toggler mobile-sidebar-toggler d-lg-none" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>
    <ul class="nav navbar-nav d-md-down-none mr-auto">

      <li class="nav-item px-3">
        <a class="nav-link" href="${baseurl }/admin/getProductsDeliveredQtyBranchWise">Dashboard</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link" href="#">Users</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link" href="#">Settings</a>
      </li>
    </ul>
    <!-- <ul class="nav navbar-nav ml-auto">
      <li class="nav-item dropdown d-md-down-none">
        <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
          <i class="icon-bell"></i><span class="badge badge-pill badge-danger">5</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg">
          <div class="dropdown-header text-center">
            <strong>You have 5 notifications</strong>
          </div>
          <a href="#" class="dropdown-item">
            <i class="icon-user-follow text-success"></i> New user registered
          </a>
          <a href="#" class="dropdown-item">
            <i class="icon-user-unfollow text-danger"></i> User deleted
          </a>
          <a href="#" class="dropdown-item">
            <i class="icon-chart text-info"></i> Sales report is ready
          </a>
          <a href="#" class="dropdown-item">
            <i class="icon-basket-loaded text-primary"></i> New client
          </a>
          <a href="#" class="dropdown-item">
            <i class="icon-speedometer text-warning"></i> Server overloaded
          </a>
          <div class="dropdown-header text-center">
            <strong>Server</strong>
          </div>
          <a href="#" class="dropdown-item">
            <div class="text-uppercase mb-1">
              <small><b>CPU Usage</b></small>
            </div>
            <span class="progress progress-xs">
              <div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </span>
            <small class="text-muted">348 Processes. 1/4 Cores.</small>
          </a>
          <a href="#" class="dropdown-item">
            <div class="text-uppercase mb-1">
              <small><b>Memory Usage</b></small>
            </div>
            <span class="progress progress-xs">
              <div class="progress-bar bg-warning" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
            </span>
            <small class="text-muted">11444GB/16384MB</small>
          </a>
          <a href="#" class="dropdown-item">
            <div class="text-uppercase mb-1">
              <small><b>SSD 1 Usage</b></small>
            </div>
            <span class="progress progress-xs">
              <div class="progress-bar bg-danger" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
            </span>
            <small class="text-muted">243GB/256GB</small>
          </a>
        </div>
      </li>
      <li class="nav-item dropdown d-md-down-none">
        <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
          <i class="icon-list"></i><span class="badge badge-pill badge-warning">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg">
          <div class="dropdown-header text-center">
            <strong>You have 5 pending tasks</strong>
          </div>
          <a href="#" class="dropdown-item">
            <div class="small mb-1">Upgrade NPM &amp; Bower
              <span class="float-right">
                <strong>0%</strong>
              </span>
            </div>
            <span class="progress progress-xs">
              <div class="progress-bar bg-info" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
            </span>
          </a>
          <a href="#" class="dropdown-item">
            <div class="small mb-1">ReactJS Version
              <span class="float-right">
                <strong>25%</strong>
              </span>
            </div>
            <span class="progress progress-xs">
              <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </span>
          </a>
          <a href="#" class="dropdown-item">
            <div class="small mb-1">VueJS Version
              <span class="float-right">
                <strong>50%</strong>
              </span>
            </div>
            <span class="progress progress-xs">
              <div class="progress-bar bg-warning" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
            </span>
          </a>
          <a href="#" class="dropdown-item">
            <div class="small mb-1">Add new layouts
              <span class="float-right">
                <strong>75%</strong>
              </span>
            </div>
            <span class="progress progress-xs">
              <div class="progress-bar bg-info" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
            </span>
          </a>
          <a href="#" class="dropdown-item">
            <div class="small mb-1">Angular 2 Cli Version
              <span class="float-right">
                <strong>100%</strong>
              </span>
            </div>
            <span class="progress progress-xs">
              <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
            </span>
          </a>
          <a href="#" class="dropdown-item text-center">
            <strong>View all tasks</strong>
          </a>
        </div>
      </li>
      <li class="nav-item dropdown d-md-down-none">
        <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
          <i class="icon-envelope-letter"></i><span class="badge badge-pill badge-info">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg">
          <div class="dropdown-header text-center">
            <strong>You have 4 messages</strong>
          </div>
          <a href="#" class="dropdown-item">
            <div class="message">
              <div class="py-3 mr-3 float-left">
                <div class="avatar">
                  <img src="img/avatars/7.jpg" class="img-avatar" alt="admin@bootstrapmaster.com">
                  <span class="avatar-status badge-success"></span>
                </div>
              </div>
              <div>
                <small class="text-muted">John Doe</small>
                <small class="text-muted float-right mt-1">Just now</small>
              </div>
              <div class="text-truncate font-weight-bold">
                <span class="fa fa-exclamation text-danger"></span> Important message</div>
              <div class="small text-muted text-truncate">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...</div>
            </div>
          </a>
          <a href="#" class="dropdown-item">
            <div class="message">
              <div class="py-3 mr-3 float-left">
                <div class="avatar">
                  <img src="img/avatars/6.jpg" class="img-avatar" alt="admin@bootstrapmaster.com">
                  <span class="avatar-status badge-warning"></span>
                </div>
              </div>
              <div>
                <small class="text-muted">John Doe</small>
                <small class="text-muted float-right mt-1">5 minutes ago</small>
              </div>
              <div class="text-truncate font-weight-bold">Lorem ipsum dolor sit amet</div>
              <div class="small text-muted text-truncate">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...</div>
            </div>
          </a>
          <a href="#" class="dropdown-item">
            <div class="message">
              <div class="py-3 mr-3 float-left">
                <div class="avatar">
                  <img src="img/avatars/5.jpg" class="img-avatar" alt="admin@bootstrapmaster.com">
                  <span class="avatar-status badge-danger"></span>
                </div>
              </div>
              <div>
                <small class="text-muted">John Doe</small>
                <small class="text-muted float-right mt-1">1:52 PM</small>
              </div>
              <div class="text-truncate font-weight-bold">Lorem ipsum dolor sit amet</div>
              <div class="small text-muted text-truncate">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...</div>
            </div>
          </a>
          <a href="#" class="dropdown-item">
            <div class="message">
              <div class="py-3 mr-3 float-left">
                <div class="avatar">
                  <img src="img/avatars/4.jpg" class="img-avatar" alt="admin@bootstrapmaster.com">
                  <span class="avatar-status badge-info"></span>
                </div>
              </div>
              <div>
                <small class="text-muted">John Doe</small>
                <small class="text-muted float-right mt-1">4:03 PM</small>
              </div>
              <div class="text-truncate font-weight-bold">Lorem ipsum dolor sit amet</div>
              <div class="small text-muted text-truncate">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...</div>
            </div>
          </a>
          <a href="#" class="dropdown-item text-center">
            <strong>View all messages</strong>
          </a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
          <img src="img/avatars/6.jpg" class="img-avatar" alt="admin@bootstrapmaster.com">
        </a>
        <div class="dropdown-menu dropdown-menu-right">
          <div class="dropdown-header text-center">
            <strong>Account</strong>
          </div>
          <a class="dropdown-item" href="#"><i class="fa fa-bell-o"></i> Updates<span class="badge badge-info">42</span></a>
          <a class="dropdown-item" href="#"><i class="fa fa-envelope-o"></i> Messages<span class="badge badge-success">42</span></a>
          <a class="dropdown-item" href="#"><i class="fa fa-tasks"></i> Tasks<span class="badge badge-danger">42</span></a>
          <a class="dropdown-item" href="#"><i class="fa fa-comments"></i> Comments<span class="badge badge-warning">42</span></a>
          <div class="dropdown-header text-center">
            <strong>Settings</strong>
          </div>
          <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Profile</a>
          <a class="dropdown-item" href="#"><i class="fa fa-wrench"></i> Settings</a>
          <a class="dropdown-item" href="#"><i class="fa fa-usd"></i> Payments<span class="badge badge-dark">42</span></a>
          <a class="dropdown-item" href="#"><i class="fa fa-file"></i> Projects<span class="badge badge-primary">42</span></a>
          <div class="divider"></div>
          <a class="dropdown-item" href="#"><i class="fa fa-shield"></i> Lock Account</a>
          <a class="dropdown-item" href="#"><i class="fa fa-lock"></i> Logout</a>
        </div>
      </li>
      
    </ul> -->
  </header>
  <div class="app-body">
    <div class="sidebar">
      <form class="sidebar-form">
        <div class="form-group p-2  mb-0">
          <input type="text" class="form-control" aria-describedby="search" placeholder="Search...">
        </div>
      </form>
      <nav class="sidebar-nav">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link"  href="${baseurl }/admin/getProductsDeliveredQtyBranchWise"><i class="fa fa-users"></i> Dashboard</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="${baseurl }/admin/branchHome"><i class="fa fa-university"></i> <span>Branch</a>
          </li>
           <li class="nav-item">
           <a class="nav-link" href="${baseurl }/admin/producttype"><i class="fa fa-clone"></i>	Product Category</a>
           </li>
              <li class=" nav-item productName"><a class="nav-link" href="${baseurl }/admin/productName"><i class="fa fa-bookmark"></i> <span>Product Subcategory</span></a></li>
              <li class="nav-item items"><a class="nav-link" href="${baseurl }/admin/items"><i class="fa fa-list-alt"></i><span>Product List</span></a></li>
          <li class="nav-item nav-dropdown">
            <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-list"></i> Reports</a>
            <ul class="nav-dropdown-items">
            <liclass="nav-item">
                <a class="nav-link" href="${baseurl }/admin/reportAllOrdersPage"><i class="fa fa-clone" aria-hidden="true"></i><span>All Orders</span></a></li>
                      <li class="nav-item">
                <a class="nav-link" href="${baseurl }/admin/reportPendingOrders"><i class="fa fa-clone" aria-hidden="true"></i> <span>Pending Orders</span></a></li>
                      <li class="nav-item">
                <a class="nav-link" href="${baseurl }/admin/reportPartiallyDeliveredOrders"><i class="fa fa-clone" aria-hidden="true"></i> <span>Partially Delivered </span></a></li>
                      <li class="nav-item">
                <a class="nav-link" href="${baseurl }/admin/reportDeliveredOrders"> <i class="fa fa-clone" aria-hidden="true"></i><span>Delivered Orders</span></a></li>
            </ul>
          </li>
        

        </ul>
      </nav>
      <button class="sidebar-minimizer brand-minimizer" type="button"></button>
    </div>

   

    

 
  <!-- Bootstrap and necessary plugins -->
<%--   <script src="${baseurl }/newcss/jquery.min.js"></script> --%>
  <script src="${baseurl }/newcss/popper.min.js"></script>
  <script src="${baseurl }/newcss/pace.min.js"></script>

  <!-- Plugins and scripts required by all views -->
  <script src="${baseurl }/newcss/Chart.min.js"></script>

  <!-- SimpliQ main scripts -->

  <script src="${baseurl }/newcss/app.js"></script>

  <!-- Plugins and scripts required by this views -->
  <script src="${baseurl }/newcss/toastr.min.js"></script>
<%--   <script src="${baseurl }/newcss/gauge.min.js"></script> --%>
<%--   <script src="${baseurl }/newcss/moment.min.js"></script> --%>
<%--   <script src="${baseurl }/newcss/daterangepicker.min.js"></script> --%>

  <!-- Custom scripts required by this view -->
 
   
<!-- Header ends Here -->