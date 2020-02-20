/**
 * 商户结算账户页面相关处理js
 *
 * @author auto generator
 * @date 2018/11/05 10:15:40
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    var cols;
    if(00000000==parent.org){
        cols=[[
            {field: 'ID', title: 'ID', align: 'center', width: 150,hide:true}
            ,{field: 'merchId',fixed:"left", title: '商户号', align: 'center', width: 150}
            , {field: 'merchName', title: '商户名称', align: 'center', width: 230}
            ,{
                field: 'frozenType', title: '冻结类型', minWidth: 100, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.status == '0') {
                        if(d.frozenType == '2'){
                            html = '<span class="layui-badge layui-bg-green">允许出账</span>';
                        }else if(d.frozenType == '3'){
                            html = '<span class="layui-badge layui-bg-blue">解冻</span>';
                        }
                    }else if (d.status == '1') {
                        if(d.frozenType == '2'){
                            html = '<span class="layui-badge layui-bg-molv">禁止出账</span>';
                        }else if(d.frozenType == '3'){
                            html = '<span class="layui-badge">冻结</span>';
                        }
                    }
                    return html;
                }
            }
            , {field: 'remark', title: '备注', align: 'center', width: 200}
            ,{
                field: 'walletType', title: '结算账户控制类型', minWidth: 150, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.walletType == 'all') {
                        html = '<span class="layui-badge layui-bg-green">冻结所有钱包</span>';
                    }else if (d.walletType == '100') {
                        html = '<span class="layui-badge layui-bg-blue">POS D0钱包</span>';
                    }else if (d.walletType == '102') {
                        html = '<span class="layui-badge layui-bg-molv">POS T1钱包</span>';
                    }else if (d.walletType == '200') {
                        html = '<span class="layui-badge layui-bg-cyan">二维码D0钱包</span>';
                    }else if (d.status == '202') {
                        html = '<span class="layui-badge">二维码T1钱包</span>';
                    }
                    return html;
                }
            }
            ,{
                field: 'status', title: '状态', minWidth: 100, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.status == '0') {
                        html = '<span>解冻</span>';
                    }
                    else if (d.status == '1') {
                        html = '<span>冻结</span>';
                    }
                    return html;
                }
            }
            ,{
                field: 'synStatus', title: '同步状态', minWidth: 100, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.synStatus == '0') {
                        html = '<span>添加中</span>';
                    }
                    else if (d.synStatus == '1') {
                        html = '<span>已添加</span>';
                    }else if (d.synStatus == '2') {
                        html = '<span>添加失败</span>';
                    }
                    return html;
                }
            }
            , {field: 'createUserId', title: '创建人', align: 'center', width: 150}
            , {
                field: 'createTime', title: '创建时间', align: 'center', width: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }else{
                        return '';
                    }
                }
            }
            , {field: 'lastUserId', title: '最后修改人', align: 'center', width: 150}
            , {
                field: 'lastModTime', title: '最后修改时间', align: 'center', width: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }else{
                        return '';
                    }
                }
            }
        ]]
    }else{
        cols=[[
            {field: 'ID', title: 'ID', align: 'center', width: 150,hide:true}
            ,{field: 'merchId', title: '商户号', align: 'center', width: 150}
            , {field: 'merchName', title: '商户名称', align: 'center', width: 230}
            ,{
                field: 'frozenType', title: '冻结类型', minWidth: 100, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.status == '0') {
                        if(d.frozenType == '2'){
                            html = '<span class="layui-badge layui-bg-green">允许出账</span>';
                        }else if(d.frozenType == '3'){
                            html = '<span class="layui-badge layui-bg-blue">解冻</span>';
                        }
                    }else if (d.status == '1') {
                        if(d.frozenType == '2'){
                            html = '<span class="layui-badge layui-bg-molv">禁止出账</span>';
                        }else if(d.frozenType == '3'){
                            html = '<span class="layui-badge">冻结</span>';
                        }
                    }
                    return html;
                }
            }
            /*,{
                field: 'walletType', title: '结算账户控制类型', minWidth: 150, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.walletType == 'all') {
                        html = '<span class="layui-badge layui-bg-green">冻结所有钱包</span>';
                    }else if (d.walletType == '100') {
                        html = '<span class="layui-badge layui-bg-blue">POS D0钱包</span>';
                    }else if (d.walletType == '102') {
                        html = '<span class="layui-badge layui-bg-molv">POS T1钱包</span>';
                    }else if (d.walletType == '200') {
                        html = '<span class="layui-badge layui-bg-cyan">二维码D0钱包</span>';
                    }else if (d.status == '202') {
                        html = '<span class="layui-badge">二维码T1钱包</span>';
                    }
                    return html;
                }
            }*/
            ,{
                field: 'status', title: '状态', minWidth: 100, align: 'center', templet: function (d) {
                    var html = '';
                    if (d.status == '0') {
                        html = '<span class="layui-badge layui-bg-green">解冻</span>';
                    }
                    else if (d.status == '1') {
                        html = '<span class="layui-badge">冻结</span>';
                    }
                    return html;
                }
            } 
            , {field: 'createUserId', title: '创建人', align: 'center', width: 150}
            , {
                field: 'createTime', title: '创建时间', align: 'center', width: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }else{
                        return '';
                    }
                }
            }
            , {field: 'lastUserId', title: '最后修改人', align: 'center', width: 150}
            , {
                field: 'lastModTime', title: '最后修改时间', align: 'center', width: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }
                }
            }
        ]]
    }


    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/balance/list'
        , cols: cols
        , page: true
        , where: ''
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none:'暂无数据'}
    };
    table.render(option);
    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-filter)', function (obj) {
        
    });
    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        option.where=field;
        table.render(option);
    });
    //工具栏按钮,基本功能:新增,批量删除以及重置.新功能基本都在此处理
    var active = {
        //重置,新增的查询条件记得在此处清空
        reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
            	"merchId": ""
            	,"merchName": ""
            	,"status": ""
            	,"userType":""
            	,"createTimeStart":""
            	,"createTimeEnd":""
            	,"lastModTimeStart":""
            	,"lastModTimeEnd":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('balance', {})
});