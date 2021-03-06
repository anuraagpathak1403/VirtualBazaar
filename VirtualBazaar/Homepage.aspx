<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="VirtualBazaar.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap -->
      <script src="js/Dashboard.js"></script>
    <link href="CssHP/css/bootstrap.min.css" rel="stylesheet" />
    <link href="CssHP/css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
    <!-- //bootstrap -->
    <link href="CssHP/css/dashboard.css" rel="stylesheet" />
    <!-- Custom Theme files -->
    
    <link href="CssHP/css/style.css" rel='stylesheet' type='text/css' media="all" />
    <%--<script src="CssHP/js/jquery-1.11.1.min.js"></script>--%>
    <script src="js/jquery-2.1.4.js"></script>
    <script src="CssHP/js/bootstrap.min.js"></script>
    <!--start-smoth-scrolling-->
   
    <script src="css/ziehharmonika.js"></script>
    <link href="css/ziehharmonika.css" rel="stylesheet" />
    
    <!-- fonts -->
    <link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />
    <link href='//fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css' />
    <title></title>
    <%--<script>
        $(document).ready(function () {
            getAccordionData();
        });
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">
                        <h1>
                            <img src="CssHP/images/logo.png" alt="" /></h1>
                    </a>
                </div>
                
                <div id="navbar" class="navbar-collapse collapse">
