<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="VirtualBazaar.AdminHome1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Profile</title>

    <script src="js/jquery-2.1.4.js"></script>
    <script src="js/Dashboard.js"></script>
    <script src="js/jquery.canvasjs.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            CreateChart();
        });

        function CreateChart() {


            $('#DashboardDiv1').css('display', 'block');


            var ChartType = $('#ddl1 option:selected').val();
            var Year = $('#ddlyear1 option:selected').text();
            var Month = $('#ddlMonths1 option:selected').text();
            var Advertiser = $('#ddlAdvertiser option:selected').val();
            getVediocount(ChartType, Year, Month, Advertiser);
            if (Year == 'All') {
                $('#ddlMonths1').hide();
            }
            else {
                $('#ddlMonths1').show();
            }


            $("#DashboardDiv1").show();

        }
    </script>





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

        .PlansDiv {
            background-color: rgba(255, 0, 0, 0.46);
            /*height: 100px;*/
            border-radius: 40px;
            color: white;
            padding-top: 10px;
        }

        .heading {
            font-size: 12px;
            font-weight: bold;
            text-decoration: underline;
            font-style: italic;
        }

        li {
            font-size: 11px;
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

        .lblAD {
            color: white;
            text-align: left;
            font: bold;
        }

        @media (min-width: 768px) {
            .circle-tile {
                margin-bottom: 30px;
            }
        }

        .circle-tile {
            margin-bottom: 15px;
            text-align: center;
        }

        .circle-tile-heading {
            position: relative;
            width: 200px;
            height: 140px;
            margin: 0 auto -40px;
            border: 3px solid rgba(255,255,255,0.3);
            border-radius: 100%;
            color: #fff;
            transition: all ease-in-out .3s;
        }

        /* -- Background Helper Classes */

        /* Use these to cuztomize the background color of a div. These are used along with tiles, or any other div you want to customize. */

        .dark-blue {
            background-color: #34495e;
        }

        .green {
            background-color: #16a085;
        }

        .blue {
            background-color: #2980b9;
        }

        .orange {
            background-color: #f39c12;
        }

        .red {
            background-color: #e74c3c;
        }

        .purple {
            background-color: #8e44ad;
        }

        .dark-gray {
            background-color: #7f8c8d;
        }

        .gray {
            background-color: #95a5a6;
        }

        .light-gray {
            background-color: #bdc3c7;
        }

        .yellow {
            background-color: #f1c40f;
        }

        /* -- Text Color Helper Classes */

        .text-dark-blue {
            color: #34495e;
        }

        .text-green {
            color: #16a085;
        }

        .text-blue {
            color: #2980b9;
        }

        .text-orange {
            color: #f39c12;
        }

        .text-red {
            color: #e74c3c;
        }

        .text-purple {
            color: #8e44ad;
        }

        .text-faded {
            color: rgba(255,255,255,0.7);
        }



        .circle-tile-heading .fa {
            line-height: 80px;
        }

        .circle-tile-content {
            padding-top: 50px;
        }

        .circle-tile-description {
            text-transform: uppercase;
        }

        .text-faded {
            color: rgba(255,255,255,0.7);
        }

        .circle-tile-number {
            padding: 5px 0 15px;
            font-size: 26px;
            font-weight: 700;
            line-height: 1;
        }

        .circle-tile-footer {
            display: block;
            padding: 5px;
            color: rgba(255,255,255,0.5);
            background-color: rgba(0,0,0,0.1);
            transition: all ease-in-out .3s;
        }

            .circle-tile-footer:hover {
                text-decoration: none;
                color: rgba(255,255,255,0.5);
                background-color: rgba(0,0,0,0.2);
            }


        .morning {
            background: url(https://lh3.googleusercontent.com/-1YbV7nsVnX8/WMugaq-6BEI/AAAAAAAADSg/0wPfQ84vMUcCle_SkgiUDOumUKscMaA8QCL0B/w530-d-h353-p-rw/widget-bg-morning.jpg) center bottom no-repeat;
            background-size: cover;
        }

        .time-widget {
            margin-top: 5px;
            overflow: hidden;
            text-align: center;
            font-size: 1.75em;
        }

        .time-widget-heading {
            text-transform: uppercase;
            font-size: .5em;
            font-weight: 400;
            color: #fff;
        }

        #datetime {
            color: #fff;
        }

        .tile-img {
            text-shadow: 2px 2px 3px rgba(0,0,0,0.9);
        }

        .tile {
            margin-bottom: 15px;
            padding: 15px;
            overflow: hidden;
            color: #fff;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div id="DivEntry" runat="server">
            <div class="panel panel-default panel-transparent">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            User Profile
                        </div>

                    </div>
                </div>

                <div style="background-color: white">
                    <div class="row">
                        <div class="col-lg-2 col-sm-6"></div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="circle-tile">
                                <a href="ApprovevideoPage.aspx">
                                    <div class="circle-tile-heading red">
                                        <%--<i class="fa fa-users fa-fw fa-3x"></i>--%>
                                        <img src="images/ApproveVideo.png" />
                                    </div>
                                </a>
                                <div class="circle-tile-content red">
                                    <div class="circle-tile-description text-faded">
                                        <label class="heading">Videos Pending for Approval</label>
                                    </div>
                                    <div class="circle-tile-number text-faded">
                                        <asp:Label ID="Lblvedios" runat="server"></asp:Label>
                                        <span id="sparklineA"></span>
                                    </div>
                                    <a href="ApprovevideoPage.aspx" class="circle-tile-footer">More Info <i class="fa fa-chevron-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="circle-tile">
                                <a href="ApprovevideoPage.aspx">
                                    <div class="circle-tile-heading green">
                                        <%--<i class="fa fa-money fa-fw fa-3x"></i>--%>
                                        <img src="images/ApproveImage.png" />
                                    </div>
                                </a>
                                <div class="circle-tile-content green">
                                    <div class="circle-tile-description text-faded">
                                        <label class="heading">Images Pending for Approval</label>
                                    </div>
                                    <div class="circle-tile-number text-faded">
                                        <asp:Label ID="lblImage" runat="server"></asp:Label>
                                    </div>
                                    <a href="ApprovevideoPage.aspx" class="circle-tile-footer">More Info <i class="fa fa-chevron-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" id="DashboardDiv1">
                        <div class="panel-body">
                            <div id="Div2" runat="server">

                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                        Chart Type :
                                    <asp:DropDownList runat="server" ID="ddl1" CssClass="form-control input-sm" ClientIDMode="Static">
                                    </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                        Year:
                                      <asp:DropDownList runat="server" ID="ddlyear1" ClientIDMode="Static" CssClass="form-control input-sm"></asp:DropDownList>
                                        <asp:DropDownList runat="server" ID="ddlMonths1" CssClass="form-control input-sm" Visible="false"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="display: none;">
                                    Advertiser:
                               <asp:DropDownList runat="server" ID="ddlAdvertiser" ClientIDMode="Static" CssClass="form-control input-sm" Enabled="false"></asp:DropDownList>
                                </div>
                                <br />
                                <div class="row">
                                    <div id="DashboardChartvediocount" style="height: 350px; width: 90%; padding-left: 20px"></div>
                                </div>

                            </div>
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
