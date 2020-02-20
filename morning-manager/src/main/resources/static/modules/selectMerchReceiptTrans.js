layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data-organize'
        , method: 'post'
        , url: '/merchTransferReceipt/selectMerchReceiptTransList'
        , cols: [[
            {type: 'radio', fixed: 'left', align: 'center'}
            , {field: 'id', title: '', align: 'center', minWidth: 100, hide: true}
            , {field: 'merchId', title: '商户号', align: 'center', minWidth: 200}
            , {field: 'merchName', title: '商户名称', align: 'center', minWidth: 200}
            , {field: 'agentId', title: '代理商编号', align: 'center', minWidth: 100}
            , {field: 'agentName', title: '代理商名称', align: 'center', minWidth: 200}
            , {field: 'termId', title: '终端号', align: 'center', minWidth: 100}
            , {field: 'transName', title: '交易类型', align: 'center', minWidth: 200}
            , {
                field: 'amount', title: '交易金额(元)', align: 'center', minWidth: 120, templet: function (d) {
                    if (d.amount != null) {
                        var reAmt = formatMoney(d.amount, 2);
                        var html = '<font color="#00A600">' + reAmt + '</font>';
                        return html;
                    }else {
                        return "";
                    }
                }
            }
            , {field: 'rrn', title: '参考号', align: 'center', minWidth: 150}
            , {field: 'traceNo', title: '流水号', align: 'center', minWidth: 100}
            , {
                field: 'transDate', title: '交易日期', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.transDate != null) {
                        return formatTime(d.transDate+d.transTime);
                    } else {
                        return "";
                    }
                }
            }
            //, {field: 'transTime', title: '交易时间', align: 'center', minWidth: 150}
            /*,{
                field: 'status', title: '状态', minWidth: 70, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.status == '0') {
                        html = '<span class="layui-badge layui-bg-black">无效</span>';
                    }
                    else if (d.status == 'X' || d.status == 'x') {
                        html = '<span class="layui-badge">注销</span>';
                    } else {
                        html = '<span></span>';
                    }
                    return html;
                }
            }*/
            /*, {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}*/
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none:'暂无数据'}
    };
    table.render(option);
    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'selectMerchReceiptTrans':
                break;
        }
    });
    //查询按钮
    form.on('submit(table-organize-search)', function (data) {
    	var field = data.field;
        option.where=field;
        table.render(option);
    });
    //工具栏按钮,基本功能:新增,批量删除以及重置.新功能基本都在此处理
    var active = {
        //重置,新增的查询条件记得在此处清空
        reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                 "merchId": "", 
                 "rrn": "",
                 "termId": "",
                 "traceNo": "",
                 "agentId": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('selectMerchReceiptTrans', {})
});