<%--                    <div class="top-search">
                        <form class="navbar-form navbar-right">
                            <input type="text" class="form-control" placeholder="Search...">
                            <input type="submit" value=" ">
                        </form>
                    </div>--%>
                    <div class="header-top-right">
                        <div class="file">
                            <a href="upload.html">Upload</a>
                        </div>
                        <div class="signin">
                            <a href="#small-dialog2" class="play-icon popup-with-zoom-anim">Sign Up</a>
                            <!-- pop-up-box -->
                            <script type="text/javascript" src="CssHP/js/modernizr.custom.min.js"></script>
                            <link href="CssHP/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
                            <script src="CssHP/js/jquery.magnific-popup.js" type="text/javascript"></script>
                            <!--//pop-up-box -->
                            <div id="small-dialog2" class="mfp-hide">
                                <h3>Create Account</h3>
                                <div class="social-sits">
                                    <div class="facebook-button">
                                        <a href="#">Connect with Facebook</a>
                                    </div>
                                    <div class="chrome-button">
                                        <a href="#">Connect with Google</a>
                                    </div>
                                    <div class="button-bottom">
                                        <p>Already have an account? <a href="#small-dialog" class="play-icon popup-with-zoom-anim">Login</a></p>
                                    </div>
                                </div>
                                <div class="signup">
                                    <form>
                                        <input type="text" class="email" placeholder="Mobile Number" maxlength="10" pattern="[1-9]{1}\d{9}" title="Enter a valid mobile number" />
                                    </form>
                                    <div class="continue-button">
                                        <a href="#small-dialog3" class="hvr-shutter-out-horizontal play-icon popup-with-zoom-anim">CONTINUE</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div id="small-dialog3" class="mfp-hide">
                                <h3>Create Account</h3>
                                <div class="social-sits">
                                    <div class="facebook-button">
                                        <a href="#">Connect with Facebook</a>
                                    </div>
                                    <div class="chrome-button">
                                        <a href="#">Connect with Google</a>
                                    </div>
                                    <div class="button-bottom">
                                        <p>Already have an account? <a href="#small-dialog" class="play-icon popup-with-zoom-anim">Login</a></p>
                                    </div>
                                </div>
                                <div class="signup">
                                    <form>
                                        <input type="text" class="email" placeholder="Email" required="required" pattern="([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?" title="Enter a valid email" />
                                        <input type="password" placeholder="Password" required="required" pattern=".{6,}" title="Minimum 6 characters required" autocomplete="off" />
                                        <input type="text" class="email" placeholder="Mobile Number" maxlength="10" pattern="[1-9]{1}\d{9}" title="Enter a valid mobile number" />
                                        <input type="submit" value="Sign Up" />
                                    </form>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div id="small-dialog7" class="mfp-hide">
                                <h3>Create Account</h3>
                                <div class="social-sits">
                                    <div class="facebook-button">
                                        <a href="#">Connect with Facebook</a>
                                    </div>
                                    <div class="chrome-button">
                                        <a href="#">Connect with Google</a>
                                    </div>
                                    <div class="button-bottom">
                                        <p>Already have an account? <a href="#small-dialog" class="play-icon popup-with-zoom-anim">Login</a></p>
                                    </div>
                                </div>
                                <div class="signup">
                                    <form action="upload.html">
                                        <input type="text" class="email" placeholder="Email" required="required" pattern="([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?" title="Enter a valid email" />
                                        <input type="password" placeholder="Password" required="required" pattern=".{6,}" title="Minimum 6 characters required" autocomplete="off" />
                                        <input type="submit" value="Sign In" />
                                    </form>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div id="small-dialog4" class="mfp-hide">
                                <h3>Feedback</h3>
                                <div class="feedback-grids">
                                    <div class="feedback-grid">
                                        <p>Suspendisse tristique magna ut urna pellentesque, ut egestas velit faucibus. Nullam mattis lectus ullamcorper dui dignissim, sit amet egestas orci ullamcorper.</p>
                                    </div>
                                    <div class="button-bottom">
                                        <p><a href="#small-dialog" class="play-icon popup-with-zoom-anim">Sign in</a> to get started.</p>
                                    </div>
                                </div>
                            </div>
                            <div id="small-dialog5" class="mfp-hide">
                                <h3>Help</h3>
                                <div class="help-grid">
                                    <p>Suspendisse tristique magna ut urna pellentesque, ut egestas velit faucibus. Nullam mattis lectus ullamcorper dui dignissim, sit amet egestas orci ullamcorper.</p>
                                </div>
                                <div class="help-grids">
                                    <div class="help-button-bottom">
                                        <p><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">Feedback</a></p>
                                    </div>
                                    <div class="help-button-bottom">
                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Lorem ipsum dolor sit amet</a></p>
                                    </div>
                                    <div class="help-button-bottom">
                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Nunc vitae rutrum enim</a></p>
                                    </div>
                                    <div class="help-button-bottom">
                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Mauris at volutpat leo</a></p>
                                    </div>
                                    <div class="help-button-bottom">
                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Mauris vehicula rutrum velit</a></p>
                                    </div>
                                    <div class="help-button-bottom">
                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Aliquam eget ante non orci fac</a></p>
                                    </div>
                                </div>
                            </div>
                            <div id="small-dialog6" class="mfp-hide">
                                <div class="video-information-text">
                                    <h4>Video information & settings</h4>
                                    <p>Suspendisse tristique magna ut urna pellentesque, ut egestas velit faucibus. Nullam mattis lectus ullamcorper dui dignissim, sit amet egestas orci ullamcorper.</p>
                                    <ol>
                                        <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                        <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                        <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                        <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                        <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                    </ol>
                                </div>
                            </div>
                            <script>
                                $(document).ready(function () {
                                    $('.popup-with-zoom-anim').magnificPopup({
                                        type: 'inline',
                                        fixedContentPos: false,
                                        fixedBgPos: true,
                                        overflowY: 'auto',
                                        closeBtnInside: true,
                                        preloader: false,
                                        midClick: true,
                                        removalDelay: 300,
                                        mainClass: 'my-mfp-zoom-in'
                                        
                                    });

                                });
                            </script>
                            
                        </div>
                        <div class="signin">
                            <a href="#small-dialog" class="play-icon popup-with-zoom-anim">Sign In</a>
                            <div id="small-dialog" class="mfp-hide">
                                <h3>Login</h3>
                                <div class="social-sits">
                                    <div class="facebook-button">
                                        <a href="#">Connect with Facebook</a>
                                    </div>
                                    <div class="chrome-button">
                                        <a href="#">Connect with Google</a>
                                    </div>
                                    <div class="button-bottom">
                                        <p>New account? <a href="#small-dialog2" class="play-icon popup-with-zoom-anim">Signup</a></p>
                                    </div>
                                </div>
                                <div class="signup">
                                    <form>
                                        <input type="text" class="email" placeholder="Enter email / mobile" required="required" pattern="([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?" />
                                        <input type="password" placeholder="Password" required="required" pattern=".{6,}" title="Minimum 6 characters required" autocomplete="off" />
                                        <input type="submit" value="LOGIN" />
                                    </form>
                                    <div class="forgot">
                                        <a href="#">Forgot password ?</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </nav>
       <div class="col-sm-3 col-md-2 sidebar">
                                                           <%-- <div class="col-md-12">--%>
                                                                <%--<div id="industriallist" style="overflow-y: scroll; height: 500px">--%>
                                                                    <div id="accordion" class="ziehharmonika">
                                                                   <%-- </div>--%>
                                                              <%--  </div>--%>
                                                            </div>
                                                        </div>
        <%--<div class="col-sm-3 col-md-2 sidebar">
            <div class="top-navigation">
                <div class="t-menu">MENU</div>
                <div class="t-img">
                    <img src="images/lines.png" alt="" />
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="drop-navigation drop-navigation">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="index.html" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li><a href="shows.html" class="user-icon"><span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span>TV Shows</a></li>
                    <li><a href="history.html" class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>History</a></li>
                    <li><a href="#" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>Movies<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
                    <ul class="cl-effect-2">
                        <li><a href="movies.html">English</a></li>
                        <li><a href="movies.html">Chinese</a></li>
                        <li><a href="movies.html">Hindi</a></li>
                    </ul>
                    <!-- script-for-menu -->
                    <script>
                        $("li a.menu1").click(function () {
                            $("ul.cl-effect-2").slideToggle(300, function () {
                                // Animation complete.
                            });
                        });
                    </script>
                    <li><a href="#" class="menu"><span class="glyphicon glyphicon-film glyphicon-king" aria-hidden="true"></span>Sports<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
                    <ul class="cl-effect-1">
                        <li><a href="sports.html">Football</a></li>
                        <li><a href="sports.html">Cricket</a></li>
                        <li><a href="sports.html">Tennis</a></li>
                        <li><a href="sports.html">Shattil</a></li>
                    </ul>
                    <!-- script-for-menu -->
                    <script>
                        $("li a.menu").click(function () {
                            $("ul.cl-effect-1").slideToggle(300, function () {
                                // Animation complete.
                            });
                        });
                    </script>
                    <li><a href="movies.html" class="song-icon"><span class="glyphicon glyphicon-music" aria-hidden="true"></span>Songs</a></li>
                    <li><a href="news.html" class="news-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>News</a></li>
                </ul>
                <!-- script-for-menu -->
                <script>
                    $(".top-navigation").click(function () {
                        $(".drop-navigation").slideToggle(300, function () {
                            // Animation complete.
                        });
                    });
                </script>
                <div class="side-bottom">
                    <div class="side-bottom-icons">
                        <ul class="nav2">
                            <li><a href="#" class="facebook"></a></li>
                            <li><a href="#" class="facebook twitter"></a></li>
                            <li><a href="#" class="facebook chrome"></a></li>
                            <li><a href="#" class="facebook dribbble"></a></li>
                        </ul>
                    </div>
                    <div class="copyright">
                        <p>Copyright © 2015 My Play. All Rights Reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="main-grids">
                <div class="top-grids">
                    <div class="recommended-info">
                        <h3>Recent Videos</h3>
                    </div>
                    <div class="col-md-4 resent-grid recommended-grid slider-top-grids">
                        <div class="resent-grid-img recommended-grid-img">
                            <a href="single.html">
                               <%-- <img src="CssHP/images/t1.jpg" alt="" /></a>--%>
                            <div class="time">
                                <p>3:04</p>
                            </div>
                            <div class="clck">
                                <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                            </div>
                        </div>
                        <div class="resent-grid-info recommended-grid-info">
                            <h3><a href="single.html" class="title title-info">Pellentesque vitae pulvinar tortor nullam interdum metus a imperdiet</a></h3>
                            <ul>
                                <li>
                                    <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                </li>
                                <li class="right-list">
                                    <p class="views views-info">2,114,200 views</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 resent-grid recommended-grid slider-top-grids">
                        <div class="resent-grid-img recommended-grid-img">
                            <a href="single.html">
                              <%--  <img src="images/t2.jpg" alt="" /></a>--%>
                            <div class="time">
                                <p>7:23</p>
                            </div>
                            <div class="clck">
                                <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                            </div>
                        </div>
                        <div class="resent-grid-info recommended-grid-info">
                            <h3><a href="single.html" class="title title-info">Interdum pellentesque vitae pulvinar tortor nullam metus a imperdiet</a></h3>
                            <ul>
                                <li>
                                    <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                </li>
                                <li class="right-list">
                                    <p class="views views-info">4,200 views</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 resent-grid recommended-grid slider-top-grids">
                        <div class="resent-grid-img recommended-grid-img">
                            <a href="single.html">
                                <%--<img src="images/t3.jpg" alt="" /></a>--%>
                            <div class="time">
                                <p>4:04</p>
                            </div>
                            <div class="clck">
                                <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                            </div>
                        </div>
                        <div class="resent-grid-info recommended-grid-info">
                            <h3><a href="single.html" class="title title-info">Nullam interdum metus a imperdiet pellentesque vitae pulvinar tortor</a></h3>
                            <ul>
                                <li>
                                    <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                </li>
                                <li class="right-list">
                                    <p class="views views-info">71,174 views</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="recommended">
                    <div class="recommended-grids">
                        <div class="recommended-info">
                            <h3>Animated Cartoon</h3>
                        </div>
                       <%-- <script src="CssHP/js/responsiveslides.min.js"></script>--%>
                      
                          
                        <div id="top" class="callbacks_container">
                            <ul class="rslides" id="slider3">
                                <li>
                                    <div class="animated-grids">
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                   <%-- <img src="images/c.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>7:34</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Varius sit sed viverra nullam viverra nullam interdum metus</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                  <%--  <img src="images/c1.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>6:23</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Nullam interdum metus varius viverra nullam sit amet viverra</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">14,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                   <%-- <img src="images/c2.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>2:45</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Varius sit sed viverra nullam viverra nullam interdum metus</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                   <%-- <img src="images/c3.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>4:34</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </li>
                                <li>
                                    <div class="animated-grids">
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                  <%--  <img src="images/c1.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>4:42</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Varius sit sed viverra viverra nullam nullam interdum metus</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                    <%--<img src="images/c2.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>6:14</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                   <%-- <img src="images/c3.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>2:34</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">varius sit sed viverra viverra nullam Nullam interdum metus</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                  <%--  <img src="images/c.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>5:12</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">1,14,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </li>
                                <li>
                                    <div class="animated-grids">
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                  <%--  <img src="images/c2.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>4:42</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Varius sit sed viverra viverra nullam nullam interdum metus</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                    <%--<img src="images/c3.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>6:14</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                  <%--  <img src="images/c.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>2:34</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">varius sit sed viverra viverra nullam Nullam interdum metus</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                   <%-- <img src="images/c3.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>5:12</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">1,14,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </li>
                                <li>
                                    <div class="animated-grids">
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                    <%--<img src="images/c3.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>4:42</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Varius sit sed viverra viverra nullam nullam interdum metus</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
<%--                                                    <img src="images/c.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>6:14</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                    <%--<img src="images/c1.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>2:34</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">varius sit sed viverra viverra nullam Nullam interdum metus</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">2,114,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html">
                                                   <%-- <img src="images/c2.jpg" alt="" /></a>--%>
                                                <div class="time small-time slider-time">
                                                    <p>5:12</p>
                                                </div>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                                    </div>
                                                    <div class="slid-bottom-grid slid-bottom-right">
                                                        <p class="views views-info">1,14,200 views</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="recommended">
                    <div class="recommended-grids">
                        <div class="recommended-info">
                            <h3>Recommended</h3>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
