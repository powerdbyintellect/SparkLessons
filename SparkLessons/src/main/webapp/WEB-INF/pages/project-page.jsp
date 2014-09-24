<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Tue Sep 23 2014 17:41:04 GMT+0000 (UTC) -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html data-wf-site="5420869c24ed7cd271a3ef44" data-wf-page="5420869c24ed7cd271a3ef48">
<head>
  <meta charset="utf-8">
  <title>Lesson Page - SparkLessons</title>
  <meta name="description" content="Sparklessons is a site where students &amp; teachers get together ">
  <meta name="keywords" content="sparklessins, teaching, learning, education, students, teachers">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="generator" content="Webflow">
  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/normalize.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/webflow.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/sparklessons.webflow.css">
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
          <img src="${pageContext.servletContext.contextPath}/resources/images/SL_Logo4.png" alt="${pageContext.servletContext.contextPath}/resources/images/5420a24882027adc73b7a86d_SL_Logo4.png">
          <nav class="w-nav-menu menu" role="navigation"><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}"><span>Home</span></a>
          <a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/#howit">HOW IT WORKS</a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/portfolio"><span>EXPLORE<br></span></a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/sign-in"><span>SIGN IN</span></a>
            <a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/contact"><span>contact</span> </a>
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
          <img src="${pageContext.servletContext.contextPath}/resources/images/SL_Logo4.png" alt="${pageContext.servletContext.contextPath}/resources/images/5420a24882027adc73b7a86d_SL_Logo4.png">
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
        <h1 class="is pg">${user.lessonname}&nbsp;<span class="light">LESSON&nbsp;Page</span><span class="light"></span></h1>
        <div class="subtx pg">here is more information about the lesson</div>
      </div>
    </div>
  </div>
  <div class="project-section">
    <div class="w-container">
      <div class="w-slider slider-project" data-animation="slide" data-duration="500" data-infinite="1">
        <div class="w-slider-mask">
          <div class="w-slide">
            <img src="${pageContext.servletContext.contextPath}/profileimages/${user.id}"/>
          </div>
          <div class="w-slide">
            <img src="${pageContext.servletContext.contextPath}/resources/images/PianoLessons2.jpg" alt="${pageContext.servletContext.contextPath}/resources/images/5421adb982027adc73b7b980_PianoLessons2.jpg">
          </div>
        </div>
        <div class="w-slider-arrow-left">
          <div class="w-icon-slider-left arrow"></div>
        </div>
        <div class="w-slider-arrow-right">
          <div class="w-icon-slider-right arrow"></div>
        </div>
        <div class="w-slider-nav w-round nav-dots"></div>
      </div>
      <div class="w-row page-content">
        <div class="w-col w-col-8">
          <div class="project-tittle">${user.firstname}&nbsp;${user.lastname} will be offering ${user.lessonname} Lesson </div>
          <p>${user.description}</p>
        </div>
        <div class="w-col w-col-4">
          <ul class="w-list-unstyled">
            <li class="list">
              <div class="project-tittle">DATE</div>
              <p>${user.createdate}</p>
            </li>
            <li>
              <div class="project-tittle">
                <div class="project-tittle">CATEGORIES</div>
              </div>
              <p> ${user.lessoncategory}</p>
              <div class="project-tittle">RATE</div>
              <p>$ ${user.rate} / hour</p>
            </li>
            <li style="margin-top: -60px; ">
            	<c:if test="${!user.paymentaccountpresent}">
		        	<a class="button" href="${pageContext.servletContext.contextPath}/submit-payment-information">ADD PAYMENT ACCOUNT</a>
		        </c:if>
		        <c:if test="${user.paymentaccountpresent}">
		        	<a class="button" href="${pageContext.servletContext.contextPath}/makepayment">GET PAID NOW</a>
		        </c:if>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!--<div>
      <h2 class="sp customer-reviews" style="padding-top: 50px;">CUSTOMER&nbsp;<span class="light">REVIEWS<br></span></h2>
       <div class="customer-review">
        <div class="w-container">
          <div class="w-slider" data-animation="slide" data-duration="400" data-infinite="1">
            <div class="w-slider-mask">
              <div class="w-slide div-slide1">
                <div class="w-row">
                  <div class="w-col w-col-3"></div>
                  <div class="w-col w-col-6">`
                    <p>I liked very much this lesson and he's very patient and is a very good teacher, when I will be in the university I will have others take this lesson with him because I need many help and he's the right person for teaching me piano</p>
                  </div>
                  <div class="w-col w-col-3"></div>
                </div>
              </div>
              <div class="w-slide div-slide2">
                <div class="w-row">
                  <div class="w-col w-col-3"></div>
                  <div class="w-col w-col-6">
                    <p>Mr. Paul did a good job of teaching "Piano Lessons" in about 10-15 minutes. His teaching style was quick, yet effective. I liked it very much, although I would have liked if the sessions would be free. Other than that, very good tutor.</p>
                  </div>
                  <div class="w-col w-col-3">
                    <div></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="w-slider-arrow-left">
              <div class="w-icon-slider-left"></div>
            </div>
            <div class="w-slider-arrow-right">
              <div class="w-icon-slider-right"></div>
            </div>
            <div class="w-slider-nav w-round"></div>
          </div>
        </div>
      </div>
    </div>-->
  </div> 
  <div class="related-section">
    <div class="w-container">
      <div class="text-hero">
        <h2 class="sp">RELATED&nbsp;<span class="light">PROJECT</span></h2>
        <p class="sub-text">These are related lessons that you may be interested in taking</p>
      </div>
    </div>
    <div class="w-row">
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/portfolio">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                   "items": [
                    {
                      "url": "${pageContext.servletContext.contextPath}/resources/images/tennis1.jpg",
                      "caption": "This is a logo!",
                      "type": "image"
                    },
                    {
                      "url": "${pageContext.servletContext.contextPath}/resources/images/tennis2.jpg",
                      "caption": "",
                      "type": "image"
                    }
                  ],
                  "group": ""
                }
              </script>
            </a>
          </div>
        </div>
        <img src="${pageContext.servletContext.contextPath}/resources/images/tennis.jpg" width="260" height="280" alt="${pageContext.servletContext.contextPath}/resources/images/53eb8193cf6ba7c144ec594f_work5.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Tennis Lessons</a>
        </div>
        <div class="catergory">sports, individuality, professional</div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/baseball.jpg" width="260" height="280" alt="${pageContext.servletContext.contextPath}/resources/images/53eb81a2cf6ba7c144ec5952_work6.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">BASEBALL LESSONS</a>
        </div>
        <div class="catergory">sports, team sports, american classic</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/portfolio">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "items": [
                     {
                      "url": "${pageContext.servletContext.contextPath}/resources/images/baseball1.jpg",
                      "caption": "",
                      "type": "image"
                    },
                    {
                      "url": "${pageContext.servletContext.contextPath}/resources/images/baseball2.jpg",
                      "caption": "",
                      "type": "image"
                    }
                  ]
                }
              </script>
            </a>
          </div>
        </div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/painting.jpg"  width="260" height="280" alt="53eb896dd056242e6a4c9517_work8.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">PAINTING LESSONS</a>
        </div>
        <div class="catergory">art, painting, creative</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/portfolio">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "items": [
                    {
                      "url": "http://vimeo.com/21356824",
                      "html": "<iframe class=\"embedly-embed\" src=\"//cdn.embedly.com/widgets/media.html?src=http%3A%2F%2Fplayer.vimeo.com%2Fvideo%2F21356824&src_secure=1&url=http%3A%2F%2Fvimeo.com%2F21356824&image=http%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F172763181_1280.jpg&key=c4e54deccf4d4ec997a64902e9a30300&type=text%2Fhtml&schema=vimeo\" scrolling=\"no\" frameborder=\"0\" allowfullscreen></iframe>",
                      "width": 940,
                      "height": 529,
                      "type": "video"
                    }
                  ]
                }
              </script>
            </a>
          </div>
        </div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/rockclimbing.jpg" width="260" height="280" alt="${pageContext.servletContext.contextPath}/resources/images/53eb821ba6f42a2f6a36702e_work7.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Rock Climbing Lessons</a>
        </div>
        <div class="catergory">outdoors, adventurous</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/portfolio">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "mode": "video",
                  "items": [
                       {
                      "type": "image",
                      "url": "${pageContext.servletContext.contextPath}/resources/images/rockclimbing1.jpg",
                      "caption": "",
                      "width": 1540,
                      "height": 962
                    },
                    {
                      "type": "image",
                      "url": "${pageContext.servletContext.contextPath}/resources/images/rockclimbing2.jpg",
                      "caption": "",
                      "width": 250,
                      "height": 250
                    }
                  ]
                }
              </script>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="button-section">
    <div class="w-container">
      <div class="w-row">
        <div class="w-col w-col-6 clm"><a class="button" href="${pageContext.servletContext.contextPath}/portfolio">back to portfolio</a>
        </div>
        <div class="w-col w-col-6 column-pj"><a class="button pj" href="#">prev post</a><a class="button" href="#">next post</a>
        </div>
      </div>
    </div>
  </div>
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
  <div class="w-container"></div>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>