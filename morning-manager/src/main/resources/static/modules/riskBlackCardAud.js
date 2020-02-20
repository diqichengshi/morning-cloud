/**
 * 银行卡黑名单审核表页面相关处理js
 *
 * @author admin
 * @date 2019/04/19 17:49:18
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    table.render({
        elem: '#table-data'
        , method: 'post'
        , url: '/riskBlackCardAud/list'
        , cellMinWidth: 100
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '主键', align: 'center', hide: false}
            , {field: 'cardNo', title: '卡号', align: 'center'}
            , {field: 'proposerCode', title: '申请人', align: 'center'}
            , {field: 'proposerName', title: '申请人名称', align: 'center'}
            , {
                field: 'proposerTime', title: '申请时间', align: 'center', templet: function (d) {
                    if (d.proposerTime != null) {
                        return formatDate(d.proposerTime);
                    }
                }
            }
            , {field: 'auditorCode', title: '审核人', align: 'center'}
            , {field: 'auditorName', title: '审核人名称', align: 'center'}
            , {
                field: 'auditorTime', title: '审核时间', align: 'center', templet: function (d) {
                    if (d.auditorTime != null) {
                        return formatDate(d.auditorTime);
                    }
                }
            }
            /*            , {
                            field: 'status', title: '状态', minWidth: 50, align: 'center', templet: function (d) {
                                var html = null;
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
                        }*/
            , {
                field: 'auditOperation', title: '审核操作', align: 'center', templet: function (d) {
                    var html = null;
                    if (d.auditOperation == '1') {
                        html = '<span class="layui-badge layui-bg-green">审核通过</span>';
                    }
                    else if (d.auditOperation == '0') {
                        html = '<span class="layui-badge">已提交</span>';
                    }
                    else if (d.auditOperation == '2') {
                        html = '<span class="layui-badge layui-bg-orange">已驳回</span>';
                    }
                    return html;
                }
            }
            , {field: 'auditOpinion', width: 500, title: '审核意见', align: 'center'}
            , {title: '操作', align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
		,text: {none: '暂无数据'}
    });

    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'del':
                layer.confirm('确定删除吗?', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/riskBlackCardAud/delete/" + data.id
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
                dialog('银行卡黑名单审核修改', '/riskBlackCardAud/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/riskBlackCardAud/edit"
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
                dialogOk('银行卡黑名单审核详情', '/riskBlackCardAud/detailPage/' + data.id, '30%', '60%');
                break;
        }
    });
    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        table.reload('table-data', {
            where: field
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
            layer.confirm('确定删除吗？', {icon: 3, title: '提示'}, function (index) {
                var ids = [];
                for (var i = 0; i < data.length; i++) {
                    ids[i] = data[i].id;
                }
                $.ajax({
                    type: "post"
                    , url: "/riskBlackCardAud/batchDelete"
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
            dialog('新增银行卡黑名单审核', '/riskBlackCardAud/addPage', '30%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/riskBlackCardAud/add"
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
                , "cardNo": ""
                , "proposerCode": ""
                , "proposerName": ""
                , "proposerTimeStart": ""
                , "proposerTimeEnd": ""
                , "auditorCode": ""
                , "auditorName": ""
                , "auditorTimeStart": ""
                , "auditorTimeEnd": ""
                , "auditOperation": ""
                , "auditOpinion": ""
                , "status": ""
                , "remark": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "createUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
                , "lastUserId": ""
                , "keyName": ""
                , "cardNoEncrypt": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('riskBlackCardAud', {})
});