var map;
var SerachResult = [];
var start_loc = [

    'Uttar Pradesh',

];
var opt = {
    resizable: false,
    autoOpen: false,
    show: 'blind',
    hide: 'blind',
    width: 400,
    top: 200,
    position: { my: "right center", at: "right center", of: window }
};
var IIE_RECNO = [];
var SECT_LAYER = [];
var PLT_LAYER = [];
var BND_LAYER = [];
var LBL_LAYER = [];
var BRD_LAYER = [];
var RDS_LAYER = [];
var SRV_LAYER = [];
var VEG_LAYER = [];
var WTR_LAYER = [];
var MISC_LAYER = [];
var ELINE_LAYER = [];
var EPOLE_LAYER = [];

var VAIDYA_LAYER = [];

var FTP_LAYER = [];
var BRG_LAYER = [];
var RIVER_LAYER = [];
var RAILWAY_LAYER = [];
var MANHOLE_LAYER = [];
var LAMPPOST_LAYER = [];
var PLOT_NUMBER = [];
var PUBLIC_PURPOSE_LAYER = [];
var COMMON_LAYER = [];
var OTHERS_LAYER = [];
var WATER_HEAD_TANK = [];
var PARKING_LAYER = [];
var NALA_LAYER = [];
var POLICE_STATION_LAYER = [];
var FIRE_STATION_LAYER = [];
var GAS_LAYER = [];
var ENCROACHMENT_LAYER = [];
//Vacant Plots
var VACANTPLOT_LAYER = [];
var ALLOTEDPLOT_LAYER = [];
var UN_ALLOTEDPLOT_LAYER = [];
var UNDERCONSPLOT_LAYER = [];
var INPRODUCTIONPLOT_LAYER = [];
var NOSTATUSPLOT_LAYER = [];
var CLOSEDPLOT_LAYER = [];
var SICKPLOT_LAYER = [];
var NOTAVAILABLESPLOT_LAYER = [];


var VACANT_PLOTS = [];
var ALLOTED_PLOTS = [];
var UN_ALLOTED_PLOTS = [];
var UNDERCONS_PLOTS = [];
var INPRODUCTION_PLOTS = [];
var NOTAVAILABLES_PLOT = [];
var SICK_PLOTS = [];
var CLOSED_PLOTS = [];
var NOSTATUS_PLOTS = [];
var zoomDistrict = [];
var zoomIIE = [];
var ZoomPlot = [];
//Copy of data

var VACANTPLOT_LAYER_COPY = [];
var ALLOTEDPLOT_LAYER_COPY = [];
var UNDERCONSPLOT_LAYER_COPY = [];
var INPRODUCTIONPLOT_LAYER_COPY = [];
var NOSTATUSPLOT_LAYER_COPY = [];
var NOTAVAILABLESPLOT_LAYER_COPY = [];

//
//Type of Plots data

var Industrial_LAYER = [];
var Commercial_LAYER = [];
var Residential_LAYER = [];
var Institutional_Banking_LAYER = [];
var CITY_NAME = [];
var Industrial_PLOTS = [];
var Commercial_PLOTS = [];
var Residential_PLOTS = [];
var Institutional_Banking_PLOTS = [];
// Maker 
var IIE_MARKERS = [];
var CATEGORY_MARKERS = [];
var DISTRICT_MARKER = [];
var PATANJALIKENDRAMARKER = [];
var PATANJALICHIKITSALAYAMARKER = [];
var PATANJALISTOREMARKER = [];
//var VAIDYAMARKER = [];//Vaidya


var AIRPORTMARKER = [];
var RAILWAYMARKER = [];
var BUSSTANDMARKER = [];

function CoordMapType() { }

CoordMapType.prototype.tileSize = new google.maps.Size(256, 256);
CoordMapType.prototype.maxZoom = 25;

CoordMapType.prototype.getTile = function (coord, zoom, ownerDocument) {
    var div = ownerDocument.createElement('div');
    div.style.backgroundColor = '#E5E3DF';
    return div;
};

function initialize() {
    debugger;
    var mapOptions = {
        zoom: 4,
        // disableDefaultUI: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP,//SATELLITE
        scaleControl: false,
        disableDefaultUI: true,
        zoomControl: true,
        rotateControl: true,
        zoomControlOptions: {
            position: google.maps.ControlPosition.LEFT_CENTER
        },

        //styles: [{
        //    'featureType': 'all',
        //    'elementType': 'labels',
        //    'stylers': [{
        //        'visibility': 'on'
        //    }]

        //}],

        fullscreenControl: false,
        center: new google.maps.LatLng(26.2472544, 84.8994982),
        //scaleControlOptions: { position: google.maps.ControlPosition.RIGHT_CENTER }

    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    map.mapTypes.set(google.maps.MapTypeId.SATELLITE);
    //Added by Sachin 08/09/2017
    map.addListener('zoom_changed', function () {
        Zoom_change(map);
    });
    //Loads custom zoom controls
    var zoomDiv = document.createElement('div');
    //var renderZoomControls = new ZoomControl(zoomDiv, this.map);
    zoomDiv.index = 1;
    this.map.controls[google.maps.ControlPosition.LEFT_CENTER].push(zoomDiv);
    //this.map.controls[google.maps.ControlPosition.TOP_RIGHT].push(FullScreenControl(map, 'Full Screen', 'Exit Full Screen'));
    //End of Code 
   // showLegend();
    $('.statsDIv .close').click(function () { $('.statsDIv').hide(); });

    
    //showLegend();
    //setDistrictMarker(map);
    //getcountry();
    //getPlantfamily();
    //getDiseases();
    //getPlantHight();
    //getStateboundary(1);
    //getDistrictBoundary(1);
    //setAirportMarker(map);
    //setRailwayMarker(map);
    //setBusStandMarker(map);
    //setPatanjaliMarker(map);
    //Added by sachin 4 july
    //  getAccordionData(2);
    setMarkers(map);

}

//Route
//
var patanjaliStoreMarker = [

    ['patanjali Store', 96.084056, 27.880761, 9, 15, '../images/CompanyIcon.ico'],

]
var patanjalichikitsalayaMarker = [

    ['patanjali chikitsalaya', 95.312208, 28.055450, 9, 15, '../images/HospitalIcon.ico'],
    ['patanjali chikitsalaya', 93.604641, 27.084747, 9, 15, '../images/HospitalIcon.ico'],
    ['patanjali chikitsalaya', 93.603794, 27.082259, 9, 15, '../images/HospitalIcon.ico'],
    ['patanjali chikitsalaya', 92.7962341, 26.627283, 9, 15, '../images/HospitalIcon.ico'],

]
var assamPatanjaliMarker = [
// ['patanjali chikitsalaya, C K Das Road, Near Ban Theatre, Mahabhairab, Tezpur, Assam 784001', 92.7962341, 26.627283, 9, 15, '../images/HospitalIcon.ico'],

]
var patanjalikendraMarker = [

    ['patanjali ayurved kendra', 93.629973, 27.100550, 9, 14, '../images/AshramIcon.ico'],
]

//var VaidyaMarker = [

//    ['vaidya', 93.629773, 27.100550, 9, 14, '../images/PanditMarker.png'],
//]

var AirportMarker = [

    ['TAWANG', 91.871287, 27.592465, 9, 14, '../images/planes.png'],
    ['Ziro', 93.804910, 27.586676, 9, 14, '../images/planes.png'],
    ['Daporijo', 94.222990, 27.991213, 9, 14, '../images/planes.png'],
    ['Gensi', 94.641071, 27.846908, 9, 14, '../images/planes.png'],
    ['Along', 94.810916, 28.175641, 9, 14, '../images/planes.png'],
     ['Pasighat', 95.333517, 28.071939, 9, 14, '../images/planes.png'],
      ['Lohit', 96.130483, 27.933514, 9, 14, '../images/planes.png'],
]

var Avoidance_area = [
   ['River', 93.0473399, 27.0020533, 15, 'POLYGON ((93.0374837 26.9985917 ,93.0372906 26.99928 ,93.0372477 27.0001403 ,93.0370975 27.0005227 ,93.0374622 27.0011154 ,93.0375481 27.0015551 ,93.0379987 27.0023199 ,93.0387712 27.0027596 ,93.0396938 27.002817 ,93.0406809 27.0028361 ,93.0413461 27.0028552 ,93.0422044 27.0028552 ,93.0435348 27.0025493 ,93.0443716 27.0022816 ,93.0451012 27.0020522 ,93.0456805 27.0025111 ,93.046217 27.0025684 ,93.0471611 27.0024346 ,93.0477834 27.0020522 ,93.0485344 27.0021669 ,93.0496287 27.0022816 ,93.050487 27.0022052 ,93.051281 27.0021096 ,93.0525899 27.0021096 ,93.053534 27.0021287 ,93.0539846 27.002186 ,93.0547142 27.0022052 ,93.0554008 27.002186 ,93.0558729 27.0018801 ,93.0564737 27.0016125 ,93.057096 27.001211 ,93.0579758 27.0011154 ,93.0587697 27.0010772 ,93.0593491 27.0006948 ,93.0596709 27.0005418 ,93.0604005 27.0001786 ,93.0608726 26.9996432 ,93.0616879 26.9993373 ,93.0625892 26.9988402 ,93.0628896 26.9984387 ,93.0633616 26.9985535 ,93.0636835 26.9989932 ,93.06422 26.9992035 ,93.0647564 26.9993182 ,93.0648637 26.9988785 ,93.0649066 26.9983814 ,93.0651855 26.9981711 ,93.065958 26.9980755 ,93.0664945 26.997846 ,93.0670309 26.9975401 ,93.0675888 26.9973298 ,93.0676532 26.9969666 ,93.0674815 26.9965842 ,93.0672026 26.9962018 ,93.0670953 26.9958959 ,93.0659366 26.9963165 ,93.0655503 26.9963739 ,93.065207 26.9961827 ,93.0651212 26.995915 ,93.065207 26.9955517 ,93.0653358 26.9939456 ,93.064971 26.9937162 ,93.0651426 26.9932764 ,93.0649495 26.993047 ,93.0645847 26.9936206 ,93.0645847 26.994156 ,93.0647993 26.9946531 ,93.0650568 26.9949972 ,93.0648851 26.9954179 ,93.064692 26.9958003 ,93.0648851 26.9961827 ,93.0650139 26.9965077 ,93.0645418 26.996871 ,93.0638123 26.9970813 ,93.0632329 26.9972725 ,93.062911 26.9976357 ,93.0624604 26.9977887 ,93.0621386 26.9976357 ,93.0617738 26.9980564 ,93.061173 26.9984196 ,93.0605721 26.9986299 ,93.0602932 26.9982667 ,93.0601645 26.9979416 ,93.0603147 26.9974254 ,93.0600572 26.9976931 ,93.0599713 26.997999 ,93.0600572 26.9983431 ,93.0599928 26.9985726 ,93.0597568 26.9987255 ,93.0594349 26.999108 ,93.0587482 26.9994329 ,93.0579328 26.9996815 ,93.0576754 27.0000639 ,93.0572677 27.0002551 ,93.056109 27.0007904 ,93.0558729 27.0008287 ,93.0553794 27.0009816 ,93.0548859 27.0010389 ,93.0543709 27.0006757 ,93.0535126 27.0005418 ,93.0526972 27.0004462 ,93.052032 27.0003506 ,93.0514097 27.0003506 ,93.050766 27.0002933 ,93.0502939 27.0001022 ,93.0495858 27.0000447 ,93.0489635 26.9999874 ,93.0483413 27.0000256 ,93.0477619 26.9999874 ,93.0471611 27.0001021 ,93.0468607 27.0000256 ,93.0464315 27.0002168 ,93.0458951 27.0005036 ,93.0452085 27.0005992 ,93.0447149 27.0005992 ,93.0440712 27.0007904 ,93.0432987 27.0008669 ,93.042537 27.0009051 ,93.0422688 27.000886 ,93.0427193 27.0006853 ,93.0428695 27.0006184 ,93.0428052 27.0001786 ,93.042376 27.0004654 ,93.0420971 27.0005992 ,93.041904 27.0009242 ,93.0413461 27.0011345 ,93.0409384 27.0013066 ,93.0404449 27.0012492 ,93.0399299 27.0008286 ,93.0391145 27.0006374 ,93.0386853 27.000561 ,93.0384064 27.0002359 ,93.038342 26.99993 ,93.0381489 26.9995668 ,93.0379987 26.9992417 ,93.0378699 26.9988785 ,93.0377197 26.9986873 ,93.0374837 26.9985917))'],
   ['Population', 93.0473, 27.000, 15, 'POLYGON ((93.0385458 26.9987829 ,93.0387068 26.9990314 ,93.0387282 26.9992417 ,93.0389964 26.9995954 ,93.0389857 26.9998249 ,93.0391681 26.9999778 ,93.0393827 27.0001786 ,93.0396724 27.0002933 ,93.0398655 27.0004367 ,93.0402303 27.0006565 ,93.0405629 27.0007521 ,93.0409491 27.0008286 ,93.0412495 27.0008573 ,93.0415606 27.0007999 ,93.0418718 27.0007139 ,93.0420649 27.0004462 ,93.0424619 27.0000447 ,93.0427194 26.999691 ,93.0428803 26.9995954 ,93.0429983 26.9998535 ,93.0429661 27.0001594 ,93.0428588 27.0004845 ,93.0430734 27.0005896 ,93.0433202 27.0004175 ,93.0434489 27.0000352 ,93.0435133 26.9999205 ,93.0436098 26.9996719 ,93.0435777 26.9995094 ,93.0433738 26.9994234 ,93.0431378 26.9993086 ,93.043009 26.9992226 ,93.0429232 26.9990888 ,93.0428803 26.9987829 ,93.0428481 26.9985821 ,93.042773 26.9984101 ,93.0426335 26.9981615 ,93.0426013 26.9979607 ,93.0425906 26.9977504 ,93.0427086 26.9974445 ,93.0427837 26.9971673 ,93.0427945 26.9969474 ,93.042773 26.9966511 ,93.0427301 26.9963452 ,93.042494 26.9960584 ,93.0424619 26.9957907 ,93.0425477 26.9956664 ,93.0428266 26.9952075 ,93.0433845 26.9947869 ,93.0438352 26.9943854 ,93.0439854 26.9941368 ,93.0441356 26.9938118 ,93.0440283 26.9936397 ,93.0435991 26.9935823 ,93.0432558 26.9938883 ,93.0429768 26.9942707 ,93.0422687 26.9950737 ,93.0419254 26.9955326 ,93.0419683 26.9960106 ,93.0415821 26.9967562 ,93.0412817 26.9971195 ,93.0410457 26.9975019 ,93.0405521 26.9977696 ,93.0398869 26.9980563 ,93.0393934 26.9982475 ,93.0390072 26.9984961 ,93.0386853 26.9986108 ,93.0385458 26.9987829))'],
   ['Darlong Population', 93.222, 27.00, 13, 'POLYGON ((92.9839897 26.9336634 ,92.984848 26.933893 ,92.9857492 26.9342756 ,92.9863071 26.9346199 ,92.986865 26.934926 ,92.98738 26.935079 ,92.9879808 26.9354999 ,92.9887962 26.9362268 ,92.9893541 26.937145 ,92.9901695 26.9375276 ,92.9911995 26.9377189 ,92.9917574 26.9382546 ,92.992959 26.9394023 ,92.9936886 26.9402823 ,92.9945469 26.9409326 ,92.994976 26.9417743 ,92.996006 26.9436872 ,92.9962635 26.9446436 ,92.9969501 26.9455235 ,92.9976797 26.9459826 ,92.9982376 26.9464417 ,92.9989672 26.9466712 ,93.0001259 26.9466329 ,93.0006194 26.9464512 ,93.0001259 26.9459826 ,93.0003619 26.9456478 ,93.0000508 26.9453418 ,92.9997665 26.9447488 ,92.999686 26.9440745 ,92.9990101 26.9437494 ,92.9983878 26.9427403 ,92.998302 26.9421425 ,92.997964 26.9416022 ,92.9975027 26.940837 ,92.9971647 26.9406648 ,92.9969072 26.9404162 ,92.9966068 26.9397849 ,92.9970467 26.9393354 ,92.997036 26.9387997 ,92.9970038 26.9383119 ,92.9966068 26.9377285 ,92.996124 26.9371833 ,92.9952765 26.9362651 ,92.9947186 26.9352321 ,92.9938173 26.9343521 ,92.9933453 26.9335486 ,92.9924011 26.9332043 ,92.9911566 26.933013 ,92.9903841 26.9325539 ,92.9892683 26.931406 ,92.9884529 26.9306408 ,92.9879808 26.9301434 ,92.98738 26.9298373 ,92.9862213 26.9302964 ,92.9852772 26.9308704 ,92.9847622 26.9315591 ,92.9839897 26.9323243 ,92.9833889 26.9329747 ,92.983346 26.9334338 ,92.9839897 26.9336634 ))']
]


var BusStand = [
    ['APS Bus Stand ', 95.720798, 27.157896, 9, 14, '../images/bus.png'],
    ['A.P.S.T.C Bus Stand ', 95.198948, 27.006279, 9, 14, '../images/bus.png'],
]
var RailwayMaeker = [

   // ['Aalo ', 92.215483, 26.733643, 9, 14, '../images/Train.png'],

]

var Categorydata = {

    "Accomodation & Food Services":
    {
        "IIE": [

          ['TRANSGANGA', 80.36494, 26.52393, 15, 28],
          ['UNNAO2', 80.52594, 26.56496, 15, 26],

        ]


    }
}
var Marker = [
              ['ADVANIA GRANT', 80.610444, 27.599357, 15, 80, 78, 'NOPDF'],
              ['AGROPARKPHASE1', 81.03048, 27.01343, 15, 54, 26, 'NOPDF'],
              ['AGROPARKPHASE2', 81.03698, 27.01625, 15, 56, 26, 'NOPDF'],
              ['AMETHI', 81.73129, 26.24485, 15, 42, 80, 'NOPDF'],
              ['AMOUSI', 80.86765, 26.77063, 15, 51, 58, 'NOPDF'],
              ['ATTARA', 80.589519, 25.281079, 15, 61, 25, 'NOPDF'],
              ['BANTHAR', 80.46167, 26.48626, 15, 26, 81, 'NOPDF'],

]
//District Marker
//var DistrictMarker = [


//['Tinsukia', 95.370946, 27.534735, 9, 14, '../images/Blue.jpg'],
//['Sivasagar', 94.629369, 27.012312, 9, 15, '../images/Blue.jpg'],
//['Lakhimpur', 94.107518, 27.256740, 9, 16, '../images/Blue.jpg'],
//['Jorhat', 94.206395, 26.791871, 9, 17, '../images/Blue.jpg'],
//['Golaghat', 93.893285, 26.305393, 9, 18, '../images/Blue.jpg'],
//['Karbi Anglong', 92.931981, 26.241359, 9, 19, '../images/Blue.jpg'],
//['Tezpur', 92.772679, 26.683943, 9, 20, '../images/Blue.jpg'],
//['Darrang', 92.020116, 26.482533, 9, 21, '../images/Blue.jpg'],
//['Kharghuli No.2', 91.840730, 26.186533, 9, 22, '../images/Blue.jpg'],
//['Bormotoria', 91.806054, 26.141236, 9, 23, '../images/Blue.jpg'],
//['Beltola', 91.798329, 26.125208, 9, 24, '../images/Blue.jpg'],
//['Sree Nagar', 91.779103, 26.159418, 9, 25, '../images/Blue.jpg'],
//['Lachit Nagar', 91.769490, 26.172360, 9, 26, '../images/Blue.jpg'],
//['Chilarai Nagar', 91.764855, 26.165427, 9, 27, '../images/Blue.jpg'],
//['Banik Para', 91.741509, 26.142314, 9, 28, '../images/Blue.jpg'],
//['Lachit Nagar', 91.769318, 26.172052, 9, 29, '../images/Blue.jpg'],
//['South Sarania', 91.760735, 26.173747, 9, 30, '../images/Blue.jpg'],
//['Barsapara', 91.741338, 26.142931, 9, 31, '../images/Blue.jpg'],
//['Rehabar', 91.749577, 26.176828, 9, 32, '../images/Blue.jpg'],
//['Dighalipukhuri', 91.754384, 26.188073, 9, 33, '../images/Blue.jpg'],
//['Patanjali Centre New Patanjali Centre, Bharalumukh, Guwahati, Assam 781009', 91.732972, 26.171089, 9, 34, '../images/Blue.jpg'],

//]

var PDFMarker = [
//['BADHANPUR (KANNAUJ)', 80.283495, 26.463333, 15, 181, 52, 'VacantPlot/SurajpursiteC.PDF'],
//['Bagpath', 77.21170827, 28.9801394, 15, 157, 21, 'VacantPlot/SurajpursiteC.PDF'],
//['Baheri', 79.495697, 28.77804, 15, 182, 27, 'VacantPlot/SurajpursiteC.PDF'],



]
var TextileMarkers = [


]
var ReservedMarker = [
]


//Added by sachin 08/09/2017
function Zoom_change(map) {
    var mapzoom = map.getZoom();
    if (mapzoom <= 8) {
        for (var pp = 0; pp < IIE_MARKERS.length; pp++) {
            IIE_MARKERS[pp].setMap(null);
        }
    }
}
//
function setMarkers(map) {
    debugger;
    
    ajaxReq('Handler.ashx', 'AllAdvertiserMarker', {}, function (resp) { BindAllAdvertiserMarker(resp) }, true);

}

function BindAllAdvertiserMarker(resp) {

    if (resp.status === true) {

        var DistrictMarker = $.map(resp.data, function (el) { return el; })

        var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
        var marker, i;
       
        for (i = 0; i < DistrictMarker.length; i++) {
            var beach = DistrictMarker[i];
            var div = document.createElement('DIV');
            div.innerHTML = '<div id="Marker"><center><div class="MarkerCss">' + beach[0] + '</div><div class="arrow_box"></div></center></div>';

            marker = new RichMarker({
                map: map,
                position: new google.maps.LatLng(beach[3], beach[2]),
                draggable: false,
                flat: false,
                anchor: RichMarkerPosition.MIDDLE,
                content: div
            });
                    //var marker = new google.maps.Marker({
                    //    position: new google.maps.LatLng(beach[3], beach[2]),
                    //    icon: mm,
                    //    map: map,
                    //    title: beach[0]
                    //});

                    marker.x = beach[2],
                    marker.y = beach[3],
                    marker.IIEName = beach[0],
                    marker.AdvertiserID = beach[1],
                    google.maps.event.addListener(marker, 'click', function () {
                       
                        getAdvertiserinfo(this.AdvertiserID);
                        map.setZoom(4);                                        
                    });
                    DISTRICT_MARKER.push(marker);
            
        }   
    }
}
function setPatanjaliMarker(map) {
    //debugger;
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
    var marker, i;
    for (i = 0; i < assamPatanjaliMarker.length; i++) {
        var beach = assamPatanjaliMarker[i];

        //var div = document.createElement('DIV');
        //div.innerHTML = '<div id="Marker"><center><div class="MarkerCss">' + beach[0] + '</div><div class="arrow_box"></div></center></div>';

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(beach[2], beach[1]),
            //icon: beach[5],
            map: map,
            title: beach[0]
        });
        //marker = new RichMarker({
        //    map: map,
        //    position: new google.maps.LatLng(beach[2], beach[1]),
        //    draggable: false,
        //    flat: false,
        //    anchor: RichMarkerPosition.MIDDLE,
        //    content: div
        //});

        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[4],
        google.maps.event.addListener(marker, 'click', function () {
            for (var pp = 0; pp < IIE_MARKERS.length; pp++) {
                IIE_MARKERS[pp].setMap(null);
            }
            map.setZoom(this.zaixs);
            //setPDFMarkers(this.IIEName);
            //setMarkers(this.IIEName);
            //GOVTMarker(this.IIEName);
            map.panTo(new google.maps.LatLng(this.y, this.x));
            zoomTo(this.zaixs); btnClear
        });
        AIRPORTMARKER.push(marker);
    }
    function zoomTo(zoomFluid) {

        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}


