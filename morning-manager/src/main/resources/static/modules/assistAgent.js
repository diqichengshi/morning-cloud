/**
 * 助代通终端订单表页面相关处理js
 *
 * @author admin
 * @date 2019/07/17 13:41:33
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/assistAgent/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '', align: 'center', minWidth: 100,hide:true}
            , {field: 'agentId',fixed: 'left', title: '机构编号', align: 'center', minWidth: 150}
            , {field: 'agentName', title: '机构名称', align: 'center', minWidth: 220}
            , {field: 'orderNo', title: '订单号', align: 'center', minWidth: 200}
            , {field: 'consigneeName', title: '收货人姓名', align: 'center', minWidth: 150}
            , {field: 'consigneeTel', title: '收货人联系方式', align: 'center', minWidth: 180}
            , {field: 'consigneeAddr', title: '收货人地址', align: 'center', minWidth: 200}
            , {field: 'orderTotalAmt', title: '订单总金额(元)', align: 'center', minWidth: 180,templet:function (d) {
                if(d.orderTotalAmt!=null){
                    var reAmt = "￥" + formatMoney(d.orderTotalAmt, 2);
                    var html = '<font color="#00A600">'+reAmt+'</font>';
                    return html;
                }else{
                    return "";
                }

                }}
            , {field: 'deliveryFlag', title: '是否发货', align: 'center', minWidth: 100,templet:function (d) {
               var html ="";
                if(d.deliveryFlag=='00'){
                   html = '<span class="layui-badge layui-bg-red">否</span>';

               }else if(d.deliveryFlag=='01'){
                   html = '<span class="layui-badge layui-bg-green">是</span>';
               }
               return  html;
                }
                }
            , {
                field: 'deliveryTime', title: '发货时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.deliveryTime != null) {
                        return formatDate(d.deliveryTime);
                    }else{
                        return "";
                    }
                }
            }
            , {field: 'repaymentStatus', title: '还款状态', align: 'center', minWidth: 100, templet:function (d) {
               var html ="";
                if(d.repaymentStatus=='00'){
                    html = '<span class="layui-badge layui-bg-red">未还款</span>';

                }else if(d.repaymentStatus=='01'){
                    html = '<span class="layui-badge layui-bg-green">已还款</span>';

                }else if(d.repaymentStatus=='02'){
                    html = '<span class="layui-badge layui-bg-blue">确认还款</span>';

                }
                return html;
            }
            }

            , {
                field: 'orderTime', title: '订单时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.orderTime != null) {
                        return formatDate(d.orderTime);
                    }else {
                        return "";
                    }
                }
            }

            , {
                field: 'lastModTime', title: '修改时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }else{
                        return "";
                    }
                }
            }
          /*  , {field: 'orderCount', title: '订单总数量', align: 'center', minWidth: 100}
            , {field: 'orderUnitPrice', title: '订单商品单价', align: 'center', minWidth: 100}
            , {field: 'termModel', title: '终端型号', align: 'center', minWidth: 100}
            , {
                field: 'createTime', title: '订单创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {field: 'createUserId', title: '创建人ID', align: 'center', minWidth: 100}

            , {field: 'lastUserId', title: '修改人ID', align: 'center', minWidth: 100}
            , {field: 'orderRemark', title: '订单备注', align: 'center', minWidth: 100}
            , {field: 'orderLogisticsNum', title: '订单物流单号', align: 'center', minWidth: 100}

            , {field: 'orderLogisticsInfo', title: '订单物流信息', align: 'center', minWidth: 100}
            , {field: 'terminalStorage', title: '终端入库状态 未入库00 已入库 01', align: 'center', minWidth: 100}*/
            , {title: '操作', minWidth: 150, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none: '暂无数据'}
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
                        , url: "/assistAgent/delete/" + data.id
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
                dialog('助代通终端订单表修改', '/assistAgent/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/assistAgent/edit"
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
                dialogOk('助代通成功申请终端详情', '/assistAgent/detailPage/' + data.id, '60%', '100%');
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
                    , url: "/assistAgent/batchDelete"
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
            dialog('新增助代通终端订单表', '/assistAgent/addPage', '30%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/assistAgent/add"
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
                ,"deliveryFlag":""
                ,"deliveryTimeStart":""
                ,"deliveryTimeEnd":""
                ,"repaymentStatus":""
                ,"orderLogisticsInfo":""
                ,"terminalStorage":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('assistAgent', {})
});