/**
 * 工作台相关处理js
 *
 * @author gg
 * @date 2020/01/21 09:32:41
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/merchAuthLimitAud/list'
        , cols: [[
            {hide: 'id', title: '', align: 'center', minWidth: 100}
            , {field: 'merchId', fixed: 'left', title: '商户号', align: 'center', minWidth: 150}
            , {field: 'merchName', title: '商户名称', align: 'center', minWidth: 200}
            , {field: 'totalLimit', title: '总额度', align: 'center', minWidth: 100}
            , {field: 'proposerCode', title: '申请人', align: 'center', minWidth: 100}
            , {
                field: 'proposerTime', title: '申请时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.proposerTime != null) {
                        return formatDate(d.proposerTime);
                    }else{
                        return '';
                    }
                }
            }
            , {
                field: 'auditOperation', title: '审核状态', minWidth: 100, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.auditOperation == '0') {
                        html = '<span class="layui-badge layui-bg-black">待审核</span>';
                    }
                    else if (d.auditOperation == '1'){
                        html = '<span class="layui-badge layui-bg-green">已通过</span>';
                    }
                    else if (d.auditOperation == '2'){
                        html = '<span class="layui-badge">已驳回</span>';
                    }
                    else{
                        html = '<span></span>';
                    }
                    return html;
                }
            }
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }else{
                        return '';
                    }
                }
            }
            , {field: 'createUserId', title: '创建人', align: 'center', minWidth: 100}
            , {title: '操作', minWidth: 100, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , where: ''
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none:'暂无数据'}
    };

    var option1 = {
        elem: '#table-data1'
        , method: 'post'
        , url: '/merchD0TransAud/list'
        , cols: [[
            {field: 'merchId', title: '商户号', align: 'center',fixed: 'left', minWidth: 150}
            , {field: 'merchName', title: '商户名称', align: 'center', minWidth: 200}
            , {
                field: 'optType', title: '申请类型 ', align: 'center', minWidth: 100, templet: function (d) {
                    if (d.optType == '0') {
                        return '移除';
                    }
                    if (d.optType == '1') {
                        return '新增';
                    }
                }
            }

            , {field: 'proposerCode', title: '申请人名称', align: 'center', minWidth: 100}
            , {
                field: 'auditOperation', title: '审核状态', align: 'center', minWidth: 100, templet: function (d) {

                    var html = null;
                    if (d.auditOperation == '0') {
                        html = '<span class="layui-badge layui-bg-black">待审核</span>';
                    }
                    else if (d.auditOperation == '1') {
                        html = '<span class="layui-badge layui-bg-green">已通过</span>';
                    }
                    else if (d.auditOperation == '2') {
                        html = '<span class="layui-badge">已驳回</span>';
                    }
                    else {
                        html = '<span></span>';
                    }
                    return html;
                }
            }

            , {
                field: 'proposerTime', title: '申请时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.proposerTime != null) {
                        return formatDate(d.proposerTime);
                    }
                }
            }
            , {field: 'auditorCode', title: '审核人名称', align: 'center', minWidth: 100}

            , {
                field: 'auditorTime', title: '审核时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.auditorTime != null) {
                        return formatDate(d.auditorTime);
                    } else {
                        return "";
                    }
                }
            }
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    } else {
                        return "";
                    }
                }
            }
            , {title: '操作', minWidth: 100, align: 'center', fixed: 'right', toolbar: '#table-operation1'}

        ]]
        , page: true
        , limit: 10
        , where: ''
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none: '暂无数据'}
    };

    var option2 = {
        elem: '#table-data2'
        , method: 'post'
        , url: '/merchAccountFrozenAud/list'
        , cols: [[
            {field: 'merchId', fixed: 'left',title: '商户号', align: 'center', minWidth: 150}
            , {field: 'merchName', title: '商户名称', align: 'center', minWidth: 200}
            , {field: 'accountUuid', title: '账户UUID', align: 'center', minWidth: 300}
            , {
                field: 'walletType', title: '钱包类型', align: 'center', minWidth: 150, templet: function (d) {
                    var html;
                    if (d.walletType == '0') {
                        html = '<span>全部</span>';
                    }else if (d.walletType == '100') {
                        html = '<span>POS D0可提现钱包</span>';
                    } else if (d.walletType == '102') {
                        html = '<span>POS T1钱包</span>';
                    } else if (d.walletType == '200') {
                        html = '<span>二维码 D0可提现钱包</span>';
                    } else if (d.walletType == '202') {
                        html = '<span>二维码T1钱包</span>';
                    } else if (d.walletType == '400') {
                        html = '<span>快捷支付D0可提现钱包</span>';
                    } else if (d.walletType == '402') {
                        html = '<span>快捷支付T1钱包</span>';
                    } else if (d.walletType == '700') {
                        html = '<span>B2B D0钱包</span>';
                    } else if (d.walletType == '702') {
                        html = '<span>B2B T1钱包</span>';
                    } else if (d.walletType == '730') {
                        html = '<span>B2B冻结钱包</span>';
                    } else {
                        html = '<span></span>';
                    }
                    return html;
                }
            }
            , {
                field: 'businessType',
                title: '业务类型',
                align: 'center',
                minWidth: 100,
                templet: function (d) {
                    var html;
                    if (d.businessType == '1') {
                        html = '<span>风控冻结</span>';
                    } else if (d.businessType == '2') {
                        html = '<span>助贷通押金冻结</span>';
                    }else{
                        html = '<span></span>';
                    }
                    return html;
                }
            }
            , {
                field: 'optType', title: '操作类型', align: 'center', minWidth: 100, templet: function (d) {
                    var html;
                    if (d.optType == '1') {
                        html = '<span>冻结</span>';
                    } else if (d.optType == '5') {
                        html = '<span>解冻</span>';
                    } else if (d.optType == '6') {
                        html = '<span>扣除</span>';
                    }else{
                        html = '<span></span>';
                    }
                    return html;
                }
            }
            , {field: 'proposerCode', title: '申请人', align: 'center', minWidth: 100}
            , {
                field: 'proposerTime', title: '申请时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.proposerTime != null) {
                        return formatDate(d.proposerTime);
                    }
                }
            }
            , {
                field: 'auditOperation', title: '审核状态', minWidth: 100, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.auditOperation == '0') {
                        html = '<span class="layui-badge layui-bg-black">待审核</span>';
                    }
                    else if (d.auditOperation == '1'){
                        html = '<span class="layui-badge layui-bg-green">已通过</span>';
                    }
                    else if (d.auditOperation == '2'){
                        html = '<span class="layui-badge">已驳回</span>';
                    }
                    else{
                        html = '<span></span>';
                    }
                    return html;
                }
            }
            , {field: 'auditorCode', title: '审核人', align: 'center', minWidth: 100}
            , {
                field: 'auditorTime', title: '审核时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.auditorTime != null) {
                        return formatDate(d.auditorTime);
                    }else{
                        return '';
                    }
                }
            }
            , {title: '操作', minWidth: 100, align: 'center', fixed: 'right', toolbar: '#table-operation2'}
        ]]
        , page: true
        , limit: 10
        , where: ''
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none: '暂无数据'}
    };

    var row = {};
    row.auditOperation='0';
    option.where= row;
    option1.where=row;
    option2.where=row;
    table.render(option);
    table.render(option1);
    table.render(option2);
    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'audit':
                layer.open({
                    skin:"audit"
                    ,
                    type: 2
                    ,
                    title: 'D0调额审核'
                    ,
                    content: '/merchAuthLimitAud/auditPage/' + data.id
                    ,
                    area: ['60%', '80%']
                    ,
                    btn: ['<i class="layui-icon layui-icon-ok"></i>通过', '<i class="layui-icon layui-icon-close"></i>驳回', '<i class="layui-icon layui-icon-return">返回']
                    ,
                    yes: function (index, layero) {
                        var iframeWindow = window['layui-layer-iframe' + index]
                            , submitID = 'audit-submit'
                            , submit = layero.find('iframe').contents().find('#' + submitID);

                        //监听提交
                        iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                            var field = data.field; //获取提交的字段
                            field.auditOperation=1;
                            $.ajax({
                                type: "post"
                                , contentType:'application/json;charset=utf-8'
                                , data:JSON.stringify(field)
                                , url: "/merchAuthLimitAud/audit"
                                , dataType: "json"
                                , success: function (result) {
                                    layer.msg(result.msg);
                                    if (result.code == 0) {
                                        table.reload('table-data');
                                        //用来刷新D0调额审核标签数据
                                        $.ajax({
                                            type: "post"
                                            , data:{"auditOperation":"0","page":1,"limit":10}
                                            , url: "/merchAuthLimitAud/list"
                                            , dataType: "json"
                                            , success: function (result) {
                                                if (result.code == 0) {
                                                    if(null==result.count){
                                                        document.getElementById("adjustment").innerText = 0;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }else{
                                                        document.getElementById("adjustment").innerText = result.count;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }
                                                } else {
                                                    document.getElementById("adjustment").innerText = 0;
                                                    //这一步是为了刷新待审核总数标签数据
                                                    var counts=0;
                                                    if(document.getElementById("adjustment")!=null){
                                                        counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                    }
                                                    if(document.getElementById("whitelist")!=null){
                                                        counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                    }
                                                    if(document.getElementById("freeze")!=null){
                                                        counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                    }
                                                    document.getElementById("totals").innerText=counts;
                                                }
                                            }
                                        });
                                        layer.close(index); //关闭弹层
                                    }
                                }
                            });
                        });
                        submit.trigger('click');
                    }
                    ,
                    btn2: function (index, layero) {
                        var iframeWindow = window['layui-layer-iframe' + index]
                            , submitID = 'audit-submit'
                            , submit = layero.find('iframe').contents().find('#' + submitID);

                        //监听提交
                        iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                            var field = data.field; //获取提交的字段
                            field.auditOperation=2;
                            if(field.auditOpinion == ''){
                                layer.msg('审核意见不能为空');
                                return;
                            }
                            $.ajax({
                                type: "post"
                                , contentType:'application/json;charset=utf-8'
                                , data:JSON.stringify(field)
                                , url: "merchAuthLimitAud/audit"
                                , dataType: "json"
                                , success: function (result) {
                                    layer.msg(result.msg);
                                    if (result.code == 0) {
                                        table.reload('table-data');
                                        //用来刷新D0调额审核标签数据
                                        $.ajax({
                                            type: "post"
                                            , data:{"auditOperation":"0","page":1,"limit":10}
                                            , url: "/merchAuthLimitAud/list"
                                            , dataType: "json"
                                            , success: function (result) {
                                                if (result.code == 0) {
                                                    if(null==result.count){
                                                        document.getElementById("adjustment").innerText = 0;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }else{
                                                        document.getElementById("adjustment").innerText = result.count;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }
                                                } else {
                                                    document.getElementById("adjustment").innerText = 0;
                                                    //这一步是为了刷新待审核总数标签数据
                                                    var counts=0;
                                                    if(document.getElementById("adjustment")!=null){
                                                        counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                    }
                                                    if(document.getElementById("whitelist")!=null){
                                                        counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                    }
                                                    if(document.getElementById("freeze")!=null){
                                                        counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                    }
                                                    document.getElementById("totals").innerText=counts;
                                                }
                                            }
                                        });
                                        layer.close(index); //关闭弹层
                                    }
                                }
                            });
                        });
                        submit.trigger('click');
                        return false;
                    }
                    ,
                    btn3:function (index, layero) {
                    }
                });
                break;
        }
    });

    table.on('tool(table-operation-filter1)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'review':
                layer.open({
                    skin: "review",
                    type: 2,
                    title: 'D0白名单审核',
                    content: '/merchD0TransAud/reviewPage/' + data.id,
                    area: ['80%', '90%'],
                    btn: ['<i class="layui-icon layui-icon-ok"></i>通过', '<i class="layui-icon layui-icon-close"></i>驳回', '<i class="layui-icon layui-icon-return">返回'],
                    yes: function (index, layero) {

                        var iframeWindow = window['layui-layer-iframe' + index]
                            , submitID = 'review-submit'
                            , submit = layero.find('iframe').contents().find('#' + submitID);

                        //监听提交
                        iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                            var field = data.field; //获取提交的字段
                            field.auditOperation = 1;

                            $.ajax({
                                type: "post"
                                , url: "/merchD0TransAud/review"
                                , data: JSON.stringify(field)
                                , dataType: "json"
                                , contentType: "application/json;charset-UTF-8"
                                , success: function (result) {
                                    layer.msg(result.message);
                                    if (result.code == 0) {
                                        table.reload('table-data1');
                                        //用来刷新D0白名单审核标签数据
                                        $.ajax({
                                            type: "post"
                                            , data: {"auditOperation": "0", "page": 1, "limit": 10}
                                            , url: "/merchD0TransAud/list"
                                            , dataType: "json"
                                            , success: function (result) {
                                                if (result.code == 0) {
                                                    if(null==result.count){
                                                        document.getElementById("whitelist").innerText = 0;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }else{
                                                        document.getElementById("whitelist").innerText = result.count;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }
                                                } else {
                                                    document.getElementById("whitelist").innerText = 0;
                                                    //这一步是为了刷新待审核总数标签数据
                                                    var counts=0;
                                                    if(document.getElementById("adjustment")!=null){
                                                        counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                    }
                                                    if(document.getElementById("whitelist")!=null){
                                                        counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                    }
                                                    if(document.getElementById("freeze")!=null){
                                                        counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                    }
                                                    document.getElementById("totals").innerText=counts;
                                                }
                                            }
                                        });
                                        layer.close(index); //关闭弹层
                                    }
                                }
                            });
                        });
                        submit.trigger('click');
                    }
                    ,
                    btn2: function (index, layero) {
                        var iframeWindow = window['layui-layer-iframe' + index]
                            , submitID = 'review-submit'
                            , submit = layero.find('iframe').contents().find('#' + submitID);
                        //监听提交
                        iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                            var field = data.field; //获取提交的字段
                            field.auditOperation = 2;
                            if (field.auditOpinion == '') {
                                layer.msg('审核意见不能为空');
                                return;
                            }
                            $.ajax({
                                type: "post"
                                , url: "merchD0TransAud/review"
                                , data: JSON.stringify(field)
                                , dataType: "json"
                                , contentType: "application/json;charset-UTF-8"
                                , success: function (result) {
                                    layer.msg(result.message);
                                    if (result.code == 0) {
                                        table.reload('table-data1');
                                        //用来刷新D0白名单审核标签数据
                                        $.ajax({
                                            type: "post"
                                            , data: {"auditOperation": "0", "page": 1, "limit": 10}
                                            , url: "/merchD0TransAud/list"
                                            , dataType: "json"
                                            , success: function (result) {
                                                if (result.code == 0) {
                                                    if(null==result.count){
                                                        document.getElementById("whitelist").innerText = 0;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }else{
                                                        document.getElementById("whitelist").innerText = result.count;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }
                                                } else {
                                                    document.getElementById("whitelist").innerText = 0;
                                                    //这一步是为了刷新待审核总数标签数据
                                                    var counts=0;
                                                    if(document.getElementById("adjustment")!=null){
                                                        counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                    }
                                                    if(document.getElementById("whitelist")!=null){
                                                        counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                    }
                                                    if(document.getElementById("freeze")!=null){
                                                        counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                    }
                                                    document.getElementById("totals").innerText=counts;
                                                }
                                            }
                                        });
                                        layer.close(index); //关闭弹层
                                    }
                                }
                            });
                        });
                        submit.trigger('click');
                        return false;
                    }
                    ,
                    btn3: function (index, layero) {
                    }
                });
                break;
        }
    });

    table.on('tool(table-operation-filter2)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'auth':
                layer.open({
                    skin:"auth",
                    type: 2,
                    title: '账户冻结申请审核',
                    content: '/merchAccountFrozenAud/authPage/' + data.id,
                    area: ['75%', '85%'],
                    btn: ['<i class="layui-icon layui-icon-ok"></i>通过', '<i class="layui-icon layui-icon-close"></i>驳回', '<i class="layui-icon layui-icon-return">返回'],
                    yes: function (index, layero) {
                        $('.layui-layer-btn0').text("保存中...")
                        $(".layui-layer-btn0").attr("disabled",true).css({"pointer-events":"none","background-color":"#abb9c3","border-color":"#abb9c3"});
                        var iframeWindow = window['layui-layer-iframe' + index]
                            , submitID = 'auth-submit'
                            , submit = layero.find('iframe').contents().find('#' + submitID);
                        //监听提交
                        iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                            var field = data.field; //获取提交的字段
                            field.auditOperation=1;
                            $.ajax({
                                type: "post"
                                , url: "/merchAccountFrozenAud/auth"
                                , data: field
                                , dataType: "json"
                                , success: function (result) {
                                    layer.msg(result.msg);
                                    $('.layui-layer-btn0').html('<i class="layui-icon layui-icon-ok"></i>通过');
                                    $(".layui-layer-btn0").attr("disabled",false).css({"pointer-events":"all","background-color":'#1E9FFF',"border-color":'#1E9FFF'});
                                    if (result.code == 0) {
                                        table.reload('table-data2');
                                        //用来刷新账户冻结审核标签数据
                                        $.ajax({
                                            type: "post"
                                            , data: {"auditOperation": "0", "page": 1, "limit": 10}
                                            , url: "/merchAccountFrozenAud/list"
                                            , dataType: "json"
                                            , success: function (result) {
                                                if (result.code == 0) {
                                                    if(null==result.count){
                                                        document.getElementById("freeze").innerText = 0;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }else{
                                                        document.getElementById("freeze").innerText = result.count;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }
                                                } else {
                                                    document.getElementById("freeze").innerText = 0;
                                                    //这一步是为了刷新待审核总数标签数据
                                                    var counts=0;
                                                    if(document.getElementById("adjustment")!=null){
                                                        counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                    }
                                                    if(document.getElementById("whitelist")!=null){
                                                        counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                    }
                                                    if(document.getElementById("freeze")!=null){
                                                        counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                    }
                                                    document.getElementById("totals").innerText=counts;
                                                }
                                            }
                                        });

                                        layer.close(index); //关闭弹层
                                    }
                                }
                            });
                        });
                        submit.trigger('click');
                    },
                    btn2: function (index, layero) {
                        var iframeWindow = window['layui-layer-iframe' + index]
                            , submitID = 'auth-submit'
                            , submit = layero.find('iframe').contents().find('#' + submitID);
                        //监听提交
                        iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                            var field = data.field; //获取提交的字段
                            field.auditOperation=2;
                            if(field.auditOpinion == ''){
                                layer.msg('审核意见不能为空');
                                return;
                            }else if(field.auditOpinion.length>100){
                                layer.msg('审核意见不能超过100个字');
                                return;
                            }
                            $('.layui-layer-btn1').text("保存中...")
                            $(".layui-layer-btn1").attr("disabled",true).css({"pointer-events":"none","background-color":"#abb9c3","border-color":"#abb9c3"});
                            $.ajax({
                                type: "post",
                                url: "/merchAccountFrozenAud/auth",
                                data: field,
                                dataType: "json",
                                success: function (result) {
                                    layer.msg(result.msg);
                                    $('.layui-layer-btn1').html('<i class="layui-icon layui-icon-close"></i>驳回');
                                    $(".layui-layer-btn1").attr("disabled",false).css({"pointer-events":"all","background-color":"#FF5722","border-color":"#FF5722"});
                                    if (result.code == 0) {
                                        table.reload('table-data2');
                                        //用来刷新账户冻结审核标签数据
                                        $.ajax({
                                            type: "post"
                                            , data: {"auditOperation": "0", "page": 1, "limit": 10}
                                            , url: "/merchAccountFrozenAud/list"
                                            , dataType: "json"
                                            , success: function (result) {
                                                if (result.code == 0) {
                                                    if(null==result.count){
                                                        document.getElementById("freeze").innerText = 0;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }else{
                                                        document.getElementById("freeze").innerText = result.count;
                                                        //这一步是为了刷新待审核总数标签数据
                                                        var counts=0;
                                                        if(document.getElementById("adjustment")!=null){
                                                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                        }
                                                        if(document.getElementById("whitelist")!=null){
                                                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                        }
                                                        if(document.getElementById("freeze")!=null){
                                                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                        }
                                                        document.getElementById("totals").innerText=counts;
                                                    }
                                                } else {
                                                    document.getElementById("freeze").innerText = 0;
                                                    //这一步是为了刷新待审核总数标签数据
                                                    var counts=0;
                                                    if(document.getElementById("adjustment")!=null){
                                                        counts=counts+parseInt(document.getElementById("adjustment").innerText);
                                                    }
                                                    if(document.getElementById("whitelist")!=null){
                                                        counts=counts+parseInt(document.getElementById("whitelist").innerText);
                                                    }
                                                    if(document.getElementById("freeze")!=null){
                                                        counts=counts+parseInt(document.getElementById("freeze").innerText);
                                                    }
                                                    document.getElementById("totals").innerText=counts;
                                                }
                                            }
                                        });
                                        layer.close(index); //关闭弹层
                                    }
                                }
                            });
                        });
                        submit.trigger('click');
                        return false;
                    },
                    btn3:function (index, layero) {
                    }
                });
                break;
        }
    });


    //D0调额审核查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        table.reload('table-data', {
            where: field,
            page:1
        });
        //点击查询D0调额审核查询条件时刷新D0调额和待审核总数标签数据
        $.ajax({
            type: "post"
            , data:{"auditOperation":"0","page":1,"limit":10}
            , url: "/merchAuthLimitAud/list"
            , dataType: "json"
            , success: function (result) {
                if (result.code == 0) {
                    if(null==result.count){
                        document.getElementById("adjustment").innerText = 0;
                        //这一步是为了刷新待审核总数标签数据
                        var counts=0;
                        if(document.getElementById("adjustment")!=null){
                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                        }
                        if(document.getElementById("whitelist")!=null){
                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                        }
                        if(document.getElementById("freeze")!=null){
                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                        }
                        document.getElementById("totals").innerText=counts;
                    }else{
                        document.getElementById("adjustment").innerText = result.count;
                        //这一步是为了刷新待审核总数标签数据
                        var counts=0;
                        if(document.getElementById("adjustment")!=null){
                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                        }
                        if(document.getElementById("whitelist")!=null){
                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                        }
                        if(document.getElementById("freeze")!=null){
                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                        }
                        document.getElementById("totals").innerText=counts;
                    }
                } else {
                    document.getElementById("adjustment").innerText = 0;
                    //这一步是为了刷新待审核总数标签数据
                    var counts=0;
                    if(document.getElementById("adjustment")!=null){
                        counts=counts+parseInt(document.getElementById("adjustment").innerText);
                    }
                    if(document.getElementById("whitelist")!=null){
                        counts=counts+parseInt(document.getElementById("whitelist").innerText);
                    }
                    if(document.getElementById("freeze")!=null){
                        counts=counts+parseInt(document.getElementById("freeze").innerText);
                    }
                    document.getElementById("totals").innerText=counts;
                }
            }
        });
    });
    //D0白名单审核查询按钮
    form.on('submit(table-search1)', function (data) {
        var field = data.field;
        table.reload('table-data1', {
            where: field,
            page:1
        });
        //点击查询D0白名单审核查询条件时刷新D0白名单审核和待审核总数标签数据
        $.ajax({
            type: "post"
            , data: {"auditOperation": "0", "page": 1, "limit": 10}
            , url: "/merchD0TransAud/list"
            , dataType: "json"
            , success: function (result) {
                if (result.code == 0) {
                    if(null==result.count){
                        document.getElementById("whitelist").innerText = 0;
                        //这一步是为了刷新待审核总数标签数据
                        var counts=0;
                        if(document.getElementById("adjustment")!=null){
                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                        }
                        if(document.getElementById("whitelist")!=null){
                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                        }
                        if(document.getElementById("freeze")!=null){
                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                        }
                        document.getElementById("totals").innerText=counts;
                    }else{
                        document.getElementById("whitelist").innerText = result.count;
                        //这一步是为了刷新待审核总数标签数据
                        var counts=0;
                        if(document.getElementById("adjustment")!=null){
                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                        }
                        if(document.getElementById("whitelist")!=null){
                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                        }
                        if(document.getElementById("freeze")!=null){
                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                        }
                        document.getElementById("totals").innerText=counts;
                    }
                } else {
                    document.getElementById("whitelist").innerText = 0;
                    //这一步是为了刷新待审核总数标签数据
                    var counts=0;
                    if(document.getElementById("adjustment")!=null){
                        counts=counts+parseInt(document.getElementById("adjustment").innerText);
                    }
                    if(document.getElementById("whitelist")!=null){
                        counts=counts+parseInt(document.getElementById("whitelist").innerText);
                    }
                    if(document.getElementById("freeze")!=null){
                        counts=counts+parseInt(document.getElementById("freeze").innerText);
                    }
                    document.getElementById("totals").innerText=counts;
                }
            }
        });
    });
    //账户冻结审核查询按钮
    form.on('submit(table-search2)', function (data) {
        var field = data.field;
        table.reload('table-data2', {
            where: field,
            page:1
        });
        //点击查询账户冻结审核查询条件时刷新账户冻结审核和待审核总数标签数据
        $.ajax({
            type: "post"
            , data: {"auditOperation": "0", "page": 1, "limit": 10}
            , url: "/merchAccountFrozenAud/list"
            , dataType: "json"
            , success: function (result) {
                if (result.code == 0) {
                    if(null==result.count){
                        document.getElementById("freeze").innerText = 0;
                        //这一步是为了刷新待审核总数标签数据
                        var counts=0;
                        if(document.getElementById("adjustment")!=null){
                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                        }
                        if(document.getElementById("whitelist")!=null){
                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                        }
                        if(document.getElementById("freeze")!=null){
                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                        }
                        document.getElementById("totals").innerText=counts;
                    }else{
                        document.getElementById("freeze").innerText = result.count;
                        //这一步是为了刷新待审核总数标签数据
                        var counts=0;
                        if(document.getElementById("adjustment")!=null){
                            counts=counts+parseInt(document.getElementById("adjustment").innerText);
                        }
                        if(document.getElementById("whitelist")!=null){
                            counts=counts+parseInt(document.getElementById("whitelist").innerText);
                        }
                        if(document.getElementById("freeze")!=null){
                            counts=counts+parseInt(document.getElementById("freeze").innerText);
                        }
                        document.getElementById("totals").innerText=counts;
                    }
                } else {
                    document.getElementById("freeze").innerText = 0;
                    //这一步是为了刷新待审核总数标签数据
                    var counts=0;
                    if(document.getElementById("adjustment")!=null){
                        counts=counts+parseInt(document.getElementById("adjustment").innerText);
                    }
                    if(document.getElementById("whitelist")!=null){
                        counts=counts+parseInt(document.getElementById("whitelist").innerText);
                    }
                    if(document.getElementById("freeze")!=null){
                        counts=counts+parseInt(document.getElementById("freeze").innerText);
                    }
                    document.getElementById("totals").innerText=counts;
                }
            }
        });

    });
    //工具栏按钮,基本功能:新增,批量删除以及重置.新功能基本都在此处理
    var active = {
        //重置,新增的查询条件记得在此处清空
        reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                "merchId":""
                ,"merchName":""
                ,"proposerTimeStart":""
                ,"proposerTimeEnd":""
            })
        }
        , reset1: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search1", {
                "merchId":""
                ,"merchName":""
                ,"proposerCode": ""
                ,"optType": ""
                ,"proposerTimeStart":""
                ,"proposerTimeEnd":""
            })
        }
        , reset2: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search2", {
                "merchId":""
                ,"merchName":""
                ,"accountUuid":""
                ,"optType": ""
                ,"walletType":""
                ,"proposerCode":""
                ,"auditorCode":""
                ,"proposerTimeStart":""
                ,"proposerTimeEnd":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('workBench', {})
});