function setAirportMarker(map) {
    //debugger;
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
    var marker, i;
    for (i = 0; i < AirportMarker.length; i++) {
        var beach = AirportMarker[i];

        //var div = document.createElement('DIV');
        //div.innerHTML = '<div id="Marker"><center><div class="MarkerCss">' + beach[0] + '</div><div class="arrow_box"></div></center></div>';

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(beach[2], beach[1]),
            icon: beach[5],
            map: map
        });
        //marker = new RichMarker({
        //    map: map,
        //    position: new google.maps.LatLng(beach[2], beach[1]),
        //    draggable: false,
        //    flat: false,
        //    anchor: RichMarkerPosition.MIDDLE,
        //    content: div
        //});

        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[4],
        google.maps.event.addListener(marker, 'click', function () {
            for (var pp = 0; pp < IIE_MARKERS.length; pp++) {
                IIE_MARKERS[pp].setMap(null);
            }
            map.setZoom(this.zaixs);
            //setPDFMarkers(this.IIEName);
            //setMarkers(this.IIEName);
            //GOVTMarker(this.IIEName);
            map.panTo(new google.maps.LatLng(this.y, this.x));
            zoomTo(this.zaixs); btnClear
        });
        AIRPORTMARKER.push(marker);
    }
    function zoomTo(zoomFluid) {

        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}

function setRailwayMarker(map) {
    //debugger;
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
    var marker, i;
    for (i = 0; i < RailwayMaeker.length; i++) {
        var beach = RailwayMaeker[i];

        //var div = document.createElement('DIV');
        //div.innerHTML = '<div id="Marker"><center><div class="MarkerCss">' + beach[0] + '</div><div class="arrow_box"></div></center></div>';

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(beach[2], beach[1]),
            icon: beach[5],
            map: map
        });
        //marker = new RichMarker({
        //    map: map,
        //    position: new google.maps.LatLng(beach[2], beach[1]),
        //    draggable: false,
        //    flat: false,
        //    anchor: RichMarkerPosition.MIDDLE,
        //    content: div
        //});

        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[4],
        google.maps.event.addListener(marker, 'click', function () {
            for (var pp = 0; pp < IIE_MARKERS.length; pp++) {
                IIE_MARKERS[pp].setMap(null);
            }
            map.setZoom(this.zaixs);
            //setPDFMarkers(this.IIEName);
            //setMarkers(this.IIEName);
            //GOVTMarker(this.IIEName);
            map.panTo(new google.maps.LatLng(this.y, this.x));
            zoomTo(this.zaixs);
        });
        RAILWAYMARKER.push(marker);
    }
    function zoomTo(zoomFluid) {

        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}
function setBusStandMarker(map) {
    //debugger;
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
    var marker, i;
    for (i = 0; i < BusStand.length; i++) {
        var beach = BusStand[i];

        //var div = document.createElement('DIV');
        //div.innerHTML = '<div id="Marker"><center><div class="MarkerCss">' + beach[0] + '</div><div class="arrow_box"></div></center></div>';

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(beach[2], beach[1]),
            icon: beach[5],
            map: map
        });
        //marker = new RichMarker({
        //    map: map,
        //    position: new google.maps.LatLng(beach[2], beach[1]),
        //    draggable: false,
        //    flat: false,
        //    anchor: RichMarkerPosition.MIDDLE,
        //    content: div
        //});

        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[4],
        google.maps.event.addListener(marker, 'click', function () {
            for (var pp = 0; pp < IIE_MARKERS.length; pp++) {
                IIE_MARKERS[pp].setMap(null);
            }
            map.setZoom(this.zaixs);
            //setPDFMarkers(this.IIEName);
            //setMarkers(this.IIEName);
            //GOVTMarker(this.IIEName);
            map.panTo(new google.maps.LatLng(this.y, this.x));
            zoomTo(this.zaixs);
        });
        BUSSTANDMARKER.push(marker);
    }
    function zoomTo(zoomFluid) {

        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}

//#region Avoidance Area Added by SACHIN 3/DEC/2017
var AvoidaceLayer = [];
$(document).on('change', '#chkAvoid', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < Avoidance_area.length; i++) {
            var area = Avoidance_area[i];
            var lineSymbol = {
                path: 'M 0,-1 0,1',
                strokeOpacity: 1,
                scale: 4
            };
            var overlays = new BW.PolyLineFill(getLatLongArr(area[4]), map, "red", "#000");


            //var a_area = createPolygon(getLatLongArr(area[4]));
            AvoidaceLayer.push(overlays);
        }
    }
    else {
        for (i = 0; i < AvoidaceLayer.length; i++) {
            AvoidaceLayer[i].setMap(null);
        }

    }
});


PolyLineFill.prototype = new google.maps.OverlayView();
function PolyLineFill(poly, map, fill, stroke) {
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0; i < poly.length; i++) {
        bounds.extend(poly[i]);
    }

    //initialize all properties.
    this.bounds_ = bounds;
    this.map_ = map;
    this.div_ = null;
    this.poly_ = poly;
    this.polysvg_ = null;
    this.fill_ = fill;
    this.stroke_ = stroke;

    // Explicitly call setMap on this overlay
    this.setMap(map);
}

PolyLineFill.prototype.onAdd = function () {
    // Create the DIV and set some basic attributes.
    var div = document.createElement('div');
    div.style.borderStyle = 'none';
    div.style.borderWidth = '0px';
    div.style.position = 'fixed';

    //createthe svg element
    var svgns = "http://www.w3.org/2000/svg";
    var svg = document.createElementNS(svgns, "svg");
    svg.setAttributeNS(null, "preserveAspectRatio", "xMidYMid meet");

    var def = document.createElementNS(svgns, "defs");

    //create the pattern fill 
    var pattern = document.createElementNS(svgns, "pattern");
    pattern.setAttributeNS(null, "id", "lineFill");
    pattern.setAttributeNS(null, "patternUnits", "userSpaceOnUse");
    pattern.setAttributeNS(null, "patternTransform", "rotate(-45)");
    pattern.setAttributeNS(null, "height", "7");
    pattern.setAttributeNS(null, "width", "7");
    def.appendChild(pattern);

    var rect = document.createElementNS(svgns, "rect");
    rect.setAttributeNS(null, "id", "rectFill");
    rect.setAttributeNS(null, "fill", this.fill_ || "red");
    rect.setAttributeNS(null, "fill-opacity", "1");
    rect.setAttributeNS(null, "stroke", this.stroke_ || "#000");
    rect.setAttributeNS(null, "stroke-dasharray", "7,7");
    rect.setAttributeNS(null, "height", "7");
    rect.setAttributeNS(null, "width", "50");
    pattern.appendChild(rect);

    svg.appendChild(def);

    //add polygon to the div
    var p = document.createElementNS(svgns, "polygon");
    p.setAttributeNS(null, "fill", "url(#lineFill)");
    p.setAttributeNS(null, "stroke", "#000");
    p.setAttributeNS(null, "stroke-width", "1");
    //set a reference to this element;
    this.polysvg_ = p;
    svg.appendChild(p);

    div.appendChild(svg);

    // Set the overlay's div_ property to this DIV
    this.div_ = div;

    // We add an overlay to a map via one of the map's panes.
    // We'll add this overlay to the overlayLayer pane.
    var panes = this.getPanes();
    panes.overlayLayer.appendChild(div);
}

PolyLineFill.prototype.AdjustPoints = function () {
    //adjust the polygon points based on the projection.
    var proj = this.getProjection();
    var sw = proj.fromLatLngToDivPixel(this.bounds_.getSouthWest());
    var ne = proj.fromLatLngToDivPixel(this.bounds_.getNorthEast());

    var points = "";
    for (var i = 0; i < this.poly_.length; i++) {
        var point = proj.fromLatLngToDivPixel(this.poly_[i]);
        if (i == 0) {
            points += (point.x - sw.x) + ", " + (point.y - ne.y);
        } else {
            points += " " + (point.x - sw.x) + ", " + (point.y - ne.y);
        }
    }
    return points;
}

PolyLineFill.prototype.draw = function () {
    // Size and position the overlay. We use a southwest and northeast
    // position of the overlay to peg it to the correct position and size.
    // We need to retrieve the projection from this overlay to do this.
    var overlayProjection = this.getProjection();

    // Retrieve the southwest and northeast coordinates of this overlay
    // in latlngs and convert them to pixels coordinates.
    // We'll use these coordinates to resize the DIV.
    var sw = overlayProjection.fromLatLngToDivPixel(this.bounds_.getSouthWest());
    var ne = overlayProjection.fromLatLngToDivPixel(this.bounds_.getNorthEast());

    // Resize the image's DIV to fit the indicated dimensions.
    var div = this.div_;
    div.style.left = sw.x + 'px';
    div.style.top = ne.y + 'px';
    div.style.width = (ne.x - sw.x) + 'px';
    div.style.height = (sw.y - ne.y) + 'px';


    this.polysvg_.setAttributeNS(null, "points", this.AdjustPoints());
}

PolyLineFill.prototype.onRemove = function () {
    this.div_.parentNode.removeChild(this.div_);
    this.div_ = null;
}
window.BW = {};
window.BW.PolyLineFill = PolyLineFill
//#endregion Avoidance Area Added by SACHIN 3/DEC/2017



//added by sachin 4 july
function getAccordionData(estate_recno) {

    ajaxReq('do_it.ashx', 'DistrictName', { "location": estate_recno }, function (resp) { BindDistrictName(resp) }, true);
}

function BindDistrictName(resp) {

    $("#accordion").empty();
    if (resp.status === true) {
        var DISTRICT = $.map(resp.data, function (el) { return el; })
        for (i = 0; i < DISTRICT.length; i++) {
            $("#accordion").append('<h3 title="Click Here to View the Industrial List!" style="font-size:12px; font-weight: 700;" id="d' + DISTRICT[i].District_Recno + '" onclick="showDistrict(this.id)">' + DISTRICT[i].District_Name + '</h3><div style="margin-left: 16px;"></div>');
            id_accord = 'd' + DISTRICT[i].District_Recno;
        }
    }
    else {
        alert('Dear User //n Something went wrong unable to get list of districts.please try again or contact to system administrator.')
    }
}

function showDistrict(maxima) {
    var newdis_id = maxima.replace('d', '');
    GetCurrentDetails("District", newdis_id);
    ajaxReq('do_it.ashx', 'IndustrialAreaName', { "DistrictRecno": newdis_id, "oldid": maxima }, function (resps) { BindIndustrialArea(resps, maxima) }, true);
}

function BindIndustrialArea(resps, maxima) {


    if (resps.status === true) {
        var indus = $.map(resps.data, function (el) { return el; })
        $("#" + maxima).next().empty();
        var data = '';
        if (parseInt(indus[0].Ind_area_recno) != 0) {
            data = '<div> <div class="list-type5"><ul>';

            for (i = 0; i < indus.length; i++) {
                if (parseInt(indus[i].iie_check) != 0) {
                    data += '<li id="i' + indus[i].Ind_area_recno + '" onclick="showIndustrial(this.id)" title="Click Here to View the Map!""><a href="#"  id="i' + indus[i].Ind_area_recno + '" onclick="showIndustrial(this.id)">' + indus[i].Ind_area_name + '</a> <span class="glyphicon glyphicon-eye-open pull-right"></span></li>';
                }
                else {
                    //disable non map IIE location  add by sachin 14/09/2017
                    data += '<li id="i' + indus[i].Ind_area_recno + '" class="disabled" style="color:gray;cursor: not-allowed;" title="No Map Found""><a style="color:gray;cursor: not-allowed;"  id="i' + indus[i].Ind_area_recno + '">' + indus[i].Ind_area_name + '</a> <span class="glyphicon glyphicon-eye-open pull-right"></span></li>';
                }
            }

            data += '</ul><div></div>';
        }
        else {
            data = '<div> <center><b><u>Industrial Estate Name</u></b></center><br/> No Data Found For this District!!';
        }
        $("#" + maxima).next().append(data);

        showDisBoundaries(indus[0].Polygon, indus[0].X, indus[0].Y);

    }
    else {
        $("#" + maxima).next().empty();
        $("#" + maxima).next().append('No Data Found For this District!!');
    }
}

function showIndustrial(ind_id) {
    var newind_id = ind_id.replace('i', '');
    GetCurrentDetails("IE", newind_id);
    ajaxReq('do_it.ashx', 'IndBoundary', { "Ind_Recno": newind_id }, function (resps) { BindIndBoundary(resps, newind_id) }, true);
}

function BindIndBoundary(resps, ind_id) {
    if (resps.status === true) {
        var indusb = $.map(resps.data, function (el) { return el; })
        var str = ind_id;
        if (indusb[0].Polygon !== null) {
            showIndBoundaries(indusb[0].Polygon, indusb[0].X, indusb[0].Y);
            ShowInddetailsfromList(ind_id, indusb[0].X, indusb[0].Y);
        } else {
            setaccordionMarkers(str);
        }
    }

}
function ShowInddetailsfromList(ind_id, xaixis, yaixis) {
    IIE_RECNO.push(ind_id);
    getPlotcreate(ind_id);
    getroadcreate(ind_id);
    getutilitycreate(ind_id);
    getPublicPurposecreate(ind_id);
    getCommanareacreate(ind_id);
    getOthercreate(ind_id);
    getWaterheadtankcreate(ind_id);
    getparkingcreate(ind_id);
    getNalacreate(ind_id);
    getPoloicestationcreate(ind_id);
    getfirestationcreate(ind_id);
    getlabelcreate(ind_id);
    getvegcreate(ind_id);
    getbndcreate(ind_id);
    getsectorcreate(ind_id);
    getElinecreate(ind_id);
    getEPolecreate(ind_id);
    getWatercreate(ind_id);
    getRivercreate(ind_id);
    getlamppostcreate(ind_id);
    getRailwaycreate(ind_id);
    getmanholecreate(ind_id);
    getgascreate(ind_id);
    getfootpathcreate(ind_id);
    getBridgecreate(ind_id);
    getencroachmentcreate(ind_id);
    //getestateinformation(ind_id);
    getestateinformation_forlist(ind_id);
    CITY_NAME.push(ind_id);
}

function showIndBoundaries(ploygn, xaixis, yaixis) {

    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(ploygn));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#F57002', fillOpacity: 0, clickable: !1 });
    zoomDistrict.push(sl);
    map.setZoom(15);
    map.panTo(new google.maps.LatLng(yaixis, xaixis));

}

function showDisBoundaries(ploygn, xaixis, yaixis) {

    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(ploygn));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#0242BD', fillOpacity: 0, clickable: !1 });
    zoomDistrict.push(sl);
    map.setZoom(9);
    map.panTo(new google.maps.LatLng(yaixis, xaixis));

}
//
$(document).on('click', '#PatanjaliStores', function (e) {


    setpatanjaliStoreMarker(map);

});
$(document).on('click', '#patanjaliKendras', function (e) {


    setpatanjalikendraMarker(map);

});

//$(document).on('click', '#chkVaidya', function (e) {


//    setVaidyaMarker(map);

//});

$(document).on('click', '#patanjaliChikitsalaya', function (e) {


    setpatanjalichikitsalayaMarker(map);

});
$(document).on('click', '#mapsatellite', function (e) {

    map.setOptions({
        styles: [{
            'featureType': 'all',
            'elementType': 'labels',
            'stylers': [{
                'visibility': 'off'
            }]
        }]
    });


    map.setMapTypeId(google.maps.MapTypeId.SATELLITE);
});

$(document).on('click', '#maproad', function (e) {

    map.setOptions({
        styles: [{
            'featureType': 'all',
            'elementType': 'labels',
            'stylers': [{
                'visibility': 'on'
            }]
        }]
    });

    map.setMapTypeId(google.maps.MapTypeId.ROADMAP);
});
$(document).on('click', '#maphybrid', function (e) {

    map.setOptions({
        styles: [{
            'featureType': 'all',
            'elementType': 'labels',
            'stylers': [{
                'visibility': 'on'
            }]
        }]
    });
    map.setMapTypeId(google.maps.MapTypeId.TERRAIN);
});

function setFullMap(map) {
    for (i = 0; i < start_loc.length; i++) {

        // showPlots(start_loc[i][0]);
    }
}

function setpatanjaliStoreMarker(map) {
    debugger;
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
    var marker, i;
    for (i = 0; i < patanjaliStoreMarker.length; i++) {
        var beach = patanjaliStoreMarker[i];

        //var div = document.createElement('DIV');
        //div.innerHTML = '<div id="Marker"><center><div class="MarkerCss">' + beach[0] + '</div><div class="arrow_box"></div></center></div>';

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(beach[2], beach[1]),
            icon: beach[5],
            map: map
        });
        //marker = new RichMarker({
        //    map: map,
        //    position: new google.maps.LatLng(beach[2], beach[1]),
        //    draggable: false,
        //    flat: false,
        //    anchor: RichMarkerPosition.MIDDLE,
        //    content: div
        //});

        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[4],
        google.maps.event.addListener(marker, 'click', function () {
            for (var pp = 0; pp < IIE_MARKERS.length; pp++) {
                IIE_MARKERS[pp].setMap(null);
            }
            map.setZoom(this.zaixs);
            //setPDFMarkers(this.IIEName);
            //setMarkers(this.IIEName);
            //GOVTMarker(this.IIEName);
            map.panTo(new google.maps.LatLng(this.y, this.x));
            zoomTo(this.zaixs);
        });
        PATANJALISTOREMARKER.push(marker);
    }
    function zoomTo(zoomFluid) {

        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}
function setpatanjalichikitsalayaMarker(map) {
    //debugger;
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
    var marker, i;
    for (i = 0; i < patanjalichikitsalayaMarker.length; i++) {
        var beach = patanjalichikitsalayaMarker[i];

        //var div = document.createElement('DIV');
        //div.innerHTML = '<div id="Marker"><center><div class="MarkerCss">' + beach[0] + '</div><div class="arrow_box"></div></center></div>';

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(beach[2], beach[1]),
            icon: beach[5],
            map: map
        });
        //marker = new RichMarker({
        //    map: map,
        //    position: new google.maps.LatLng(beach[2], beach[1]),
        //    draggable: false,
        //    flat: false,
        //    anchor: RichMarkerPosition.MIDDLE,
        //    content: div
        //});

        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[4],
        google.maps.event.addListener(marker, 'click', function () {
            for (var pp = 0; pp < IIE_MARKERS.length; pp++) {
                IIE_MARKERS[pp].setMap(null);
            }
            map.setZoom(this.zaixs);
            //setPDFMarkers(this.IIEName);
            //setMarkers(this.IIEName);
            //GOVTMarker(this.IIEName);
            map.panTo(new google.maps.LatLng(this.y, this.x));
            zoomTo(this.zaixs);
        });
        PATANJALICHIKITSALAYAMARKER.push(marker);
    }
    function zoomTo(zoomFluid) {

        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}
function setpatanjalikendraMarker(map) {
    //debugger;
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
    var marker, i;
    for (i = 0; i < patanjalikendraMarker.length; i++) {
        var beach = patanjalikendraMarker[i];

        //var div = document.createElement('DIV');
        //div.innerHTML = '<div id="Marker"><center><div class="MarkerCss">' + beach[0] + '</div><div class="arrow_box"></div></center></div>';

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(beach[2], beach[1]),
            icon: beach[5],
            map: map
        });
        //marker = new RichMarker({
        //    map: map,
        //    position: new google.maps.LatLng(beach[2], beach[1]),
        //    draggable: false,
        //    flat: false,
        //    anchor: RichMarkerPosition.MIDDLE,
        //    content: div
        //});

        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[4],
        google.maps.event.addListener(marker, 'click', function () {
            for (var pp = 0; pp < IIE_MARKERS.length; pp++) {
                IIE_MARKERS[pp].setMap(null);
            }
            map.setZoom(this.zaixs);
            //setPDFMarkers(this.IIEName);
            //setMarkers(this.IIEName);
            //GOVTMarker(this.IIEName);
            map.panTo(new google.maps.LatLng(this.y, this.x));
            zoomTo(this.zaixs);
        });
        PATANJALIKENDRAMARKER.push(marker);
    }
    function zoomTo(zoomFluid) {

        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}



