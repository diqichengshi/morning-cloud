/**
 * 助代通终端商品表页面相关处理js
 *
 * @author admin
 * @date 2019/07/16 16:04:30
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/assistItems/getByOrderNo'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center',hide:true}
            , {field: 'id', title: '', align: 'center', minWidth: 100,hide:true}
            , {field: 'orderNo', title: '订单号', align: 'center', minWidth: 200}
            , {field: 'termModel', title: '终端型号', align: 'center', minWidth: 150}
            , {field: 'orderUnitPrice', title: '单价', align: 'center', minWidth: 100 ,templet:function (d) {
                    if(d.orderUnitPrice!=null){
                        var reAmt =   formatMoney(d.orderUnitPrice, 2);
                        var html = '<font color="#00A600">'+reAmt+'</font>';
                    }
                    return html;
                }
            }
            , {field: 'orderCount', title: '数量', align: 'center', minWidth: 100}
            , {
                field: 'status', title: '状态', minWidth: 80, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.status == '0'){
                        html = '<span class="layui-badge layui-bg-red">无效</span>';
                    }
                    else if (d.status == 'X' || d.status == 'x'){
                        html = '<span class="layui-badge layui-bg-black">注销</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 190, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }else{
                        return  "";
                    }
                }
            }
            , {
                field: 'lastModTime', title: '修改时间', align: 'center', minWidth: 190, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }else{
                        return  "";
                    }
                }
            }
        /*    , {field: 'createUserId', title: '创建人ID', align: 'center', minWidth: 100}

            , {field: 'lastUserId', title: '修改人ID', align: 'center', minWidth: 100}
            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}*/
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , where:{orderNo:orderNo}
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
                        , url: "/assistItems/delete/" + data.id
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
                dialog('助代通终端商品表修改', '/assistItems/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/assistItems/edit"
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
                dialogOk('助代通终端商品表详情', '/assistItems/detailPage/' + data.id, '30%', '60%');
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
            layer.confirm('确定删除吗？', {icon: 3, title:'提示'}, function (index) {
                var ids = [];
                for (var i = 0; i < data.length; i++) {
                    ids[i] = data[i].id;
                }
                $.ajax({
                    type: "post"
                    , url: "/assistItems/batchDelete"
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
            dialog('新增助代通终端商品表', '/assistItems/addPage', '30%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/assistItems/add"
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
                ,"orderNo":""
                ,"termModel":""
                ,"status":""
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
    exports('assistItems', {})
});