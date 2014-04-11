
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Spark Lessons</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Spark Lessons, Payments">
    <meta name="author" content="Asim Khaja">

    <!-- Le styles -->
    <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/resources/img/favicon.ico" />
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
     <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap-responsive.min.css" rel="stylesheet">
 	<link href="${pageContext.servletContext.contextPath}/resources/css/tiles.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/skeuocard.reset.css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/skeuocard.css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/demo.css">
    <script src="${pageContext.servletContext.contextPath}/resources/js/vendor/cssua.min.js"></script>
     

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->


  </head>

  <body>
   
   	<h1 align="center">Spark Lessons - Payment Confirmed!</h1>
   	<p align="center">You are all set. You'll see cha-ching in your bank soon.</p>
 <div class="container">
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span2">
      <!--Sidebar content-->
    </div>
    <div class="couponForm" align="center" class="form-signin">
    	<table width="500px">
        <tr><td><b> Merchant Account Number : </b> </td> <td> ${creditCardResponse.merchantAccountNumber} </td></tr>
        <tr><td><b> Transaction Identifier  : </b> </td> <td> ${creditCardResponse.creditCardTransID}</td></tr>
        <tr><td><b> Payment Status  		: </b> </td> <td> ${creditCardResponse.paymentStatus} </td></tr>
        <tr><td><b> Transaction Auth Time   : </b> </td> <td> ${creditCardResponse.transAuthorizationTime}</td></tr>
        <tr><td><b> Authorization Code      : </b>  </td> <td>${creditCardResponse.authorizationCode} </td></tr>
        <tr><td><b> Authorization Amount    : </b> </td> <td> <b>${amount}  </b></td></tr>
        </table>
    </div>
  </div>
</div>
</div>
<div align="center">
	<a style="text-decoration: none;" href="${pageContext.servletContext.contextPath}"><b>Home</b></a> 
</div>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
  <script src='http://stripe.github.io/jquery.payment/lib/jquery.payment.js'></script>

  <script src="${pageContext.servletContext.contextPath}/resources/js/index.js"></script>
    
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
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-min.js"></script>
</body>
<%@ include file="footer.jsp" %>
  
</html>
