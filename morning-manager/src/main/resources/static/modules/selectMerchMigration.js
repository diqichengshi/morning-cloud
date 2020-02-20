/**
 * 相关处理js
 *
 * @author auto generator
 * @date 2018/11/15 15:52:59
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form
        ,selectedUserCode;
    var option = {
        elem: '#table-data-organize'
        , method: 'post'
        , url: '/merch/list'
        , cols: [[
        	{type: 'checkbox', fixed: 'left', align: 'center', width: '3%'}
            , {field: 'id', title: 'ID', align: 'center', width: 1, hide: true}
            , {field: 'merchId', title: '商户号', align: 'center', width: '17%'}
            , {field: 'merchName', title: '商户名称', align: 'center', width: '20%'}
            , {field: 'legalName', title: '法人姓名', align: 'center', width: '20%'}
            , {field: 'agentId', title: '所属代理商编号', align: 'center', width: '20%'}
            , {field: 'agentLevel', title: '所属代理商级别', align: 'center', width: '20%', templet: function (d) {
                var html = null;
                if (d.agentLevel == '1') {
                    html = '<span>一级</span>';
                } else if (d.agentLevel == '2') {
                    html = '<span>二级</span>';
                } else if (d.agentLevel == '3') {
                    html = '<span>三级</span>';
                } else if (d.agentLevel == '4') {
                    html = '<span>四级</span>';
                }else if (d.agentLevel == '5') {
                    html = '<span>五级</span>';
                }else if (d.agentLevel == '6') {
                    html = '<span>六级</span>';
                }else if (d.agentLevel == '7') {
                    html = '<span>七级</span>';
                }else if (d.agentLevel == '8') {
                    html = '<span>八级</span>';
                }else {
                    html = '<span></span>';
                }
                return html;
            }}
            //, {title: '操作', width: '26%', align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , where: ''
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
		,text: {none: '暂无数据'}
    };
    var row = {};
    row.fullStatus='80';
    option.where= row;
    table.render(option);
    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-organize-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'selectMerch':
            	/*obj.tr[2].innerText = "取消";
                if(selectedUserCode == '' || selectedUserCode == undefined){
                	selectedUserCode = data.userCode;
                }else{
                	selectedUserCode += ",";
                	selectedUserCode += data.userCode;
                }*/
                break;
        }
    });
    exports('selectMerchMigration', {})
    //查询按钮
    form.on('submit(table-organize-search)', function (data) {
        var field = data.field;
        field.fullStatus='80';
        option.where=field;
        table.render(option);
    });
    //监听行单击事件（单击事件为：rowDouble）
    /*table.on('row(container)',function(obj){
    	var checkStatus = table.checkStatus('table-data-organize')
        , selectedData = checkStatus.data; //得到选中的数据
	    if (selectedData.length === 0) {
	        layer.msg('请选择数据');
	        return;
	    }
        obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
    });
    var callbackdata = function () {
        return selectedData;
    }*/
    var active = {
        //重置,新增的查询条件记得在此处清空
        reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("my-form", {
                 "merchId":""
                , "merchName":""
                , "legalName":""
            })
        }

    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    
});



