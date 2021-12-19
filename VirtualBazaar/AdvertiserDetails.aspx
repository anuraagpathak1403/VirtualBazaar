<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="AdvertiserDetails.aspx.cs" Inherits="VirtualBazaar.AdvertiserDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Renews Subscription</title>


    <script src="FlowPlayer/flowplayer-3.2.12.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        flowplayer("a.player", "http://releases.flowplayer.org/swf/flowplayer-3.2.16.swf", {
            plugins: {
                pseudo: { url: "FlowPlayer/flowplayer.pseudostreaming-3.2.12.swf" }
            },
            clip: { provider: 'pseudo', autoPlay: false },
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="panel panel-default panel-transparent">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        Advertise Detals
                    </div>
                    <div class="col-md-4">
                        <div id="SchemeDiv" runat="server" visible="false">
                            <label for="txtPlan">Scheme </label>
                            <asp:Label ID="txtPlan" CssClass="PlaSch" Text=":" runat="server" Visible="false"></asp:Label>
                            <asp:HiddenField ID="hdnAdvertiser" runat="server" />
                        </div>
                    </div>
                </div>
            </div>

            <div id="DivEntry" runat="server" class="panel-body">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:DataList ID="DtlistAdvertisements" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" CellSpacing="3" CellPadding="10" RepeatLayout="Table">
                            <ItemTemplate>
                                <div class="row" style="padding-left: 2%;">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="border: 1px ridge gray;background-color:white">
                                        <img src='<%# Eval("AdvImage") %>' style="width: 200px; height: 200px" />
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12" style="text-align: left; padding-right: 2%;">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                                    User Details
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 text-left">
                                                <label for="lblMobileNo" style="font: bold 15px verdana" class="lblAD">Organization Name : </label>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 text-right">
                                                <asp:Label ID="lblOrgName" runat="server" class="lblAD" Text='<%# Eval("OrgName") %>'></asp:Label>
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
                                    </div>
                                </div>
                                <br />
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-center">
                                            Old File
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 text-center">
                                            Requested File
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <video id="videoPlay" controls="controls" height="300" controlslist="nodownload">
                                            <source src="<%# Eval("VideoID", "FileCS.ashx?Id={0}") %>" type="video/mp4" />
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <video id="video1" controls="controls" height="300" controlslist="nodownload">
                                            <source src="<%# Eval("ApprovalVideoID", "ApprovalFile.ashx?Id={0}") %>" type="video/mp4" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>

                <br />
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <label for="ddlstatus">Remark : </label>
                        <asp:DropDownList ID="ddlstatus" runat="server" CssClass="form-control input-sm">
                            <asp:ListItem Text="Select" Value="1" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="Approve" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Reject" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <label for="txtRemark">Remark : </label>
                        <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" CssClass="form-control input-sm" Rows="5"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="panel-footer" style="background-color: transparent;">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                        <asp:Button ID="btnApprove" runat="server" Text="Save" CssClass="btn btn-primary btn-block" OnClick="btnApprove_Click" />
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-danger btn-block" />
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
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
