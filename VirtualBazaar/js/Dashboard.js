function getvideoviewDuration(Charttype, Year, Month, Advertiser, Category) {
    ajaxReq('Handler.ashx', 'getviedoview', { "Year": Year, "Month": Month, "Advertiser": Advertiser, "Category": Category }, function (resp) { showvideoview(resp, Charttype) }, true);
}

function ajaxReq(handler, reqType, data, callbackFun, asyc) {
    if (asyc) asyc = true; else asyc = false;
    $.ajax({
        url: handler + "?request=" + reqType,
        type: "post",
        async: asyc,
        data: data,
        error: function () {
            // alert("Oops! Something went wrong."); 
        }
    }).done(callbackFun);
}

function showvideoview(resp, Charttype) {
    if (resp.status === true) {

        var year = $('#ddlYear option:selected').val();
        var months = $('#ddlMonth option:selected').text();
        var Category = $('#ddlCategory option:selected').text();
        var Advertiser = $('#ddlAdvertiser option:selected').text();
        if (year == 0 && months == "All") {
            var value = "All Years";
        }
        else if (year != 0 && months == "All") {
            value = year;
        }
        else if (year != 0 && months != "All") {
            value = months + ',' + year;
        }
        else {
            value = "All Years";
        }

        var arr = $.map(resp.data, function (el) { return el; })

        var Datapoints = [];
        var x = [];
        var y = [];

        if (arr.length > 0) {
            for (var i = 0; i < arr.length; i++) {
                if ((i % 2) === 0) {
                    x.push(arr[i]);
                    y.push(arr[i + 1]);
                }
            }
        }

        for (var i = 0; i < x.length; i++) {
            Datapoints.push({ label: x[i], y: parseInt(y[i]) });
        }

        var options = {
            theme: "theme1",
            exportEnabled: true,
            zoomEnabled: true,
            height: 348,
            width: 1163,
            title: {
                text: "Veiw Report" + ' - ' + value,
                fontSize: 12,
                fontFamily: "verdana"
            },
            animationEnabled: true,
            bubble: {
                textStyle: {
                    fontSize: 30,
                    fontName: 'Times-Roman',
                    color: 'green',
                    bold: true,
                    italic: true
                }
            },
            data: [
            {
                type: Charttype, //change it to line, area, column, pie, etc
                dataPoints: Datapoints
            }
            ],
            axisX: {
                labelFontSize: 10,
                fontFamily: "verdana",
                labelAngle: 40
            }
        };

        $("#ViewVedioChart").CanvasJSChart(options);
    }
}
$(document).on('change', '#ddlAdvertiser', function (e) {
    e.preventDefault();
    debugger;
    var ChartType = $('#ddl2 option:selected').val();
    var Year = $('#ddlYear option:selected').text();
    var Month = $('#ddlMonth option:selected').text();
    var Category = $('#ddlCategory option:selected').text();
    var Advertiser = $('#ddlAdvertiser option:selected').text();
    getvideoviewDuration(ChartType, Year, Month, Advertiser, Category);

});
$(document).on('change', '#ddlCategory', function (e) {
    e.preventDefault();
    debugger;
    var ChartType = $('#ddl2 option:selected').val();
    var Year = $('#ddlYear option:selected').text();
    var Month = $('#ddlMonth option:selected').text();
    var Category = $('#ddlCategory option:selected').text();
    var Advertiser = $('#ddlAdvertiser option:selected').text();
    getvideoviewDuration(ChartType, Year, Month, Advertiser, Category);

});

$(document).on('change', '#ddl2', function (e) {
    e.preventDefault();
    debugger;
    var ChartType = $('#ddl2 option:selected').val();
    var Year = $('#ddlYear option:selected').text();
    var Month = $('#ddlMonth option:selected').text();
    var Category = $('#ddlCategory option:selected').text();
    var Advertiser = $('#ddlAdvertiser option:selected').text();
    getvideoviewDuration(ChartType, Year, Month, Advertiser, Category);

});

$(document).on('change', '#ddlYear', function (e) {
    e.preventDefault();
    var ChartType = $('#ddl2 option:selected').val();
    var Year = $('#ddlYear option:selected').val();
    var Month = $('#ddlMonth option:selected').text();
    var Category = $('#ddlCategory option:selected').text();
    var Advertiser = $('#ddlAdvertiser option:selected').text();
    if (Year == 0) {
        $('#ddlMonth').hide();
    }
    else {
        $('#ddlMonth').show();
    }
    getvideoviewDuration(Charttype, Year, Month, Advertiser, Category);
    // getEgovernanceStatus(ChartType, Year, Month);
});

