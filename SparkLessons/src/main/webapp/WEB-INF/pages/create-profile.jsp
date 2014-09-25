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
  <script>
    WebFont.load({
      google: {
        families: ["Raleway:100,200,300,regular,500,600,700,800,900","Arvo:regular,italic,700,700italic","Libre Baskerville:regular,italic,700"]
      }
    });
  </script>
  <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/modernizr.js"></script>
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.servletContext.contextPath}/img/favicon.ico">
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
          <img src="${pageContext.servletContext.contextPath}/resources/images/SL_Logo4.png" alt="${pageContext.servletContext.contextPath}/5420a24882027adc73b7a86d_SL_Logo4.png">
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
    
     <div class="w-row">
      <div class="w-col w-col-3"></div>
      <div class="w-col w-col-6">
        <div class="w-form">
	      <form:form class="w-clearfix form-style" modelAttribute="user"  enctype="multipart/form-data" action="updateprofile" method="post" id="email-form" name="email-form" data-name="Email Form">
	        <label class="project-tittle" for="firstname">FULL NAME</label>
	        <form:input class="w-input btn-style" id="firstname" type="text" placeholder="Enter your firstname" name="firstname" data-name="FirstName" path="firstname"/>
	        <form:input class="w-input btn-style" id="lastname" type="text" placeholder="Enter your lastname" name="lastname" data-name="LastName" path="lastname"/>
	        <label class="project-tittle" for="email">EMAIL ADDRESS</label>
	        <form:input class="w-input btn-style" id="email" type="email" placeholder="Enter your email address" name="email" data-name="email" required="required" path="email"/>
	        <c:if test="${newuser}">
	         	<label class="project-tittle" for="email">PASSWORD</label>
	        	<input class="w-input btn-style" id="password" type="password" placeholder="Enter password" name="password" data-name="password" required="required"/>
	        </c:if>
	        <label class="project-tittle" for="Lesson-Name">NAME YOUR LESSON</label>
	        <input class="w-input btn-style" id="Lesson-Name" type="text" placeholder="Piano Lessons" name="lessonname" required="required" data-name="lessonname">
	        <label class="project-tittle" for="Description-of-Lesson">DESCRIBE ABOUT YOUR LESSON</label>
	        <form:textarea path="description" class="w-input btn-style" id="Description-of-Lesson" placeholder="Describe about the lesson you want to give" name="description" data-name="Description of Lesson" required="required"/>
	        <label class="project-tittle" for="Price-of-lesson">RATE</label>
	        <form:input path="rate" class="w-input btn-style" id="Price-of-lesson" type="text" placeholder="$25.00" name="rate" required="required" data-name="rate"/>
	        <label class="project-tittle" for="Category-of-lesson">CATEGORIES</label>
	        <textarea class="w-input btn-style" id="Category-of-lesson" placeholder="Categorize your lesson so that your prospective student can find it easily" name="lessoncategory" data-name="lessoncategory"></textarea>
	        <div style="padding-bottom: 20px;padding-top: 10px">
		        <label class="project-tittle">UPLOAD LESSON IMAGE HERE</label> <br/>
			    <input  type="file" name="file" class="project-tittle"/>
		    </div>
	        <input class="w-button submit-btn" type="submit" value="CREATE YOUR PROFILE" data-wait="Please wait...">
	      </form:form>
        </div>
      </div>
      <div class="w-col w-col-3"></div>
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