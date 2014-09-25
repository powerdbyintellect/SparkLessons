<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Tue Sep 23 2014 17:41:04 GMT+0000 (UTC) -->
<html data-wf-site="5420869c24ed7cd271a3ef44" data-wf-page="5420869c24ed7cd271a3ef47">
<head>
  <meta charset="utf-8">
  <title>SparkLessons - Browse lessons</title>
  <meta name="description" content="sparklessons portfolio page showcases all the different lessons that can be taken by a student and offered by accomplished teachers.">
  <meta name="keywords" content="sparklessons, payment, teachers, students, learning, education">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="generator" content="Webflow">
  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/normalize.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/webflow.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/sparklessons.webflow.css">
  <%-- START: Code for table--%>
    <link href="${pageContext.servletContext.contextPath}/resources/css/tiles.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/skeuocard.reset.css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/skeuocard.css" />
    <%--<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/demo.css">--%>

    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/resources/css/nav.css"
          type="text/css" />
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

<%--end of code for table.--%>

  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
  <script>
    WebFont.load({
      google: {
        families: ["Raleway:100,200,300,regular,500,600,700,800,900","Arvo:regular,italic,700,700italic","Libre Baskerville:regular,italic,700"]
      }
    });
  </script>
  <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/modernizr.js"></script>
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.servletContext.contextPath}/resources/img/favicon.ico">
  <link rel="apple-touch-icon" href="${pageContext.servletContext.contextPath}/resources/images/ico-phone.png">
  <script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-53838527-5'], ['_trackPageview']);
    (function() {
      var ga = document.createElement('script');
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
  </script>
</head>
<body>
  <div class="banner pg" id="top" data-ix="show-nav">
    <div class="w-nav w-hidden-medium w-hidden-small w-hidden-tiny navbar-scroll" data-collapse="medium" data-animation="over-right" data-duration="400" data-contain="1" data-ix="display-none">
      <div class="w-container">
        <a class="w-nav-brand w-clearfix logo sc" href="${pageContext.servletContext.contextPath}">
          <img src="${pageContext.servletContext.contextPath}/resources/images/SL_Logo4.png" alt="5420a24882027adc73b7a86d_SL_Logo4.png">
          <nav class="w-nav-menu menu" role="navigation"><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}"><span>Home</span></a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/#howit">HOW IT WORKS</a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/portfolio"><span>EXPLORE<br></span></a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/sign-in"><span>SIGN IN</span></a>
            <a
            class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/contact"><span>contact</span>
        </a>
        </nav>
        </a>
        <div class="w-nav-button">
          <div class="w-icon-nav-menu"></div>
        </div>
      </div>
    </div>
    <div class="w-nav navbar" data-collapse="medium" data-animation="default" data-duration="400" data-contain="1">
      <div class="w-container">
        <a class="w-nav-brand logo" href="${pageContext.servletContext.contextPath}">
          <img src="${pageContext.servletContext.contextPath}/resources/images/SL_Logo4.png" alt="5420a24882027adc73b7a86d_SL_Logo4.png">
        </a>
        <nav class="w-nav-menu menu" role="navigation"><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}"><span>Home</span></a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/#howit">HOW IT WORKS</a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/portfolio"><span>EXPLORE<br></span></a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/sign-in"><span>SIGN IN</span></a>
          <a
          class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/contact"><span>contact</span>
            </a>
        </nav>
        <div class="w-nav-button ico-device">
          <div class="w-icon-nav-menu"></div>
        </div>
      </div>
    </div>
    <div class="div-banner">
      <div class="w-container sl-con pg">
        <h1 class="is pg">Payment Confirmed!<span class="light"></span></h1>
        <div class="subtx pg">You are all set. You'll see cha-ching in your bank soon!</div>
      </div>
    </div>
  </div>


<%--START code here to display card payment.--%>
  <div class="checkout" style="padding-top: 80px;">
      <h4 align="center">Here's the transactions details.</h4>
      <div>
          <table cellspacing="0">
              <tr><th>Transaction Details</th><th>Summary</th></tr>
              <tr><td>Merchant Account Number</td><td>${creditCardResponse.merchantAccountNumber}</td></tr>
              <tr><td>Transaction Identifier</td><td>${creditCardResponse.creditCardTransID}</td></tr>
              <tr><td>Payment Status</td><td>${creditCardResponse.paymentStatus}</td></tr>
              <tr><td>Authorization Time </td><td>${creditCardResponse.transAuthorizationTime}</td></tr>
              <tr><td>Authorization Code </td><td>${creditCardResponse.authorizationCode} </td></tr>
              <tr><td>Authorization Amount </td><td>${amount}</td></tr>
          </table>
          <br><br>
      </div>
  </div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
  <script src='http://stripe.github.io/jquery.payment/lib/jquery.payment.js'></script>
  <script src="${pageContext.servletContext.contextPath}/resources/js/index.js"></script>


<%--END of code to display card payment.--%>

  <footer class="footer">
    <div class="w-container">
      <div class="w-row">
        <div class="w-col w-col-6 clm">
          <div class="copyright">&copy; 2014 SparkLessons by Intuit</div>
        </div>
        <div class="w-col w-col-6 top-column">
          <a class="w-inline-block top" href="#top"></a>
        </div>
      </div>
    </div>
  </footer>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>

<%--code for card begins here--%>
<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script src="${pageContext.servletContext.contextPath}/resources/js/vendor/demo.fix.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/vendor/jquery-2.0.3.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/skeuocard.js"></script>
<script>

    $(document).ready(function(){
        var isBrowserCompatible =
                $('html').hasClass('ua-ie-10') ||
                        $('html').hasClass('ua-webkit') ||
                        $('html').hasClass('ua-firefox') ||
                        $('html').hasClass('ua-opera') ||
                        $('html').hasClass('ua-chrome');

        if(isBrowserCompatible){
            window.card = new Skeuocard($("#skeuocard"), {
                debug: false
            });
        }
    });
</script>
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

<%--code for card ends--%>
</html>