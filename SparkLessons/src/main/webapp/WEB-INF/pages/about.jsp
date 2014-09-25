<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Spark Lessons - About</title>
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
