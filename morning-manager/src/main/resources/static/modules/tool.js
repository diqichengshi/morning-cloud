/**
 * @author: gaof
 * @create: 2018/8/23 9:57
 * @Description: 封装的工具类
 */
/**
 * 模态对话框，适用于[新增][修改]等弹窗页面
 * @param titile 对话框标题
 * @param url 对话框内的内容页面
 * @param height 高 值可以是比例或则数值，10%或500px
 * @param width 宽 同高设置
 * @param submitId 弹框内页面提交按钮id
 * @param callback 回调，传入弹窗的索引号index，方便关闭，以及弹框内页面提交的form数据
 * @return 无
 */
function dialog(title, url, width, height, submitId, callback) {
    layer.open({
        type: 2
        , title: title
        , content: url
        // , offset: '200px'
        , area: [width, height]
        , btn: ['<i class="layui-icon layui-icon-ok"></i>保存', '<i class="layui-icon layui-icon-return">返回']
        , yes: function (index, layero) {
            var iframeWindow = window['layui-layer-iframe' + index]
                , submitID = submitId
                , submit = layero.find('iframe').contents().find('#' + submitID);

            //监听提交
            iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                var field = data.field; //获取提交的字段
                callback(index, field);
            });
            submit.trigger('click');
        }
    });
};

/**
 * 模态对话框，只有一个返回按钮，适用于[详情]类弹窗页面
 * @param titile 对话框标题
 * @param url 对话框内的内容页面
 * @param height 高 值可以是比例或则数值，10%或500px
 * @param width 宽 同高设置
 * @return 无
 */
function dialogOk(title, url, width, height) {
    layer.open({
        type: 2
        , title: title
        , content: url
        // , offset: '200px'
        , area: [width, height]
        , btn: ['<i class="layui-icon layui-icon-return">返回']
        , yes: function (index, layero) {
            layer.close(index);
        }
    });
};

/**
 * 保存按钮置灰
 * @param $
 */
function setSaveBtnCss($){
    $('.layui-layer-btn0').text("保存中...")
    $('.layui-layer-btn0').css('backgroundColor','#abb9c3');
    $('.layui-layer-btn0').css('borderColor','#abb9c3');
    $(".layui-layer-btn0").attr("disabled",true).css("pointer-events","none");
}

/**
 * 取消保存按钮置灰
 * @param $
 */
function cancelSaveBtnCss($){
    $('.layui-layer-btn0').html('<i class="layui-icon layui-icon-ok"></i>保存');
    $('.layui-layer-btn0').css('backgroundColor','#1E9FFF');
    $('.layui-layer-btn0').css('borderColor','#1E9FFF');
    $(".layui-layer-btn0").attr("disabled",false).css("pointer-events","all");
}

/**
 * 通过置灰
 */
function agreeGray($) {
    $('.layui-layer-btn0').text("保存中...")
    $(".layui-layer-btn0").attr("disabled",true).css({"pointer-events":"none","background-color":"#abb9c3","border-color":"#abb9c3"});

    $(".layui-layer-btn1").attr("disabled",true).css({"pointer-events":"none","background-color":"#abb9c3","border-color":"#abb9c3"});
}

/**
 * 驳回置灰
 */
function rejectGray($) {
    $('.layui-layer-btn1').text("保存中...")
    $(".layui-layer-btn1").attr("disabled",true).css({"pointer-events":"none","background-color":"#abb9c3","border-color":"#abb9c3"});

    $(".layui-layer-btn0").attr("disabled",true).css({"pointer-events":"none","background-color":"#abb9c3","border-color":"#abb9c3"});
}

/**
 * 取消置灰
 */
function cancelGray($) {
    $('.layui-layer-btn0').html('<i class="layui-icon layui-icon-ok"></i>通过');
    $(".layui-layer-btn0").attr("disabled",false).css({"pointer-events":"all","background-color":'#1E9FFF',"border-color":'#1E9FFF'});

    $('.layui-layer-btn1').html('<i class="layui-icon layui-icon-close"></i>驳回');
    $(".layui-layer-btn1").attr("disabled",false).css({"pointer-events":"all","background-color":'#FF5722',"border-color":'#FF5722'});
}

