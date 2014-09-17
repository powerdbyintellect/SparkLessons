<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Contact Us - Spark Lessons</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/nav.css">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>

  <style>
@import url(http://fonts.googleapis.com/css?family=Roboto+Slab:300|Roboto|Allura);

body{
  background: #EEE;
}
body, input{
  font-family: "Roboto";
  font-size: 1em;
}
h1, .credit{
  font-family: "Roboto Slab";
}</style>

</head>
<body>
<%@ include file="header.jsp"%>
	<div align="center" >
        <h4 align="center">Contact Our Awesome Team!!!</h4>
        <p> We help you achieve whatever you are passionate about by handling Payments!</p>
      </div>
	
	<div class="container" align="center">
	       <div class="span2 offset1">
	          <img src="${pageContext.servletContext.contextPath}/resources/img/asim.png" width="170" height="170">
	          <h3>Asim Khaja</h3>
	          <p><span>Founder &amp; Platforms</span> <a href="#" class="light" target="_blank">@asimkhaja</a></p>
	      </div>
	      <div class="span2 offset1">
	          <img src="${pageContext.servletContext.contextPath}/resources/img/harish.png" width="170" height="170">
	          <h3>Harish Raghavendra</h3>
	          <p><span>Founder &amp; Interactions</span> <a href="#" class="light" target="_blank">@harishraghavendra</a></p>
	      </div>
	      <div class="span2 offset1">
	          <img src="${pageContext.servletContext.contextPath}/resources/img/mario.png" width="170" height="170">
	          <h3>Mario Abundis</h3>
	          <p><span>Founder &amp; Social</span> <a href="#" class="light" target="_blank">@marioabundis</a></p>
	      </div>
	</div>
     <%@ include file="footer.jsp" %>
</div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.js"></script>
</body>
</html>