<%--                                    <img src="images/r1.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>2:34</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Varius sit sed viverra viverra nullam nullam interdum metus</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                   <%-- <img src="images/r2.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>3:02</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                    <%--<img src="images/r3.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>1:34</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Varius sit sed viverra nullam viverra nullam interdum metus</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                    <%--<img src="images/r4.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>2:09</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Nullam interdum viverra nullam metus varius sit sed viverra</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="recommended-grids">
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                   <%-- <img src="images/r4.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>6:34</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Varius sit sed viverra nullam viverra nullam interdum metus</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                    <%--<img src="images/r5.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>7:34</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                   <%-- <img src="images/r6.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>6:09</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Varius sit sed viverra nullam viverra nullam interdum metus</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                  <%--  <img src="images/r1.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>9:04</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="recommended">
                    <div class="recommended-grids">
                        <div class="recommended-info">
                            <h3>Sports</h3>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                  <%--  <img src="images/g.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>7:30</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Varius sit sed viverra nullam viverra nullam interdum metus</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                  <%--  <img src="images/g1.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>9:34</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Nullam interdum viverra nullam metus varius sit sed viverra</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                    <%--<img src="images/g2.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>5:34</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Varius sit sed viverra nullam viverra nullam interdum metus</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                  <%--  <img src="images/g3.jpg" alt="" /></a>--%>
                                <div class="time small-time">
                                    <p>6:55</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="recommended-grids">
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                    <%--<img src="images/we2.jpg" alt=""></a>--%>
                                <div class="time small-time">
                                    <p>7:30</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Varius sit sed viverra nullam viverra nullam interdum metus</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                    <%--<img src="images/we1.jpg" alt=""></a>--%>
                                <div class="time small-time">
                                    <p>9:34</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Nullam interdum viverra nullam metus varius sit sed viverra</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                  <%--  <img src="images/we4.jpg" alt=""></a>--%>
                                <div class="time small-time">
                                    <p>5:34</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Varius sit sed viverra nullam viverra nullam interdum metus</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 resent-grid recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <a href="single.html">
                                    <%--<img src="images/we3.jpg" alt=""></a>--%>
                                <div class="time small-time">
                                    <p>6:55</p>
                                </div>
                                <div class="clck small-clck">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="resent-grid-info recommended-grid-info video-info-grid">
                                <h5><a href="single.html" class="title">Nullam interdum metus viverra nullam varius sit sed viverra</a></h5>
                                <ul>
                                    <li>
                                        <p class="author author-info"><a href="#" class="author">John Maniya</a></p>
                                    </li>
                                    <li class="right-list">
                                        <p class="views views-info">2,114,200 views</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!-- footer -->
            <div class="footer">
                <div class="footer-grids">
                    <div class="footer-top">
                        <div class="footer-top-nav">
                            <ul>
                                <li><a href="about.html">About</a></li>
                                <li><a href="press.html">Press</a></li>
                                <li><a href="copyright.html">Copyright</a></li>
                                <li><a href="creators.html">Creators</a></li>
                                <li><a href="#">Advertise</a></li>
                                <li><a href="developers.html">Developers</a></li>
                            </ul>
                        </div>
                        <div class="footer-bottom-nav">
                            <ul>
                                <li><a href="terms.html">Terms</a></li>
                                <li><a href="privacy.html">Privacy</a></li>
                                <li><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">Send feedback</a></li>
                                <li><a href="privacy.html">Policy & Safety </a></li>
                                <li><a href="try.html">Try something new!</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="footer-bottom">
                        <ul>
                            <li class="languages">
                                <select class="form-control bfh-countries" data-country="US">
                                    <option value="">Select Language</option>
                                    <option>Spanish</option>
                                    <option>French</option>
                                    <option>Amharic</option>
                                </select>
                            </li>
                            <li class="languages">
                                <select class="form-control bfh-countries">
                                    <option value="">Select Country</option>
                                    <option value="AFG">Afghanistan</option>
                                    <option value="ZWE">Zimbabwe</option>
                                </select>
                            </li>
                            <li class="languages">
                                <select class="form-control bfh-countries" data-country="US">
                                    <option value="">Safety Off</option>
                                    <option value="">Safety On</option>
                                </select>
                            </li>
                            <li><a href="history.html" class="f-history">History</a></li>
                            <li><a href="#small-dialog5" class="play-icon popup-with-zoom-anim f-history f-help">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- //footer -->
        </div>
        <div class="clearfix"></div>
        <div class="drop-menu">
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Regular link</a></li>
                <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Disabled link</a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another link</a></li>
            </ul>
        </div>
        <!-- Bootstrap core JavaScript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
       
        <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    </form>
</body>
</html>
