<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Intuit Discounts - About</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>


    <title>About Intuit Discounts</title>


	 <style type="text/css">

      .form-signin {
        max-width: 350px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
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

<div class="hero-unit" align="center">
        <h2 align="center">Spark Lessons</h2>
        <p> We help you achieve whatever you are passionate about by handling Payments!</p>
        <p></p>
      </div>
	

	<div class="container" >
		<section class="row team">
	    <h2 class="span2 offset1">Our team</h2>
	       <div class="span2 offset1" style="padding-right: 70px;">
	          <img src="${pageContext.servletContext.contextPath}/resources/img/asim.png" width="170" height="170">
	          <h3>Asim Khaja</h3>
	          <p><span>Founder &amp; Platforms</span> <a href="#" class="light" target="_blank">@asimkhaja</a></p>
	      </div>
	      <div class="span2">
	          <img src="${pageContext.servletContext.contextPath}/resources/img/harish.png" width="170" height="170">
	          <h3>Harish Raghavendra</h3>
	          <p><span>Founder &amp; Interactions</span> <a href="#" class="light" target="_blank">@harishraghavendra</a></p>
	      </div>
	      <div class="span2 offset1">
	          <img src="${pageContext.servletContext.contextPath}/resources/img/mario.png" width="170" height="170">
	          <h3>Mario Abundis</h3>
	          <p><span>Founder &amp; Social</span> <a href="#" class="light" target="_blank">@marioabundis</a></p>
	      </div>
	    
	  </section>
		
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
