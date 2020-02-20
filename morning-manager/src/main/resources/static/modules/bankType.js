/**
 * 总行表页面相关处理js
 *
 * @author auto generator
 * @date 2018/11/22 20:04:03
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/bankType/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: 'ID', align: 'center', minWidth: 100, hide: true}
            , {field: 'typeCode', title: '总行编码', align: 'center', minWidth: 200}
            , {field: 'typeName', title: '总行名称', align: 'center', minWidth: 150}
            , {field: 'hqBankCode', title: '总行号', align: 'center', minWidth: 250}
            /*, {
                field: 'nature', title: '银行性质', align: 'center', minWidth: 100, templet: function (d) {
                    var html = '';
                    if (d.nature == '1') {
                        html = '<span class="layui-badge layui-bg-red">中央银行</span>';
                    }
                    else if (d.nature == '2') {
                        html = '<span class="layui-badge layui-bg-blue">国有独资商业银行</span>';
                    }
                    else if (d.nature == '3') {
                        html = '<span class="layui-badge layui-bg-orange">政策性银行</span>';
                    }
                    else if (d.nature == '4') {
                        html = '<span class="layui-badge layui-bg-green">其他商业银行</span>';
                    }
                    else if (d.nature == '5') {
                        html = '<span class="layui-badge layui-bg-black">非银行金融机构</span>';
                    }
                    else if (d.nature == '6') {
                        html = '<span class="layui-badge layui-bg-cyan">外资在华银行或代表处</span>';
                    }
                    else if (d.nature == '7  ') {
                        html = '<span class="layui-badge layui-bg-gray">特区参与者</span>';
                    }
                    else{
                        html = '-';
                    }
                    return html;
                }
            }*/
            //, {field: 'typeEnCode', title: '英文编码', align: 'center', minWidth: 100}
            , {
                field: 'status', title: '状态', minWidth: 100, align: 'center', templet: function (d) {
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
            , {field: 'createUserId', title: '创建人', align: 'center', minWidth: 100}
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {field: 'lastUserId', title: '最后修改人', align: 'center', minWidth: 100}
            , {
                field: 'lastModTime', title: '最后修改时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
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
                layer.confirm('确定删除吗?', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/bankType/delete/" + data.id
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
                dialog('总行表修改', '/bankType/editPage/' + data.id, '50%', '90%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/bankType/edit"
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
                dialogOk('总行表详情', '/bankType/detailPage/' + data.id, '50%', '100%');
                break;
        }
    });
    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        option.where=field;
        table.render(option);
        /*        table.reload('table-data', {
                    where: field
                });*/
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
                    , url: "/bankType/batchDelete"
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
            dialog('新增总行表', '/bankType/addPage', '50%', '80%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/bankType/add"
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
                , "typeCode": ""
                , "typeName": ""
                , "hqBankCode": ""
                , "nature": ""
                , "typeEnCode": ""
                , "status": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "createUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
                , "lastUserId": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('bankType', {})
});