/**
 * 公告页面相关处理js
 *
 * @author auto generator
 * @date 2019/07/22 10:04:03
 */
layui.define(['table', 'form', 'jquery'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form
        , $ = layui.jquery;

    var option = {
        elem: '#table-data',
        method: 'post',
        url: '/content/list',
        cols: [[
            //{field: 'id', title: 'ID', align: 'center', minWidth: 100, hide: true},
            {field: 'title', title: '标题', align: 'center', minWidth: 250},
            {field: 'subjectName', title: '所属分类', align: 'center', minWidth: 350},
            {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            },
            {title: '操作', width: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
		,text: {none: '暂无数据'}
    };
    table.render(option);

    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'detail':
                dialogOk('公告详情', '/content/detailPage/' + data.id, '50%', '100%');
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
            form.val("form-search", {
                "id": "",
                "title": ""
            });
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('content', {})
});