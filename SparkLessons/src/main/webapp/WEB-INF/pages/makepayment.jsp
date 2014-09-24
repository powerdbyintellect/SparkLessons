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
  <%-- code for card--%>
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
        }
        .credit{
            text-align: center;
            font-size: 0.7em;
            padding: 10px;
        }

        .item{
            width: 60px;
            vertical-align: middle;
            margin-right: 15px;
        }
        .card .company{
            box-sizing: border-box;
            float: right;
        }
        .card{
            position: relative;
            perspective: 600px;
        }
        .card, .card .side{
            width: 350px;
            height: 200px;
        }
        .card .side{
            border-radius: 5px 5px;
            transition: all 0.4s linear;
            background: #333;
            color: #FFF;
            box-sizing: border-box;
            transform-style: preserve-3d;
            backface-visibility: hidden;
            position: absolute;
            top: 0;
            left: 0;
        }
        .card .front{
            padding: 10px;
            transform: rotateX(0deg) rotateY(0deg);
        }
        .card.flip .front{
            transform: rotateY(180deg);
        }
        .card .cc-num{
            width: 100%;
            padding-top: 100px;
        }
        .card input{
            outline: none;
            border: 0px solid;
            background: none;
            color: #FFF;
        }
        .card[data-type="visa"] input::-webkit-input-placeholder, .card[data-type="mastercard"] input::-webkit-input-placeholder{
            color: #DDD;
        }
        .card[data-type="visa"] input::-moz-placeholder, .card[data-type="mastercard"] input::-moz-placeholder{
            color: #DDD;
        }
        .card[data-type="visa"] input:-ms-placeholder, .card[data-type="mastercard"] input:-ms-placeholder{
            color: #DDD;
        }
        .card[data-type="visa"] .company{
            color: rgba(255,255,255,0.9);
            font-style: italic;
            text-shadow: 0px 0px 3px rgba(17,123,173,0.9);
        }
        .card[data-type="visa"] .side{
            background: #1db1cf;
        }
        .card[data-type="mastercard"] .side{
            background: #4d86ce;
        }
        .card[data-type="mastercard"] .company div{
            float: left;
            width: 15px;
            height: 15px;
            border-radius: 10px;
            background: rgba(239,209,57,0.8);
        }
        .card[data-type="mastercard"] .company div:first-child{
            background: rgba(223,40,40,0.8);
            margin-right: -5px;
        }
        .signature{
            background: #DDD;
            color: #000;
            padding: 10px;
        }
        .right{
            float: right;
        }
        .sig{
            font-family: "Allura";
        }
        .signature input.cc-cvc{
            color: #000;
            width: 40px;
        }
        .stripe{
            margin: 20px 0;
            height: 40px;
            background: #000;
        }
        .card .back{
            padding-top: 15px;
            transform: rotateY(-180deg);
        }
        .card.flip .back{
            transform: rotateX(0deg) rotateY(0deg);
        }
        .button{
            background: #0099CC;
            padding: 4px;
            color: #FFF;
            cursor: pointer;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
            border-radius: 5px 5px;
        }
        .button:hover{
            background: #33B5E5;
        }
        .checkout{
            margin: 0 auto;
            width: 350px;
        }
        .addr input{
            width: 100%;
            outline: none;
            border: 0px solid;
            padding: 5px;
        }
    </style>

<%--end of code for card.--%>

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
        <h1 class="is pg">Make Payment<span class="light"></span></h1>
        <div class="subtx pg">You are about get paid for lessons you gave!</div>
      </div>
    </div>
  </div>


<%--START code here to display card payment.--%>
  <div align="center" style="background-image: none; background-color: white;">

      <div class="checkout" align="center" style="padding-top: 50px;">

          <form name="paymentform" action="charge" method="post">
		  <span style="size: auto;"><img class="item" title="Image of Cover" src="${pageContext.servletContext.contextPath}/resources/images/paymentIcon.png" /><b>${type}</b>
		  Lessons for 1 hour: $ &nbsp;&nbsp;<input type="text" size="3" style="max-width: 50px;" name="chargeamount" class="input-block-level" placeholder="25.00"/></span>
              <p align="center" style="padding-top: 20px">You don't have a card saved with us. You'll need to add one now</p>
              <section>
                  <!-- START FORM -->
                  <div align="center" style="padding-right: 25px;">
                      <div class="credit-card-input no-js" id="skeuocard">
                          <p class="no-support-warning">
                              Either you have Javascript disabled, or you're using an unsupported browser, amigo! That's why you're seeing this old-school credit card input form instead of a fancy new Skeuocard. On the other hand, at least you know it gracefully degrades...
                          </p>
                          <label for="cc_type">Card Type</label>
                          <select name="cc_type">
                              <option value="">...</option>
                              <option value="visa">Visa</option>
                              <option value="discover">Discover</option>
                              <option value="mastercard">MasterCard</option>
                              <option value="maestro">Maestro</option>
                              <option value="jcb">JCB</option>
                              <option value="unionpay">China UnionPay</option>
                              <option value="amex">American Express</option>
                              <option value="dinersclubintl">Diners Club</option>
                          </select>
                          <label for="cc_number">Card Number</label>
                          <input type="text" name="cc_number" id="cc_number" placeholder="XXXX XXXX XXXX XXXX" maxlength="19" size="19" >
                          <label for="cc_exp_month">Expiration Month</label>
                          <input type="text" name="cc_exp_month" id="cc_exp_month" placeholder="00">
                          <label for="cc_exp_year">Expiration Year</label>
                          <input type="text" name="cc_exp_year" id="cc_exp_year" placeholder="00" >
                          <label for="cc_name">Cardholder's Name</label>
                          <input type="text" name="cc_name" id="cc_name" placeholder="John Doe" value="">
                          <label for="cc_cvc">Card Validation Code</label>
                          <input type="text" name="cc_cvc" id="cc_cvc" placeholder="123" maxlength="3" size="3">
                          <input type="hidden" name="realmId" value="${realmId}"/>
                      </div>
                      <div align="center" style="padding-left: 125px;">
                          <br/>
                          <input type="submit" class="w-button submit-btn" value="Submit Payment"/>
                          <br><br>
                          <br><br>
                      </div>
                  </div>
                  <!-- END FORM -->
              </section>
          </form>
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