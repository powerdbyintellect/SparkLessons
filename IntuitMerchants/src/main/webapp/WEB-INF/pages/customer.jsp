<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Intuit Discounts</title>
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
              <li class="active"><a href="${pageContext.servletContext.contextPath}/">Home</a></li>
              <li><a href="${pageContext.servletContext.contextPath}/about">About</a></li>
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

	<form name="barcodeform" action="couponSearch" method="post"  class="form-signin">
	    <h3>Save now with great Deals</h3>
	   		<input type="text" size="20" name="merchantname" class="input-block-level" placeholder="Merchant Name" value="${couponInfo.merchantname}"/> 
	        <input type="submit" class="btn btn-primary btn-large" value="Search Coupons Now">
	</form>

   <hr>

	<h4>Small Business Results</h4>

	<div class="table-container">
	      <table id="table1" class="table table-hover table-striped">
	    	<thead>
	    	<tr>
		    	<th>Business Name </th>
		    	<th>Coupon Code</th>
				<th>Coupon Expiration</th>    	
				<th>Bar Code</th>
				<th>Coupon Details</th>
			</tr>
			</thead>
			<tbody>
	        <c:forEach var="coupon" items='${couponList}'>
	            <tr>
	                <td>
	                    <c:out value="${coupon.merchantname}"></c:out>
	                </td>
	                <td>
	                   <c:out value="${coupon.couponcode}"></c:out>
	                </td>
	                <td>
	                    <c:out value="${coupon.expirationdate}"></c:out>
	                </td>
	                <td>
	            		<a class="btn" onclick="window.open('barcode', 'newwindow', 'width=400, height=400'); return false;" href="${pageContext.servletContext.contextPath}/barcode" target="_blank">
	            		<img width="30" height="30" src="${pageContext.servletContext.contextPath}/resources/img/barcode.png" alt="Image Intuit"/></a>
	                </td>
	                <td>
	                    <p>Spend $<c:out value="${coupon.mintransactionamount}"></c:out> and get <c:out value="${coupon.discountpercent}"></c:out>% off your order</p>
	                </td>
	            </tr>
	        </c:forEach>
	        </tbody>
	    </table>
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
