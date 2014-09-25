
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Spark Lessons</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Spark Lessons, Payments">
    <meta name="author" content="Asim Khaja">

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


	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript">
 $(function() {
		/* For zebra striping */
        $("table tr:nth-child(odd)").addClass("odd-row");
		/* For cell text alignment */
		$("table td:first-child, table th:first-child").addClass("first");
		/* For removing the last border */
		$("table td:last-child, table th:last-child").addClass("last");
});
</script>

<style type="text/css">
	
	/*
	Pretty Table Styling
	CSS Tricks also has a nice writeup: http://css-tricks.com/feature-table-design/
	*/
	
	table {
		overflow:hidden;
		border:1px solid #d3d3d3;
		background:#fefefe;
		width:45%;
		margin:5% auto 0;
		-moz-border-radius:5px; /* FF1+ */
		-webkit-border-radius:5px; /* Saf3-4 */
		border-radius:5px;
		-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
		-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
	}
	
	th, td {padding:18px 28px 18px; text-align:center; }
	
	th {padding-top:22px; text-shadow: 1px 1px 1px #fff; background:#e8eaeb;}
	
	td {border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0;}
	
	tr.odd-row td {background:#f6f6f6;}
	
	td.first, th.first {text-align:left}
	
	td.last {border-right:none;}
	
	/*
	Background gradients are completely unnecessary but a neat effect.
	*/
	
	td {
		background: -moz-linear-gradient(100% 25% 90deg, #fefefe, #f9f9f9);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f9f9f9), to(#fefefe));
	}
	
	tr.odd-row td {
		background: -moz-linear-gradient(100% 25% 90deg, #f6f6f6, #f1f1f1);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f1f1f1), to(#f6f6f6));
	}
	
	th {
		background: -moz-linear-gradient(100% 20% 90deg, #e8eaeb, #ededed);
		background: -webkit-gradient(linear, 0% 0%, 0% 20%, from(#ededed), to(#e8eaeb));
	}
	
	/*
	I know this is annoying, but we need additional styling so webkit will recognize rounded corners on background elements.
	Nice write up of this issue: http://www.onenaught.com/posts/266/css-inner-elements-breaking-border-radius
	
	And, since we've applied the background colors to td/th element because of IE, Gecko browsers also need it.
	*/
	
	tr:first-child th.first {
		-moz-border-radius-topleft:5px;
		-webkit-border-top-left-radius:5px; /* Saf3-4 */
	}
	
	tr:first-child th.last {
		-moz-border-radius-topright:5px;
		-webkit-border-top-right-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.first {
		-moz-border-radius-bottomleft:5px;
		-webkit-border-bottom-left-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.last {
		-moz-border-radius-bottomright:5px;
		-webkit-border-bottom-right-radius:5px; /* Saf3-4 */
	}

</style>


  </head>

  <body>
   
   	<h1 align="center">Spark Lessons - Payment Confirmed!</h1>
   	<p align="center">You are all set. You'll see cha-ching in your bank soon.</p>
<%--  <div class="container">
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span2">
      <!--Sidebar content-->
    </div>
    <div align="center" >
    	<table width="300px">
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
 --%>

<div id="content">
    <table cellspacing="0">
    <tr><th>Transaction Details</th><th>Summary</th></tr>
    <tr><td>Merchant Account Number</td><td>${creditCardResponse.merchantAccountNumber}</td></tr>
    <tr><td>Transaction Identifier</td><td>${creditCardResponse.creditCardTransID}</td></tr>
    <tr><td>Payment Status</td><td>${creditCardResponse.paymentStatus}</td></tr>
    <tr><td>Authorization Time </td><td>${creditCardResponse.transAuthorizationTime}</td></tr>
    <tr><td>Authorization Code </td><td>${creditCardResponse.authorizationCode} </td></tr>
    <tr><td>Authorization Amount </td><td>${amount}</td></tr>
    </table>
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

<div align="center" style="padding-top: 40px; padding-bottom: 20px; ">
	<hr/>
	 <p>&copy; Intuit 2014</p>
	 <a style="text-decoration: none;" href="${pageContext.servletContext.contextPath}"><b>Home</b></a> &nbsp;|&nbsp; 
	 <a href="${pageContext.servletContext.contextPath}/about"><b>About</b></a>&nbsp;|&nbsp;
	 <a style="text-decoration: none;" href="${pageContext.servletContext.contextPath}/contact"><b>Contact</b></a>&nbsp;
  </div>
</html>
