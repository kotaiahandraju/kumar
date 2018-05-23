<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>KPOMS</title>
    <link rel="shortcut icon" href="img/logo1.jpeg"/> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="assets/css/styles.css">
<!--     <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'> -->
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
    <!--[if lt IE 9]>
        <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
    <![endif]-->

    <!-- The following CSS are included as plugins and can be removed if unused-->

<link rel='stylesheet' type='text/css' href='assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='assets/plugins/form-toggle/toggles.css' /> 
<link rel='stylesheet' type='text/css' href='assets/plugins/datatables/dataTables.css' />

<style type="text/css">
.loghead {
padding:5px;
background:#293f4b;
height:auto;
left:0;
right:0;
position:fixed;
z-index:1;
}
.plogin  {
    margin-top: 10px !important;
    box-shadow: inset 0 0 0 1px rgba(255,255,255,0.7), inset 0 0 0 2px rgba(0,0,0,0), inset 0 0 0 3px rgba(0,0,0,0);
    background-color: rgba(0,0,0,0);
    border: 1px solid transparent;
    border-radius: 2px;
    box-sizing: border-box;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    font-size: 15px;
    font-weight: 600;
    height: 32px;
    line-height: 26px;
    overflow: hidden;
    outline-width: 1px;
    padding: 0;
    position: relative;
    text-align: center;
    text-decoration: none;
    transition-duration: 167ms;
    transition-property: background-color, box-shadow, color;
    transition-timing-function: cubic-bezier(0, 0, 0.2, 1);
    vertical-align: middle;
    z-index: 0;
    float:right;
}
.plogin a {
color:#fff !important;
padding:5px 15px;
list-style:none;
text-decoration:none;
}
.lfotter {
position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    background-color: #293f4b;
    color: white;
    text-align: center;
    padding:5px;
}
.oms {
color:#fff;
font-size:24px;
}
.lis {
list-style:none;
text-decoration:none !important;
}
.pb {
    background: rgba(255,255,255,0.7) !important;
    padding: 30px 40px !important;
}
.alert-success, .alert-warning, .alert-danger{color: white !important;}
.alert-success{background-color: #4CAF50 !important;}
.alert-warning{background-color: #ff6600 !important;}
.alert-danger{background-color: #d43f3a !important;}

.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}
@media only screen and (max-width: 640px) and (min-width: 320px) {
.loghead { 
position:absolute;
}
focusedform .lfotter {
position:relative;
}

.oms {
font-size:12px;
}
.pb h4 {
font-size:18px !important;
}
.focusedform .verticalcenter {
margin-top:0px;
top:27%;
left:50%;
}
}
@media only screen and (min-width:600px) and (max-width:640px){ 
.focusedform .verticalcenter {
margin-top:0px;
top:47%;
left:50%;
}
.oms {
font-size:11px;
}
focusedform .lfotter {
position:relative;
}
}
</style>

<script type='text/javascript' src='assets/js/jquery-1.10.2.min.js'></script>
<script type="text/javascript">
window.setTimeout(function() {
    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 5000);
</script>

</head>

<body class="focusedform">
<div class="col-md-12 loghead">
  <div class="col-md-6 col-xs-6">
 <img  src="img/klogo1.png"/><span class="oms">Order Management System</span>
 </div>
 <div class="col-md-6 col-xs-4 pull-right">
 <!-- <p class="plogin" align="right"><a href="dealerregistration">Join Now </a></p> -->
 </div>
</div>
<div class="clearfix"></div>
<div class="verticalcenter">
<!-- 	<h1 align="center">KHAIBAR GAS</h1> -->
	<div class="panel panel-primary">
<!-- <div><img src="assets/img/logo.png" class="img-responsive"></div> -->
		<form name='loginForm' action="loginAction" method='POST' class="form-horizontal" style="margin-bottom: 0px !important;">
		<div class="panel-body pb">
			<h4 class="text-center" style="margin-bottom: 25px; color:#006699 ; font-size:25px;">Order Management System</h4>
			<c:if test="${not empty msg}">
				<div class="col-sm-12" style="margin-bottom: -1.3em;">
					<div class="form-group">
						<div class="msgcss fadeIn animated alert alert-danger" style="text-align: center;">${msg}</div>
					</div>
				</div>
			</c:if>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
						<input type="text" class="form-control validate" name="userName" id="username" placeholder="Username">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<input type="password" class="form-control validate" name="password" id="password" placeholder="Password">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					
							<input type="submit" value="Login" id="submit1" class="btn btn-primary form-control" style="width:100%;">
							
				</div>
			</div>
			<div align="center"><span><a class="lis" href="forgetpassword">Forgot Password? </a></span><br>
		<!-- <span><a class="lis" href="dealerregistration"><span style="color:#000;">Not a Register?</span> Join Now </a></span> -->
		</div>
			<!-- <div class="clearfix">
				<div class="pull-right"><label><input type="checkbox" style="margin-bottom: -5px;"> Remember Me</label></div>
			</div> -->
		</div>
		<!-- <div class="panel-footer pb">
		
		
=======
		<div class="panel-footer">
		<span><a href="dealerregistration">Sign Up </a></span>
		<span><a href="">Forget Password </a></span>
>>>>>>> fc79d166cef53ee6e532ccfc9464b7c27dcc636e
			<div class="pull-right">
				<input type="reset" value="Reset" class="btn btn-default cancel"/>
				<input type="submit" value="Login" id="submit1" class="btn btn-primary">
			</div> 
		</div>-->
		</form>
	</div>
</div>
<div class="clearfix"></div>
<div class="lfotter ">
<p> All Rights Reserved </p>
</div>
<script type='text/javascript' src='js/customValidation.js'></script> 
</body>
</html>