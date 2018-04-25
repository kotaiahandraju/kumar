<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exception Messages</title>
</head>
<body>
<!-- Google Tag Manager -->

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-63399103-1', 'auto');
  ga('send', 'pageview');

</script>
<!-- End Google Tag Manager -->

	<c:if test="${not empty errCode}">
		<h2 style="color: red">${errCode} : System Errors</h2>
	</c:if>

	<c:if test="${empty errCode}">
		<h2 style="color: red">System Errors</h2>
		<br />
	</c:if>

	<c:if test="${not empty errMsg}">
		<h4>${name}</h4>
		<br />
		<%-- <h4>${errMsg}</h4> --%>
	</c:if>
</body>
</html>