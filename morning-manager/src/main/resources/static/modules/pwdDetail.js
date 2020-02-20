/**
 * 密码修改历史表页面相关处理js
 *
 * @author auto generator
 * @date 2018/12/05 22:43:44
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/pwdDetail/list'
        , cols: [[
            /*{type: 'checkbox', fixed: 'left', align: 'center'}*/
             {field: 'id', title: '主键', align: 'center', minWidth: 100, hide: true}
            , {field: 'userId', title: '用户表ID', align: 'center', minWidth: 100, hide: true}
            , {field: 'userNo', title: '用户编号', align: 'center', minWidth: 150}

            , {
                field: 'userType', title: '用户类型', minWidth: 180, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.userType == '1') {
                        html = '<span class="layui-badge layui-bg-green">机构用户</span>';
                    }
                    else if (d.userType == '2') {
                        html = '<span class="layui-badge">商户用户</span>';
                    }
                    return html;
                }
            }
            //, {field: 'pwdOld', title: '修改前原密码', align: 'center', minWidth: 200}
            , {
                field: 'pwdModifyType', title: '修改密码类型', minWidth: 180, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.pwdModifyType == '1') {
                        html = '<span class="layui-badge layui-bg-green">修改密码</span>';
                    }
                    else if (d.pwdModifyType == '2') {
                        html = '<span class="layui-badge">重置密码</span>';
                    }
                    else if (d.pwdModifyType == '3') {
                        html = '<span class="layui-badge">设置手势密码</span>';
                    }
                    return html;
                }
            }
            , {field: 'createUserId', title: '创建人', align: 'center', minWidth: 230}
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
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
                        , url: "/pwdDetail/delete/" + data.id
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
                dialog('密码修改历史表修改', '/pwdDetail/editPage/' + data.id, '50%', '70%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/pwdDetail/edit"
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
                dialogOk('密码变更记录详情', '/pwdDetail/detailPage/' + data.id, '50%', '70%');
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
                    , url: "/pwdDetail/batchDelete"
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
            dialog('新增密码修改历史表', '/pwdDetail/addPage', '50%', '100%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/pwdDetail/add"
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
                ,"userId":""
                ,"userType":""
                ,"pwdOld":""
                ,"pwdModifyType":""
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
    exports('pwdDetail', {})
});