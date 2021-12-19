<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlayMyVideo.aspx.cs" Inherits="VirtualBazaar.PlayMyVideo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html prefix="og: http://ogp.me/ns#">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Vadsbiz</title>
    <meta property="og:type" content="video" />
    <!-- site/page type more information http://ogp.me/ -->
    <meta property="og:video:type" content="application/x-shockwave-flash" />
    <!-- you need this because your player is a SWF player -->
    <meta property="og:video:width" content="Width in Pixels" />
    <!-- player width -->
    <meta property="og:video:height" content="Height in Pixels" />
    <!-- player height -->
    <meta property="og:video" content="http://example.com/{path_to}/{swf_player}.swf?url={video_soure}" />
    <!-- You will need to echo/print the video source (*.mp4) with server-side code -->
    <meta property="og:video:secure_url" content="https://example.com/{path_to}/{swf_player}.swf?url={video_soure}" />
    <script src="NewVADS/js/jquery-3.1.1.min.js"></script>
    <script src="NewVADS/js/bootstrap.js"></script>
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
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.11';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <!--css-->
    <link href="NewVADS/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="NewVADS/css/navbar-fixed-side.css" rel="stylesheet" type="text/css" />
    <link href="NewVADS/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="NewVADS/css/style.css" rel="stylesheet" type="text/css" />
    <link href="NewVADS/css/responsive.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        flowplayer("a.player", "http://releases.flowplayer.org/swf/flowplayer-3.2.16.swf", {
            plugins: {
                pseudo: { url: "FlowPlayer/flowplayer.pseudostreaming-3.2.12.swf" }
            },
            clip: { provider: 'pseudo', autoPlay: false },
        });
    </script>

    <style type="text/css">
        html {
            touch-action: manipulation;
        }

        .widget .panel-body {
            padding: 0px;
        }

        .widget .list-group {
            margin-bottom: 0;
        }

        .widget .panel-title {
            display: inline;
        }

        .widget .label-info {
            float: right;
        }

        .widget li.list-group-item {
            border-radius: 0;
            border: 0;
            border-top: 1px solid #ddd;
        }

            .widget li.list-group-item:hover {
                background-color: rgba(86,61,124,.1);
            }

        .widget .mic-info {
            color: #666666;
            font-size: 11px;
        }

        .widget .action {
            margin-top: 5px;
        }

        .widget .comment-text {
            font-size: 12px;
        }

        .widget .btn-block {
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
        }

        .Padding {
            padding: 10px;
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
        /* footer social icons */
        ul.social-network {
            list-style: none;
            display: inline;
            margin-left: 0 !important;
            padding: 0;
        }

            ul.social-network li {
                display: inline;
                margin: 0 5px;
            }


        /* footer social icons */
        .social-network a.icoRss:hover {
            background-color: #F56505;
        }

        .social-network a.icoFacebook:hover {
            background-color: #3B5998;
        }

        .social-network a.icoTwitter:hover {
            background-color: #33ccff;
        }

        .social-network a.icoGoogle:hover {
            background-color: #BD3518;
        }

        .social-network a.icoVimeo:hover {
            background-color: #0590B8;
        }

        .social-network a.icoLinkedin:hover {
            background-color: #007bb7;
        }

            .social-network a.icoRss:hover i, .social-network a.icoFacebook:hover i, .social-network a.icoTwitter:hover i,
            .social-network a.icoGoogle:hover i, .social-network a.icoVimeo:hover i, .social-network a.icoLinkedin:hover i {
                color: #fff;
            }

        a.socialIcon:hover, .socialHoverClass {
            color: #44BCDD;
        }

        .social-circle li a {
            display: inline-block;
            position: relative;
            margin: 0 auto 0 auto;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            border-radius: 50%;
            text-align: center;
            width: 50px;
            height: 50px;
            font-size: 20px;
        }

        .social-circle li i {
            margin: 0;
            line-height: 50px;
            text-align: center;
        }

        .social-circle li a:hover i, .triggeredHover {
            -moz-transform: rotate(360deg);
            -webkit-transform: rotate(360deg);
            -ms--transform: rotate(360deg);
            transform: rotate(360deg);
            -webkit-transition: all 0.2s;
            -moz-transition: all 0.2s;
            -o-transition: all 0.2s;
            -ms-transition: all 0.2s;
            transition: all 0.2s;
        }

        .social-circle i {
            color: #fff;
            -webkit-transition: all 0.8s;
            -moz-transition: all 0.8s;
            -o-transition: all 0.8s;
            -ms-transition: all 0.8s;
            transition: all 0.8s;
        }
    </style>
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
    </style>

    <style>
        .Padding {
            padding: 10px;
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

        #videoPlay {
            width: 100%;
            height: auto;
        }
    </style>
    <script>
    function displayCoordinates(pnt) {
    var coordsLabel = document.getElementById("tdCursor");
    var lat = pnt.lat();
    lat = lat.toFixed(6);
    var lng = pnt.lng();
    lng = lng.toFixed(6);
    coordsLabel.innerHTML = lng + "," + lat;
    }
        </script>
    <script>
        $('#dropdown').hover(function () {
            $(this).AddClass('open');
        })
    </script>
    <script>
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
    <script type="text/javascript">
        function Message(title, cssClass, msg) {
            $("#ShowBody").empty();
            $("#ShowTitle").empty();

            $(".modal-header").removeClass('btn-danger btn-success btn-warning');
            $("#ShowTitle").removeClass('btn-danger btn-success btn-warning');
            $("#ShowTitle").addClass(cssClass);
            $(".modal-header").addClass(cssClass)
            if (cssClass === 'btn-danger') {
                $("#modalbtn").removeClass('btn-success btn-warning');
                $("#modalbtn").addClass('btn-danger');
                $("#Icon").removeClass('glyphicon-thumbs-up glyphicon-warning-sign');
                $("#Icon").addClass('glyphicon-thumbs-down');
            }
            else if (cssClass === 'btn-success') {
                $("#modalbtn").removeClass('btn-danger btn-warning');
                $("#modalbtn").addClass('btn-success');
                $("#Icon").removeClass('glyphicon-thumbs-down glyphicon-warning-sign');
                $("#Icon").addClass('glyphicon-thumbs-up');
            }
            else {
                $("#modalbtn").removeClass('btn-danger btn-success ');
                $("#modalbtn").addClass('btn-warning');
                $("#Icon").removeClass('glyphicon-thumbs-down glyphicon-thumbs-up');
                $("#Icon").addClass('glyphicon-warning-sign');
            }



            $('#ShowBody').append('<p>' + msg + '</p>');


            $('#ShowTitle').append(title);
            $("#btnShowPopup").click();


        }
    </script>
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: 'your-app-id',
                autoLogAppEvents: true,
                xfbml: true,
                version: 'v2.11'
            });
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
        window.onload = function () {
            twttr.events.bind('tweet', function (event) {
                alert("Thanks for sharing on twitter");
            });

            twttr.events.bind('click', function (event) {
                alert("You are going to share in twitter");
            });
        }
    </script>
    <script>
        function lnksuccess(url) {
            alert("url = " + url + "  shared successfully");
        }
        function lnkerror(url) {
            alert("something goes wrong in url sharing");
        }
    </script>
    <script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
    <script type="IN/Share" data-onsuccess="lnksuccess" data-onerror="error" data-url="#strShareUrl"></script>
    <style>
        @import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css);

        /*----- Social Links -----*/
        .social-nav {
            padding: 0;
            list-style: none;
            margin: -10px 0 0 -10px;
        }

            .social-nav li {
                float: left;
                margin: 10px 0 0 10px;
                list-style: none;
            }

            .social-nav a {
                display: inline-block;
                float: left;
                width: 48px;
                height: 48px;
                font-size: 20px;
                color: #fff;
                text-decoration: none;
                cursor: pointer;
                text-align: center;
                line-height: 48px;
                background: #000;
                position: relative;
                transition: all 0.5s;
                -ms-transition: all 0.5s;
                -webkit-transition: all 0.5s;
                -moz-transition: all 0.5s;
            }

            .social-nav a {
                overflow: hidden;
                font-size: 26px;
                border-radius: 4px;
            }

                .social-nav a:hover {
                    background: #fff;
                    text-shadow: 0px 0px #d4d4d4, 1px 1px #d4d4d4, 2px 2px #d4d4d4, 3px 3px #d4d4d4, 4px 4px #d4d4d4, 5px 5px #d4d4d4, 6px 6px #d4d4d4, 7px 7px #d4d4d4, 8px 8px #d4d4d4, 9px 9px #d4d4d4, 10px 10px #d4d4d4, 11px 11px #d4d4d4, 12px 12px #d4d4d4, 13px 13px #d4d4d4, 14px 14px #d4d4d4, 15px 15px #d4d4d4, 16px 16px #d4d4d4, 17px 17px #d4d4d4, 18px 18px #d4d4d4, 19px 19px #d4d4d4, 20px 20px #d4d4d4, 21px 21px #d4d4d4, 22px 22px #d4d4d4, 23px 23px #d4d4d4, 24px 24px #d4d4d4, 25px 25px #d4d4d4, 26px 26px #d4d4d4, 27px 27px #d4d4d4, 28px 28px #d4d4d4, 29px 29px #d4d4d4, 30px 30px #d4d4d4;
                }

            .social-nav .twitter {
                background: #00ACED;
                text-shadow: 0px 0px #0087ba, 1px 1px #0087ba, 2px 2px #0087ba, 3px 3px #0087ba, 4px 4px #0087ba, 5px 5px #0087ba, 6px 6px #0087ba, 7px 7px #0087ba, 8px 8px #0087ba, 9px 9px #0087ba, 10px 10px #0087ba, 11px 11px #0087ba, 12px 12px #0087ba, 13px 13px #0087ba, 14px 14px #0087ba, 15px 15px #0087ba, 16px 16px #0087ba, 17px 17px #0087ba, 18px 18px #0087ba, 19px 19px #0087ba, 20px 20px #0087ba, 21px 21px #0087ba, 22px 22px #0087ba, 23px 23px #0087ba, 24px 24px #0087ba, 25px 25px #0087ba, 26px 26px #0087ba, 27px 27px #0087ba, 28px 28px #0087ba, 29px 29px #0087ba, 30px 30px #0087ba;
            }

                .social-nav .twitter:hover {
                    color: #00ACED;
                }

            .social-nav .facebook {
                background: #3B579D;
                text-shadow: 0px 0px #2d4278, 1px 1px #2d4278, 2px 2px #2d4278, 3px 3px #2d4278, 4px 4px #2d4278, 5px 5px #2d4278, 6px 6px #2d4278, 7px 7px #2d4278, 8px 8px #2d4278, 9px 9px #2d4278, 10px 10px #2d4278, 11px 11px #2d4278, 12px 12px #2d4278, 13px 13px #2d4278, 14px 14px #2d4278, 15px 15px #2d4278, 16px 16px #2d4278, 17px 17px #2d4278, 18px 18px #2d4278, 19px 19px #2d4278, 20px 20px #2d4278, 21px 21px #2d4278, 22px 22px #2d4278, 23px 23px #2d4278, 24px 24px #2d4278, 25px 25px #2d4278, 26px 26px #2d4278, 27px 27px #2d4278, 28px 28px #2d4278, 29px 29px #2d4278, 30px 30px #2d4278;
            }

                .social-nav .facebook:hover {
                    color: #3B579D;
                }

            .social-nav .google {
                background: #DD4A3A;
                text-shadow: 0px 0px #c23122, 1px 1px #c23122, 2px 2px #c23122, 3px 3px #c23122, 4px 4px #c23122, 5px 5px #c23122, 6px 6px #c23122, 7px 7px #c23122, 8px 8px #c23122, 9px 9px #c23122, 10px 10px #c23122, 11px 11px #c23122, 12px 12px #c23122, 13px 13px #c23122, 14px 14px #c23122, 15px 15px #c23122, 16px 16px #c23122, 17px 17px #c23122, 18px 18px #c23122, 19px 19px #c23122, 20px 20px #c23122, 21px 21px #c23122, 22px 22px #c23122, 23px 23px #c23122, 24px 24px #c23122, 25px 25px #c23122, 26px 26px #c23122, 27px 27px #c23122, 28px 28px #c23122, 29px 29px #c23122, 30px 30px #c23122;
            }

                .social-nav .google:hover {
                    color: #DD4A3A;
                }

            .social-nav .linkedin {
                background: #007BB6;
                text-shadow: 0px 0px #005983, 1px 1px #005983, 2px 2px #005983, 3px 3px #005983, 4px 4px #005983, 5px 5px #005983, 6px 6px #005983, 7px 7px #005983, 8px 8px #005983, 9px 9px #005983, 10px 10px #005983, 11px 11px #005983, 12px 12px #005983, 13px 13px #005983, 14px 14px #005983, 15px 15px #005983, 16px 16px #005983, 17px 17px #005983, 18px 18px #005983, 19px 19px #005983, 20px 20px #005983, 21px 21px #005983, 22px 22px #005983, 23px 23px #005983, 24px 24px #005983, 25px 25px #005983, 26px 26px #005983, 27px 27px #005983, 28px 28px #005983, 29px 29px #005983, 30px 30px #005983;
            }

                .social-nav .linkedin:hover {
                    color: #007BB6;
                }

            .social-nav .pinterest {
                background: #CB2026;
                text-shadow: 0px 0px #9f191e, 1px 1px #9f191e, 2px 2px #9f191e, 3px 3px #9f191e, 4px 4px #9f191e, 5px 5px #9f191e, 6px 6px #9f191e, 7px 7px #9f191e, 8px 8px #9f191e, 9px 9px #9f191e, 10px 10px #9f191e, 11px 11px #9f191e, 12px 12px #9f191e, 13px 13px #9f191e, 14px 14px #9f191e, 15px 15px #9f191e, 16px 16px #9f191e, 17px 17px #9f191e, 18px 18px #9f191e, 19px 19px #9f191e, 20px 20px #9f191e, 21px 21px #9f191e, 22px 22px #9f191e, 23px 23px #9f191e, 24px 24px #9f191e, 25px 25px #9f191e, 26px 26px #9f191e, 27px 27px #9f191e, 28px 28px #9f191e, 29px 29px #9f191e, 30px 30px #9f191e;
            }

                .social-nav .pinterest:hover {
                    color: #CB2026;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="Script1" runat="server"></asp:ScriptManager>

        <div id="fb-root"></div>
        <div class="container-fluid nav_body_sec">
            <div class="navbar-fixed-top">
                <div class="container-fluid">
                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <a href="Default.aspx">
                            <img src="images/logo.png" class="img-responsive" /></a>
                    </div>
                    <div class="col-md-8 col-sm-8 col-xs-12"></div>
                    <div class="col-sm-2 header_right">
                        <div id="loginContainer">
                            <asp:LinkButton ID="lblLoginName" class="btn1 btn-2 btn-2g" runat="server" Text="Advertise with us" OnClick="lblLoginName_Click"></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>

            <div style="padding-top: 5px; background-color: lightgrey;">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-8 col-lg-8 col-md-8" style="margin-left: 15px">
                            <div class="song ">
                                <div class="video-grid">
                                    <asp:DataList ID="dlVideo" Visible="true" runat="server" AutoGenerateColumns="false" Width="100%">
                                        <ItemStyle BorderStyle="None" CssClass="ItemStyleCSS" />
                                        <ItemTemplate>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-right: 2%; padding-top: 2%; padding-bottom: 1%;">
                                                    <video id="videoPlay" controls="controls" height="450" autoplay="autoplay" controlslist="nodownload">
                                                        <source src="<%# Eval("VideoID", "FileCS.ashx?Id={0}") %>" class="img-responsive" type="video/mp4" />
                                                </div>
                                            </div>
                                            <div class="row" style="color: red;">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-right" style="padding-right: 8%;">
                                                    <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments").ToString() + " Comments" %>'></asp:Label>
                                                    <asp:Label ID="lblViews" runat="server" Text='<%# Eval("Views").ToString() + " Views" %>'></asp:Label>
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row" style="padding-left: 10px;">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row" style="padding-left: 10px;">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Label ID="Label1" runat="server" Text="Contact Person Details - " Font-Bold="true" Font-Size="14px"></asp:Label>
                                                    <label for="lblContactName">Name : </label>
                                                    <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("ContactName") %>'></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label for="lblContactName">E-Mail ID : </label>
                                                    <asp:Label ID="lblContactEmail" runat="server" Text='<%# Eval("ContactEmail") %>'></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label for="lblContactName">Mobile No. : </label>
                                                    <asp:Label ID="lblContactMobileNo" runat="server" Text='<%# Eval("ContactMobileNo") %>'></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                </div>
                                               
                                                 <a href="https://www.google.com/maps?saddr=My+Location&daddr= <%# Eval("lat") %>, <%# Eval("longi") %>" target="_blank">Get Direction</a>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <h4 class="widget-title">Follow us</h4>
                                                    <ul class="social-nav">
                                                        <li><a href="http://twitter.com/share?url=http://www.vadsbiz.com/" target="_blank" title="Twitter" rel="nofollow" class="twitter"><i class="fa fa-twitter"></i></a></li>
                                                        <li><a href="http://www.vadsbiz.com/" target="_blank" title="Facebook" rel="nofollow" class="facebook"><i class="fa fa-facebook"></i></a></li>
                                                        <li><a href="#" target="_blank" title="Google plus" rel="nofollow" class="google"><i class="fa fa-google-plus"></i></a></li>
                                                        <li><a href="#" target="_blank" title="Linkedin" rel="nofollow" class="linkedin"><i class="fa fa-linkedin"></i></a></li>
                                                        <li><a href="#" target="_blank" title="Pinterest" rel="nofollow" class="pinterest"><i class="fa fa-pinterest"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">

                                                  <a href="ViewMap.aspx" title="ViewMap" target="_blank"><image src="../images/googlemap.jpg"></image></a>     
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle BorderWidth="1" BorderColor="LightBlue" Width="100%" HorizontalAlign="Left" />
                                    </asp:DataList>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pull-left">
                                    <b style="text-align: left">Add a Comment : </b>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                                    Rating : 
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <ajaxToolkit:Rating ID="VideoRating" AutoPostBack="true" OnClick="VideoRating_Click" runat="server"
                                                StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                                                FilledStarCssClass="FilledStar">
                                            </ajaxToolkit:Rating>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <br />
                            <asp:UpdatePanel ID="UpdateComment" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                                            <asp:TextBox ID="txtComments" runat="server" CssClass="form-control input-sm" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                            <asp:HiddenField ID="hdnVideoID" runat="server" />
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="row text-left">
                                                <div class="panel panel-default widget">
                                                    <div class="panel-heading">
                                                        <span class="glyphicon glyphicon-comment"></span>
                                                        <h3 class="panel-title text-center">Recent Comments</h3>
                                                        <span class="label label-info">
                                                            <asp:Label ID="lblCommentsCount" runat="server"></asp:Label></span>
                                                    </div>
                                                    <div class="panel-body">
                                                        <asp:GridView ID="grdvComments" runat="server" AutoGenerateColumns="false" ShowHeader="false" ShowFooter="false" AllowPaging="false" Width="100%" BorderWidth="0" EmptyDataText="No Comments" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-HorizontalAlign="Center">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <div class="row">
                                                                            <div class="col-xs-2 col-md-1" style="padding-left: 20px;">
                                                                                <img src="" class="img-circle img-responsive" alt='<%# Eval("CommentsBy").ToString().Substring(0,1) %>' style="background-color: #5BC0DE; text-align: center; color: white;" />
                                                                            </div>
                                                                            <div class="col-xs-10 col-md-11">
                                                                                <div>
                                                                                    <div class="mic-info">
                                                                                        By: <a href="#">
                                                                                            <asp:Label ID="lblCommentBy" Font-Size="Medium" runat="server" Text='<%# Eval("CommentsBy") %>'></asp:Label></a> on                                                     
                                                                                                <asp:Label ID="lblCommentDate" runat="server" Text='<%# Convert.ToDateTime(Eval("CommentDate")).ToString("dd/MM/yyyy") %>'></asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="comment-text" style="color: red">
                                                                                    <asp:Label ID="lblComment" runat="server" Text='<%# Eval("Comments") %>'></asp:Label></h3>                               
                                                                                </div>
                                                                                <div class="action" style="display: none">
                                                                                    <button type="button" class="btn btn-primary btn-xs" title="Edit">
                                                                                        <span class="glyphicon glyphicon-pencil"></span>
                                                                                    </button>
                                                                                    <button type="button" class="btn btn-success btn-xs" title="Approved">
                                                                                        <span class="glyphicon glyphicon-ok"></span>
                                                                                    </button>
                                                                                    <button type="button" class="btn btn-danger btn-xs" title="Delete">
                                                                                        <span class="glyphicon glyphicon-trash"></span>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="Padding list-group" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                    <a href="#" class="btn btn-primary btn-sm btn-block" role="button"><span class="glyphicon"></span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="col-md-1"></div>
                        </div>
                        <div class="col-md-3 single-right" style="padding-top: 2px; height: 1010px; overflow-y: auto; overflow-x: hidden;">
                            <div style="border: 2px groove gray;">
                                <div style="background-color: #337ab7; text-align: center; height: 30px; font-family: 'Comic Sans MS'">
                                    <h3 style="text-transform: uppercase">Related Video</h3>
                                </div>
                                <div class="single-grid-right">
                                    <asp:DataList ID="dtlistCategoryWiseVideo" runat="server" RepeatDirection="Vertical" CellSpacing="3" CellPadding="10" RepeatLayout="Table">
                                        <ItemTemplate>
                                            <div style="border: 1px groove #cf5222; margin-left: 11px; margin-right: 4px">
                                                <div class="row">

                                                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                                                        <div class="img-responsive">
                                                            <a href='<%# Eval("Id", "PlayMyVideo.aspx?Id={0}") %>'>
                                                                <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' width="275" height="150" />
                                                            </a>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6" style="padding-left: 22px">
                                                                <asp:Label ID="Label1" runat="server" Text='<%#(Eval("VideoTime")) %>'></asp:Label>
                                                            </div>
                                                            <%--<div class="col-lg-5 col-md-5" style="padding: 5px"></div>--%>
                                                            <div class="col-lg-6 col-md-6" style="text-align: right">
                                                                <img src="images/icon-video.png" width="26px" height="16px" alt="Click on image" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: center; font-family: Georgia">
                                                        <asp:HiddenField ID="hdnVideoID" runat="server" Value='<%# Eval("Id") %>' />
                                                        <asp:Label ID="lblAdvertiserName" runat="server" Font-Italic="true" Text='<%# Eval("Name") %>' Font-Size="26px"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row" style="font-size: small; padding: 5px">
                                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="padding-left: 22px">
                                                        <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments").ToString() + " Comments" %>'></asp:Label>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-right" style="padding-right: 30px">
                                                        <asp:Label ID="lblViews" runat="server" Text='<%# Eval("Views").ToString() + " Views" %>'></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row" style="padding-bottom: 2px">
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center"></div>
                                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 text-center">
                                                        <asp:Panel ID="Panel1" runat="server" Enabled="false">
                                                            <ajaxToolkit:Rating ID="VideoRating" runat="server"
                                                                StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star" CurrentRating='<%# Convert.ToInt32(Eval("Rating")) %>' FilledStarCssClass="FilledStar">
                                                            </ajaxToolkit:Rating>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                        </ItemTemplate>
                                        <%--<ItemStyle BorderWidth="1" BorderColor="LightBlue" />--%>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Vertical" CellSpacing="3" CellPadding="10" RepeatLayout="Table">
                            <ItemTemplate>

                                <div class="row">

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 img-responsive">

                                        <a href='<%# Eval("Id", "PlayMyVideo.aspx?Id={0}") %>'>
                                            <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' width="250" height="150" />
                                        </a>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:HiddenField ID="hdnVideoID" runat="server" Value='<%# Eval("Id") %>' />
                                        <asp:Label ID="lblAdvertiserName" runat="server" Font-Bold="true" Text='<%# Eval("Name") %>' Font-Size="18px"></asp:Label>
                                    </div>
                                </div>
                                <div class="row" style="color: red;">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments").ToString() + " Comments" %>'></asp:Label>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-right" style="padding-right: 30px">
                                        <asp:Label ID="lblViews" runat="server" Text='<%# Eval("Views").ToString() + " Views" %>'></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <ItemStyle BorderWidth="1" BorderColor="LightBlue" />
                        </asp:DataList>
                        <%--                <div class="row" style="color:white">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="lblMobileNo">Address : </label>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                    </div>
                </div>--%>
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
            <!-- Bootstrap core JavaScript
    ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
            <script src="CssHP/js/bootstrap.min.js"></script>
            <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
        </div>
    </form>
</body>
</html>