$(document).on('change', '#ddlMonth', function (e) {
    e.preventDefault();
    var ChartType = $('#ddl2 option:selected').val();
    var Year = $('#ddlYear option:selected').val();
    var Month = $('#ddlMonth option:selected').text();
    var Category = $('#ddlCategory option:selected').text();
    var Advertiser = $('#ddlAdvertiser option:selected').text();
    getvideoviewDuration(Charttype, Year, Month, Advertiser, Category);
    //
});
//add by manish


$(document).on('click', '#chk1', function () {
    if ($('#chk1').is(':checked')) {

        var ChartType = $('#ddl1 option:selected').val();
        var Year = $('#ddlYear option:selected').val();
        var Month = $('#ddlMonth option:selected').val();


        getEgovernanceStatus(ChartType, Year, Month);

        if (Year == 0) {
            $('#ddlMonth').hide();
        }
        else {
            $('#ddlMonth').show();
        }

        $("#divSchemeStatusChart").show();
        checkvalue();
    }
    else {
        $("#divSchemeStatusChart").hide();
        checkvalue();
    }
});

function getAdvertiserwiseDetails(Charttype, Year, Month, Advertiser) {
    debugger
    ajaxReq('../Handler.ashx', 'AdvertiserwiseDetails', { "Year": Year, "Month": Month, "Advertiser": Advertiser }, function (resp) { showAdvertiserwiseDetails(resp, Charttype) }, true);
}

function showAdvertiserwiseDetails(resp, Charttype) {
    debugger
    if (resp.status === true) {

        var year = $('#ddlyear option:selected').val();
        var months = $('#ddlMonth option:selected').text();

        if (year == 0 && months == "All") {
            var value = "All Years";
        }
        else if (year != 0 && months == "All") {
            value = year;
        }
        else if (year != 0 && months != "All") {
            value = months + ',' + year;
        }
        else {
            value = "All Years";
        }

        var arr = $.map(resp.data, function (el) { return el; })

        var Datapoints = [];
        var x = [];
        var y = [];

        if (arr.length > 0) {
            for (var i = 0; i < arr.length; i++) {
                if ((i % 2) === 0) {
                    x.push(arr[i]);
                    y.push(arr[i + 1]);
                }
            }
        }

        for (var i = 0; i < x.length; i++) {
            Datapoints.push({ label: x[i], y: parseInt(y[i]) });
        }

        var options = {
            theme: "theme1",
            exportEnabled: true,
            zoomEnabled: true,
            height: 348,
            width: 1100,
            title: {
                text: "Veiw Report" + ' - ' + value,
                fontSize: 12,
                fontFamily: "verdana"
            },
            animationEnabled: true,
            bubble: {
                textStyle: {
                    fontSize: 30,
                    fontName: 'Times-Roman',
                    color: 'green',
                    bold: true,
                    italic: true
                }
            },
            data: [
            {
                type: Charttype, //change it to line, area, column, pie, etc
                dataPoints: Datapoints
            }
            ],
            axisX: {
                labelFontSize: 10,
                fontFamily: "verdana",
                labelAngle: 40
            }
        };

        $("#DashboardChart").CanvasJSChart(options);
    }
}

$(document).on('change', '#ddl8', function (e) {
    e.preventDefault();
    var ChartType = $('#ddl8 option:selected').val();
    var Year = $('#ddlyear option:selected').val();
    var Month = $('#ddlyear option:selected').val();

    getAdvertiserwiseDetails(ChartType, Year, Month);
});

$(document).on('change', '#ddlyear', function (e) {

    e.preventDefault();
    var ChartType = $('#ddl8 option:selected').val();
    var Year = $('#ddlyear option:selected').val();
    getAdvertiserwiseDetails(ChartType, Year);
});

$(document).on('change', '#ddlSchemeMonth', function (e) {
    e.preventDefault();
    var ChartType = $('#ddl2 option:selected').val();
    var Year = $('#ddlSchemeYear option:selected').val();
    var Month = $('#ddlSchemeMonth option:selected').val();

    getSchemeStatus(ChartType, Year, Month);
});

