<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Spark Lessons</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Spark Lessons, Payments">
<meta name="author" content="Harish Raghavendra">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/nav.css"
	type="text/css" />
<!-- Le styles -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">
<link rel="shortcut icon"
	href="${pageContext.servletContext.contextPath}/resources/img/favicon.ico" />
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}
</style>
<link
	href="${pageContext.servletContext.contextPath}/resources/css/bootstrap-responsive.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/tiles.css"
	rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">

<style type="text/css">
@import
	url(http://fonts.googleapis.com/css?family=Roboto+Slab:300|Roboto|Allura)
	;

body {
	background: #EEE;
}

body,input {
	font-family: "Roboto";
	font-size: 1em;
}

h1,.credit {
	font-family: "Roboto Slab";
}
</style>
</head>

<body>
	<%@ include file="header.jsp"%>
	<!-- <div align="center"><h4 align="center"><i>Go...chase your passion. We take care of payments for you.</i></h4></div> -->
	<div id="wrapper">
		<div id="columns">
			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/piano.jpg"
					alt="" />
				<p>Music has been a part of my life as far back as I can
					remember. I love how this picture sort of shows that the movements
					of the hands become more graceful as the pianist is lost in the
					emotion of the song.</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=piano"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/makepayment"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/tennis.jpg"
					alt="" />
				<p>RF always keeps his eye on the ball and leaves it at the
					point of contact for a split second once the ball leaves his
					racquet. Learn to play like a pro. Get tennis lessons now!</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=tennis"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/swimming.jpg"
					alt="" />
				<p>This is why swimmers have amazing bodies. Total body workout
					every time you enter the water. Everyone is the same in the water.

				</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=swimming"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/gymnastics.jpg"
					alt="" />
				<p>Where ever a gymnast goes doing gymnastics is a must do and
					if you really love gymnastics you'll do it every where. Here's to
					the gymnasts .. it's not about being a champion, it's about LOVING
					the sport!</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=gymnastics"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/painting.jpg"
					alt="" />
				<p>Art washes away from the soul, the dust of everyday life ~
					Pablo Picasso Acrylic, Oil, Watercolor. Abstract, Modern, Scenic,
					Landscapes Skyscapes, so many ways to show your creative side.
					Learn to paint.</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=painting"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/knitting.jpg"
					alt="" />
				<p>How to Magic Loop, Cabling Without a Cable Needle, Tubular
					Cast On, Weaving in Ends, Fair Isle - Yarn Dominance, Judy's Magic
					Cast On, Crochet Provisional Cast On, Kitchner Stitch. Things all
					knitters should know</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=knitting"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/ballerina.jpg"
					alt="" />
				<p>Ballet, Ballett, Ballerina, Dancer, Dance, Danza, Danse,
					Dansa, Dancing. Learn Russian Ballet, French Ballet or Italian
					Ballet.</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=ballerina"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/soccer.jpg"
					alt="" />
				<p>Soccer is not only a beautiful game...it is filed with
					beautiful moments. Moments of greatness and moments that aren't
					always seen from the score of the game. Learn to bicycle kick and
					be a team player.</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=soccer"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/baseball.jpg"
					alt="" />
				<p>We need to take a leaf from him and have a shot at it. FOCUS
					&amp; DETERMINATION! There's no crying in baseball!</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=baseball"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/football.jpg"
					alt="" />
				<p>If it doesnt matter who wins and loses, then why do they keep
					scores. Winners never quit &amp; quitters never win. -Lombardi
					Teamwork - No one can defeat us unless we first defeat ourselves</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=football"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/basketball.jpg"
					alt="" />
				<p>All kids need is a little help, a little hope and somebody
					who believes in them. There's winning and there's losing and in
					life both will happen. What is never acceptable to me is quitting.
					- Magic</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=basketball"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/skateboard.jpg"
					alt="" />
				<p>I don't Skateboard to impress people, look cool, or be
					stylish. I do it because its just plain awesome!</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=skateboard"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/surfing.jpg"
					alt="" />
				<p>Go Surfing! Don't just dream and fantasize about it book a
					surf-trip or take a lesson. It's the only way to find out if it's
					as magical as you imagine it is..</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=surfing"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/rockclimbing.jpg"
					alt="" />
				<p>Rock Climbing: The road to wisdom? Well, it's plain and
					simple to express:~ Err, and err, and err again ~ but less, and
					less, and less. ~~ Piet Hein</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=rockclimbing"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>

			<div class="pin">
				<img
					src="${pageContext.servletContext.contextPath}/resources/img/lacrosse.jpg"
					alt="" />
				<p>Be a team player. Learn &amp; Play Lacross. Real team mates
					work together and share the victory with each other.</p>
				<div class="pinSocialMeta">
					<a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order?type=lacrosse"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/facebook.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/twitter.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 21px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/linkedin.gif"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/pinterest.png"
						alt="" /></a> <a class="socialItem"
						href="${pageContext.servletContext.contextPath}/order"><img
						style="max-height: 20px; max-width: 20px"
						src="${pageContext.servletContext.contextPath}/resources/img/social_gglp.gif"
						alt="" /></a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-transition.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-alert.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-modal.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-dropdown.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-scrollspy.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-tab.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-tooltip.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-popover.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-button.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-collapse.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-carousel.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-typeahead.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-min.js"
		type="text/javascript"></script>

</body>
</html>
