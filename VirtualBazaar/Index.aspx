<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="VirtualBazaar.Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Home | Vadsbiz</title>
    <!--css-->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/navbar-fixed-side.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />

    <!--js-->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>

    <style type="text/css">
        a {
            color:#BBBBBB;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="Script1" runat="server"></asp:ScriptManager>
        <div class="navbar-fixed-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <a href="#">
                            <img src="images/logo.png" class="img-responsive"></a>
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12">
                        <div class="location_box">
                            <div class="location">
                                <asp:DropDownList ID="ddlCity" CssClass="form-control input-sm" runat="server" Height="36px"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="location_box">
                            <asp:TextBox ID="txtSerchValue" placeholder="Search" CssClass="form-control input-sm" Height="36px" runat="server" Width="100%"></asp:TextBox>
                            <ajaxToolkit:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="2"
                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtSerchValue"
                                ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                            </ajaxToolkit:AutoCompleteExtender>
                        </div>
                    </div>
                    <div class="col-md-1 col-sm-4 col-xs-12">
                        <asp:Button class="btn btn-danger" ID="btnSumit" runat="server" Text="Search" OnClick="btnSumit_Click" />
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <ul class="list-inline pull-right login_sec">
                            <li><a href="#">sign up</a></li>
                            <li><a href="#" onclick="document.getElementById('signin').style.display='block'" style="width: auto;">sign in</a></li>
                        </ul>
                        <asp:LinkButton ID="lblLoginName" Font-Size="Medium" runat="server" Text="Advertise with us" Visible="false" OnClick="lblLoginName_Click"></asp:LinkButton>
                        <!--signin-->
                        <div id="signin" class="modal">
                            <form class="modal-content animate" action="">
                                <div class="sign_in_form">
                                    <h1>sign in</h1>
                                    <asp:TextBox ID="txtUserName" MaxLength="30" class="form-control input-lg" runat="server" Placeholder="Enter Username" required></asp:TextBox>
                                    <asp:TextBox ID="txtPassword" MaxLength="30" class="form-control input-lg" runat="server" TextMode="Password" Placeholder="Enter Password" required></asp:TextBox>
                                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-danger btn-block btn-lg btn3d" />
                                    <br />
                                </div>
                                <div class="signinbutton">
                                    <button type="button" onclick="document.getElementById('signin').style.display='none'" class="cancelbtn">Cancel</button>
                                    <span class="psw">Forgot <a href="#">password?</a></span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid nav_body_sec">
            <div class="row body_row">
                <div class="col-sm-3 col-lg-2">
                    <nav class="navbar navbar-default navbar-fixed-side">
                        <div class="navbar-header">
                            <h1 class="heading responsive_heading">Category</h1>
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <h1 class="navbar_heading">category</h1>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <asp:GridView ID="grdvCategory" runat="server" ClientIDMode="Static" ShowHeaderWhenEmpty="true" EmptyDataText="No Request Found" AutoGenerateColumns="False" GridLines="None" HeaderStyle-Wrap="true"
                                ShowFooter="false" ShowHeader="false" CssClass="table table-striped" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-ForeColor="Red">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table style="width: 90%; margin-left: 10%;">
                                                <tr>
                                                    <td style="width: 20%;">
                                                        <i class="fa fa-pencil"></i>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="lnkbtnCategory" runat="server" Text='<%# Eval("Category") %>'></asp:LinkButton>
                                                        <asp:HiddenField ID="hdnCategoryID" runat="server" Value='<%# Eval("CategoryID") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle BackColor="Transparent" BorderStyle="None" ForeColor="#BBBBBB" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="footer_icon">
                            <ul class="list-inline">
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                            </ul>
                            <p align="center">
                                Copyright © 2017 Vadsbiz.
 				All Rights Reserved
                            </p>
                        </div>
                    </nav>
                </div>
                <!---->
                <div class="col-md-9 col-sm-9 col-lg-9 home_body_sec body_sec">
                    <div class="panel panel-default panel-transparent">
                        <div style="background-color: #cf5222; text-align: center; color: white">
                            <h3 class="agile_w3_title">
                                <asp:Label ID="lblname" runat="server" Font-Size="20px" Font-Names="Comic Sans MS"></asp:Label>
                            </h3>
                        </div>
                    </div>
                    <div id="CategryWise" runat="server" visible="false">
                        <asp:DataList ID="dtlistCategoryWiseVideo" runat="server" HorizontalAlign="Left"
                            BorderStyle="None" CellPadding="0" CellSpacing="0" RepeatLayout="flow"
                            GridLines="none" RepeatDirection="Horizontal"
                            Width="100%">
                            <ItemStyle BorderStyle="None" CssClass="ItemStyleCSS" />
                            <ItemTemplate>
                                <div style="border: 1px groove #cf5222; margin: 8px;">
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="img-responsive ">
                                                    <a href='<%# Eval("Id", "PlayMyVideo.aspx?Id={0}") %>'>
                                                        <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' width="250" height="150" />
                                                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: center; font-family: Georgia">
                                                <asp:HiddenField ID="hdnVideoID" runat="server" Value='<%# Eval("Id") %>' />
                                                <asp:Label ID="lblAdvertiserName" runat="server" Font-Italic="true" Text='<%# Eval("Name") %>' Font-Size="18px"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="color: red; font-size: smaller; padding: 10px">
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
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <div id="TopRated" runat="server">
                    </div>
                    <div class="banquet_hall category_sec">
                        <h1 class="heading">banquet hall</h1>
                        <div class="row">
                            <div class="col-md-4 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/banquet_hall.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/banquet_hall2.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/banquet_hall3.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pathology category_sec">
                        <h1 class="heading">pathology</h1>
                        <div class="row">
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/pathology.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/pathology2.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/pathology3.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/pathology4.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shopping malls category_sec">
                        <h1 class="heading">shopping malls</h1>
                        <div class="row">
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/shopping_malls.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/shopping_malls2.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/shopping_malls3.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/shopping_malls4.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/shopping_malls5.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/shopping_malls6.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/shopping_malls7.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/shopping_malls8.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="restaurant category_sec">
                        <h1 class="heading">Restaurant</h1>
                        <div class="row">
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/restaurant.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/restaurant2.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/restaurant3.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/restaurant4.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/restaurant5.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/restaurant6.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/restaurant7.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 thumbnail_box">
                                <div class="thumbnail">
                                    <img src="images/restaurant8.jpg" class="img-responsive">
                                    <div class="time pull-right">
                                        <i class="fa fa-clock-o" aria-hidden="true">
                                            <span>02.00</span>
                                        </i>
                                    </div>
                                    <div class="caption">
                                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                                        <span class="review">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </span>
                                        <p class="pull-right view">2,114,200 Viewes</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
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
            <div class="clearfix"></div>
        </div>

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
    </form>
</body>
</html>
