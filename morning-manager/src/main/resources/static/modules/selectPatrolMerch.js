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

    var option = {
        elem: '#table-data-organize'
        , method: 'post'
        , url: '/patrolMerchAud/selectMerchList'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
            , {field: 'id', title: '', align: 'center', minWidth: 100, hide: true}
            , {field: 'merchId', title: '商户号', align: 'center', minWidth: 200}

            , {field: 'merchName', title: '商户名称', align: 'center', minWidth: 200}
            /*,{
                field: 'status', title: '状态', minWidth: 70, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.status == '0') {
                        html = '<span class="layui-badge layui-bg-black">无效</span>';
                    }
                    else if (d.status == 'X' || d.status == 'x') {
                        html = '<span class="layui-badge">注销</span>';
                    } else {
                        html = '<span></span>';
                    }
                    return html;
                }
            }*/
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
            , {field: 'agentName', title: '所属代理商名称', align: 'center', minWidth: 200}
            , {field: 'firstAgentName', title: '所属一级代理商名称', align: 'center', minWidth: 200}
            , {field: 'companyName', title: '所属分公司名称', align: 'center', minWidth: 200}
            , {field: 'legalName', title: '法人', align: 'center', minWidth: 150}

/*
            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}*/
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
            case 'selectPatrolMerch':
                break;
        }
    });
    //查询按钮
    form.on('submit(table-organize-search)', function (data) {
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
                , "merchName": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('selectPatrolMerch', {})
});