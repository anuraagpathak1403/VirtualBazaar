<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="AssignRights.aspx.cs" Inherits="VirtualBazaar.MasterPage.AssignRights" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
    <center>
        <div id="divMain" align="center" class="mainDiv" style="margin-left: 5%;margin-right:5%; margin-top: 5px;border:2px groove;background-color:white">
            <div id="divHeaderCreation" class="mainHeaderDiv">
                <asp:Label ID="lblHead" runat="server" CssClass="labelPageHeader" Text="Assign Rights"></asp:Label>
            </div>
            <br />
            <center>
                <div>
                    <table style="width: 80%;" class="tabletrcss">
                        <tr>
                            <td align="left" style="width: 38.6%" class="ViewEdit">View
                            </td>
                            <td align="left" style="width: 40%" class="ViewEdit">Entry/Edit
                            </td>
                        </tr>
                    </table>
                </div>

                <asp:Panel ID="pnlPageRights" runat="server" ScrollBars="Vertical" HorizontalAlign="Center" Width="80%" Height="375px" CssClass="ShowBorder">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="tblPageRights" runat="server" Width="100%" CssClass="table table-bordered" Style="margin-top: 0px">
                            </asp:Table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <br />
                <asp:Button ID="btnAssign" runat="server" Text="Assign" OnClick="btnAssign_Click" CssClass="btn-success btn" Height="30px" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn-danger btn" Height="30px" />
            </center>
        </div>
    </center>
</asp:Content>
