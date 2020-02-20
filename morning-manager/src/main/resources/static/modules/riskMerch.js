/**
 * 商户预警表页面相关处理js
 *
 * @author auto generator
 * @date 2018/11/05 11:25:40
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/riskMerch/list'
        , cols: [[
            {field: 'merchId',fixed:"left", title: '商户号', align: 'center', width: 150}
            , {field: 'merchName', title: '商户名称', align: 'center', minWidth: 230}
            , {field: 'cardNo', title: '卡号', align: 'center', width: 200}
            , {
                field: 'amount', title: '交易金额', align: 'center', width: 150, templet: function (d) {
                    if (d.amount != null) {
                        var amount =  "￥" + formatMoney(d.amount, 2);
                        var html = '<font color="#00A600">'+amount+'</font>';
                        return html;
                    }
                }
            }
            , {
                field: 'transTime', title: '交易时间', align: 'center', width: 200, templet: function (d) {
                    if (d.transDate != null && d.transTime) {
                        return formatTime(d.transDate + d.transTime);
                    }else{
                        return null;
                    }
                }
            }
            , {field: 'describe', title: '简述', align: 'center', minWidth: 320}
            , {title: '操作', width: 120, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , where: ''
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
            case 'detail':
                dialogOk('商户预警详情', '/riskMerch/detailPage/' + data.id, '50%', '100%');
                break;
        }
    });
    //查询按钮
    form.on('submit(table-search)', function (data) {
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
                "merchName": ""
                , "transDateStart": ""
                , "transDateEnd": ""
                , "merchId": ""
                , "agentId": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('riskMerch', {})
});