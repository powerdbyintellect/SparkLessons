<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Spark Lessons</title>
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

    <title>Search Nearby</title>


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
	<div align="center">
     <a href="signin"><img src="${pageContext.servletContext.contextPath}/resources/img/fbloginbutton.png" alt="Login with Facebook"></a>
	</div> 
</tag:notloggedin>
 <tag:loggedin>
     <h3 align="center">Welcome to Spark Lessons ${facebook.name}</h3>
 </tag:loggedin>


<form name="couponForm" action="addCustomer" method="post"  class="form-signin">
    <h3>Activate Merchant Account </h3>
    <input type="text" size="20" name="firstname"  value="${customer.firstname}" class="input-block-level" placeholder="Firstname"/>
    <input type="text" size="20" name="lastname"  value="${customer.lastname}" class="input-block-level" placeholder="Lastname"/>
    <input type="text" size="20" name="username"  value="${customer.dbaName}" class="input-block-level" placeholder="username"/>
    <input type="text" size="20" name="email"  value="${customer.email}" class="input-block-level" placeholder="email"/>
    <input type="text" size="20" name="ssn"  value="${customer.ssn}" class="input-block-level" placeholder="Social Security"/>
    <input type="text" size="20" name="dob"  value="${customer.dob}" class="input-block-level" placeholder="Date Of Birth"/>
    <input type="text" size="20" name="streetAddress1"  value="${address.streetAddress1}" class="input-block-level" placeholder="Address 1"/>
    <input type="text" size="20" name="streetAddress2"  value="${address.streetAddress2}" class="input-block-level" placeholder="Address 2"/>
    <input type="text" size="20" name="city"  value="${address.city}" class="input-block-level" placeholder="City"/>
    <input type="text" size="20" name="state"  value="${address.state}" class="input-block-level" placeholder="State"/>
    <input type="text" size="20" name="zipCode"  value="${address.zipCode}" class="input-block-level" placeholder="Zipcode"/>
        <input type="submit" class="btn btn-primary btn-large" value="Activate Now">
</form>


   <hr>

      <footer>
        <p>&copy; Intuit 2014</p>
      </footer>

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
</html>
