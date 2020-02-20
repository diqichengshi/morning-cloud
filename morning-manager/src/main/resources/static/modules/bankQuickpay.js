/**
 * 快捷支付银行表页面相关处理js
 *
 * @author admin
 * @date 2019/04/28 15:20:29
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option={
        elem: '#table-data'
        , method: 'post'
        , url: '/bankQuickpay/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'bankCode', title: '银行联行号', align: 'center', minWidth: 150,hide:true}
            , {field: 'bankName',fixed: 'left', title: '银行名称', align: 'center', minWidth: 180}
            , {field: 'typeCode', title: '银行编码', align: 'center', minWidth: 100}
            , {field: 'channel', title: '签约渠道', align: 'center', minWidth: 150}
            , {field: 'transChannel', title: '交易渠道', align: 'center', minWidth: 150}
            , {field: 'channelFee', title: '银联成本费率', align: 'center', minWidth: 130}
            , {field: 'netWorkFee', title: '网联成本费率', align: 'center', minWidth: 130}
            /*{
                field: 'channelFee', title: '金额(元)', align: 'center', width: 150, templet: function (d) {
                    if (d.channelFee != null) {
                        var reAmt =  d.channelFee*1000 + "%";
                        var html = '<font color="#00A600">'+reAmt+'</font>';
                        return html;
                    }
                }
            },*/
            , {field: 'companyFee', title: '分公司核算成本', align: 'center', minWidth: 170}
            ,{
                field: 'payEpos', title: '是否支持EPOS', minWidth: 140, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.payEpos == '0') {
                        html = '<span class="layui-badge layui-bg-red">否</span>';
                    }
                    else if (d.payEpos == '1') {
                        html = '<span class="layui-badge layui-bg-green">是</span>';
                    }

                    return html;
                }
            }
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {field: 'createUserId', title: '创建人', align: 'center', minWidth: 100}
            , {
                field: 'lastModTime', title: '最后修改时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }
                }
            }
            , {field: 'lastUserId', title: '最后修改人', align: 'center', minWidth: 100}
            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        ,text: {none: '暂无相关数据'}
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
                        , url: "/bankQuickpay/delete/" + data.id
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
                dialog('快捷支付银行表修改', '/bankQuickpay/editPage/' + data.id, '50%', '100%', 'edit-submit', function (index, field) {
                    setSaveBtnCss($);
                    $.ajax({
                        type: "post"
                        , url: "/bankQuickpay/edit"
                        , data: field
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                table.reload('table-data');
                                layer.close(index); //关闭弹层
                            }
                            else {
                                layer.msg(result.msg);
                                cancelSaveBtnCss($);

                            }
                        }
                    });
                });
                break;
            case 'detail':
                dialogOk('快捷支付银行表详情', '/bankQuickpay/detailPage/' + data.id, '50%', '100%');
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
                    , url: "/bankQuickpay/batchDelete"
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
            dialog('新增快捷支付银行表', '/bankQuickpay/addPage', '50%', '100%', 'add-submit', function (index, field) {
                setSaveBtnCss($);
                $.ajax({
                    type: "post"
                    , url: "/bankQuickpay/add"
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
                            cancelSaveBtnCss($);

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
                ,"bankCode":""
                ,"bankName":""
                ,"typeCode":""
                ,"channel":""
                ,"transChannel":""
                ,"payEpos":""
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
    exports('bankQuickpay', {})
});