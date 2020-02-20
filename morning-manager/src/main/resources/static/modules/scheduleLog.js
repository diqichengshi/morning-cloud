/**
 * 定时任务控制表页面相关处理js
 *
 * @author admin
 * @date 2020/02/10 10:51:53
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    table.render({
        elem: '#table-data'
        , method: 'post'
        , url: '/scheduleLog/list'
        , cols: [[
            {type: 'radio', fixed: 'left', align: 'center'}
            /*, {field: 'id', title: 'Id', align: 'center', minWidth: 100}*/
            , {field: 'jobName', fixed: 'left',title: '任务名称', align: 'center', minWidth: 200}
            , {field: 'jobDesc', title: '任务描述', align: 'center', minWidth: 150}
            , {field: 'runHost', title: '执行主机', align: 'center', minWidth: 160}
            , {field: 'spendTimes', title: '耗时(ms)', align: 'center', minWidth: 100}
            /*, {field: 'spendTimes', title: '耗时(ms)', align: 'center', minWidth: 100, templet: function (d) {
                    if (d.spendTimes != null) {
                        var html = d.spendTimes+"ms";
                        return html;
                    }else{
                        return '';
                    }
                }
            }*/
            , {
                field: 'result', title: '执行结果', minWidth: 100, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.result == 'S') {
                        html = '<span class="layui-badge layui-bg-green">成功</span>';
                    }
                    else if (d.result == 'E'){
                        html = '<span class="layui-badge layui-bg-red">失败</span>';
                    }

                    return html;
                }
            }
            , {field: 'traceId', title: '追踪号', align: 'center', minWidth: 240}
            , {field: 'resultMsg', title: '错误信息', align: 'center', minWidth: 200}
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {field: 'createUserId', title: '创建人', align: 'center', minWidth: 100}
            , {
                field: 'lastModTime', title: '修改时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }
                }
            }
            , {field: 'lastUserId', title: '修改人', align: 'center', minWidth: 100}
            , {title: '操作', minWidth: 100, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none:'暂无数据'}
    });

    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'del':
                layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/scheduleLog/delete/" + data.id
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
                dialog('定时任务日志修改', '/scheduleLog/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/scheduleLog/edit"
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
                dialogOk('定时任务日志详情', '/scheduleLog/detailPage/' + data.id, '60%', '60%');
                break;
        }
    });
    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        table.reload('table-data', {
            where: field,
            page:1
        });
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
                    , url: "/scheduleLog/batchDelete"
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
            dialog('新增定时任务控制表', '/scheduleLog/addPage', '30%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/scheduleLog/add"
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
                ,"jobName":""
                ,"jobDesc":""
                ,"runHost":""
                ,"spendTimes":""
                ,"result":""
                ,"traceId":""
                ,"resultMsg":""
                ,"createTimeStart":""
                ,"createTimeEnd":""
                ,"createUserId":""
                ,"lastModTimeStart":""
                ,"lastModTimeEnd":""
                ,"lastUserId":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('scheduleLog', {})
});