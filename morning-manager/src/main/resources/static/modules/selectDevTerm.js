/**
 * 相关处理js
 *
 * @author auto generator
 * @date 2018/11/15 15:52:59
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;
    var option = {
        elem: '#table-data-organize'
        , method: 'post'
        , url: '/merch/selectDevTerm'
        , cols: [[
            , {field: 'id', title: 'ID', align: 'center', width: 1, hide: true}
            , {field: 'model', title: '终端型号', align: 'center', width: '20%'}
            , {field: 'termId', title: '终端号', align: 'center', width: '25%'}
            , {field: 'sn', title: '序列号', align: 'center', width: '30%'}
            , {title: '操作', width: '25%', align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , where: ''
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
		,text: {none: '暂无数据'}
    };
    table.render(option);
    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-organize-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'selectDevTerm':
            	$.ajax({
                    type: "post"
                    , url: "/merch/getTermInfo"
                    , data: {"sn":data.sn}
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                        	var index = parent.layer.getFrameIndex(window.name);
                            parent.$('#termId').val(data.termId);
                            parent.$('#sn').val(data.sn);
                            if(result.data.termType == '2' && result.data.remissionAgent == '1'){
                            	parent.$('#remissionFlag').css("display","block");
                            }else{
                            	parent.$('#remissionFlag').css("display","none");
                            }
                            parent.layer.close(index);
                        }
                        else {
                            layer.msg(result.msg);
                        }
                    }
                });
                break;
        }
    });
    exports('selectDevTerm', {})
    //查询按钮
    form.on('submit(table-organize-search)', function (data) {
        var field = data.field;
        option.where=field;
        table.render(option);
    });
    var active = {
        //重置,新增的查询条件记得在此处清空
        reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                 "termId":""
                , "sn":""
            })
        }

    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    
});



