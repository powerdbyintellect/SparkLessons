<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Tue Sep 23 2014 17:41:04 GMT+0000 (UTC) -->
<html data-wf-site="5420869c24ed7cd271a3ef44" data-wf-page="5420869c24ed7cd271a3ef46">
<head>
  <meta charset="utf-8">
  <title>SparkLessons - connecting teachers with students</title>
  <meta name="description" content="SparkLessons is a site where students &amp; teachers get together and share the knowledge without worrying about payments.">
  <meta name="keywords" content="sparklessons, payments, easy payment, social marketing, social integration, learning">
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
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.servletContext.contextPath}/resources/images/fav.png">
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
  <div class="banner" id="top" data-ix="show-nav">
    <div class="w-nav w-hidden-medium w-hidden-small w-hidden-tiny navbar-scroll" data-collapse="medium" data-animation="over-right" data-duration="400" data-contain="1" data-ix="display-none">
      <div class="w-container">
        <a class="w-nav-brand w-clearfix logo sc" href="${pageContext.servletContext.contextPath}">
          <img src="${pageContext.servletContext.contextPath}/resources/images/SL_Logo4.png" alt="5420a24882027adc73b7a86d_SL_Logo4.png">
          <nav class="w-nav-menu menu" role="navigation"><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}"><span>Home</span></a><a class="w-nav-link navlink" href="#howit">HOW IT WORKS</a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/portfolio"><span>EXPLORE<br></span></a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/project-page"><span>SIGN IN</span></a>
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
        <a class="w-nav-brand logo" href="${pageContext.servletContext.contextPath}/">
          <img src="${pageContext.servletContext.contextPath}/resources/images/SL_Logo4.png" alt="5420a24882027adc73b7a86d_SL_Logo4.png">
        </a>
        <nav class="w-nav-menu menu" role="navigation"><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/"><span>Home</span></a><a class="w-nav-link navlink" href="#howit">HOW IT WORKS</a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/portfolio"><span>EXPLORE<br></span></a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/sign-in"><span>SIGN IN</span></a>
          <a
          class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/contact"><span>contact</span>
            </a>
        </nav>
        <div class="w-nav-button ico-device">
          <div class="w-icon-nav-menu"></div>
        </div>
      </div>
    </div>
    <div class="w-slider slider" data-animation="outin" data-duration="500" data-infinite="1">
      <div class="w-slider-mask">
        <div class="w-slide slide">
          <div class="w-container sl-con">
            <h1 class="is" data-ix="from-top-on-load">WElcome to Spark lessons<span class="light"></span></h1>
            <div class="subtx" data-ix="from-top-on-load-2">connecting teachers with students</div>
            <div class="btn" data-ix="from-top-on-load-3">
              <div class="w-row row-class">
                <div class="w-col w-col-4"><a class="button" href="${pageContext.servletContext.contextPath}/signin">Signup with facebook</a>
                </div>
                <div class="w-col w-col-4">
                  <img src="${pageContext.servletContext.contextPath}/resources/images/Img_Or.png" width="53" alt="54208ecadc9f75dd73ac645e_Img_Or.png">
                </div>
                <div class="w-col w-col-4">
                  <div class="w-form w-clearfix">
                    <form class="w-clearfix div-submitclass" id="email-form" name="email-form" data-name="Email Form" method="post">
                      <input class="w-input email-signup" id="Email-Address" type="email" placeholder="Email Address" name="Email-Address" data-name="Email Address" required="required">
                      <input class="w-button submit-btn" type="submit" value="SIGN UP" data-wait="Please wait...">
                    </form>
                    <div class="w-form-done">
                      <p>Thank you! Your submission has been received!</p>
                    </div>
                    <div class="w-form-fail">
                      <p>Oops! Something went wrong while submitting the form :(</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="w-slide">
          <div class="w-container sl-con">
            <h1 class="is">Follow your passion</h1>
            <div class="subtx">focus only on learning and leave rest to us&nbsp;</div>
            <div class="btn"><a class="button" href="#">browse now</a>
            </div>
          </div>
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
  </div>
  <div class="service-section" id="howit">
    <div class="w-container">
      <div class="text-hero">
        <h2 class="sp">HOW&nbsp;IT WORKS</h2>
        <p class="sub-text">Spark Lessons enables teachers&nbsp;to find students &amp;&nbsp;getting paid fast</p>
      </div>
      <div class="w-row">
        <div class="w-col w-col-4 w-col-stack service-column">
          <div class="icon-service"></div>
          <h4>create lessons</h4>
          <p>Create, manage &amp;&nbsp;promote your lessons. Get unlimited social marketing to organize &amp;&nbsp;grow your business.</p>
        </div>
        <div class="w-col w-col-4 w-col-stack service-column">
          <div class="icon-service pixel"></div>
          <h4>take lessons</h4>
          <p>Follow your passion and find the perfect lesson that you want to pursue &amp;&nbsp;we take of the rest&nbsp;</p>
        </div>
        <div class="w-col w-col-4 w-col-stack service-column">
          <div class="icon-service phone"></div>
          <h4>get paid</h4>
          <p>We make it easy to pay for lessons &amp;&nbsp;getting paid by any means of payment.
            <br>You focus on teaching &amp;&nbsp;learning</p>
        </div>
      </div>
    </div>
  </div>
  <div class="work-section">
    <div class="w-row">
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/piano.jpg" width="260" height="280" alt="5420aa48dc9f75dd73ac65bd_piano.jpg">
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/project-page">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "items": [
                    {
                      "type": "image",
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53e61958b195c15b32bf7841_light1.jpg",
                      "caption": "This is a caption!",
                      "width": 755,
                      "height": 943
                    },
                    {
                      "type": "image",
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53e619718fe341c348ee72d2_light2.jpg",
                      "caption": "",
                      "width": 755,
                      "height": 471
                    },
                    {
                      "type": "image",
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53e6197ab195c15b32bf7845_light3.jpg",
                      "caption": "",
                      "width": 755,
                      "height": 471
                    }
                  ]
                }
              </script>
            </a>
          </div>
        </div>
        <div class="portfolio-tittle"><a class="tittle" href="#">project #1</a>
        </div>
        <div class="catergory">print, photography</div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/baseball.jpg" width="260" height="280" alt="5420ac8d82027adc73b7a95b_baseball.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #2</a>
        </div>
        <div class="catergory">print, photography</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/project-page">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "items": [
                    {
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53e61a828fe341c348ee72dc_light4.jpg",
                      "caption": "",
                      "type": "image"
                    },
                    {
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53e61a8cb195c15b32bf7857_light5.jpg",
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
        <img src="${pageContext.servletContext.contextPath}/resources/images/tennis.jpg" width="260" height="280" alt="5420ab207fed5ca22a8ac6f5_tennis.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #3</a>
        </div>
        <div class="catergory">print, photography</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/project-page">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "items": [
                    {
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53e61b1fb195c15b32bf7860_light7.png",
                      "caption": "This is a logo!",
                      "type": "image"
                    },
                    {
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53e61b0ab195c15b32bf785d_light6.jpg",
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
        <img src="${pageContext.servletContext.contextPath}/resources/images/painting.jpg" width="260" height="280" alt="5420ab7182027adc73b7a953_painting.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #4</a>
        </div>
        <div class="catergory">print, photography</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/project-page">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "mode": "video",
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
    </div>
  </div>
  <div class="team-section">
    <div class="w-container">
      <div class="text-hero">
        <h2 class="sp">OUR LOVELY&nbsp;<span class="light">TEAM</span></h2>
        <p class="sub-text">Team is what is important and that each of us, on our own, is worthless.</p>
      </div>
      <div class="w-row">
        <div class="w-col w-col-4 w-col-stack column">
          <div class="tean-wrapper">
            <img src="${pageContext.servletContext.contextPath}/resources/images/asim.png" width="111" alt="54211652dc9f75dd73ac6a35_asim.png">
          </div>
          <div class="team-div">
            <div class="team-name">ASIm KHAJA</div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim.</p>
            <div class="team-social">
              <a class="w-inline-block ico-soc facebook" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/facebook-footer.png" width="14" alt="53e6481b8300c9c1489b940b_facebook-footer.png">
              </a>
              <a class="w-inline-block ico-soc twitter" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/twitter-footer.png" width="14" alt="53e6485e8300c9c1489b9411_twitter-footer.png">
              </a>
              <a class="w-inline-block ico-soc gplus" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/google-footer.png" width="14" alt="53e64871edc43d5932f07f4d_google-footer.png">
              </a>
              <a class="w-inline-block ico-soc rss" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/rss-footer.png" width="14" alt="53e6487d8fe341c348ee7489_rss-footer.png">
              </a>
              <a class="w-inline-block ico-soc dribbble" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/dribble-footer.png" width="14" alt="53e648898fe341c348ee748b_dribble-footer.png">
              </a>
            </div>
          </div>
        </div>
        <div class="w-col w-col-4 w-col-stack column">
          <div class="tean-wrapper">
            <img src="${pageContext.servletContext.contextPath}/resources/images/harish.png" width="125" alt="5421169f5cfdafa12a5c0b88_harish.png">
          </div>
          <div class="team-div">
            <div class="team-name">HARISH&nbsp;RAGHAVENDRA</div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim.</p>
            <div class="team-social">
              <a class="w-inline-block ico-soc facebook" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/facebook-footer.png" width="14" alt="53e6481b8300c9c1489b940b_facebook-footer.png">
              </a>
              <a class="w-inline-block ico-soc twitter" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/twitter-footer.png" width="14" alt="53e6485e8300c9c1489b9411_twitter-footer.png">
              </a>
              <a class="w-inline-block ico-soc dribbble" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/dribble-footer.png" width="14" alt="53e648898fe341c348ee748b_dribble-footer.png">
              </a>
              <a class="w-inline-block ico-soc gplus" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/google-footer.png" width="14" alt="53e64871edc43d5932f07f4d_google-footer.png">
              </a>
              <a class="w-inline-block ico-soc rss" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/rss-footer.png" width="14" alt="53e6487d8fe341c348ee7489_rss-footer.png">
              </a>
            </div>
          </div>
        </div>
        <div class="w-col w-col-4 w-col-stack">
          <div class="tean-wrapper">
            <img src="${pageContext.servletContext.contextPath}/resources/images/mario.jpeg" width="111" alt="542116b982027adc73b7acb9_mario.jpeg">
          </div>
          <div class="team-div">
            <div class="team-name">MARIO&nbsp;ABUNDIS</div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim.</p>
            <div class="team-social">
              <a class="w-inline-block ico-soc facebook" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/facebook-footer.png" width="14" alt="53e6481b8300c9c1489b940b_facebook-footer.png">
              </a>
              <a class="w-inline-block ico-soc twitter" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/twitter-footer.png" width="14" alt="53e6485e8300c9c1489b9411_twitter-footer.png">
              </a>
              <a class="w-inline-block ico-soc gplus" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/google-footer.png" width="14" alt="53e64871edc43d5932f07f4d_google-footer.png">
              </a>
              <a class="w-inline-block ico-soc dribbble" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/dribble-footer.png" width="14" alt="53e648898fe341c348ee748b_dribble-footer.png">
              </a>
              <a class="w-inline-block ico-soc rss" href="#">
                <img src="${pageContext.servletContext.contextPath}/resources/images/rss-footer.png" width="14" alt="53e6487d8fe341c348ee7489_rss-footer.png">
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="process-section">
    <div class="w-container">
      <div class="block-fun">
        <div class="funt-nr">569</div>
        <div class="fun-sub">Lessons taken</div>
      </div>
      <div class="block-fun">
        <div class="funt-nr"><span>1316</span>
        </div>
        <div class="fun-sub">lines of code</div>
      </div>
      <div class="block-fun">
        <div class="funt-nr">32</div>
        <div class="fun-sub">CUPS of coffeE</div>
      </div>
      <div class="block-fun">
        <div class="funt-nr">98%</div>
        <div class="fun-sub">great feedback</div>
      </div>
    </div>
  </div>
  <footer class="footer">
    <div class="w-container">
      <div class="w-row">
        <div class="w-col w-col-6 clm">
          <div class="copyright">© 2014 SparkLessons by Intuit</div>
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
</html>