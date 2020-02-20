/**
 * 代理商微信子商户配置表页面相关处理js
 *
 * @author admin
 * @date 2019/12/25 11:29:31
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    table.render({
        elem: '#table-data'
        , method: 'post'
        , url: '/wechatAgentConfig/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'agentId', title: '服务商编号', align: 'center', minWidth: 100}
            , {field: 'wechatAppid', title: 'appid', align: 'center', minWidth: 100}
            , {field: 'wechatPath', title: '支付授权目录', align: 'center', minWidth: 100}
            , {field: 'subscribeAppid', title: '推荐关注公众号APPID', align: 'center', minWidth: 100}
            , {
                field: 'status', title: '状态', minWidth: 50, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.status == '0'){
                        html = '<span class="layui-badge">无效</span>';
                    }
                    else if (d.status == 'X' || d.status == 'x'){
                        html = '<span class="layui-badge">注销</span>';
                    }
                    else
                        html = d.status;
                    return html;
                }
            }
            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none: '暂无数据'}
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
                        , url: "/wechatAgentConfig/delete/" + data.id
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
                dialog('代理商微信子商户配置表修改', '/wechatAgentConfig/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/wechatAgentConfig/edit"
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
                dialogOk('代理商微信子商户配置表详情', '/wechatAgentConfig/detailPage/' + data.id, '30%', '60%');
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
                    , url: "/wechatAgentConfig/batchDelete"
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
            dialog('新增代理商微信子商户配置表', '/wechatAgentConfig/addPage', '30%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/wechatAgentConfig/add"
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
                ,"wechatAppid":""
                ,"wechatPath":""
                ,"subscribeAppid":""
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
    exports('wechatAgentConfig', {})
});