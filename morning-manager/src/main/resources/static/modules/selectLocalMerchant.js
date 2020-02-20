/**
 * 生活圈商户-选择本地商户
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/lifeCircleMerch/merchantABList'
       // , dataType: "json"
       // , contentType: "application/json;charset-UTF-8"
        , cols: [[
            {type: 'radio', fixed: 'left', align: 'center', disabled: true}
            , {field: 'merchId', title: '商户号', align: 'center', minWidth: 150}
            , {field: 'merchName', title: '商户名称', align: 'center', minWidth: 200}
            , {field: 'merchPname', title: '签购单打印特约商户名称', align: 'center', minWidth: 200}
            , {field: 'legalName', title: '法人', align: 'center', minWidth: 100}
            , {field: 'mcc', title: 'MCC', align: 'center', minWidth: 100}
            , {field: 'companyName', title: '分公司', align: 'center', minWidth: 200}
            , {
                field: 'gradeMerchLevel', title: '商户评级', align: 'center', width: 100, templet: function (d) {
                    var html = '';
                    if (d.gradeMerchLevel == '1') {
                        html = '<span class="layui-badge layui-bg-blue">A</span>';
                    }
                    else if (d.gradeMerchLevel == '2') {
                        html = '<span class="layui-badge layui-bg-green ">B</span>';
                    }
                    return html;
                }
            }
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none: '暂无数据'}
    };
    table.render(option);

    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        option.where = field;
        table.render(option);
    });
    //工具栏按钮
    var active = {
        //重置,新增的查询条件记得在此处清空
        reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                "merchId": ""
                , "merchName": ""
                , "legalName": ""
                , "mcc": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    //监听行单击事件（单击事件为：rowDouble）
    table.on('row(table-operation-filter)', function (obj) {
        var data = obj.data;
        parent.merch = data;

        //标注选中样式
        obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        obj.tr.find('input[lay-type="layTableRadio"]').prop("checked", true);
        var index = obj.tr.data('index')
        var thisData = table.cache.tableName;//tableName 表名
        //重置数据单选属性
        layui.each(thisData, function (i, item) {
            if (index === i) {
                item.LAY_CHECKED = true;
            } else {
                delete item.LAY_CHECKED;
            }
        });
        form.render('radio');
    });

    exports('selectLocalMerchant', {})
});