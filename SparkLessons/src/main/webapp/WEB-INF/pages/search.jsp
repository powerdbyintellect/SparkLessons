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

<form name="zipCode" action="sendRequest" method="post"  class="form-signin">
    <h3>Search for Small businesses</h3>
    <table>
        <tr><td>
            </td>
            <td><select name="businessCategory" id="myList" class="input-block-level" placeholder="Select a Business Category from List">
                <option>None</option>
                <option>Retail</option>
                <option>Education</option>
                <option>Office-based Healthcare</option>
                <option>Supermarket</option>
                <option>Mail Order & Internet</option>
                <option>Restaurant</option>
                <option>Travel & Transportation</option>
                <option>Lodging</option>
                <option>Fast Food Restaurant</option>
                <option>Services, Wholesale & All Other</option>
                <option>Independent Gas Stations</option>
                <option>Telecommunications</option>
                <option>Telecommunications Cable/Computer Network</option>
            </select>
            </td></tr>
        <tr><td> </td> <td> <input type="text" size="20" name="city" class="input-block-level" placeholder="City Name" value="${locationSearch.city}"> 
        <input type="text" size="2" name="state"  value="${locationSearch.state}" class="input-block-level" placeholder="State"></td></tr>
        <tr><td>  </td> <td> <input size="5" class="input-block-level" placeholder="Zipcode" name="zipcode" type="text" value="${locationSearch.zipcode}"></td></tr>
        <tr align="center"><td colspan="2"><input type="submit" class="btn btn-primary btn-large" value="Search Now"></td></tr>
    </table>
</form>


   <hr>

<h4>Small Business Results</h4>

<div class="table-container">
      <table id="table1" class="table table-hover table-striped">
    	<thead>
    	<tr>
	    	<th>Business Name </th>
	    	<th>Business Type</th>
			<th>Phone</th>
	    	<th>Address</th>	    	
			<th>Map</th>
			<th colspan="5">Social Media</th>
			<th>Coupons</th>
		</tr>
		</thead>
		<tbody>
        <c:forEach var="result" items='${businessList}'>
            <tr>
                <td>
                    <c:out value="${result.dbaname}"></c:out>
                </td>
                <td>
                    <c:out value="${result.businessdescription}"></c:out>
                </td>
                <td>
                    <%=1111111111 + (int)(Math.random()*999999999) %>
                </td>
                <td>
                    <c:out value="${result.streetaddress}${result.city} ${result.state} ${result.zipcode}"></c:out>
                </td>
                <td>
                    <a target="_blank" href="https://maps.google.com/?q=${result.streetaddress},+${result.city},+${result.state},+${result.zipcode}"><img width="30" height="30" src="${pageContext.servletContext.contextPath}/resources/pointer.png" alt="Image Intuit"/>
                    </a>
                </td>
                 <td>
                    <img width="30" height="30" src="${pageContext.servletContext.contextPath}/resources/img/linkedin.png" alt="Image Intuit"/>
                </td>
                 <td>
                   <img width="30" height="30" src="${pageContext.servletContext.contextPath}/resources/img/twitter-Icon.jpg" alt="Image Intuit"/>
                </td>
                 <td>
                    <img width="30" height="30" src="${pageContext.servletContext.contextPath}/resources/img/facebook-icon.png" alt="Image Intuit"/>
                </td>
                 <td>
                    <img width="30" height="30" src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif" alt="Image Intuit"/>
                </td>
                 <td>
                    <img width="30" height="30" src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png" alt="Image Intuit"/>
                </td>
                 <td>
                    <a class="btn" href="${pageContext.servletContext.contextPath}/customer?id=${result.dbaname}"><img width="20" height="20" src="${pageContext.servletContext.contextPath}/resources/img/discount-tag.jpg" alt="Image Intuit"/></a>
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
	 <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-min.js"></script>
</div>


</body>
</html>
