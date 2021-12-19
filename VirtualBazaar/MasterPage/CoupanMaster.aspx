<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="CoupanMaster.aspx.cs" Inherits="VirtualBazaar.MasterPage.Coupan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Coupan</title>
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
            $('#grdvCoupon').DataTable({

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
    <div class="container">
        <div id="DivEntry" runat="server" visible="false">
            <div class="panel panel-default panel-transparent">
                <div class="panel-heading">
                    Send Coupon
                </div>

                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <asp:HiddenField ID="hdfCouponId" runat="server" />
                                <label for="txtName">Discount Value </label>
                                <asp:DropDownList ID="ddlDiscount" Enabled="true" runat="server" CssClass="form-control input-sm">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="txtCategory">Valid Upto</label>
                                 <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                 <asp:CalendarExtender ID="calenderCouponEndDate" runat="server" PopupButtonID="txtCouponEndDate"
                                    TargetControlID="txtEndDate" Format="dd/MMM/yyyy">
                                 </asp:CalendarExtender>
                            </div>
                        </div>
                    </div>
                       <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12"></div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label for="txtCategory">Coupon Number </label>
                                <asp:Label ID="lblCoupon" runat="server" CssClass="form-control input-sm"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                        <asp:Button ID="btnSave" runat="server" Text="Send Coupon" CssClass="btn btn-danger btn-block" OnClick="btnSave_Click" />
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-primary btn-block" />
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    </div>
                </div>
                <br />
            </div>
            <br />
        </div>
        

        <div id="DivGridView" runat="server">
            <div class="panel panel-default panel-transparent">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <h5>Send Coupon</h5>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <asp:Button ID="btnAddCoupon" runat="server" Width="120px" CssClass="btn btn-danger btn-block" Text="Send Coupon" OnClick="btnAddCoupon_Click" />
                        </div>
                    </div>
                </div>
                <div class="row" style="padding: 5px">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div>
                            <asp:GridView ID="grdvCoupon" runat="server"
                                OnPreRender="grdvCoupon_PreRender" ClientIDMode="Static" ShowHeaderWhenEmpty="true" EmptyDataText="No Request Found" AutoGenerateColumns="False" GridLines="None" HeaderStyle-Wrap="true"
                                Width="100%" ShowFooter="false" CssClass="GridTabletrCss table table-striped table-bordered table-hover display" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-ForeColor="Red">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr No.">
                                        <ItemStyle Width="100px" />
                                        <ItemTemplate>
                                            <%# ((GridViewRow)Container).RowIndex + 1%>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="gridStyle" />
                                        <ItemStyle CssClass="gridLabel"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>                                            
                                            <asp:Label ID="lblUserName" runat="server" CssClass="gridLabel" Text='<%#Eval("UserName") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="gridStyle" />
                                        <ItemStyle CssClass="gridLabel"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Discount Value">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdnCategoryID" runat="server" Value='<%#Eval("coupons") %>' />
                                            <asp:Label ID="lblCoupon" runat="server" CssClass="gridLabel" Text='<%#Eval("Discount") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="gridStyle" />
                                        <ItemStyle CssClass="gridLabel"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Valid Upto">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValidUpto" runat="server" CssClass="gridLabel" Text='<%#Eval("validupto") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="gridStyle" />
                                        <ItemStyle CssClass="gridLabel"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Used Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUsedStatus" runat="server" CssClass="gridLabel" Text='<%#Eval("usedStatus") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="gridStyle" />
                                        <ItemStyle CssClass="gridLabel"></ItemStyle>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>

                                            <asp:LinkButton runat="server" ID="lnkbtnSend" OnClick="lnkbtnEdit_Click"><b>Send Coupan</b></asp:LinkButton>
                                            ||<asp:LinkButton ID="lnkbtnforDelete" runat="server" ToolTip="Delete" OnClick="lnkbtnforDelete_Click"><b>Delete</b></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
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
            <br />
        </div>

        <div id="DivShowall" runat="server" visible="false">
            <div class="panel panel-default panel-transparent">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <h5>Send Coupon</h5>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <%--<asp:Button ID="Button1" runat="server" Width="120px" CssClass="btn btn-danger btn-block" Text="Send Coupon" OnClick="btnAddCoupon_Click" />--%>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding: 5px">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div>
                            <asp:GridView ID="GrdShowAllCoupon" runat="server"
                               OnPreRender="GrdShowAllCoupon_PreRender"  ClientIDMode="Static" ShowHeaderWhenEmpty="true" EmptyDataText="No Request Found" AutoGenerateColumns="False" GridLines="None" HeaderStyle-Wrap="true"
                                Width="100%" ShowFooter="false" CssClass="GridTabletrCss table table-striped table-bordered table-hover display" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-ForeColor="Red">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr No.">
                                        <ItemStyle Width="100px" />
                                        <ItemTemplate>
                                            <%# ((GridViewRow)Container).RowIndex + 1%>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="gridStyle" />
                                        <ItemStyle CssClass="gridLabel"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>                                            
                                            <asp:Label ID="lblUserName" runat="server" CssClass="gridLabel" Text='<%#Eval("UserName") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="gridStyle" />
                                        <ItemStyle CssClass="gridLabel"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comment">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdnCategoryID" runat="server" Value='<%#Eval("coupons") %>' />
                                            <asp:Label ID="lblcomment" runat="server" CssClass="gridLabel" Text='<%#Eval("comment") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="gridStyle" />
                                        <ItemStyle CssClass="gridLabel"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comment Date">
                                        <ItemTemplate>
                                                                                     
                                            <asp:Label ID="lblcommentDate" runat="server" CssClass="gridLabel" Text='<%#Eval("commentDate") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="gridStyle" />
                                        <ItemStyle CssClass="gridLabel"></ItemStyle>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>

                                            <asp:LinkButton runat="server" ID="lnkbtnSend" OnClick="lnkbtnSend_Click"><b>Send Coupan</b></asp:LinkButton>
                                           
                                        </ItemTemplate>
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
            <br />
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
