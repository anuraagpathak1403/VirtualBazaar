<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="VirtualBazaar.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script>
        $("input[name='type']").click(function () {
            var status = $(this).val();
            if (status == 2) {
                $(".business-fields").show();
            } else {
                $(".business-fields").hide();
            }
        });
</script>--%>
    <style>
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

            .radioboxlist label:hover {
                color: #CC3300;
                background: #D1CFC2;
            }

        input:checked + label {
            color: #CC3300;
            background: #D1CFC2;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default panel-transparent">
        <div class="panel-heading">
            <%--Advertisements--%>
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                    <div id="Top" style="background-color: lightgray;">
                        <asp:RadioButtonList ID="rbtLstCategory" runat="server" CssClass="radioboxlist" AutoPostBack="true" OnSelectedIndexChanged="rbtLstCategory_SelectedIndexChanged" RepeatDirection="Vertical">
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                    <div id="TopRated" runat="server">
                        <asp:GridView ID="grdvCategory" runat="server" ClientIDMode="Static" ShowHeaderWhenEmpty="true" EmptyDataText="No Request Found" AutoGenerateColumns="False" GridLines="None" HeaderStyle-Wrap="true"
                            Width="100%" ShowFooter="false" ShowHeader="false" OnRowDataBound="grdvCategory_RowDataBound" CssClass="GridTabletrCss table table-striped table-bordered table-hover display" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-ForeColor="Red">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="panel panel-default panel-transparent">
                                            <div class="panel-heading" style="background-color: lightgray;">
                                                <asp:Label ID="lblCategory" runat="server" Font-Bold="true" Font-Size="16px" Text='<%# Eval("Category") %>'></asp:Label>
                                                <asp:HiddenField ID="hdnCategoryID" runat="server" Value='<%# Eval("CategoryID") %>' />
                                            </div>
                                            <div class="panel-body">

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                        <asp:DataList ID="DtlistAdvertisements" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" CellSpacing="3" CellPadding="10" RepeatLayout="Table">
                                                            <ItemTemplate>

                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <a href='<%# Eval("Id", "PlayVideo.aspx?Id={0}") %>'>
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
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="CategryWise" runat="server">
                        <div class="panel panel-default panel-transparent">
                            <div class="panel-heading" style="background-color: lightgray;">
                                <asp:Label ID="lblname" runat="server" Font-Bold="true" Font-Size="16px"></asp:Label>
                            </div>
                        </div>
                        <asp:DataList ID="dtlistCategoryWiseVideo" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" CellSpacing="3" CellPadding="10" RepeatLayout="Table">
                            <ItemTemplate>

                                <div class="row">

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                        <a href='<%# Eval("Id", "PlayVideo.aspx?Id={0}") %>'>
                                            <video id="videoPlay" controls="controls" width="250" height="150" onplay="playVideo()">
                                                <source src="<%# Eval("Id", "FileCS.ashx?Id={0}") %>" type="video/mp4" />
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
                            <ItemStyle BorderWidth="10" BorderColor="LightBlue" />
                        </asp:DataList>
                    </div>
                </div>
            </div>

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
                        window.location = 'PlayMyVideo.aspx?Id=' + ID;
                    };
                }
            </script>
        </div>
    </div>

</asp:Content>