function setPDFMarkers(STATE) {


    var infowindow = new google.maps.InfoWindow();
    //var mm = "https://maps.google.com/mapfiles/ms/icons/Yellow-dot.png";
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/yellow-dot.png";
    var marker, i;
    var CITY;
    for (i = 0; i < PDFMarker.length; i++) {
        var beach = PDFMarker[i];
        if (beach[5] == STATE) {

            var div = document.createElement('DIV');
            div.innerHTML = '<div id="IEMarker3"><center><div class="IEMarkerCss3" style="font-weight:bolder;">' + beach[0] + '</div><div class="IEarrow_box3"></div></center></div>';

            marker = new RichMarker({
                map: map,
                position: new google.maps.LatLng(beach[2], beach[1]),
                draggable: false,
                flat: false,
                anchor: RichMarkerPosition.MIDDLE,
                content: div
            });

            marker.zaixs = beach[3],
            marker.x = beach[1],
            marker.y = beach[2],
            marker.IIEName = beach[4],
            marker.IIENamess = beach[0]
            marker.PDF = beach[6],


            google.maps.event.addListener(marker, 'click', function () {


                if (this.PDF !== 'NOPDF') {
                    //window.open(this.PDF, '_newtab');
                    getVacantPlotDetails(this.IIEName);
                }
                //IIE_RECNO.push(this.IIEName);
                map.setZoom(this.zaixs);
                getPlotcreate(this.IIEName);
                getroadcreate(this.IIEName);
                getutilitycreate(this.IIEName);
                getPublicPurposecreate(this.IIEName);
                getCommanareacreate(this.IIEName);
                getOthercreate(this.IIEName);
                getWaterheadtankcreate(this.IIEName);
                getparkingcreate(this.IIEName);
                getNalacreate(this.IIEName);
                getPoloicestationcreate(this.IIEName);
                getfirestationcreate(this.IIEName);
                getlabelcreate(this.IIEName);
                getvegcreate(this.IIEName);
                getbndcreate(this.IIEName);
                getsectorcreate(this.IIEName);
                getElinecreate(this.IIEName);
                getEPolecreate(this.IIEName);
                getWatercreate(this.IIEName);
                getRivercreate(this.IIEName);
                getlamppostcreate(this.IIEName);
                getRailwaycreate(this.IIEName);
                getmanholecreate(this.IIEName);
                getgascreate(this.IIEName);
                getfootpathcreate(this.IIEName);
                getBridgecreate(this.IIEName);
                getencroachmentcreate(this.IIEName);
                //    showPlots(this.IIEName);
                getestateinformation(this.IIEName);
                //  getAllIIE(this.IIEName);
                // ChangeIIEinformation(this.IIENamess);
                // $("#div_legend").dialog('open');
                map.panTo(new google.maps.LatLng(this.y, this.x));
                // zoomTo(this.zaixs);
                CITY_NAME.push(this.IIEName);

            });


            IIE_MARKERS.push(marker);

        }
    }
    //  var zoomTo;
    //function zoomTo(zoomFluid) {

    //    if (zoomFluid == 7) return 0;
    //    else {
    //        zoomFluid++;
    //        map.setZoom(zoomFluid);
    //        setTimeout("zoomTo(zoomFluid)", 500);
    //    }
    //}
}
function setMarkersdd(DISTT) {

    GetCurrentDetails("District", DISTT);

    var image = {
        url: 'http://www.prodraw.net/favicon/temp/rxltlx5y_1.ico',

        size: new google.maps.Size(20, 32),
        // The origin for this image is (0, 0).
        origin: new google.maps.Point(0, 0),
        // The anchor for this image is the base of the flagpole at (0, 32).
        anchor: new google.maps.Point(0, 32)
    };
    // Shapes define the clickable region of the icon. The type defines an HTML
    // <area> element 'poly' which traces out a polygon as a series of X,Y points.
    // The final coordinate closes the poly by connecting to the first coordinate.
    var shape = {
        coords: [1, 1, 1, 20, 18, 20, 18, 1],
        type: 'poly',
        fillColor: '#3933FF'
    };
    var infowindow = new google.maps.InfoWindow();
    var mm = "https://maps.google.com/mapfiles/ms/icons/blue-dot.png";
    var marker, i;
    var CITY;
    for (i = 0; i < Marker.length; i++) {
        var beach = Marker[i];
        if (beach[5] == DISTT) {

            var div = document.createElement('DIV');
            div.innerHTML = '<div id="IEMarker"><center><div class="IEMarkerCss" style="font-weight:bolder;">' + beach[0] + '</div><div class="IEarrow_box"></div></center></div>';

            marker = new RichMarker({
                map: map,
                position: new google.maps.LatLng(beach[2], beach[1]),
                draggable: false,
                flat: false,
                anchor: RichMarkerPosition.MIDDLE,
                content: div
            });

            marker.zaixs = beach[3],
            marker.x = beach[1],
            marker.y = beach[2],
            marker.IIEName = beach[4],
            marker.IIENamess = beach[0]
            marker.PDF = beach[6],


            google.maps.event.addListener(marker, 'click', function () {


                if (this.PDF !== 'NOPDF') {
                    // window.open(this.PDF, '_newtab');


                    getVacantPlotDetails(this.IIEName);
                }
                IIE_RECNO.push(this.IIEName);
                map.setZoom(this.zaixs);
                getPlotcreate(this.IIEName);
                getroadcreate(this.IIEName);
                getutilitycreate(this.IIEName);
                getPublicPurposecreate(this.IIEName);
                getCommanareacreate(this.IIEName);
                getOthercreate(this.IIEName);
                getWaterheadtankcreate(this.IIEName);
                getparkingcreate(this.IIEName);
                getNalacreate(this.IIEName);
                getPoloicestationcreate(this.IIEName);
                getfirestationcreate(this.IIEName);
                getlabelcreate(this.IIEName);
                getvegcreate(this.IIEName);
                getbndcreate(this.IIEName);
                getsectorcreate(this.IIEName);
                getElinecreate(this.IIEName);
                getEPolecreate(this.IIEName);
                getWatercreate(this.IIEName);
                getRivercreate(this.IIEName);
                getlamppostcreate(this.IIEName);
                getRailwaycreate(this.IIEName);
                getmanholecreate(this.IIEName);
                getgascreate(this.IIEName);
                getfootpathcreate(this.IIEName);
                getBridgecreate(this.IIEName);
                getencroachmentcreate(this.IIEName);
                //    showPlots(this.IIEName);
                getestateinformation(this.IIEName);
                //  getAllIIE(this.IIEName);
                // ChangeIIEinformation(this.IIENamess);
                // $("#div_legend").dialog('open');
                map.panTo(new google.maps.LatLng(this.y, this.x));
                // zoomTo(this.zaixs);
                CITY_NAME.push(this.IIEName);

            });


            IIE_MARKERS.push(marker);

        }
    }
    //  var zoomTo;
    //function zoomTo(zoomFluid) {

    //    if (zoomFluid == 7) return 0;
    //    else {
    //        zoomFluid++;
    //        map.setZoom(zoomFluid);
    //        setTimeout("zoomTo(zoomFluid)", 500);
    //    }
    //}
}
function setaccordionMarkers(STATE) {
    // Adds markers to the map.

    // Marker sizes are expressed as a Size of X,Y where the origin of the image
    // (0,0) is located in the top left of the image.

    // Origins, anchor positions and coordinates of the marker increase in the X
    // direction to the right and in the Y direction down.
    var image = {
        url: 'http://www.prodraw.net/favicon/temp/rxltlx5y_1.ico',
        // This marker is 20 pixels wide by 32 pixels high.
        size: new google.maps.Size(20, 32),
        // The origin for this image is (0, 0).
        origin: new google.maps.Point(0, 0),
        // The anchor for this image is the base of the flagpole at (0, 32).
        anchor: new google.maps.Point(0, 32)
    };
    // Shapes define the clickable region of the icon. The type defines an HTML
    // <area> element 'poly' which traces out a polygon as a series of X,Y points.
    // The final coordinate closes the poly by connecting to the first coordinate.
    var shape = {
        coords: [1, 1, 1, 20, 18, 20, 18, 1],
        type: 'poly',
        fillColor: '#3933FF'
    };
    //map.setZoom(18);
    var infowindow = new google.maps.InfoWindow();
    //var mm = "https://maps.google.com/mapfiles/ms/icons/Yellow-dot.png";
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/yellow-dot.png";
    var marker, i;
    var CITY;
    for (i = 0; i < PDFMarker.length; i++) {
        var beach = PDFMarker[i];
        if (beach[4] == STATE) {
            var div = document.createElement('DIV');
            div.innerHTML = '<div id="IEMarker3"><center><div class="IEMarkerCss3" style="font-weight:bolder;">' + beach[0] + '</div><div class="IEarrow_box3"></div></center></div>';

            marker = new RichMarker({
                map: map,
                position: new google.maps.LatLng(beach[2], beach[1]),
                draggable: false,
                flat: false,
                anchor: RichMarkerPosition.MIDDLE,
                content: div
            });
            marker.zaixs = beach[3],
            marker.x = beach[1],
            marker.y = beach[2],
            marker.IIEName = beach[4],
            marker.IIENamess = beach[0]
            marker.PDF = beach[6],


            google.maps.event.addListener(marker, 'click', function () {


                if (this.PDF !== 'NOPDF') {


                    getVacantPlotDetails(this.IIEName);

                }
                IIE_RECNO.push(this.IIEName);
                map.setZoom(this.zaixs);
                getPlotcreate(this.IIEName);
                getroadcreate(this.IIEName);
                getutilitycreate(this.IIEName);
                getPublicPurposecreate(this.IIEName);
                getCommanareacreate(this.IIEName);
                getOthercreate(this.IIEName);
                getWaterheadtankcreate(this.IIEName);
                getparkingcreate(this.IIEName);
                getNalacreate(this.IIEName);
                getPoloicestationcreate(this.IIEName);
                getfirestationcreate(this.IIEName);
                getlabelcreate(this.IIEName);
                getvegcreate(this.IIEName);
                getbndcreate(this.IIEName);
                getsectorcreate(this.IIEName);
                getElinecreate(this.IIEName);
                getEPolecreate(this.IIEName);
                getWatercreate(this.IIEName);
                getRivercreate(this.IIEName);
                getlamppostcreate(this.IIEName);
                getRailwaycreate(this.IIEName);
                getmanholecreate(this.IIEName);
                getgascreate(this.IIEName);
                getfootpathcreate(this.IIEName);
                getBridgecreate(this.IIEName);
                getencroachmentcreate(this.IIEName);
                map.panTo(new google.maps.LatLng(this.y, this.x));

                CITY_NAME.push(this.IIEName);

            });

            map.panTo(new google.maps.LatLng(beach[2], beach[1]));
            map.setZoom(15);
            IIE_MARKERS.push(marker);
        }


    }

}
function ChangeIIEinformation(IIE) {
    if (IIE == "TRANSGANGA") {
        $("#LiQuery").removeClass('active');
        $("#LiLayers").removeClass('active');
        $("#LiLegends").removeClass('active');
        $("#LiIndustrialList").removeClass('active');
        $("#Liinformation").addClass("active");
        $('#home').removeClass('in active');
        $('#profile').removeClass('in active');
        $('#messages').removeClass('in active');

        $('#AMOUSI').css('display', 'none');
        $('#legends').addClass('in active');
        $('#TRANSGANGA').css('display', 'block');

    }
    else if (IIE == "AMOUSI") {
        $('#AMOUSI').css('display', 'block');//visible

        $("#LiQuery").removeClass('active');
        $("#LiLayers").removeClass('active');
        $("#LiLegends").removeClass('active');
        $("#LiIndustrialList").removeClass('active');
        $("#Liinformation").addClass("active");
        $('#home').removeClass('in active');
        $('#profile').removeClass('in active');
        $('#messages').removeClass('in active');


        $('#legends').addClass('in active');
        $('#TRANSGANGA').css('display', 'none');
    }

}

