/**
 * 支行表页面相关处理js
 *
 * @author auto generator
 * @date 2018/11/22 20:04:03
 */
layui.define(['table', 'form', 'selectN', 'jquery'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , selectN = layui.selectN
        , form = layui.form
        , $ = layui.jquery;
/*    var catStatus = selectN({
        //元素容器【必填】
        elem: '#status'
        , search: [false]
        , url: '/dictionary/code/' + 'status'
        , name: ['status']
        , field: {idName: 'paramValue', titleName: 'paramValueName'}
    });*/

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/bank/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: 'ID', align: 'center', minWidth: 100, hide: true}
            , {field: 'bankCode',fixed: 'left', title: '联行号', align: 'center', minWidth: 220}
            , {field: 'bankName', title: '银行名称', align: 'center', minWidth: 350}
            , {field: 'settleBankCode', title: '清算行号', align: 'center', minWidth: 220}
            , {field: 'typeCode', title: '总行编码', align: 'center', minWidth: 100}
            , {field: 'provinceName', title: '省份', align: 'center', minWidth: 100}
            , {field: 'cityName', title: '城市', align: 'center', minWidth: 100}
/*            , {
                field: 'area', title: '区', align: 'center', minWidth: 50, templet: function (d) {
                    var html = d.area;
                    if (null == d.area) {
                        html = '-'
                    }
                    return html;
                }
            }*/
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
            , {field: 'lastUserId', title: '修改人', align: 'center', minWidth: 100}
            , {
                field: 'lastModTime', title: '修改时间', align: 'center', minWidth: 200, templet: function (d) {
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
        , text: {none:'暂无数据'}
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
                        , url: "/bank/delete/" + data.id
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
                dialog('银行支行修改', '/bank/editPage/' + data.id, '50%', '80%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/bank/edit"
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
                dialogOk('银行支行详情', '/bank/detailPage/' + data.id, '50%', '100%');
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
                    , url: "/bank/batchDelete"
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
            dialog('新增银行支行', '/bank/addPage', '50%', '80%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/bank/add"
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
                , "bankCode": ""
                , "bankName": ""
                , "settleBankCode": ""
                , "typeCode": ""
                , "province": ""
                , "city": ""
                , "area": ""
                , "status": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "createUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
                , "lastUserId": ""
            });
            catCity.init();
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('bank', {})
});