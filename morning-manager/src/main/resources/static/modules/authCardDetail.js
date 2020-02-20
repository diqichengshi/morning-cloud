/**
 * 鉴权流水表页面相关处理js
 *
 * @author admin
 * @date 2019/10/24 19:29:26
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    table.render({
        elem: '#table-data'
        , method: 'post'
        , url: '/authCardDetail/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '主键', align: 'center', with: 1,hide:true}
            , {field: 'authDate', title: '鉴权日期', align: 'center', minWidth: 120}
            , {field: 'authTime', title: '鉴权时间', align: 'center', minWidth: 130}
            , {field: 'authType', title: '鉴权类型', align: 'center', minWidth: 120,templet:function (d) {
                    var html = '';
                    if (d.authType == '1') {
                        html = '<span>银行卡三要素</span>';
                    }
                    else if (d.authType == '2'){
                        html = '<span>银行卡四要素</span>';
                    }
                    else if (d.authType == '5'){
                        html = '<span>身份证二要素</span>';
                    }else if (d.authType == '6'){
                        html = '<span>身份证四要素</span>';
                    }
                    return html;
                }}
            , {field: 'mobile', title: '手机号', align: 'center', minWidth: 180}
            , {field: 'cardNo', title: '卡号', align: 'center', minWidth: 220}
            , {field: 'idCard', title: '身份证号', align: 'center', minWidth: 220}
            , {field: 'cardHolderName', title: '持卡人', align: 'center', minWidth: 150}
            , {field: 'channelId', title: '渠道号', align: 'center', minWidth: 140}
            , {field: 'merchId', title: '商户号', align: 'center', minWidth: 150}
            , {field: 'respCode', title: '返回码', align: 'center', minWidth: 100}
            , {field: 'respMsg', title: '返回信息', align: 'center', minWidth: 200}
            , {title: '操作', minWidth: 100, align: 'center', fixed: 'right', toolbar: '#table-operation'}
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
            case 'detail':
                dialogOk('鉴权流水详情', '/authCardDetail/detailPage/' + data.id, '50%', '90%');
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
        //重置,新增的查询条件记得在此处清空
         reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                "authType":""
                ,"authDateStart":""
                ,"authDateEnd":""
                ,"authTimeStart":""
                ,"authTimeEnd":""
                ,"channelId":""
                ,"merchId":""
                ,"respCode":""
                ,"respMsg":""
                ,"optNo":""
                ,"idCard":""
                ,"cardNo":""
                ,"cardNoEncrypt":""
                ,"cardHolderName":""
                ,"mobile":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('authCardDetail', {})
});