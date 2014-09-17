<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Spark Lessons - About</title>
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


    <title>About Us</title>

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


<div align="center">
        <h4 align="center">About Us!</h4>
        <p> We help you achieve whatever you are passionate about by handling Payments!</p>
      </div>


<div class="container">
 <div class="span16">
 <table align="center"> <tr align="center">
	 <div class="flex-video widescreen" style="margin: 0 auto;text-align:center;padding-left:50px;">
 	<iframe align="middle" style="padding-left:20px;" allowfullscreen="" src="http://www.powtoon.com/embed/geO7d9eJtdA/" frameborder="0" width="750" height="441"></iframe>
 	 </div> </tr>
	 </table> 
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
