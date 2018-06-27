<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	String baseurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>KPOMS</title>
<link rel="shortcut icon" href="${baseurl }/img/logo1.jpeg" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${baseurl }/newcss/style.css">
<link href="${baseurl }/newcss/flag-icon.min.css" rel="stylesheet">
<link href="${baseurl }/newcss/font-awesome.min.css" rel="stylesheet">
<link href="${baseurl }/newcss/simple-line-icons.min.css"
	rel="stylesheet">
<link href="${baseurl }/newcss/daterangepicker.min.css" rel="stylesheet">
<link href="${baseurl }/newcss/gauge.min.css" rel="stylesheet">
<link href="${baseurl }/newcss/toastr.min.css" rel="stylesheet">

<link rel="stylesheet" href="${baseurl }/assets/css/styles.css">
<link rel="stylesheet" href="${baseurl }/assets/css/animate.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600'
	rel='stylesheet' type='text/css'>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
<!--[if lt IE 9]>
        <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
    <![endif]-->

<!-- The following CSS are included as plugins and can be removed if unused-->

<link rel='stylesheet' type='text/css'
	href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' />
<link rel='stylesheet' type='text/css'
	href='${baseurl }/assets/plugins/codeprettifier/prettify.css' />
<link rel='stylesheet' type='text/css'
	href='${baseurl }/assets/plugins/form-toggle/toggles.css' />
<link rel='stylesheet' type='text/css'
	href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' />
<link rel='stylesheet' type='text/css'
	href='${baseurl }/assets/plugins/codeprettifier/prettify.css' />
<link rel='stylesheet' type='text/css'
	href='${baseurl }/assets/plugins/form-toggle/toggles.css' />
<%-- <link rel='stylesheet' type='text/css'	href='${baseurl }/assets/plugins/datatables/dataTables.css' /> --%>

<link rel="stylesheet" href="${baseurl }/assets/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="${baseurl }/assets/css/jquery.dataTables.min.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${baseurl }/assets/css/datepicker1.css" rel="stylesheet"
	type="text/css" />

<%-- <script type='text/javascript'	src='${baseurl }/assets/js/jquery-1.10.2.min.js'></script> --%>

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->

 <script src="${baseurl }/newjs/jquery.min.js"></script>
<%-- <script type='text/javascript' src='${baseurl }/js/jquery-1.11.3.min.js'></script> --%>
<script type='text/javascript'
	src="${baseurl }/js/jquery.blockUI.min.js"></script>
<script type='text/javascript' src='${baseurl }/js/ajax.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
<link rel="stylesheet" href="${baseurl }/assets/css/select2.css">



<script type='text/javascript' src='${baseurl }/js/canvasjs.min.js'></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<style type="text/css">

.badge-success {
   border-radius:0px;
}
.badge-warning {
   border-radius:0px;
}

.pending0 .dropdown-toggle {
	background: #595f69 !important;
	color: #ffffff !important;
}

.dropdown-menu .dropdown-toggle {
	background: #595f69 !important;
	color: #ffffff !important;
}

@media only screen and (max-width: 320px) {
	.oms {
		font-size: 11px !important;
		line-height: 5 !important;
	}
	#page-heading h1 {
		font-size: 34px !important;
	}
	.navbar-toggle {
		margin-top: 8px;
	}
	.pagination {
		display: inline;
		padding-left: 0;
		margin: 20px 0 !important;
		border-radius: 1px;
	}
	.toolbar.navbar-nav {
		margin-top: 3px !important;
	}
	.nav>li>a {
		position: relative;
		display: block;
		padding: 12px 25px;
	}
	.pagination>li>a, .pagination>li span {
		padding: 6px 15px;
		width: 100%;
	}
}

@media only screen and (max-width: 640px) and (min-width: 325px) {
.main .container-fluid {
    padding: 0 10px;
}
	.carth {
		margin-left: 10px !important;
		margin-top: 6px !important;
	}
	.modal-dialog {
		width: 100%;
		margin: 30px auto;
		background: #fff;
	}
	.modal-content {
		box-shadow: none !important;
		border: none !important;
	}
	.pagination {
		display: inline;
		padding-left: 0;
		margin: 20px 0 !important;
		border-radius: 1px;
	}
	.pagination>li>a, .pagination>li span {
		padding: 6px 15px;
		width: 100%;
	}
	.nav>li>a {
		position: relative;
		display: block;
		padding: 12px 25px;
	}
	.toolbar.navbar-nav {
		margin-top: 3px !important;
	}
	#page-heading h1 {
		font-size: 27px !important;
	}
	.navbar-toggle {
		margin-top: 17px;
	}
	.oms {
		font-size: 14px !important;
		line-height: 5 !important;
	}
	.focusedform .verticalcenter {
		margin-top: 50px;
	}
}

