<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com-->
<!-- Last Published: Tue Sep 23 2014 17:41:04 GMT+0000 (UTC) -->
<html data-wf-site="5420869c24ed7cd271a3ef44" data-wf-page="5421a85b7fed5ca22a8ad86e">
<head>
  <meta charset="utf-8">
  <title>Submit Payment Information - SparkLessons</title>
  <meta name="description" content="Payment Information">
  <meta name="keywords" content="Payment Page, Activate account">
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
          <img style="max-width :212px; max-height: 93px" src="${pageContext.servletContext.contextPath}/resources/images/lessons_logo.png" alt="5420a24882027adc73b7a86d_SL_Logo4.png">
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
        <h1 class="is pg"><span style="font-weight: 200;">get payment account</span><span class="light"></span></h1>
        <div class="subtx pg">get paid by any means by signing up for payments account</div>
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
      <form class="form-style" id="email-form"  modelAttribute="customer" name="email-form" data-name="Email Form" action="submit-payment-information" method="post">
        <label class="project-tittle" for="SSN">SOCIAL SECURITY NUMBER</label>
        <input class="w-input btn-style" id="SSN" type="text" placeholder="123456789" name="ssn" data-name="SSN" required="required">
        <label class="project-tittle" for="Date-of-Birth">DATE OF BIRTH</label>
        <input class="w-input btn-style" id="dob" type="text" placeholder="01/01/1971" name="dob" data-name="Date of Birth" required="required">
        <label class="project-tittle" for="Enter-Street-Address">ADDRESS</label>
        <input class="w-input btn-style" id="Enter-Street-Address" type="text" placeholder="Street Address" value="${address.streetAddress1}" name="streetAddress1" required="required" data-name="Enter Street Address">
        <input class="w-input btn-style" id="city" type="text" placeholder="Enter your City" name="city" value="${address.city}" required="required" data-name="Enter City">
        <select class="w-select select-style" id="State" name="State" data-name="State" value="${address.state}" required="required">
          	<option value="">Select a State</option>
          	<option value="AL">Alabama</option>
			<option value="AK">Alaska</option>
			<option value="AZ">Arizona</option>
			<option value="AR">Arkansas</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NV">Nevada</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WA">Washington</option>
			<option value="WV">West Virginia</option>
			<option value="WI">Wisconsin</option>
			<option value="WY">Wyoming</option>
        </select>
        <input class="w-input zip-style btn-style" style="size: 20px;" id="zipCode" value="${address.zipCode}" type="text" placeholder="Enter you Zipcode" name="zipCode" required="required" data-name="Enter your Zipcode">
        <label class="project-tittle" for="Routing-Number">DEPOSIT&nbsp;ACCOUNT&nbsp;INFORMATION</label>
        <input class="w-input btn-style" id="routing" type="text" placeholder="Routing Number"  name="routing" required="required" data-name="Routing Number">
        <input class="w-input btn-style" id="dda" type="text" placeholder="Account Number" name="dda" required="required" data-name="Account Number">
        <div class="w-row">
          <div class="w-col w-col-5 w-clearfix">
            <input class="w-button submit-btn" type="submit" value="GET PAY	MENT ACCOUNT" data-wait="Please wait...">
          </div>
          <div class="w-col w-col-2">
            <label class="text-fieldstyle">
              <br>OR&nbsp;</label>
          </div>
          <div class="w-col w-col-5">
            <input class="w-button submit-btn" type="submit" value="SKIP FOR NOW" data-wait="Please wait...">
          </div>
        </div>
      </form>
      <div class="w-form-done">
        <p>Thank you! Your submission has been received!</p>
      </div>
      <div class="w-form-fail">
        <p>Oops! Something went wrong while submitting the form :(</p>
      </div>
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
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico5b.png" width="50" alt="53e8b02aa758fb4f3644f741_ico5b.png">
            </a>
            <a class="w-lightbox w-inline-block" href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/images/ico4b.png" width="50" alt="53e8b03c8c9212bd60b999e4_ico4b.png">
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
        <img src="${pageContext.servletContext.contextPath}/resources/images/work5.jpg" alt="53eb8193cf6ba7c144ec594f_work5.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #5</a>
        </div>
        <div class="catergory">print, photography</div>
      </div>
      <div class="w-col w-col-3 w-col-stack portfolio-image">
        <img src="${pageContext.servletContext.contextPath}/resources/images/work6.jpg" alt="53eb81a2cf6ba7c144ec5952_work6.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #6</a>
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
        <img src="${pageContext.servletContext.contextPath}/resources/images/work8.jpg" alt="53eb896dd056242e6a4c9517_work8.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #7</a>
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
        <img src="${pageContext.servletContext.contextPath}/resources/images/work7.jpg" alt="53eb821ba6f42a2f6a36702e_work7.jpg">
        <div class="portfolio-tittle"><a class="tittle" href="#">project #8</a>
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
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/webflow.js"></script>
  <!--[if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>