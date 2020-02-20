(function (window) {
    //string 与 json 相互转换
    window.strToJson = function (str) {
        var str = str || "";
        var json = {};
        var arr = str.split("&");
        for (var i = 0; i < arr.length; i++) {
            var arr2 = arr[i].split("=");
            json[arr2[0]] = arr2[1];
        }
        return json;
    };
    window.jsonToStr = function (json) {
        var json = json || {};
        var arr = [];
        for (var name in json) {
            arr.push(name + "=" + json[name]);
        }
        return arr.join("&")
    };
    //添加  同盾设备指纹的对接 2017/12/05 start
    window.getTokenFun = function(){
        
        var tokenId = "yycjt-" +new Date().getTime() + "-"+ Math.random().toString(16).substr(2);   
        _fmOpt = {
            partner: 'yycjt',
            appName: 'yycjt_web',
            token: tokenId
        };
        var cimg = new Image(1,1);
        cimg.onload = function() {
            _fmOpt.imgLoaded = true;
        };
        cimg.src = "https://fp.fraudmetrix.cn/fp/clear.png?partnerCode=yycjt&appName=yycjt_web&tokenId=" + _fmOpt.token;
        var fm = document.createElement('script'); fm.type = 'text/javascript'; fm.async = true;
        fm.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'static.fraudmetrix.cn/fm.js?ver=0.1&t=' + (new Date().getTime()/3600000).toFixed(0);
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(fm, s);
        
    };
    //添加  同盾设备指纹的对接 2017/12/05 end
    //获取URL参数
    window.getUrlParam = function () {
        getTokenFun();
        if (window.location.search) {
            return strToJson(window.location.search.substring(1));
        } else {
            return {};
        }
    };

    //定义全局变量对象
    window.wData = {};
    //商户ID,用于查询商户信息的唯一标示,在url中获取参数
    //wData.otid = getUrlParam().otid;
    wData.token=getUrlParam().token;
    //wData.memberType = getUrlParam().memberType;
    wData.memberType = 1;
    //存储通过token查询成功后的用户全部信息
    wData.userInfo = {};
    //存储请求路径
    wData.urlPath = {
        base: "/togetherCashier",
        submit: "/factoring/recharge/pay/online",
        get2Dcode: "/factoring/recharge/pay/weChatPay/pay/pay",
        getBankList: "/agent/factoring/recharge/pay/queryPayChannelList.do",
        getOrderInfo:'/agent/factoring/recharge/pay/getOrderInfo.do',
        resendSms:'/factoring/recharge/pay/paymentSubmitJson',
        pay:'/factoring/recharge/pay/waitResultJson',
        checkBankCard:'/factoring/recharge/pay/checkCardBin',
        getQpayStatus:'/agent/factoring/recharge/pay/queryPayResult.do',
        onlinePay:'/agent/factoring/recharge/pay/online/pay.do',
        getBankMsgList:'../bankMsgList',
        getPayTransferSerialNo:'/factoring/recharge/pay/getPayTransferSerialNo',

        //B2C网银
        queryOrderBankList: '/factoring/recharge/pay/online/queryOrderBankList.json',  //查询交易信息和绑卡信息
        onlinebankpay: '/factoring/recharge/pay/online/onlineBankpay.json',  //网银跳转
        onlineBankHelp: '/help/enterpriseHelp/help-fkfs-2.html'  //网银支付帮助中心
    };


    //设置URL参数
    window.setUrlParam = function (url, obj) {
        var arr = [];
        for (var key in obj) {
            arr.push(key + "=" + obj[key]);
        }
        return url + "?" + arr.join("&")
    };

    //转成2为小数
    window.showFloatNum = function (num) {
        var str = "" + num;
        var arr = str.split(".");
        if (arr.length == 2) {
            if (arr[1].split("").length == 2) {
                return str
            } else {
                return str + "0"
            }
        } else {
            return str + ".00"
        }
    };
    window.wToAmount=function(str){
        str=str.toString();
        if(str==null||str==""||str==undefined){
            return "0.00";
        }else if(str.length==1){
            return "0.0"+str;
        }else if(str.length==2){
            return "0."+str;
        }else{
            var strM="."+str.substring(str.length-2,str.length);
            str=str.substring(0,str.length-2);
            while(str.length>3){
                strM=","+str.substring(str.length-3,str.length)+strM;
                str=str.substring(0,str.length-3);
            }
            return str+strM;
        }
    };
    //查询当前所用浏览器
    window.queryBrowser = function () {
        var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
        var isChrome = userAgent.indexOf("Chrome") > -1; //判断是否是谷歌浏览器
        var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器
        var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
        var isFF = userAgent.indexOf("Firefox") > -1; //判断是否Firefox浏览器
        var isSafari = userAgent.indexOf("Safari") > -1; //判断是否Safari浏览器
        if (isIE) {
            var IE5 = IE55 = IE6 = IE7 = IE8 = false;
            var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
            reIE.test(userAgent);
            var fIEVersion = parseFloat(RegExp["$1"]);
            IE55 = fIEVersion == 5.5;
            IE6 = fIEVersion == 6.0;
            IE7 = fIEVersion == 7.0;
            IE8 = fIEVersion == 8.0;
            if (IE55) {
                return "IE55";
            }
            if (IE6) {
                return "IE6";
            }
            if (IE7) {
                return "IE7";
            }
            if (IE8) {
                return "IE8";
            }
        }//isIE end
        if (isFF) {
            return "FF";
        }
        if (isOpera) {
            return "Opera";
        }
        if (isChrome) {
            return "Chrome";
        }
        if (isSafari) {
            return "Safari";
        }
    };

    //单个绑定click事件
    window.wBind=function(element,fun){
        $(element).click(App[fun]);
    };
    //给元素绑定click事件
    window.wBindList=function(bindList){
        $.each(bindList, function(name, value) {
            $(name).click(App[value]);
        });
    };

    //阻止click延迟点击效果
    window.unClick = function(){
        if($("#unClick").length>0){
            $("#unClick").show();
        }else{
            $("body").append('<div id="unClick"></div>');
        }
        setTimeout(function(){$("#unClick").hide();},400);
    };
    window.wAlert = function(msg,callback,isConfirm,btn){
        var divHtml ="",
            msgHtml = "",
            pHtml = "",
            btn_sure = "确定",
            btn_cancel = "取消",
            callback = callback;
        btn && btn[0] && (btn_sure = btn[0]);
        btn && btn[1] && (btn_cancel = btn[1]);
        if(typeof(msg)=="string"){
            msgHtml = msg;
        }else{
            $.each(msg,function(key,value){
                msgHtml+="<p>"+value+"</p>";
            });
        }
        if(isConfirm){
            pHtml = '<p key="sure" class="border_right">'+btn_sure+'</p><p key="cancel" style="color:#9C9B9B;">'+btn_cancel+'</p>';
        }else{
            pHtml = '<p key="sure">'+btn_sure+'</p>';
        }
        if(!$("#maskLayer").length>0){
            divHtml = '<div class="maskLayer" id="maskLayer">' +
                '<div id="wAlert"><div id="wAlertText">'+msgHtml+'</div>' +
                '<div id="wAlertBtn">'+pHtml+'</div></div>' +
                '</div>';
            $("body").append(divHtml);
        }else{
            document.getElementById("wAlertText").innerHTML = msgHtml;
            document.getElementById("wAlertBtn").innerHTML = pHtml;
            document.getElementById("maskLayer").style.display ="block";
        }
        $("#wAlertBtn p").click(function(e){
            var target = $(e.currentTarget),
                key = target.attr("key"),
                result = false;
            key=="sure" && (result = true);
            callback && callback(result);
            document.getElementById("maskLayer").style.display = "none";
            unClick();
        });
    };
    //loading模块
    window.wLoading = {
        html: '<div class="shade"><div class="loading"><div class="loading_img"></div></div></div>',
        start: function (id) {
            if ($(".shade").length > 0) {
                $(".shade").show();
            } else {
                $("body").append(this.html);
            }
        },
        stop: function (id) {
            $(".shade").hide();
        }
    };

    //ajax post请求
    window.wAjax = function (url, token, data, success, error, options, unload) {
        //默认成功处理方式
        var wSuccess = function (data) {
            !unload && wLoading.stop();
            if (success) {
                typeof data == "string" && (data = JSON.parse(data));
                success(data);
            }
        };
        var wError = function (data) {
            !unload && wLoading.stop();
            if (error) {
                error(data);
            }
        };
        !unload && wLoading.start();
        var headersData = {},
            ajaxUrl = "";
        if(wData.urlPath[url]!=undefined&&wData.urlPath[url]!=null&&wData.urlPath[url]!="") {
            ajaxUrl =  wData.urlPath[url];
        }else{
            ajaxUrl=url;
        }
        var ajaxOptions = {
            type: "post",
            url: ajaxUrl, //默认接口地址写死
            dataType: "json",
            data: JSON.stringify(data),
            headers: headersData,
            contentType: 'application/json;charset=UTF-8',
            success: wSuccess,
            error: wError,
            beforeSend: function (request) {
                request.setRequestHeader("WxETopToken", token);
            }
        };
        $.ajax(ajaxOptions);
    };

    //ajax get请求
    window.wAjaxGet = function (url, token, data, success, error, options, unload) {
        //默认成功处理方式
        var wSuccess = function (data) {
            !unload && wLoading.stop();
            if (success) {
                typeof data == "string" && (data = JSON.parse(data));

                success(data);

            }
        };
        var wError = function (data) {
            !unload && wLoading.stop();
            if (error) {
                error(data);
            }
        };
        !unload && wLoading.start();
        var headersData = {},
            ajaxUrl = "";
        if(wData.urlPath[url]!=undefined&&wData.urlPath[url]!=null&&wData.urlPath[url]!="") {
            ajaxUrl = wData.urlPath[url];
        }else{
            ajaxUrl=url;
        }
        var ajaxOptions = {
            type: "get",
            url: ajaxUrl, //默认接口地址写死
            dataType: "json",
            data: JSON.stringify(data),
            headers: headersData,
            contentType: 'application/json;charset=UTF-8',
            success: wSuccess,
            error: wError,
            beforeSend: function (request) {
                request.setRequestHeader("WxETopToken", token);
            }
        };
        $.ajax(ajaxOptions);
    };
    window.wAjaxFormNoBG=function(url, token, data, success, error, options, unload) {
        //默认成功处理方式
        var wSuccess = function (data) {
            if (success) {
                typeof data == "string" && (data = JSON.parse(data));

                success(data);

            }
        };
        var wError = function (data) {
            if (error) {
                error(data);
            }
        };
        var headersData = {},
            ajaxUrl = "";
        if(wData.urlPath[url]!=undefined&&wData.urlPath[url]!=null&&wData.urlPath[url]!="") {
            ajaxUrl = wData.urlPath[url];
        }else{
            ajaxUrl=url;
        }
        var ajaxOptions = {
            type: "post",
            url: ajaxUrl, //默认接口地址写死
            dataType: "json",
            data: data,
            headers: headersData,
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            success: wSuccess,
            error: wError,
            beforeSend: function (request) {
                request.setRequestHeader("WxETopToken", token);
            }
        };
        $.ajax(ajaxOptions);
    };
    window.wAjaxForm=function(url, token, data, success, error, options, unload) {
        //默认成功处理方式
        var wSuccess = function (data) {
            !unload && wLoading.stop();
            if (success) {
                typeof data == "string" && (data = JSON.parse(data));

                success(data);

            }
        };
        var wError = function (data) {
            !unload && wLoading.stop();
            if (error) {
                error(data);
            }
        };
        !unload && wLoading.start();
        var headersData = {},
            ajaxUrl = "";
        if(wData.urlPath[url]!=undefined&&wData.urlPath[url]!=null&&wData.urlPath[url]!="") {
            ajaxUrl = wData.urlPath[url];
        }else{
            ajaxUrl=url;
        }
        var ajaxOptions = {
            type: "post",
            url: ajaxUrl, //默认接口地址写死
            dataType: "json",
            data: data,
            headers: headersData,
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            success: wSuccess,
            error: wError,
            beforeSend: function (request) {
                request.setRequestHeader("WxETopToken", token);
            }
        };
        $.ajax(ajaxOptions);
    };
    //ajax form-get请求
    window.wAjaxFormGet = function (url, token, data, success, error, options, unload) {
        //默认成功处理方式
        var wSuccess = function (data) {
            !unload && wLoading.stop();
            if (success) {
                typeof data == "string" && (data = JSON.parse(data));

                success(data);

            }
        };
        var wError = function (data) {
            !unload && wLoading.stop();
            if (error) {
                error(data);
            }
        };
        !unload && wLoading.start();
        var headersData = {},
            ajaxUrl = "";
        if(wData.urlPath[url]!=undefined&&wData.urlPath[url]!=null&&wData.urlPath[url]!="") {
            ajaxUrl = wData.urlPath[url];
        }else{
            ajaxUrl=url;
        }
        var ajaxOptions = {
            type: "get",
            url: ajaxUrl, //默认接口地址写死
            dataType: "json",
            data: JSON.stringify(data),
            headers: headersData,
            contentType: "application/x-www-form-urlencoded",
            success: wSuccess,
            error: wError,
            beforeSend: function (request) {
                request.setRequestHeader("WxETopToken", token);
            }
        };
        $.ajax(ajaxOptions);
    };
    window.wAjaxFormPost=function(url, token, data, success, error, options, unload) {
        //默认成功处理方式
        var wSuccess = function (data) {
            !unload && wLoading.stop();
            if (success) {
                typeof data == "string" && (data = JSON.parse(data));

                success(data);

            }
        };
        var wError = function (data) {
            !unload && wLoading.stop();
            if (error) {
                error(data);
            }
        };
        !unload && wLoading.start();
        var headersData = {},
            ajaxUrl = "";
        if(wData.urlPath[url]!=undefined&&wData.urlPath[url]!=null&&wData.urlPath[url]!="") {
            ajaxUrl = wData.urlPath[url];
        }else{
            ajaxUrl=url;
        }
        var ajaxOptions = {
            type: "post",
            url: ajaxUrl, //默认接口地址写死
            dataType: "json",
            data: JSON.stringify(data),
            headers: headersData,
            contentType: "application/x-www-form-urlencoded",
            success: wSuccess,
            error: wError,
            beforeSend: function (request) {
                request.setRequestHeader("WxETopToken", token);
            }
        };
        $.ajax(ajaxOptions);
    };
    
    window.wInit=function(){

        //查询浏览器信息,cookie不能被禁用,不能是IE5,6,7
        if(queryBrowser()=="IE55"||queryBrowser()=="IE6"){
            alert("请升级或更换浏览器");
            return false;
        }
        if(!navigator.cookieEnabled){
            alert("请打开浏览器cookie功能");
            return false;
        }

        /*设置页面content容器高度*/
        var clientHeight = $(window).height();
        var bodyHeight = $(document.body).height();
        if (bodyHeight < clientHeight) {
            var contentHeight = clientHeight - $('.header').height();
            //$(".content").height(contentHeight);
        }
        $('.client-height').height(clientHeight);
        $(window).resize(function () {
            var clientHeight = $(window).height();
            var bodyHeight = $(document.body).height();
            if (bodyHeight < clientHeight) {
                var contentHeight = clientHeight - $('.header').height();
                $(".content").height(contentHeight);
            }
            $('.client-height').height(clientHeight);
        });

        //初始化
        App.init();
    };

})(window);

// ie8 以下兼容
window.console = window.console || (function () {
    var c ={};
    c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile= c.clear = c.exception = c.trace = c.assert = function(){};
    return c;
})();