@media only screen and (min-width:600px) and (max-width:640px) {
	.carth {
		margin-left: 300px !important;
	}
}

@media only screen and (min-width: 1024px) {
	.carth {
		margin-left: 643px !important;
	}
	.pagination {
		display: inline-block;
	}
}

@media only screen and (min-width: 1280px) {
	.carth {
		margin-left: 570px !important;
	}
	.pagination {
		display: inline-block;
	}
}

@media only screen and (min-width: 1366px) {
	.carth {
		margin-left: 631px !important;
	}
	.pagination {
		display: inline-block;
	}
}

@media only screen and (min-width: 1440px) {
	.carth {
		margin-left: 680px !important;
	}
}

@media only screen and (min-width: 1600px) {
	.carth {
		margin-left: 700px !important;
	}
}

.navbar-nav li {
	/* margin-left: 25px; */
	
}

.carth {
	margin-top: 18px;
	float: left !important;
	color: #fff;
	list-style: none;
	margin-left: 881px;
	font-size: 16px;
}

@media only screen and (max-width: 600px) and (min-width: 400px) {
}

#page-container, #page-content {
	min-height: auto;
}

.control-label {
	text-align: right;
	margin-bottom: 0;
	padding-top: 8px;
}

.impColor {
	color: red;
}

.view, .edit, .delete, .activate, .deactivate {
	cursor: pointer;
}

.edit {
	color: blue;
}

.deactivate {
	color: blue;
}

.activate {
	color: red;
}

.impFiled {
	color: blue;
}

.panel-success {
	background-color: #4CAF50 !important;
}

span.has-error, span.hasError {
	font-weight: normal;
	border-color: #e73d4a;
	color: red;
	margin-top: -3px;
	display: block !important;
	position: absolute;
}

.btn-danger {
	border-radius: 5px;
}

.btn-warning {
	border-radius: 5px;
}

.error {
	color: red;
	font-weight: bold;
}

.alert-success, .alert-warning, .alert-danger {
	color: white !important;
}

.alert-success {
	background-color: #4CAF50 !important;
}

.alert-warning {
	background-color: #ff6600 !important;
}

.alert-danger {
	background-color: #d43f3a !important;
}

.your-class::-webkit-input-placeholder {
	color: #e73d4a !important;
}

.your-class::-moz-placeholder {
	color: #e73d4a !important;
}

.default-class::-webkit-input-placeholder {
	color: #e73d4a !important;
}

.default-class::-moz-placeholder {
	color: #e73d4a !important;
}

.msgcss {
	/* 	width: 50% !important; */
	/* 	font-weight: bold; */
	margin: auto;
	text-align: center;
	top: 3px !important;
	left: 0;
	right: 0;
	position: fixed;
	font-size: 14px;
	z-index: 99999;
}

.navbar-brand {
	float: left;
	padding: 2px 27px;
	font-size: 18px;
	line-height: auto;
}

.oms {
	color: #fff;
	font-size: 24px;
	line-height:1;
}

