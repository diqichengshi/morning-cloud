/**
 * 转账规则页面相关处理js
 *
 * @author auto generator
 * @date 2019/03/26 11:25:40
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$,
        table = layui.table,
        form = layui.form;

    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/customs/list'
        , cols: [[
        	{type: 'radio', fixed: 'left', align: 'center'},
        	{field: 'id', title: '客户标识', align: 'center', minWidth: 300},
            {field: 'name', title: '客户名称', align: 'center', minWidth: 150},
            {field: 'legalName', title: '法人', align: 'center', minWidth: 100},
            {field: 'specialMerchType', title: '商户类型', align: 'center', minWidth: 150},
            {field: 'licenseNo', title: '统一社会信用代码', align: 'center', minWidth: 200},
            {field: 'licenseEndTime', title: '营业期限', align: 'center', minWidth: 100, templet: function (d) {
            	if (d.licenseEndTime != null) {
                    var data = d.licenseEndTime;
                    var yyyy = data.substr(0, 4);
                    var mm = data.substr(4, 2);
                    var dd = data.substr(6, 2);
                    return yyyy + '-' + mm + '-' + dd;
                } else {
                    return '';
                }
            }},
            {field: 'registerCapital', title: '注册资金', align: 'center', minWidth: 150},
            {field: 'busiScope', title: '经营范围', align: 'center', minWidth: 150},
            {field: 'licenseAddr', title: '注册地址', align: 'center', minWidth: 200},
            {field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.lastModTime !== null && d.lastModTime !== undefined && d.lastModTime !== '') {
                        return formatDate(d.lastModTime);
                    }else{
                    	return '';
                    }
                }
            }
        ]],
        page: true,
        where: '',
        limit: 10,
        limits: [10, 20, 30, 40, 50, 75, 100],
        text: {none: '暂无数据'}
    };
    table.render(option);

    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        option.where=field;
        table.render(option);
    });
    //工具栏按钮,基本功能:新增,批量删除以及重置.新功能基本都在此处理
    var active = {
		merchList: function () {
            var data = selectOne(table, 'table-data');
            if (null == data) {
                return;
            }
            dialogOk('商户列表', '/customs/merchListPage/' + data.licenseNo, '80%', '80%');
        }
        //重置,新增的查询条件记得在此处清空
        , reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
            	"legalName": "", 
            	"licenseNo": "",
            	"id":""
            });
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('custom', {})
});