function setSIDCMarkers(PDFMAP) {
    // Adds markers to the map.

    // Marker sizes are expressed as a Size of X,Y where the origin of the image
    // (0,0) is located in the top left of the image.

    var image = {
        url: 'https://www.prodraw.net/favicon/temp/rxltlx5y_1.ico',

        size: new google.maps.Size(20, 32),

        origin: new google.maps.Point(0, 0),

        anchor: new google.maps.Point(0, 32)
    };

    var shape = {
        coords: [1, 1, 1, 20, 18, 20, 18, 1],
        type: 'poly',
        fillColor: '#3933FF'
    };
    var infowindow = new google.maps.InfoWindow();
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/yellow-dot.png";
    var marker, i;
    for (i = 0; i < SIDCMarkers.length; i++) {
        var beach = SIDCMarkers[i];
        marker = new google.maps.Marker({
            position: { lat: beach[2], lng: beach[1] },
            map: map,
            icon: mm,

            // shape: shape,
            // animation: google.maps.Animation.DROP,
            title: beach[0],
            //zIndex: beach[3]
        });
        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[0]
        //google.maps.event.addListener(marker, 'click', (function (marker, i) {
        //    return function() {
        //        map.setZoom(beach[3]);
        //        map.panTo(new google.maps.LatLng(beach[2], beach[1]));
        //    }
        //})(marker, i));

        google.maps.event.addListener(marker, 'click', function () {

            //var latLngs = new google.maps.LatLng(this.y, this.x);
            //map.animateCamera(google.maps.animateCamera(latLng, this.zaixs));
            map.setZoom(this.zaixs);
            ChangeIIEinformation(this.IIEName);
            $("#div_legend").dialog('open');
            map.panTo(new google.maps.LatLng(this.y, this.x));
            zoomTo(this.zaixs);

        });

        // maplayer.push(marker);
        IIE_MARKERS.push(marker);

    }

    var minValue = 12, maxValue = 15;




    function zoomTo(zoomFluid) {
        //console.log(zoomFluid);
        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}
function setTextileMarkers(map) {
    // Adds markers to the map.

    // Marker sizes are expressed as a Size of X,Y where the origin of the image
    // (0,0) is located in the top left of the image.

    var image = {
        url: 'https://www.prodraw.net/favicon/temp/rxltlx5y_1.ico',

        size: new google.maps.Size(20, 32),

        origin: new google.maps.Point(0, 0),

        anchor: new google.maps.Point(0, 32)
    };

    var shape = {
        coords: [1, 1, 1, 20, 18, 20, 18, 1],
        type: 'poly',
        fillColor: '#3933FF'
    };
    var infowindow = new google.maps.InfoWindow();
    var mm = "https://maps.google.com/mapfiles/ms/icons/orange-dot.png";
    var marker, i;
    for (i = 0; i < TextileMarkers.length; i++) {
        var beach = TextileMarkers[i];
        marker = new google.maps.Marker({
            position: { lat: beach[2], lng: beach[1] },
            map: map,
            icon: mm,

            // shape: shape,
            // animation: google.maps.Animation.DROP,
            title: beach[0],
            //zIndex: beach[3]
        });
        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[0]
        //google.maps.event.addListener(marker, 'click', (function (marker, i) {
        //    return function() {
        //        map.setZoom(beach[3]);
        //        map.panTo(new google.maps.LatLng(beach[2], beach[1]));
        //    }
        //})(marker, i));

        google.maps.event.addListener(marker, 'click', function () {


            map.setZoom(this.zaixs);
            ChangeIIEinformation(this.IIEName);
            $("#div_legend").dialog('open');
            map.panTo(new google.maps.LatLng(this.y, this.x));
            zoomTo(this.zaixs);

        });

        // maplayer.push(marker);
        IIE_MARKERS.push(marker);

    }

    var minValue = 12, maxValue = 15;




    function zoomTo(zoomFluid) {
        //console.log(zoomFluid);
        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}
function setReservedMarker(map) {



    var marker, i;
    for (i = 0; i < ReservedMarker.length; i++) {
        var beach = ReservedMarker[i];

        var icon = "";
        switch (beach[0]) {

            case "Reserved For Women Entrepreneur":
                icon = "images/Reser.png";
                break;

        }
        var mm = icon;
        marker = new google.maps.Marker({
            position: { lat: beach[2], lng: beach[1] },
            map: map,
            icon: mm,


            //  animation: google.maps.Animation.DROP,
            title: beach[0],
            //zIndex: beach[3]
        });
        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[0]
        google.maps.event.addListener(marker, 'click', (function (marker, i) {
            return function () {
                map.setZoom(this.zaixs);
                map.panTo(new google.maps.LatLng(this.x, this.y));
            }
        })(marker, i));

        google.maps.event.addListener(marker, 'click', function () {

            //var latLngs = new google.maps.LatLng(this.y, this.x);
            //map.animateCamera(google.maps.animateCamera(latLng, this.zaixs));
            map.setZoom(this.zaixs);
            //ChangeIIEinformation(this.IIEName);
            // $("#div_legend").dialog('open');
            map.panTo(new google.maps.LatLng(this.y, this.x));


        });

        // maplayer.push(marker);
        SIIDCUL_POLLUTION_MARKERS.push(marker);

    }




    function zoomTo(zoomFluid) {
        //console.log(zoomFluid);
        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}
function getVacantPlotDetails(city_name) {

    var city = city_name;

    ajaxReq('do_it.ashx', 'VacantPlot', { "location": city }, function (resp) { setVacantPlotDetails(resp) }, true);
}
function setVacantPlotDetails(resp) {
    if (resp.status === true) {
        var tbl = $('.infomain table').empty();
        tbl.empty();
        tbl.append('<tr><th>Sr No.</th><th>Plot No</th><th>Plot Area(in sq.mt.)</th></tr>');
        //tbl.append('<tr><td >Plot No</td><td style="font-weight:bold;">' + plot + '</td></tr>');

        var arr = $.map(resp.data, function (el) { return el; })

        var j = 1;
        if (arr.length > 0) {
            for (i = 0; i < arr.length; i++) {
                if ((i % 2) == 0) {
                    tbl.append('<tr><td>' + (j) + '</td><td>' + arr[i] + '</td><td>' + arr[i + 1] + '</td></tr>');
                    j = j + 1;
                }
            }
            $(".infolower").empty();
            $(".infolower").css('visibility', 'visible');
        }
        else
            $(".infolower").css('visibility', 'hidden');

        //$.each(resp.data, function (indx, itm) {
        //    tbl.append('<tr><td>' + resp.data["Plot No"] + '</td><td>' + resp.data["Plot Area"] + '</td></tr>');
        //    //tbl.append('<tr><td>' + indx + '</td><td style="font-weight:bold;">' + itm + (indx == 'Plot Area' ? ' sq. mtr' : '') + '</td></tr>');
        //    if (indx == "Plot Status" && itm == "Vacant") {
        //        //  moreInfo();


        //        // var url = "http://118.185.3.27/UPSIDC_SmartCity/User/ApplicationFormForFirstTimeUser.aspx?PlotNo=" + plot + '&Area=' + area + '&Sector=' + SectorName + '&iierecno=' + city_name + '&Industrial_Area_Name=' + Industrial_Area_Name + '&District_Name=' + District_Name;
        //        //var url = "http://demo.onlineupsidc.com/ApplicationPayment.aspx?PlotNo=" + plot + '&Area=' + area + '&Sector=' + SectorName + '&iierecno=' + city_name + '&Industrial_Area_Name=' + Industrial_Area_Name + '&District_Name=' + District_Name;
        //        //  $(".infolower").append('<a id="btnApply" class="btn btn-danger" target="_blank" href="' + url + '">Apply Now</a>')
        //        //  $(".infolower").append('<a id="btnApply" target="_blank" href="#">Apply Now</a>')
        //    }

        //});

        $("#Div3").dialog(opt).dialog("open");
    }
    else {
        var tbl = $('.infomain table').empty();
        tbl.empty();
        tbl.append('<tr><th>Sr No.</th><th>Plot No</th><th>Plot Area(in sq.mt.)</th></tr>');
        tbl.append('<tr><td colspan="3"><p style="color:red;font-weight:bolder;">No Vacant Plots Data Found.</p></td></tr>');
        $(".infolower").empty();
        $(".infolower").css('visibility', 'visible');
        $("#Div3").dialog(opt).dialog("open");
    }
}
$(document).on('click', '#btnpollution', function (e) {
    e.preventDefault();
    map.setZoom(7);

    map.panTo(new google.maps.LatLng(26.846709, 80.946159));

    CloseDialogs();
    Pollution();

});
function Pollution() {
    for (i = 0; i < IIE_MARKERS.length; i++) {
        IIE_MARKERS[i].setMap(null);

    }
    for (i = 0; i < CATEGORY_MARKERS.length; i++) {
        CATEGORY_MARKERS[i].setMap(null);

    }
    setPollutionMarkers(map);
    // setSIDCPollutionMarkers(map);
    //setTextilePollutionMarkers(map);
};
var SIIDCUL_POLLUTION_MARKERS = [];
function setPollutionMarkers(map) {

    //var infowindow = new google.maps.InfoWindow();

    var marker, i;



    //   var infowindow = new google.maps.InfoWindow({
    //     content: contentString
    //});

    for (i = 0; i < Marker.length; i++) {
        var beach = Marker[i];
        var icon = "";
        switch (beach[0]) {

            case "TRANSGANGA":
                icon = "images/Blue.png";
                break;
            case "UNNAO2":
                icon = "images/Blue.png";
                break;


        }
        var mm = icon;
        marker = new google.maps.Marker({
            position: { lat: beach[2], lng: beach[1] },
            map: map,
            icon: mm,
            title: beach[0],

        });

        marker.zaixs = beach[3],
       marker.x = beach[1],
       marker.y = beach[2],
       marker.IIEName = beach[0]
        google.maps.event.addListener(marker, 'click', (function (marker, i) {
            return function () {

                getPlotcreate(this.IIEName);
                getroadcreate(this.IIEName);
                getutilitycreate(this.IIEName);
                getPublicPurposecreate(this.IIEName);
                getCommanareacreate(this.IIEName);
                getOthercreate(this.IIEName);
                getWaterheadtankcreate(this.IIEName);
                getparkingcreate(this.IIEName);
                getNalacreate(this.IIEName);
                getPoloicestationcreate(this.IIEName);
                getfirestationcreate(this.IIEName);
                getlabelcreate(this.IIEName);
                getvegcreate(this.IIEName);
                getbndcreate(this.IIEName);
                getsectorcreate(this.IIEName);
                getElinecreate(this.IIEName);
                getEPolecreate(this.IIEName);
                getWatercreate(this.IIEName);
                getRivercreate(this.IIEName);
                getlamppostcreate(this.IIEName);
                getRailwaycreate(this.IIEName);
                getmanholecreate(this.IIEName);
                getgascreate(this.IIEName);
                getfootpathcreate(this.IIEName);
                getBridgecreate(this.IIEName);
                showPlots(this.IIEName);
                getencroachmentcreate(this.IIEName);
                map.setZoom(this.zaixs);
                ChangeIIEinformation(this.IIEName);
                //$("#div_legend").dialog('open');
                map.panTo(new google.maps.LatLng(this.y, this.x));
            }
        })(marker, i));


        marker.setMap(map);

        SIIDCUL_POLLUTION_MARKERS.push(marker);




    }

}
function setTextilePollutionMarkers(map) {

    //var infowindow = new google.maps.InfoWindow();

    var marker, i;



    //   var infowindow = new google.maps.InfoWindow({
    //     content: contentString
    //});

    for (i = 0; i < TextileMarkers.length; i++) {
        var beach = TextileMarkers[i];
        var icon = "";
        switch (beach[0]) {

            case "Textile Park,Sitarganj Phase II":
                icon = "images/split1.png";
                break;


        }
        var mm = icon;
        marker = new google.maps.Marker({
            position: { lat: beach[2], lng: beach[1] },
            map: map,
            icon: mm,
            title: beach[0],

        });

        marker.zaixs = beach[3],
       marker.x = beach[1],
       marker.y = beach[2],
       marker.IIE = beach[0]
        google.maps.event.addListener(marker, 'click', (function (marker, i) {
            return function () {
                map.setZoom(this.zaixs);
                ChangeIIEinformation(this.IIE);
                $("#div_legend").dialog('open');
                map.panTo(new google.maps.LatLng(this.y, this.x));
            }
        })(marker, i));


        marker.setMap(map);

        SIIDCUL_POLLUTION_MARKERS.push(marker);




    }

}
function setSIDCPollutionMarkers(map) {



    var marker, i;
    for (i = 0; i < SIDCMarkers.length; i++) {
        var beach = SIDCMarkers[i];

        var icon = "";
        switch (beach[0]) {

            case "Bhimtal":
                icon = "images/split1.png";
                break;


        }
        var mm = icon;
        marker = new google.maps.Marker({
            position: { lat: beach[2], lng: beach[1] },
            map: map,
            icon: mm,


            //  animation: google.maps.Animation.DROP,
            title: beach[0],
            //zIndex: beach[3]
        });
        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[0]
        google.maps.event.addListener(marker, 'click', (function (marker, i) {
            return function () {
                map.setZoom(this.zaixs);
                map.panTo(new google.maps.LatLng(this.x, this.y));
            }
        })(marker, i));

        google.maps.event.addListener(marker, 'click', function () {

            //var latLngs = new google.maps.LatLng(this.y, this.x);
            //map.animateCamera(google.maps.animateCamera(latLng, this.zaixs));
            map.setZoom(this.zaixs);
            ChangeIIEinformation(this.IIEName);
            $("#div_legend").dialog('open');
            map.panTo(new google.maps.LatLng(this.y, this.x));


        });

        // maplayer.push(marker);
        SIIDCUL_POLLUTION_MARKERS.push(marker);

    }




    function zoomTo(zoomFluid) {
        //console.log(zoomFluid);
        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}
function setReservedMarker(map) {



    var marker, i;
    for (i = 0; i < ReservedMarker.length; i++) {
        var beach = ReservedMarker[i];

        var icon = "";
        switch (beach[0]) {

            case "Reserved For Women Entrepreneur":
                icon = "images/split1.png";
                break;

        }
        var mm = icon;
        marker = new google.maps.Marker({
            position: { lat: beach[2], lng: beach[1] },
            map: map,
            icon: mm,


            //  animation: google.maps.Animation.DROP,
            title: beach[0],
            //zIndex: beach[3]
        });
        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.IIEName = beach[0]
        google.maps.event.addListener(marker, 'click', (function (marker, i) {
            return function () {
                map.setZoom(this.zaixs);
                map.panTo(new google.maps.LatLng(this.x, this.y));
            }
        })(marker, i));

        google.maps.event.addListener(marker, 'click', function () {

            //var latLngs = new google.maps.LatLng(this.y, this.x);
            //map.animateCamera(google.maps.animateCamera(latLng, this.zaixs));
            map.setZoom(this.zaixs);
            //ChangeIIEinformation(this.IIEName);
            // $("#div_legend").dialog('open');
            map.panTo(new google.maps.LatLng(this.y, this.x));


        });

        // maplayer.push(marker);
        SIIDCUL_POLLUTION_MARKERS.push(marker);

    }




    function zoomTo(zoomFluid) {
        //console.log(zoomFluid);
        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}

function loadZoomControl(z) {
    $('div.ZoomControl').remove();
    $('div.RightTools').prepend('<div class="ZoomControl"><div class="sliderwrapper"><div title="Zoom-In" class="zoomIN tooltip" id="zIN"></div>' +
        '<div title="Zoom-Out" class="zoomOut tooltip" id="zOut"></div></div></div>');
    $('.ZoomControl').show();




    $('.logo').click(function () {
        window.location.href = 'Default.aspx';

    });

    function createPolygon(_path) {
        var tmpLine = new google.maps.Polygon({
            strokeColor: '#01FFF7',
            fillColor: '#D5DBDB',
            fillOpacity: 0.7,
            strokeWeight: 11,
            clickable: !1,
            map: map,
            path: _path
        });
        return tmpLine;
    }
    function clearAll(maplayer) {
        for (i = 0; i < maplayer.length; i++) {
            maplayer[i].setMap(null);
        }
        maplayer = [];
    }
    // End of Sector Searching 3/2/2016


    $('.DrpDiv p').click(function (e) {
        var target = $('.city .city_name');
        var ct = target.text();
        var p = $(e.target);
        var nt = p.text();
        var _city = p.attr("data-rel");
        if (ct != nt) {
            target.text(nt).attr("data-rel", _city);
            showPlots(nt);
            showStats(_city);
            showinitialdivs();
        }
    });

    $('.info .infolower').click(function (e) { $('.info').fadeOut(); });

    $(document).on('click', '#MapShowplots', function (e) {
        e.preventDefault();
        //  $("MapShowplots").click(function () {
        if (this.checked) {
            if (thematic_param === 'Plot Type') {
                thematic_param = 'Completion Status';

            }
            else {
                thematic_param = 'Plot Type';
            }
            refreshLayer();
        }
    });




    $('.legend_switch').click(function (e) {
        $(e.target).toggleClass('off');
        $('.div_legend').slideToggle();
    });


}
function getPlantHight() {

    //debugger;
    ajaxReq('do_it.ashx', 'ALLPLANTHIGHT', {}, function (resp) { BindAllPLANTHIGHTfromSea(resp) }, true);
}
function BindAllPLANTHIGHTfromSea(resp) {

    $("#ddlHeightfromsea").empty();
    if (resp.status === true) {
        var PlantHightfromSealevel = $.map(resp.data, function (el) { return el; })
        $('#ddlHeightfromsea').append(new Option('--Select Plant - Height from sea level--', ''));
        $('#ddlPlantHeight').append(new Option('--Select Plant - Height--', ''));

        for (i = 0; i < PlantHightfromSealevel.length; i++) {
            if (i % 2 === 0) {
                $("#ddlHeightfromsea").append(new Option(PlantHightfromSealevel[i + 1], PlantHightfromSealevel[i]));
                //$("#ddlPlantFamily").append(new Option(Plantfamily[i + 1], Plantfamily[i] + '/' + Plantfamily[i + 2] + '/' + Plantfamily[i + 3] + '/' + Plantfamily[i + 4]));

            }
        }
    }
    else {
        $("#ddlHeightfromsea").append(new Option("Data Not Found"));
    }
}

$(document).on('change', '#ddlHeightfromsea', function (e) {
    e.preventDefault();
    var PlantHeightfromsea = $('#ddlHeightfromsea option:selected').val();
    var Plant_BND = PlantHeightfromsea.split('/');

    Plant_BND = Plant_BND.concat(PlantHeightfromsea);
   // getAllPlantHight(Plant_BND[0]);

    for (var x = 0; x < zoomIIE.length; x++) {
        zoomIIE[x].setMap(null);
    }
    setPlantMarkers(map);
    $("#DivPlantResult").dialog(opt).dialog("open");
    map.setZoom(12);
    map.panTo(new google.maps.LatLng(26.9914874, 93.0324423));
    //var sl = createPolygon(getLatLongArr(Plant_BND[1]));
    //sl.setOptions({ strokeWeight: 5, strokeColor: '#0242BD', fillOpacity: 0, clickable: !1 });
    //zoomDistrict.push(sl);
    //map.setZoom(4);
    //map.panTo(new google.maps.LatLng(Plant_BND[3], Plant_BND[2]));
});

function getAllPlantHight(CountryRecno) {

    var Country = CountryRecno;
    ajaxReq('do_it.ashx', 'PLANTHight', { "location": Country }, function (resp) { BindAllPLANTHIGHT(resp) }, true);

}
function BindAllPLANTHIGHT(resp) {
    $("#ddlPlantHeight").empty();
    if (resp.status === true) {
        var PlantName = $.map(resp.data, function (el) { return el; })
        $('#ddlPlantHeight').append(new Option('--Select Plant Hight--', ''));

        for (i = 0; i < PlantName.length; i++) {

            for (i = 0; i < PlantName.length; i++) {
                if (i % 5 === 0) {
                    $("#ddlPlantHeight").append(new Option(PlantName[i + 1], PlantName[i] + '/' + PlantName[i + 2] + '/' + PlantName[i + 3] + '/' + PlantName[i + 4]));

                }
            }
        }
    }
    else {
        $('#ddlPlantHeight').append(new Option('--No Datat Found--', ''));

    }

}
$(document).on('change', '#ddlPlantHeight', function (e) {
    e.preventDefault();
    $(".ui-dialog-content").dialog("close");
    var PlantNmae = $('#ddlPlantHeight option:selected').val();
    var PLANTNAME_BND = PlantNmae.split('/');

    PLANTNAME_BND = PLANTNAME_BND.concat(PlantNmae);
    //var IA = State.split('/');
    //var IIEE = IA[0];
    //var IIE_BND = State.split('/');
    // getAllDISTRICT(DISTRICT_BND[0]);
    //IIE_BND = IIE_BND.concat(IIE);
    //All Layer Create function Date 18/jan/2017
    //IIE_RECNO.push(IIEE);


    for (var x = 0; x < zoomIIE.length; x++) {
        zoomIIE[x].setMap(null);
    }
    setPlantMarkers(map);
    $("#DivPlantResult").dialog(opt).dialog("open");
    map.setZoom(5);
    map.panTo(new google.maps.LatLng(26.973599, 93.030385));
    //var sl = createPolygon(getLatLongArr(PLANTNAME_BND[1]));
    //sl.setOptions({ strokeWeight: 5, strokeColor: '#F0B27A', fillOpacity: 0, clickable: !1 });
    //zoomIIE.push(sl);
    //map.setZoom(7);
    //map.panTo(new google.maps.LatLng(PLANTNAME_BND[3], PLANTNAME_BND[2]));
});
function getDiseases() {

    debugger;
    ajaxReq('do_it.ashx', 'ALLDISEASES', {}, function (resp) { BindAllDISEASES(resp) }, true);
}
function BindAllDISEASES(resp) {
    debugger;
    $("#ddlDiseases").empty();
    if (resp.status === true) {
        var Plantfamily = $.map(resp.data, function (el) { return el; })
        $('#ddlDiseases').append(new Option('--Select Diseases--', ''));
        $('#ddlPlantName').append(new Option('--Select Plant Name--', ''));

        for (i = 0; i < Plantfamily.length; i++) {
            if (i % 2 === 0) {
                $("#ddlDiseases").append(new Option(Plantfamily[i + 1], Plantfamily[i]));
                // $("#ddlDiseases").append(new Option(Plantfamily[i + 1], Plantfamily[i] + '/' + Plantfamily[i + 2] + '/' + Plantfamily[i + 3] + '/' + Plantfamily[i + 4]));

            }
        }
    }
    else {
        $("#ddlDiseases").append(new Option("Data Not Found"));
    }
}
$(document).on('change', '#ddlDiseases', function (e) {
    debugger;
    e.preventDefault();
    var Plantfamily = $('#ddlDiseases option:selected').val();
    var Plant_BND = Plantfamily.split('/');

    Plant_BND = Plant_BND.concat(Plantfamily);
    getAllDiseases(Plant_BND[0]);
    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    //var sl = createPolygon(getLatLongArr(Plant_BND[1]));
    //sl.setOptions({ strokeWeight: 5, strokeColor: '#0242BD', fillOpacity: 0, clickable: !1 });
    //zoomDistrict.push(sl);
    //map.setZoom(4);
    //map.panTo(new google.maps.LatLng(Plant_BND[3], Plant_BND[2]));
});
function getAllDiseases(CountryRecno) {

    var Country = CountryRecno;
    ajaxReq('do_it.ashx', 'PLANTWISEDISEASES', { "location": Country }, function (resp) { BindAllPLANTWISEDISEASES(resp) }, true);

}
function BindAllPLANTWISEDISEASES(resp) {
    $("#ddlPlantwiseDiseases").empty();
    if (resp.status === true) {
        var PlantName = $.map(resp.data, function (el) { return el; })
        $('#ddlPlantwiseDiseases').append(new Option('--Select Plant Name--', ''));

        for (i = 0; i < PlantName.length; i++) {

            for (i = 0; i < PlantName.length; i++) {
                if (i % 5 === 0) {
                    $("#ddlPlantwiseDiseases").append(new Option(PlantName[i + 1], PlantName[i] + '/' + PlantName[i + 2] + '/' + PlantName[i + 3] + '/' + PlantName[i + 4]));

                }
            }
        }
    }
    else {
        $('#ddlPlantwiseDiseases').append(new Option('--No Datat Found--', ''));

    }

}

$(document).on('change', '#ddlPlantwiseDiseases', function (e) {
    debugger;
    e.preventDefault();
    $(".ui-dialog-content").dialog("close");
    var PlantName = $('#ddlPlantwiseDiseases option:selected').val();
    var PLANTNAME_BND = PlantName.split('/');

    PLANTNAME_BND = PLANTNAME_BND.concat(PlantName);

    for (var x = 0; x < zoomIIE.length; x++) {
        zoomIIE[x].setMap(null);
    }

    setPlantMarkers(map);
    if (PLANTNAME_BND[0] == 1) {
        $(".ui-dialog-content").dialog("close");
        $("#DIVdiseaseswiseplant2").dialog(opt).dialog("open");
    } else {
        $(".ui-dialog-content").dialog("close");
        $("#DIVdiseaseswiseplant1").dialog(opt).dialog("open");
    }
    map.setZoom(12);
    map.panTo(new google.maps.LatLng(26.9914874, 93.0324423));

});
function getPlantfamily() {

    debugger;
    ajaxReq('do_it.ashx', 'ALLPLANTFAMILY', {}, function (resp) { BindAllPLANTFAMILY(resp) }, true);
}
function BindAllPLANTFAMILY(resp) {
    debugger;
    $("#ddlPlantFamily").empty();
    if (resp.status === true) {
        var Plantfamily = $.map(resp.data, function (el) { return el; })
        $('#ddlPlantFamily').append(new Option('--Select Plant family--', ''));
        $('#ddlPlantName').append(new Option('--Select Plant Name--', ''));

        for (i = 0; i < Plantfamily.length; i++) {
            if (i % 2 === 0) {
                $("#ddlPlantFamily").append(new Option(Plantfamily[i + 1], Plantfamily[i]));
                //$("#ddlPlantFamily").append(new Option(Plantfamily[i + 1], Plantfamily[i] + '/' + Plantfamily[i + 2] + '/' + Plantfamily[i + 3] + '/' + Plantfamily[i + 4]));

            }
        }
    }
    else {
        $("#ddlPlantFamily").append(new Option("Data Not Found"));
    }
}

$(document).on('change', '#ddlPlantFamily', function (e) {
    debugger;
    e.preventDefault();
    var Plantfamily = $('#ddlPlantFamily option:selected').val();
    var Plant_BND = Plantfamily.split('/');

    Plant_BND = Plant_BND.concat(Plantfamily);
    getAllPlantName(Plant_BND[0]);
    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    //var sl = createPolygon(getLatLongArr(Plant_BND[1]));
    //sl.setOptions({ strokeWeight: 5, strokeColor: '#0242BD', fillOpacity: 0, clickable: !1 });
    //zoomDistrict.push(sl);
    //map.setZoom(4);
    //map.panTo(new google.maps.LatLng(Plant_BND[3], Plant_BND[2]));
});


function getAllPlantName(CountryRecno) {

    var Country = CountryRecno;
    ajaxReq('do_it.ashx', 'PLANTNAME', { "location": Country }, function (resp) { BindAllPLANTNAME(resp) }, true);

}
function BindAllPLANTNAME(resp) {
    $("#ddlPlantName").empty();
    if (resp.status === true) {
        var PlantName = $.map(resp.data, function (el) { return el; })
        $('#ddlPlantName').append(new Option('--Select Plant Name--', ''));

        for (i = 0; i < PlantName.length; i++) {

            for (i = 0; i < PlantName.length; i++) {
                if (i % 5 === 0) {
                    $("#ddlPlantName").append(new Option(PlantName[i + 1], PlantName[i] + '/' + PlantName[i + 2] + '/' + PlantName[i + 3] + '/' + PlantName[i + 4]));

                }
            }
        }
    }
    else {
        $('#ddlPlantName').append(new Option('--No Datat Found--', ''));

    }

}

//sachin 29/nov/2017

var PlantMarkers = [];
var MarkerOfPlants = [
                    ['Seijosa', 93.0459441, 26.9985374, 15, 'POLYGON ((93.042537 27.0009051 ,93.0432987 27.0008669 ,93.0440283 27.0006375 ,93.0451011 27.0003316 ,93.0464315 26.9999874 ,93.0477619 26.9999874 ,93.0493927 26.999911 ,93.0502939 27.0001022 ,93.0511951 27.0002933 ,93.0521822 27.0002933 ,93.0533838 27.0004463 ,93.0543709 27.0006757 ,93.0551004 27.0010199 ,93.0558729 27.0008287 ,93.0566883 27.0004845 ,93.0574178 27.0001404 ,93.0579328 26.9996815 ,93.0594349 26.999108 ,93.0598641 26.9982667 ,93.0601645 26.9970813 ,93.0604649 26.9958194 ,93.0607224 26.9943281 ,93.0611086 26.9932574 ,93.0611086 26.9920337 ,93.0609369 26.9912689 ,93.0604649 26.9902746 ,93.0600358 26.9894715 ,93.0590915 26.9888214 ,93.0587053 26.9879419 ,93.0585766 26.9873682 ,93.0574071 26.9862114 ,93.0571389 26.9861062 ,93.056935 26.9860489 ,93.0567956 26.9857047 ,93.0567527 26.9854752 ,93.0565488 26.9854083 ,93.0565274 26.9852458 ,93.056302 26.9851023 ,93.0560553 26.985045 ,93.0559158 26.9849111 ,93.0556744 26.9849828 ,93.0556047 26.9850402 ,93.055492 26.9851549 ,93.0553794 26.9853366 ,93.055315 26.985523 ,93.0552614 26.9857716 ,93.055197 26.9860202 ,93.0550682 26.986154 ,93.054682 26.9861827 ,93.054446 26.9860202 ,93.0540704 26.985915 ,93.053298 26.9864122 ,93.0520105 26.9869476 ,93.0505943 26.9876742 ,93.0495107 26.9882 ,93.0494356 26.9883243 ,93.049221 26.9884772 ,93.0489849 26.9886589 ,93.0486094 26.9887736 ,93.0483413 26.9889839 ,93.0483413 26.9893186 ,93.0481267 26.9896723 ,93.0480945 26.9900069 ,93.0480838 26.9902363 ,93.0479979 26.9903511 ,93.047837 26.9906188 ,93.0477834 26.99081 ,93.047719 26.9910968 ,93.0475795 26.9913071 ,93.0475366 26.9915652 ,93.0472898 26.9919667 ,93.0470216 26.9921102 ,93.0468499 26.9923683 ,93.0467212 26.9925499 ,93.0465603 26.9927124 ,93.0463779 26.992808 ,93.0463457 26.9929132 ,93.0463564 26.9930853 ,93.0463564 26.9932765 ,93.0462599 26.993525 ,93.0461526 26.9938023 ,93.0460667 26.9939648 ,93.0457449 26.9941178 ,93.0455839 26.9942898 ,93.0454767 26.9945958 ,93.0452943 26.9948061 ,93.0450475 26.9950451 ,93.044908 26.9951311 ,93.0446613 26.9953223 ,93.0444896 26.9955326 ,93.0443287 26.9956856 ,93.0441355 26.9958768 ,93.0438566 26.9959819 ,93.0437493 26.9961253 ,93.0435776 26.9963452 ,93.0433416 26.9966033 ,93.0432772 26.9968041 ,93.0431914 26.9970622 ,93.0432343 26.9972821 ,93.0433309 26.9975115 ,93.0435133 26.9979799 ,93.0435884 26.9984197 ,93.0435884 26.9986873 ,93.0436098 26.9990219 ,93.0435455 26.9993852 ,93.0435025 26.9996337 ,93.0434489 26.9997771 ,93.0433523 26.9999779 ,93.043288 27.0001404 ,93.0432021 27.0003507 ,93.0431056 27.0005514 ,93.0428695 27.0006184 ,93.0427193 27.0006853 ,93.042537 27.0009051))'],
                    ['Darlong', 93.0003931, 26.9409963, 15, 'POLYGON ((92.996124 26.9371833 ,92.9963601 26.9374416 ,92.9966068 26.9377285 ,92.9967892 26.9380346 ,92.9970038 26.9383119 ,92.9971111 26.9385415 ,92.997036 26.9387997 ,92.9971862 26.9390102 ,92.9970467 26.9393354 ,92.9969394 26.9396606 ,92.9969394 26.9398805 ,92.996875 26.9401675 ,92.9969072 26.9404162 ,92.9971647 26.9406648 ,92.9974437 26.9407127 ,92.9975027 26.940837 ,92.9977709 26.9410952 ,92.9978567 26.9413057 ,92.997964 26.9416022 ,92.9982162 26.941913 ,92.998302 26.9421425 ,92.9983556 26.9424008 ,92.9983878 26.9427403 ,92.9985487 26.9430081 ,92.998656 26.9433524 ,92.9988116 26.9435246 ,92.9988974 26.9436441 ,92.9990101 26.9437494 ,92.99923 26.9438689 ,92.9994875 26.9439454 ,92.999686 26.9440745 ,92.9998201 26.9442515 ,92.999804 26.944481 ,92.9997772 26.9446412 ,92.9997665 26.9447488 ,92.999965 26.9450453 0,93.0000508 26.9453418 0,93.0003619 26.9456478 0,93.0003941 26.9459921 0,93.0003941 26.9462599 0,93.0006194 26.9464512 0,93.000952 26.946346 0,93.0011129 26.9460495 0,93.0013275 26.9458678 0,93.0016923 26.9456957 0,93.0019498 26.9455713 0,93.0022931 26.9453609 0,93.0025399 26.9451888 0,93.002969 26.9449401 0,93.0033123 26.9447106 0,93.00372 26.944481 0,93.003881 26.9443471 0,93.0042994 26.9441654 0,93.0045998 26.9439263 0,93.0052221 26.943582 0,93.0056834 26.9430751 0,93.0063057 26.9423864 0,93.0064881 26.942176 0,93.0064988 26.9419465 0,93.0062521 26.9416882 0,93.0059731 26.9414874 0,93.0053937 26.9411622 0,93.0047071 26.9409805 0,93.0039883 26.9409996 0,93.003484 26.9409518 0,93.003087 26.9408083 0,93.0027759 26.940464 0,93.0025184 26.9403205 0,93.0021322 26.9400336 0,93.002336 26.939498 0,93.0022609 26.9391154 0,93.0020463 26.938838 0,93.0015743 26.9385798 0,93.0012202 26.9383598 0,93.0009735 26.9379007 0,93.0008125 26.9374607 0,93.0008125 26.9371833 0,93.0009413 26.9368868 0,93.000834 26.936619 0,93.0006409 26.9364181 0,93.000201 26.9364564 ,92.99945 26.9365616 ,92.9989135 26.9365712 ,92.9981518 26.9367529 ,92.9975939 26.9368198 ,92.9970038 26.9369251 ,92.9965746 26.937059 ,92.996124 26.9371833))']


]

var lay = [];
function View(id) {

    for (var x = 0; x < lay.length; x++) {
        lay[x].setMap(null);
    }

    var beach = MarkerOfPlants[id];
    map.setZoom(beach[3]);
    map.panTo(new google.maps.LatLng(beach[2], beach[1]));
    var sl = createPolygon(getLatLongArr(beach[4]));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#F0B27A', fillOpacity: 0, clickable: !1 });
    lay.push(sl);

}

$(document).on('change', '#ddlPlantName', function (e) {
    e.preventDefault();
    $(".ui-dialog-content").dialog("close");
    var PlantNmae = $('#ddlPlantName option:selected').val();
    var PLANTNAME_BND = PlantNmae.split('/');

    PLANTNAME_BND = PLANTNAME_BND.concat(PlantNmae);

    for (var x = 0; x < zoomIIE.length; x++) {
        zoomIIE[x].setMap(null);
    }

    setPlantMarkers(map);
    $("#DivPlantResult").dialog(opt).dialog("open");
    map.setZoom(5);
    map.panTo(new google.maps.LatLng(26.973599, 93.030385));

});


function setPlantMarkers(map) {
    debugger;
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
    var marker, i;
    for (i = 0; i < MarkerOfPlants.length; i++) {
        var beach = MarkerOfPlants[i];

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(beach[2], beach[1]),
            icon: mm,
            map: map
        });


        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.Location = beach[1],
          marker.polys = beach[4],
        google.maps.event.addListener(marker, 'click', function () {
            //for (var pp = 0; pp < PlantMarkers.length; pp++) {
            //    PlantMarkers[pp].setMap(null);
            //}
            map.setZoom(this.zaixs);
            map.panTo(new google.maps.LatLng(this.y, this.x));
            var sl = createPolygon(getLatLongArr(this.polys));
            sl.setOptions({ strokeWeight: 5, strokeColor: '#F0B27A', fillOpacity: 0, clickable: !1 });
        });
        PlantMarkers.push(marker);
    }
    function zoomTo(zoomFluid) {

        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}

//Vaidya
var VaidyaMarkers = [];
var MarkerOfVaidya = [
                    ['Seijosa', 93.0459441, 26.9985374, 15, 'POLYGON ((93.042537 27.0009051 ,93.0432987 27.0008669 ,93.0440283 27.0006375 ,93.0451011 27.0003316 ,93.0464315 26.9999874 ,93.0477619 26.9999874 ,93.0493927 26.999911 ,93.0502939 27.0001022 ,93.0511951 27.0002933 ,93.0521822 27.0002933 ,93.0533838 27.0004463 ,93.0543709 27.0006757 ,93.0551004 27.0010199 ,93.0558729 27.0008287 ,93.0566883 27.0004845 ,93.0574178 27.0001404 ,93.0579328 26.9996815 ,93.0594349 26.999108 ,93.0598641 26.9982667 ,93.0601645 26.9970813 ,93.0604649 26.9958194 ,93.0607224 26.9943281 ,93.0611086 26.9932574 ,93.0611086 26.9920337 ,93.0609369 26.9912689 ,93.0604649 26.9902746 ,93.0600358 26.9894715 ,93.0590915 26.9888214 ,93.0587053 26.9879419 ,93.0585766 26.9873682 ,93.0574071 26.9862114 ,93.0571389 26.9861062 ,93.056935 26.9860489 ,93.0567956 26.9857047 ,93.0567527 26.9854752 ,93.0565488 26.9854083 ,93.0565274 26.9852458 ,93.056302 26.9851023 ,93.0560553 26.985045 ,93.0559158 26.9849111 ,93.0556744 26.9849828 ,93.0556047 26.9850402 ,93.055492 26.9851549 ,93.0553794 26.9853366 ,93.055315 26.985523 ,93.0552614 26.9857716 ,93.055197 26.9860202 ,93.0550682 26.986154 ,93.054682 26.9861827 ,93.054446 26.9860202 ,93.0540704 26.985915 ,93.053298 26.9864122 ,93.0520105 26.9869476 ,93.0505943 26.9876742 ,93.0495107 26.9882 ,93.0494356 26.9883243 ,93.049221 26.9884772 ,93.0489849 26.9886589 ,93.0486094 26.9887736 ,93.0483413 26.9889839 ,93.0483413 26.9893186 ,93.0481267 26.9896723 ,93.0480945 26.9900069 ,93.0480838 26.9902363 ,93.0479979 26.9903511 ,93.047837 26.9906188 ,93.0477834 26.99081 ,93.047719 26.9910968 ,93.0475795 26.9913071 ,93.0475366 26.9915652 ,93.0472898 26.9919667 ,93.0470216 26.9921102 ,93.0468499 26.9923683 ,93.0467212 26.9925499 ,93.0465603 26.9927124 ,93.0463779 26.992808 ,93.0463457 26.9929132 ,93.0463564 26.9930853 ,93.0463564 26.9932765 ,93.0462599 26.993525 ,93.0461526 26.9938023 ,93.0460667 26.9939648 ,93.0457449 26.9941178 ,93.0455839 26.9942898 ,93.0454767 26.9945958 ,93.0452943 26.9948061 ,93.0450475 26.9950451 ,93.044908 26.9951311 ,93.0446613 26.9953223 ,93.0444896 26.9955326 ,93.0443287 26.9956856 ,93.0441355 26.9958768 ,93.0438566 26.9959819 ,93.0437493 26.9961253 ,93.0435776 26.9963452 ,93.0433416 26.9966033 ,93.0432772 26.9968041 ,93.0431914 26.9970622 ,93.0432343 26.9972821 ,93.0433309 26.9975115 ,93.0435133 26.9979799 ,93.0435884 26.9984197 ,93.0435884 26.9986873 ,93.0436098 26.9990219 ,93.0435455 26.9993852 ,93.0435025 26.9996337 ,93.0434489 26.9997771 ,93.0433523 26.9999779 ,93.043288 27.0001404 ,93.0432021 27.0003507 ,93.0431056 27.0005514 ,93.0428695 27.0006184 ,93.0427193 27.0006853 ,93.042537 27.0009051))'],
                    ['Darlong', 93.0003931, 26.9409963, 15, 'POLYGON ((92.996124 26.9371833 ,92.9963601 26.9374416 ,92.9966068 26.9377285 ,92.9967892 26.9380346 ,92.9970038 26.9383119 ,92.9971111 26.9385415 ,92.997036 26.9387997 ,92.9971862 26.9390102 ,92.9970467 26.9393354 ,92.9969394 26.9396606 ,92.9969394 26.9398805 ,92.996875 26.9401675 ,92.9969072 26.9404162 ,92.9971647 26.9406648 ,92.9974437 26.9407127 ,92.9975027 26.940837 ,92.9977709 26.9410952 ,92.9978567 26.9413057 ,92.997964 26.9416022 ,92.9982162 26.941913 ,92.998302 26.9421425 ,92.9983556 26.9424008 ,92.9983878 26.9427403 ,92.9985487 26.9430081 ,92.998656 26.9433524 ,92.9988116 26.9435246 ,92.9988974 26.9436441 ,92.9990101 26.9437494 ,92.99923 26.9438689 ,92.9994875 26.9439454 ,92.999686 26.9440745 ,92.9998201 26.9442515 ,92.999804 26.944481 ,92.9997772 26.9446412 ,92.9997665 26.9447488 ,92.999965 26.9450453 0,93.0000508 26.9453418 0,93.0003619 26.9456478 0,93.0003941 26.9459921 0,93.0003941 26.9462599 0,93.0006194 26.9464512 0,93.000952 26.946346 0,93.0011129 26.9460495 0,93.0013275 26.9458678 0,93.0016923 26.9456957 0,93.0019498 26.9455713 0,93.0022931 26.9453609 0,93.0025399 26.9451888 0,93.002969 26.9449401 0,93.0033123 26.9447106 0,93.00372 26.944481 0,93.003881 26.9443471 0,93.0042994 26.9441654 0,93.0045998 26.9439263 0,93.0052221 26.943582 0,93.0056834 26.9430751 0,93.0063057 26.9423864 0,93.0064881 26.942176 0,93.0064988 26.9419465 0,93.0062521 26.9416882 0,93.0059731 26.9414874 0,93.0053937 26.9411622 0,93.0047071 26.9409805 0,93.0039883 26.9409996 0,93.003484 26.9409518 0,93.003087 26.9408083 0,93.0027759 26.940464 0,93.0025184 26.9403205 0,93.0021322 26.9400336 0,93.002336 26.939498 0,93.0022609 26.9391154 0,93.0020463 26.938838 0,93.0015743 26.9385798 0,93.0012202 26.9383598 0,93.0009735 26.9379007 0,93.0008125 26.9374607 0,93.0008125 26.9371833 0,93.0009413 26.9368868 0,93.000834 26.936619 0,93.0006409 26.9364181 0,93.000201 26.9364564 ,92.99945 26.9365616 ,92.9989135 26.9365712 ,92.9981518 26.9367529 ,92.9975939 26.9368198 ,92.9970038 26.9369251 ,92.9965746 26.937059 ,92.996124 26.9371833))']


]

var layVaidya = [];
function ViewVaidya(id) {

    for (var x = 0; x < layVaidya.length; x++) {
        layVaidya[x].setMap(null);
    }

    var beach = MarkerOfVaidya[id];
    map.setZoom(beach[3]);
    map.panTo(new google.maps.LatLng(beach[2], beach[1]));
    var sl = createPolygon(getLatLongArr(beach[4]));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#F0B27A', fillOpacity: 0, clickable: !1 });
    layVaidya.push(sl);

}



$(document).on('change', '#chkVaidya', function (e) {
    e.preventDefault();
    $(".ui-dialog-content").dialog("close");
     
    if (this.checked) {

        setVaidyaMarkers(map);
        $("#DivVaidya").dialog(opt).dialog("open");
    }
    //map.setZoom(5);
    //map.panTo(new google.maps.LatLng(26.973599, 93.030385));

});

function setVaidyaMarkers(map) {
    debugger;
    var mm = "https://maps.google.com/intl/en_us/mapfiles/ms/micons/orange-dot.png";
    var marker, i;
    for (i = 0; i < MarkerOfVaidya.length; i++) {
        var beach = MarkerOfVaidya[i];

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(beach[2], beach[1]),
            icon: mm,
            map: map
        });


        marker.zaixs = beach[3],
        marker.x = beach[1],
        marker.y = beach[2],
         marker.Location = beach[1],
          marker.polys = beach[4],
        google.maps.event.addListener(marker, 'click', function () {
            //for (var pp = 0; pp < PlantMarkers.length; pp++) {
            //    PlantMarkers[pp].setMap(null);
            //}
            map.setZoom(this.zaixs);
            map.panTo(new google.maps.LatLng(this.y, this.x));
            var sl = createPolygon(getLatLongArr(this.polys));
            sl.setOptions({ strokeWeight: 5, fillcolor: 'Red', strokeColor: '#F0B27A', fillOpacity: 0.5, clickable: !1 });
        });
        VaidyaMarkers.push(marker);
    }
    function zoomTo(zoomFluid) {

        if (zoomFluid == 7) return 0;
        else {
            zoomFluid++;
            map.setZoom(zoomFluid);
            setTimeout("zoomTo()", 500);
        }
    }
}



//END

function getcountry() {

    debugger;
    ajaxReq('do_it.ashx', 'ALLCOUNTRY', {}, function (resp) { BindAllCOUNTRY(resp) }, true);
}


function BindAllCOUNTRY(resp) {

    $("#ddlCountry").empty();
    if (resp.status === true) {
        var Country = $.map(resp.data, function (el) { return el; })
        $('#ddlCountry').append(new Option('--Select Country--', ''));
        $('#ddlState').append(new Option('--Select State--', ''));
        $('#ddldistrict').append(new Option('--Select District--', ''));
        $('#ddlTehsil').append(new Option('--Select Taluk--', ''));
        $('#ddlVillage').append(new Option('--Select Area--', ''));
        for (i = 0; i < Country.length; i++) {
            if (i % 5 === 0) {

                $("#ddlCountry").append(new Option(Country[i + 1], Country[i] + '/' + Country[i + 2] + '/' + Country[i + 3] + '/' + Country[i + 4]));

            }
        }
    }
    else {
        $("#ddlCountry").append(new Option("Data Not Found"));
    }
}

$(document).on('change', '#ddlCountry', function (e) {
    e.preventDefault();
    var Country = $('#ddlCountry option:selected').val();
    var COUNTRY_BND = Country.split('/');

    COUNTRY_BND = COUNTRY_BND.concat(Country);
    getAllState(COUNTRY_BND[0]);
    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(COUNTRY_BND[1]));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#0242BD', fillOpacity: 0, clickable: !1 });
    zoomDistrict.push(sl);
    map.setZoom(4);
    map.panTo(new google.maps.LatLng(COUNTRY_BND[3], COUNTRY_BND[2]));
});

function getAllState(CountryRecno) {

    var Country = CountryRecno;
    ajaxReq('do_it.ashx', 'STATE', { "location": Country }, function (resp) { BindAllSTATE(resp) }, true);

}
function BindAllSTATE(resp) {
    $("#ddlState").empty();
    if (resp.status === true) {
        var State = $.map(resp.data, function (el) { return el; })
        $('#ddlState').append(new Option('--Select State--', ''));

        for (i = 0; i < State.length; i++) {

            for (i = 0; i < State.length; i++) {
                if (i % 5 === 0) {
                    $("#ddlState").append(new Option(State[i + 1], State[i] + '/' + State[i + 2] + '/' + State[i + 3] + '/' + State[i + 4]));

                }
            }
        }
    }
    else {
        $('#ddlState').append(new Option('--No Datat Found--', ''));

    }

}
$(document).on('change', '#ddlState', function (e) {
    e.preventDefault();

    var State = $('#ddlState option:selected').val();
    var DISTRICT_BND = State.split('/');

    DISTRICT_BND = DISTRICT_BND.concat(State);
    //var IA = State.split('/');
    //var IIEE = IA[0];
    //var IIE_BND = State.split('/');
    getAllDISTRICT(DISTRICT_BND[0]);
    //IIE_BND = IIE_BND.concat(IIE);
    //All Layer Create function Date 18/jan/2017
    //IIE_RECNO.push(IIEE);


    for (var x = 0; x < zoomIIE.length; x++) {
        zoomIIE[x].setMap(null);
    }
    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(DISTRICT_BND[1]));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#F70F00', fillOpacity: 0, clickable: !1 });
    zoomIIE.push(sl);
    map.setZoom(7);
    map.panTo(new google.maps.LatLng(DISTRICT_BND[3], DISTRICT_BND[2]));
});

