<%@ Page Title="" Language="C#" MasterPageFile="~/Master/ExternalMaster.Master" AutoEventWireup="true" CodeBehind="LoginMaster.aspx.cs" Inherits="VirtualBazaar.LoginMaster.LoginMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.jqueryui.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.jqueryui.min.css" />
    <link href="../assets/redmond/jquery-ui.min.css" rel="stylesheet" />
    <link href="../assets/redmond/theme.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.2.4/js/buttons.colVis.min.js"></script>
    <script src="../js/jquery.validate.js"></script>
    <%--<link href="../css/PricingSheet.css" rel="stylesheet" />
   
    <script src="../js/additional-methods.js"></script>--%>

    <style>
        @CHARSET "UTF-8";

        .input-sm {
            height: 30px;
            padding: 5px 10px;
            font-size: 12px;
            line-height: 1.5;
            border-radius: 3px;
        }

        bootstrap.form-control {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        }

        main.form-control {
            border-radius: 0px;
            padding: 10px 18px;
            font-size: 18px;
            font-family: 'Lato', sans-serif;
            color: #2f2f2f;
            font-weight: 100;
        }

        bootstrap.input-sm {
            height: 30px;
            padding: 5px 10px;
            font-size: 12px;
            line-height: 1.5;
            border-radius: 3px;
        }

        bootstrap.form-control {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        }

        main.form-control {
            border-radius: 0px;
            padding: 10px 18px;
            font-size: 18px;
            font-family: 'Lato', sans-serif;
            color: #2f2f2f;
            font-weight: 100;
        }

        bootstrap.input-sm {
            height: 30px;
            padding: 5px 10px;
            font-size: 12px;
            line-height: 1.5;
            border-radius: 3px;
        }

        bootstrap.form-control {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        }

        glyphicons input, button, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }

        bootstrap input {
            line-height: normal;
        }

        normalize.button, input, optgroup, select, textarea {
            margin: 0;
            font: inherit;
            color: inherit;
        }

        bootstrap.button, input, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }

        bootstrap.input {
            line-height: normal;
        }

        bootstrap.button, input, optgroup, select, textarea {
            margin: 0;
            font: inherit;
            color: inherit;
        }

        bootstrap.button, input, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }

        bootstrap.input {
            line-height: normal;
        }

        bootstrap.button, input, optgroup, select, textarea {
            margin: 0;
            font: inherit;
            color: inherit;
        }

        print * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        bootstrap * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        bootstrap * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        user agent stylesheet input:not([type]), input[type="email"], input[type="number"], input[type="password"], input[type="tel"], input[type="url"], input[type="text"] {
            padding: 1px 0px;
        }

        user agent stylesheet input {
            -webkit-appearance: textfield;
            background-color: white;
            -webkit-rtl-ordering: logical;
            user-select: text;
            cursor: auto;
            padding: 1px;
            border-width: 2px;
            border-style: inset;
            border-color: initial;
            border-image: initial;
        }

        user agent stylesheet input, textarea, select, button {
            text-rendering: auto;
            color: initial;
            letter-spacing: normal;
            word-spacing: normal;
            text-transform: none;
            text-indent: 0px;
            text-shadow: none;
            display: inline-block;
            text-align: start;
            margin: 0em;
            font: 13.3333px Arial;
        }

        user agent stylesheet input, textarea, select, button, meter, progress {
            -webkit-writing-mode: horizontal-tb;
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            outline: none;
        }

        .form-control {
            position: relative;
            font-size: 16px;
            height: 40px;
            padding: 10px;
            @include box-sizing(border-box);
        }

        .bgbanner {
            background: url(../images/GHr12sH.jpg) no-repeat center center fixed;
            background-color: #d6b7a3;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .login-form {
            margin-top: 60px;
        }

        .formborder {
            color: #5d5d5d;
            background: #f2f2f2;
            padding: 26px;
            border-radius: 10px;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
        }

            .formborder img {
                display: block;
                margin: 0 auto;
                margin-bottom: 35px;
            }

            .formborder input,
            .formborder button {
                font-size: 18px;
                margin: 16px 0;
            }

            .formborder > div {
                text-align: center;
            }

        .form-links {
            text-align: center;
            margin-top: 1em;
            margin-bottom: 50px;
        }

            .form-links a {
                color: #fff;
            }

        .btn3d {
            position: relative;
            top: -6px;
            border: 0;
            transition: all 40ms linear;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 2px;
            margin-right: 2px;
        }

            .btn3d:active:focus,
            .btn3d:focus:hover,
            .btn3d:focus {
                -moz-outline-style: none;
                outline: medium none;
            }

            .btn3d:active, .btn3d.active {
                top: 2px;
            }

            .btn3d.btn-white {
                color: #666666;
                box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #f5f5f5, 0 8px 8px 1px rgba(0,0,0,.2);
                background-color: #fff;
            }

                .btn3d.btn-white:active, .btn3d.btn-white.active {
                    color: #666666;
                    box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
                    background-color: #fff;
                }

            .btn3d.btn-default {
                color: #666666;
                box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #BEBEBE, 0 8px 8px 1px rgba(0,0,0,.2);
                background-color: #f9f9f9;
            }

                .btn3d.btn-default:active, .btn3d.btn-default.active {
                    color: #666666;
                    box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
                    background-color: #f9f9f9;
                }

            .btn3d.btn-primary {
                box-shadow: 0 0 0 1px #417fbd inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #4D5BBE, 0 8px 8px 1px rgba(0,0,0,0.5);
                background-color: #4274D7;
            }

                .btn3d.btn-primary:active, .btn3d.btn-primary.active {
                    box-shadow: 0 0 0 1px #417fbd inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
                    background-color: #4274D7;
                }

            .btn3d.btn-success {
                box-shadow: 0 0 0 1px #31c300 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #5eb924, 0 8px 8px 1px rgba(0,0,0,0.5);
                background-color: #78d739;
            }

                .btn3d.btn-success:active, .btn3d.btn-success.active {
                    box-shadow: 0 0 0 1px #30cd00 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
                    background-color: #78d739;
                }

            .btn3d.btn-info {
                box-shadow: 0 0 0 1px #00a5c3 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #348FD2, 0 8px 8px 1px rgba(0,0,0,0.5);
                background-color: #39B3D7;
            }

                .btn3d.btn-info:active, .btn3d.btn-info.active {
                    box-shadow: 0 0 0 1px #00a5c3 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
                    background-color: #39B3D7;
                }

            .btn3d.btn-warning {
                box-shadow: 0 0 0 1px #d79a47 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #D79A34, 0 8px 8px 1px rgba(0,0,0,0.5);
                background-color: #FEAF20;
            }

                .btn3d.btn-warning:active, .btn3d.btn-warning.active {
                    box-shadow: 0 0 0 1px #d79a47 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
                    background-color: #FEAF20;
                }

            .btn3d.btn-danger {
                box-shadow: 0 0 0 1px #b93802 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #AA0000, 0 8px 8px 1px rgba(0,0,0,0.5);
                background-color: #D73814;
            }

                .btn3d.btn-danger:active, .btn3d.btn-danger.active {
                    box-shadow: 0 0 0 1px #b93802 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
                    background-color: #D73814;
                }

            .btn3d.btn-magick {
                color: #fff;
                box-shadow: 0 0 0 1px #9a00cd inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #9823d5, 0 8px 8px 1px rgba(0,0,0,0.5);
                background-color: #bb39d7;
            }

                .btn3d.btn-magick:active, .btn3d.btn-magick.active {
                    box-shadow: 0 0 0 1px #9a00cd inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
                    background-color: #bb39d7;
                }
    </style>
    <style type="text/css">
        .panel-transparent {
            background: none;
        }

            .panel-transparent .panel-heading {
                background: #337ab7 !important;
                color: white;
            }

            .panel-transparent .panel-body {
                background: rgba(46, 51, 56, 0.2) !important;
                color: white;
                text-align: left;
            }

        .btn-file {
            position: relative;
            overflow: hidden;
        }

            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: Blue;
                cursor: inherit;
                display: block;
            }


        label {
            font-weight: normal;
        }
    </style>



    <style type="text/css">
        .btn-file {
            position: relative;
            overflow: hidden;
        }

            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: Blue;
                cursor: inherit;
                display: block;
            }

        label {
            font-weight: normal;
        }

        .PlansDiv {
            background-color: rgba(255, 0, 0, 0.46);
            height: 400px;
            border-radius: 40px;
            color: white;
            padding-top: 10px;
        }

        .heading {
            font-size: 24px;
            font-weight: bold;
            text-decoration: underline;
            font-style: italic;
        }

        li {
            font-size: 18px;
        }

        .my-error-class {
            color: #FF0000; /* red */
        }

        .my-valid-class {
            color: #00CC00; /* green */
        }

        .PlaSch {
            font-family: Verdana;
            color: red;
            font: bold vedana;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                errorClass: "my-error-class",
                validClass: "my-valid-class",

                rules: {
                    <%= txtOrganisationName.UniqueID %>: {
                        required: true
                    },
                    <%= txtMobileNo.UniqueID %>: {
                        required: true,
                        number: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    <%= txtEmailID.UniqueID %>: {
                        required: true,
                        email: true
                    },
                    <%= txtStreetName.UniqueID %>: {
                        required: true
                    },
                    <%= txtName.UniqueID %>: {
                        required: true
                    },
                    <%= txtCMobieNum.UniqueID %>: {
                        required: true,
                        number: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    <%= txtUserMobile.UniqueID %>: {
                        required: true,
                        number: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    <%= txtAadharNumber.UniqueID %>: {
                        required: true,
                        number: true,
                        minlength: 12,
                        maxlength: 12
                    },
                    <%= txtUserEmail.UniqueID %>: {
                        required: true,
                        email: true
                      
                    },
                    <%= txtCEmailID.UniqueID %>: {
                        required: true,
                        email: true
                    },
                },
                messages: {
                    <%= txtOrganisationName.UniqueID %>: {
                        required: "Please Enter Organisation Name"
                    },
                    <%= txtUserMobile.UniqueID %>: {
                        required: "Please enter mobile number",
                        number: "Please enter a valid mobile number",
                        minlength: "Mobile number must contains only 10 digits",
                        maxlength: "Mobile number must contains only 10 digits"
                    },
                    <%= txtMobileNo.UniqueID %>: {
                        required: "Please enter mobile number",
                        number: "Please enter a valid mobile number",
                        minlength: "Mobile number must contains only 10 digits",
                        maxlength: "Mobile number must contains only 10 digits"
                    },
                    <%= txtEmailID.UniqueID %>: {
                        required: "Please enter email id",
                        email: "Please enter a valid email id"
                    },
                    <%= txtUserEmail.UniqueID %>: {
                        required: "Please enter email id",
                        email: "Please enter a valid email id"
                    },
                    <%= txtStreetName.UniqueID %>: {
                        required: "Please Enter Street Name"
                    },
                    <%= txtName.UniqueID %>: {
                        required: "Please Enter Name"
                    },
                    <%= txtCMobieNum.UniqueID %>: {
                        required: "Please enter mobile number",
                        number: "Please enter a valid mobile number",
                        minlength: "Mobile number must contains only 10 digits",
                        maxlength: "Mobile number must contains only 10 digits"
                    },
                    <%= txtAadharNumber.UniqueID %>: {
                        required: "Please enter Aadhar number",
                        number: "Please enter a valid Aadhar number",
                        minlength: "Aadhar number must contains only 12 digits",
                        maxlength: "Aadhar number must contains only 12 digits"
                    },
                    <%= txtCEmailID.UniqueID %>: {
                        required: "Please enter email id",
                        email: "Please enter a valid email id"
                    }
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <div class="row bgbanner" id="pwd-container">
            <div class="col-md-4"></div>

            <div class="col-md-4" style="padding-bottom: 15px">
                <section class="login-form">
                    <div class="formborder" id="LoginBlock" runat="server">

                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <label for="usrname">Username</label>
                                <asp:TextBox ID="txtUserName" MaxLength="30" class="form-control input-lg" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <label for="psw">Password</label>
                                <asp:TextBox ID="txtPassword" MaxLength="30" TextMode="Password" class="form-control input-lg" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-success btn-block btn-lg btn3d" />
                            </div>
                        </div>
                        <div class="pwstrength_viewport_progress"></div>
                        <div>
                            <asp:LinkButton ID="LnkCreateAccount" OnClick="LnkCreateAccount_Click" runat="server">Create account</asp:LinkButton>
                            ||
                            <asp:LinkButton ID="LinkButton1" runat="server">Reset password</asp:LinkButton>
                        </div>

                    </div>

                </section>


            </div>

            <div class="col-md-4"></div>


        </div>

        <div id="CreateAccount" runat="server" visible="false">
            <div class="panel-body">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4" style="color: white; font-family: Verdana">
                                Create Account
                            </div>
                            <div class="col-md-4">
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row" style="padding: 25px">
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                <asp:Button ID="btnUser" runat="server" Text="User" OnClick="btnUser_Click" CssClass="btn btn-primary btn-lg btn3d btn-block" />
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                <asp:Button ID="btnAdvertiser" runat="server" OnClick="btnAdvertiser_Click" Text="Advertiser" CssClass="btn btn-info btn-lg btn3d btn-block" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">

            <div id="DivPlans" style="background-color: white" runat="server" visible="false">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">

                            <!-- PRICE ITEM -->
                            <div class="panell price panell-red">
                                <div class="panell-heading  text-center">
                                    <h3>SILVER PLAN</h3>
                                </div>
                                <div class="panell-bodyy text-center">
                                    <p class="lead" style="font-size: 40px">
                                        <strong>₹500 /<br />
                                            month</strong>
                                    </p>
                                </div>
                                <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item"><i class="icon-ok text-danger"></i>Personal use</li>
                                    <li class="list-group-item"><i class="icon-ok text-danger"></i>Unlimited projects</li>
                                    <li class="list-group-item"><i class="icon-ok text-danger"></i>27/7 support</li>
                                </ul>
                                <div class="panell-footer">
                                    <%--<a class="" href="#">BUY NOW!</a>--%>
                                    <asp:Button ID="btnBuySilver" runat="server" Text="Buy Now" CssClass="btn btn-lg btn-block btn-danger" OnClick="btnBuySilver_Click" />
                                </div>
                            </div>
                            <!-- /PRICE ITEM -->


                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">

                            <!-- PRICE ITEM -->
                            <div class="panell price panell-blue">
                                <div class="panell-heading arrow_box text-center">
                                    <h3>GOLD PLAN</h3>
                                </div>
                                <div class="panell-bodyy text-center">
                                    <p class="lead" style="font-size: 40px">
                                        <strong>₹1000 /<br />
                                            month</strong>
                                    </p>
                                </div>
                                <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item"><i class="icon-ok text-info"></i>Personal use</li>
                                    <li class="list-group-item"><i class="icon-ok text-info"></i>Unlimited projects</li>
                                    <li class="list-group-item"><i class="icon-ok text-info"></i>27/7 support</li>
                                </ul>
                                <div class="panell-footer">
                                    <%--<a class="" href="#">BUY NOW!</a>--%>
                                    <asp:Button ID="btnBuyGold" runat="server" Text="Buy Now" CssClass="btn btn-lg btn-block btn-info" OnClick="btnBuyGold_Click" />
                                </div>
                            </div>
                            <!-- /PRICE ITEM -->


                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">

                            <!-- PRICE ITEM -->
                            <div class="panell price panell-green">
                                <div class="panell-heading arrow_box text-center">
                                    <h3>DIAMOND PLAN</h3>
                                </div>
                                <div class="panell-bodyy text-center">
                                    <p class="lead" style="font-size: 40px">
                                        <strong>₹1500 /<br />
                                            month</strong>
                                    </p>
                                </div>
                                <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>Personal use</li>
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>Unlimited projects</li>
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>27/7 support</li>
                                </ul>
                                <div class="panell-footer">
                                    <%--<a class="" href="#">BUY NOW!</a>--%>
                                    <asp:Button ID="btnBuyDiamond" runat="server" Text="Buy Now" CssClass="btn btn-lg btn-block btn-success" OnClick="btnBuyDiamond_Click" />
                                </div>
                            </div>
                            <!-- /PRICE ITEM -->


                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">

                            <!-- PRICE ITEM -->
                            <div class="panell price panell-grey">
                                <div class="panell-heading arrow_box text-center">
                                    <h3>PLATINUM PLAN</h3>
                                </div>
                                <div class="panell-bodyy text-center">
                                    <p class="lead" style="font-size: 40px">
                                        <strong>₹2000 /
                                        <br />
                                            month</strong>
                                    </p>
                                </div>
                                <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>Personal use</li>
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>Unlimited projects</li>
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>27/7 support</li>
                                </ul>
                                <div class="panell-footer">
                                    <%--<a class="btn btn-lg btn-block btn-primary" href="#">BUY NOW!</a>--%>
                                    <asp:Button ID="btnBuyPlatinum" runat="server" Text="Buy Now" CssClass="btn btn-lg btn-block btn-grey" OnClick="btnBuyPlatinum_Click" />
                                </div>
                            </div>
                            <!-- /PRICE ITEM -->


                        </div>

                    </div>

                </div>
                <br />
            </div>


            <div class="panel-body" id="DivEntry" runat="server" visible="false">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4" style="color: white; font-family: Verdana">
                                Advertiser Registration
                            </div>
                            <div class="col-md-4">
                                <div id="SchemeDiv" runat="server" visible="false">
                                    <label for="txtPlan" style="color: white">Scheme </label>
                                    <asp:Label ID="txtPlan" CssClass="PlaSch" Text=":" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body text-left">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtOrganisationName">Organisation Name </label>
                                    <asp:TextBox ID="txtOrganisationName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:HiddenField ID="hdnAdvertiserID" runat="server" Value="0" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="ddlCategory">Category </label>
                                    <asp:DropDownList ID="ddlCategory" Height="40px" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtMobileNo">Phone Number </label>
                                    <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtEmailID">Email-ID </label>
                                    <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="ddlState">State </label>
                                    <asp:DropDownList ID="ddlState" runat="server" Height="40px" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="ddlCity">City </label>
                                    <asp:DropDownList ID="ddlCity" runat="server" Height="40px" CssClass="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="ddlLocality">Locality </label>
                                    <asp:DropDownList ID="ddlLocality" runat="server" Height="40px" CssClass="form-control input-sm"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtLandmark">Landmarks </label>
                                    <asp:TextBox ID="txtLandmark" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtStreetName">Street Name </label>
                                    <asp:TextBox ID="txtStreetName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtWebsite">Website </label>
                                    <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:HiddenField ID="hdnLatitude" runat="server" />
                                    <asp:HiddenField ID="hdnLongitude" runat="server" />
                                </div>
                            </div>
                            <div id="DivImage" runat="server" class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="FileImage">Image </label>
                                    <asp:FileUpload ID="FileImage" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div id="DivVideo" runat="server" class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtTitle">Video </label>
                                    <asp:FileUpload ID="FileVideo" runat="server" CssClass="form-control" />
                                    <%--<div class="input-group">
                                        <label class="input-group-btn">
                                            <span class="btn btn-primary">Browse...
                                                
                                            </span>
                                        </label>
                                        <input type="text" class="form-control" readonly />
                                    </div>--%>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtKeyword">KeyWord </label>
                                    <asp:TextBox ID="txtKeyword" runat="server" Style="resize: none;" CssClass="form-control input-sm" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtDescription">Description </label>
                                    <asp:TextBox ID="txtDescription" runat="server" Style="resize: none;" CssClass="form-control input-sm" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div style="text-align: center; border: 1px groove; background-color: #337ab7; padding: 8px; color: white">
                            Contact Information
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtName">Name </label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtCMobieNum">Mobile Number </label>
                                    <asp:TextBox ID="txtCMobieNum" runat="server" CssClass="form-control input-sm"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="txtCEmailID">Email ID </label>
                                    <asp:TextBox ID="txtCEmailID" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <label>Do you want to show your Mobile number</label>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <label>Yes</label>
                                <asp:RadioButton ID="rbdYes" GroupName="A" runat="server" />
                                <label>No</label>
                                <asp:RadioButton ID="rbdNo" GroupName="A" runat="server" Checked="true" />
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-danger btn-block" OnClick="btnSave_Click" />
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary btn-block" OnClick="btnBack_Click" formnovalidate />
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        </div>
                    </div>
                    <br />

                </div>

            </div>
        </div>

        <div id="UserAccount" class="container-fluid" runat="server" visible="false">
            <div class="panel panel-default panel-transparent">
                <div class="panel-heading">
                    User Registration
                </div>

                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="txtFullName">Full Name </label>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:HiddenField ID="hdnId" runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="txtUserName">User Name </label>
                                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="txtMobileNo">Mobile Number </label>
                                <asp:TextBox ID="txtUserMobile" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="txtEmailID">Email-ID </label>
                                <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="txtPassword">Password </label>
                                <asp:TextBox ID="txtUserPassword" TextMode="Password" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="txtAadharNumber">Aadhar Number </label>
                                <asp:TextBox ID="txtAadharNumber" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="txtDescription">Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control input-sm" Rows="5" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <asp:Button ID="btnSaveUser" runat="server" Text="Save" OnClick="btnSaveUser_Click" CssClass="btn btn-danger btn-block" />
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <asp:Button ID="btnCancelUser" runat="server" Text="Back" OnClick="btnCancelUser_Click" CssClass="btn btn-primary btn-block" />
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="MsgBox" tabindex="-1" role="dialog" aria-labelledby="purchaseLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header btn-danger">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4><i id="Icon" class="glyphicon glyphicon-thumbs-up">&nbsp;</i><span class="modal-title" id="ShowTitle"></span></h4>
                </div>
                <div class="modal-body" id="ShowBody">
                </div>
                <div class="modal-footer">
                    <button type="button" id="modalbtn" class="btn" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>
    <button type="button" style="display: none" id="btnShowPopup" class="btn btn-lg"
        data-toggle="modal" data-target="#MsgBox">
        Launch modal
    </button>
</asp:Content>
