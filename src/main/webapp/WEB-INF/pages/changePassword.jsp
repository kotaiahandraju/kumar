<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
    <div class="clearfix"></div>
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li>Change Password</li>
	</ol>
	<div class="clearfix"></div>
<!-- Body starts here -->
	<!-- <div class="main-content"> -->
		<div class="main-content-inner">
       <div class="clearfix"></div>
		<br><br>
		<div class="col-md-12 col-xs-12">	
					<div class="col-md-12">
					<div class="panel panel-primary">
					<div class="panel-heading">
						<h4><i class="fa  fas fa-key "> Change Password</i>	</h4>
						<div class="options">
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					
					<div class="page-body">
					<div align="center"><span id="errorMsg" style="color:red; text-align:center;"></span></div> 
							<form action="changePassword" class="form-horizontal" method="Post"  >
							          
							           
										<div class="col-md-6">
											<div class="form-group" id="passwordDiv">
												<label class="col-md-5 control-label no-padding-right">Current	Password<span class="impColor">*</span></label>
												<div class="col-md-5">
													<input type ="password"	name="password" id="password" class="form-control validate " placeholder="Enter Password" />
												</div>
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group" id="passwordDiv">
												<label class="col-md-5 control-label no-padding-right">New Password<span class="impColor">*</span></label>
												<div class="col-md-5">
													<input type ="password"	name="npassword" id="npassword" class="form-control validate"	placeholder="Enter  New Password" />
												</div>
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group" id="passwordDiv">
												<label class="col-md-5 control-label no-padding-right">Confirm Password<span class="impColor">*</span></label>
												<div class="col-md-5">
													<input type ="password"	name="cpassword" id="cpassword" class="form-control validate"	placeholder="Re-Enter New Password" />
												</div>
								           
											</div>

										</div>
								
								
								<div class="col-md-12" style="text-align:right;">
								<div class="form-group">
									<div class="col-md-offset-3 col-md-6">
										<input type="submit" id="submit4"  class="btn btn-success"  value="Submit"/>
										<input class="btn-danger btn cancel"  type="reset"  value="Reset" />
									</div>
								</div></div>
								</form>
								</div>
								
								</div>
								
								</div>
					
					</div>
				</div>
				
			</div><div class="clearfix"></div><br>
			<!-- /.page-content -->
		<!-- /.main-content-inner -->
	<!-- /.main-content -->
	
	<!-- /.main-content -->

<!-- Body ends here -->
<script type="text/javascript">


$('#submit4').click(function() {
		var npassword =$('#npassword').val();
		var cpassword =$('#cpassword').val();
		var password =$('#password').val();
		if(password =="" || password== null || password== "undefined")
			{
			$('#password').css('border-color', 'red');
			return false;
			}

		if(npassword =="" || npassword== null || npassword== "undefined")
			{
			$('#npassword').css('border-color', 'red');
			return false;
			}

		if(cpassword =="" || cpassword== null || cpassword== "undefined")
			{
			$('#cpassword').css('border-color', 'red');
			return false;
			} 
		
		
		if(npassword == password)
		{
			$('#errorMsg').text( "* new password must differ from old password") ;
			setTimeout(function() { $("#errorMsg").text(''); }, 3000);
			return false;										
		}
		
		
		if(npassword != cpassword)
			{
				$('#errorMsg').text( "* New and confirm Passwords Must Be Matched") ;
				setTimeout(function() { $("#errorMsg").text(''); }, 3000);
				return false;										
			}
}); 

			
			
	
</script>