function getAllDISTRICT(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'ALLDISTRICT', { "location": city }, function (resp) { BindAllDISTRICT(resp) }, true);

}

function BindAllDISTRICT(resp) {
    $("#ddldistrict").empty();
    if (resp.status === true) {

        var DISTRICT = $.map(resp.data, function (el) { return el; })

        $('#ddldistrict').append(new Option('--Select District--', ''));

        for (i = 0; i < DISTRICT.length; i++) {
            if (i % 5 === 0) {
                $("#ddldistrict").append(new Option(DISTRICT[i + 1], DISTRICT[i] + '/' + DISTRICT[i + 2] + '/' + DISTRICT[i + 3] + '/' + DISTRICT[i + 4]));
            }
        }
    }
}
$(document).on('change', '#ddldistrict', function (e) {
    e.preventDefault();
    var District = $('#ddldistrict option:selected').val();

    var DISTRICT_BND = District.split('/');
    getAllTaluk(DISTRICT_BND[0]);
    DISTRICT_BND = DISTRICT_BND.concat(District);
    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(DISTRICT_BND[1]));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#0242BD', fillOpacity: 0, clickable: !1 });
    zoomDistrict.push(sl);
    map.setZoom(10);
    map.panTo(new google.maps.LatLng(DISTRICT_BND[3], DISTRICT_BND[2]));
});

function getAllTaluk(city_name) {
    debugger;
    var city = city_name;
    ajaxReq('do_it.ashx', 'ALLTALUKA', { "location": city }, function (resp) { BindAllTALUKA(resp) }, true);

}

function BindAllTALUKA(resp) {
    $("#ddlTehsil").empty();
    if (resp.status === true) {

        var TEHSIL = $.map(resp.data, function (el) { return el; })

        $('#ddlTehsil').append(new Option('--Select Tehsil--', ''));

        for (i = 0; i < TEHSIL.length; i++) {
            if (i % 5 === 0) {
                $("#ddlTehsil").append(new Option(TEHSIL[i + 1], TEHSIL[i] + '/' + TEHSIL[i + 2] + '/' + TEHSIL[i + 3] + '/' + TEHSIL[i + 4]));
            }
        }
    }
}
$(document).on('change', '#ddlTehsil', function (e) {
    e.preventDefault();
    var Tehsil = $('#ddlTehsil option:selected').val();

    var TEHSIL_BND = Tehsil.split('/');
    getAllArea(TEHSIL_BND[0]);
    TEHSIL_BND = TEHSIL_BND.concat(Tehsil);
    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(TEHSIL_BND[1]));
    sl.setOptions({ strokeWeight: 5, fillcolor: 'Red', strokeColor: '#0242BD', fillOpacity: 0.2, clickable: !1 });
    zoomDistrict.push(sl);
    map.setZoom(10);
    map.panTo(new google.maps.LatLng(TEHSIL_BND[3], TEHSIL_BND[2]));
});

function getAllArea(city_name) {
    debugger;
    var city = city_name;
    ajaxReq('do_it.ashx', 'ALLAREA', { "location": city }, function (resp) { BindAllAREA(resp) }, true);

}

function BindAllAREA(resp) {
    $("#ddlVillage").empty();
    if (resp.status === true) {

        var AREA = $.map(resp.data, function (el) { return el; })

        $('#ddlVillage').append(new Option('--Select area--', ''));

        for (i = 0; i < AREA.length; i++) {
            if (i % 5 === 0) {
                $("#ddlVillage").append(new Option(AREA[i + 1], AREA[i] + '/' + AREA[i + 2] + '/' + AREA[i + 3] + '/' + AREA[i + 4]));
            }
        }
    }
}
$(document).on('change', '#ddlVillage', function (e) {
    e.preventDefault();
    $(".ui-dialog-content").dialog("close");
    var Tehsil = $('#ddlVillage option:selected').val();
    var Area_Name = $('#ddlVillage option:selected').text();
    var TEHSIL_BND = Tehsil.split('/');
    // getAllArea(TEHSIL_BND[0]);
    TEHSIL_BND = TEHSIL_BND.concat(Tehsil);
    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(TEHSIL_BND[1]));
    sl.setOptions({ strokeWeight: 5, fillcolor: 'Red', strokeColor: '#0242BD', fillOpacity: 0.5, clickable: !1 });
    zoomDistrict.push(sl);
    map.setZoom(13);
    map.panTo(new google.maps.LatLng(TEHSIL_BND[3], TEHSIL_BND[2]));
    var optss = {
        resizable: false,
        autoOpen: false,
        show: 'blind',
        hide: 'blind',
        width: 700,
        top: 200,
        position: { my: "right center", at: "right center", of: window }
    };
    $("#DivAreawise").dialog(optss).dialog("open");
    showAreaInformation(Area_Name);
});

//ADDED BY SACHIN 4 DEC 2017

function showAreaInformation(Area_name) {
    // debugger;
    if (Area_name === 'Seijosa') {
        $('#iieInfo_name').empty();
        $('#iieInfo_TotalArea').empty();
        var tbl = $('#iieInfo_LandUse').empty();
        $('#iieInfo_Rate').empty();
        var VALS = 0;
        $('#iieInfo_name').append(Area_name);
        $('#iieInfo_TotalArea').append('Total Land Acquired is 540 Acres Approx');
        var tr = '<tr>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; text-align: center; font-size: 11px;"><div style="width: 40px; color: #4679bd; font-weight: bold; margin-top: 2px;">S.no.</div></td>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; padding-left: 10px; font-size: 11px;"><div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Land Use</div></td>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; text-align: center; font-size: 11px;"><div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Area(In Acres) Earmarked</div></td></tr>';
        tbl.append(tr);
        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + (parseInt(VALS) + 1) + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">Total Land Acquired </div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">540 Acres Approx</div></td></tr>');
        VALS++;
        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + (parseInt(VALS) + 1) + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">Forest area </div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">510 Acres Approx</div></td></tr>');
        VALS++;
        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + (parseInt(VALS) + 1) + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">Disputed Area </div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">30 Acres Approx</div></td></tr>');

        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + '' + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;color: #4679bd;">Total</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;"> 540 acres</div></td></tr>');
        $("#iieInfo_Location").empty();

        $("#iieInfo_Location").append('<li>Airport: Salonibari Airport  Airport, Distance -39 Km.</li>')
        $("#iieInfo_Location").append('<li> It is located 52 KM towards South from District head quarters Seppa. It is a Tehsil head quarter.</li>')
        $("#iieInfo_Location").append('<li>There is no railway station near to Seijosa in less than 10 km. How ever	Guwahati Rail Way Station is major railway station 170 KM near to Seijosa </li>')

        $("#iieInfo_majorUnits").empty();

        $("#iieInfo_majorUnits").append('<li>Usipak</li>')
        $("#iieInfo_majorUnits").append('<li> Latumoni</li>')


        $("#diviieinfor").show();
        $("#Plotinfo").show();

        $("#Plotinfo").dialog(opt).dialog("open");
    }
    else if (Area_name === 'Darlong') {
        $('#iieInfo_name').empty();
        $('#iieInfo_TotalArea').empty();
        var tbl = $('#iieInfo_LandUse').empty();
        $('#iieInfo_Rate').empty();
        var VALS = 0;
        $('#iieInfo_name').append(Area_name);
        $('#iieInfo_TotalArea').append('Total Land Acquired is 430 Acres Approx');
        var tr = '<tr>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; text-align: center; font-size: 11px;"><div style="width: 40px; color: #4679bd; font-weight: bold; margin-top: 2px;">S.no.</div></td>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; padding-left: 10px; font-size: 11px;"><div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Land Use</div></td>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; text-align: center; font-size: 11px;"><div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Area(In Acres) Earmarked</div></td></tr>';
        tbl.append(tr);
        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + (parseInt(VALS) + 1) + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">Total Land Acquired </div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">430 Acres Approx</div></td></tr>');
        VALS++;
        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + (parseInt(VALS) + 1) + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">Forest area </div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">430 Acres Approx</div></td></tr>');
        VALS++;
        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + (parseInt(VALS) + 1) + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">Disputed Area </div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">0 Acres Approx</div></td></tr>');

        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + '' + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;color: #4679bd;">Total</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;"> 430 acres</div></td></tr>');
        $("#iieInfo_Location").empty();

        $("#iieInfo_Location").append('<li>Airport: Salonibari Airport  Airport, Distance -75 Km.</li>')
        $("#iieInfo_Location").append('<li>It is located 55 KM towards South from District head quarters Seppa. 3 KM from Seijosa. 81 KM from State capital Itanagar</li>')
        $("#iieInfo_Location").append('<li>There is no railway station near to Darlong in less than 10 km. How ever	Guwahati Rail Way Station is major railway station 168 KM near to Darlong </li>')

        $("#iieInfo_majorUnits").empty();

        $("#iieInfo_majorUnits").append('<li>Usipak</li>')
        $("#iieInfo_majorUnits").append('<li> Latumoni</li>')


        $("#diviieinfor").show();
        $("#Plotinfo").show();

        $("#Plotinfo").dialog(opt).dialog("open");

    }
}

//


function getAllIIECompanywise(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'IIECompanywise', { "location": city }, function (resp) { BindAllIIECompanywise(resp) }, true);

}


function BindAllIIECompanywise(resp) {
    $("#ddlIIECompanywise").empty();
    if (resp.status === true) {
        var IIECompanywise = $.map(resp.data, function (el) { return el; })
        $('#ddlIIECompanywise').append(new Option('--Select Industrial Area--', ''));
        for (i = 0; i < IIECompanywise.length; i++) {
            for (i = 0; i < IIECompanywise.length; i++) {
                if (i % 5 === 0) {

                    $("#ddlIIECompanywise").append(new Option(IIECompanywise[i + 1], IIECompanywise[i] + '/' + IIECompanywise[i + 2] + '/' + IIECompanywise[i + 3] + '/' + IIECompanywise[i + 4]));
                }
            }
        }
    }
    else {
        $('#ddlIIECompanywise').append(new Option('--No Data Found--', ''));
    }
}

$(document).on('change', '#ddlIIECompanywise', function (e) {
    e.preventDefault();
    var IIEE = $('#ddlIIECompanywise option:selected').text();
    var IIECompanywise = $('#ddlIIECompanywise option:selected').val();
    var IIECompanywise = IIECompanywise.split('/');
    var Company = IIECompanywise[0];
    $("#ddldistrict").empty();
    getCompanies(Company);


});
$(document).on('click', '#btnCompanywise', function () {
    var plot = $('#ddlCompany option:selected').val();
    var IIEEE = $('#ddlIIECompanywise option:selected').val();
    var IA = IIEEE.split('/');
    var IIEE = IA[0];
    var PLOT_BND = plot.split('/');
    PLOT_BND = PLOT_BND.concat(plot);


    getPlotcreate(IIEE);
    getroadcreate(IIEE);
    getutilitycreate(IIEE);
    getPublicPurposecreate(IIEE);
    getCommanareacreate(IIEE);
    getOthercreate(IIEE);
    getWaterheadtankcreate(IIEE);
    getparkingcreate(IIEE);
    getNalacreate(IIEE);
    getPoloicestationcreate(IIEE);
    getfirestationcreate(IIEE);
    getlabelcreate(IIEE);
    getvegcreate(IIEE);
    getbndcreate(IIEE);
    getsectorcreate(IIEE);
    getElinecreate(IIEE);
    getEPolecreate(IIEE);
    getWatercreate(IIEE);
    getRivercreate(IIEE);
    getlamppostcreate(IIEE);
    getRailwaycreate(IIEE);
    getmanholecreate(IIEE);
    getfootpathcreate(IIEE);
    getBridgecreate(IIEE);
    getencroachmentcreate(IIEE);
    for (var x = 0; x < ZoomPlot.length; x++) {
        ZoomPlot[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(PLOT_BND[1]));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#4286f4', fillOpacity: 0, clickable: !1 });
    ZoomPlot.push(sl);
    map.setZoom(19);
    map.panTo(new google.maps.LatLng(PLOT_BND[3], PLOT_BND[2]));
});

function getAllIIE(District) {


    ajaxReq('do_it.ashx', 'IIE', { "location": District }, function (resp) { BindAllIIE(resp) }, true);

}
function BindAllIIE(resp) {
    $("#ddlIIE").empty();
    $("#ddlSector").empty();
    $("#ddlPlot").empty();
    if (resp.status === true) {
        var IIE = $.map(resp.data, function (el) { return el; })
        $('#ddlIIE').append(new Option('--Select Industrial Area--', ''));
        for (i = 0; i < IIE.length; i++) {

            for (i = 0; i < IIE.length; i++) {
                if (i % 5 === 0) {
                    $("#ddlIIE").append(new Option(IIE[i + 1], IIE[i] + '/' + IIE[i + 2] + '/' + IIE[i + 3] + '/' + IIE[i + 4]));

                }
            }
        }
    }
    else {
        $('#ddlIIE').append(new Option('--No Datat Found--', ''));

    }

}
$(document).on('change', '#ddlIIE', function (e) {
    e.preventDefault();
    // var IIEE = $('#ddlIIE option:selected').text();
    var IIE = $('#ddlIIE option:selected').val();
    var IA = IIE.split('/');
    var IIEE = IA[0];
    var IIE_BND = IIE.split('/');
    getAllSector(IIE_BND[0]);
    IIE_BND = IIE_BND.concat(IIE);
    //All Layer Create function Date 18/jan/2017
    IIE_RECNO.push(IIEE);
    getPlotcreate(IIEE);
    getroadcreate(IIEE);
    getutilitycreate(IIEE);
    getPublicPurposecreate(IIEE);
    getCommanareacreate(IIEE);
    getOthercreate(IIEE);
    getWaterheadtankcreate(IIEE);
    getparkingcreate(IIEE);
    getNalacreate(IIEE);
    getPoloicestationcreate(IIEE);
    getfirestationcreate(IIEE);
    getlabelcreate(IIEE);
    getvegcreate(IIEE);
    getbndcreate(IIEE);
    getsectorcreate(IIEE);
    getElinecreate(IIEE);
    getEPolecreate(IIEE);
    getWatercreate(IIEE);
    getRivercreate(IIEE);
    getlamppostcreate(IIEE);
    getRailwaycreate(IIEE);
    getmanholecreate(IIEE);
    getfootpathcreate(IIEE);
    getBridgecreate(IIEE);
    getencroachmentcreate(IIEE);
    getPlotcreate(IIEE);

    for (var x = 0; x < zoomIIE.length; x++) {
        zoomIIE[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(IIE_BND[1]));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#F0B27A', fillOpacity: 0, clickable: !1 });
    zoomIIE.push(sl);
    map.setZoom(15);
    map.panTo(new google.maps.LatLng(IIE_BND[3], IIE_BND[2]));
});

function getAllSector(IIE) {

    // var city = city_name;
    ajaxReq('do_it.ashx', 'ALLSECTOR', { "location": IIE }, function (resp) { BindAllSECTOR(resp) }, true);

}
function BindAllSECTOR(resp) {
    $("#ddlSector").empty();
    $("#ddlPlot").empty();
    if (resp.status === true) {
        var Sector = $.map(resp.data, function (el) { return el; })

        $('#ddlSector').append(new Option('--Select Sector--', ''));

        for (i = 0; i < Sector.length; i++) {
            if (i % 5 === 0) {
                $("#ddlSector").append(new Option(Sector[i + 1], Sector[i] + '/' + Sector[i + 2] + '/' + Sector[i + 3] + '/' + Sector[i + 4]));
            }
        }
    }
    else {
        alert('Dear User,\n this IIE plot details are not mapped with GIS system.');
        $('#ddlSector').append(new Option('--No Data Found--', ''));

    }
}



$(document).on('change', '#ddlSector', function (e) {
    e.preventDefault();

    var Sector = $('#ddlSector option:selected').val();
    var IIE_Sector = Sector.split('/');
    getAllPLOT(IIE_Sector[0]);
});
function getAllPLOT(Sector) {


    ajaxReq('do_it.ashx', 'ALLPLOT', { "location": Sector }, function (resp) { BindAllPLOT(resp) }, true);

}
function BindAllPLOT(resp) {
    $("#ddlPlot").empty();
    if (resp.status === true) {
        var ALLplot = $.map(resp.data, function (el) { return el; })

        $('#ddlPlot').append(new Option('--Select Plot--', ''));

        for (i = 0; i < ALLplot.length; i++) {
            if (i % 5 === 0) {
                $("#ddlPlot").append(new Option(ALLplot[i + 1], ALLplot[i] + '/' + ALLplot[i + 2] + '/' + ALLplot[i + 3] + '/' + ALLplot[i + 4]));
            }
        }

    }
}


$(document).on('change', '#ddlPlot', function (e) {
    e.preventDefault();
    var Plot = $('#ddlPlot option:selected').val();
    var PLOT_BND = Plot.split('/');
    PLOT_BND = PLOT_BND.concat(Plot);
    for (var x = 0; x < ZoomPlot.length; x++) {
        ZoomPlot[x].setMap(null);
    }
    var sl = createPolygon(getLatLongArr(PLOT_BND[1]));
    sl.setOptions({ strokeWeight: 5, strokeColor: '#007DC5', fillOpacity: 0, clickable: !1 });
    ZoomPlot.push(sl);
    map.setZoom(19);
    map.panTo(new google.maps.LatLng(PLOT_BND[3], PLOT_BND[2]));

});


function getBridgecreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getBridgecreate', { "location": city }, function (resp) { setBridgecreate(resp) }, true);
}

function setBridgecreate(resp) {
    ddlPlot
    if (resp.status === true) {
        if ($("#chkBridge").prop('checked') == true) {
            var BRG = $.map(resp.data, function (el) { return el; })


            for (i = 0; i < BRG.length; i++) {
                var ln = createPolygon(getLatLongArr(BRG[i]));
                ln.setOptions({ fillColor: '#85A6D3', strokeColor: '#6E6E6E', fillOpacity: 1 });
                maplayer.push(ln);
                //FOR LAYER'S ON/OFF
                BRG_LAYER.push(ln);

            }
        }
    }
}
$(document).on('change', '#chkBridge', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getBridgecreate(beach);

        }
    }
    else {
        for (i = 0; i < BRG_LAYER.length; i++) {
            BRG_LAYER[i].setMap(null);
        }

    }
});

function getfootpathcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getfootpathcreate', { "location": city }, function (resp) { setftpcreate(resp) }, true);
}

function setftpcreate(resp) {
    if (resp.status === true) {
        if ($("#chkFootPath").prop('checked') == true) {
            var FTP = $.map(resp.data, function (el) { return el; })


            for (i = 0; i < FTP.length; i++) {
                var ln = createPolygon(getLatLongArr(FTP[i]));
                ln.setOptions({ fillColor: '#FFFFFF', strokeColor: '#6E6E6E', fillOpacity: 1 });
                maplayer.push(ln);
                //FOR LAYER'S ON/OFF
                FTP_LAYER.push(ln);

            }
        }
    }
}
$(document).on('change', '#chkFootPath', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getfootpathcreate(beach);

        }
    }
    else {
        for (i = 0; i < FTP_LAYER.length; i++) {
            FTP_LAYER[i].setMap(null);
        }

    }
});

function getgascreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getgascreate', { "location": city }, function (resp) { setgascreate(resp) }, true);
}
function setgascreate(resp) {
    if (resp.status === true) {
        if ($("#chkgas").prop('checked') == true) {
            var gas = $.map(resp.data, function (el) { return el; })


            //var manhole = data[city].MANHOLE;
            for (i = 0; i < gas.length; i++) {

                var pt = createPoint(getLatLongArr(gas[i])[0]);
                pt.setIcon('images/manhole.png');
                maplayer.push(pt);
                GAS_LAYER.push(pt);
            }
        }
    }
}
$(document).on('change', '#chkgas', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getgascreate(beach);

        }
    }
    else {
        for (i = 0; i < GAS_LAYER.length; i++) {
            GAS_LAYER[i].setMap(null);
        }

    }
});
function getmanholecreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getmanholecreate', { "location": city }, function (resp) { setmanholecreate(resp) }, true);
}

function setmanholecreate(resp) {
    if (resp.status === true) {
        if ($("#chkManHoles").prop('checked') == true) {
            var manhole = $.map(resp.data, function (el) { return el; })


            //var manhole = data[city].MANHOLE;
            for (i = 0; i < manhole.length; i++) {

                var pt = createPoint(getLatLongArr(manhole[i])[0]);
                pt.setIcon('images/manhole.png');
                maplayer.push(pt);
                MANHOLE_LAYER.push(pt);
            }
        }
    }
}
$(document).on('change', '#chkManHoles', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getmanholecreate(beach);

        }
    }
    else {
        for (i = 0; i < MANHOLE_LAYER.length; i++) {
            MANHOLE_LAYER[i].setMap(null);
        }

    }
});
function getRailwaycreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getRailwaycreate', { "location": city }, function (resp) { setRailwaycreate(resp) }, true);
}
function setRailwaycreate(resp) {
    if (resp.status === true) {
        if ($("#chkRailwayTrack").prop('checked') == true) {
            var RAilWay = $.map(resp.data, function (el) { return el; })

            // var RAilWay = data[city].RAILWAY;
            for (i = 0; i < RAilWay.length; i++) {
                var ln = createLine(getLatLongArr(RAilWay[i]));

                var lineSymbol = {
                    path: 'M 0,-1 0,1',
                    strokeOpacity: 1,
                    strokeColor: '#000000',
                    scale: 4
                };

                ln.setOptions({
                    strokeOpacity: 0,
                    icons: [{
                        icon: lineSymbol,
                        offset: '0',
                        repeat: '20px'
                    }]
                });
                maplayer.push(ln);
                RAILWAY_LAYER.push(ln);
            }
        }
    }
}
$(document).on('change', '#chkRailwayTrack', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getRailwaycreate(beach);

        }
    }
    else {
        for (i = 0; i < RAILWAY_LAYER.length; i++) {
            RAILWAY_LAYER[i].setMap(null);
        }

    }
});
function getlamppostcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getlamppostcreate', { "location": city }, function (resp) { setlamppostcreate(resp) }, true);
}
function setlamppostcreate(resp) {
    if (resp.status === true) {
        if ($("#chkLampPost").prop('checked') == true) {
            var lamp_post = $.map(resp.data, function (el) { return el; })


            //var lamp_post = data[city].LAMPPOST;
            for (i = 0; i < lamp_post.length; i++) {
                var pt = createPoint(getLatLongArr(lamp_post[i])[0]);
                pt.setIcon('images/lamp.png');
                maplayer.push(pt);
                LAMPPOST_LAYER.push(pt);
            }
        }
    }
}
$(document).on('change', '#chkLampPost', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getlamppostcreate(beach);

        }
    }
    else {
        for (i = 0; i < LAMPPOST_LAYER.length; i++) {
            LAMPPOST_LAYER[i].setMap(null);
        }

    }
});
function getRivercreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getRivercreate', { "location": city }, function (resp) { setRivercreate(resp) }, true);
}
function setRivercreate(resp) {
    if (resp.status === true) {
        if ($("#chkWaterBody").prop('checked') == true) {
            var RIVER = $.map(resp.data, function (el) { return el; })


            // var RIVER = data[city].RIVER;
            for (i = 0; i < RIVER.length; i++) {
                var ln = createLine(getLatLongArr(RIVER[i]));
                ln.setOptions({ fillColor: '#0000ff', strokeColor: '#0000ff', fillOpacity: 1 });

                maplayer.push(ln);
                //FOR LAYER'S ON/OFF
                RIVER_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}
$(document).on('change', '#chkWaterBody', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getRivercreate(beach);

        }
    }
    else {
        for (i = 0; i < RIVER_LAYER.length; i++) {
            RIVER_LAYER[i].setMap(null);
        }

    }
});
function getWatercreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getWatercreate', { "location": city }, function (resp) { setWatercreate(resp) }, true);
}
function setWatercreate(resp) {
    if (resp.status === true) {
        if ($("#chkWaterSupplyLine").prop('checked') == true) {
            var WTR = $.map(resp.data, function (el) { return el; })


            for (i = 0; i < WTR.length; i++) {
                var ln = createPolygon(getLatLongArr(WTR[i]));
                ln.setOptions({ strokeWeight: 3, strokeColor: '#8BBDEB' });
                maplayer.push(ln);
                WTR_LAYER.push(ln);
            }
        }
    }
}
$(document).on('change', '#chkWaterSupplyLine', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getWatercreate(beach);

        }
    }
    else {
        for (i = 0; i < WTR_LAYER.length; i++) {
            WTR_LAYER[i].setMap(null);
        }

    }
});
$(document).on('click', '#btnClear', function (e) {
    e.preventDefault();

    //ClearAllResults();

    //map.setZoom(7);

    //map.panTo(new google.maps.LatLng(26.846709, 80.946159));
    //GetCurrentDetails("State", "2");
    window.location.href = 'InformationDisplayGIS.aspx';
});
function ClearAllResults() {
    directionsDisplay.setMap(null);
    for (i = 0; i < SerachResult.length; i++) {
        SerachResult[i].setMap(null);
    }
    for (var x = 0; x < zoomIIE.length; x++) {
        zoomIIE[x].setMap(null);
    }
    for (var x = 0; x < zoomDistrict.length; x++) {
        zoomDistrict[x].setMap(null);
    }
    for (i = 0; i < SIIDCUL_POLLUTION_MARKERS.length; i++) {
        SIIDCUL_POLLUTION_MARKERS[i].setMap(null);
    }
    for (i = 0; i < CATEGORY_MARKERS.length; i++) {
        CATEGORY_MARKERS[i].setMap(null);
    }
    for (i = 0; i < IIE_MARKERS.length; i++) {
        IIE_MARKERS[i].setMap(null);
    }
    setDistrictMarker(map);
    //setSIDCMarkers(map);
    //setTextileMarkers(map);
    //setReservedMarker(map);
}
function getEPolecreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getEPolecreate', { "location": city }, function (resp) { setEPolecreate(resp) }, true);
}
function setEPolecreate(resp) {
    if (resp.status === true) {
        if ($("#chkElectricityPole").prop('checked') == true) {
            var e_pole = $.map(resp.data, function (el) { return el; })

            // var e_pole = data[city].EPOLE;
            for (i = 0; i < e_pole.length; i++) {
                var pt = createPoint(getLatLongArr(e_pole[i])[0]);
                var imgg = {
                    url: 'images/pole.png',
                    size: new google.maps.Size(12, 12),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(6, 4),
                    scaledSize: new google.maps.Size(12, 12)
                };
                pt.setIcon(imgg);
                maplayer.push(pt);
                EPOLE_LAYER.push(pt);
            }
        }
    }
}
$(document).on('change', '#chkElectricityPole', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getEPolecreate(beach);

        }
    }
    else {
        for (i = 0; i < EPOLE_LAYER.length; i++) {
            EPOLE_LAYER[i].setMap(null);
        }

    }
});

function getElinecreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getElinecreate', { "location": city }, function (resp) { setElinecreate(resp) }, true);
}
function setElinecreate(resp) {
    if (resp.status === true) {
        if ($("#chkElectricityLine").prop('checked') == true) {
            var e_line = $.map(resp.data, function (el) { return el; })
            for (i = 0; i < e_line.length; i++) {
                var ln = createLine(getLatLongArr(e_line[i]));

                var lineSymbol = {
                    path: 'M 0,-2 0,2',
                    strokeOpacity: 1,
                    scale: 2
                };

                ln.setOptions({
                    strokeOpacity: 0,
                    icons: [{
                        icon: lineSymbol,
                        offset: '0',
                        repeat: '20px'
                    }]
                });
                maplayer.push(ln);
                ELINE_LAYER.push(ln);
            }
        }
    }
}
$(document).on('change', '#chkElectricityLine', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getElinecreate(beach);

        }
    }
    else {
        for (i = 0; i < ELINE_LAYER.length; i++) {
            ELINE_LAYER[i].setMap(null);
        }

    }
});
function getsectorcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getsectorcreate', { "location": city }, function (resp) { setsectorcreate(resp) }, true);
}
function setsectorcreate(resp) {
    if (resp.status === true) {
        if ($("#chkSector").prop('checked') == true) {
            var SECTR = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < SECTR.length; i++) {
                var ln = createPolygon(getLatLongArr(SECTR[i][3]));
                ln.setOptions({ strokeWeight: 2, strokeColor: '#393939', fillOpacity: 0, clickable: !1 });
                maplayer.push(ln);
                SECT_LAYER.push(ln);
                //FOR LAYER'S ON/OFF

                var lp = new google.maps.LatLng(parseFloat(SECTR[i][2]), parseFloat(SECTR[i][1]));
                var _label = new google.maps.Label({ visibleZoom: 13, hideZoom: 19, visible: true, map: map, cssName: 'sctrLbl', position: lp, text: SECTR[i][0] });

                maplayer.push(_label);
            }
        }
    }
}
$(document).on('change', '#chkSector', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getsectorcreate(beach);

        }
    }
    else {
        for (i = 0; i < SECT_LAYER.length; i++) {
            SECT_LAYER[i].setMap(null);
        }

    }
});
function getbndcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getbndcreate', { "location": city }, function (resp) { setbndcreate(resp) }, true);
}
function setbndcreate(resp) {
    if (resp.status === true) {
        if ($("#chkBoundary").prop('checked') == true) {
            var BND = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < BND.length; i++) {
                var ln = createLine(getLatLongArr(BND[i]));
                ln.setOptions({ fillcolor: ' #000000', strokeWeight: 1, strokeColor: ' #000000' });
                maplayer.push(ln);
                BND_LAYER.push(ln);
            }
        }
    }
}

$(document).on('change', '#chkBoundary', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getbndcreate(beach);

        }
    }
    else {
        for (i = 0; i < BND_LAYER.length; i++) {
            BND_LAYER[i].setMap(null);
        }

    }
});
function getvegcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getvegcreate', { "location": city }, function (resp) { setvegcreate(resp) }, true);
}

function setvegcreate(resp) {
    if (resp.status === true) {
        if ($("#chkvegitation").prop('checked') == true) {
            var VEG = $.map(resp.data, function (el) { return el; })
            for (i = 0; i < VEG.length; i++) {
                var ln = createPolygon(getLatLongArr(VEG[i]));
                google.maps.event.addListener(map, 'mouseover', function (event) {
                    displayCoordinates(event.latLng);
                });
                ln.setOptions({ fillColor: '#55E82D', strokeColor: '#3AA03A', fillOpacity: 1 });
                maplayer.push(ln);
                VEG_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}
$(document).on('change', '#chkvegitation', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getvegcreate(beach);

        }
    }
    else {
        for (i = 0; i < VEG_LAYER.length; i++) {
            VEG_LAYER[i].setMap(null);
        }

    }
});
function getlabelcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getlabelcreate', { "location": city }, function (resp) { setlabelcreate(resp) }, true);
}

function setlabelcreate(resp) {
    if (resp.status === true) {
        var LBLS = $.map(resp.data, function (el) { return el; })


        for (i = 0; i < LBLS.length; i++) {
            var lp = new google.maps.LatLng(parseFloat(LBLS[i][2]), parseFloat(LBLS[i][1]));
            var _label = new google.maps.Label({ visibleZoom: 16, hideZoom: 60, visible: true, map: map, cssName: 'nlLabel', position: lp, text: LBLS[i][0] });
            maplayer.push(_label);
        }
    }
}

function getfirestationcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getfirestationcreate', { "location": city }, function (resp) { setfirestation(resp) }, true);
}

function setfirestation(resp) {
    if (resp.status === true) {
        if ($("#chkfire").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                ln.setOptions({ fillColor: '#cc0000', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 });
                maplayer.push(ln);
                FIRE_STATION_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}

$(document).on('change', '#chkfire', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getfirestationcreate(beach);

        }
    }
    else {
        for (i = 0; i < FIRE_STATION_LAYER.length; i++) {
            FIRE_STATION_LAYER[i].setMap(null);
        }

    }
});
function getencroachmentcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getencroachmentcreate', { "location": city }, function (resp) { setencroachment(resp) }, true);
}

function setencroachment(resp) {
    if (resp.status === true) {
        if ($("#checkEncroachment").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                ln.setOptions({ fillColor: '#999966', strokeColor: '#999966', fillOpacity: 0.8, clickable: !0 });
                maplayer.push(ln);
                ENCROACHMENT_LAYER.push(ln);
            }
        }
    }
}

$(document).on('change', '#checkEncroachment', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getencroachmentcreate(beach);

        }
    }
    else {
        for (i = 0; i < ENCROACHMENT_LAYER.length; i++) {
            ENCROACHMENT_LAYER[i].setMap(null);
        }

    }
});
function getPoloicestationcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getPoloicestationcreate', { "location": city }, function (resp) { setPolicestation(resp) }, true);
}

function setPolicestation(resp) {
    if (resp.status === true) {
        if ($("#chkpolice").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                ln.setOptions({ fillColor: '#F76085', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 });
                maplayer.push(ln);
                POLICE_STATION_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}

$(document).on('change', '#chkpolice', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getPoloicestationcreate(beach);

        }
    }
    else {
        for (i = 0; i < POLICE_STATION_LAYER.length; i++) {
            POLICE_STATION_LAYER[i].setMap(null);
        }

    }
});
function getNalacreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getNalacreate', { "location": city }, function (resp) { setNala(resp) }, true);
}

function setNala(resp) {
    if (resp.status === true) {
        if ($("#chknala").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                ln.setOptions({ fillColor: '#bf80ff', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 });
                maplayer.push(ln);
                NALA_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}

$(document).on('change', '#chknala', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getNalacreate(beach);

        }
    }
    else {
        for (i = 0; i < NALA_LAYER.length; i++) {
            NALA_LAYER[i].setMap(null);
        }

    }
});
function getparkingcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getparkingcreate', { "location": city }, function (resp) { setparking(resp) }, true);
}

function setparking(resp) {
    if (resp.status === true) {
        if ($("#chkparking").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                ln.setOptions({ fillColor: '#99ffcc', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 });
                google.maps.event.addListener(map, 'mouseover', function (event) {
                    displayCoordinates(event.latLng);
                });

                maplayer.push(ln);
                PARKING_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}

$(document).on('change', '#chkparking', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getparkingcreate(beach);

        }
    }
    else {
        for (i = 0; i < PARKING_LAYER.length; i++) {
            PARKING_LAYER[i].setMap(null);
        }

    }
});

function getWaterheadtankcreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getWaterheadtankcreate', { "location": city }, function (resp) { setWaterheadtank(resp) }, true);
}

function setWaterheadtank(resp) {
    if (resp.status === true) {
        if ($("#chkwatertank").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                ln.setOptions({ fillColor: '#b3b3ff', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 });
                maplayer.push(ln);
                WATER_HEAD_TANK.push(ln);

                Polys.push(ln);
            }
        }
    }
}

$(document).on('change', '#chkwatertank', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getWaterheadtankcreate(beach);

        }
    }
    else {
        for (i = 0; i < WATER_HEAD_TANK.length; i++) {
            WATER_HEAD_TANK[i].setMap(null);
        }

    }
});
function getOthercreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getOthercreate', { "location": city }, function (resp) { setOtherarea(resp) }, true);
}

function setOtherarea(resp) {
    if (resp.status === true) {
        if ($("#chkother").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                ln.setOptions({ fillColor: '#ffc34d', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 });
                maplayer.push(ln);
                OTHERS_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}

$(document).on('change', '#chkother', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getOthercreate(beach);

        }
    }
    else {
        for (i = 0; i < OTHERS_LAYER.length; i++) {
            OTHERS_LAYER[i].setMap(null);
        }

    }
});
function getCommanareacreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getCommanareacreate', { "location": city }, function (resp) { setCommanarea(resp) }, true);
}

function setCommanarea(resp) {
    if (resp.status === true) {
        if ($("#chkcomman").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                ln.setOptions({ fillColor: '#cc00ff', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 });
                maplayer.push(ln);
                COMMON_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}

$(document).on('change', '#chkcomman', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getCommanareacreate(beach);

        }
    }
    else {
        for (i = 0; i < COMMON_LAYER.length; i++) {
            COMMON_LAYER[i].setMap(null);
        }

    }
});
function getPublicPurposecreate(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'getPublicPurposecreate', { "location": city }, function (resp) { setPublicPurpose(resp) }, true);
}

function setPublicPurpose(resp) {
    if (resp.status === true) {
        if ($("#chkpublicpurpose").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                ln.setOptions({ fillColor: '#b3b300"', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 });
                maplayer.push(ln);
                PUBLIC_PURPOSE_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}

$(document).on('change', '#chkpublicpurpose', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getPublicPurposecreate(beach);

        }
    }
    else {
        for (i = 0; i < PUBLIC_PURPOSE_LAYER.length; i++) {
            PUBLIC_PURPOSE_LAYER[i].setMap(null);
        }

    }
});

function getutilitycreate(city_name) {
    var city = city_name;
    ajaxReq('do_it.ashx', 'getutilitycreate', { "location": city }, function (resp) { setutility(resp) }, true);
}

function setutility(resp) {
    if (resp.status === true) {
        if ($("#chkutitlity").prop('checked') == true) {
            var misc = $.map(resp.data, function (el) { return el; })

            for (i = 0; i < misc.length; i++) {
                var ln = createPolygon(getLatLongArr(misc[i]));
                ln.id = misc[i].toString();
                google.maps.event.addListener(map, 'mouseover', function (event) {
                    displayCoordinates(event.latLng);
                });
                ln.setOptions({ fillColor: '#AF7AC5', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 });

                maplayer.push(ln);
                MISC_LAYER.push(ln);

                Polys.push(ln);
            }
        }
    }
}

$(document).on('change', '#chkutitlity', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getutilitycreate(beach);

        }
    }
    else {
        for (i = 0; i < MISC_LAYER.length; i++) {
            MISC_LAYER[i].setMap(null);
        }

    }
});
function getroadcreate(city_name) {

    var city = city_name;

    ajaxReq('do_it.ashx', 'getroadcreate', { "location": city }, function (resp) { setroad(resp) }, true);
}
function setroad(resp) {
    if (resp.status === true) {
        if ($("#chkRoad").prop('checked') == true) {
            var RDS = $.map(resp.data, function (el) { return el; })
            for (i = 0; i < RDS.length; i++) {
                var ln = createLine(getLatLongArr(RDS[i]));
                ln.setOptions({ strokeWeight: 4, strokeColor: '#FDFEFE' });
                maplayer.push(ln);
                RDS_LAYER.push(ln);

            }
        }
    }
}
$(document).on('change', '#chkRoad', function (e) {
    e.preventDefault();
    if (this.checked) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getroadcreate(beach);

        }
    }
    else {
        for (i = 0; i < RDS_LAYER.length; i++) {
            RDS_LAYER[i].setMap(null);
        }

    }
});





function getPlotcreate(city_name) {
    GetCurrentDetails("IE", city_name);
    var city = city_name;
    ajaxReq('do_it.ashx', 'getPlotcreate', { "location": city }, function (resp) { setPlotcreate(resp, city_name) }, true);
}

var Polys = [];

