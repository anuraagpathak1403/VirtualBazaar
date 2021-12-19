<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VirtualBazaar.Default" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home | Vadsbiz</title>
    <script src="NewVADS/js/jquery-3.1.1.min.js"></script>
    <script src="NewVADS/js/bootstrap.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   
    <script>
        // Get the modal
        var modal = document.getElementById('signin');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
    <!--css-->
    <link rel="apple-touch-icon" sizes="57x57" href="images/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="images/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="images/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="images/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="images/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="images/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="images/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
    <link rel="manifest" href="images/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="images/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link href="NewVADS/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="NewVADS/css/navbar-fixed-side.css" rel="stylesheet" type="text/css">
    <link href="NewVADS/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="NewVADS/css/style.css" rel="stylesheet" type="text/css">
    <link href="NewVADS/css/responsive.css" rel="stylesheet" type="text/css">
    <!--css-->

    <script>
        $(document).ready(function () {
            function displayLocation(latitude, longitude) {
                var request = new XMLHttpRequest();

                var method = 'GET';
                var url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + latitude + ',' + longitude + '&sensor=true';
                var async = true;

                request.open(method, url, async);
                request.onreadystatechange = function () {
                    if (request.readyState == 4 && request.status == 200) {
                        var data = JSON.parse(request.responseText);                        
                        var addressComponents = data.results[0].address_components;                       
                        var Location = addressComponents[0].long_name + ", " + addressComponents[1].long_name + ", " + addressComponents[3].long_name + ", " + addressComponents[4].long_name;
                        $("#txtaddressComponents").val(Location);                       
                    }
                };
                request.send();
            };

            var successCallback = function (position) {
                var x = position.coords.latitude;
                var y = position.coords.longitude;
                displayLocation(x, y);
            };


            navigator.geolocation.getCurrentPosition(successCallback);

        });
 </script>
    

    

    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 900);
            });
        });
    </script>
    <script>
        $("document").ready(function () {
            $("#video").simplePlayer();
        });
    </script>
    <script>
        $("document").ready(function () {
            $("#video1").simplePlayer();
        });
    </script>
    <script>
        $("document").ready(function () {
            $("#video2").simplePlayer();
        });
    </script>
    <script>
        $("document").ready(function () {
            $("#video3").simplePlayer();
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
        });

        $(document).ready(function () {
            $('.loginn-btn').click(function () {
                $('.loginn-bar').animate({ width: '100%' }, 'slow', function () {
                    $('.loginn-box').show();
                });
            });

            $('.loginn-bar-close').click(function () {
                $('.loginn-box').hide();
                $('.loginn-bar').animate({ width: '0%' }, 'slow');
            });
        });


        function SearchText() {
            $("#txtSerchValue").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Default.aspx/GetOrgName",
                        data: "{'SearchValue':'" + document.getElementById('txtSerchValue').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("No Match");
                        }
                    });
                }
            });
        }

        $(document).ready(function () {
            var touch = $('#resp-menu');
            var menu = $('.menu');

            $(touch).on('click', function (e) {
                e.preventDefault();
                menu.slideToggle();
            });

            $(window).resize(function () {
                var w = $(window).width();

                // breakpoint
                if (w > 767 && menu.is(':hidden')) {
                    menu.removeAttr('style');
                }
            });

        });


    </script>
    <!-- pop-up-box -->
    <script>
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion           
                width: 'auto', //auto or any width like 600px
                fit: true,   // 100% fit in a container
                closed: 'accordion', // Start closed if in accordion view
                activate: function (event) { // Callback function if tab is switched
                    var $tab = $(this);
                    var $info = $('#tabInfo');
                    var $name = $('span', $info);
                    $name.text($tab.text());
                    $info.show();
                }
            });
            $('#verticalTab').easyResponsiveTabs({
                type: 'vertical',
                width: 'auto',
                fit: true
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
        });
    </script>
    <!-- //Dropdown-Menu-JavaScript -->
    <style type="text/css">
        .Padding {
            padding: 10px;
        }

        ul {
            text-align: left;
        }

        * {
            box-sizing: border-box;
        }

        a:hover {
            color: red;
        }

        ::-webkit-input-placeholder { /* Chrome/Opera/Safari */
            color: black;
        }

        ::-moz-placeholder { /* Firefox 19+ */
            color: black;
        }

        :-ms-input-placeholder { /* IE 10+ */
            color: black;
        }

        :-moz-placeholder { /* Firefox 18- */
            color: black;
        }

        .Star {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }

        .WaitingStar {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }

        .FilledStar {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }


        .Loginbutton {
            background-color: #5cb85c;
        }

        .radioboxlist radioboxlistStyle {
            font-size: x-large;
            padding-right: 20px;
        }

        .radioboxlist label {
            color: #3E3928;
            background-color: #E8E5D4;
            padding-left: 6px;
            padding-right: 16px;
            padding-top: 2px;
            padding-bottom: 2px;
            border: 1px solid #AAAAAA;
            white-space: nowrap;
            clear: left;
            margin-right: 10px;
            margin-left: 10px;
        }

        .loginn-btn {
            background-color: #4e3e84;
            position: fixed;
            top: 35%;
            padding: 10px;
            border-radius: 4px;
            transform: rotate(90deg);
            width: 141px;
            text-align: center;
            color: #fff;
            cursor: pointer;
            right: -46;
            z-index: 999;
            min-height: 30px;
        }

        .loginn-bar {
            background-color: #157ecc;
            position: absolute;
            left: 0;
            top: 26%;
            height: 350px;
            width: 0%;
            z-index: 99;
        }

        .loginn-bar-close {
            background-color: #2ebfac;
            position: absolute;
            top: -30px;
            right: 10px;
            font-size: 32px;
            cursor: pointer;
        }

        .loginn-box {
            width: 500px;
            height: 300px;
            padding: 5px 15px;
            margin: 0 auto;
            z-index: 999;
            position: relative;
            display: none;
        }

        .btn-primary {
            color: #fff;
            background-color: #4e3e84;
            border-color: #4e3e84;
        }



        input:checked + label {
            color: #CC3300;
            background: #D1CFC2;
        }

        .dropdwn {
            width: 90%;
            outline: none;
            color: black;
            font-size: 1.1em;
            border: 1px solid #050505;
            padding: 14px 0px 14px 25px;
            border-radius: 50px;
            background: none;
        }

        .logo {
            height: 50px;
        }

        #nav li a {
            color: white;
            font: italic;
            font-size: 14px;
        }

        .dropdown-submenu {
            position: relative;
        }

            .dropdown-submenu > .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -6px;
                margin-left: -1px;
                -webkit-border-radius: 0 6px 6px 6px;
                -moz-border-radius: 0 6px 6px 6px;
                border-radius: 0 6px 6px 6px;
                -webkit-transition: height .5s ease;
                -webkit-transition-delay: .4s;
            }

            .dropdown-submenu > a:after {
                display: block;
                content: " ";
                float: right;
                width: 0;
                height: 0;
                border-color: transparent;
                border-style: solid;
                border-width: 5px 0 5px 5px;
                border-left-color: #cccccc;
                margin-top: 5px;
                margin-right: -10px;
            }

            .dropdown-submenu:hover > a:after {
                border-left-color: #555;
            }

            .dropdown-submenu.pull-left {
                float: none;
            }

                .dropdown-submenu.pull-left > .dropdown-menu {
                    left: -100%;
                    margin-left: 10px;
                    -webkit-border-radius: 6px 0 6px 6px;
                    -moz-border-radius: 6px 0 6px 6px;
                    border-radius: 6px 0 6px 6px;
                }

        .dropdown-submenu {
            position: relative;
        }

        .hoves:hover > .dropdown-menu {
            display: block !important;
            -webkit-transition: height .5s ease;
            -webkit-transition-delay: .4s;
            background-color: #2ebfac;
        }

        .share-it {
            position: fixed;
            min-height: 112px;
            width: 33px;
            background: #fff;
            right: 14;
            z-index: 999;
            top: 54%;
        }

            .share-it i {
                font-size: 16px;
            }

        a.multipage {
            background: #ee3046;
            border: 2px #ee3046 solid;
            color: #fff;
        }

            a.multipage:hover {
                background: #fff;
                border: 2px #fff solid;
                color: #333;
            }



        .modal-dialog {
            margin: 0px auto;
            border: 1px solid;
            background-color: white;
        }

        .modal-backdrop.fade {
            opacity: 0.1;
            filter: alpha(opacity=0.1);
        }

        .modal-content {
            position: relative;
            background-color: #FFF;
            border: 1px solid #CECECE;
            border-radius: 0px;
            -webkit-box-shadow: none;
            box-shadow: none;
            background-clip: padding-box;
            outline: 0;
        }

        #txtSerchValue {
            color: black;
        }

        .modal-header {
            padding: 11px 15px;
            background-color: #F8F8F8;
            background: -webkit-linear-gradient(top, #F8F8F8, #F2F2F2);
            background: -moz-linear-gradient(top, #f8f8f8, #f2f2f2);
            background: -ms-linear-gradient(top, #f8f8f8, #f2f2f2);
            background: -o-linear-gradient(top, #f8f8f8, #f2f2f2);
            background: linear-gradient(top, #f8f8f8, #f2f2f2);
        }

        .top-bar {
            background-color: black;
            min-height: 40px;
            padding-top: 5px;
            padding-bottom: 0px;
        }

            .top-bar .nav-text {
                color: #00BCD4;
                display: block;
                margin-top: 5px;
            }

            .top-bar .social {
                color: #FFF;
                display: inline-block;
                padding: 5px;
                text-decoration: none;
            }

            .top-bar .tools {
                margin: 0px;
                padding: 0px;
                list-style-type: none;
            }

                .top-bar .tools li {
                    list-style-type: none;
                    display: inline-block;
                }

                    .top-bar .tools li a {
                        display: block;
                        text-decoration: none;
                        color: #fff;
                        padding-left: 15px;
                        padding-top: 5px;
                    }

        .social:hover {
            -webkit-transform: scale(1.1);
            -moz-transform: scale(1.1);
            -o-transform: scale(1.1);
        }

        .social {
            -webkit-transform: scale(0.8);
            /* Browser Variations: */
            -moz-transform: scale(0.8);
            -o-transform: scale(0.8);
            -webkit-transition-duration: 0.5s;
            -moz-transition-duration: 0.5s;
            -o-transition-duration: 0.5s;
        }

        /*
    Multicoloured Hover Variations
*/

        #social-fb:hover {
            color: #3B5998;
        }

        #social-tw:hover {
            color: #4099FF;
        }

        #social-gp:hover {
            color: #d34836;
        }

        #social-em:hover {
            color: #f39c12;
        }

        .fa-3x {
            font-size: 2em;
        }

        .fixed-top {
            padding-top: 100px;
        }

        .txtBoxes {
            padding: 0 40px 0 12px !important;
            height: 38px;
            border-radius: 3px;
        }

        .btn1 {
            border: none;
            font-family: inherit;
            font-size: inherit;
            color: inherit;
            background: none;
            cursor: pointer;
            padding: 1px 8px;
            display: inline-block;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 500;
            outline: none;
            position: relative;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            transition: all 0.3s;
            background: #e94e38;
            color: #fff;
            font-size: 1.1em;
            text-shadow: -1px 0px 1px rgba(214, 214, 214, 0.59);
            -webkit-text-shadow: -1px 0px 1px rgba(214, 214, 214, 0.59);
            -moz-text-shadow: -1px 0px 1px rgba(214, 214, 214, 0.59);
            -o-text-shadow: -1px 0px 1px rgba(214, 214, 214, 0.59);
        }

        .btn-2 {
            background: #e94e38;
            color: #fff;
            box-shadow: 0 3px #c1412e;
            -webkit-transition: none;
            -moz-transition: none;
            transition: none;
        }

        .btn-2g {
            border-radius: 40px;
            -webkit-border-radius: 40px;
            -moz-border-radius: 40px;
            -o-border-radius: 40px;
        }

        #logoBg {
            /*height: 41px;
            width: 110px;*/
        }

        .topnav {
            display: block;
        }

            .topnav li {
                margin: 0px 6px;
            }

        .header .topnav li a {
            color: #000;
            font-size: 13px;
            padding: 3px 3px;
            font-weight: 200;
        }

        .followUs a {
            float: left;
        }
    </style>
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '{your-app-id}',
                cookie: true,
                xfbml: true,
                version: '{latest-api-version}'
            });

            FB.AppEvents.logPageView();

        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
    <script>

        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    </script>
