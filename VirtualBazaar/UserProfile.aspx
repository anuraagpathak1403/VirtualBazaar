<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="VirtualBazaar.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Profile</title>

    <script src="js/jquery-2.1.4.js"></script>
    <script src="js/Dashboard.js"></script>
    <script src="js/jquery.canvasjs.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            CreateChart();
        });

        function CreateChart() {


            $('#DashboardDiv').css('display', 'block');


            var ChartType = $('#ddl8 option:selected').val();
            var Year = $('#ddlyear option:selected').text();
            var Month = $('#ddlMonths option:selected').text();
            var Advertiser = $('#ddlAdvertiser option:selected').val();
            getAdvertiserwiseDetails(ChartType, Year, Month, Advertiser);
            if (Year == 'All') {
                $('#ddlMonth').hide();
            }
            else {
                $('#ddlMonths').show();
            }


            $("#DashboardDiv").show();

        }
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

    <%--<script type="text/javascript">
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
                    <%= txtCEmailID.UniqueID %>: {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    <%= txtOrganisationName.UniqueID %>: {
                        required: "Please Enter Organisation Name"
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
                    <%= txtCEmailID.UniqueID %>: {
                        required: "Please enter email id",
                        email: "Please enter a valid email id"
                    }
                }
            });
        });
        
    </script>--%>

    <style type="text/css">
        .panel-transparent {
            background: none;
        }

            .panel-transparent .panel-heading {
                background: rgba(122, 130, 136, 0.2) !important;
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="panel panel-default panel-transparent">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        User Profile
                    </div>
                    <%--                <div class="col-md-4">
                    <div id="SchemeDiv" runat="server" visible="false">
                        <label for="txtPlan">Scheme </label>
                        <asp:Label ID="txtPlan" CssClass="PlaSch" Text=":" runat="server" Visible="false"></asp:Label>
                        <asp:HiddenField ID="hdnAdvertiser" runat="server" />
                    </div>
                </div>--%>
                </div>
            </div>

            <div class="row">
                <div id="DivEntry" runat="server">
                    <asp:DataList ID="DtlistAdvertisements" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" CellSpacing="3" CellPadding="10" RepeatLayout="Table">
                        <ItemTemplate>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12" style="padding: 5px; border-right: 2px ridge gray">
                                        <%--<asp:Image ID="imgAdvImage" runat="server" ImageUrl='<%# Eval("AdvImage") %>' Width="100%" Height="150px" />--%>
                                        <img src='<%# Eval("AdvImage") %>' width="430px" height="450px" />
                                    </div>
                                    <%--<div class="col-lg-1 col-md-1 col-sm-12 col-xs-12" ></div>--%>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="text-align: left">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-4">
                                                    User Details
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 text-left">
                                                <label for="lblMobileNo" style="font: bold 15px verdana" class="lblAD">Organization Name : </label>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 text-right">
                                                <asp:Label ID="lblOrgName" runat="server" class="lblAD" Text='<%# Eval("OrgName") %>'></asp:Label>
                                                <asp:HiddenField ID="hdnAdvertiserID" runat="server" Value='<%# Eval("AdvertiserID") %>' />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 text-left">
                                                <label for="lblMobileNo" style="font: bold 15px verdana" class="lblAD">Category : </label>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 text-right">
                                                <asp:Label ID="lblCategory" runat="server" class="lblAD" Text='<%# Eval("Category") %>'></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 text-left">
                                                <label for="lblMobileNo" style="font: bold 15px verdana" class="lblAD">Mobile Number : </label>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 text-right">
                                                <asp:Label ID="lblMobileNo" runat="server" class="lblAD" Text='<%# Eval("MobileNo") %>'></asp:Label>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 text-left">
                                                <label for="lblMobileNo" style="font: bold 15px verdana" class="lblAD">E-Mail ID : </label>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 text-right">
                                                <asp:Label ID="lblEmailID" runat="server" class="lblAD" Text='<%# Eval("EmailID") %>'></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 text-left">
                                                <label for="lblMobileNo" style="font: bold 15px verdana; padding-left: 5px" class="lblAD">Address : </label>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 text-right">
                                                <asp:Label ID="lblAddress" runat="server" class="lblAD" Text='<%# Eval("Address") %>'></asp:Label>
                                            </div>
                                        </div>

                                        <hr />
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-4">
                                                    Scheme Details
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 text-left">
                                                <label for="lblMobileNo" style="font: bold 15px verdana" class="lblAD">Scheme Name : </label>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 text-right">
                                                <asp:Label ID="Label1" runat="server" class="lblAD" Text='<%# Eval("scheme") %>'></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 text-left">
                                                <label for="lblMobileNo" style="font: bold 15px verdana" class="lblAD">Total View Allowed : </label>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 text-right">
                                                <asp:Label ID="Label2" runat="server" class="lblAD" Text='<%# Eval("veiwAllowed") %>'></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 text-left">
                                                <label for="lblMobileNo" style="font: bold 15px verdana" class="lblAD">Current Views: </label>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 text-right">
                                                <asp:Label ID="Label3" runat="server" class="lblAD" Text='<%# Eval("Views") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
            </div>
        </div>

        <div class="panel panel-default panel-transparent">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        User Video Count
                    </div>
                    <%--                <div class="col-md-4">
                    <div id="SchemeDiv" runat="server" visible="false">
                        <label for="txtPlan">Scheme </label>
                        <asp:Label ID="txtPlan" CssClass="PlaSch" Text=":" runat="server" Visible="false"></asp:Label>
                        <asp:HiddenField ID="hdnAdvertiser" runat="server" />
                    </div>
                </div>--%>
                </div>
            </div>
            <div class="row">


                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" id="DashboardDiv">


                    <div class="panel-body">
                        <div runat="server">

                            <div class="row">
                                <div class="col-lg-2">
                                    Chart Type :
                                    <asp:DropDownList runat="server" ID="ddl8" CssClass="form-control input-sm" ClientIDMode="Static">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-2">
                                    Year:
                                                                <asp:DropDownList runat="server" ID="ddlyear" ClientIDMode="Static" CssClass="form-control input-sm"></asp:DropDownList>
                                    <asp:DropDownList runat="server" ID="ddlMonths" CssClass="form-control input-sm" Visible="false"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2" style="display: none;">
                                Advertiser:
                                                                 <asp:DropDownList runat="server" ID="ddlAdvertiser" ClientIDMode="Static" CssClass="form-control input-sm" Enabled="false"></asp:DropDownList>

                            </div>
                            <br />
                            <div class="row">
                                <div id="DashboardChart" style="height: 350px; width: 90%; *padding-left: 30px"></div>
                            </div>
                            <%--<div id="DashboardChart" runat="server" style="height: 350px;" class="row"></div>--%>
                        </div>
                    </div>
                </div>

            </div>
        </div>
</asp:Content>
