/**
 * 渠道权限配置页面相关处理js
 *
 * @author admin
 * @date 2019/04/23 09:49:23
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option={
        elem: '#table-data'
        , method: 'post'
        , url: '/channelAuth/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '主键', align: 'center', minWidth: 100,hide:true}
            , {field: 'name', fixed:'left', title: '接口名称', align: 'center', minWidth: 150}
            , {field: 'url', title: '接口路径', align: 'center', minWidth: 300}
            , {field: 'tokenType', title: '令牌类型', align: 'center', minWidth: 100}
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
                    }else{
                        html = '<span></span>';
                    }
                    return html;
                }
            }
            , {field: 'agentId', title: '渠道编号', align: 'center', minWidth: 100}
            , {field: 'agentName', title: '渠道名称', align: 'center', minWidth: 200}
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
                layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/channelAuth/delete/" + data.id
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
                dialog('渠道权限配置修改', '/channelAuth/editPage/' + data.id, '50%', '80%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/channelAuth/edit"
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
                dialogOk('渠道权限配置详情', '/channelAuth/detailPage/' + data.id, '60%', '80%');
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
                    , url: "/channelAuth/batchDelete"
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
            dialog('新增渠道权限配置', '/channelAuth/addPage', '50%', '70%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/channelAuth/add"
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
                ,"name":""
                ,"url":""
                ,"status":""
                ,"agentId":""
                ,"agentName":""
                ,"createTimeStart":""
                ,"createTimeEnd":""
                ,"createUserId":""
                ,"lastModTimeStart":""
                ,"lastModTimeEnd":""
                ,"lastUserId":""
                ,"tokenType":""
            })
        }
        // 批量新增方法开始,加上parent.layer.open(),可以取到弹框对象的值
        , batchAdd: function () {
            layer.open({
                type: 2,
                title: ['批量新增渠道权限配置','background-color:#ff8c00;'],
                content: '/channelAuth/batchAddPage',
                area: ['400px', '480px'],
                yes: function (index, layero) {
                    layer.close(index);
                }
            });
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('channelAuth', {})
});