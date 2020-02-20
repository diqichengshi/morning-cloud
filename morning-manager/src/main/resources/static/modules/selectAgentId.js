/**
 * 相关处理js
 *
 * @author auto generator
 * @date 2018/11/15 15:52:59
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;
    var option = {
        elem: '#table-data-organize'
        , method: 'post'
        , url: '/agent/list'
        , cols: [[
            , {field: 'id', title: 'ID', align: 'center', minWidth: 10, hide: true}
            , {field: 'agentId', title: '机构编号', align: 'center', width: 200}
            , {field: 'agentName', title: '机构名称', align: 'center', width: 400}
            //, {field: 'parentCode', title: '上级机构编号', align: 'center', width: 200}
            , {title: '操作', width: 241, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , where: ''
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
		,text: {none: '暂无数据'}
    };
    table.render(option);
    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-organize-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'selectCode':
                var index = parent.layer.getFrameIndex(window.name);
                parent.$('#seleteOrgCode').val(data.agentId);
                parent.$('#seleteOrgName').val(data.agentName);
                parent.layer.close(index);
                break;
        }
    });


    exports('selectOrgCode', {})


    //查询按钮
    form.on('submit(table-organize-search)', function (data) {
        var field = data.field;
        option.where=field;
        table.render(option);
    });
    var active = {
        //重置,新增的查询条件记得在此处清空
        reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                 "agentId":""
                , "agentName":""
            })
        }

    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

});



