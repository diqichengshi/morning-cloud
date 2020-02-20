/**
 * 终端页面相关处理js
 *
 * @author auto generator
 * @version v1.0.1, 2018/09/18 22:15:15
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/term/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: 'ID', align: 'center', width: 100, hide: true}
            , {field: 'userCode', title: '商户标识', align: 'center', width: 150, fixed: 'left'}
            , {field: 'termId', title: '终端号', align: 'center', width: 100, fixed: 'left'}
            , {
                field: 'status', title: '状态', width: 80, align: 'center', templet: function (d) {
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
            }
            , {
                field: 'downloadFlag',
                title: '非接参数',
                align: 'center',
                width: 100,
                templet: function (d) {
                    var html = null;
                    if (d.downloadFlag == '1') {
                        html = '<span class="layui-badge layui-bg-green">已下载</span>';
                    }
                    else if (d.downloadFlag == '0') {
                        html = '<span class="layui-badge">未下载</span>';
                    }
                    else {
                        html = '<span class="layui-badge">未知</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'cupsFlag', title: '银联报备', align: 'center', width: 100,
                templet: function (d) {
                    var html = null;
                    if (d.cupsFlag == '1') {
                        html = '<span class="layui-badge layui-bg-green">已报备</span>';
                    }
                    else if (d.cupsFlag == '0') {
                        html = '<span class="layui-badge ayui-bg-orange">未报备</span>';
                    }
                    else if (d.cupsFlag == '2') {
                        html = '<span class="layui-badge layui-bg-black">报备错误</span>';
                    }
                    else if (d.cupsFlag == '3') {
                        html = '<span class="layui-badge layui-bg-blue">报备中</span>';
                    }
                    else {
                        html = '<span class="layui-badge">未知</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'freeFlag', title: '免密标志', align: 'center', width: 100,
                templet: function (d) {
                    var html = null;
                    if (d.freeFlag == '1') {
                        html = '<span class="layui-badge layui-bg-green">已更新</span>';
                    }
                    else if (d.freeFlag == '0') {
                        html = '<span class="layui-badge">待更新</span>';
                    }
                    else if (d.freeFlag == '2') {
                        html = '<span class="layui-badge layui-bg-black">不更新</span>';
                    }
                    else {
                        html = '<span class="layui-badge">未知</span>';
                    }
                    return html;
                }
            }
            , {field: 'contacts', title: '联系人', align: 'center', width: 100}
            , {field: 'tel', title: '电话', align: 'center', width: 120}
            , {field: 'addr', title: '布放地址', align: 'center', width: 300}
            , {field: 'remark', title: '备注', align: 'center', width: 100}
            , {
                field: 'createTime', title: '创建时间', align: 'center', width: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {field: 'createUserId', title: '创建人', align: 'center', width: 150}
            , {
                field: 'lastModTime', title: '最后修改时间', align: 'center', width: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }
                }
            }
            , {field: 'lastUserId', title: '最后修改人', align: 'center', width: 150}
            , {title: '操作', width: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , where: ''
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
                layer.confirm('确定删除吗?', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/term/delete/" + data.id
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
                dialog('终端修改', '/term/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/term/edit"
                        , data: field
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                layer.msg(result.msg);
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
                dialogOk('终端详情', '/term/detailPage/' + data.id, '30%', '60%');
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
                    , url: "/term/deletes"
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
            dialog('新增终端', '/term/addPage', '30%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/term/add"
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
                , "userCode": ""
                , "storeId": ""
                , "termId": ""
                , "status": ""
                , "chkFlag": ""
                , "downloadFlag": ""
                , "contacts": ""
                , "tel": ""
                , "addr": ""
                , "tmk": ""
                , "macKey": ""
                , "pinKey": ""
                , "trackKey": ""
                , "remark": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "createUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
                , "lastUserId": ""
                , "cupsFlag": ""
                , "cupsBatch": ""
                , "freeFlag": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('term', {})
});