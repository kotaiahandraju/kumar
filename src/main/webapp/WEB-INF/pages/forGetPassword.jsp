<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>KPOMS</title>
   <!-- <link rel="shortcut icon" href="img/logo.jpeg"/>-->
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
top:0;
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
    right:0;
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
.forgotp {
padding:50px;
margin:0 150px;
}
.forgotp h1 {
font-size: 32px;
    line-height: 40px;
    font-weight: 400;
    color: rgba(0,0,0,0.9);
    padding: 32px 0 8px;
    font-weight: 400;
}
.forgote {
padding-left:0px;
padding-right:0px;
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
.forgotp {
padding:17px !important;
margin:0px !important;
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
.forgotp {
padding:25px !imporatnt;
margin:0px !important;
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

<body>
<div class="col-md-12 loghead">
  <div class="col-md-6">
 <img  src="img/klogo1.png"/><span class="oms">Order Management System</span>
 </div>
 <div class="col-md-6 pull-right">
 <p class="plogin" align="right"><a href="LoginHome">Sign In </a></p>
 </div>
</div>
<div class="clearfix"></div>
<div class="container forgotp">
<form  action="forgepasssword"  class="form-horizontal" method="post" >
<h1>Let's find your account</h1>
<h4>Enter your Mobile number</h4>
<span id="errorMsg"> </span>
<!-- <p>Mobile Number *</p> -->
<div class="form-group">
					<div class="col-md-3 forgote">
						<input type="text" class="form-control validate mobile" id="phoneNumber" name="phoneNumber"  maxlength="10" placeholder="Mobile Number" />
					</div>
				
			</div>
<div class="clearfix"></div>
<div class=""><br>
<input type="submit" id="submit1" value="Submit" class="btn btn-primary">
</div>
</form>
</div>
<div class="clearfix"></div>
<div class="lfotter ">
<p> All Rights Reserved </p>
</div>
<script type='text/javascript' src='js/customValidation.js'></script> 
</body>
<script type="text/javascript">

$('#phoneNumber').blur(function() {
	
	
	
	
	var phoneNumber=$(this).val();
	
	//alert(phoneNumber.length);
	
	  if( phoneNumber.length == 10)
		  {
		  mobilevalidation =true;
		  }
	 else
	  
	{
		
		  $('#phoneNumber').css('border-color', 'red');
		 $('#errorMsg').text( "* Enter Valid Mobile Number ") ;
		 $('#errorMsg').css('color','red');
			setTimeout(function() { $("#errorMsg").text(''); }, 3000);
		 mobilevalidation =false;
		  
	}

		}); 
		
</script>


</html>

