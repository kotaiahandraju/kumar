
<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>
<style>
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background:#ccc;
  color: white;
  cursor: pointer;
  
  border-radius: 4px;
}


</style>

<!-- Footer Starts Here -->
		</div> <!-- #wrap -->
	</div> <!-- page-content -->
    <footer role="contentinfo">
        <div class="clearfix">
            <ul class="list-unstyled list-inline pull-left">
                <li>CHARVIKENT.COM</li>
            </ul>
           <!--  <button class="pull-right btn btn-inverse-alt btn-xs hidden-print" id="back-to-top"><i class="fa fa-arrow-up"></i></button> -->
        </div>
    </footer>
</div> <!-- page-container -->
 <a onclick="topFunction()" id="myBtn" title="Go to top"><i style="font-size:30px;width: 35px;
    text-align: center; color:#006699;" class="fa fa-angle-up	
" aria-hidden="true"></i>
</a>
 
 <script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}
</script>
 
<%--  <script src="${baseurl }/newjs/jquery.min.js"></script> --%>
  <script src="${baseurl }/newjs/popper.min.js"></script>
  <script src="${baseurl }/newjs/bootstrap.min.js"></script>
  <script src="${baseurl }/newjs/pace.min.js"></script>
  <script src="${baseurl }/newjs/Chart.min.js"></script>
  <script src="${baseurl }/newjs/app.js"></script>
<%--   <script src="${baseurl }/newjs/toastr.min.js"></script> --%>
  <script src="${baseurl }/newjs/gauge.min.js"></script>
  <script src="${baseurl }/newjs/moment.min.js"></script>
  <script src="${baseurl }/newjs/daterangepicker.min.js"></script>
  <script src="${baseurl }/newjs/main.js"></script>

</body>

</html>
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
<script type='text/javascript' src='${baseurl }/js/dataTables.fixedColumns.js'></script> 

<%-- <script type='text/javascript' src='${baseurl }/assets/plugins/datatables/dataTables.fixedColumns.min.js'> </script> --%>
<script type='text/javascript' src="${baseurl }/js/select2.min.js" ></script>


	
<script type="text/javascript">
var isClick = 'Yes';

</script>
</body>
</html>