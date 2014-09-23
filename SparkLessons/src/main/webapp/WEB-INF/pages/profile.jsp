<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Spark Lessons - Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/css/datepicker.css" rel="stylesheet">
     <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
     <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap-responsive.min.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/tiles.css" rel="stylesheet">
 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/nav.css">
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

<%@ include file="header.jsp"%>

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

 <tag:notloggedin>
	<div align="center" style="padding-top: 30px;">
     <a href="signin"><img src="${pageContext.servletContext.contextPath}/resources/img/fbloginbutton.png" alt="Login with Facebook"></a>
	</div> 
</tag:notloggedin>
<%--  <tag:loggedin>
     <h3 align="center">Welcome to Spark Lessons ${facebook.name}</h3>
 </tag:loggedin> --%>


<form:form modelAttribute="user" action="updateprofile" enctype="multipart/form-data">
	<form:hidden path="id"/>
    <h4 align="center">Profile </h4>
    <div class="form-signup">
    	<form:label path="firstname">First Name</form:label>
    	<form:input path="firstname" class="input-block-level"/>
    </div>
    <div class="form-signup">
    	<form:label path="email">Email Address</form:label>
    	<form:input path="email" class="input-block-level"/>
    </div>
    <div class="form-signup">
    	<form:label path="description">Description</form:label>
    	<form:textarea path="description" class="input-block-level"/>
    </div>
    <div class="form-signup">
    	<form:label path="rate">Rate</form:label>
    	<form:input path="rate" class="input-block-level"/>
    </div>
    <div class="form-signup">
	    <label for="exampleInputFile">File input</label>
	    <input type="file" name="file" class="input-block-level"/>
	    <p class="help-block">Upload your profile image.</p>
    </div>
    <div align="center"><input type="submit" class="btn btn-primary btn-large" style="" align="middle" value="Update Profile"/></div>
</form:form>



    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-transition.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-alert.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-modal.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-dropdown.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-scrollspy.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-tab.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-tooltip.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-popover.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-button.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-collapse.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-carousel.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-typeahead.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-datepicker.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-min.js"></script>
</div>
</body>
<%@ include file="footer.jsp" %>


</html>
