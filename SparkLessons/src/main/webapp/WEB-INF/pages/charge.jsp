
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

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
  </head>

  <body>
  <h1 align="center">Spark Lessons</h1>
   
   <div>MerchantAccountNumber Processed: ${creditCardResponse.merchantAccountNumber}</div>
   <div>tid: ${creditCardResponse.creditCardTransID}</div>
   <div>paymentStatus: ${creditCardResponse.paymentStatus}</div>
   <div>transAuthorizationTime: ${creditCardResponse.transAuthorizationTime}</div>
   <div>authorizationCode: ${creditCardResponse.authorizationCode}</div>
   

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
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-min.js"></script>

  </body>
</html>