function setPlotcreate(resp, city_name) {
    if (resp.status === true) {
        //// debugger;
        var plots = $.map(resp.data, function (el) { return el; })
        var clr;
        var typeClr;

        $('#OpacityRange').val(0.5);
        $('#demo').html(50);

        for (i = 0; i < plots.length; i++) {
            var poly = createPolygon(getLatLongArr(plots[i][4]));
            poly.plotno = plots[i][0];
            poly.area = plots[i][1];
            poly.sector = plots[i][5] || 1;
            poly.Status = plots[i][6];
            poly.Ind_area_name = plots[i][7];
            poly.Districtname = plots[i][8];
            poly.plottype = plots[i][9];
            poly.SectorName = plots[i][10];
            poly.iierecno = city_name;

            if ($('#chkCheckAllPlotStatus').attr('checked')) {
                clr = getColor(poly.plotno, poly.sector, city_name, poly.Status);
                poly.setOptions({ fillColor: clr, clickable: !0, fillOpacity: 0.5 });
            }
            else {
                typeClr = getTypePlotColor(poly.plotno, poly.sector, city_name, poly.plottype);
                poly.setOptions({ fillColor: typeClr, clickable: !0 });
            }

            Polys.push(poly);

            google.maps.event.addListener(poly, 'mouseover', function () {
                this.setOptions({ strokeWeight: 4 });
            });
            google.maps.event.addListener(poly, 'mouseout', function () {
                this.setOptions({ strokeWeight: 1 });
            });
            google.maps.event.addListener(map, 'mouseover', function (event) {
                displayCoordinates(event.latLng);
            });

            google.maps.event.addListener(poly, 'mousemove', function (event) {
                displayCoordinates(event.latLng);
            });

            if (clr != '#CCCC99') {
                google.maps.event.addListener(poly, 'click', function () {
                    getInfo(this.plotno, this.area, this.sector, this.iierecno, this.SectorName, this.Ind_area_name, this.Districtname);
                });
            }

            if ($('#chkCheckAllPlotStatus').attr('checked')) {
                //for Filter added on 13/5/2016 
                //For Available for AllotmenT
                if (clr == '#FFFFFE') {
                    UN_ALLOTEDPLOT_LAYER.push(poly);
                    UN_ALLOTED_PLOTS.push(plots[i]);
                }
                    //nOT Available for Allotmen
                else if (clr == '#FC033') {
                    NOTAVAILABLESPLOT_LAYER.push(poly);
                    NOTAVAILABLES_PLOT.push(plots[i]);

                }
                    //for Vacant
                else if (clr == '#12F6E5') {
                    VACANTPLOT_LAYER.push(poly);
                    VACANT_PLOTS.push(plots[i]);

                }
                    //for Under Construction
                else if (clr == '#3498DB') {
                    UNDERCONSPLOT_LAYER.push(poly);
                    UNDERCONS_PLOTS.push(plots[i]);
                }
                    //for Under Production
                else if (clr == '#ECE92B') {
                    INPRODUCTIONPLOT_LAYER.push(poly);
                    INPRODUCTION_PLOTS.push(plots[i]);
                }
                    //for Production Stop
                else if (clr == '#FFA07A') {
                    CLOSEDPLOT_LAYER.push(poly);
                    CLOSED_PLOTS.push(plots[i]);
                }
                    //for Sick
                else if (clr == '#927503') {
                    SICKPLOT_LAYER.push(poly);
                    SICK_PLOTS.push(plots[i]);
                }
                    //for No Status
                else if (clr == '#CCCC99') {
                    NOSTATUSPLOT_LAYER.push(poly);
                    NOSTATUS_PLOTS.push(plots[i]);
                }
                //
            }
            else {
                //for land use filter added by sachin bhatt 5july2017
                //Industrial
                if (typeClr == '#6C6C6C') {
                    Industrial_LAYER.push(poly);
                    Industrial_PLOTS.push(plots[i]);
                }
                    //for Commercial
                else if (typeClr == '#008C89') {
                    Commercial_LAYER.push(poly);
                    Commercial_PLOTS.push(plots[i]);
                }
                    //for Residential
                else if (typeClr == '#D4CF17') {
                    Residential_LAYER.push(poly);
                    Commercial_PLOTS.push(plots[i]);
                }
                    //for In Institutional_Banking_
                else if (typeClr == '#0000cc') {
                    Institutional_Banking_LAYER.push(poly);
                    Institutional_Banking_PLOTS.push(plots[i]);
                }
                    //for No Status
                else if (typeClr == '#CCCC99') {
                    NOSTATUSPLOT_LAYER.push(poly);
                    NOSTATUS_PLOTS.push(plots[i]);
                }
                //
                //
            }

            maplayer.push(poly);
            //  if ($("#chkPlotNo").prop('checked') == true) {
            var lp = new google.maps.LatLng(parseFloat(plots[i][3]), parseFloat(plots[i][2]));

            if (poly.area >= 10000) {
                var _label = new google.maps.Label({
                    visibleZoom: 12, hideZoom: 90, visible: true, map: map, cssName: 'nlLabel', position: lp, text: plots[i][0]
                });
            }
            else if (poly.area >= 3000 && poly.area < 10000) {
                var _label = new google.maps.Label({
                    visibleZoom: 13, hideZoom: 90, visible: true, map: map, cssName: 'nlLabel', position: lp, text: plots[i][0]
                });
            }
            else if (poly.area >= 1000 && poly.area < 3000) {
                var _label = new google.maps.Label({
                    visibleZoom: 16, hideZoom: 90, visible: true, map: map, cssName: 'nlLabel', position: lp, text: plots[i][0]
                });
            }
            else if (poly.area >= 300 && poly.area < 1000) {
                var _label = new google.maps.Label({
                    visibleZoom: 16, hideZoom: 90, visible: true, map: map, cssName: 'nlLabel', position: lp, text: plots[i][0]
                });
            }
            else {
                var _label = new google.maps.Label({
                    visibleZoom: 16, hideZoom: 90, visible: true, map: map, cssName: 'nlLabel', position: lp, text: plots[i][0]
                });
            }

            PLOT_NUMBER.push(_label);
            maplayer.push(_label);
            // }
        }
    }
}

$(document).on('change', '#chkCheckAllPlotStatus', function (e) {
    e.preventDefault();

    $(this).closest('table').find('td input[type="checkbox"]').prop('checked', $(this).prop('checked'));
    if (this.checked) {
        $('#chkCheckAllPlotStatus').attr("checked", "checked");;
        $('#chlAllLandUser').prop('checked', false);
        $('#chlAllLandUser').removeAttr('checked');
        $('#chlAllLandUser').closest('table').find('td input[type="checkbox"]').prop('checked', false);
        $('#chlAllLandUser').closest('table').find('td input[type="checkbox"]').removeAttr('checked');
        showLegend();
        clearLandUse();
        var iierecno = $.unique(IIE_RECNO);

        for (i = 0; i < iierecno.length; i++) {
            getPlotcreate(iierecno[i]);
        }

    }

    else {

        for (i = 0; i < UN_ALLOTEDPLOT_LAYER.length; i++) {
            UN_ALLOTEDPLOT_LAYER[i].setMap(null);
        }

        for (i = 0; i < CLOSEDPLOT_LAYER.length; i++) {
            CLOSEDPLOT_LAYER[i].setMap(null);
        }

        for (i = 0; i < SICKPLOT_LAYER.length; i++) {
            SICKPLOT_LAYER[i].setMap(null);
        }

        for (i = 0; i < VACANTPLOT_LAYER.length; i++) {
            VACANTPLOT_LAYER[i].setMap(null);
        }


        for (i = 0; i < ALLOTEDPLOT_LAYER.length; i++) {
            ALLOTEDPLOT_LAYER[i].setMap(null);
        }


        for (i = 0; i < UNDERCONSPLOT_LAYER.length; i++) {
            UNDERCONSPLOT_LAYER[i].setMap(null);
        }


        for (i = 0; i < INPRODUCTIONPLOT_LAYER.length; i++) {
            INPRODUCTIONPLOT_LAYER[i].setMap(null);
        }


        for (i = 0; i < NOSTATUSPLOT_LAYER.length; i++) {
            NOSTATUSPLOT_LAYER[i].setMap(null);
        }
    }
});

$(document).on('change', '#chkUnalloted', function (e) {
    e.preventDefault();
    if (this.checked) {

        //for (i = 0; i < CITY_NAME.length; i++) {
        //    var beach = CITY_NAME[i];
        //    getPlotcreate(beach);
        for (i = 0; i < UN_ALLOTEDPLOT_LAYER.length; i++) {
            UN_ALLOTEDPLOT_LAYER[i].setMap(map);

        }
    }
    else {
        for (i = 0; i < UN_ALLOTEDPLOT_LAYER.length; i++) {
            UN_ALLOTEDPLOT_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chkVacant', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < VACANTPLOT_LAYER.length; i++) {
            VACANTPLOT_LAYER[i].setMap(map);

        }
    }
    else {
        for (i = 0; i < VACANTPLOT_LAYER.length; i++) {
            VACANTPLOT_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chkUnderConstruction', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < UNDERCONSPLOT_LAYER.length; i++) {
            UNDERCONSPLOT_LAYER[i].setMap(map);
        }
    }
    else {
        for (i = 0; i < UNDERCONSPLOT_LAYER.length; i++) {
            UNDERCONSPLOT_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chkInProduction', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < INPRODUCTIONPLOT_LAYER.length; i++) {
            INPRODUCTIONPLOT_LAYER[i].setMap(map);
        }
    }
    else {
        for (i = 0; i < INPRODUCTIONPLOT_LAYER.length; i++) {
            INPRODUCTIONPLOT_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chkclosed', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < CLOSEDPLOT_LAYER.length; i++) {
            CLOSEDPLOT_LAYER[i].setMap(map);
        }
    }
    else {
        for (i = 0; i < CLOSEDPLOT_LAYER.length; i++) {
            CLOSEDPLOT_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chksick', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < SICKPLOT_LAYER.length; i++) {
            SICKPLOT_LAYER[i].setMap(map);
        }
    }
    else {
        for (i = 0; i < SICKPLOT_LAYER.length; i++) {
            SICKPLOT_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chkNoStatus', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < NOSTATUSPLOT_LAYER.length; i++) {
            NOSTATUSPLOT_LAYER[i].setMap(map);

        }
    }
    else {
        for (i = 0; i < NOSTATUSPLOT_LAYER.length; i++) {
            NOSTATUSPLOT_LAYER[i].setMap(null);
        }

    }
});


//Changes by sachin 5 july

$(document).on('change', '#chlAllLandUser', function (e) {
    e.preventDefault();

    $(this).closest('table').find('td input[type="checkbox"]').prop('checked', $(this).prop('checked'));
    if (this.checked) {
        clearplotStatus()
        $('#chkCheckAllPlotStatus').prop('checked', false);
        $('#chkCheckAllPlotStatus').removeAttr('checked');
        $('#chkCheckAllPlotStatus').closest('table').find('td input[type="checkbox"]').prop('checked', false);
        $('#chkCheckAllPlotStatus').closest('table').find('td input[type="checkbox"]').removeAttr('checked');
        showLegend();
        var iierecno = $.unique(IIE_RECNO);

        for (i = 0; i < UN_ALLOTEDPLOT_LAYER.length; i++) {
            UN_ALLOTEDPLOT_LAYER[i].setMap(null);
        }

        for (i = 0; i < CLOSEDPLOT_LAYER.length; i++) {
            CLOSEDPLOT_LAYER[i].setMap(null);
        }

        for (i = 0; i < SICKPLOT_LAYER.length; i++) {
            SICKPLOT_LAYER[i].setMap(null);
        }

        for (i = 0; i < VACANTPLOT_LAYER.length; i++) {
            VACANTPLOT_LAYER[i].setMap(null);
        }


        for (i = 0; i < ALLOTEDPLOT_LAYER.length; i++) {
            ALLOTEDPLOT_LAYER[i].setMap(null);
        }


        for (i = 0; i < UNDERCONSPLOT_LAYER.length; i++) {
            UNDERCONSPLOT_LAYER[i].setMap(null);
        }


        for (i = 0; i < INPRODUCTIONPLOT_LAYER.length; i++) {
            INPRODUCTIONPLOT_LAYER[i].setMap(null);
        }


        for (i = 0; i < NOSTATUSPLOT_LAYER.length; i++) {
            NOSTATUSPLOT_LAYER[i].setMap(null);
        }




        for (i = 0; i < iierecno.length; i++) {
            getPlotcreate(iierecno[i]);
        }

        //for (i = 0; i < Industrial_LAYER.length; i++) {

        //    Industrial_LAYER[i].setMap(map);
        //}

        //for (i = 0; i < Commercial_LAYER.length; i++) {

        //    Commercial_LAYER[i].setMap(map);

        //}

        //for (i = 0; i < Residential_LAYER.length; i++) {

        //    Residential_LAYER[i].setMap(map);
        //}

        //for (i = 0; i < Institutional_Banking_LAYER.length; i++) {

        //    Institutional_Banking_LAYER[i].setMap(map);
        //}
    }

    else {

        for (i = 0; i < Industrial_LAYER.length; i++) {
            Industrial_LAYER[i].setMap(null);
        }


        for (i = 0; i < Commercial_LAYER.length; i++) {
            Commercial_LAYER[i].setMap(null);
        }


        for (i = 0; i < Residential_LAYER.length; i++) {
            Residential_LAYER[i].setMap(null);
        }


        for (i = 0; i < Institutional_Banking_LAYER.length; i++) {
            Institutional_Banking_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chkIndustrialPlot', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < Industrial_LAYER.length; i++) {
            Industrial_LAYER[i].setMap(map);

        }
    }
    else {
        for (i = 0; i < Industrial_LAYER.length; i++) {
            Industrial_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chkCommercialPlot', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < Commercial_LAYER.length; i++) {
            Commercial_LAYER[i].setMap(map);

        }
    }
    else {
        for (i = 0; i < Commercial_LAYER.length; i++) {
            Commercial_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chkResidentialplot', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < Residential_LAYER.length; i++) {
            Residential_LAYER[i].setMap(map);

        }
    }
    else {
        for (i = 0; i < Residential_LAYER.length; i++) {
            Residential_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chkInstitutionalplot', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < Institutional_Banking_LAYER.length; i++) {
            INPRODUCTIONPLOT_LAYER[i].setMap(map);
        }
    }
    else {
        for (i = 0; i < Institutional_Banking_LAYER.length; i++) {
            Institutional_Banking_LAYER[i].setMap(null);
        }

    }
});
$(document).on('change', '#chklandUseNostatus', function (e) {
    e.preventDefault();
    if (this.checked) {
        for (i = 0; i < NOSTATUSPLOT_LAYER.length; i++) {
            NOSTATUSPLOT_LAYER[i].setMap(map);

        }
    }
    else {
        for (i = 0; i < NOSTATUSPLOT_LAYER.length; i++) {
            NOSTATUSPLOT_LAYER[i].setMap(null);
        }

    }
});
function clearplotStatus() {
    for (i = 0; i < VACANTPLOT_LAYER.length; i++) {
        VACANTPLOT_LAYER[i].setMap(null);
    }
    for (i = 0; i < UN_ALLOTEDPLOT_LAYER.length; i++) {
        UN_ALLOTEDPLOT_LAYER[i].setMap(null);
    }
    for (i = 0; i < UNDERCONSPLOT_LAYER.length; i++) {
        UNDERCONSPLOT_LAYER[i].setMap(null);
    }
    for (i = 0; i < INPRODUCTIONPLOT_LAYER.length; i++) {
        INPRODUCTIONPLOT_LAYER[i].setMap(null);
    }
}
function clearLandUse() {
    for (i = 0; i < Industrial_LAYER.length; i++) {
        Industrial_LAYER[i].setMap(null);
    }
    for (i = 0; i < Commercial_LAYER.length; i++) {
        Commercial_LAYER[i].setMap(null);
    }
    for (i = 0; i < Residential_LAYER.length; i++) {
        Residential_LAYER[i].setMap(null);
    }
    for (i = 0; i < Institutional_Banking_LAYER.length; i++) {
        Institutional_Banking_LAYER[i].setMap(null);
    }
}
//


function getDistrictBoundary(city_name) {

    var state = city_name;

    ajaxReq('do_it.ashx', 'getDistrictboundary', { "location": state }, function (resp) { setDistrictboundary(resp) }, true);

}

function setDistrictboundary(resp) {
    if (resp.status === true) {
        var arr = $.map(resp.data, function (el) { return el; })

        for (i = 0; i < arr.length; i++) {
            var ln = createPolygon(getLatLongArr(arr[i][3]));
            ln.setOptions({ visibleZoom: 5, fillColor: '#FF8633', hideZoom: 9, visible: true, map: map, strokeWeight: 2, strokeColor: '#686868', fillOpacity: 0, clickable: !1 });
            maplayer.push(ln);

            //var lp = new google.maps.LatLng(parseFloat(arr[i][2]), parseFloat(arr[i][1]));
            //var _label = new google.maps.Label({ visibleZoom: 5, hideZoom: 9, visible: true, map: map, cssName: 'sctrLblDIST', position: lp, text: arr[i][0] });
        }

    }
}


function getStateboundary(city_name) {


    var city = city_name;

    ajaxReq('do_it.ashx', 'getStateboundary', { "location": city }, function (resp) { setStateboundary(resp) }, true);

}

function setStateboundary(resp) {
    if (resp.status === true) {
        var arr = $.map(resp.data, function (el) { return el; })

        for (i = 0; i < arr.length; i++) {
            var ln = createPolygon(getLatLongArr(arr[i][3]));
            ln.setOptions({ visibleZoom: 5, fillColor: '#FF8633', hideZoom: 9, visible: true, map: map, strokeWeight: 4, strokeColor: '#E74C3C', fillOpacity: 0.1, clickable: !1 });
            maplayer.push(ln);

            var lp = new google.maps.LatLng(parseFloat(arr[i][2]), parseFloat(arr[i][1]));
            var _label = new google.maps.Label({ visibleZoom: 5, hideZoom: 9, visible: true, map: map, cssName: 'sctrLblDIST', position: lp, text: arr[i][0] });
        }

    }
}

//changes by sachin 22 july 2017 for district list
function getestateinformation_forlist(city_name) {
    // debugger;
    var city = city_name;
    ajaxReq('do_it.ashx', 'getestateinformation', { "location": city }, function (resp) { showestateinformation_forlist(resp, city_name) }, true);

}
function showestateinformation_forlist(resp, city_name) {
    // debugger;
    if (resp.status === true) {
        var IIEINFOS = $.map(resp.data, function (el) { return el; })



        $('#iieInfo_name').empty();
        $('#iieInfo_TotalArea').empty();
        var tbl = $('#iieInfo_LandUse').empty();
        $('#iieInfo_Rate').empty();

        $('#iieInfo_name').append(IIEINFOS[0].Ind_area_name);
        $('#iieInfo_TotalArea').append(IIEINFOS[0].Area);
        $('#iieInfo_Rate').append(IIEINFOS[0].IND_RATE);
        var tr = '<tr>';
        var VALS = 0;
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; text-align: center; font-size: 11px;"><div style="width: 40px; color: #4679bd; font-weight: bold; margin-top: 2px;">S.no.</div></td>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; padding-left: 10px; font-size: 11px;"><div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Land Use</div></td>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; text-align: center; font-size: 11px;"><div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Area(In Acres) Earmarked</div></td></tr>';
        tbl.append(tr);
        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + (parseInt(VALS) + 1) + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">Total Land Acquired </div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + rowData.LAND_AREA + '</div></td></tr>');

        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + '' + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;color: #4679bd;">Total</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + IIEINFOS[0].Total_area + '</div></td></tr>');
        getestateotherinformation(city_name);
        $("#diviieinfor").show();
        $("#DivNodata").hide();
    }
    else {
        //No Information
        $("#LiQuery").removeClass('active');
        $("#LiLayers").removeClass('active');
        $("#LiLegends").removeClass('active');
        $("#LiIndustrialList").addClass('active');
        $("#Liinformation").removeClass("active");
        $('#home').removeClass('in active');
        $('#profile').removeClass('in active');
        $('#messages').removeClass('in active');
        $('#settings').addClass('in active');
        $('#legends').removeClass('in active');
        $("#DivNodata").show();
        $("#diviieinfor").hide();
    }
}
//end of changes 22july2017


