/**
 * 渠道密钥页面相关处理js
 *
 * @author admin
 * @date 2019/07/01 11:13:31
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option={
        elem: '#table-data'
        , method: 'post'
        , url: '/channelKey/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '主键', hide:true, align: 'center', minWidth: 100}
            , {field: 'agentId',fixed:'left', title: '渠道编号', align: 'center', minWidth: 120}
            , {field: 'agentName', title: '渠道名称', align: 'center', minWidth: 200}
            , {field: 'key', title: '渠道密钥', align: 'center', minWidth: 180}
            , {
                field: 'status', title: '状态', minWidth: 80, align: 'center', templet: function (d) {
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
                        html='';
                    }
                    return html;
                }
            }
            , {field: 'agentOrganization', title: '渠道组织结构', align: 'center', minWidth: 230}
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
        , text: {none:"暂无数据"}
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
                        , url: "/channelKey/delete/" + data.id
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
                dialog('渠道密钥修改', '/channelKey/editPage/' + data.id, '60%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/channelKey/edit"
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
                dialogOk('渠道密钥详情', '/channelKey/detailPage/' + data.id, '60%', '80%');
                break;
            case 'email':
                layer.open({
                    type: 2
                    , title: '发送密钥'
                    , content: '/channelKey/emailPage/' + data.id
                    , area: ['35%', '40%']
                    , btn: ['<i class="layui-icon layui-icon-ok"></i>发送密钥', '<i class="layui-icon layui-icon-return">返回']
                    , yes: function (index, layero) {
                        var iframeWindow = window['layui-layer-iframe' + index]
                            , submitID = 'email-submit'
                            , submit = layero.find('iframe').contents().find('#' + submitID);

                        //监听提交
                        iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                            console.log("abcde");
                            $('.layui-layer-btn0').text("发送中...")
                            $('.layui-layer-btn0').css('backgroundColor','#abb9c3');
                            $('.layui-layer-btn0').css('borderColor','#abb9c3');
                            $(".layui-layer-btn0").attr("disabled",true).css("pointer-events","none");
                            var field = data.field; //获取提交的字段
                            $.ajax({
                                type: "post"
                                , url: "/channelKey/sendEmail"
                                , data: field
                                , dataType: "json"
                                , success: function (result) {
                                    $('.layui-layer-btn0').html('<i class="layui-icon layui-icon-ok"></i>发送密钥');
                                    $('.layui-layer-btn0').css('backgroundColor','#1E9FFF');
                                    $('.layui-layer-btn0').css('borderColor','#1E9FFF');
                                    $(".layui-layer-btn0").attr("disabled",false).css("pointer-events","all");
                                    if (result.code == 0) {
                                        layer.close(index); //关闭弹层
                                        layer.msg("发送成功");
                                    }
                                    else {
                                        layer.msg(result.msg);
                                    }
                                }
                            });
                        });
                        submit.trigger('click');
                    }
                });
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
                    , url: "/channelKey/batchDelete"
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
            dialog('新增渠道密钥', '/channelKey/addPage', '60%', '60%', 'add-submit', function (index, field) {
                setSaveBtnCss($);
                $.ajax({
                    type: "post"
                    , url: "/channelKey/add"
                    , data: field
                    , dataType: "json"
                    , success: function (result) {
                        cancelSaveBtnCss($);
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
                "agentId":""
                ,"status":""
                ,"agentName":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('channelKey', {})
});