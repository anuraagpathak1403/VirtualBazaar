<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="VirtualBazaar.MasterPage.UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.jqueryui.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.jqueryui.min.css" />
    <link href="../assets/redmond/jquery-ui.min.css" rel="stylesheet" />
    <link href="../assets/redmond/theme.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../assets/redmond/jquery-ui.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.2.4/js/buttons.colVis.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#grdvUserRegistration').DataTable({

                buttons: [
                                {
                                    extend: 'copyHtml5',
                                    exportOptions: {
                                        //columns: ':not(:last-child)',
                                        modifier: {
                                            selected: true
                                        }
                                    }
                                },
                                {
                                    extend: 'excelHtml5',
                                    // text: '<i class="fa fa-file-excel-o" style="font-size:17px;"></i>',
                                    titleAttr: 'Export to Excel',
                                    title: 'Transfer details',
                                    exportOptions: {
                                        // columns: ':not(:last-child)',
                                        modifier: {
                                            selected: true
                                        }
                                    }
                                },
                              {
                                  extend: 'pdfHtml5',
                                  // text: '<i class="fa fa-file-pdf-o style="font-size:23px;"></i>',
                                  text: 'pdf',
                                  titleAttr: 'Export to PDF',
                                  title: 'Transfer details',
                                  exportOptions: {
                                      //columns: ':not(:last-child)',
                                      modifier: {
                                          selected: true
                                      }
                                  },
                              }
                ],
                lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
                bJQueryUI: true,
                sDom: 'BT<"clear"><"H"lfr>t<"F"ip>'

            });
        });
    </script>

    <link href="css/bootstrap.css" rel="stylesheet" />

    <style type="text/css">
        .panel-transparent
        {
            background: none;
        }

            .panel-transparent .panel-heading
            {
                background: #337ab7!important;
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
    </style>
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
    <script type="text/javascript">

        $(document).ready(function () {

            $("#form1").validate(
                {
                    rules: {
                        <%= txtFullName.UniqueID %> : {
                            required:true,
                            Type:String
                        },
                        <%= txtUserName.UniqueID %> : {
                            required:true,
                            Type:String
                        },

                        <%= txtMobileNo.UniqueID %> : {
                            required:true,
                            digits:true,
                            maxlength:12,
                            minlength:10
                        },

                        <%= txtAadharNumber.UniqueID %> : {
                            required:true,
                            digits:true,
                            maxlength:12,
                            minlength:10
                        },
                    },
                    message: {
                        <%= txtFullName.UniqueID %> : {
                            required:"Please Enter Name",
                            Type:"Please Enter character only"
                        },
                        <%= txtUserName.UniqueID %> : {
                            required:"Please Enter Name",
                            Type:"Please Enter character only"
                        },
                        <%= txtMobileNo.UniqueID %> : {
                            required:"Please Enter Mobile Number",
                            digits:"Please Enter Number Only",
                            maxlength:"Mobile Number can not be more than 12 digits using STD Code",
                            minlength:"Mobile Number can not be less than 10 digits"
                        },

                        <%= txtAadharNumber.UniqueID %> : {
                            required:"Please Enter Mobile Number",
                            digits:"Please Enter Number Only",
                            maxlength:"Mobile Number can not be more than 12 digits using STD Code",
                            minlength:"Mobile Number can not be less than 10 digits"
                        },
                    }
                });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <asp:UpdatePanel ID="update1" runat="server">
            <ContentTemplate>
                <div id="DivEntry" runat="server" visible="false">
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
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label for="txtMobileNo">Mobile Number </label>
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
                                        <label for="txtPassword">Password </label>
                                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control input-sm"></asp:TextBox>
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
                                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-danger btn-block" />
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-primary btn-block" />
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="DivGridView" runat="server">
                    <div class="panel panel-default panel-transparent">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
                                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                    <h5> User Registration</h5>
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                    <asp:Button ID="btnUserRegistration" runat="server" Width="120px" CssClass="btn btn-danger btn-block" Text="Add  User" OnClick="btnUserRegistration_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="row" style="padding: 5px">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div>
                                    <asp:GridView ID="grdvUserRegistration" runat="server"
                                        OnPreRender="grdvUserRegistration_PreRender" ClientIDMode="Static" ShowHeaderWhenEmpty="true" EmptyDataText="No Request Found" AutoGenerateColumns="False" GridLines="None" HeaderStyle-Wrap="true"
                                        Width="100%" ShowFooter="false" CssClass="GridTabletrCss table table-striped table-bordered table-hover display" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-ForeColor="Red">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Organisation Name">
                                                <ItemStyle Width="100px" CssClass="GridItemStyle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFullName" runat="server" Text='<%#Eval("Name") %>' />
                                                    <asp:HiddenField ID="hdnUserID" runat="server" Value='<%#Eval("UserID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User Name">
                                                <ItemStyle Width="100px" CssClass="GridItemStyle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUserName" runat="server" Text='<%#Eval("UserName") %>' />

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mail ID">
                                                <ItemStyle Width="100px" CssClass="GridItemStyle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMailID" runat="server" Text='<%#Eval("MailID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Operation">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnEdit" runat="server" OnClick="lnkbtnEdit_Click" Text="Edit" Enabled="true"
                                                        ToolTip="Edit" /><b style="font-size: 14px; vertical-align: top" class="TextColor">&nbsp;|</b>
                                                    <asp:LinkButton ID="lnkbtnDelete" Text="Delete" OnClick="lnkbtnDelete_Click" runat="server" Enabled="true"
                                                        ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to Delete Plot Information?');" />

                                                </ItemTemplate>
                                                <ItemStyle Width="120px" CssClass="GridItemStyle" />

                                            </asp:TemplateField>

                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle CssClass="pgr" BackColor="#284775" ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle CssClass="alt" BackColor="White" Wrap="True" ForeColor="#284775"></AlternatingRowStyle>
                                    </asp:GridView>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="modal fade" id="Div1" tabindex="-1" role="dialog" aria-labelledby="purchaseLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header btn-danger">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4><i id="I1" class="glyphicon glyphicon-thumbs-up">&nbsp;</i><span class="modal-title" id="Span1"></span></h4>
                </div>
                <div class="modal-body" id="Div2">
                </div>
                <div class="modal-footer">
                    <button type="button" id="Button1" class="btn" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>
    <button type="button" style="display: none" id="Button2" class="btn btn-lg"
        data-toggle="modal" data-target="#MsgBox">
        Launch modal
    </button>
</asp:Content>
