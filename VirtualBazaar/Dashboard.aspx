<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="VirtualBazaar.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <script src="js/jquery-2.1.4.js"></script>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <%--<link href="bootstrap/css/morris.css" rel="stylesheet" />
    <link href="bootstrap/css/sb-admin.css" rel="stylesheet" />--%>
    <script src="js/jquery.canvasjs.min.js"></script>
    <script src="js/Dashboard.js"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <link href="../bootstrap/css/main.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet" />
    <link href="../css/MenuCss.css" rel="stylesheet" />
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bootstrap/css/main.css" rel="stylesheet" />
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />


    <script type="text/javascript">

        function toggle_visibility(id) {
            var e = document.getElementById(id);
            if (e.style.display == 'block')
                e.style.display = 'none';
            else
                e.style.display = 'block';
        }
    </script>


    <script type="text/javascript">
        $(document).ready(function () {
            $(".dropdown1").hover(
                function () {
                    $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                    $(this).toggleClass('open');
                }
            );
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $('a[data-toggle="collapse"]').on('click', function () {

                var objectID = $(this).attr('href');

                if ($(objectID).hasClass('in')) {
                    $(objectID).collapse('hide');
                }

                else {
                    $(objectID).collapse('show');
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            CreateChart();
        });

        function CreateChart() {


            $('#MainDivEgovernance').css('display', 'block');
            $('#Permission').css('display', 'none');

            var ChartType = $('#ddl2 option:selected').val();
            var Year = $('#ddlYear option:selected').text();
            var Month = $('#ddlMonth option:selected').text();
            var Category = $('#ddlCategory option:selected').text();
            var Advertiser = $('#ddlAdvertiser option:selected').text();
            getvideoviewDuration(ChartType, Year, Month, Advertiser, Category);

            if (Year == 'All') {
                $('#ddlMonth').hide();
            }
            else {
                $('#ddlMonth').show();
            }

            $("#MainDivEgovernance").show();









            $('input[type="radio"]').click(function () {

                if ($(this).attr("value") == "Dashboard") {

                    $('#MainDivDashboard').css('display', 'block');
                    $('#Permission').css('display', 'none');

                    var ChartType = $('#ddl2 option:selected').val();
                    var Year = $('#ddlYear option:selected').val();
                    var Month = $('#ddlMonth option:selected').val();

                    getvideoviewDuration(ChartType, Year, Month);

                    if (Year == 0) {
                        $('#ddlMonth').hide();
                    }
                    else {
                        $('#ddlMonth').show();
                    }

                    $("#MainDivDashboard").show();
                }
                else {
                    $('#MainDivDashboard').css('display', 'none');
                }

                if ($(this).attr("value") == "ViewVedio") {



                    //    $('#MainDivDashboard').css('display', 'block');
                    //    $('#Permission').css('display', 'none');

                    //    var ChartType = $('#ddl2 option:selected').val();
                    //    var Year = $('#ddlYear option:selected').val();
                    //    var Month = $('#ddlMonth option:selected').val();

                    //    getviedoviewDuration(ChartType, Year, Month);

                    //    if (Year == 0) {
                    //        $('#ddlMonth').hide();
                    //    }
                    //    else {
                    //        $('#ddlMonth').show();
                    //    }

                    //    $("#MainDivDashboard").show();
                    //}
                    //else {
                    //    $('#MainDivDashboard').css('display', 'none');
                    //}



                }
                if ($(this).attr("value") == "Helpdisk") {
                    $('#MainHRMSDiv').css('display', 'block');
                    $('#Permission').css('display', 'none');
                    // Incident Status
                    var ChartType = $('#ddl6 option:selected').val();
                    var Year = $('#ddlIncidentYear option:selected').val();
                    var Month = $('#ddlIncidentMonth option:selected').val();

                    getIncidentStatus(ChartType, Year, Month);

                    if (Year == 0) {
                        $('#ddlIncidentMonth').hide();
                    }
                    else {
                        $('#ddlIncidentMonth').show();
                    }
                    $("#IncidentStatusDiv").show();
                    //Priority
                    var ChartType = $('#ddl7 option:selected').val();
                    var Year = $('#ddlPriorityYear option:selected').val();
                    var Month = $('#ddlPriorityMonth option:selected').val();

                    getPriorityStatus(ChartType, Year, Month);

                    if (Year == 0) {
                        $('#ddlPriorityMonth').hide();
                    }
                    else {
                        $('#ddlPriorityMonth').show();
                    }
                    $("#PRIORITYDiv").show();
                }
                else {
                    $('#MainHRMSDiv').css('display', 'none');
                }
                if ($(this).attr("value") == "Assets") {
                    $('#MainAssetsDiv').css('display', 'block');
                    $('#Permission').css('display', 'none');

                    var ChartType = $('#ddl8 option:selected').val();
                    var Year = $('#ddlAssetsYear option:selected').val();
                    var Month = $('#ddlAssetsMonth option:selected').val();

                    getAssetsLocationStatus(ChartType, Year, Month);

                    if (Year == 0) {
                        $('#ddlAssetsMonth').hide();
                    }
                    else {
                        $('#ddlAssetsMonth').show();
                    }
                    $("#AssetsStatusDiv").show();
                }
                else {
                    $('#MainAssetsDiv').css('display', 'none');
                }
                if ($(this).attr("value") == "Setting") {
                    $('#Setting').css('display', 'block');
                    $('#Permission').css('display', 'none');
                }
                else {
                    $('#Setting').css('display', 'none');
                }
                if ($(this).attr("value") == "Permissions") {
                    $('#UserRole').css('display', 'block');
                    $('#Permission').css('display', 'none');
                }
                else {
                    $('#UserRole').css('display', 'none');
                }
            });
        }
    </script>

    <script type="text/javascript">
        //jQuery(document).ready(function () {
        //    jQuery('#radio').buttonset();
        //});
        //}
        //$(function () {
        //    $("#radio").buttonset();
        //});
    </script>

    <script type="text/javascript">
        function DisableButtons() {
            var inputs = document.getElementsByTagName("INPUT");
            for (var i in inputs) {
                if (inputs[i].type == "button" || inputs[i].type == "submit") {
                    inputs[i].disabled = true;
                }
            }
        }
        window.onbeforeunload = DisableButtons;
    </script>

    <script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modal");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 500);
        }
        $('form').on("submit", function () {
            ShowProgress();
        });
    </script>



    <style type="text/css">
        body
        {
            color: #797979;
            background: #fff;
            font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;
            padding: 0px !important;
            margin: 0px !important;
            font-size: 14px !important;
        }

        nav > li > a:hover
        {
            color: #9d9d9d;
            background-color: transparent;
        }

        .navbar-inverse .navbar-nav > .open > a, .navbar-inverse .navbar-nav > .open > a:focus, .navbar-inverse .navbar-nav > .open > a:hover
        {
            color: #fff;
            background-color: #006e2e;
        }

            .navbar-inverse .navbar-nav > .open > a, .navbar-inverse .navbar-nav > .open > a:focus, .navbar-inverse .navbar-nav > .open > a:hover
            {
                color: #fff;
                background-color: #006e2e;
            }

        .navbar-inverse .navbar-nav > li > a
        {
            /*color: #fff;*/
        }

        .nav .navbar-nav .side-nav:hover
        {
            color: #fff;
            background-color: #006e2e;
        }

        .side-nav li a:hover, .side-nav li a:focus
        {
            outline: none;
            background-color: #62A31A !important;
        }
    </style>

    <style type="text/css">
        .panel-transparent
        {
            background: none;
        }

            .panel-transparent .panel-heading
            {
                background: rgba(122, 130, 136, 0.2)!important;
                color: white;
            }

            .panel-transparent .panel-body
            {
                background: rgba(46, 51, 56, 0.2)!important;
                color: white;
                text-align: left;
            }

        .btn-file
        {
            position: relative;
            overflow: hidden;
        }

            .btn-file input[type=file]
            {
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

        label
        {
            font-weight: normal;
        }

        .PlansDiv
        {
            background-color: rgba(255, 0, 0, 0.46);
            height: 400px;
            border-radius: 40px;
            color: white;
            padding-top: 10px;
        }

        .heading
        {
            font-size: 24px;
            font-weight: bold;
            text-decoration: underline;
            font-style: italic;
        }

        li
        {
            font-size: 18px;
        }

        .my-error-class
        {
            color: #FF0000; /* red */
        }

        .my-valid-class
        {
            color: #00CC00; /* green */
        }

        .bgImage
        {
            background: url(../images/banner.jpg) no-repeat center top !important;
            background-size: cover !important;
            -webkit-background-size: cover !important;
            -moz-background-size: cover;
            -o-background-size: cover;
            min-height: 550px !important;
            text-align: center;
            /*padding-top: 3em;*/
        }

        .HeaderImg
        {
            text-align: center;
            padding-bottom: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="HeaderImg" style="background-color: #6791a1">
            <h2 style="color: white">Virtual Bazaar</h2>
            <hr />
        </div>
        <div class="bgImage">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="../Home.aspx">Home</a>
                        <a href="#" class="navbar-brand">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown1">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="font-size: 18px;">Master </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="../MasterPage/StateMaster.aspx">Add State</a></li>
                                        <li><a href="../MasterPage/DistrictMaster.aspx">Add District</a></li>
                                        <li><a href="../MasterPage/LocalityMaster.aspx">Add Location</a></li>
                                        <li><a href="../MasterPage/CategoryMaster.aspx">Add Category</a></li>
                                        <li><a href="../MasterPage/UserRegistration.aspx">User Registration</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </a>
                        <a class="navbar-brand" href="../AdvertiserRegistration.aspx">Advertisers</a>

                        <a class="navbar-brand" href="../Dashboard.aspx">Dashboard</a>
                    </div>
                </div>
            </nav>
            <div>
                <div style="padding-left: 40px; padding-right: 40px">
                    <div class="panel panel-default panel-transparent" id="MainDivEgovernance">
                        <div class="panel-heading">
                            Veiw Report- All Years
                        </div>
                        <%--<div class="panel-heading text-center" style="background-color: #006e2e; color: #fff;">CategoryVedio Veiw</div>--%>
                        <div>
                            <br />
                            <div runat="server" id="divViewChart" style="padding-bottom:10px">
                                <div runat="server" id="DivSchemeStatusChart1" class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-2">
                                        Chart Type :
                                    <asp:DropDownList runat="server" ID="ddl2" CssClass="form-control input-sm"></asp:DropDownList>
                                    </div>
                                    <div class="col-lg-2">
                                        Category :
                                                                <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-control input-sm"></asp:DropDownList>
                                    </div>
                                    <div class="col-lg-2">
                                        Advertiser :
                                                                <asp:DropDownList runat="server" ID="ddlAdvertiser" CssClass="form-control input-sm"></asp:DropDownList>
                                    </div>
                                    <div class="col-lg-2">
                                        Year :
                                                                <asp:DropDownList runat="server" ID="ddlYear" CssClass="form-control input-sm"></asp:DropDownList>

                                    </div>
                                    <div class="col-lg-2" id="month">
                                        Month :
                                                                <asp:DropDownList runat="server" ID="ddlMonth" CssClass="form-control input-sm"></asp:DropDownList>
                                    </div>

                                </div>
                                <br />
                                <div class="row">
                                    <div id="ViewVedioChart" runat="server" style="height: 350px; width: 100%; padding-left: 65px;"></div>
                                </div>
                            </div>
                            <%--<div runat="server" id="divBudget">
                                <div class="table-responsive">
                                <div class="panel panel-default" style="border:1px solid #006e2e;">
                               <div class="panel-heading text-center" style="background-color:#006e2e;color:#fff;">Scheme Wise Budget Status</div>
                                <div class="panel-body">
                                <div runat="server" id="divBudgetChart" class="row">
                                    <div class="col-lg-6">
                                         Chart Type :
                                    <asp:DropDownList runat="server" ID="ddl3"  CssClass="form-control input-sm"></asp:DropDownList>
                                    </div>
                                     <div class="col-lg-6">
                                      Year: <asp:DropDownList runat="server" ID="ddlBudgetSchemeWiseYear" CssClass="form-control input-sm"></asp:DropDownList>
                                     </div>
                                    </div>                                
                                      <br />
                                   <div id="BudgetSchemeWiseChart" runat="server" style="height: 350px;" class="row"></div>
                                </div>
                                </div>
                                    </div>
                                </div>--%>


                            <%--<div runat="server" id="DivBUDGETChart1">
                            <div class="table-responsive">
                            <div class="panel panel-default" style="border:1px solid #006e2e;">
                             <div class="panel-heading text-center" style="border:1px solid #006e2e; background-color:#006e2e; color:#fff;">Budget Utilization Status</div>                              
                             <div class="panel-body">
                                
                                <div runat="server" id="DivBUDGETStatusChart" class="row">
                                    <div class="col-lg-4">
                                         Chart Type :
                                    <asp:DropDownList runat="server" ID="ddl4" CssClass="form-control input-sm"></asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                         Scheme:  <asp:DropDownList runat="server" ID="ddlcurruntScheme" CssClass="form-control input-sm"></asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        Year :<asp:DropDownList runat="server" ID="ddlBUDGETYear" CssClass="form-control input-sm"></asp:DropDownList>
                                    </div>
                                    </div>
                                    <br />
                           <div id="BUDGETChart" runat="server" style="height:350px;" class="row"></div>                              
                            </div>
                            </div>
                            </div>
                            </div>--%>

                            <%--<div runat="server" id="DivSchememilestone">
                            <div class="panel panel-default" style="border:1px solid #006e2e;">
                            <div class="panel-heading text-center" style="border:1px solid #006e2e; background-color:#006e2e; color:#fff;">Scheme milestone Status</div>                                                               
                            <div class="panel-body">
                            <div runat="server" id="Div2" class="row">                           
                                 <div class="col-lg-4">
                                  Chart Type :
                                    <asp:DropDownList runat="server" ID="ddl9" CssClass="form-control input-sm"></asp:DropDownList>
                                 </div>
                                 <div class="col-lg-4">
                                  Scheme :
                                 <asp:DropDownList runat="server" ID="ddlSchememilstone" CssClass="form-control input-sm"></asp:DropDownList>
                                 </div>
                                 <div class="col-lg-4">
                                 Year:
                                  <asp:DropDownList runat="server" ID="ddlSchememilstoneyear" CssClass="form-control input-sm"></asp:DropDownList>
                                 </div>                                        
                               
                            </div>
                            <br />
                 <div id="SchememilestoneChart" runat="server" style="height: 350px;" class="row"></div>                             
                               </div>                               
                              </div>
                            </div>--%>
                        </div>
                    </div>
                    <div class="panel panel-default" id="MainAssetsDiv" style="display: none; overflow: auto; border: 1px solid #006e2e;">
                        <div class="panel-heading text-center" style="background-color: #006e2e; color: #fff;">Asset Management</div>
                        <div class="panel-body">
                            <div runat="server" id="AssetsStatusDiv">
                                <div class="table-responsive">
                                    <div class="panel panel-default" style="border: 1px solid #006e2e;">
                                        <div class="panel-heading text-center" style="background-color: #006e2e; color: #fff;">Status Report</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    Chart Type :
                                    <asp:DropDownList runat="server" ID="ddl8" CssClass="form-control input-sm"></asp:DropDownList>
                                                </div>
                                                <div class="col-lg-6">
                                                    Year:
                                                                <asp:DropDownList runat="server" ID="ddlAssetsYear" CssClass="form-control input-sm"></asp:DropDownList>
                                                    <asp:DropDownList runat="server" ID="ddlAssetsMonth" Width="80"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <br />
                                            <div id="AssetsChart" runat="server" style="height: 350px;" class="row"></div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default" id="MainHRMSDiv" style="display: none; overflow: auto; border: 1px solid #006e2e;">
                        <div class="panel-heading text-center" style="background-color: #006e2e; color: #fff;">Helpdesk System</div>
                        <div class="panel-body">
                            <div runat="server" id="IncidentStatusDiv">
                                <div class="table-responsive">
                                    <div class="panel panel-default" style="border: 1px solid #006e2e;">
                                        <div class="panel-heading text-center" style="background-color: #006e2e; color: #fff;">Incident Status</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    Chart Type :
                                    <asp:DropDownList runat="server" ID="ddl6" CssClass="form-control input-sm"></asp:DropDownList>
                                                </div>
                                                <div class="col-lg-6">
                                                    Year:
                                                                <asp:DropDownList runat="server" ID="ddlIncidentYear" CssClass="form-control input-sm"></asp:DropDownList>
                                                    <asp:DropDownList runat="server" ID="ddlIncidentMonth" Width="80"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <br />
                                            <div id="IncidentChart" runat="server" style="height: 350px;" class="row"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div runat="server" id="PRIORITYDiv">
                                <div class="table-responsive">
                                    <div class="panel panel-default" style="border: 1px solid #006e2e;">
                                        <div class="panel-heading text-center" style="background-color: #006e2e; color: #fff;">Priority</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    Chart Type :
                    <asp:DropDownList runat="server" ID="ddl7" CssClass="form-control input-sm"></asp:DropDownList>
                                                </div>
                                                <div class="col-lg-6">
                                                    Year:
                                                                <asp:DropDownList runat="server" ID="ddlPriorityYear" CssClass="form-control input-sm"></asp:DropDownList>
                                                    <asp:DropDownList runat="server" ID="ddlPriorityMonth" Width="80"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <br />
                                            <div id="PRIORITYChart" runat="server" style="height: 350px;" class="row"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>




                        </div>
                    </div>

                    <br />

                </div>
            </div>
        </div>

    </form>
</body>
</html>
