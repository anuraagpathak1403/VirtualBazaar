<%@ Page Title="" Language="C#" MasterPageFile="~/Master/ExternalMaster.Master" AutoEventWireup="true" CodeBehind="ViewMap.aspx.cs" Inherits="VirtualBazaar.ViewMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>MAP</title>
    <script src="js/jquery-2.1.4.js"></script>
     <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKdXoEy8iDv_7yvzRJkH2mW9LFieOIT4g&libraries=places"></script>
    <%--<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKdXoEy8iDv_7yvzRJkH2mW9LFieOIT4g&libraries=places"></script>--%>
    <script src="js/app.js"></script>  
    <script src="css/jquery-ui.js"></script>    
    <link href="css/jquery-ui.css" rel="stylesheet" />     
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/appLoader.js"></script>
    <link href="css/Mainstyle.css" rel="stylesheet" />
    <script src="js/RichMarker.js"></script>
    <style>
        /* Always sest the map height explicitly to define the size of the div
       * element that contains the map. */
        #map-canvas
        {
            height: 500px;
        }
        /* Optional: Makes the sample page fill the window. */
    </style>
    <style type="text/css">
        .TDCSS
        {
            border: solid 1px #d8d1d1;
            width: 150px;
        }

        .gallery
        {
            display: inline-block;
            margin-top: 20px;
        }
    </style>

    <script type="text/javascript">
        function MessageCommon(titleCommon, cssClass, msgCommon) {
            $("#ShowBodyCommon").empty();
            $("#ShowTitleCommon").empty();
            $(".modal-header").removeClass('btn-danger btn-success');
            $("#ShowTitleCommon").removeClass('btn-danger btn-success');
            $("#ShowTitleCommon").addClass(cssClass);
            $(".modal-header").addClass(cssClass)
            if (cssClass === 'btn-danger') {
                $("#modalbtnCommon").removeClass('btn-danger');
                $("#modalbtnCommon").addClass('btn-danger');
                $("#Icon").removeClass('glyphicon-thumbs-up');
                $("#Icon").addClass('glyphicon-thumbs-down');
            }
            else {
                $("#modalbtnCommon").removeClass('btn-danger');
                $("#modalbtnCommon").addClass('btn-danger');
                $("#Icon").removeClass('glyphicon-thumbs-down');
                $("#Icon").addClass('glyphicon-thumbs-up');
            }
            $('#ShowBodyCommon').append('<p>' + msgCommon + '</p>');
            $('#ShowTitleCommon').append(titleCommon);
            $("#btnShowPopupCommon").click();
        }
    </script>
    <style type="text/css">
        .modal
        {
            position: absolute;
            top: 0%;
            right: 5%;
            bottom: 10%;
            left: 50%;
            z-index: 10040;
            overflow: auto;
            overflow-y: auto;
        }
    </style>
    <style>
        .MarkerCss {
            text-align:center; 
            padding: 2px; 
            font-size: 10px; 
            color: white; 
            font-family: Arial; 
            background-color: #1187C6;
        }

        .jumbotron
        {
            margin-top: 35px;
        }


        #sidebar
        {
            min-height: 400px;
            font-size: 11px;
        }

        #row-main
        {
            overflow-x: hidden; /* necessary to hide collapsed sidebar */
        }

        #content
        {
            background-color: lightyellow;
            -webkit-transition: width 0.3s ease;
            -moz-transition: width 0.3s ease;
            -o-transition: width 0.3s ease;
            transition: width 0.3s ease;
        }

            #content .btn-group
            {
                margin-bottom: 10px;
            }

        .col-md-9 .width-12,
        .col-md-12 .width-9
        {
            display: none; /* just hiding labels for demo purposes */
        }

        #sidebar
        {
            background-color: #f5f5f5;
            -webkit-transition: margin 0.3s ease;
            -moz-transition: margin 0.3s ease;
            -o-transition: margin 0.3s ease;
            transition: margin 0.3s ease;
        }

        .collapsed
        {
            display: none; /* hide it for small displays */
        }

        @media (min-width: 992px)
        {
            .collapsed
            {
                display: block;
                margin-left: -30%; /* same width as sidebar */
            }
        }

        #slidecontainer
        {
            width: 100%;
            margin-left: -15px;
        }

        .slider
        {
            -webkit-appearance: none;
            width: 100%;
            height: 3px;
            border-radius: 5px;
            background: #507BA1;
            outline: none;
            opacity: 0.7;
            -webkit-transition: .2s;
            transition: opacity .2s;
        }

            .slider:hover
            {
                opacity: 1;
            }

            .slider::-webkit-slider-thumb
            {
                -webkit-appearance: none;
                appearance: none;
                width: 8px;
                height: 18px;
                border-bottom-left-radius: 80%;
                border-bottom-right-radius: 80%;
                background: #5CB85C;
                cursor: pointer;
            }

            .slider::-moz-range-thumb
            {
                width: 25px;
                height: 25px;
                border-radius: 50%;
                background: #4CAF50;
                cursor: pointer;
            }
    </style>
   <%-- <script>
        $(document).ready(function () {
            $(".toggle-sidebar").click(function () {
                $("#sidebar").toggleClass("collapsed");
                $("#content").toggleClass("col-md-12 col-md-9");

                return false;
            });
        });
    </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btn-toggle-left').click(function () {
                $(this).find('i').toggleClass('glyphicon glyphicon-arrow-left').toggleClass('glyphicon glyphicon-arrow-right');
            })
        });
        /*-- btn Right direction --*/
        $(document).ready(function () {
            $('#btn-toggle-right').click(function () {
                $(this).find('i').toggleClass('glyphicon glyphicon-arrow-right').toggleClass('glyphicon glyphicon-arrow-left');
            })
        });
    </script>
    <style type="text/css">
        .nav > li > a
        {
            position: relative;
            display: block;
            padding: 5px 5px;
        }
    </style>

    <script type="text/javascript">
        var source, destination;
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        google.maps.event.addDomListener(window, 'load', function () {
            new google.maps.places.SearchBox(document.getElementById('txtSource'));
            new google.maps.places.SearchBox(document.getElementById('txtDestination'));
            directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
        });

        function GetRoute() {
            var UP = new google.maps.LatLng(26.449923, 80.331874);
            var mapOptions = {
                zoom: 7,
                center: UP
            };

            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('dvPanel'));

            //*********DIRECTIONS AND ROUTE**********************//
            source = document.getElementById("txtSource").value;
            destination = document.getElementById("txtDestination").value;
            var Mode = $('input[name=radio]:checked').val();
            var request = {
                origin: source,
                destination: destination,
                travelMode: google.maps.TravelMode[Mode]
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });

            //*********DISTANCE AND DURATION**********************//
            var dvDistance = document.getElementById("dvDistance");
            dvDistance.innerHTML = "";
            var dvPanel = document.getElementById("dvPanel");
            dvPanel.innerHTML = "";
            var service = new google.maps.DistanceMatrixService();
            service.getDistanceMatrix({
                origins: [source],
                destinations: [destination],
                travelMode: google.maps.TravelMode[Mode],
                unitSystem: google.maps.UnitSystem.METRIC,
                avoidHighways: true,
                avoidTolls: true
            }, function (response, status) {
                if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                    var distance = response.rows[0].elements[0].distance.text;
                    var duration = response.rows[0].elements[0].duration.text;
                    var dvDistance = document.getElementById("dvDistance");
                    dvDistance.innerHTML = "";
                    dvDistance.innerHTML += "Distance: " + distance + "<br />";
                    dvDistance.innerHTML += "Duration:" + duration;

                } else {
                    alert("Unable to find the Route.");
                }
            });
        }


    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        
          <div class="row">

                        <div class="col-md-12">
                            <div class="row" runat="server" id="DivMap" style="padding: 5px 5px 5px 5px; border-radius: 4px;">
                             
                                    <div id="map-canvas"></div>
                                
                            </div>
                        </div>
                    </div>
        
        </div>


     <div id="Plotinfo" class="info" title="Plot Information" style="font-size: 12px; display: none;">
      <%--  <div class="infoHead">
           
        </div>--%>
        <div class="infomain">
            <table class=" table table-bordered">
            </table>
        </div>
         <div class="infolower">
            
        </div>
         </div>
      <div id="DIVdiseaseswiseplant1" title="Diseases Wise Plant Availability" style="width: auto; font-size: 12.5px; display: none;">
          </div>
        <div id="DivRoute" title="Find Routes" style="width: 130px; font-size: 11px; display: none; overflow: scroll">
            <table style="height: 50px; overflow: scroll">
                <tr>
                    <td colspan="2">
                        <div id="dvDistance">
                        </div>
                    </td>

                </tr>
                <tr>
                    <td colspan="2">
                        <div id="dvPanel">
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        
    

    <%--For Show Messages--%>
    <div class="modal fade" id="MsgBoxCommon" tabindex="-1" role="dialog" aria-labelledby="purchaseLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header btn-danger">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4><i id="I2" class="glyphicon glyphicon-tasks">&nbsp;</i><span class="modal-title" id="ShowTitleCommon"></span></h4>
                </div>
                <div class="modal-body" id="ShowBodyCommon">
                </div>
                <div class="modal-footer" align="left">
                    <button type="button" id="modalbtnCommon" align="left" class="btn btn-success" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <button type="button" style="display: none" id="btnShowPopupCommon" class="btn btn-lg"
        data-toggle="modal" data-target="#MsgBoxCommon">
        Launch modal
    </button>

    <%--End--%>
</asp:Content>
