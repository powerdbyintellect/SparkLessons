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

</head>
<body>


 <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="${pageContext.servletContext.contextPath}/">Intuit Discounts</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><a href="${pageContext.servletContext.contextPath}/">Home</a></li>
              <li class="active"><a href="${pageContext.servletContext.contextPath}/about">About</a></li>
              <li><a href="${pageContext.servletContext.contextPath}/contact">Contact</a></li>
            </ul>
            <form class="navbar-form pull-right">
              <input class="span2" type="text" placeholder="Email">
              <input class="span2" type="password" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

 <div class="container">
	<div class="container-fluid">
	  <div class="row-fluid">
	    <div class="span2">
	      <!--Sidebar content-->
	    </div>
	    <div class="span10">
	      <!--Body content-->
	    </div>
	  </div>
	</div>


<div class="hero-unit">
        <h2>We strive to make Small Businesses Successful!</h2>
        <p>Our team is here to make it easy for Small Businesses be visible on Social, Global &amp; Local</p>
        <p></p>
      </div>


<div class="container">
 <div class="span16">
 <table align="center"> <tr align="center">
 <div class="flex-video widescreen" style="margin: 0 auto;text-align:center;">
 	<iframe align="middle" allowfullscreen="" src="http://www.powtoon.com/embed/gcf2H9RL8Iu/" frameborder="0" width="880" height="441"></iframe>
  </div> </tr>
 </table> 
   </div>
   </div>

<br/>
<br/>
<hr/>

	<div class="container" >
		<section class="row team">
	    <h2 class="span2 offset1">Our team</h2>
	      <div class="span2">
	          <img src="${pageContext.servletContext.contextPath}/resources/img/harish.jpeg" width="170" height="170">
	          <h3>Harish Raghavendra</h3>
	          <p><span>Founder &amp; Tech</span> <a href="#" class="light" target="_blank">@harishraghaendra</a></p>
	      </div>
	
	      <div class="span2 offset1">
	          <img src="${pageContext.servletContext.contextPath}/resources/img/mario.jpeg" width="170" height="170">
	          <h3>Mario Abundis</h3>
	          <p><span>Founder &amp; Social</span> <a href="#" class="light" target="_blank">@marioabundis</a></p>
	      </div>
	      
	       <div class="span2 offset1">
	          <img src="${pageContext.servletContext.contextPath}/resources/img/kishore.jpeg" width="170" height="170">
	          <h3>Kishore Chidipudi</h3>
	          <p><span>Founder &amp; Mobile</span> <a href="#" class="light" target="_blank">@kishorechidipudi</a></p>
	      </div>
	  </section>
		
	</div>
	
   <hr>
      <footer>
        <p>&copy; Intuit 2013</p>
      </footer>
</div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.js"></script>


</body>
</html>
