/**
 * 地区码页面相关处理js
 *
 * @author auto generator
 * @date 2018/11/22 14:53:50
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/city/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: 'ID', align: 'center', minWidth: 100, hide: true}
            , {field: 'cityCode', title: '地区码', align: 'center', minWidth: 100}
            , {field: 'cityName', title: '地区名称', align: 'center', minWidth: 100}
            , {
                field: 'cityLevel', title: '地区等级', align: 'center', minWidth: 100, templet: function (d) {
                    var html = '';
                    if (d.cityLevel == '1') {
                        html = '<span class="layui-badge layui-bg-red">全国</span>';
                    }
                    else if (d.cityLevel == '2') {
                        html = '<span class="layui-badge layui-bg-blue">省</span>';
                    }
                    else if (d.cityLevel == '3') {
                        html = '<span class="layui-badge layui-bg-orange">市</span>';
                    }
                    else if (d.cityLevel == '4') {
                        html = '<span class="layui-badge layui-bg-green">区/县</span>';
                    }
                    return html;
                }
            }
            , {field: 'pcityCode', title: '上级地区码', align: 'center', minWidth: 100}
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
                        , url: "/city/delete/" + data.id
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
                dialog('地区码修改', '/city/editPage/' + data.id, '50%', '70%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/city/edit"
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
                dialogOk('地区码详情', '/city/detailPage/' + data.id, '50%', '100%');
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
            layer.confirm('确定删除吗？', {icon: 3, title: '提示'}, function (index) {
                var ids = [];
                for (var i = 0; i < data.length; i++) {
                    ids[i] = data[i].id;
                }
                $.ajax({
                    type: "post"
                    , url: "/city/batchDelete"
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
            dialog('新增地区码', '/city/addPage', '50%', '70%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/city/add"
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
                , "cityCode": ""
                , "cityName": ""
                , "cityLevel": ""
                , "pCityCode": ""
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
    exports('city', {})
});