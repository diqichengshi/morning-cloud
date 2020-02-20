//初始化
$(function () {
    wInit();
    wBindList({
        '.trade-info .details-btn': 'handleDetails'  //查看详情
        //, '.payment-tags li a': 'switchPayMethod'      //切换储蓄卡 信用卡类型
        , '#checkCardBin': 'handleCheckCardBin'
        , '.confirmBtn': 'confirmBtn'
        , '.confirmQpayBtn': 'confirmQpayBtn'
        , '#newQpayBtn': 'newQpayBtn'
        , '.back': 'handleGotoIdentifyCard'
        , '#QpayChooseBank': 'QpayChooseBank'
        , '#WX2Dcode': 'getErweimaWX'
        , '#AL2Dcode': 'getErweimaAL'
        , '.moreBankShow-span': 'toggleState'

    });
});
var App = (function () {
    //匿名网银支付的信息
    wData.onlineBankInfo = {//储蓄卡和信用卡要提交的内容
        token: wData.token,
        bankCode: "",
        payType: "",
        tradeAmount: null,
        instId: "",
        jumpPage: false
    };
    //匿名快捷支付的信息
    wData.qpayBankInfo = {
        token: wData.token,
        bankCode: "",
        payType: "",
        tradeAmount: null,
        instId: ""
    };
    wData.checkCardBinTip = "";
    wData.errorInfo = {
        noCard: "请选择银行卡"
    };
    wData.payChannel = {
        olDC02: false, //网银储蓄卡对私 （旧）
        olCC02: false, //网银信用卡对私 （旧）
        balance: false, //余额
        qpayDC05: false, //快捷储蓄卡对私 （旧）
        qpayCC05: false, //快捷信用卡对私 （旧）
        olDC22: false, //对公帐户 （旧）
        olGC21: false, //网银
        qpayDC25: false, //快捷储蓄卡对私
        qpayCC26: false, //快捷信用卡对私
        olDC23: false, //网银储蓄卡对私
        olCC24: false, //网银信用卡对私
        qpayDC27: false, //大额快捷对私
        wxpay: false, //微信扫码
        olDC32: false, //网银借记卡对私
        olCC33: false, //网银贷记卡对私
        alipay: false, // 支付宝扫码
        underlinePay: false
    };
    wData.bankListNum={
        olDC02_Num: 0, //网银储蓄卡对私 （旧）
        olCC02_Num: 0, //网银信用卡对私 （旧）
        balance_Num: 0, //余额
        qpayDC05_Num: 0, //快捷储蓄卡对私 （旧）
        qpayCC05_Num: 0, //快捷信用卡对私 （旧）
        olDC22_Num: 0, //对公帐户 （旧）
        olGC21_Num: 0, //网银
        qpayDC25_Num: 0, //快捷储蓄卡对私
        qpayCC26_Num: 0, //快捷信用卡对私
        olDC23_Num: 0, //网银储蓄卡对私
        olCC24_Num: 0, //网银信用卡对私
        qpayDC27_Num: 0, //大额快捷对私
        // wxpay: false, //微信扫码
        olDC32_Num: 0, //网银借记卡对私
        olCC33_Num: 0 //网银贷记卡对私
        // alipay_Num: false // 支付宝扫码
    }
    wData.erweima = {
        instId: ''
    };
    wData.haveChannel = false;
    wData.qPay = false;
    wData.payResultTimer = null;
    return {
        //初始化交易信息和渠道
        init: function () {
            var overHide = 10;
            var postData = {
                token: wData.token
                //accessChannel: "WEB"
            };
            wAjaxForm("getOrderInfo", "", postData, function (result) {
                if (result.success) {
                    console.log(result);
                    //换logo
                    if(result.data.yzfCashier==='Y'){
                        $('.header .logo-bar h1').css({'background':'url(/images/yzf-logo.png) no-repeat center left'});
                    }else{
                        $('.header .logo-bar h1').css({'background':'url(/jquery/cashier/cashier-logo.png) no-repeat center left'});
                    }

                    wData.cardList = result.data.qpayCardInfos;
                    wData.orderInfo = result.data.tradeVoucherList[0];
                    //wData.userInfo = data;    //存储用户数据

                    var tradeInfo = result.data.tradeVoucherList;
                    var tradeDetailStr = '';
                    if(wData.orderInfo.partnerId === '200000780134' || wData.orderInfo.partnerId === '200000640165'){
                        $('#tradeDetails').find('tr').eq(0).find('th').eq(3).remove();
                        for (var i = 0; i < tradeInfo.length; i++) {
                            tradeDetailStr+=
                                '<tr height="36" >' +
                                '<td>' + tradeInfo[i].tradeType + '</td>' +
                                '<td>' + tradeInfo[i].summary + '</td>' +
                                '<td>' + tradeInfo[i].voucherNo + '</td>' +
                                '<td>' + wToAmount(tradeInfo[i].amount.cent) + '元</td>' +
                                '</tr>';
                            wData.onlineBankInfo.tradeAmount += Number(tradeInfo[i].amount.cent);
                            wData.qpayBankInfo.tradeAmount += Number(tradeInfo[i].amount.cent);
                            $("#sellerMemberName").prev().remove();
                            $("#sellerMemberName").remove();
                        }

                    }else{
                        for (var i = 0; i < tradeInfo.length; i++) {
                            tradeDetailStr+=
                                '<tr height="36" >' +
                                '<td>' + tradeInfo[i].tradeType + '</td>' +
                                '<td>' + tradeInfo[i].summary + '</td>' +
                                '<td>' + tradeInfo[i].voucherNo + '</td>' +
                                '<td>' + tradeInfo[i].sellerMemberName + '</td>' +
                                '<td>' + wToAmount(tradeInfo[i].amount.cent) + '元</td>' +
                                '</tr>';
                            wData.onlineBankInfo.tradeAmount += Number(tradeInfo[i].amount.cent);
                            wData.qpayBankInfo.tradeAmount += Number(tradeInfo[i].amount.cent);
                        }
                        $("#sellerMemberName").text(wData.orderInfo.sellerMemberName);
                    }
                    $("#tradeDetails").append(tradeDetailStr);
                    $("#summary").text(wData.orderInfo.summary);
                    $("#tradeAmount").html(
                        wToAmount(wData.onlineBankInfo.tradeAmount)
                    );

                    /*获取已开通支付渠道*/
                    for (var j = 0; j < result.data.payChannel.length; j++) {
                        if (result.data.payChannel[j].payChannel === "02") {
                            if (result.data.payChannel[j].dbcr === "DC") {
                                wData.payChannel.olDC02 = true;
                                wData.haveChannel = true;
                            }else{
                                wData.payChannel.olCC02 = true;
                                wData.haveChannel = true;
                            }
                        }
                        if (result.data.payChannel[j].payChannel === "01") {
                            wData.payChannel.balance = true;
                            wData.haveChannel = true;
                        }
                        if (result.data.payChannel[j].payChannel === "22") {
                            wData.payChannel.olDC22 = true;
                            wData.haveChannel = true;
                        }
                        if (result.data.payChannel[j].payChannel === "23") {
                            wData.payChannel.olDC23 = true;
                            wData.haveChannel = true;
                        }
                    }

                    /*初始化tab页*/
                    var htmlChannel = '';
                    if (wData.payChannel.olDC22) {
                        htmlChannel = '<li>' +
                            '<a href="javascript:;">企业网银</a>' +
                            '</li>';
                        $("#payChannelList").append(htmlChannel);
                    } else {
                        $("#olDC22").remove();
                    }
                    if (wData.payChannel.olDC23) {
                        htmlChannel = '<li>' +
                            '<a href="javascript:;">储蓄卡</a>' +
                            '</li>';
                        $("#payChannelList").append(htmlChannel);
                    } else {
                        $("#olDC23").remove();
                    }
                    
                    $("#payChannelList li:first-child").addClass("active");
                    $(".payment-methods div.method:first-child").removeClass('hide');
                    /*绑定切换渠道tab*/
                    App.switchPayMethod();
                    
                    //快捷卡弹出框打开闭合
                    App.handleOpendialog();
                    App.handleClosedialog();
                    $(".select-card-type-btn").click(function () {
                        wData.checkCardBinTip = "";
                        App.handleGotoSelectCardType();
                    });
                    $(".identification-card-btn").click(App.handleGotoIdentifyCard());
                    App.handleSelectCardType();

                    if (wData.haveChannel) {
                        var bankPostData = '';
                        if (wData.payChannel.wxpay) {
                            bankPostData = {
                                partnerId: wData.orderInfo.partnerId,
                                yzfCashier: result.data.yzfCashier,
                                sellerId: wData.orderInfo.sellerMemberId,
                                productCode: wData.orderInfo.productCode,
                                accessChannel: "WEB",
                                payModle: "QPAY&ONLINEBANK",
                                payChannel: "28"
                            };
                        } else {
                            bankPostData = {
                                partnerId: wData.orderInfo.partnerId,
                                yzfCashier: result.data.yzfCashier,
                                sellerId: wData.orderInfo.sellerMemberId,
                                productCode: wData.orderInfo.productCode,
                                accessChannel: "WEB",
                                payModle: "QPAY&ONLINEBANK"
                            };
                        }
                        //获取银行列表 wAjax wAjaxForm
                        wAjax("getBankList", "", bankPostData, function (result) {
                            if (result.success) {
                                var bankList = eval(result.data);
                                var olDC02Html = "",olCC02Html = "",balanceHtml = "",qpayDC05Html = "",qpayCC05Html = "",olDC22Html = "",olGC21Html = "",qpayDC25Html = "",qpayCC26Html = "",olDC23Html = "",olCC24Html = "",qpayDC27Html = "",wxpayHtml = "",olDC32Html = "",olCC33Html = "",alipayHtml ="",beforeBOCHtml="",afterBOCHtml="";
                                for (var i = 0; i < bankList.length; i++) {
                                    if(bankList[i].dbcr === 'DC'){
                                        if(bankList[i].payChannel === '02'){
                                            wData.bankListNum.olDC02_Num++;
                                            if(wData.bankListNum.olDC02_Num > overHide){
                                                olDC02Html = olDC02Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                olDC02Html = olDC02Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }
                                        }
                                        if(bankList[i].payChannel === '05'){
                                            wData.bankListNum.qpayDC05_Num++;
                                            if(wData.bankListNum.qpayDC05_Num > overHide){
                                                qpayDC05Html = qpayDC05Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                qpayDC05Html = qpayDC05Html +
                                                    '<li class>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }

                                        if(bankList[i].payChannel === '22'){
                                            wData.bankListNum.olDC22_Num++;
                                            if(wData.bankListNum.olDC22_Num>overHide){
                                                if (bankList[i].instCode != "BOCBB") {
                                                    olDC22Html = olDC22Html +
                                                        '<li class="hide">' +
                                                        '<a href="javascript:;" class="BIocn-QY ' + bankList[i].instCode + '-QY" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                        '</li>';
                                                } else {
                                                    afterBOCHtml=
                                                        '<li>' +
                                                        '<button id="otherPayChannel" type="button" class="btn-threme-middle"  payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '">选择其他银行</button>' +
                                                        '</li>';
                                                }
                                            }else{
                                                if (bankList[i].instCode != "BOCBB") {
                                                    olDC22Html = olDC22Html +
                                                        '<li>' +
                                                        '<a href="javascript:;" class="BIocn-QY ' + bankList[i].instCode + '-QY" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                        '</li>';
                                                }else {
                                                    beforeBOCHtml=
                                                        '<li>' +
                                                        '<button id="otherPayChannel" type="button" class="btn-threme-middle"  payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '">选择其他银行</button>' +
                                                        '</li>';
                                                    wData.bankListNum.olDC22_Num--;
                                                }
                                            }

                                        }

                                        if(bankList[i].payChannel === '25'){
                                            wData.bankListNum.qpayDC25_Num++;
                                            if(wData.bankListNum.qpayDC25_Num>overHide){
                                                qpayDC25Html = qpayDC25Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                qpayDC25Html = qpayDC25Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }

                                        if(bankList[i].payChannel === '23'){
                                            wData.bankListNum.olDC23_Num++;
                                            if(wData.bankListNum.olDC23_Num>overHide){
                                                olDC23Html = olDC23Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                olDC23Html = olDC23Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }

                                        if(bankList[i].payChannel === '27'){
                                            wData.bankListNum.qpayDC27_Num++;
                                            if(wData.bankListNum.qpayDC27_Num>overHide){
                                                qpayDC27Html = qpayDC27Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                qpayDC27Html = qpayDC27Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }

                                        if(bankList[i].payChannel === '32'){
                                            wData.bankListNum.olDC32_Num++;
                                            if(wData.bankListNum.olDC32_Num>overHide){
                                                olDC32Html = olDC32Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                olDC32Html = olDC32Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',DC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }
                                    }else if(bankList[i].dbcr === 'CC'){

                                        if(bankList[i].payChannel === '02'){
                                            wData.bankListNum.olCC02_Num++;
                                            if(wData.bankListNum.olCC02_Num>overHide){
                                                olCC02Html = olCC02Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                olCC02Html = olCC02Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }

                                        if(bankList[i].payChannel === '05'){
                                            wData.bankListNum.qpayCC05_Num++;
                                            if(wData.bankListNum.qpayCC05_Num >overHide){
                                                qpayCC05Html = qpayCC05Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                qpayCC05Html = qpayCC05Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }

                                        if(bankList[i].payChannel === '26'){
                                            wData.bankListNum.qpayCC26_Num++;
                                            if(wData.bankListNum.qpayCC26_Num>overHide){
                                                qpayCC26Html = qpayCC26Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                qpayCC26Html = qpayCC26Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }

                                        if(bankList[i].payChannel === '24'){
                                            wData.bankListNum.olCC24_Num++;
                                            if(wData.bankListNum.olCC24_Num>overHide){
                                                olCC24Html = olCC24Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                olCC24Html = olCC24Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }

                                        if(bankList[i].payChannel === '33'){
                                            wData.bankListNum.olCC33_Num++;
                                            if(wData.bankListNum.olCC33_Num>overHide){
                                                olCC33Html = olCC33Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                olCC33Html = olCC33Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }
                                    }else if(bankList[i].dbcr === 'GC') {
                                        if(bankList[i].payChannel === '21'){
                                            wData.bankListNum.olGC21_Num++;
                                            if(wData.bankListNum.olGC21_Num>overHide){
                                                olGC21Html = olGC21Html +
                                                    '<li class="hide">' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',GC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }else{
                                                olGC21Html = olGC21Html +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',GC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }

                                        }

                                        if(bankList[i].payChannel === '28'){
                                            if(bankList[i])
                                            wxpayHtml = wxpayHtml +
                                                '<li>' +
                                                '<a href="javascript:;" class="BIocn-DSF ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',GC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                '</li>';
                                        }

                                        if(bankList[i].payChannel === '29'){
                                            if(bankList[i].instCode=='ALIPAY'){
                                                alipayHtml = alipayHtml +
                                                    '<li>' +
                                                    '<a href="javascript:;" class="BIocn-DSF ' + bankList[i].instCode + '" payType="' + bankList[i].companyPersonal + ',CC" bankCode="' + bankList[i].instCode + '" instId="' + bankList[i].instId + '"></a>' +
                                                    '</li>';
                                            }
                                        }

                                    }
                                }

                                if (result.data.sacnPayList) {
                                    var sacnList = eval(result.data.sacnPayList);
                                    for (var k = 0; k < sacnList.length; k++) {
                                        if(sacnList[k].instCode=='WXPAY'){
                                            wxpayHtml = wxpayHtml +
                                                '<li>' +
                                                '<a href="javascript:;" class="BIocn-DSF ' + sacnList[k].instCode + '" payType="' + sacnList[k].companyPersonal + ',CC" bankCode="' + sacnList[k].instCode + '" instId="' + sacnList[k].instId + '"></a>' +
                                                '</li>';
                                            wData.erweima.instId = sacnList[k].instId;
                                        }
                                    }
                                }
                                
                                if (wData.payChannel.olDC02) {
                                    $('#olDC02List').append(
                                        olDC02Html
                                    );
                                    if(wData.bankListNum.olDC02_Num <= overHide){
                                        $('#olDC02List').next('.moreBankShow').remove();
                                    }

                                }

                                if (wData.payChannel.olCC02) {
                                    $('#olCC02List').append(
                                        olCC02Html
                                    );
                                    if(wData.bankListNum.olCC02_Num <= overHide){
                                        $('#olCC02List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.qpayDC05) {
                                    $('#qpayDC05List').append(
                                        qpayDC05Html
                                    );
                                    if(wData.bankListNum.qpayDC05_Num <= overHide){
                                        $('#qpayDC05List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.qpayCC05) {
                                    $('#qpayCC05List').append(
                                        qpayCC05Html
                                    );
                                    if(wData.bankListNum.qpayCC05_Num <= overHide){
                                        $('#qpayCC05List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.olDC22) {
                                    $('#olDC22List').append(
                                        olDC22Html+beforeBOCHtml+afterBOCHtml
                                    );
                                    if(beforeBOCHtml){
                                        if(wData.bankListNum.olDC22_Num <= overHide-1){
                                            $('#olDC22List').next('.moreBankShow').remove();
                                        }else{
                                            $('#olDC22List').children('li:last-child').addClass('hide');
                                        }
                                    }else{
                                        if(wData.bankListNum.olDC22_Num <= overHide){
                                            $('#olDC22List').next('.moreBankShow').remove();
                                        }else{
                                            $('#olDC22List').children('li:last-child').addClass('hide');
                                        }
                                    }

                                }

                                if (wData.payChannel.olGC21) {
                                    $('#olGC21List').append(
                                        olGC21Html
                                    );
                                    if(wData.bankListNum.olGC21_Num <= overHide){
                                        $('#olGC21List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.qpayDC25) {
                                    $('#qpayDC25List').append(
                                        qpayDC25Html
                                    );
                                    if(wData.bankListNum.qpayDC25_Num <= overHide){
                                        $('#qpayDC25List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.qpayCC26) {
                                    $('#qpayCC26List').append(
                                        qpayCC26Html
                                    );
                                    if(wData.bankListNum.qpayCC26_Num <= overHide){
                                        $('#qpayCC26List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.olDC23) {
                                    $('#olDC23List').append(
                                        olDC23Html
                                    );
                                    if(wData.bankListNum.olDC23_Num <= overHide){
                                        $('#olDC23List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.olCC24) {
                                    $('#olCC24List').append(
                                        olCC24Html
                                    );
                                    if(wData.bankListNum.olCC24_Num <= overHide){
                                        $('#olCC24List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.qpayDC27) {
                                    $('#qpayDC27List').append(
                                        qpayDC27Html
                                    );
                                    if(wData.bankListNum.qpayDC27_Num <= overHide){
                                        $('#qpayDC27List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.wxpay) {
                                    $('#erweima').append(
                                        wxpayHtml
                                    );
                                }

                                if (wData.payChannel.olDC32) {
                                    $('#olDC32List').append(
                                        olDC32Html
                                    );
                                    if(wData.bankListNum.olDC32_Num <= overHide){
                                        $('#olDC32List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.olCC33) {
                                    $('#olCC33List').append(
                                        olCC33Html
                                    );
                                    if(wData.bankListNum.olCC33_Num <= overHide){
                                        $('#olCC33List').next('.moreBankShow').remove();
                                    }
                                }

                                if (wData.payChannel.alipay) {
                                    $('#ali_erweima').append(
                                        alipayHtml
                                    );
                                }
                                //选择已绑定快捷卡
                                App.switchBank();
                                App.otherPayChannel();
                            } else {
                                wAlert("获取银行列表信息失败");
                            }
                        });
                    }
                } else {

                }

            });
        },
        //查看详情
        handleDetails: function () {
            $('.trade-info .details').slideToggle();
        },

        wxPayResult: function(){
            clearInterval(wData.payResultTimer);
            wData.payResultTimer = setInterval(function () {

                wAjaxFormNoBG("getQpayStatus", "", {"orderNo": wData.orderInfo.voucherNo}, function (result) {
                    if (result.data.tradeInfoList[0].status == "401" || result.data.tradeInfoList[0].status == "301" || result.data.tradeInfoList[0].status == "201" ) {
                        clearInterval(wData.payResultTimer);
                        $(".dialog-box").show();
                        var html = '<div class="clearfix pay-result pay-succeed ">' +
                            '<div class="pay-result-icon pay-secceed-icon float-left"></div>' +
                            '<div class="pay-result-ms float-left margin-left40">' +
                            '<p class="font24 margin-bottom10">' +
                            '付款成功' +
                            '</p>' +
                            '<p class="margin-bottom10">' +
                            '<button id="pay-result-return" type="button" class="btn-threme">返回</button>' +
                            '</p>' +
                            '<p>' +
                            '<span id="timeSpan" class="timeSpan">8</span>' +
                            '<span>秒后, 自动跳转</span>' +
                            '</p>' +
                            '</div>' +
                            '</div>';
                        $(".dialog-content").html(html);

                        var timeFiv = 8;
                        var IntervalNum = setInterval(function () {
                            timeFiv--;
                            var html = '<div class="clearfix pay-result pay-succeed ">' +
                                '<div class="pay-result-icon pay-secceed-icon float-left"></div>' +
                                '<div class="pay-result-ms float-left margin-left40">' +
                                '<p class="font24 margin-bottom10">' +
                                '付款成功' +
                                '</p>' +
                                '<p class="margin-bottom10">' +
                                '<button id="pay-result-return" type="button" class="btn-threme">返回</button>' +
                                '</p>' +
                                '<p>' +
                                '<span id="timeSpan" class="timeSpan">'+timeFiv+'</span>' +
                                '<span>秒后, 自动跳转</span>' +
                                '</p>' +
                                '</div>' +
                                '</div>';
                            if (timeFiv == 0) {
                                clearInterval(IntervalNum);
                                if (wData.orderInfo.returnUrl != "") {
                                    location.href = wData.orderInfo.returnUrl.replace(/&amp;/g,'&');
                                }
                                //返回地址backURL;
                            } else {
                                $(".dialog-content").html(html);
                            }
                        }, 1000);
                        $(".dialog-content").on('click',$('#pay-result-return'),function(){
                            location.href = wData.orderInfo.returnUrl.replace(/&amp;/g,'&');
                        });
                    } else if (result.data.tradeInfoList[0].status == "999") {

                        //支付失败
                        clearInterval(wData.payResultTimer);
                        $(".dialog-box").show();
                        var html = '<div class="clearfix pay-result pay-failed ">' +
                            '<div class="pay-result-icon pay-failed-icon float-left"></div>' +
                            '<div class="pay-result-ms float-left margin-left40">' +
                            '<p class="font24 margin-bottom10">' +
                            '付款失败' +
                            '</p>' +
                            '<p class="margin-bottom10">' +
                            '<button id="pay-result-return" type="button" class="btn-threme">关闭</button>' +
                            '</p>' +
                            '<p>' +
                            '<span id="timeSpan" class="timeSpan">8</span>' +
                            '<span>秒后, 自动关闭</span>' +
                            '</p>' +
                            '</div>' +
                            '</div>';
                        $(".dialog-content").html(html);

                        var timeFiv = 8;
                        var IntervalNum = setInterval(function () {
                            timeFiv--;
                            var html = '<div class="clearfix pay-result pay-failed ">' +
                                '<div class="pay-result-icon pay-failed-icon float-left"></div>' +
                                '<div class="pay-result-ms float-left margin-left40">' +
                                '<p class="font24 margin-bottom10">' +
                                '付款失败' +
                                '</p>' +
                                '<p class="margin-bottom10">' +
                                '<button id="pay-result-return" type="button" class="btn-threme">关闭</button>' +
                                '</p>' +
                                '<p>' +
                                '<span id="timeSpan" class="timeSpan">'+timeFiv+'</span>' +
                                '<span>秒后, 自动关闭</span>' +
                                '</p>' +
                                '</div>' +
                                '</div>';
                            if (timeFiv == 0) {
                                clearInterval(IntervalNum);
                                if (wData.orderInfo.returnUrl != "") {
                                    $(".dialog-box").hide();
                                }
                                //返回地址backURL;
                            } else {
                                $(".dialog-content").html(html);
                            }
                        }, 1000);
                        $(".dialog-content").on('click',$('#pay-result-return'),function(){
                            $(".dialog-box").hide();
                        });
                    }
                });

            }, 1000);
        },

        aliPayResult: function(){
            clearInterval(wData.payResultTimer);
            wData.payResultTimer = setInterval(function () {

                wAjaxFormNoBG("getQpayStatus", "", {"orderNo": wData.orderInfo.voucherNo}, function (result) {
                    if (result.data.tradeInfoList[0].status == "401" || result.data.tradeInfoList[0].status == "301" || result.data.tradeInfoList[0].status == "201") {
                        clearInterval(wData.payResultTimer);
                        $(".dialog-box").show();
                        var html = '<div class="clearfix pay-result pay-succeed ">' +
                            '<div class="pay-result-icon pay-secceed-icon float-left"></div>' +
                            '<div class="pay-result-ms float-left margin-left40">' +
                            '<p class="font24 margin-bottom10">' +
                            '付款成功' +
                            '</p>' +
                            '<p class="margin-bottom10">' +
                            '<button id="pay-result-return" type="button" class="btn-threme">返回</button>' +
                            '</p>' +
                            '<p>' +
                            '<span id="timeSpan" class="timeSpan">8</span>' +
                            '<span>秒后, 自动跳转</span>' +
                            '</p>' +
                            '</div>' +
                            '</div>';
                        $(".dialog-content").html(html);

                        var timeFiv = 8;
                        var IntervalNum = setInterval(function () {
                            timeFiv--;
                            var html = '<div class="clearfix pay-result pay-succeed ">' +
                                '<div class="pay-result-icon pay-secceed-icon float-left"></div>' +
                                '<div class="pay-result-ms float-left margin-left40">' +
                                '<p class="font24 margin-bottom10">' +
                                '付款成功' +
                                '</p>' +
                                '<p class="margin-bottom10">' +
                                '<button id="pay-result-return" type="button" class="btn-threme">返回</button>' +
                                '</p>' +
                                '<p>' +
                                '<span id="timeSpan" class="timeSpan">'+timeFiv+'</span>' +
                                '<span>秒后, 自动跳转</span>' +
                                '</p>' +
                                '</div>' +
                                '</div>';
                            if (timeFiv == 0) {
                                clearInterval(IntervalNum);
                                if (wData.orderInfo.returnUrl != "") {
                                    location.href = wData.orderInfo.returnUrl.replace(/&amp;/g,'&');
                                }
                                //返回地址backURL;
                            } else {
                                $(".dialog-content").html(html);
                            }
                        }, 1000);
                        $(".dialog-content").on('click',$('#pay-result-return'),function(){
                            location.href = wData.orderInfo.returnUrl.replace(/&amp;/g,'&');
                        });
                    } else if (result.data.tradeInfoList[0].status == "999") {

                        //支付失败
                        clearInterval(wData.payResultTimer);
                        $(".dialog-box").show();
                        var html = '<div class="clearfix pay-result pay-failed ">' +
                            '<div class="pay-result-icon pay-failed-icon float-left"></div>' +
                            '<div class="pay-result-ms float-left margin-left40">' +
                            '<p class="font24 margin-bottom10">' +
                            '付款失败' +
                            '</p>' +
                            '<p class="margin-bottom10">' +
                            '<button id="pay-result-return" type="button" class="btn-threme">关闭</button>' +
                            '</p>' +
                            '<p>' +
                            '<span id="timeSpan" class="timeSpan">8</span>' +
                            '<span>秒后, 自动关闭</span>' +
                            '</p>' +
                            '</div>' +
                            '</div>';
                        $(".dialog-content").html(html);

                        var timeFiv = 8;
                        var IntervalNum = setInterval(function () {
                            timeFiv--;
                            var html = '<div class="clearfix pay-result pay-failed ">' +
                                '<div class="pay-result-icon pay-failed-icon float-left"></div>' +
                                '<div class="pay-result-ms float-left margin-left40">' +
                                '<p class="font24 margin-bottom10">' +
                                '付款失败' +
                                '</p>' +
                                '<p class="margin-bottom10">' +
                                '<button id="pay-result-return" type="button" class="btn-threme">关闭</button>' +
                                '</p>' +
                                '<p>' +
                                '<span id="timeSpan" class="timeSpan">'+timeFiv+'</span>' +
                                '<span>秒后, 自动关闭</span>' +
                                '</p>' +
                                '</div>' +
                                '</div>';
                            if (timeFiv == 0) {
                                clearInterval(IntervalNum);
                                if (wData.orderInfo.returnUrl != "") {
                                    $(".dialog-box").hide();
                                }
                                //返回地址backURL;
                            } else {
                                $(".dialog-content").html(html);
                            }
                        }, 1000);
                        $(".dialog-content").on('click',$('#pay-result-return'),function(){
                            $(".dialog-box").hide();
                        })
                    }
                });

            }, 1000);
        },
        /*切换储蓄卡,信用卡等卡类型*/
        switchPayMethod: function () {
            $(".payment-tags li a").click(function () {
                $('.payment-tags li').removeClass('active');
                $(this).parent('li').addClass('active');
                $('.cashier-payment .payment-methods .method').addClass("hide").eq($(this).parent().index()).removeClass('hide');
                $('.payment-methods li a').removeClass('active');
                //清空银行卡信息
                wData.onlineBankInfo.payType = "";
                wData.onlineBankInfo.bankCode = "";

                $(".errorInfo").text("");
                wData.qpayBankInfo.payType = "";
                wData.qpayBankInfo.bankCode = "";

                if (wData.payChannel.wxpay) {
                    if ($("#wxpay").attr("IntervalNo") != "") {
                        clearInterval($("#wxpay").attr("IntervalNo"));
                    }
                    if (!$("#wxpay").hasClass("hide")) {

                        $('#erweima li:first-child a').click();

                        App.wxPayResult();
                        $("#weixin_div").attr("IntervalNo", wData.payResultTimer);
                    }

                }

                if (wData.payChannel.alipay) {
                    if ($("#alipay").attr("IntervalNo") != "") {
                        clearInterval($("#alipay").attr("IntervalNo"));
                    }

                    if (!$("#alipay").hasClass("hide")) {

                        $('#ali_erweima li:first-child a').click();

                        App.aliPayResult();

                        $("#alipay_div").attr("IntervalNo", wData.payResultTimer);
                    }

                }
                if(wData.payChannel.underlinePay) {
                    if(!$('#underlinePay').hasClass('hide')){
                        App.nextStep();
                    }
                }
            });
        },
        otherPayChannel: function () {
            $('.mainBank-list li button').click(function () {
                $('.mainBank-list li a').removeClass('active');
                $(this).addClass('active');
                //设置储蓄卡,信用卡信息
                wData.onlineBankInfo.payType = $(this).attr("payType");
                wData.onlineBankInfo.bankCode = $(this).attr("bankCode");
                wData.onlineBankInfo.instId = $(this).attr("instId");

                $.cookie("chanpayTradeOnlineBankSelect", jsonToStr(wData.onlineBankInfo));

                location.href = "tradeConfirm.html?token="+wData.token+'&memberType='+wData.memberType;

            });
        },
        //选择银行储蓄卡或信用卡
        switchBank: function () {
            $('.mainBank-list li a').click(function () {
                $('.mainBank-list li a').removeClass('active');
                $(this).addClass('active');
                if (wData.payChannel.wxpay) {
                    if (!$("#wxpay").hasClass("hide")) {

                        //$("#2Dcode").attr("src","http://cimage.tianjimedia.com/uploadImages/2012/137/9UJ195ER77Z0.jpg");
                        //获取扫码支付 二维码图片
                        wData.erweima.instId = $(this).attr("instId");
                        var bankPostData = {
                            token: wData.token,
                            instId: $(this).attr("instId"),
                            accessChannel: "WEB",
                            // payModle: "ONLINE_BANK",
                            isScanPay: "true"
                        };

                        wAjaxForm("onlinePay", "", bankPostData, function (result) {
                            //console.log(result);
                            if (result.success) {
                                $("#WX2Dcode").attr("src", result.data.wxImgUrl);
                                $("#WX2Dcode").attr("isOk", "true");
                            } else {
                                $("#WX2Dcode").attr("src", "../images/getError.png");
                                $("#WX2Dcode").attr("isOk", "false");
                            }
                        });

                        App.wxPayResult();
                        $("#weixin_div").attr("IntervalNo", wData.payResultTimer);
                    }

                }

                if (wData.payChannel.alipay) {
                    if (!$("#alipay").hasClass("hide")) {

                        //$("#2Dcode").attr("src","http://cimage.tianjimedia.com/uploadImages/2012/137/9UJ195ER77Z0.jpg");
                        //获取扫码支付 二维码图片
                        wData.erweima.instId = $(this).attr("instId");
                        var bankPostData = {
                            token: wData.token,
                            instId: $(this).attr("instId"),
                            accessChannel: "WEB",
                            payModle: "ONLINE_BANK",
                            isScanPay: "true"
                        };

                        wAjaxForm("onlinePay", "", bankPostData, function (result) {
                            if (result.success) {
                                $("#AL2Dcode").attr("src", result.data.wxImgUrl);
                                $("#AL2Dcode").attr("isOk", "true");
                            } else {
                                $("#AL2Dcode").attr("src", "../images/getError.png");
                                $("#AL2Dcode").attr("isOk", "false");
                            }
                        })

                        App.aliPayResult();
                        $("#alipay_div").attr("IntervalNo", wData.payResultTimer);
                    }

                }
                //设置储蓄卡,信用卡信息
                wData.onlineBankInfo.payType = $(this).attr("payType");
                wData.onlineBankInfo.bankCode = $(this).attr("bankCode");
                wData.onlineBankInfo.instId = $(this).attr("instId");

                //设置已绑定快捷卡信息
                /*wData.boundQpayBankInfo.qpayId = $(this).attr("qpayId");
                 wData.boundQpayBankInfo.bankCode = $(this).attr("bankCode");
                 wData.boundQpayBankInfo.cardType = $(this).attr("cardType");
                 wData.boundQpayBankInfo.accountNoSummary = $(this).attr("accountNoSummary");
                 wData.boundQpayBankInfo.mobileNoSummary = $(this).attr("mobileNoSummary");*/
                //设置储蓄卡,信用卡信息
                wData.qpayBankInfo.payType = $(this).attr("payType");
                wData.qpayBankInfo.bankCode = $(this).attr("bankCode");
                wData.qpayBankInfo.instId = $(this).attr("instId");


            });
        },
        /*卡号识别后的跳转*/
        handleIdentifyCard: function () {
            var elem = $('.wrapper');
            elem.children('div').addClass('hide');
            elem.children('.confirm').removeClass('hide');

        },
        /*跳转到选择银行卡类型*/
        handleGotoSelectCardType: function () {
            var elem = $('.wrapper');
            $("#checkCardBinTip").text(wData.checkCardBinTip);
            elem.children('div').addClass('hide');
            elem.children('.select-card-type').removeClass('hide');
        },
        /*跳转到卡号识别的输入卡号页*/
        handleGotoIdentifyCard: function () {
            var elem = $('.wrapper');
            $("#cardNum").val("");
            elem.children('div').addClass('hide');
            elem.children('.identification-card').removeClass('hide');
        },
        /*选择银行卡类型*/
        handleSelectCardType: function () {
            $('.select-card-type .select-box input').click(function () {
                if (this.value) {
                    wData.qpayBankInfo.cardType = this.value;
                    $('.select-card-type button').removeClass('btn-disable').addClass('btn-threme');
                }
            });
            $('.select-card-type button').click(function () {
                var elem = $('.wrapper');
                if ($(this).hasClass('btn-disable')) {
                    return false;
                } else {
                    if (wData.QpayBankList == "" || wData.QpayBankList == null || wData.QpayBankList == undefined) {
                        var sendData = {
                            cardNo: "1111111111111111",
                            partnerId: wData.orderInfo.partnerId,
                            productCode: wData.orderInfo.productCode
                        };
                        wAjaxForm("checkBankCard", "", sendData, function (result) {
                            if (result.success) {
                                if (result.data.returnCode == 102) {
                                    wData.QpayBankList = result.data.payChannelList;
                                    elem.children('div').addClass('hide');
                                    elem.children('.payment-bank-list').removeClass('hide');
                                    var html = '';
                                    for (var i = 0; i < wData.QpayBankList.length; i++) {
                                        if (wData.QpayBankList[i].dbcr == wData.qpayBankInfo.cardType) {
                                            html = html + '<li>' +
                                                '<a href="javascript:;" class="BIocn ' + wData.QpayBankList[i].instCode + '"></a>' +
                                                '</li>';
                                        }
                                    }
                                    $(".payment-bank-list ul").html(html);
                                    $(".payment-bank-list ul li a").click(function () {
                                        $('.mainBank-list li a').removeClass('active');
                                        $(this).addClass('active');
                                        //给所选快捷卡赋值信息
                                    });
                                }
                            }
                        });
                    } else {
                        elem.children('div').addClass('hide');
                        elem.children('.payment-bank-list').removeClass('hide');
                        var html = '';
                        for (var i = 0; i < wData.QpayBankList.length; i++) {
                            if (wData.QpayBankList[i].dbcr == wData.qpayBankInfo.cardType) {
                                html = html + '<li>' +
                                    '<a href="javascript:;" class="BIocn ' + wData.QpayBankList[i].instCode + '"></a>' +
                                    '</li>';
                            }
                        }
                        $(".payment-bank-list ul").html(html);
                        $(".payment-bank-list ul li a").click(function () {
                            $('.mainBank-list li a').removeClass('active');
                            $(this).addClass('active');
                            //给所选快捷卡赋值信息
                        });
                    }
                }
            })
        },
        /*打开添加快捷卡窗口*/
        handleOpendialog: function () {
            var that = this;
            $('.bind-new-bank-btn a').click(function () {
                $('#AddQCard').removeClass('hide');
                that.handleGotoIdentifyCard();
            })
        },
        /*关闭添加快捷卡窗口*/
        handleClosedialog: function () {
            $('.dialog-box .close').click(function () {
                $('#AddQCard').addClass('hide');
            })
        },
        
        confirmBtn: function () {
            if($("#payChannelList .active").text() == "企业网银"){
                wData.onlineBankInfo.jumpPage = true;
            }
            $.cookie("chanpayTradeOnlineBankSelect", jsonToStr(wData.onlineBankInfo),{path:'/'});
            if (wData.onlineBankInfo.bankCode === "") {
                $(".errorInfo").text(wData.errorInfo.noCard);
                return false;
            }
            //location.href = "tradeConfirm.html?token="+wData.token+'&memberType='+wData.memberType 
            window.location.href = "../tradeConfirm.do?token="+wData.token+'&memberType='+wData.memberType ;
            
        },
        //确认付款
        confirmQpayBtn: function () {

            $.cookie('chanpayTradeQpayBankSelect',jsonToStr(wData.qpayBankInfo));

            if (wData.qpayBankInfo.bankCode == "") {
                $(".errorInfo").text(wData.errorInfo.noCard);
                return false;
            }

            if(wData.qpayBankInfo.payType.indexOf('CC')!=-1){
                location.href = "qpayNoCardCC.html?token="+wData.token+'&memberType='+wData.memberType;
            }else if(wData.qpayBankInfo.payType.indexOf('DC')!=-1){
                location.href = "qpayNoCardDC.html?token="+wData.token+'&memberType='+wData.memberType;
            }

        },
        //确认付款
        newQpayBtn: function () {

            if (wData.boundQpayBankInfo.cardType == "CC") {
                location.href = setUrlParam("qpayNoCardCC.html", wData.boundQpayBankInfo)
            } else if (wData.boundQpayBankInfo.cardType == "DC") {
                location.href = setUrlParam("qpayNoCardDC.html", wData.boundQpayBankInfo)
            }

        },
        QpayChooseBank: function () {
            if ($(".payment-bank-list ul li a").hasClass("active")) {
                App.handleIdentifyCard();
            }
        },
        getErweimaWX: function () {
            if ($("#WX2Dcode").attr("isOk") == "false") {
                var bankPostData = {
                    token: wData.token,
                    instId: wData.erweima.instId,
                    accessChannel: "WEB",
                    payModle: "ONLINE_BANK",
                    isScanPay: "true"
                };

                wAjaxForm("onlinePay", "", bankPostData, function (result) {
                    if (result.success) {
                        $("#WX2Dcode").attr("src", result.data.wxImgUrl);
                        $("#WX2Dcode").attr("isOk", "true");
                    } else {
                        $("#WX2Dcode").attr("src", "../images/getError.png");
                        $("#WX2Dcode").attr("isOk", "false");
                    }
                });
                App.wxPayResult();
                $("#weixin_div").attr("IntervalNo", wData.payResultTimer);

            }
        },
        getErweimaAL: function () {
            if ($("#AL2Dcode").attr("isOk") == "false") {
                var bankPostData = {
                    token: wData.token,
                    instId: wData.erweima.instId,
                    accessChannel: "WEB",
                    payModle: "ONLINE_BANK",
                    isScanPay: "true"
                };

                wAjaxForm("onlinePay", "", bankPostData, function (result) {
                    if (result.success) {
                        $("#AL2Dcode").attr("src", result.data.wxImgUrl);
                        $("#AL2Dcode").attr("isOk", "true");
                    } else {
                        $("#AL2Dcode").attr("src", "../images/getError.png");
                        $("#AL2Dcode").attr("isOk", "false");
                    }
                });
                App.aliPayResult();
                $("#alipay_div").attr("IntervalNo", wData.payResultTimer);

            }
        },
        toggleState: function() {
            var _thisTxt = $(this).text();
            $(this).parent('.moreBankShow').prev().find('li:gt(9)').toggleClass('hide');
            if(_thisTxt === '选择其他'){
                $(this).text('收起列表').addClass('up');
            }else{
                $(this).text('选择其他').removeClass('up');

            }
        },
        nextStep: function () {
            var bOk = {
                name: false,
                no: false
            }
            $('.nextStep').click(function () {
                if($('#companyName').val()==''){
                    $('#companyName').next().remove();
                    $('#companyName').after('<label class="textRed" style="display:block;text-align:left;margin-top:4px;">付款方企业名称不能为空</label>');
                    bOk.name = false;
                }
                else {
                    var comReg = /^\S{1,255}$/;
                    if(comReg.test($('#companyName').val())){
                        $('#companyName').next().remove();
                        bOk.name = true;
                    }
                    else {
                        $('#companyName').next().remove();
                        $('#companyName').after('<label class="textRed" style="display:block;text-align:left;margin-top:4px;">付款方企业名称最长为255个字符</label>');
                        bOk.name = false;
                    }
                }
                if($('#companyNo').val()==''){
                    $('#companyNo').next().remove();
                    $('#companyNo').after('<label class="textRed" style="display:block;text-align:left;margin-top:4px;">付款方企业账号不能为空</label>');
                    bOk.no = false;
                }
                else {
                    var regNum = /^[0-9]*$/;
                    if( regNum.test($('#companyNo').val())){
                        var regPayNo = /^\d{1,40}$/;
                        if(regPayNo.test($('#companyNo').val())){
                            $('#companyNo').next().remove();
                            bOk.no = true;
                        }
                        else {
                            $('#companyNo').next().remove();
                            $('#companyNo').after('<label class="textRed" style="display:block;text-align:left;margin-top:4px;">付款方企业账号最长为40个数字</label>');
                            bOk.no = false;
                        }
                    }
                    else {
                        $('#companyNo').next().remove();
                        $('#companyNo').after('<label class="textRed" style="display:block;text-align:left;margin-top:4px;">付款方企业账号只能为数字</label>');
                        bOk.no = false;
                    }
                }
                if(!bOk.name || !bOk.no){
                    return;
                }
                var postData = {
                    token: wData.token,
                    pay_acct_no: $('#companyNo').val(),
                    pay_acct_name: $('#companyName').val()
                }
                wAjaxForm("getPayTransferSerialNo", "", postData, function (result) {
                    if(result.success){
                        $('#transfer_no').html(result.data.transfer_no);
                        $('.proPhoto').addClass('proP2').removeClass('proP1');
                        $('.step1').hide();
                        $('.step2').show();
                        var step3Html =  '<div class="orderInfo">'+
                                            '<div class="tit">订单信息</div>'+
                                            '<div class="form-group">'+
                                                '<label class="col-5 control-label">交易订单号：'+
                                                    
                                                '</label>'+
                                                '<label class="col-5">'+
                                                    '<span>'+result.data.trade_source_voucher_no+'</span>'+
                                                '</label>'+
                                            '</div>'+
                                            '<div class="form-group">'+
                                            ' <label class="col-5 control-label">交易金额：'+
                                            ' </label>'+
                                                '<label class="col-5">'+
                                                    '<span id="trans_amt">'+result.data.trans_amt+'元</span>'+
                                                '</label>'+
                                            '</div>'+
                                            '<div class="form-group">'+
                                                '<label class="col-5 control-label">转账付款码：'+
                                                    
                                                '</label>'+
                                                '<label class="col-5">'+
                                                    '<span class="textRed">'+result.data.transfer_no+' <i class="copy_icon"></i></span>'+
                                                '</label>'+
                                            '</div>'+
                                            '<div class="form-group">'+
                                                '<span class="textRed">请牢记此付款码，网银转账需将此付款码提交到附言中</span>'+
                                            '</div> '+
                                        '</div>'+
                                        '<div class="orderInfo">'+
                                            '<div class="tit">付款方信息</div>'+
                                            '<div class="form-group">'+
                                                '<label class="col-5 control-label">付款方账号：'+
                                                    
                                                '</label>'+
                                                '<label class="col-5">'+
                                                    '<span>'+result.data.pay_acct_no+'</span>'+
                                                '</label>'+
                                            '</div>'+
                                            '<div class="form-group">'+
                                            ' <label class="col-5 control-label">付款方户名：'+
                                            ' </label>'+
                                                '<label class="col-5">'+
                                                    '<span id="trans_amt">'+result.data.pay_acct_name+'</span>'+
                                                '</label>'+
                                            '</div>'+
                                        '</div>'+
                                        '<div class="orderInfo">'+
                                            '<div class="tit">收款方信息</div>'+
                                            '<div class="form-group">'+
                                                '<label class="col-5 control-label">收款方账号：'+
                                                    
                                                '</label>'+
                                                '<label class="col-5">'+
                                                    '<span>'+result.data.rec_acct_no+'</span>'+
                                                '</label>'+
                                            '</div>'+
                                            '<div class="form-group">'+
                                            ' <label class="col-5 control-label">收款方户名：'+
                                            ' </label>'+
                                                '<label class="col-5">'+
                                                    '<span id="trans_amt">'+result.data.rec_acct_name+'</span>'+
                                                '</label>'+
                                            '</div>'+
                                            '<div class="form-group">'+
                                                '<label class="col-5 control-label">开户行：'+
                                                    
                                                '</label>'+
                                                '<label class="col-5">'+
                                                    '<span>'+result.data.open_bank_name+'</span>'+
                                                '</label>'+
                                            '</div>'+
                                        '</div>';
                        $('.step3').append(step3Html);
                    }
                    else {
                        wAlert(result.message);
                    }
                })
            })
            $('.nextStep2').click(function () {
                $('.proPhoto').addClass('proP3').removeClass('proP2');
                $('.step2').hide();
                $('.step3').show();
            })
            $('.stepBox').on('click', '.copy_icon', function () {
                App.copyToClipboard('transfer_no')
            })
        },
        copyToClipboard: function (elementId) {
            // 创建元素用于复制
            var aux = document.createElement("input");
            // 获取复制内容
            var content = document.getElementById(elementId).innerHTML || document.getElementById(elementId).value;
            // 设置元素内容
            aux.setAttribute("value", content);
            // 将元素插入页面进行调用
            document.body.appendChild(aux);
            // 复制内容
            aux.select();
            // 将内容复制到剪贴板
            document.execCommand("copy");
            // 删除创建元素
            document.body.removeChild(aux);
            //提示
            wAlert("已成功复制到剪贴板");
        }
    }
})();

