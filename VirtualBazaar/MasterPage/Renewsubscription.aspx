<%@ Page Title="" Language="C#" MasterPageFile="~/Master/InternalMaster.Master" AutoEventWireup="true" CodeBehind="Renewsubscription.aspx.cs" Inherits="VirtualBazaar.MasterPage.Renewsubscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Renews Subscription</title>

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
    <link href="../css/PricingSheet.css" rel="stylesheet" />
    <script src="js/jquery.validate.js"></script>
    <script src="js/additional-methods.js"></script>

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
                background: #337ab7 !important;
                color: white;
            }

             .panell-headingg {
                background: rgba(46, 51, 56, 0.2) !important;
                color: white;
                height:30px
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
                        Renews Subscription
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
                                        <div class="panell-headingg">
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
                                        <div class="panell-headingg">
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


            <div class="panel-body" id="DivPlans" runat="server" visible="true">
                <div style="background-color:white">
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
