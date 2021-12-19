<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="ApprovevideoPage.aspx.cs" Inherits="VirtualBazaar.ApprovevideoPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content_middle">
        <div>
            <div class="content_middle_box">
                <div class="top_grid">
                    <div class="col-md-12">
                        <div class="grid1">
                            <div style="width=100%; overflow: auto">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div id="TopRated" runat="server">
                                            <asp:GridView ID="grdvCategory" runat="server" ClientIDMode="Static" ShowHeaderWhenEmpty="true" EmptyDataText="No Request Found" AutoGenerateColumns="False" GridLines="None" HeaderStyle-Wrap="true"
                                                Width="100%" ShowFooter="false" ShowHeader="false" OnRowDataBound="grdvCategory_RowDataBound" CssClass="GridTabletrCss table table-striped table-bordered table-hover display" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-ForeColor="Red">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <div style="background-color: #337ab7; text-align: center; color: white">
                                                                <asp:Label ID="lblCategory" runat="server" Font-Size="20px" Font-Names="Comic Sans MS" Font-Italic="true" Text='<%# Eval("Category") %>'></asp:Label>
                                                                <asp:HiddenField ID="hdnCategoryID" runat="server" Value='<%# Eval("CategoryID") %>' />

                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:DataList ID="DtlistAdvertisements" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" CellSpacing="3" CellPadding="10" RepeatLayout="Table">
                                                                            <ItemTemplate>
                                                                                <div style="border: 1px groove #cf5222; margin: 8px;">
                                                                                    <div class="row">
                                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                            <a href='<%# Eval("AdvertiserID", "AdvertiserDetails.aspx?Id={0}") %>'>
                                                                                                <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' width="250" height="150" />
                                                                                            </a>
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
                                                                            <%--<ItemStyle BorderWidth="1" BorderColor="LightBlue" />--%>
                                                                        </asp:DataList>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: right;">
                                                                        <asp:LinkButton ID="lnkbtnViewAll" runat="server" Text="View All...." OnClick="lnkbtnViewAll_Click"></asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div id="CategryWise" runat="server" visible="false">
                                            <div class="panel panel-default panel-transparent">
                                                <div>
                                                    <div style="background-color: #cf5222; text-align: center; color: white">
                                                        <asp:Label ID="lblname" runat="server" Font-Size="20px" Font-Names="Comic Sans MS"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:DataList ID="dtlistCategoryWiseVideo" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" CellSpacing="3" CellPadding="10" RepeatLayout="Table">
                                                <ItemTemplate>
                                                    <div style="border: 1px groove #cf5222; margin: 8px;">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <a href='<%# Eval("Id", "PlayMyVideo.aspx?Id={0}") %>'>
                                                                    <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' width="250" height="150" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: center; font-family: Georgia">
                                                                <asp:HiddenField ID="hdnVideoID" runat="server" Value='<%# Eval("Id") %>' />
                                                                <asp:Label ID="lblAdvertiserName" runat="server" Font-Italic="true" Text='<%# Eval("Name") %>' Font-Size="18px"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="color: red; font-size: smaller; padding: 5px">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
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

        </div>

    </div>
</asp:Content>
