
<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>

<!-- Footer Starts Here -->
		</div> <!-- #wrap -->
	</div> <!-- page-content -->
    <footer role="contentinfo">
        <div class="clearfix">
            <ul class="list-unstyled list-inline pull-left">
                <li>CHARVIKENT.COM</li>
            </ul>
            <button class="pull-right btn btn-inverse-alt btn-xs hidden-print" id="back-to-top"><i class="fa fa-arrow-up"></i></button>
        </div>
    </footer>
</div> <!-- page-container -->
 
<script type='text/javascript' src='${baseurl }/assets/js/jqueryui-1.10.3.min.js'></script> 



<script type='text/javascript' src='${baseurl }/assets/js/bootstrap.min.js'></script>  
<script type='text/javascript' src='${baseurl }/assets/js/enquire.js'></script>  
<script type='text/javascript' src='${baseurl }/assets/js/jquery.cookie.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/js/jquery.nicescroll.min.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/plugins/codeprettifier/prettify.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/plugins/easypiechart/jquery.easypiechart.min.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/plugins/sparklines/jquery.sparklines.min.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/plugins/form-toggle/toggle.min.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/plugins/datatables/jquery.dataTables.min.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/plugins/datatables/dataTables.bootstrap.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/demo/demo-datatables.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/js/placeholdr.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/js/application.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/demo/demo.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/plugins/charts-morrisjs/raphael.min.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/plugins/charts-morrisjs/morris.min.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/demo/demo-morrisjs.js'></script> 

<script type='text/javascript' src='${baseurl }/js/customValidation.js'></script> 

<script type='text/javascript' src="${baseurl }/js/select2.min.js" ></script>


	
<script type="text/javascript">
var isClick = 'Yes';

</script>
</body>
</html>