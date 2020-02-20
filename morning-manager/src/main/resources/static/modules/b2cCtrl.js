/**
 * B2C通道参数页面相关处理js
 *
 * @author admin
 * @date 2019/04/28 15:43:24
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option={
        elem: '#table-data'
        , method: 'post'
        , url: '/b2cCtrl/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '主键', align: 'center', minWidth: 100,hide:true}
            , {field: 'key', title: '参数主键', align: 'center', minWidth: 150}
            , {field: 'keyName', title: '参数名称', align: 'center', minWidth: 200}
            , {field: 'keyValue', title: '参数值', align: 'center', minWidth: 150}
            , {field: 'remark', title: '备注', align: 'center', minWidth: 200}
            , {field: 'createUserId', title: '创建人', align: 'center', minWidth: 130}
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 180, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }else{
                        return '';
                    }
                }
            }
            , {field: 'lastUserId', title: '最近修改人', align: 'center', minWidth: 130}
            , {
                field: 'lastModTime', title: '最近修改时间', align: 'center', minWidth: 180, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }else{
                        return '';
                    }
                }
            }
            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
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
            case 'del':
                layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/b2cCtrl/delete/" + data.id
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
                dialog('B2C通道参数修改', '/b2cCtrl/editPage/' + data.id, '35%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/b2cCtrl/edit"
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
                dialogOk('B2C通道参数详情', '/b2cCtrl/detailPage/' + data.id, '40%', '80%');
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
                    , url: "/b2cCtrl/batchDelete"
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
            dialog('新增B2C通道参数', '/b2cCtrl/addPage', '35%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/b2cCtrl/add"
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
                "key":""
                ,"keyName":""
                ,"keyValue":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('b2cCtrl', {})
});