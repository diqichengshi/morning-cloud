/**
 * 发卡行b2c限额页面相关处理js
 *
 * @author admin
 * @date 2019/04/28 15:41:21
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option={
        elem: '#table-data'
        , method: 'post'
        , url: '/b2cBankRule/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '主键', align: 'center', minWidth: 100, hide: true}
            , {field: 'issBankId',fixed: 'left', title: '发卡行标识', align: 'center', minWidth: 100}
            , {field: 'issBankName', title: '发卡行名称', align: 'center', minWidth: 200}
            , {
                field: 'transLimit', title: '单笔限额(元)', align: 'center', minWidth: 150, templet: function (d) {
                    var html;
                    if (d.transLimit != null) {
                        var reAmt =  "￥" + formatMoney(d.transLimit, 2);
                        html = '<font color="#00A600">'+reAmt+'</font>';
                    }else{
                        html= '';
                    }
                    return html;
                }
            }
            , {
                field: 'dayLimit', title: '单日限额(元)', align: 'center', minWidth: 150, templet: function (d) {
                    var html;
                    if (d.dayLimit != null) {
                        var reAmt =  "￥" + formatMoney(d.dayLimit, 2);
                        html = '<font color="#00A600">'+reAmt+'</font>';
                    }else{
                        html= '';
                    }
                    return html;
                }
            }
            , {
                field: 'usedAmt', title: '已用金额(元)', align: 'center', minWidth: 150, templet: function (d) {
                    var html;
                    if (d.usedAmt != null) {
                        var reAmt =  "￥" + formatMoney(d.usedAmt, 2);
                        html = '<font color="#00A600">'+reAmt+'</font>';
                    }else{
                        html= '';
                    }
                    return html;
                }
            }
            , {
                field: 'status', title: '状态', minWidth: 100, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.status == '0') {
                        html = '<span class="layui-badge">无效</span>';
                    }
                    else if (d.status == 'X' || d.status == 'x') {
                        html = '<span class="layui-badge">注销</span>';
                    } else {
                        html = '<span></span>';
                    }
                    return html;
                }
            }


            , {field: 'remark', title: '备注', align: 'center', minWidth: 100}
            , {field: 'createUserId', title: '创建人', align: 'center', minWidth: 160}
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 180, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }else{
                        return '';
                    }
                }
            }
            , {field: 'lastUserId', title: '修改人', align: 'center', minWidth: 160}
            , {
                field: 'lastModTime', title: '修改时间', align: 'center', minWidth: 180, templet: function (d) {
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
                layer.confirm('确定删除吗?', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/b2cBankRule/delete/" + data.id
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
                dialog('B2C银行限额修改', '/b2cBankRule/editPage/' + data.id, '40%', '75%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/b2cBankRule/edit"
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
                dialogOk('B2C银行限额详情', '/b2cBankRule/detailPage/' + data.id, '40%', '75%');
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
                    , url: "/b2cBankRule/batchDelete"
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
            dialog('新增B2C银行限额', '/b2cBankRule/addPage', '45%', '70%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/b2cBankRule/add"
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
                , "issBankId": ""
                , "issBankName": ""
                , "dayLimit": ""
                , "remark": ""
                , "status": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "createUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
                , "lastUserId": ""
                , "usedAmt": ""
                , "transLimit": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('b2cBankRule', {})
});