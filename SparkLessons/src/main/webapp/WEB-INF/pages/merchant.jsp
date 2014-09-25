<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
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

<form name="couponForm" action="couponGenerate" method="post"  class="form-signin">
    <h3>Generate Discount Coupons </h3>
   		<input type="text" size="20" name="merchantname" class="input-block-level" placeholder="Merchant Name" value="${couponInfo.merchantname}"/> 
        <input type="text" size="20" name="merchantaccount"  value="${couponInfo.merchantaccount}" class="input-block-level" placeholder="Merchant Account"/>
        <input type="text" size="20" name="mintransactionamount"  value="${couponInfo.mintransactionamount}" class="input-block-level" placeholder="Minimum Transaction Amount"/>
        <input type="text" size="20" name="discountpercent"  value="${couponInfo.discountpercent}" class="input-block-level" placeholder="Percentage Discount"/>
		<input type="text" name="startdate" id="dpd1" value="${couponInfo.startdate}" class="input-block-level" placeholder="Start Date">
        <input type="text" name="expirationdate" id="dpd2" value="${couponInfo.expirationdate}" class="input-block-level" placeholder="Expiration Date"/>
        <input type="text" size="20" name="couponcount"  value="${couponInfo.couponcount}" class="input-block-level" placeholder="Coupon Count"/>
        <input type="submit" class="btn btn-primary btn-large" value="Generate Now">
</form>


   <hr>

<h4>Small Business Coupons</h4>

<div class="table-container">
      <table id="table1" class="table table-hover table-striped">
    	<thead>
    	<tr>
	    	<th>Business Name </th>
	    	<th>Coupon Code</th>
	    	<th>Start Date</th>
			<th>Coupon Expiration</th>
	    	<th>Number of Coupons</th>	    
	    	<th>Minimum Amount</th>	
	    	<th>Discount Percentage</th>
		</tr>
		</thead>
		<tbody>
        <c:forEach var="result" items='${couponList}'>
            <tr>
                 <td>
                    <c:out value="${result.merchantname}"></c:out>
                </td>
                <td>
                    <c:out value="${result.couponcode}"></c:out>
                </td>
                 <td>
                    <c:out value="${result.startdate}"></c:out>
                </td>
                <td>
                    <c:out value="${result.expirationdate}"></c:out>
                </td>
                <td>
                    <c:out value="${result.couponcount}"></c:out>
                </td>
                 <td>
                    <c:out value="${result.mintransactionamount}"></c:out>
                </td>
                  <td>
                    <c:out value="${result.discountpercent}"></c:out>%
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
