/**
 * 离线文件下载表页面相关处理js
 *
 * @author admin
 * @date 2019/04/25 14:18:34
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option={
        elem: '#table-data'
        , method: 'post'
        , url: '/userDownloadFile/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '主键', align: 'center', width: 1, hide: true}
            , {field: 'fileName', title: '文件名称(包含文件全路径)', align: 'center', minWidth: 400}
            , {
                field: 'type', title: '业务类型', align: 'center', minWidth: 200, templet: function (d) {
                    var html = '';
                    var textName=typeMap.get(d.type);
                    console.log(textName)
                    if(undefined ==textName || 'undefined' == textName){
                        textName=''
                    }
                    html = '<span >'+textName+'</span>';
                    return html;
                }
            }
            , {
                field: 'status', title: '文件状态', minWidth: 150, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '0') {
                        html = '<span class="layui-badge layui-bg-black">未处理</span>';
                    }
                    else if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-orange">文件生成中</span>';
                    }
                    else if (d.status == '2') {
                        html = '<span class="layui-badge layui-bg-green">文件已生成</span>';
                    } else {
                        html = '<span></span>'
                    }
                    return html;
                }
            }
            , {field: 'downloadCnt', title: '文件下载次数', align: 'center', minWidth: 130}
            , {field: 'remark', title: '备注', align: 'center', minWidth: 200}
            , {field: 'applyUser', title: '创建人', align: 'center', minWidth: 150}
            , {
                field: 'applyTime', title: '创建时间', align: 'center', minWidth: 180, templet: function (d) {
                    if (d.applyTime != null) {
                        return formatDate(d.applyTime);
                    } else {
                        return '';
                    }
                }
            }
            , {title: '操作', minWidth: operationWith, align: 'center', fixed: 'right', toolbar: '#table-operation'}
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
                layer.confirm('确定删除吗?', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/userDownloadFile/delete/" + data.id
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
                dialog('离线文件下载表修改', '/userDownloadFile/editPage/' + data.id, '60%', '90%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/fileDownload/edit"
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
                dialogOk('离线文件下载表详情', '/userDownloadFile/detailPage/' + data.id, '60%', '90%');
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
                    , url: "/fileDownload/batchDelete"
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
        //下载文件
       , fileDownload: function () {
            var data = selectOne(table, 'table-data');
            if (null == data) {
                return;
            }
            var filePath = data.fileName;
            var id  = data.id;
            if(data.status!='2'){
                layer.msg("文件生成中，请稍后下载！");
                return;
            }
                var fileName =filePath.substring(filePath.lastIndexOf("/")+1).trim();

                window.open('/fileDownload/download?filePath='+filePath+'&fileName='+fileName+'&id='+id,'_blank');

        }
        //新增
        , add: function () {
            dialog('新增离线文件下载表', '/fileDownload/addPage', '60%', '90%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/fileDownload/add"
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
                , "applyUser": ""
                , "applyTimeStart": ""
                , "applyTimeEnd": ""
                , "sql": ""
                , "titile": ""
                , "status": ""
                , "fileName": ""
                , "type": ""
                , "remark": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "createUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
                , "lastUserId": ""
                , "userType": ""
                , "agentOrganization": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('fileDownload', {})
});