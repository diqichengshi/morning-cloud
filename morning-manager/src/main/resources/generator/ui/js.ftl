/**
 * ${table.comments!""}页面相关处理js
 *
 * @author ${author}
 * @date ${dateTime}
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    table.render({
        elem: '#table-data'
        , method: 'post'
        , url: '/${table.smallCamelName}/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            <#list columnList as item>
            <#if item.javaType == "Date">
            , {
                field: '${item.propertyName}', title: '${item.comments!""}', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.${item.propertyName} != null) {
                        return formatDate(d.${item.propertyName});
                    }
                }
            }
            <#elseif item.propertyName == "status">
            , {
                field: '${item.propertyName}', title: '状态', minWidth: 50, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.${item.propertyName} == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.${item.propertyName} == '0'){
                        html = '<span class="layui-badge">无效</span>';
                    }
                    else if (d.${item.propertyName} == 'X' || d.${item.propertyName} == 'x'){
                        html = '<span class="layui-badge">注销</span>';
                    }
                    else
                        html = d.status;
                    return html;
                }
            }
            <#else>
            , {field: '${item.propertyName}', title: '${item.comments!""}', align: 'center', minWidth: 100}
            </#if>
            </#list>
            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: '对不起，加载出现异常！'
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
                        , url: "/${table.smallCamelName}/delete/" + data.id
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
                dialog('${table.comments}修改', '/${table.smallCamelName}/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/${table.smallCamelName}/edit"
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
                dialogOk('${table.comments}详情', '/${table.smallCamelName}/detailPage/' + data.id, '30%', '60%');
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
                    , url: "/${table.smallCamelName}/batchDelete"
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
            dialog('新增${table.comments}', '/${table.smallCamelName}/addPage', '30%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/${table.smallCamelName}/add"
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
                "${pkColumn.propertyName}": ""
                <#list columnList as item>
                    <#if item.propertyName != pkColumn.propertyName>
                        <#if item.javaType == "String">
                ,"${item.propertyName}":""
                        <#elseif item.javaType == "Date">
                ,"${item.propertyName}Start":""
                ,"${item.propertyName}End":""
                        </#if>
                    </#if>
                </#list>
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('${table.smallCamelName}', {})
});