<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="AdvertiserRegistration.aspx.cs" Inherits="VirtualBazaar.AdvertiserRegistration1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Advertier Resgistration</title>

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
    <link href="css/PricingSheet.css" rel="stylesheet" />
    <script src="js/jquery.validate.js"></script>
    <script src="js/additional-methods.js"></script>
    <%--  --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#grdvAdvertisers').DataTable({

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
                sDom: '<"H"lfr>t<"F"ip>'

            });
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

    <script type="text/javascript">
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
            height: 400px;
            border-radius: 40px;
            color: white;
            padding-top: 10px;
        }

        .heading {
            font-size: 24px;
            font-weight: bold;
            text-decoration: underline;
            font-style: italic;
        }

        li {
            font-size: 18px;
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="font-family: Verdana">
        <%--<asp:UpdatePanel ID="update1" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
            </Triggers>
            <ContentTemplate>--%>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4" style="color: white; font-family: Verdana">
                        Advertiser Registration
                    </div>
                    <div class="col-md-4">
                        <div id="SchemeDiv" runat="server" visible="false">
                            <label for="txtPlan" style="color: white">Scheme </label>
                            <asp:Label ID="txtPlan" CssClass="PlaSch" Text=":" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body" id="DivEntry" runat="server" visible="false">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtOrganisationName">Organisation Name </label>
                            <asp:TextBox ID="txtOrganisationName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            <asp:HiddenField ID="hdnAdvertiserID" runat="server" Value="0" />
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="ddlCategory">Category </label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtMobileNo">Phone Number </label>
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
                            <label for="ddlState">State </label>
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control input-sm" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="ddlCity">City </label>
                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control input-sm" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="ddlLocality">Locality </label>
                            <asp:DropDownList ID="ddlLocality" runat="server" ClientIDMode="Static" CssClass="form-control input-sm"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtLandmark">Landmarks </label>
                            <asp:TextBox ID="txtLandmark" runat="server" ClientIDMode="Static" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtStreetName">Street Name </label>
                            <asp:TextBox ID="txtStreetName" runat="server" ClientIDMode="Static" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtWebsite">Website </label>
                            <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                            <asp:HiddenField ID="hdnLatitude" runat="server" />
                            <asp:HiddenField ID="hdnLongitude" runat="server" />
                            <div class="push-down"></div>
                        </div>
                    </div>
                    <div id="DivImage" runat="server" class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="FileImage">Image </label>
                            <asp:FileUpload ID="FileImage" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div id="DivVideo" runat="server" class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtTitle">Video </label>
                            <asp:FileUpload ID="FileVideo" runat="server" CssClass="form-control" />
                            <%--<div class="input-group">
                                        <label class="input-group-btn">
                                            <span class="btn btn-primary">Browse...
                                                
                                            </span>
                                        </label>
                                        <input type="text" class="form-control" readonly />
                                    </div>--%>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtKeyword">KeyWord </label>
                            <asp:TextBox ID="txtKeyword" runat="server" Style="resize: none;" CssClass="form-control input-sm" Rows="5" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtDescription">Description </label>
                            <asp:TextBox ID="txtDescription" runat="server" Style="resize: none;" CssClass="form-control input-sm" Rows="5" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div style="text-align: center; border: 1px groove; background-color: #337ab7; padding: 8px; color: white">
                    Contact Information
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtName">Name </label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtCMobieNum">Mobile Number </label>
                            <asp:TextBox ID="txtCMobieNum" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <label for="txtCEmailID">Email ID </label>
                            <asp:TextBox ID="txtCEmailID" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-danger btn-block" OnClick="btnSave_Click" />
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary btn-block" OnClick="btnBack_Click" formnovalidate />
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    </div>
                </div>
            </div>

            <div class="panel-body" id="DivGrid" runat="server">
                <div class="row" style="padding-bottom: 5px">
                    <div class="col-lg-10 col-md-10 col-sm-12 colxs-12">
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12 colxs-12">
                        <asp:Button ID="btnAdvertiserRegistration" runat="server" CssClass="btn btn-danger btn-block" Text="Register Advertiser" OnClick="btnAdvertiserRegistration_Click" />
                    </div>

                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 colxs-12" style="color: black;">
                        <asp:GridView ID="grdvAdvertisers" runat="server" OnPreRender="grdvAdvertisers_PreRender" ClientIDMode="Static" ShowHeaderWhenEmpty="true" EmptyDataText="No Request Found" AutoGenerateColumns="False" GridLines="None" HeaderStyle-Wrap="true"
                            Width="100%" ShowFooter="false" CssClass="GridTabletrCss table table-striped table-bordered table-hover display" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-ForeColor="Red">
                            <Columns>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' />
                                        <asp:HiddenField ID="hdnAdvertiserID" runat="server" Value='<%#Eval("AdvertiserID") %>' />
                                        <asp:HiddenField ID="hdnVideoID" runat="server" Value='<%#Eval("VideoID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCategory" runat="server" Text='<%#Eval("Category") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="E-Mail ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEMailID" runat="server" Text='<%#Eval("EMailID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobileNo" runat="server" Text='<%#Eval("MobileNo") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Website">
                                    <ItemTemplate>
                                        <asp:Label ID="lblWebsite" runat="server" Text='<%#Eval("Website") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Operation">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnEdit" runat="server" OnClick="lnkbtnEdit_Click" Text="Edit" Enabled="true"
                                            ToolTip="Edit" /><b style="font-size: 14px; vertical-align: top" class="TextColor">&nbsp;|</b>
                                        <asp:LinkButton ID="lnkbtnDelete" Text="Delete" OnClick="lnkbtnDelete_Click" runat="server" Enabled="true"
                                            ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to Delete this Advertiser?');" />
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

            <div class="panel-body" id="DivPlans" runat="server" visible="false">
                <%--<div class="row" style="padding: 5px">
                    <div class="col-lg-4 col-md-4 col-sm-12 colxs-12">
                        <div class="PlansDiv">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                    <label class="heading">Silver Scheme</label>
                                    <hr />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <ul style="list-style-type: disc;">
                                        <li>Rs. 300/Month</li>
                                        <li>100 Views</li>
                                    </ul>
                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="PlansDiv">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                    <label class="heading">Gold Scheme</label>
                                    <hr />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <ul style="list-style-type: disc;">
                                        <li>Rs. 500/Month</li>
                                        <li>250 Views</li>
                                    </ul>
                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="PlansDiv">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                    <label class="heading">Diamond Scheme</label>
                                    <hr />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <ul style="list-style-type: disc;">
                                        <li>Rs. 750/Month</li>
                                        <li>500 Views</li>
                                    </ul>
                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                   
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">

                            <!-- PRICE ITEM -->
                            <div class="panell price panell-red">
                                <div class="panell-heading  text-center">
                                    <h3>SILVER PLAN</h3>
                                </div>
                                <div class="panell-bodyy text-center">
                                    <p class="lead" style="font-size: 40px"><strong>₹500 /&nbsp;&nbsp; month</strong></p>
                                </div>
                                <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item"><i class="icon-ok text-danger"></i>Personal use</li>
                                    <li class="list-group-item"><i class="icon-ok text-danger"></i>Unlimited projects</li>
                                    <li class="list-group-item"><i class="icon-ok text-danger"></i>27/7 support</li>
                                </ul>
                                <div class="panell-footer">
                                    <%--<a class="" href="#">BUY NOW!</a>--%>
                                    <asp:Button ID="btnBuySilver" runat="server" Text="Buy Now" CssClass="btn btn-lg btn-block btn-danger" OnClick="btnBuySilver_Click" />
                                </div>
                            </div>
                            <!-- /PRICE ITEM -->


                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">

                            <!-- PRICE ITEM -->
                            <div class="panell price panell-blue">
                                <div class="panell-heading arrow_box text-center">
                                    <h3>GOLD PLAN</h3>
                                </div>
                                <div class="panell-bodyy text-center">
                                    <p class="lead" style="font-size: 40px"><strong>₹1000 / month</strong></p>
                                </div>
                                <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item"><i class="icon-ok text-info"></i>Personal use</li>
                                    <li class="list-group-item"><i class="icon-ok text-info"></i>Unlimited projects</li>
                                    <li class="list-group-item"><i class="icon-ok text-info"></i>27/7 support</li>
                                </ul>
                                <div class="panell-footer">
                                    <%--<a class="" href="#">BUY NOW!</a>--%>
                                    <asp:Button ID="btnBuyGold" runat="server" Text="Buy Now" CssClass="btn btn-lg btn-block btn-info" OnClick="btnBuyGold_Click" />
                                </div>
                            </div>
                            <!-- /PRICE ITEM -->


                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">

                            <!-- PRICE ITEM -->
                            <div class="panell price panell-green">
                                <div class="panell-heading arrow_box text-center">
                                    <h3>DIAMOND PLAN</h3>
                                </div>
                                <div class="panell-bodyy text-center">
                                    <p class="lead" style="font-size: 40px"><strong>₹1500 / month</strong></p>
                                </div>
                                <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>Personal use</li>
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>Unlimited projects</li>
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>27/7 support</li>
                                </ul>
                                <div class="panell-footer">
                                    <%--<a class="" href="#">BUY NOW!</a>--%>
                                    <asp:Button ID="btnBuyDiamond" runat="server" Text="Buy Now" CssClass="btn btn-lg btn-block btn-success" OnClick="btnBuyDiamond_Click" />
                                </div>
                            </div>
                            <!-- /PRICE ITEM -->


                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">

                            <!-- PRICE ITEM -->
                            <div class="panell price panell-grey">
                                <div class="panell-heading arrow_box text-center">
                                    <h3>PLATINUM PLAN</h3>
                                </div>
                                <div class="panell-bodyy text-center">
                                    <p class="lead" style="font-size: 40px"><strong>₹2000 / month</strong></p>
                                </div>
                                <ul class="list-group list-group-flush text-center">
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>Personal use</li>
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>Unlimited projects</li>
                                    <li class="list-group-item"><i class="icon-ok text-success"></i>27/7 support</li>
                                </ul>
                                <div class="panell-footer">
                                    <a class="btn btn-lg btn-block btn-primary" href="#">BUY NOW!</a>

                                </div>
                            </div>
                            <!-- /PRICE ITEM -->


                        </div>

                    </div>

                </div>

            </div>


        </div>
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
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