function getVediocount(Charttype, Year, Month, Advertiser) {
    debugger
    ajaxReq('../Handler.ashx', 'Vediocount', { "Year": Year, "Month": Month, "Advertiser": Advertiser }, function (resp) { showVediocount(resp, Charttype) }, true);
}
function showVediocount(resp, Charttype) {
    debugger
    if (resp.status === true) {

        var year = $('#ddlyear option:selected').val();
        var months = $('#ddlMonth option:selected').text();

        if (year == 0 && months == "All") {
            var value = "All Years";
        }
        else if (year != 0 && months == "All") {
            value = year;
        }
        else if (year != 0 && months != "All") {
            value = months + ',' + year;
        }
        else {
            value = "All Years";
        }

        var arr = $.map(resp.data, function (el) { return el; })

        var Datapoints = [];
        var x = [];
        var y = [];

        if (arr.length > 0) {
            for (var i = 0; i < arr.length; i++) {
                if ((i % 2) === 0) {
                    x.push(arr[i]);
                    y.push(arr[i + 1]);
                }
            }
        }

        for (var i = 0; i < x.length; i++) {
            Datapoints.push({ label: x[i], y: parseInt(y[i]) });
        }

        var options = {
            theme: "theme1",
            exportEnabled: true,
            zoomEnabled: true,
            height: 348,
            width: 1100,
            title: {
                text: "Veiw Report" + ' - ' + value,
                fontSize: 12,
                fontFamily: "verdana"
            },
            animationEnabled: true,
            bubble: {
                textStyle: {
                    fontSize: 30,
                    fontName: 'Times-Roman',
                    color: 'green',
                    bold: true,
                    italic: true
                }
            },
            data: [
            {
                type: Charttype, //change it to line, area, column, pie, etc
                dataPoints: Datapoints
            }
            ],
            axisX: {
                labelFontSize: 10,
                fontFamily: "verdana",
                labelAngle: 40
            }
        };

        $("#DashboardChartvediocount").CanvasJSChart(options);
    }
}

$(document).on('change', '#ddl1', function (e) {
    e.preventDefault();
    var ChartType = $('#ddl8 option:selected').val();
    var Year = $('#ddlyear option:selected').val();
    var Month = $('#ddlyear option:selected').val();

    getVediocount(ChartType, Year, Month);
});
$(document).on('change', '#ddlyear1', function (e) {

    e.preventDefault();
    var ChartType = $('#ddl1 option:selected').val();
    var Year = $('#ddlyear1 option:selected').val();
    getVediocount(ChartType, Year);
});
$(document).on('change', '#ddlCategory', function (e) {
    e.preventDefault();
    debugger;

    var ChartType = $('#ddl1 option:selected').val();
    var Year = $('#ddlyear1 option:selected').val();
    getVediocount(ChartType, Year, Month);

});
$(document).on('click', '#chk4', function () {
    if ($('#chk4').is(':checked')) {

        var ChartType = $('#ddl2 option:selected').val();
        var Year = $('#ddlSchemeYear option:selected').val();
        var Month = $('#ddlSchemeMonth option:selected').val();

        getSchemeStatus(ChartType, Year, Month);

        if (Year == 0) {
            $('#ddlSchemeMonth').hide();
        }
        else {
            $('#ddlSchemeMonth').show();
        }

        $("#divSchemeChart").show();
        checkvalue();
    }
    else if ($(this).prop("checked") == false) {
        $("#divSchemeChart").hide();
        checkvalue();
    }
});


$(function () {
    $("#Plotinfo").dialog({
        modal: true,
        autoOpen: false,
        title: "Information",
        width: 500,
        height: 300
    });
    //$("#btnShow").click(function () {
    //    $('#dialog').dialog('open');
    //});
});
function getInfo(AdvertiserID) {

    // var city = city_name;
    ajaxReq('Handler.ashx', 'AdvertiserIDinfo', { "AdvertiserID": AdvertiserID }, function (resp) { showPlotInfo(resp, AdvertiserID) }, true);
    $('.statsDIv').hide();
}

function showPlotInfo(resp, AdvertiserID) {

    if (resp.status === true) {
        var tbl = $('.infomain table').empty();
        tbl.empty();

        $.each(resp.data, function (indx, itm) {
            tbl.append('<tr><td>' + indx + '</td><td style="font-weight:bold;">' + itm + (indx == 'AdvertiserID' ? ' sq. mtr' : '') + '</td></tr>');
            if (AdvertiserID > 0) {
                $(".infolower").empty();
                $(".infolower").css('visibility', 'visible');
                var url = "PlayMyVideo.aspx?id=" + AdvertiserID;
                $(".infolower").append('<a id="btnApply" class="btn btn-danger" target="_blank" href="' + url + '">Play vedio</a>')
            }
        });
        //$("#Plotinfo").dialog(opt).dialog("open");
        $("#Plotinfo").dialog("open")
    }
}


