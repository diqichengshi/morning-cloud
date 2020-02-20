/**
 * 操作日志页面相关处理js
 *
 * @author auto generator
 * @version v1.0.1, 2018/09/12 15:23:58
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/log/list'
        , cols: [[
            /*{type: 'checkbox', fixed: 'left', align: 'center'}*/
             {field: 'id', title: 'ID', align: 'center', width: 200, hide: true}
            , {field: 'orgCode', title: '部门编号', align: 'center', width: 100}
            , {field: 'ip', title: '客户端IP', align: 'center', width: 200}
            , {field: 'url', title: '请求地址', width: 250}
            , {field: 'httpMethod', title: 'HTTP方法', align: 'center', width: 100}
            , {field: 'classMethod', title: '类方法', align: 'center', minWidth: 350}
            , {field: 'args', title: '参数', width: 500}
            , {field: 'code', title: '返回码', align: 'center', width: 80}
            , {field: 'message', title: '返回信息', align: 'center', width: 100}
            , {field: 'remark', title: '备注', align: 'center', width: 200}
            , {field: 'createUserId', title: '创建人', align: 'center', width: 100}
            , {
                field: 'createTime', title: '创建时间', align: 'center', width: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {title: '操作', width: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , where: ''
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
            case 'del':
                layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/log/delete/" + data.id
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                table.reload('table-data');
                                layer.msg('已删除');
                            }
                            else {
                                layer.msg(result.msg);
                            }
                        }
                    });
                });
                break;
            case 'edit':
                dialog('操作日志修改', '/log/editPage/' + data.id, '50%', '100%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/log/edit"
                        , data: field
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                table.reload('table-data');
                                layer.close(index); //关闭弹层
                            }
                            else {
                                layer.msg(result.msg);
                            }
                        }
                    });
                });
                break;
            case 'detail':
                dialogOk('操作日志详情', '/log/detailPage/' + data.id, '50%', '100%');
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
        //批量删除
        batchdel: function () {
            var data = selectMore(table, 'table-data');
            if (null == data) {
                return;
            }
            layer.confirm('确定删除吗？', {icon: 3, title:'提示'}, function (index) {
                var ids = [];
                for (var i = 0; i < data.length; i++) {
                    ids[i] = data[i].id;
                }
                $.ajax({
                    type: "post"
                    , url: "/log/batchDelete"
                    , data: {"ids": ids}
                    , traditional: true
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            table.reload('table-data'); //数据刷新
                            layer.msg('已删除');
                        }
                        else {
                            layer.msg(result.msg);
                        }
                    }
                });
            });
        }
        //新增
        , add: function () {
            dialog('新增操作日志', '/log/addPage', '30%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/log/add"
                    , data: field
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            //数据刷新
                            table.reload('table-data');
                            //关闭弹层
                            layer.close(index);
                        }
                        else {
                            layer.msg(result.msg);
                        }
                    }
                });
            });
        }
        //重置,新增的查询条件记得在此处清空
        , reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                "id": ""
                ,"ip":""
                ,"url":""
                ,"httpMethod":""
                ,"classMethod":""
                ,"args":""
                ,"code":""
                ,"message":""
                ,"remark":""
                ,"orgCode":""
                ,"createUserId":""
                ,"createTimeStart":""
                ,"createTimeEnd":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('log', {})
});