//changes by sachin 5 july
function getestateinformation(city_name) {
    // debugger;
    var city = city_name;
    ajaxReq('do_it.ashx', 'getestateinformation', { "location": city }, function (resp) { showestateinformation(resp, city_name) }, true);

}
function showestateinformation(resp, city_name) {
    // debugger;
    if (resp.status === true) {
        var IIEINFOS = $.map(resp.data, function (el) { return el; })

        $("#LiQuery").removeClass('active');
        $("#LiLayers").removeClass('active');
        $("#LiLegends").removeClass('active');
        $("#LiIndustrialList").removeClass('active');
        $("#Liinformation").addClass("active");
        $('#home').removeClass('in active');
        $('#profile').removeClass('in active');
        $('#messages').removeClass('in active');
        $('#settings').removeClass('in active');
        $('#legends').addClass('in active');

        $('#iieInfo_name').empty();
        $('#iieInfo_TotalArea').empty();
        var tbl = $('#iieInfo_LandUse').empty();
        $('#iieInfo_Rate').empty();

        $('#iieInfo_name').append(IIEINFOS[0].Ind_area_name);
        $('#iieInfo_TotalArea').append(IIEINFOS[0].Area);
        $('#iieInfo_Rate').append(IIEINFOS[0].IND_RATE);
        var tr = '<tr>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; text-align: center; font-size: 11px;"><div style="width: 40px; color: #4679bd; font-weight: bold; margin-top: 2px;">S.no.</div></td>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; padding-left: 10px; font-size: 11px;"><div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Land Use</div></td>';
        tr += '<td style="border: 1px solid lightgrey; border-collapse: collapse; text-align: center; font-size: 11px;"><div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Area(In Acres) Earmarked</div></td></tr>';
        tbl.append(tr);
        //tbl.append('<tr>'+''+'<div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Land Use</div></td>'+' '+'<div style="width: 100px; color: #4679bd; font-weight: bold; margin-top: 2px;">Area(In Acres) Earmarked</div></td></tr>')
        for (var VALS = 0; VALS < IIEINFOS.length; VALS++) {
            drawRow(IIEINFOS[VALS], tbl, VALS);
        }
        tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + '' + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;color: #4679bd;">Total</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + IIEINFOS[0].Total_area + '</div></td></tr>');
        getestateotherinformation(city_name);
        $("#diviieinfor").show();
        $("#DivNodata").hide();
    }
    else {
        //No Information
        $("#LiQuery").removeClass('active');
        $("#LiLayers").removeClass('active');
        $("#LiLegends").removeClass('active');
        $("#LiIndustrialList").addClass('active');
        $("#Liinformation").removeClass("active");
        $('#home').removeClass('in active');
        $('#profile').removeClass('in active');
        $('#messages').removeClass('in active');
        $('#settings').addClass('in active');
        $('#legends').removeClass('in active');
        $("#DivNodata").show();
        $("#diviieinfor").hide();
    }
}
function drawRow(rowData, tbl, VALS) {
    // debugger;
    tbl.append('<tr><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + (parseInt(VALS) + 1) + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + rowData.LAND_NAME + '</div></td><td class="RightSideSecondTD"><div style="width: 98%; margin-top: 2px;">' + rowData.LAND_AREA + '</div></td></tr>');
}
function getestateotherinformation(city_name) {
    // debugger;
    var city = city_name;
    ajaxReq('do_it.ashx', 'getestateotherinformation', { "location": city }, function (resp) { showestateotherinformation(resp, city_name) }, true);

}
function showestateotherinformation(resp, city_name) {
    // debugger;
    if (resp.status === true) {
        var otherdata = $.map(resp.data, function (el) { return el; })
        $("#iieInfo_Location").empty();
        $("#iieInfo_allottedplots").empty();
        $("#iieInfo_majorUnits").empty();
        $("#iieInfo_products").empty();
        for (var locs = 0; locs < otherdata.length; locs++) {
            if (otherdata[locs].TYPE === 0) {
                $("#iieInfo_Location").append('<li>' + otherdata[locs].VALUE + '</li>')
            }
            else if (otherdata[locs].TYPE === 1) {
                $("#iieInfo_allottedplots").append('<li>' + otherdata[locs].VALUE + '</li>')
            }
            else if (otherdata[locs].TYPE === 2) {
                $("#iieInfo_majorUnits").append('<li>' + otherdata[locs].VALUE + '</li>')
            }
            else if (otherdata[locs].TYPE === 3) {
                $("#iieInfo_products").append('<li>' + otherdata[locs].VALUE + '</li>')
            }
        }
    }
}
//



function getInfo(plot, area, sector, city_name, SectorName, Industrial_Area_Name, District_Name) {
    // debugger;
    var city = city_name;
    ajaxReq('do_it.ashx', 'plotinfo', { "plot": plot, "Sector": sector }, function (resp) { showPlotInfo(resp, plot, area, sector, city_name, SectorName, Industrial_Area_Name, District_Name) }, true);
    $('.statsDIv').hide();
}

function showPlotInfo(resp, plot, area, sector, city_name, SectorName, Industrial_Area_Name, District_Name) {
    // debugger;
    if (resp.status === true) {
        var tbl = $('.infomain table').empty();
        $('#spanIIE').empty().append(Industrial_Area_Name);
        tbl.empty();

        tbl.append('<tr><td >Plot No</td><td style="font-weight:bold;">' + plot + '</td></tr>');
        $.each(resp.data, function (indx, itm) {
            tbl.append('<tr><td>' + indx + '</td><td style="font-weight:bold;">' + itm + (indx == 'Plot Area' ? ' sq. mtr' : '') + '</td></tr>');
            if (indx == "Plot Status" && itm == "Un-allotted") {
                //  moreInfo();

                $(".infolower").empty();
                $(".infolower").css('visibility', 'visible');
                // var url = "http://118.185.3.27/UPSIDC_SmartCity/User/ApplicationFormForFirstTimeUser.aspx?PlotNo=" + plot + '&Area=' + area + '&Sector=' + SectorName + '&iierecno=' + city_name + '&Industrial_Area_Name=' + Industrial_Area_Name + '&District_Name=' + District_Name;
                var url = "http://onlineupsidc.com/ApplicationPayment.aspx?PlotNo=" + plot + '&Area=' + area + '&Sector=' + SectorName + '&iierecno=' + city_name + '&Industrial_Area_Name=' + Industrial_Area_Name + '&District_Name=' + District_Name;
                $(".infolower").append('<a id="btnApply" class="btn btn-danger" target="_blank" href="' + url + '">Apply Now</a>')
                //  $(".infolower").append('<a id="btnApply" target="_blank" href="#">Apply Now</a>')
            }
            else
                $(".infolower").css('visibility', 'hidden');
        });

        $("#Plotinfo").dialog(opt).dialog("open");
    }
}
function moreInfo() {

    var _lis = '<li>High Class Road: 30m wide and above</li><li>Electricity & LED Street lights</li><li>Water Supply</li><li>Statutory Services</li><li>DataCom Services</li><li>Fire & Police Stations</li>';
    $('.info .infomore ul').empty().append(_lis);
}


function getCompanies(city_name) {

    var city = city_name;
    ajaxReq('do_it.ashx', 'CompaniesList', { "location": city }, function (resp) { BindCompanies(resp, city) }, true);

}

function BindCompanies(resp, city) {
    if (resp.status === true) {
        var CompanyName = $.map(resp.data, function (el) { return el; })
        $('#ddlCompany').append(new Option('--Select Company--', ''));
        for (i = 0; i < CompanyName.length; i++) {

            for (i = 0; i < CompanyName.length; i++) {
                if (i % 5 === 0) {
                    $("#ddlCompany").append(new Option(CompanyName[i], CompanyName[i + 1] + '/' + CompanyName[i + 2] + '/' + CompanyName[i + 3] + '/' + CompanyName[i + 4]));
                }
            }
        }
    }

}

function getAllCategory() {
    ajaxReq('do_it.ashx', 'IIECategory', {}, function (resp) { BindAllCategory(resp) }, true);

}
function BindAllCategory(resp) {
    $("#ddlCategory").empty();
    if (resp.status === true) {
        var IIECategory = $.map(resp.data, function (el) { return el; })
        $('#ddlCategory').append(new Option('--Select Category--', ''));

        for (i = 0; i < IIECategory.length; i++) {
            if (i % 2 === 0) {
                $("#ddlCategory").append(new Option(IIECategory[i + 1], IIECategory[i] + '/' + IIECategory[i + 2] + '/' + IIECategory[i + 3] + '/' + IIECategory[i + 4]));
            }
        }
    }
}

$(document).on('click', '#btnCategorywise', function (e) {
    e.preventDefault();

    for (i = 0; i < IIE_MARKERS.length; i++) {
        IIE_MARKERS[i].setMap(null);

    }

    for (i = 0; i < SIIDCUL_POLLUTION_MARKERS.length; i++) {
        SIIDCUL_POLLUTION_MARKERS[i].setMap(null);
    }

    map.setZoom(7);

    map.panTo(new google.maps.LatLng(26.846709, 80.946159));


    var Plotarea = $('#txtPlotArea').val();
    var category = $('#ddlCategory option:selected').text();


    if (category == "--Select Category--") {
        alert("Please select type of Industry").fadeOut("slow");
    }

    else if (Plotarea == "0" || Plotarea == "") {
        alert("Please Enter Plot Area").fadeOut("slow");
    }

    else {

        getPlotAvailabliltyInfo(Plotarea, category);
    }

});

function getPlotAvailabliltyInfo(Plotarea, category) {

    ajaxReq('do_it.ashx', 'getPlotAvailabliltyInfo', { "plotArea": Plotarea, "category": category }, function (resp) { showPlotAvailablilty(resp, Plotarea) }, true);

}
function showPlotAvailablilty(resp, Plotarea) {
    if (resp.status === true) {
        // debugger;
        var tbl = $('#sa').empty();
        var cat = $('#ddlCategory option:selected').text();
        tbl.empty();

        tbl.append('<thead class="ui-widget-header"><tr><td>IIE Name</td><td>Available Plots Count</td><td>Land Rate</td></tr> </thead> <tbody class="ui-widget-content">');

        for (i = 0; i < CATEGORY_MARKERS.length; i++) {
            CATEGORY_MARKERS[i].setMap(null);
        }
        for (var i = 0; i < resp.data.length; i++) {
            var getIIEArray = [];
            $("#sa").append("<tr><td ><div class='DivCategory1'><b>" + resp.data[i]["Ind_area_name"] + "</b></div></td><td align='center'><div class='DivCategory2';>" + resp.data[i]["VacantPlots_Count"] + "</div></td><td><div class='DivCategory3'>" + resp.data[i]["Land_Rate"] + "</div></td></tr>");
            for (var x = 0; x < Categorydata[cat]["IIE"].length; x++) {

                var find = Categorydata[cat]["IIE"][x];
                if (find[0] === resp.data[i]["Ind_area_name"]) {
                    getIIEArray.push(find);
                    break;
                }
            }
            if (getIIEArray.length > 0) {
                var mm = "images/pinBlue.png";
                var marker, i;

                var beach = getIIEArray[0];
                marker = new google.maps.Marker({
                    position: { lat: beach[2], lng: beach[1] },
                    map: map,
                    icon: mm,
                    title: beach[0]

                });
                marker.zaixs = beach[3],
                marker.x = beach[1],
                marker.y = beach[2],
                marker.IIEName = beach[4],
                marker.Area = Plotarea,
                marker.category = cat,
                google.maps.event.addListener(marker, 'click', function () {
                    createIIELayes(marker);
                });
                CATEGORY_MARKERS.push(marker);
            }
        }

        $("#sa").append('</tbody>');
        $("#DivCategoryResult").dialog(opt).dialog("open");

        //myFunctions();

    }
    else {
        var tbl = $('#sa').empty();
        tbl.empty();
        tbl.append('<thead class="ui-widget-header"><tr><td>IIE Name</td><td>Vancant Plots Count</td><td style="font-weight:bold;">Land Rate</td></tr> </thead> <tbody class="ui-widget-content">');
        tbl.append('<tr><td colspan="3">Due to Network issue system is unable to fetch the data or No Data Found</td></tr></tbody>');
    }
}
function createIIELayes(marker) {
    // debugger;
    map.setZoom(marker.zaixs);
    map.panTo(new google.maps.LatLng(marker.y, marker.x));
    getPlotcreate(marker.IIEName);
    getroadcreate(marker.IIEName);
    getutilitycreate(marker.IIEName);
    getPublicPurposecreate(marker.IIEName);
    getCommanareacreate(marker.IIEName);
    getOthercreate(marker.IIEName);
    getWaterheadtankcreate(marker.IIEName);
    getparkingcreate(marker.IIEName);
    getNalacreate(marker.IIEName);
    getPoloicestationcreate(marker.IIEName);
    getfirestationcreate(marker.IIEName);
    getlabelcreate(marker.IIEName);
    getvegcreate(marker.IIEName);
    getbndcreate(marker.IIEName);
    getsectorcreate(marker.IIEName);
    getElinecreate(marker.IIEName);
    getEPolecreate(marker.IIEName);
    getWatercreate(marker.IIEName);
    getRivercreate(marker.IIEName);
    getlamppostcreate(marker.IIEName);
    getRailwaycreate(marker.IIEName);
    getmanholecreate(marker.IIEName);
    getfootpathcreate(marker.IIEName);
    getBridgecreate(marker.IIEName);
    showPlots(marker.IIEName);
    //CloseDialogs();  
    if (marker.Area > 0) {
        // debugger;
        PushVacantPlots(marker.Area);
    }
    else {
        alert("Please Enter Plot Area").fadeOut("slow");
    }
}
var CloseDialogs = function () {
    $(".ui-dialog-content").dialog("close");
};
$(document).on('keypress', '#txtPlotArea', function (e) {
    //$("#txtPlotArea").keypress(function (e) {
    //if the letter is not digit then display error and don't type anything
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        alert("Digits Only").fadeOut("slow");
        $('#txtPlotArea').val("");
    }
});



function PushVacantPlots(Area) {
    // debugger;
    for (i = 0; i < SerachResult.length; i++) {
        SerachResult[i].setMap(null);
    }
    for (i = 0; i <= VACANT_PLOTS.length; i++) {
        var layer = VACANT_PLOTS[i];
        if (VACANT_PLOTS.length > 0) {
            if (VACANT_PLOTS[i].length >= 1) {
                layer.area = VACANT_PLOTS[i][1];
                var Areas = layer.area;
                if (parseInt(Areas) >= parseInt(Area)) {
                    var poly = createPolygon(getLatLongArr(layer[4]));
                    //{ fillColor: '#fff198', strokeColor: '#666666', fillOpacity: 0.8, clickable: !0 }
                    poly.setOptions({ strokeWeight: 6, strokeColor: '#3333cc', fillOpacity: 0 });
                    SerachResult.push(poly);
                }
            }
        }
    }
}


$(document).on('click', '#btnSearchRoute', function (e) {
    e.preventDefault();
    $("#DivRoute").dialog(opt).dialog("open");
});

var CloseDialogs = function () {
    $(".ui-dialog-content").dialog("close");
};

function GetCurrentDetails(Type, Id) {
    ajaxReq('do_it.ashx', 'GetCurrentDetails', { "Type": Type, "Id": Id }, function (resp) { ShowCurrentDetails(resp, Type) }, true);
}

function ShowCurrentDetails(resp, Type) {
    if (resp.status === true) {

        var Details = $.map(resp.data, function (el) { return el; })

        if (Type === "State") {
            $("#lblArea").text("State : ");
            $("#lblType").text("No. of Industrial Area : ");
        }
        else if (Type === "District") {
            $("#lblArea").text("District : ");
            $("#lblType").text("No. of Industrial Area : ");
        }
        else {
            $("#lblArea").text("Industrial Area : ");
            $("#lblType").text("No. of Plots : ");
        }

        $("#lblTotalArea").text("Total Land Bank : ");

        $("#lblAreaName").empty().append(Details[0].Name);
        $("#lblNoOfValue").empty().append(Details[0].TotalNo);
        $("#lblAreaValue").empty().append(Details[0].TotalArea);
        $("#lblAreaValue").append(" Acres");
    }
    else {
        $("#lblArea").text("State : ");
        $("#lblAreaName").text("Uttar Pradesh");

        $("#lblType").text("No. of Districts : ");
    }
}

$(document).on('click', '#Searchindustrye', function (e) {
    e.preventDefault();
    //getcountry(1)
    //getAllDISTRICT(2);
    //getAllIIECompanywise(2);
    //getAllCategory();
});

function ajaxReq(handler, reqType, inData, callbackFun, asyc) {
    if (asyc) asyc = true; else asyc = false;
    $.ajax({
        url: handler + "?request=" + reqType,
        type: "post",
        async: asyc,
        data: inData,
        error: function () {
            // alert("Oops! Something went wrong.");
        }
    }).done(callbackFun);
}

$(document).on('change', '#chkAllImpInfra', function (e) {

    e.preventDefault();

    $(this).closest('table').find('td input[type="checkbox"]').prop('checked', $(this).prop('checked'));
    if (this.checked) {
        $('#chkAllImpInfra').attr("checked", "checked");
        $('#chkAllImpInfra').closest('table').find('td input[type="checkbox"]').prop('checked', true);


    }
    else {
        $('#chkAllImpInfra').closest('table').find('td input[type="checkbox"]').prop('checked', false);
        $('#chkAllImpInfra').closest('table').find('td input[type="checkbox"]').removeAttr('checked');

    }


    //road
    if ($("#chkRoad").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getroadcreate(beach);

        }
    }
    else {
        for (i = 0; i < RDS_LAYER.length; i++) {
            RDS_LAYER[i].setMap(null);
        }

    }

    //Water Connection

    if ($("#chkWaterSupplyLine").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getWatercreate(beach);

        }
    }
    else {
        for (i = 0; i < WTR_LAYER.length; i++) {
            WTR_LAYER[i].setMap(null);
        }

    }
    //Electric Line

    if ($("#chkElectricityLine").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getElinecreate(beach);

        }
    }
    else {
        for (i = 0; i < ELINE_LAYER.length; i++) {
            ELINE_LAYER[i].setMap(null);
        }

    }

    //RailwayTrack
    if ($("#chkRailwayTrack").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getRailwaycreate(beach);

        }
    }
    else {
        for (i = 0; i < RAILWAY_LAYER.length; i++) {
            RAILWAY_LAYER[i].setMap(null);
        }

    }
    //Electric pole
    if ($("#chkElectricityPole").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getEPolecreate(beach);

        }
    }
    else {
        for (i = 0; i < EPOLE_LAYER.length; i++) {
            EPOLE_LAYER[i].setMap(null);
        }

    }

    //Man Hole

    if ($("#chkManHoles").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getmanholecreate(beach);

        }
    }
    else {
        for (i = 0; i < MANHOLE_LAYER.length; i++) {
            MANHOLE_LAYER[i].setMap(null);
        }

    }
    //Gas
    if ($("#chkgas").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getgascreate(beach);

        }
    }
    else {
        for (i = 0; i < GAS_LAYER.length; i++) {
            GAS_LAYER[i].setMap(null);
        }

    }

    //Utitlity

    if ($("#chkutitlity").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getutilitycreate(beach);

        }
    }
    else {
        for (i = 0; i < MISC_LAYER.length; i++) {
            MISC_LAYER[i].setMap(null);
        }

    }

});


$(document).on('change', '#chkallAddiInfra', function (e) {

    e.preventDefault();

    $(this).closest('table').find('td input[type="checkbox"]').prop('checked', $(this).prop('checked'));
    if (this.checked) {
        $('#chkallAddiInfra').attr("checked", "checked");
        $('#chkallAddiInfra').closest('table').find('td input[type="checkbox"]').prop('checked', true);


    }
    else {
        $('#chkallAddiInfra').closest('table').find('td input[type="checkbox"]').prop('checked', false);
        $('#chkallAddiInfra').closest('table').find('td input[type="checkbox"]').removeAttr('checked');

    }


    //Bridge
    if ($("#chkBridge").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getBridgecreate(beach);

        }
    }
    else {
        for (i = 0; i < BRG_LAYER.length; i++) {
            BRG_LAYER[i].setMap(null);
        }

    }

    //Vegitation

    if ($("#chkvegitation").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getvegcreate(beach);

        }
    }
    else {
        for (i = 0; i < VEG_LAYER.length; i++) {
            VEG_LAYER[i].setMap(null);
        }

    }
    //Foot Path

    if ($("#chkFootPath").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getfootpathcreate(beach);

        }
    }
    else {
        for (i = 0; i < FTP_LAYER.length; i++) {
            FTP_LAYER[i].setMap(null);
        }

    }

    //LampPost
    if ($("#chkLampPost").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getlamppostcreate(beach);

        }
    }
    else {
        for (i = 0; i < LAMPPOST_LAYER.length; i++) {
            LAMPPOST_LAYER[i].setMap(null);
        }

    }
    //Comman Area
    if ($("#chkcomman").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getCommanareacreate(beach);

        }
    }
    else {
        for (i = 0; i < COMMON_LAYER.length; i++) {
            COMMON_LAYER[i].setMap(null);
        }

    }

    //Public Purpose

    if ($("#chkpublicpurpose").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getPublicPurposecreate(beach);

        }
    }
    else {
        for (i = 0; i < PUBLIC_PURPOSE_LAYER.length; i++) {
            PUBLIC_PURPOSE_LAYER[i].setMap(null);
        }

    }

});


$(document).on('change', '#chkAllMiscel', function (e) {

    e.preventDefault();

    $(this).closest('table').find('td input[type="checkbox"]').prop('checked', $(this).prop('checked'));
    if (this.checked) {
        $('#chkAllMiscel').attr("checked", "checked");
        $('#chkAllMiscel').closest('table').find('td input[type="checkbox"]').prop('checked', true);


    }
    else {
        $('#chkAllMiscel').closest('table').find('td input[type="checkbox"]').prop('checked', false);
        $('#chkAllMiscel').closest('table').find('td input[type="checkbox"]').removeAttr('checked');

    }


    //Boundary
    if ($("#chkBoundary").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getbndcreate(beach);

        }
    }
    else {
        for (i = 0; i < BND_LAYER.length; i++) {
            BND_LAYER[i].setMap(null);
        }

    }

    //sector

    if ($("#chkSector").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getsectorcreate(beach);

        }
    }
    else {
        for (i = 0; i < SECT_LAYER.length; i++) {
            SECT_LAYER[i].setMap(null);
        }

    }
    //Other

    if ($("#chkother").prop('checked') == true) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getOthercreate(beach);

        }
    }
    else {
        for (i = 0; i < OTHERS_LAYER.length; i++) {
            OTHERS_LAYER[i].setMap(null);
        }

    }

    //Water Tank
    if ($("#chkwatertank").prop('checked') == true) {

        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getWaterheadtankcreate(beach);

        }
    }
    else {
        for (i = 0; i < WATER_HEAD_TANK.length; i++) {
            WATER_HEAD_TANK[i].setMap(null);
        }

    }
    //Parking
    if ($("#chkparking").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getparkingcreate(beach);

        }
    }
    else {
        for (i = 0; i < PARKING_LAYER.length; i++) {
            PARKING_LAYER[i].setMap(null);
        }

    }

    //Water Body

    if ($("#chkWaterBody").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getRivercreate(beach);

        }
    }
    else {
        for (i = 0; i < RIVER_LAYER.length; i++) {
            RIVER_LAYER[i].setMap(null);
        }

    }

    //NALA

    if ($("#chknala").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getNalacreate(beach);

        }
    }
    else {
        for (i = 0; i < NALA_LAYER.length; i++) {
            NALA_LAYER[i].setMap(null);
        }

    }

    //Police Station

    if ($("#chkpolice").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getPoloicestationcreate(beach);

        }
    }
    else {
        for (i = 0; i < POLICE_STATION_LAYER.length; i++) {
            POLICE_STATION_LAYER[i].setMap(null);
        }

    }

    //Fire

    if ($("#chkfire").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getfirestationcreate(beach);

        }
    }
    else {
        for (i = 0; i < FIRE_STATION_LAYER.length; i++) {
            FIRE_STATION_LAYER[i].setMap(null);
        }

    }

    //Encroachment
    if ($("#checkEncroachment").prop('checked') == true) {
        for (i = 0; i < CITY_NAME.length; i++) {
            var beach = CITY_NAME[i];
            getencroachmentcreate(beach);

        }
    }
    else {
        for (i = 0; i < ENCROACHMENT_LAYER.length; i++) {
            ENCROACHMENT_LAYER[i].setMap(null);
        }

    }
});

var availableTags = [
];

//function FetchData() {
//    ajaxReq('do_it.ashx', 'IIE_Auto', {}, function (resp) { showautocomp(resp) }, false);
//}
//function showautocomp(resp) {
//    if (resp.status == true) {
//        var dd = $.map(resp.data, function (el) { return el; })
//        availableTags = [];
//        // debugger;
//        for (var xx = 0; xx < dd.length; xx++) {
//            var availableTag = [];
//            availableTag.id = dd[xx].Recno;
//            availableTag.name = dd[xx].Name;
//            availableTags.push(availableTag);
//        }
//    }
//}
//$(function () {
//    FetchData();
//    $("#tags").autocomplete({
//        source: function (request, response) {
//            response($.map(availableTags, function (value, key) {
//                if (value.name.toUpperCase().indexOf(request.term.toUpperCase()) > -1) {
//                    return {
//                        label: value.name,
//                        value: value.id
//                    }
//                }
//            }));

//        },
//        select: function (event, ui) {
//            event.preventDefault();
//            $("#tags").val(ui.item.label);
//            showAutoIndustrial(ui.item.value);

//        }
//    });

//});
function getAdvertiserinfo(AdvertiserID) {

   
    ajaxReq('Handler.ashx', 'AdvertiserIDinfo', { "AdvertiserID": AdvertiserID }, function (resp) { showAdvertiserinfo(resp, AdvertiserID) }, true);
   
}

function showAdvertiserinfo(resp, AdvertiserID) {
    $(".ui-dialog-content").dialog("close");

    if (resp.status === true) {
        var tbl = $('.infomain table').empty();      
        tbl.empty();
        // tbl.append('<tr><td >Plot No</td><td style="font-weight:bold;">' + plot + '</td></tr>');
        $.each(resp.data, function (indx, itm) {
            // tbl.append('<tr><td>' + indx + '</td><td style="font-weight:bold;">' + itm + (indx == 'AdvertiserID' ? ' sq. mtr' : '') + '</td></tr>');
            tbl.append('<tr><td>' + indx + '</td><td style="font-weight:bold;">' + itm + (indx == 'AdvertiserID' ? ' sq. mtr' : '') + '</td></tr>');
    
            if (AdvertiserID > 0) {
                $(".infolower").empty();
                $(".infolower").css('visibility', 'visible');
                var url = "PlayMyVideo.aspx?id=" + AdvertiserID;
                $(".infolower").append('<a id="btnApply" class="btn btn-danger" target="_blank" href="' + url + '">Play vedio</a>')
            }
        });
        $("#Plotinfo").dialog(opt).dialog("open");
    }
}






//    if (resp.status === true) {
//        var tbl = $('.infomain table').empty();
//        tbl.empty();

//        $.each(resp.data, function (indx, itm) {
//            tbl.append('<tr><td>' + indx + '</td><td style="font-weight:bold;">' + itm + (indx == 'AdvertiserID' ? ' sq. mtr' : '') + '</td></tr>');
//            if (AdvertiserID > 0) {
//                $(".infolower").empty();
//                $(".infolower").css('visibility', 'visible');
//                var url = "PlayMyVideo.aspx?id=" + AdvertiserID;
//                $(".infolower").append('<a id="btnApply" class="btn btn-danger" target="_blank" href="' + url + '">Play vedio</a>')
//            }
//        });
       
//       $("#DIVdiseaseswiseplant1").dialog(opt).dialog("open");
//    }
//}

//function showAutoIndustrial(ind_id) {
//    GetCurrentDetails("IE", ind_id);
//    ajaxReq('do_it.ashx', 'IndBoundary', { "Ind_Recno": ind_id }, function (resps) { BindIndBoundary(resps, ind_id) }, true);
//}

//$(document).on('change', '#OpacityRange', function () {
//    var Value = $(this).val() * 100;
//    Value = Value.toFixed(0);
//    $('#demo').html(Value);

//    var Opacity = ($('#demo').html() / 100);

//    for (var i = 0; i < Polys.length; i++) {
//        var Poly = Polys[i];
//        Poly.setOptions({ fillOpacity: Opacity });
//    }
//}

//});