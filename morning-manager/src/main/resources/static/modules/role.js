/**
 * 角色页面相关处理js
 *
 * @author auto generator
 * @date 2018/11/16 15:22:21
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/role/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id',title: 'ID', align: 'center',minWidth: 100, hide: true}
            , {field: 'name',fixed: 'left', title: '角色名称', align: 'center', width: 200}
            , {field: 'orgCode', title: '部门编号', align: 'center', width: 200}
            , {
                field: 'status', title: '状态', width: 100, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.status == '0') {
                        html = '<span class="layui-badge">无效</span>';
                    }
                    return html;
                }
            }
            , {field: 'remark', title: '备注', align: 'center',minWidth: 200}
            , {field: 'createUserId', title: '创建人', align: 'center', width: 200}
            , {
                field: 'createTime', title: '创建时间', align: 'center', width: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {field: 'lastUserId', title: '修改人', align: 'center', width: 200}
            , {
                field: 'lastModTime', title: '修改时间', align: 'center', width: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }
                }
            }
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
                        , url: "/role/delete/" + data.id
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
            	var editUserName = $('#loginUserName').val(); 
            	if(editUserName != data.createUserId){
                	layer.msg('请选择本人创建的角色！');
                    return;
                } else {
                	dialog('角色修改', '/role/editPage/' + data.id, '50%', '80%', 'edit-submit', function (index, field) {
                        $.ajax({
                            type: "post"
                            , url: "/role/edit"
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
                }
                break;
            case 'detail':
                dialogOk('角色详情', '/role/detailPage/' + data.id, '50%', '100%');
                break;
            /*case 'setmenu':
                dialog('分配菜单', '/role/menuPage/' + data.id, '50%', '100%', 'setmenu-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/role/menu/edit"
                        , data: field
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                layer.close(index); //关闭弹层
                            }
                            else {
                                layer.msg(result.msg);
                            }
                        }
                    });
                });
                break;*/
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
        //分配菜单
       setmenu: function () {
            var data = selectOne(table, 'table-data');
            if (null == data) {
                return;
            }
            
            var roleUserName = $('#loginUserName').val();
        	var roleIsOperate = $('#loginIsOperate').val();
        	if(roleUserName == data.username){
            	layer.msg('不允许修改本人的用户！');
                return;
            } else if('1' != roleIsOperate) {
            	layer.msg('不允许非管理员用户操作！');
                return;
            } else {
            	dialog('分配菜单', '/role/menuPage/' + data.id, '50%', '100%', 'setmenu-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/role/menu/edit"
                        , data: field
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                layer.close(index); //关闭弹层
                            }
                            else {
                                layer.msg(result.msg);
                            }
                        }
                    });
                });
            }  
        }
        //批量删除
        , batchdel: function () {
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
                    , url: "/role/batchDelete"
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
        	var addIsOperate = $('#loginIsOperate').val();
        	if('1' != addIsOperate){
        		layer.msg('不允许非管理员用户操作！');
                return;
            }
            dialog('新增角色', '/role/addPage', '50%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/role/add"
                    , data: field
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            layer.msg(result.msg);
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
                , "name": ""
                , "status": ""
                , "orgCode":""
                , "remark": ""
                , "createUserId": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "lastUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('role', {})
});