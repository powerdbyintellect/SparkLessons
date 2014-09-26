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
    _gaq.push(['_setAccount', 'UA-55193915-1'], ['_trackPageview']);
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
          <img style="max-width :212px; max-height: 93px" src="${pageContext.servletContext.contextPath}/resources/images/lessons_logo.png" alt="5420a24882027adc73b7a86d_SL_Logo4.png">
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
          <img style="max-width :212px; max-height: 93px" src="${pageContext.servletContext.contextPath}/resources/images/lessons_logo.png" alt="${pageContext.servletContext.contextPath}/resources/images/5420a24882027adc73b7a86d_SL_Logo4.png">
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
        <h1 class="is pg">browse lessons<span class="light"></span></h1>
        <div class="subtx pg">take a look at current lessons being offered</div>
      </div>
    </div>
  </div>
  <br><br>
  <div class="portolio-section">
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
                      "url": "${pageContext.servletContext.contextPath}/resources/images/piano111.jpg",
                      "caption": "This is a caption!",
                      "type": "image"
                    },
                    {
                      "url": "${pageContext.servletContext.contextPath}/resources/images/piano112.jpg",
                      "caption": "",
                      "type": "image"
                    },
                    {
                      "url": "${pageContext.servletContext.contextPath}/resources/images/piano113.jpg",
                      "caption": "",
                      "type": "image"
                    }
                  ]
                }
              </script>
            </a>
          </div>
        </div>
        <img src="${pageContext.servletContext.contextPath}/resources/images/piano-lessons.jpg" width="260" height="280" alt="piano-lessons.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Piano Lessons</a>
        </div>
        <div class="catergory">Learn music that will touch your soul.</div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/baseball.jpg" width="260" height="280" alt="baseball.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Baseball Lessons</a>
        </div>
        <div class="catergory">Learn how to make ever swing a home run.</div>
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
        <img src="${pageContext.servletContext.contextPath}/resources/images/tennis.jpg" width="260" height="280" alt="tennis.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Tennis Lessons</a>
        </div>
        <div class="catergory">Even Roger Federer will get nervous of you learning this.</div>
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
                  ]
                }
              </script>
            </a>
          </div>
        </div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/painting.jpg" width="260" height="280" alt="painting.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Painting Lessons</a>
        </div>
        <div class="catergory">Learn how to allow you being to express himself thru painting.</div>
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
                        "url": "${pageContext.servletContext.contextPath}/resources/images/paintingbob.jpg",
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
    </div>
  </div>
  <div class="portolio-section">
    <div class="w-row">
      <div class="w-col w-col-3 w-col-stack portfolio-image">
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
                  ],
                  "group": ""
                }
              </script>
            </a>
          </div>
        </div>
        <img src="${pageContext.servletContext.contextPath}/resources/images/rockclimbing.jpg" width="260" height="280" alt="rockclimbing.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Rock Climbing Lessons</a>
        </div>
        <div class="catergory">Rock climbing for adventurous people.</div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/gymnastics.jpg" width="260" height="280" alt="gymnastics.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Gymnastics Lessons</a>
        </div>
        <div class="catergory">Learn what it takes to win the Olympics.</div>
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
                      "type": "image",
                      "url": "${pageContext.servletContext.contextPath}/resources/images/gymnastics1.jpg",
                      "caption": "",
                      "width": 755,
                      "height": 469
                    },
                    {
                      "type": "image",
                      "url": "${pageContext.servletContext.contextPath}/resources/images/gymnastics2.jpg",
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
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/swimmer.jpg" width="260" height="280" alt="swimmer.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Swimming Lessons</a>
        </div>
        <div class="catergory">Swim like a pro today!</div>
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
                      "type": "image",
                      "url": "${pageContext.servletContext.contextPath}/resources/images/Swimming2.jpg",
                      "caption": "",
                      "width": 1540,
                      "height": 962
                    }
                  ]
                }
              </script>
            </a>
          </div>
        </div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/aikido11.jpg" width="260" height="280" alt="aikido11.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">Aikido Lessons</a>
        </div>
        <div class="catergory">True Victory is Victory over Oneself.</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/portfolio">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "mode": "video",
                  "items": [
                    {
                        "url": "${pageContext.servletContext.contextPath}/resources/images/aikido2.jpg",
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
    </div>
  </div>
  <%--<div class="logo-section">
    <div class="w-slider logo-slider" data-animation="cross" data-duration="500" data-infinite="1" data-delay="2000" data-autoplay="1" data-easing="ease-in-cubic">
      <div class="w-slider-mask slider-mask">
        <div class="w-slide">
          <div class="w-row row-logo">
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c1.jpg" alt="53eb86d7a6f42a2f6a367093_c1.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c2.jpg" alt="53eb8703d056242e6a4c94d8_c2.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c3.jpg" alt="53eb870cf90240c2448f72e4_c3.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c4.jpg" alt="53eb8713a6f42a2f6a367095_c4.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c5.jpg" alt="53eb871aa6f42a2f6a367097_c5.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c6.jpg" alt="53eb8720d056242e6a4c94db_c6.jpg">
            </div>
          </div>
        </div>
        <div class="w-slide">
          <div class="w-row row-logo">
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c7.jpg" alt="53eb873fa6f42a2f6a36709a_c7.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c8.jpg" alt="53eb8746cf6ba7c144ec59e9_c8.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c9.jpg" alt="53eb874cd056242e6a4c94df_c9.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c2.jpg" alt="53eb8703d056242e6a4c94d8_c2.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c4.jpg" alt="53eb8713a6f42a2f6a367095_c4.jpg">
            </div>
            <div class="w-col w-col-2 w-col-medium-4">
              <img src="${pageContext.servletContext.contextPath}/resources/images/c10.jpg" alt="53eb8765d056242e6a4c94e3_c10.jpg">
            </div>
          </div>
        </div>
      </div>
      <div class="w-slider-arrow-left hide">
        <div class="w-icon-slider-left"></div>
      </div>
      <div class="w-slider-arrow-right hide">
        <div class="w-icon-slider-right"></div>
      </div>
      <div class="w-slider-nav w-round hide"></div>
    </div>
  </div>--%>
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
</html>