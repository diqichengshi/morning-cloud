/**
 * 基础数据表-mcc码页面相关处理js
 *
 * @author auto generator
 * @date 2018/11/21 18:24:22
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/mcc/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: 'uuid', align: 'center', width: 100, hide: true}
            , {field: 'mcc', title: 'MCC码', align: 'center', width: 100}
            , {field: 'mccName', title: '名称', align: 'center', minWidth: 300}
            //, {field: 'pmcc', title: '上级MCC码', align: 'center', width: 120}
            , {
                field: 'mccLevel', title: '级别', align: 'center', width: 100, templet: function (d) {
                    var html = '';
                    if (d.mccLevel == '1') {
                        html = '<span class="layui-badge">大类</span>';
                    }
                    else if (d.mccLevel == '2') {
                        html = '<span class="layui-badge layui-bg-green">小类</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'status', title: '状态', minWidth: 50, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.status == '0') {
                        html = '<span class="layui-badge">无效</span>';
                    }
                    else if (d.status == 'X' || d.status == 'x') {
                        html = '<span class="layui-badge">注销</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'mccType', title: 'mcc类别', align: 'center', width: 100, templet: function (d) {
                    var html = '';
                    if (d.mccType == '0') {
                        html = '<span class="layui-badge layui-bg-green">标准类</span>';
                    }
                    else if (d.mccType == '1') {
                        html = '<span class="layui-badge">优惠类</span>';
                    }
                    else if (d.mccType == '2') {
                        html = '<span class="layui-badge">减免类</span>';
                    }
                    else if (d.mccType == '3') {
                        html = '<span class="layui-badge">特殊计费类</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'consumeType', title: '日常消费', align: 'center', width: 100, templet: function (d) {
                    var html = '';
                    if (d.consumeType == '0') {
                        html = '<span class="layui-badge">否</span>';
                    }
                    else if (d.consumeType == '1') {
                        html = '<span class="layui-badge layui-bg-green">是</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'freeType', title: '双免', align: 'center', width: 100, templet: function (d) {
                    var html = '';
                    if (d.freeType == '0') {
                        html = '<span class="layui-badge">禁止开通</span>';
                    }
                    else if (d.freeType == '1') {
                        html = '<span class="layui-badge layui-bg-green">允许开通</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'general', title: '常用查询', align: 'center', width: 100, templet: function (d) {
                    var html = '';
                    if (d.general == '0') {
                        html = '<span class="layui-badge">否</span>';
                    }
                    else if (d.general == '1') {
                        html = '<span class="layui-badge layui-bg-green">是</span>';
                    }
                    return html;
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
                layer.confirm('确定删除吗?', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/mcc/delete/" + data.id
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
                dialog('Mcc修改', '/mcc/editPage/' + data.id, '50%', '100%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/mcc/edit"
                        , data: field
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                layer.msg(result.msg);
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
                dialogOk('Mcc详情', '/mcc/detailPage/' + data.id, '50%', '100%');
                break;
        }
    });
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
            layer.confirm('确定删除吗？', {icon: 3, title: '提示'}, function (index) {
                var ids = [];
                for (var i = 0; i < data.length; i++) {
                    ids[i] = data[i].id;
                }
                $.ajax({
                    type: "post"
                    , url: "/mcc/batchDelete"
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
            dialog('新增Mcc', '/mcc/addPage', '50%', '100%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/mcc/add"
                    , data: field
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            layer.msg(result.msg);
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
                , "mcc": ""
                , "mccName": ""
                , "pMcc": ""
                , "mccLevel": ""
                , "status": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "createUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
                , "lastUserId": ""
                , "mccType": ""
                , "consumeType": ""
                , "freeType": ""
                , "general": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('mcc', {})
});