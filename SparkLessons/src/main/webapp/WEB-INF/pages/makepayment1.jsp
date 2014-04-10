<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>CodePen - A Pen by kennydude</title>

    <style>

@font-face {
  font-family: 'Allura';
  font-style: normal;
  font-weight: 400;
  src: local('Allura'), local('Allura-Regular'), url(http://themes.googleusercontent.com/static/fonts/allura/v2/piROihwq0_hcWhCbsLJUv-vvDin1pK8aKteLpeZ5c0A.woff) format('woff');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 400;
  src: local('Roboto Regular'), local('Roboto-Regular'), url(http://themes.googleusercontent.com/static/fonts/roboto/v10/CrYjSnGjrRCn0pd9VQsnFOvvDin1pK8aKteLpeZ5c0A.woff) format('woff');
}
@font-face {
  font-family: 'Roboto Slab';
  font-style: normal;
  font-weight: 300;
  src: local('Roboto Slab Light'), local('RobotoSlab-Light'), url(http://themes.googleusercontent.com/static/fonts/robotoslab/v3/dazS1PrQQuCxC3iOAJFEJfR_54zmj3SbGZQh3vCOwvY.woff) format('woff');
}

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

    <script src="${pageContext.servletContext.contextPath}/resources/js/prefixfree.min.js"></script>

</head>

<body>

   <div class="checkout">
  <h1>Checkout</h1>
  <p>You are about to buy:</p>
  <p><img class="item" title="Image of Cover" src="http://i.imgur.com/bqvpFUM.jpg" />My Neighbour Totoro for £22.99</p>
  <p>You don't have a card saved with us, so you'll need to add one now</p>
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
  <p>Now, where to send it?</p>
   <div class="addr">
   <input type="text" placeholder="Address Line 1" />
    <input type="text" placeholder="Address Line 2" />
    <input type="text" placeholder="Town" />
    <input type="text" placeholder="Postcode" />
    <input type="text" placeholder="Country" />
   </div>
   <div class="button">
    Continue
  </div>
   <div class="credit">
     Made by <a href="http://twitter.com/kennydude">@kennydude</a>. Uses <a href="http://css3playground.com/flip-card.php">this css3 card flipping</a> and <a href="http://www.tomasdostal.com/projects/css3-creditcard/">tiny bits from here</a>
</div>
</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
  <script src='http://stripe.github.io/jquery.payment/lib/jquery.payment.js'></script>

  <script src="${pageContext.servletContext.contextPath}/resources/js/index.js"></script>

</body>

</html>