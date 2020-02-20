/**
 * 用户页面相关处理js
 *
 * @author auto generator
 * @date 2018/11/15 15:52:59
 */
layui.define(['table','jquery','form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;
   
    //自定义验证
    form.verify({
        userNameReg: function (value, item) { //value：表单的值、item：表单的DOM对象
            /*if (!new RegExp("^(?=.*[A-Za-z])[A-Za-z\d]{4,20}$").test(value)) {
                return '用户名为4-20位至少包含一个字母';
            }*/
        	
        	if(value.length < 4 || value.length > 20){
        		return '用户名为4-20位至少包含一个字母';
        	}
        	
        	var flag = false;
        	for (var i in value) {
                var asc = value.charCodeAt(i);
                if ((asc >= 65 && asc <= 90 || asc >= 97 && asc <= 122)) {
                	flag = true;
                	break;
                }
            }        	
        	
        	if(!flag){
        		return '用户名为4-20位至少包含一个字母';
        	}

        },
        passwordReg: function (value, item) {
            if (!new RegExp("^[\\s\\S]{6,20}$").test(value)) {
                return '密码为6-20位字符';
            }

        },
        realNameReg: function (value, item) {
            if (!new RegExp("^([\u4e00-\u9fa5.s·s]{1,20}|[a-zA-Z.s·s]{1,20})$").test(value)) {
                return '真实姓名为英文或汉字';
            }

        },
        emailReq: function (value, item) {
            if (!new RegExp("^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.])+[A-Za-z\\d]{2,4}$").test(value) && value != '') {
                return '邮箱格式不正确';
            }

        },
        mobilelReq: function (value, item) {
            if (!new RegExp("^[1][3,4,5,7,8][0-9]{8}$").test(value) && value != '') {
                return '手机号格式不正确';
            }

        }
    });

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/user/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: 'ID', fixed: 'left', align: 'center', width: 200, hide: true}
            , {field: 'username', title: '用户名', fixed: 'left', align: 'center', width: 150}
            , {
                field: 'groupCodesIndex', title: '用户类型', align: 'center', width: 100, templet: function (d) {
                	var html = null;
                    if (d.groupCodesIndex == "" || d.groupCodesIndex == null || d.groupCodesIndex == undefined) {
                        html = '<span class="layui-badge">运营</span>';
                    }
                    if (d.groupCodesIndex == '1') {
                        html = '<span class="layui-badge layui-bg-orange">分公司</span>';
                    }
                    if (d.groupCodesIndex == '10') {
                        html = '<span class="layui-badge layui-bg-cyan">一代</span>';
                    }
                    if (d.groupCodesIndex > '10') {
                        html = '<span class="layui-badge layui-bg-blue">子代</span>';
                    }  
                    return html;
                }
            }
            , {field: 'name', title: '真实姓名', align: 'center', width: 150}
            , {field: 'mobile', title: '手机号', width: 120, align: 'center'}
            , {field: 'email', title: '邮箱', width: 200, align: 'center'}
            , {field: 'orgCode', title: '部门编号', align: 'center', width: 100}            
            /*, {
                field: 'isOperate', title: '管理员', align: 'center', width: 80, templet: function (d) {
                    var html = null;
                    if (d.isOperate == '1') {
                        html = '<span class="layui-badge">是</span>';
                    }
                    else {
                        html = '<span class="layui-badge layui-bg-green">否</span>';
                    }
                    return html;
                }
            }*/
            , {
                field: 'dataPermission', title: '数据权限', align: 'center', width: 200, templet: function (d) {
                    if (d.dataPermission == '0') {
                        return '全部';
                    }
                    else if (d.dataPermission == '1') {
                        return '本机构';
                    }
                    else if (d.dataPermission == '2') {
                        return '本机构及下属机构';
                    }
                    else if (d.dataPermission == '3') {
                        return '本人';
                    }
                    else {
                        return '';
                    }
                }
            }
            , {
                field: 'status', title: '状态', minWidth: 100, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">正常</span>';
                    }
                    else if (d.status == '0') {
                        html = '<span class="layui-badge">冻结</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'mobileAuthStatus', title: '手机认证', align: 'center', width: 100, templet: function (d) {
                    var html = null;
                    if (d.mobileAuthStatus == '0') {
                        html = '<span class="layui-badge">未认证</span>';
                    }
                    else {
                        html = '<span class="layui-badge layui-bg-green">已认证</span>';
                    }
                    return html;
                }
            }
            , {
                field: 'realAuthStatus', title: '实名认证', align: 'center', width: 100, templet: function (d) {
                    var html = null;
                    if (d.realAuthStatus == '0') {
                        html = '<span class="layui-badge">未认证</span>';
                    }
                    else {
                        html = '<span class="layui-badge layui-bg-green">已认证</span>';
                    }
                    return html;
                }
            }
            , {field: 'pwdErrorCnt', title: '密码错误次数', align: 'center', width: 150}
            , {field: 'loginReserve', title: '预留信息', width: 300, align: 'center'}
            , {
                field: 'registerFrom', title: '注册来源', width: 100, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.registerFrom == '0') {
                        html = '<span class="layui-badge layui-bg-green">PC</span>';
                    }
                    else if (d.registerFrom == '1') {
                        html = '<span class="layui-badge layui-bg-blue">Android</span>';
                    } else if (d.registerFrom == '2') {
                        html = '<span class="layui-badge layui-bg-cyan">IOS</span>';
                    }
                    return html;
                }
            }
            , {field: 'createUserId', title: '创建人', align: 'center', width: 100}
            , {
                field: 'createTime', title: '创建时间', align: 'center', width: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {field: 'lastUserId', title: '修改人', align: 'center', width: 100}
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
                        , url: "/user/delete/" + data.id
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
                	layer.msg('请选择本人创建的用户！');
                    return;
                } else {
                	dialog('用户修改', '/user/editPage/' + data.id, '50%', '90%', 'edit-submit', function (index, field) {
                        $.ajax({
                            type: "post"
                            , url: "/user/edit"
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
                dialogOk('用户详情', '/user/detailPage/' + data.id, '50%', '100%');
                break;
        }
    });
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        option.where = field;
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
                    , url: "/user/batchDelete"
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
        	
            dialog('新增用户', '/user/addPage', '70%', '100%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/user/add"
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
                , "username": ""
                , "password": ""
                , "email": ""
                , "mobile": ""
                , "name": ""
                , "orgCode": ""
                , "status": ""
                , "mobileAuthStatus": ""
                , "realAuthStatus": ""
                , "pwdErrorCnt": ""
                , "loginReserve": ""
                , "registerFrom": ""
                , "dataPermission": ""
                , "createUserId": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "lastUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
                ,"groupCodesIndex":""
            })
        }
        //重置密码123456
        , chgpassword: function () {
            var data = selectOne(table, 'table-data');
            if (null == data) {
                return;
            }
            layer.confirm('确定重置密码吗？', {icon: 3, title: '提示'}, function (index) {
                $.ajax({
                    type: "post"
                    , url: "/user/resetPassword/" + data.id
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            layer.msg('已重置密码');
                        }
                        else {
                            layer.msg(result.msg);
                        }
                    }
                });
            });
        }
        //分配角色
        , setrole: function () {
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
            	dialog('分配角色', '/user/rolePage/' + data.id, '50%', '100%', 'addRole-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/user/role/edit"
                        , data: field
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                layer.msg(result.msg);
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
        }

    };

    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('user', {})

    form.on('select(dataPermission)', function (data) {
        var orgCode = $("#seleteOrgCode");
        if ("0" == data.value) {
            orgCode.val("00000000");
        }else{
            if(orgCode.val() == '00000000') {
                $("#seleteOrgCode").val('');
            }
        }

    })


});



