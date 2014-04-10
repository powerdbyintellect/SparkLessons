<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>SparkLessons - Payments Page</title>

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


    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Spark Lessons, Payments">

    <!-- Le styles -->
    <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
     <link href="${pageContext.servletContext.contextPath}/resources/css/style.css" rel="stylesheet">
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

    <script src="${pageContext.servletContext.contextPath}/reources/js/prefixfree.min.js"></script>

</head>

<body>

   <div class="checkout">
  <h1>Spark Lessons - Payment page</h1>
  <p>You are about get paid for lessons you gave :</p>
  <p><img class="item" title="Image of Cover" src="${pageContext.servletContext.contextPath}/resources/img/piano.jpg" />Piano Lessons for 1 hour: $25.00</p>
  <p>You don't have a card saved with us. You'll need to add one now</p>
  <div class="card">
    <div class="front side">
      <span class="company">
        CARD
      </span>
      PAYMENT CARD
      <input type="text" placeholder="Card number" class="cc-num" />
      <div>
        Expires:
        <input type="text" placeholder="MM/YY" class="cc-exp" />
      </div>
    </div>
    <div class="back side">
      <div class="stripe"></div>
      <div class="signature">
        <span class="right">
        CVC: <input type="text" placeholder="000" class="cc-cvc" maxlength="4" />
        </span>
        <span class="sig">
          our lovely customer
        </span>
      </div>
    </div>
  </div>
  <div class="button flip">
    Flip over
  </div>
  
  <div class="button">
    Submit Payment
  </div>
  <p>Now, where to send it?</p>
   <div class="addr">
   <input type="text" placeholder="Address Line 1" />
    <input type="text" placeholder="Address Line 2" />
    <input type="text" placeholder="Town" />
    <input type="text" placeholder="Postcode" />
    <input type="text" placeholder="Country" />
   </div>
   <div class="button">
    Submit Billing Address
  </div>
   
</div>
  
  
  

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
  <script src='http://stripe.github.io/jquery.payment/lib/jquery.payment.js'></script>

  <script src="${pageContext.servletContext.contextPath}/resources/js/index.js"></script>

</body>

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

</html>
