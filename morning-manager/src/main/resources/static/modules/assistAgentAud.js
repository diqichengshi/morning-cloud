/**
 * 助代通终端订单审核表页面相关处理js
 *
 * @author admin
 * @date 2019/07/16 13:58:25
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/assistAgentAud/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '', align: 'center', minWidth: 100,hide:true}
            , {field: 'orderNo',fixed: 'left', title: '订单号', align: 'center', minWidth: 200}
            , {field: 'agentId', title: '机构编号', align: 'center', minWidth: 150}
            , {field: 'agentName', title: '机构名称', align: 'center', minWidth: 220}
            , {field: 'consigneeName', title: '收货人姓名', align: 'center', minWidth: 150}
            , {field: 'consigneeAddr', title: '收货人地址', align: 'center', minWidth: 200}
            , {field: 'orderTotalAmt', title: '订单总金额(元)', align: 'center', minWidth: 180,templet:function(d){
                 if(d.orderTotalAmt!=null){
                     var reAmt = "￥" +formatMoney(d.orderTotalAmt, 2);
                     var html = '<font color="#00A600">'+reAmt+'</font>';
                }
                return html;
                }
                }
            , {field: 'auditOperation', title: '审核状态', align: 'center', minWidth: 100,templet:function(d){
                    var html = '';
                 if(d.auditOperation == '0'){
                     html = '<span class="layui-badge layui-bg-blue">已提交</span>';
                 }else if(d.auditOperation == '1'){
                     html = '<span class="layui-badge layui-bg-green">审核通过</span>';
                 }else if(d.auditOperation == '2'){
                     html = '<span class="layui-badge layui-bg-red">已驳回</span>';
                 }
                 return html;
                }
                }
            , {
                field: 'orderTime', title: '订单时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.orderTime != null) {
                        return formatDate(d.orderTime);
                    }
                   else  if (d.orderTime == null) {
                        return "";
                    }
                }
            }
            , {
                field: 'lastModTime', title: '修改时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }
                    else if (d.lastModTime == null) {
                        return "";
                    }
                }
            }
            , {title: '操作', minWidth: 150, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
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
                        , url: "/assistAgentAud/delete/" + data.id
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
                dialog('助代通终端订单审核表修改', '/assistAgentAud/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/assistAgentAud/edit"
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
                dialogOk('终端审核详情', '/assistAgentAud/detailPage/' + data.id, '60%', '100%');
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
                    , url: "/assistAgentAud/batchDelete"
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
            dialog('申请终端', '/assistAgentAud/addPage', '50%', '100%', 'add-submit', function (index, field) {
                setSaveBtnCss($);
                $.ajax({
                    type: "post"
                    , url: "/assistAgentAud/add"
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
                ,"agentId":""
                ,"agentName":""
                ,"orderNo":""
                ,"consigneeName":""
                ,"consigneeTel":""
                ,"consigneeAddr":""
                ,"orderTimeStart":""
                ,"orderTimeEnd":""
                ,"termModel":""
                ,"createTimeStart":""
                ,"createTimeEnd":""
                ,"createUserId":""
                ,"lastModTimeStart":""
                ,"lastModTimeEnd":""
                ,"lastUserId":""
                ,"orderRemark":""
                ,"orderLogisticsNum":""
                ,"proposerName":""
                ,"proposerTimeStart":""
                ,"proposerTimeEnd":""
                ,"auditorCode":""
                ,"auditorName":""
                ,"auditorTimeStart":""
                ,"auditorTimeEnd":""
                ,"auditOperation":""
                ,"auditOpinion":""
                ,"orderLogisticsInfo":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('assistAgentAud', {})
});