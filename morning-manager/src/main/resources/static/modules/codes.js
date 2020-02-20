/**

 @Name：layuiAdmin 内容系统
 @Author：star1029
 @Site：http://www.layui.com/admin/
 @License：LPPL

 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    table.render({
        elem: '#table-data'
        , method: 'post'
        , url: '/code/list' //模拟接口
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'tableName', title: '表名称', align: 'center'}
            , {field: 'comments', title: '表注释', align: 'center'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 15, 20, 25, 30]
		,text: {none: '暂无数据'}
    });
    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        table.reload('table-data', {
            where: field
        });
    });
    var active = {
        //生成代码
        generation: function () {
            var data = selectMore(table, 'table-data');
            if (data == null) {
                return;
            }
            var tableNames = [];
            for (var i = 0; i < data.length; i++) {
                tableNames.push(data[i].tableName);
            }
            dialog('代码生成', '/code/generationPage', '30%', '60%', 'add-submit', function (index, field) {
                var param = JSON.stringify(tableNames);
                location.href = encodeURI("/code/generation?tables=" + param + "&serviceName=" + field.serviceName + "&menuName=" + field.menuName);
                // location.href = "/developments/codes/generation?tables=" + encodeURIComponent(param);
                layer.close(index); //关闭弹层
            });


        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    exports('codes', {})
});