</head>

<body>
    <form id="form1" runat="server" >
        <asp:ScriptManager ID="Script1" runat="server"></asp:ScriptManager>

        <div class="navbar-fixed-top" style="padding-top: 0px">
            <header class="header" style="background-color: #f1f1f1; padding-bottom: 2px">
                <div class="container">
                    <ul class="nav navbar-nav navbar-right topnav ">
                        <li class="followUs">
                            <a href="#"><i class="fa fa-facebook fa-fw"></i></a>
                            <a href="#"><i class="fa fa-twitter fa-fw"></i></a>
                            <a href="#"><i class="fa fa-google-plus fa-fw"></i></a>
                            <a href="#"><i class="fa fa-youtube fa-fw"></i></a>
                        </li>
                        <li class="active"><a href="callto:9297777509"><i class="fa fa-phone fa-fw"></i><b>+91 9297777509 </b></a></li>
                        <li class="active"><a href="mailto:info@vadsbiz.com"><i class="fa fa-envelope fa-fw"></i>info@vadsbiz.com</a></li>
                    </ul>
                </div>
            </header>
            <div class="container-fluid" style="padding-top: 2px">
                <div>

                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <a href="Default.aspx">
                            <img src="images/logo.png" class="img-responsive" id="logoBg"></a>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="search_box">
                            <asp:DropDownList ID="ddlCategory" CssClass="txtBoxes" Width="100%" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="search_box">
                            <asp:TextBox ID="txtSerchValue" placeholder="Search by location" CssClass="txtBoxes" runat="server" Width="100%"></asp:TextBox>
                            <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="2"
                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtSerchValue"
                                ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                            </ajaxToolkit:AutoCompleteExtender>
                          
                          
                        </div>
                       
                         </div>
                     <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="search_box">
                             <asp:TextBox ID="txtaddressComponents" placeholder="Search by location" Width="100%" Enabled="false" ClientIDMode="Static"  runat="server" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <label>
                            <asp:Button class="btn1 btn-2 btn-2g" ID="btnSumit" runat="server" Text="Search" OnClick="btnSumit_Click" />
                        </label>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-12" style="text-align: right">
                        <asp:LinkButton ID="lblLoginName" class="btn1 btn-2 btn-2g" Font-Size="Medium" runat="server" OnClick="lblLoginName_Click"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="container-fluid nav_body_sec">
            <div class="row body_row">
                <div class="col-sm-3 col-lg-2">
                    <nav class="navbar navbar-default navbar-fixed-side">
                        <div class="navbar-header">
                            <h1 class="heading responsive_heading">Vadsbiz</h1>
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <h1 class="navbar_heading">Vadsbiz</h1>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="Default.aspx">
                                    <img src="images/home_decor.png" class="img-responsive">Home</a></li>
                                <li><a href="../AboutUs.aspx">
                                    <img src="images/About_us.png" class="img-responsive">About Us</a></li>
                                <li><a href="../OurTeam.aspx">
                                    <img src="images/education_hub.png" class="img-responsive">Team Members</a></li>
                                <li><a href="../CareerUs.aspx">
                                    <img src="images/emergency.png" class="img-responsive">Career</a></li>
                                <li><a href="../PrivacyPolicy.aspx">
                                    <img src="images/PP.png" class="img-responsive">Privacy Policy</a></li>
                                <li><a href="http://www.directimp.com/contact.php" target="_blank">
                                    <img src="images/restaurants.png" class="img-responsive">Contact</a></li>
                                <%-- <li><a href="#">
                                    <img src="images/home_decor.png" class="img-responsive">Home Decor</a></li>
                                <li><a href="#">
                                    <img src="images/medical.png" class="img-responsive">Medical</a></li>
                                <li><a href="#">
                                    <img src="images/music.png" class="img-responsive">Music</a></li>
                                <li><a href="#">
                                    <img src="images/restaurants.png" class="img-responsive">Restaurants</a></li>
                                <li><a href="#">
                                    <img src="images/sports.png" class="img-responsive">Sports</a></li>
                                <li><a href="#">
                                    <img src="images/travel.png" class="img-responsive">Travel</a></li>--%>
                                <li><a href="#">GST No: 10AAECD9324MIZO</a></li>
                            </ul>
                            <p align="center">
                                Copyright © 2017 Vadsbiz.
 				All Rights Reserved
                            </p>
                        </div>
                        <div class="footer_icon">
                            <ul class="list-inline">
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                            </ul>

                        </div>
                    </nav>
                </div>
                <!---->
                <div class="col-md-9 col-sm-9 col-lg-9 home_body_sec body_sec">
                    <h1 style="color: black; font-family: 'Microsoft Sans Serif';">Online Video Business Directory</h1>
                    <div id="TopRated" runat="server" style="width: auto">
                        <asp:GridView ID="grdvCategory" runat="server" ClientIDMode="Static" ShowHeaderWhenEmpty="true" EmptyDataText="No Request Found" AutoGenerateColumns="False" GridLines="None" HeaderStyle-Wrap="true"
                            ShowFooter="false" ShowHeader="false" OnRowDataBound="grdvCategory_RowDataBound" CssClass="GridTabletrCss table table-striped table-bordered table-hover display" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-ForeColor="Red">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="shopping malls category_sec">
                                            <h1 class="heading">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnCategoryID" runat="server" Value='<%# Eval("CategoryID") %>' />
                                                </div>
                                            </h1>
                                            <div class="row " style="padding-top: 4%">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:DataList ID="DtlistAdvertisements" runat="server" HorizontalAlign="Left"
                                                        BorderStyle="None" CellPadding="0" CellSpacing="0" RepeatLayout="flow"
                                                        GridLines="none" RepeatColumns="8" RepeatDirection="Horizontal">
                                                        <ItemStyle BorderStyle="None" CssClass="ItemStyleCSS" />
                                                        <ItemTemplate>
                                                            <div class="thumbnail" style="margin-right: 4%;">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 thumbnail_box">
                                                                        <div>
                                                                            <div class="img-responsive">
                                                                                <a href='<%# Eval("Id", "PlayMyVideo.aspx?Id={0}") %>'>
                                                                                    <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' />
                                                                                </a>
                                                                                <div class="time pull-right">
                                                                                    <i class="fa fa-clock-o" aria-hidden="true">
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%#Convert.ToString(Eval("VideoTime")).Substring(3,5) %>'></asp:Label>
                                                                                    </i>
                                                                                </div>
                                                                                <div class="time pull-left">
                                                                                    <i class="fa fa-video-camera text-green"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                                                        <asp:HiddenField ID="hdnVideoID" runat="server" Value='<%# Eval("Id") %>' />
                                                                        <div class="caption text-center">
                                                                            <asp:Label ID="lblAdvertiserName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <span class="review">
                                                                    <div class="row" style="font-size: small; padding: 5px">
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="padding-left: 22px">
                                                                            <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments").ToString() + " Comments" %>'></asp:Label>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-right" style="padding-right: 30px">
                                                                            <asp:Label ID="lblViews" runat="server" Text='<%# Eval("Views").ToString() + " Views" %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row" style="padding-bottom: 2px">
                                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 text-center"></div>
                                                                        <p class="pull-right view">
                                                                            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 text-center">
                                                                                <asp:Panel ID="Panel1" runat="server" Enabled="false">
                                                                                    <ajaxToolkit:Rating ID="VideoRating" runat="server"
                                                                                        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star" CurrentRating='<%# Convert.ToInt32(Eval("Rating")) %>' FilledStarCssClass="FilledStar">
                                                                                    </ajaxToolkit:Rating>
                                                                                </asp:Panel>
                                                                            </div>
                                                                        </p>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: right;">
                                                        <asp:LinkButton ID="lnkbtnViewAll" runat="server" Text="View All...." OnClick="lnkbtnViewAll_Click"></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="shopping malls category_sec">
                        <div id="CategryWise" runat="server" visible="false">
                            <h1 class="heading">
                                <asp:Label ID="lblname" runat="server"></asp:Label>
                            </h1>
                            <div class="row ">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:DataList ID="dtlistCategoryWiseVideo" runat="server" HorizontalAlign="Left"
                                        BorderStyle="None" CellPadding="0" CellSpacing="0" RepeatLayout="Flow"
                                        GridLines="none" RepeatColumns="8" RepeatDirection="Horizontal">
                                        <ItemStyle BorderStyle="None" CssClass="ItemStyleCSS" />
                                        <ItemTemplate>
                                            <div class="thumbnail" style="margin-right: 5%">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 thumbnail_box">
                                                        <div class="img-responsive ">
                                                            <a href='<%# Eval("Id", "PlayMyVideo.aspx?Id={0}") %>'>
                                                                <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:HiddenField ID="hdnVideoID" runat="server" Value='<%# Eval("Id") %>' />
                                                        <div class="caption">
                                                            <asp:Label ID="lblAdvertiserName" runat="server" Font-Italic="true" Text='<%# Eval("Name") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="review">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                            <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments").ToString() + " Comments" %>'></asp:Label>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-right" style="padding-right: 30px">
                                                            <asp:Label ID="lblViews" runat="server" Text='<%# Eval("Views").ToString() + " Views" %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="padding-bottom: 2px">
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 text-center"></div>
                                                        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 text-center">
                                                            <asp:Panel ID="Panel1" runat="server" Enabled="false">
                                                                <ajaxToolkit:Rating ID="VideoRating" runat="server"
                                                                    StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star" CurrentRating='<%# Convert.ToInt32(Eval("Rating")) %>' FilledStarCssClass="FilledStar">
                                                                </ajaxToolkit:Rating>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="top_grid wow fadeInRight" data-wow-delay="0.4s">
                        <script src="FlowPlayer/flowplayer-3.2.12.min.js" type="text/javascript"></script>
                        <script type="text/javascript">
                            flowplayer("a.player", "http://releases.flowplayer.org/swf/flowplayer-3.2.16.swf", {
                                plugins: {
                                    pseudo: { url: "FlowPlayer/flowplayer.pseudostreaming-3.2.12.swf" }
                                },
                                clip: { provider: 'pseudo', autoPlay: false },
                            });

                            function playVideo() {
                                var video = document.getElementById('videoPlay');
                                var ID = document.getElementById('hdnVideoID').value;

                                if (video.play()) {
                                    window.location = 'PlayMyVideo.aspx?Idd=' + ID;
                                };
                            }
                        </script>
                    </div>

                </div>

            </div>
            <div class="body_row">
                <div class="footer_sec">
                    <ul class="list-inline footer_btn">
                        <li><a href="index.html">home</a></li>
                        <li><a href="#">about us</a></li>
                        <li><a href="#">business directory</a></li>
                        <li><a href="#">team member</a></li>
                        <li><a href="#">career</a></li>
                        <li><a href="#">privacy policy</a></li>
                    </ul>
                    <ul class="list-inline footer_terms_btn">
                        <li><a href="#">tems</a></li>
                        <li><a href="#">privacy</a></li>
                        <li><a href="#">send feedback</a></li>
                        <li><a href="#">policy & safety</a></li>
                        <li><a href="#">Try something new!</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </form>
</body>
</html>
