<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Tue Sep 23 2014 17:41:04 GMT+0000 (UTC) -->
<html data-wf-site="5420869c24ed7cd271a3ef44" data-wf-page="542196537fed5ca22a8ad6d4">
<head>
  <meta charset="utf-8">
  <title>Create Profile - SparkLessons</title>
  <meta name="description" content="Create a new customized profile &amp; update lesson  ">
  <meta name="keywords" content="create class, tutor, teacher, student">
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
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.servletContext.contextPath}/images/fav.png">
  <link rel="apple-touch-icon" href="${pageContext.servletContext.contextPath}/images/ico-phone.png">
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
          <img src="${pageContext.servletContext.contextPath}/resoures/images/SL_Logo4.png" alt="${pageContext.servletContext.contextPath}/5420a24882027adc73b7a86d_SL_Logo4.png">
          <nav class="w-nav-menu menu" role="navigation"><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}"><span>Home</span></a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/#howit">HOW IT WORKS</a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/portfolio"><span>EXPLORE<br></span></a><a class="w-nav-link navlink" href="${pageContext.servletContext.contextPath}/project-page"><span>SIGN IN</span></a>
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
        <h1 class="is pg"><span class="light">Create YOUR&nbsp;PROFILE</span><span class="light"></span></h1>
        <div class="subtx pg">create your customized lesson and your profile on this page</div>
      </div>
    </div>
  </div>
  <div class="project-section">
    <div class="w-container">
      <div class="w-slider slider-project" data-animation="slide" data-duration="500" data-infinite="1">
        <div class="w-slider-mask"></div>
      </div>
    </div>
    <div class="w-form">
      <form:form class="w-clearfix form-style" modelAttribute="user"  enctype="multipart/form-data" action="updateprofile" method="post" id="email-form" name="email-form" data-name="Email Form">
        <label class="project-tittle" for="firstname">NAME</label>
        <form:input class="w-input btn-style" id="firstname" type="text" placeholder="Enter your name" name="name" data-name="Name" path="firstname"/>
        <label class="project-tittle" for="email">EMAIL ADDRESS</label>
        <form:input class="w-input btn-style" id="email" type="email" placeholder="Enter your email address" name="email" data-name="email" required="required" path="email"/>
        <label class="project-tittle" for="Lesson-Name">NAME YOUR LESSON</label>
        <input class="w-input btn-style" id="Lesson-Name" type="text" placeholder="Piano Lessons" name="Lesson-Name" required="required" data-name="Lesson Name">
        <label class="project-tittle" for="Description-of-Lesson">DESCRIBE ABOUT YOUR LESSON</label>
        <form:textarea path="description" class="w-input btn-style" id="Description-of-Lesson" placeholder="Describe about the lesson you want to give" name="description" data-name="Description of Lesson" required="required"/>
        <label class="project-tittle" for="Price-of-lesson">RATE</label>
        <form:input path="rate" class="w-input btn-style" id="Price-of-lesson" type="text" placeholder="$25.00" name="rate" required="required" data-name="rate"/>
        <label class="project-tittle" for="Category-of-lesson">CATEGORIES</label>
        <textarea class="w-input btn-style" id="Category-of-lesson" placeholder="Categorize your lesson so that your prospective student can find it easily" name="category" data-name="category"></textarea>
        <label class="project-tittle">UPLOAD YOUR IMAGE HERE</label>
	    <input type="file" name="file" class="input-block-level"/>
        <input class="w-button submit-btn" type="submit" value="CREATE YOUR PROFILE" data-wait="Please wait...">
      </form:form>
    </div>
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
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/project-page">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "items": [
                    {
                      "type": "image",
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53eb89b2cf6ba7c144ec5a30_light10.jpg",
                      "caption": "",
                      "width": 1540,
                      "height": 962
                    },
                    {
                      "type": "image",
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53eb89bfd056242e6a4c9520_light11.jpg",
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
        <img src="${pageContext.servletContext.contextPath}/resources/images/work5.jpg" alt="${pageContext.servletContext.contextPath}/resources/images/53eb8193cf6ba7c144ec594f_work5.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #5</a>
        </div>
        <div class="catergory">print, photography</div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/work6.jpg" alt="${pageContext.servletContext.contextPath}/resources/images/53eb81a2cf6ba7c144ec5952_work6.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #6</a>
        </div>
        <div class="catergory">print, photography</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/project-page">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "items": [
                    {
                      "type": "image",
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53eb89d4cf6ba7c144ec5a38_light8.jpg",
                      "caption": "",
                      "width": 755,
                      "height": 469
                    },
                    {
                      "type": "image",
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53eb89decf6ba7c144ec5a3a_light9.jpg",
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
        <img src="${pageContext.servletContext.contextPath}/resources/images/work8.jpg" alt="${pageContext.servletContext.contextPath}/resources/images/53eb896dd056242e6a4c9517_work8.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #7</a>
        </div>
        <div class="catergory">print, photography</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/project-page">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b03c8c9212bd60b999e4_ico4b.png">
              <script type="application/json" class="w-json">
                {
                  "items": [
                    {
                      "type": "image",
                      "url": "https://daks2k3a4ib2z.cloudfront.net/5420869c24ed7cd271a3ef44/53eb89f1cf6ba7c144ec5a3b_light13.jpg",
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
        <img src="${pageContext.servletContext.contextPath}/resources/images/work7.jpg" alt="${pageContext.servletContext.contextPath}/resources/images/53eb821ba6f42a2f6a36702e_work7.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #8</a>
        </div>
        <div class="catergory">print, photography</div>
        <div class="portfolio-overlay">
          <div class="ico-wrapper">
            <a class="w-inline-block ico-portfolio" href="${pageContext.servletContext.contextPath}/project-page">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="${pageContext.servletContext.contextPath}/resources/images/53e8b03c8c9212bd60b999e4_ico4b.png">
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
          <div class="copyright">� 2014 SparkLessons by Intuit</div>
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