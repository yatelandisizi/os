
var Ops = {
    version: "1.0",
    id: "opsjs",
    debugkey: "opsdebug",
    getVersion: function (key, def) {
        if (location.search.indexOf(this.debugkey+"=1") == -1 && !this.getCookie(this.debugkey)) {
            return def;
        }
        if (typeof(_jsQuery) == "undefined") {
            _jsQuery = {};
            if (this.getCookie(this.debugkey)) {
                //remove debug
                if (location.search.indexOf(this.debugkey+"=0") != -1) {
                    this.delCookie(this.debugkey);
                    return def;
                }
                var query = this.getCookie(this.debugkey);
            } else {
                var query = location.search.substr(1);
                //enabled debug
                this.setCookie(this.debugkey, query);
            }
            var a = query.split("&");
            for (var k in a) {
                var s = a[k].split("=");
                if (s.length == 2) {
                    _jsQuery[s[0]] = s[1];
                }
            }
        }
        var def = def || ".";
        return key == undefined ? _jsQuery : (_jsQuery[key] == undefined ? def : _jsQuery[key]);
    },
    
    getJsPath: function (js) {
        var path = "";
        var script = document.getElementById(this.id); 
        if (script != undefined) {
            var s = script.src.split(js);
            path = s[0];
        } else {
            var scripts = document.getElementsByTagName("script");
            for (var i = 0, l = scripts.length; i < l; i++) {
                var src = scripts[i].src;
                if (src.indexOf(js) != -1) {
                    var s = src.split(js);
                    path = s[0];
                    break;
                }
            }
        }
        var href = window.location.href;
        var plen = "https://".length;
        var pos = href.substring(plen,href.length).indexOf("/");
        if (pos != -1)
        	href = href.substr(0, plen+pos);
        if (/^(http:|https:|file:)/.test(path) == false) {
            path = path.substr(0,1) == "/" ? href + path : href + "/" + path;
        }
        return path;
    },

	setCookie: function (name,value,exp,path,domain) {
        var exp = exp || 0;
        var et = new Date();
        if ( exp != 0 ) {
            et.setTime(et.getTime() + exp*3600000);
        } else {
            et.setHours(23); et.setMinutes(59); et.setSeconds(59); et.setMilliseconds(999);
        }
        var more = "";
        var path = path || "/";
        var domain = domain || "";
        if (domain != "")
            more += "; domain="+domain;
        more += "; path="+path;
        document.cookie = name + "=" + escape(value) + more + "; expires=" + et.toGMTString();
    },

    getCookie: function (name) {
        var res = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
        return null != res ? unescape(res[2]) : null;
    },

    delCookie: function(name) {
        var value = this.getCookie(name);
        if (null != value) { this.setCookie(name,value,-9); }
    },
    
    jsLoaded: {},
    loadJs: function(url) {
        var key = url;
        if (this.jsLoaded[key] != undefined) {
            return true;
        }
        if (Ops.config[url] != undefined) {
            url = Ops.config[url];
        } else if (url.indexOf("/") == -1 && url.slice(-3) != ".js") {
            url = "jquery/jquery."+url+".min.js";
        }
        if (url.substr(0, 7) == "jquery.") {
            url = "jquery/"+url;
        }
        url = this.getVersion(key, url);
        var jsUrl = /^(\/|http:|https:|file:)/.test(url) ? url : Ops.jsPath + url;
        if (jsUrl.slice(-3) != ".js" && jsUrl.indexOf("?") == -1) {
            jsUrl += ".js";
        }
        this.jsLoaded[key] = jsUrl;
        document.write('<sc'+'ript src="'+jsUrl+'"></sc'+'ript>');
        return true;
    },

    load: function(name) {
        if (typeof(name) == "string") {
            name = name.split(",");
        }
        for (var k in name) {
            this.loadJs(name[k]);
        }
    }
};


Ops.config = {
    "jquery":"jquery.min.js"
};

Ops.jsPath= Ops.getJsPath("ops.js");

var loadJquery = true;
var opsjsId = document.getElementById(Ops.id);
if (opsjsId) {
    if (opsjsId.getAttribute("jquery") == "false")
        loadJquery = false;
    else 
        Ops.loadJs("jquery");

    var opsjs = opsjsId.getAttribute(Ops.id);
    if (opsjs) {
        Ops.load(opsjs);
    }

} else {
    Ops.loadJs("jquery");
}

Ops.isMobile = function() {
    var ua = navigator.userAgent.toLowerCase();
    if (/android|iphone|ipad|ios|hpwos|blackberry|symbian|iemobile/.test(ua)) 
        return true;
    return false;
}

Ops.isIE6 = function() {
    if ($.browser.msie && $.browser.version < 7)
        return true;
    return false;
}

Ops.formatMoney = function() {
    var args = arguments;
    var money = args[0];
    if (!money)
        money = 0;
    if (typeof(money) != "string")
        money = money.toString();
    var line = "";
    if (money.substr(0, 1) == "-") {
        line = "-";
        money = money.substr(1);
    }

    var num = args[1] || 2;
    var width = args[2] || 3;
    var flag = args[3] || ",";
    
    var moneyArr = money.split(".");
    var moneyLeft = moneyArr[0];
    var len = moneyLeft.length;
    var moneyRight = moneyArr[1] || "";
    if (moneyRight != "") {
        while(moneyRight.length < num)
            moneyRight += "0";
        moneyRight = moneyRight.substr(0, num);
    }
    
    var i = len % width;
    if (i == 0)
        money = "";
    else
        money = moneyLeft.substr(0, i)+flag;
    for (; i < len; i += width) {
        money += moneyLeft.substr(i, width)+flag;
    }
    money = money.substr(0, money.length-1);
    if (moneyRight != "")
        money += "."+moneyRight;
    return line+money;
}

Ops.getMoney = function(money, flag) {
    if (!money)
        money = 0;
    var flag = flag || false;
    if (typeof(money) != "string")
        money = money.toString();
    money = money.replace(/,/g, "");
    if (flag === true)
        return parseInt(money);
    else if (flag === 1)
        return parseFloat(money).toFixed(2);
    else
        return parseFloat(money);
}
Ops.striptags = function(str){
	str = str.replace(/<\/?[^>]*>/g,'');
	return str;
}
Ops.remainprogress = function(amount,remainamount){
	amount = parseFloat(amount);
	remainamount = parseFloat(remainamount);
	if(amount<=0 || remainamount>amount)
		return false;	
	var progress = (amount-remainamount)/amount*100;	
	return progress.toFixed(0);
}
Ops.spreadbtn	=	function(className){
	var btn = $("."+className);
	if(btn.size()<1)
		return;
	btn.each(function(){
		$(this).click(function(){
			var objid = $(this).attr('obj');
			$("#"+objid).slideToggle('fast');
			var html = $(this).html();
			var html2 = html.slice(2);
			$(this).html(html.indexOf('查看') != -1 ? '关闭'+html2 : '查看'+html2);			
		})
	})
}