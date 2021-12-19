//var Loader = function () { }
//Loader.prototype = {
//    root: '',// 'http://208.109.205.153/',
//    require: function (scripts, callback) {
//        this.loadCount = 0;
//        this.totalRequired = scripts.length;
//        this.callback = callback;

//        for (var i = 0; i < scripts.length; i++) {
//            this.writeScript(scripts[i]);
//        }
//    },
//    loaded: function (evt) {
//        this.loadCount++;

//        if (this.loadCount == this.totalRequired && typeof this.callback == 'function') this.callback.call();
//    },
//    writeScript: function (src) {
//        var self = this;
//        var s = document.createElement('script');
//        s.type = "text/javascript";
//        s.async = true;
//        s.src = src;
//        s.addEventListener('load', function (e) { self.loaded(e); }, false);
//        var head = document.getElementsByTagName('head')[0];
//        head.appendChild(s);
//    }
//}

//function getEngine() {
//    (new Loader()).require(["js/gOverlay.js"], function () { });
//    (new Loader()).require(["js/data.js"], function () { });
//    (new Loader()).require(["js/app.js"], function () { initialize() });
//}

//google.maps.event.addDomListener(window, 'load', getEngine);

google.maps.event.addDomListener(window, 'load', initialize);