.select2 {
	/* 	max-width: 100% !important; */
	/* 	width: 100% !important; */
	
}
.navbar-toggler-icon {
margin-top:-10px;
}
</style>
<script type="text/javascript">
	var isClick = 'No';
	window.setTimeout(function() {
		$(".msgcss").fadeTo(500, 0).slideUp(500, function() {
			$(this).remove();
		});
	}, 5000);

	$(function() {
		$(".chzn-select").chosen();
		$(".select2").select2();
	});

	$(document).ready(function() {
		tooltip();
		cartCount();
	});
	function tooltip() {
		$('.view').attr('data-toggle', 'tooltip');
		$('.view').attr('data-original-title', 'View');
		$('.edit').attr('data-toggle', 'tooltip');
		$('.edit').attr('data-original-title', 'Edit');
		$('.delete').attr('data-toggle', 'tooltip');
		$('.delete').attr('data-original-title', 'Delete');
		$('.activate').attr('data-toggle', 'tooltip');
		$('.activate').attr('data-original-title', 'Activate');
		$('.printlpo').attr('data-toggle', 'tooltip');
		$('.printlpo').attr('data-original-title', 'Print');
		$('.deactivate').attr('data-toggle', 'tooltip');
		$('.deactivate').attr('data-original-title', 'Deactivate');
		$('.notAssigned').attr('data-toggle', 'tooltip');
		$('.notAssigned').attr('data-original-title', 'UsernameNotAssigned');
		$('[data-toggle="tooltip"]').tooltip();
	}
	function cartCount() {
		var formData = new FormData();
		$.fn.makeMultipartRequest('POST', 'countCartdetails', false, formData,
				false, 'text', function(data) {
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
	<div class="msgcss row" style="visibility: hidden">
		<div class="col-sm-4 col-sm-offset-4">
			<div class="form-group">
				<div class="alert alert-success fadeIn animated" id="msg"></div>
			</div>
		</div>
	</div>
<body
	class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
	<header class="app-header navbar">
		<button class="navbar-toggler mobile-sidebar-toggler d-lg-none"
			type="button">
			<span class="navbar-toggler-icon"></span>
		</button>
		<button class="navbar-toggler sidebar-toggler d-md-down-none"
			type="button">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="#"></a>

		<ul class="nav navbar-nav d-md-down-none mr-auto">

			<li class="nav-item px-3"><a class="nav-link"><span
					class="oms">Order Management System</span></a></li>

		</ul>
		<ul class="nav navbar-nav ml-auto">

			<c:if test="${cacheUserBean.roleId=='3' }">
				<li class="nav-item carth"><a style="margin-top:-8px" class="nav-link"
					href="cartdetails"><i class="fa fa-shopping-cart"></i> Cart <span
						class="badge" id="cartId"></span></a></li>
			</c:if>
			<c:if test="${cacheUserBean.roleId=='2' }">
				<script>
					var paramid = $("#delerId").val();
					$('#tagId').attr('href',
							'managercartdetails?dealerId=' + paramid);
				</script>
				<li class="nav-item carth"><a style="margin-top:-7px" class="nav-link"
					href="managercartdetails" id="tagId">
					<i class="fa fa-shopping-cart"></i> Cart <span class="badge"
						id="managercartId"></span> </a></li>
			</c:if>
			<c:if test="${cacheUserBean.roleId=='1' }">
				<li class="nav-item dropdown"><a class="nav-link nav-link"
					data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
					aria-expanded="false"> Master Admin <i
						class="fa fa-chevron-down"></i> <img
						src="${baseurl }/assets/demo/avatar/dangerfield.png"
						class="img-avatar" alt="masterAdmin">
				</a>
					<div class="dropdown-menu dropdown-menu-right">

						<a class="dropdown-item" href="changePassword"><i
							class=" fa fa-cog"></i>Change Password</a> <a class="dropdown-item"
							href="../logoutHome"><i class="fa fa-lock"></i> Logout</a>
					</div></li>
			</c:if>
			<c:if test="${cacheUserBean.roleId=='2' }">
				<li class="nav-item dropdown"><a class="nav-link nav-link"
					data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
					aria-expanded="false"> Manager <i class="fa fa-chevron-down"></i>
						<img src="${baseurl }/assets/demo/avatar/dangerfield.png"
						class="img-avatar" alt="masterAdmin">
				</a>
					<div class="dropdown-menu dropdown-menu-right">

						<a class="dropdown-item" href="changePassword"><i
							class=" fa fa-cog"></i>Change Password</a> <a class="dropdown-item"
							href="../logoutHome"><i class="fa fa-lock"></i> Logout</a>
					</div></li>
			</c:if>
			<c:if test="${cacheUserBean.roleId=='3' }">
				<li class="nav-item dropdown"><a class="nav-link nav-link"
					data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
					aria-expanded="false"> Dealer <i class="fa fa-chevron-down"></i>
						<img src="${baseurl }/assets/demo/avatar/dangerfield.png"
						class="img-avatar" alt="masterAdmin">
				</a>
					<div class="dropdown-menu dropdown-menu-right">

						<a class="dropdown-item" href="changePassword"><i
							class=" fa fa-cog"></i>Change Password</a> <a class="dropdown-item"
							href="../logoutHome"><i class="fa fa-lock"></i> Logout</a>
					</div></li>
			</c:if>

		</ul>
	</header>
	<div class="app-body">
		<div class="sidebar">
		<%-- 	<form class="sidebar-form">
				<div class="form-group p-2  mb-0">
					<input type="text" class="form-control" aria-describedby="search"
						placeholder="Search...">
				</div>
			</form> --%>
			<nav class="sidebar-nav">
				<ul class="nav">
					<c:if test="${roleId=='1' }">
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/dashboardforbranchwise"><i
								class="fa fa-users"></i> <span>Dashboard</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/branchHome"><i
								class="fa fa-university"></i> <span>Branch</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/producttype"><i class="fa fa-clone"></i>
								<span>Product Category</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/productName"><i
								class="fa fa-bookmark"></i> <span>Product Subcategory</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/items"><i class="fa fa-list-alt"></i>
								<span>Product List</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/employeeCreation"><i
								class="fa fa-users"></i> <span>Employees</span></a></li>
						<li class="nav-item nav-dropdown"><a
							class="nav-link nav-dropdown-toggle" href="#"><i
								class="fa fa-list"></i> <span>Reports</span></a>
							<ul class="nav-dropdown-items">
								<li class="nav-item"><a class="nav-link"
									href="${baseurl }/admin/reportAllOrdersPage"><i
										class="fa fa-clone" aria-hidden="true"></i><span>All
											Orders</span></a></li>
								<li class="nav-item"><a class="nav-link"
									href="${baseurl }/admin/reportPendingOrders"><i
										class="fa fa-clone" aria-hidden="true"></i> <span>Pending
											Orders</span></a></li>
								<li class="nav-item"><a class="nav-link"
									href="${baseurl }/admin/reportPartiallyDeliveredOrders"><i
										class="fa fa-clone" aria-hidden="true"></i> <span>Partially
											Delivered Orders</span></a></li>
								<li class="nav-item"><a class="nav-link"
									href="${baseurl }/admin/reportDeliveredOrders"> <i
										class="fa fa-clone" aria-hidden="true"></i><span>Delivered
											Orders</span></a></li>
							</ul></li>
					</c:if>
					<c:if test="${roleId=='2' }">
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/dashboardfordealerwise"><i
								class="fa fa-users"></i> <span>Dashboard</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/producttype"><i class="fa fa-clone"></i>
								<span>Product Category</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/productName"><i
								class="fa fa-bookmark"></i> <span>Product Subcategory</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/items"><i class="fa fa-list-alt"></i><span>Product
									List</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/dealercreation"> <i
								class="fa fa-user-secret"></i><span>Dealer Creation </span></a></li>
						
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/managerOrderplaceNew"><i
								class="fa fa-clipboard"></i><span>Order Product</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${baseurl }/admin/orderslist"><i class="fa fa-clipboard"></i><span>Delivery Status</span></a></li>
							<li class="nav-item"><a class="nav-link" href="${baseurl }/admin/dealerpaymentconfirm"><i class="fa fa-bolt"></i><span>Confirm Payments </span></a></li>
						<li class="nav-item nav-dropdown"><a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-list"></i> <span>Reports</span></a>
							<ul class="nav-dropdown-items">
								<li class="nav-item"><a class="nav-link"
									href="${baseurl }/admin/reportAllOrdersPage"><i
										class="fa fa-clone" aria-hidden="true"></i><span>All
											Orders</span></a></li>
								<li class="nav-item"><a class="nav-link"
									href="${baseurl }/admin/reportPendingOrders"><i
										class="fa fa-clone" aria-hidden="true"></i> <span>Pending
											Orders</span></a></li>
								<li class="nav-item"><a class="nav-link"
									href="${baseurl }/admin/reportPartiallyDeliveredOrders"><i
										class="fa fa-clone" aria-hidden="true"></i> <span>Partially
											Delivered Orders</span></a></li>
											<li class="nav-item"><a class="nav-link"
									href="${baseurl }/admin/reportDeliveredOrders"><i class="fa fa-clone" aria-hidden="true"></i> <span>Delivered Orders</span></a></li>
							</ul></li>
					</c:if>
					<c:if test="${roleId=='3' }">
					<li class="nav-item dashboard"><a class="nav-link" href="${baseurl }/admin/dashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
			  <li class="nav-item  delarpayment"><a class="nav-link" href="${baseurl }/admin/delarpayment"> <i class="fa fa-bookmark"></i><span>Payment Information</span></a></li>
			  <li class="nav-item "><a class="nav-link" href="${baseurl }/admin/orderplacing"><i class="fa fa-clipboard"></i> <span>Order Product</span></a></li>
			   <li class="nav-item ordersList"><a class="nav-link" href="${baseurl }/admin/myorderLists"><i class="fa fa-first-order"></i><span>My Orders</span></a></li>
					</c:if>
				</ul>
			</nav>
			<button class="sidebar-minimizer brand-minimizer" type="button"></button>
		</div>
		<!-- Main content -->
		<main class="main"> <!-- Breadcrumb --> <!-- /.conainer-fluid -->