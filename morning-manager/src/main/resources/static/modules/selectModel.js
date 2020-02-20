/**
 * 助贷通商户管理 开通大商户  终端号选择js
 *
 * @author auto generator
 * @version v1.0.1, 2018/09/20 23:33:23
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;
    var index= -1;

    showLoading();
    var option={
        elem: '#table-data'
        , method: 'post'
        , url: '/termActivityMerchV3/modelList'
        , cols: [[
            {type: 'radio', fixed: 'left', align: 'center',disabled:true}
            , {field: 'id', title: '', align: 'center', width: 100,hide:true}
            , {field: 'model', title: '终端型号', align: 'center', width: '33%'}
            , {field: 'termId', title: '终端号', align: 'center', width: '33%'}
            , {field: 'sn', title: '序列号', align: 'center', width: '34%'}

        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none:'暂无数据'}
        , where :{'merchId':parent.id}
        ,done:function (res) {   //返回数据执行回调函数
            closeLoading();    //返回数据关闭loading
        }
    };
    table.render(option);
    //查询按钮
    form.on('submit(table-search)', function (data) {
        showLoading();
        var field = data.field;
        field.merchId = parent.id;
        option.where=field;
        table.render(option);
    });
    //工具栏按钮,基本功能:新增,批量删除以及重置.新功能基本都在此处理
    var active = {
        //重置,新增的查询条件记得在此处清空
         reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                "agentId":""
                ,"agentName":""
                ,"agentType":""
                ,"sn":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });



    //监听行单击事件（单击事件为：rowDouble）
    table.on('row(table-operation-filter)', function(obj){
        var data = obj.data;
        parent.model=data;

        //标注选中样式
        obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        obj.tr.find('input[lay-type="layTableRadio"]').prop("checked",true);
        var index = obj.tr.data('index')
        var thisData = table.cache.tableName;//tableName 表名
        //重置数据单选属性
        layui.each(thisData, function(i, item){
            if(index === i){
                item.LAY_CHECKED = true;
            } else {
                delete item.LAY_CHECKED;
            }
        });
        form.render('radio');
        /*if(null == data){
            parent.layui.$('#agentId').val(null);
            parent.layui.$('#agentName').val(null);
        }else{
            var body = parent.layer.getChildFrame('body', parent.addFrameIndex);
            body.find('#agentId').val(data.agentId);
            body.find('#agentName').val(data.agentName);
        }*/
    });
    function showLoading(){
        index=layer.load(2);
    }
    function closeLoading(){
        layer.close(index);
    }
    exports('selectModel', {})


});