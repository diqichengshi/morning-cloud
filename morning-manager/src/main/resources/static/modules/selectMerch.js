/**
 * 商户信息表页面相关处理js
 *
 * @author admin
 * @date 2019/04/29 19:38:03
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    table.render({
        elem: '#table-data'
        , method: 'post'
        , url: '/listRule/merchList'
        , cols: [[
            {type: 'radio', fixed: 'left', align: 'center'}
            , {field: 'id', title: '', align: 'center', minWidth: 100, hide: true}
            , {field: 'merchId', title: '商户号', align: 'center', minWidth: 200}

            , {field: 'merchName', title: '商户名称', align: 'center', minWidth: 200}
            , {
                field: 'gradeMerchLevel', title: '商户评级', align: 'center', minWidth: 100, templet: function (d) {
                    var html = null;
                    if (d.gradeMerchLevel == '1') {
                        html = '<span>A</span>';
                    }
                    else if (d.gradeMerchLevel == '2') {
                        html = '<span>B</span>';
                    } else if (d.gradeMerchLevel == '3') {
                        html = '<span>C</span>';
                    } else if (d.gradeMerchLevel == '4') {
                        html = '<span>Z</span>';
                    }
                    else {
                        html = '<span></span>';
                    }
                    return html;
                }
            }
            , {field: 'legalName', title: '联系人', align: 'center', minWidth: 150}

/*
            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}*/
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none:'暂无数据'}
    });

    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'del':
                layer.confirm('确定删除吗?', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/merch/delete/" + data.id
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
                dialog('商户信息表修改', '/merch/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/merch/edit"
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
            case 'd0Fee':
                dialog('修改D0费率', '/merch/d0Page/' + data.merchId, '50%', '80%', 'add-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/merch/editD0"
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
                break;
            case 'detail':
                dialogOk('商户信息表详情', '/merch/detailPage/' + data.id, '30%', '60%');
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
            layer.confirm('确定删除吗？', {icon: 3, title: '提示'}, function (index) {
                var ids = [];
                for (var i = 0; i < data.length; i++) {
                    ids[i] = data[i].id;
                }
                $.ajax({
                    type: "post"
                    , url: "/merch/batchDelete"
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
            dialog('新增商户信息表', '/merch/addPage', '60%', '100%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/merch/add"
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
        //D0费率批量处理
        , d0FeeBatch: function () {
            dialogOk('D0费率批量处理', '/merch/d0FeeBatchPage', '40%', '60%');
        }
        //重置,新增的查询条件记得在此处清空
        , reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                "id": ""
                , "agentId": ""
                , "status": ""
                , "merchId": ""
                , "merchName": ""
                , "legalName": ""
                , "legalCertType": ""
                , "legalCertNo": ""
                , "gradeMerchLevel": ""
                , "agentName": ""
                , "contactsCertNo": ""
                , "issuingAutho": ""
                , "certStartDate": ""
                , "certEndDate": ""
                , "certAddr": ""
                , "zipCode": ""
                , "tel": ""
                , "mobile": ""
                , "email": ""
                , "addr": ""
                , "busiScope": ""
                , "cityCode": ""
                , "contractId": ""
                , "openDate": ""
                , "expireDate": ""
                , "settleType": ""
                , "settleMode": ""
                , "settleDate": ""
                , "createTimeStart": ""
                , "createTimeEnd": ""
                , "createUserId": ""
                , "lastModTimeStart": ""
                , "lastModTimeEnd": ""
                , "lastUserId": ""
                , "userCode": ""
                , "chkFlag": ""
                , "residence": ""
                , "legalMobile": ""
                , "legalNameEncrypt": ""
                , "legalCertNoEncrypt": ""
                , "legalMobileEncrypt": ""
                , "contactsEncrypt": ""
                , "contactsCertNoEncrypt": ""
                , "telEncrypt": ""
                , "mobileEncrypt": ""
                , "keyName": ""
                , "sendCnt": ""
                , "sendTimeStart": ""
                , "sendTimeEnd": ""
                , "assistStatus": ""
                , "cupsFlagU": ""
                , "cupsCancelFlag": ""
                , "freeFlag": ""
                , "cupsBatch": ""
                , "channelJoin": ""
                , "msgErr": ""

                , "merchSname": ""
                , "merchEname": ""
                , "merchPname": ""
                , "mcc": ""
                , "merchLevel": ""
                , "verifyFlag": ""
                , "merchType": ""
                , "cupsFlag": ""
                , "connType": ""
                , "expandType": ""
                , "licenseNo": ""
                , "licenseAddr": ""
                , "groupCode": ""
                , "merchAddr": ""
                , "taxCode": ""
                , "contacts": ""
                , "contactsCertType": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('merch', {})
});