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

      <script>
          // Include the UserVoice JavaScript SDK (only needed once on a page)
          UserVoice=window.UserVoice||[];(function(){var uv=document.createElement('script');uv.type='text/javascript';uv.async=true;uv.src='//widget.uservoice.com/hDXMCXE9szAs6InjaMFnBA.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(uv,s)})();

          //
          // UserVoice Javascript SDK developer documentation:
          // https://www.uservoice.com/o/javascript-sdk
          //

          // Set colors
          UserVoice.push(['set', {
              accent_color: '#448dd6',
              trigger_color: 'white',
              trigger_background_color: '#448dd6'
          }]);

          // Identify the user and pass traits
          // To enable, replace sample data with actual user traits and uncomment the line
          UserVoice.push(['identify', {
              //email:      'john.doe@example.com', // User’s email address
              //name:       'John Doe', // User’s real name
              //created_at: 1364406966, // Unix timestamp for the date the user signed up
              //id:         123, // Optional: Unique id of the user (if set, this should not change)
              //type:       'Owner', // Optional: segment your users by type
              //account: {
              //  id:           123, // Optional: associate multiple users with a single account
              //  name:         'Acme, Co.', // Account name
              //  created_at:   1364406966, // Unix timestamp for the date the account was created
              //  monthly_rate: 9.99, // Decimal; monthly rate of the account
              //  ltv:          1495.00, // Decimal; lifetime value of the account
              //  plan:         'Enhanced' // Plan name for the account
              //}
          }]);

          // Add default trigger to the bottom-right corner of the window:
          UserVoice.push(['addTrigger', { mode: 'satisfaction', trigger_position: 'bottom-right' }]);

          // Or, use your own custom trigger:
          //UserVoice.push(['addTrigger', '#id', { mode: 'satisfaction' }]);

          // Autoprompt for Satisfaction and SmartVote (only displayed under certain conditions)
          UserVoice.push(['autoprompt', {}]);
      </script>

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
        max-width: 300px;
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

<div class="container-fluid">
  <div class="row-fluid">
	<form name="couponForm" class="form-signin">
		<img src="${pageContext.servletContext.contextPath}/resources/img/barcode-big.jpeg" alt="Image Intuit"/>
	</form>
  </div>
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
