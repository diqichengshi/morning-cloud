/**
 * 商户用户表页面相关处理js
 *
 * @author admin
 * @date 2019/07/30 11:17:53
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    table.render({
        elem: '#table-data'
        , method: 'post'
        , url: '/userMerchant/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'username', fixed: 'left', title: '商户号', align: 'center', minWidth: 160}
            , {field: 'realName', title: '姓名', align: 'center', minWidth: 150}
            , {field: 'mobile', title: '手机号', align: 'center', minWidth: 150}
            , {field: 'email', title: '邮箱', align: 'center', minWidth: 180}
            , {field: 'pwdGeneralErrorCnt', title: '常规密码错误次数', align: 'center', minWidth: 150}
            , {field: 'pwdGestureErrorCnt', title: '手势密码错误次数', align: 'center', minWidth: 150}
            , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
            , {
                field: 'status', title: '状态', minWidth: 50, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">正常</span>';

                        /*
                                                html = '<button onclick="ok(\''+d.id+'\');"><span class="layui-badge layui-bg-green">停用</span></button>';
                        */
                    }
                    else if (d.status == '0'){
                        html = '<span class="layui-badge layui-bg-red">冻结</span>';

                        /*
                                                html = '<button onclick="no(\''+d.id+'\');"><span class="layui-badge layui-bg-green">启用</span></button>';
                        */
                    }

                    return html;
                }
            }
         /*   , {field: 'deleteStatus', title: '是否删除:0-未删除,1-已删除', align: 'center', minWidth: 100}
            , {field: 'mobileAuthStatus', title: '手机认证:0-未认证,1-已认证', align: 'center', minWidth: 100}
            , {field: 'realAuthStatus', title: '实名认证:0-未认证,1-已认证', align: 'center', minWidth: 100}
            , {field: 'emailAuthStatus', title: '邮箱认证:0-未认证,1-已认证', align: 'center', minWidth: 100}
            , {field: 'loginReserve', title: '预留信息', align: 'center', minWidth: 100}
            , {field: 'registerFrom', title: '注册来源:0-代理商平台，1-助代通报件，2-助代通拓展，3-钱客通', align: 'center', minWidth: 100}
            , {field: 'dataPermission', title: '数据权限:0-全部;1-本机构;2-本机构及下属机构;3-本人', align: 'center', minWidth: 100}
            , {field: 'createUserId', title: '创建人', align: 'center', minWidth: 100}

            , {field: 'lastUserId', title: '最后修改人', align: 'center', minWidth: 100}
            , {
                field: 'lastModTime', title: '最后修改时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }
                }
            }
            , {field: 'keyName', title: '密钥名称', align: 'center', minWidth: 100}*/
            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        ,text: {none: '暂无数据'}
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
                        , url: "/userMerchant/delete/" + data.id
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
                dialog('修改商户用户', '/userMerchant/editPage/' + data.id, '60%', '100%', 'edit-submit', function (index, field) {
                    setSaveBtnCss($);
                    $.ajax({
                        type: "post"
                        , url: "/userMerchant/edit"
                        , data: field
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                table.reload('table-data');
                                layer.close(index); //关闭弹层
                            }
                            else {
                                layer.msg(result.msg);
                                cancelSaveBtnCss($);

                            }
                        }
                    });
                });
                break;
            case 'detail':
                dialogOk('商户用户详情', '/userMerchant/detailPage/' + data.id, '50%', '80%');
                break;

        }
    });
    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        table.reload('table-data', {
            where: field,
            page:1,
            limit:10
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
                    , url: "/userMerchant/batchDelete"
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
       ,resetPwd:function() {
            var data = selectOne(table, 'table-data');
            if (null == data) {
                return;
            }
            layer.confirm('确定重置密码吗?', {icon: 3, title: '提示'}, function (index) {
                setSaveBtnCss($);
                $.ajax({
                    type: "post"
                    , url: "/userMerchant/resetPwd/" + data.id
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            table.reload('table-data');
                            layer.msg('已重置');
                        }
                        else {
                            layer.msg(result.msg);
                            cancelSaveBtnCss($);
                        }
                    }
                });
            });
        }
        //启用
        ,start: function () {
            var data = selectOne(table, 'table-data');
            if (null == data) {
                return;
            }
            if(data.status ==1){
                layer.msg("该商户不能进行此操作！");
                return;
            }
            layer.confirm('确定启用吗?', {icon: 3, title: '提示'}, function (index) {
                $.ajax({
                type: "post"
                , url: "/userMerchant/updateStatus"
                , data: {"status": 1, "id": data.id}
                , traditional: true
                , dataType: "json"
                , success: function (result) {
                    if (result.code == 0) {
                        table.reload('table-data'); //数据刷新
                        layer.msg('已启用');

                    }
                    else {
                        layer.msg(result.msg);
                    }
                }
            });
            });
        }
        //停用
        ,stop: function () {
            var data = selectOne(table, 'table-data');
            if (null == data) {
                return;
            }

            if(data.status ==0){
                layer.msg("该商户不能进行此操作！");
               return;
            }
            layer.confirm('确定停用吗?', {icon: 3, title: '提示'}, function (index) {
                $.ajax({
                type: "post"
                , url: "/userMerchant/updateStatus"
                , data: {"status": 0, "id": data.id}
                , traditional: true
                , dataType: "json"
                , success: function (result) {
                    if (result.code == 0) {
                        table.reload('table-data'); //数据刷新
                        layer.msg('已停用');

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
            dialog('新增商户用户', '/userMerchant/addPage', '60%', '100%', 'add-submit', function (index, field) {
                setSaveBtnCss($);
                $.ajax({
                    type: "post"
                    , url: "/userMerchant/add"
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
                ,"username":""
                ,"pwdGeneral":""
                ,"pwdGesture":""
                ,"pwdGeneralModifyTimeStart":""
                ,"pwdGeneralModifyTimeEnd":""
                ,"pwdGestureModifyTimeStart":""
                ,"pwdGestureModifyTimeEnd":""
                ,"email":""
                ,"mobile":""
                ,"mobileEncrypt":""
                ,"realName":""
                ,"orgCode":""
                ,"status":""
                ,"deleteStatus":""
                ,"mobileAuthStatus":""
                ,"realAuthStatus":""
                ,"emailAuthStatus":""
                ,"loginReserve":""
                ,"registerFrom":""
                ,"dataPermission":""
                ,"createUserId":""
                ,"createTimeStart":""
                ,"createTimeEnd":""
                ,"lastUserId":""
                ,"lastModTimeStart":""
                ,"lastModTimeEnd":""
                ,"keyName":""
            })
        }


    };

    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('userMerchant', {})

       //启用
        window.ok = function(id){
        console.log(id)
        $.ajax({
            type: "post"
            , url: "/userMerchant/updateStatus"
            , data: {"status": 0, "id": id}
            , traditional: true
            , dataType: "json"
            , success: function (result) {
                if (result.code == 0) {
                    table.reload('table-data'); //数据刷新
                }
                else {
                    layer.msg(result.msg);
                }
            }
        });
    }

  //停用
    window.no =function (id) {
        $.ajax({
            type: "post"
            , url: "/userMerchant/updateStatus"
            , data: {"status": 1 ,"id":id}
            , traditional: true
            , dataType: "json"
            , success: function (result) {
                if (result.code == 0) {
                    table.reload('table-data'); //数据刷新
                }
                else {
                    layer.msg(result.msg);
                }
            }
        });
    }

});