/**
 * 获取table种选中的一条记录
 * @param table table对象
 * @param table_id table的id值
 * @return 成功返回选中数据对象，否则返回空
 */
function selectOne(table, table_id) {
    var checkStatus = table.checkStatus(table_id)
        , checkData = checkStatus.data; //得到选中的数据

    if (checkData.length === 0) {
        layer.msg('请选择数据');
        return;
    }
    if (checkData.length > 1) {
        layer.msg('请选择一条数据');
        return;
    }
    return checkData[0];
}

/**
 * 获取table种选中的两条记录
 * @param table table对象
 * @param table_id table的id值
 * @return 成功返回选中数据对象列表，否则返回空
 */
function selectTwo(table, table_id) {
    var checkStatus = table.checkStatus(table_id)
        , checkData = checkStatus.data; //得到选中的数据

    if (checkData.length === 0) {
        layer.msg('请选择数据');
        return;
    }

    if (checkData.length !=2){
        layer.msg("请选择两条数据进行对比");
        return;
    }

    return checkData;
}

/**
 * 获取table种选中的多条记录
 * @param table table对象
 * @param table_id table的id值
 * @return 成功返回选中数据对象列表，否则返回空
 */
function selectMore(table, table_id) {
    var checkStatus = table.checkStatus(table_id)
        , checkData = checkStatus.data; //得到选中的数据

    if (checkData.length === 0) {
        layer.msg('请选择数据');
        return;
    }

    return checkData;
}

/**
 * 格式化时间
 * formatDate(new Date().getTime());//2017-05-12 10:05:44
 * formatDate(new Date().getTime(),'YY年MM月DD日');//2017年05月12日
 * formatDate(new Date().getTime(),'今天是YY/MM/DD hh:mm:ss');//今天是2017/05/12 10:07:45
 * @param time
 * @param format
 */
function formatDate(time, format='YY-MM-DD hh:mm:ss') {
    if (null == time || time === 'undefined')
        return null;

    var date = new Date(time);

    var year = date.getFullYear(),
        month = date.getMonth() + 1,//月份是从0开始的
        day = date.getDate(),
        hour = date.getHours(),
        min = date.getMinutes(),
        sec = date.getSeconds();
    var preArr = Array.apply(null, Array(10)).map(function (elem, index) {
        return '0' + index;
    });////开个长度为10的数组 格式为 00 01 02 03

    var newTime = format.replace(/YY/g, year)
        .replace(/MM/g, preArr[month] || month)
        .replace(/DD/g, preArr[day] || day)
        .replace(/hh/g, preArr[hour] || hour)
        .replace(/mm/g, preArr[min] || min)
        .replace(/ss/g, preArr[sec] || sec);

    return newTime;
}

/**
 * 格式化日期
 * @param d Date
 */
function getyyyyMMdd(d){
    var date = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();
    String(month).length < 2 ? (month = "0" + month): month;
    String(date).length < 2 ? (date = "0" + date): date;
    var yyyyMMdd = year + "" + month +""+ date;
    return yyyyMMdd;
}

/**
 * 增加年限
 * @param time yyyyMMdd
 */
function addYear(time, y) {
    if (null == time || time === 'undefined')
        return null;

    var date = new Date(timeFormat(time));

    var year = date.getFullYear() + y,
        month = date.getMonth() + 1,//月份是从0开始的
        day = date.getDate(),
        hour = date.getHours(),
        min = date.getMinutes(),
        sec = date.getSeconds();
    var preArr = Array.apply(null, Array(10)).map(function (elem, index) {
        return '0' + index;
    });////开个长度为10的数组 格式为 00 01 02 03

    var newTime = 'YYMMDD'.replace(/YY/g, year)
        .replace(/MM/g, preArr[month] || month)
        .replace(/DD/g, preArr[day] || day)
        .replace(/hh/g, preArr[hour] || hour)
        .replace(/mm/g, preArr[min] || min)
        .replace(/ss/g, preArr[sec] || sec);

    return newTime;
}


function formatJson(json, options) {
    var reg = null,
        formatted = '',
        pad = 0,
        PADDING = '    '; // one can also use '\t' or a different number of spaces

    // optional settings
    options = options || {};
    // remove newline where '{' or '[' follows ':'
    options.newlineAfterColonIfBeforeBraceOrBracket = (options.newlineAfterColonIfBeforeBraceOrBracket === true) ? true : false;
    // use a space after a colon
    options.spaceAfterColon = (options.spaceAfterColon === false) ? false : true;

    // begin formatting...

    // make sure we start with the JSON as a string
    if (typeof json !== 'string') {
        json = JSON.stringify(json);
    }
    // parse and stringify in order to remove extra whitespace
    // json = JSON.stringify(JSON.parse(json));可以除去多余的空格
    json = JSON.parse(json);
    json = JSON.stringify(json);

    // add newline before and after curly braces
    reg = /([\{\}])/g;
    json = json.replace(reg, '\r\n$1\r\n');

    // add newline before and after square brackets
    reg = /([\[\]])/g;
    json = json.replace(reg, '\r\n$1\r\n');

    // add newline after comma
    reg = /(\,)/g;
    json = json.replace(reg, '$1\r\n');

    // remove multiple newlines
    reg = /(\r\n\r\n)/g;
    json = json.replace(reg, '\r\n');

    // remove newlines before commas
    reg = /\r\n\,/g;
    json = json.replace(reg, ',');

    // optional formatting...
    if (!options.newlineAfterColonIfBeforeBraceOrBracket) {
        reg = /\:\r\n\{/g;
        json = json.replace(reg, ':{');
        reg = /\:\r\n\[/g;
        json = json.replace(reg, ':[');
    }
    if (options.spaceAfterColon) {
        reg = /\:/g;
        json = json.replace(reg, ': ');
    }

    $.each(json.split('\r\n'), function (index, node) {
        var i = 0,
            indent = 0,
            padding = '';

        if (node.match(/\{$/) || node.match(/\[$/)) {
            indent = 1;
        } else if (node.match(/\}/) || node.match(/\]/)) {
            if (pad !== 0) {
                pad -= 1;
            }
        } else {
            indent = 0;
        }

        for (i = 0; i < pad; i++) {
            padding += PADDING;
        }

        formatted += padding + node + '\r\n';
        pad += indent;
    });

    return formatted;
}

/**
 * 格式化金额
 *@method formaNum
 *@param  {int} num 需要被格式化的数额
 {int} s   需要保留的小数位数
 *@return {string}  返回格式化后的数额
 */
function formatMoney(s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
}

/**
 * 格式化交易时间(date)
 *@method formaNum
 *@param   time 需要被格式化的数额
 *@return {string}  返回格式化后的时间
 */
function formatTime(time) {
    if (time.indexOf('-') >= 0) {
        return time;
    }
    if (null != time && "" != time && undefined != time && time.length >=12) {
        var yyyy = time.substr(0, 4);
        var MM = time.substr(4, 2);
        var dd = time.substr(6, 2);
        var hh = time.substr(8, 2);
        var mm = time.substr(10, 2);
        var ss = time.substr(12, 2);
        return yyyy + '-' + MM + '-' + dd + " " + hh + ":" + mm + ":" + ss;
    }

    return time;
}
function timeFormat(time) {
    if (time.indexOf('-') >= 0) {
        return time;
    }
    if (null != time && "" != time && undefined != time && time.length >= 6) {
        var yyyy = time.substr(0, 4);
        var MM = time.substr(4, 2);
        var dd = time.substr(6, 2);

        return yyyy + '-' + MM + '-' + dd
    }

    return time;
}

function dialogSelect(title, url, width, height, submitId, callback) {
    layer.open({
        type: 2
        , title: title
        , content: url
        // , offset: '200px'
        , area: [width, height]
        , btn: ['<i class="layui-icon layui-icon-ok"></i>保存', '<i class="layui-icon layui-icon-return">返回']
        , yes: function (index, layero) {
            var iframeWindow = window['layui-layer-iframe' + index]
                , submitID = submitId
                , submit = layero.find('iframe').contents().find('#' + submitID)
                , checkStatus = window[layero.find('iframe')[0]['name']].layui.table.checkStatus('table-data-organize')
                , checkData = checkStatus.data; //得到选中的数据

            if (checkData.length === 0) {
                layer.msg('请选择数据');
                return;
            }

            //监听提交
            iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                var field = data.field; //获取提交的字段
                callback(index, field,checkData);
            });
            submit.trigger('click');
        }
    });
};
