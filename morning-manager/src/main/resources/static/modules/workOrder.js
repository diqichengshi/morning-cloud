/**
 * 工单信息表页面相关处理js
 *
 * @author admin
 * @date 2020/01/13 19:31:17
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;
    //查看详情
    window.detail = function(id){
    	active.detail(id);
    }
    //确认工单
    window.confirm = function(id){
    	active.confirm(id);
    }
    //子工单信息
    window.subWorkOrder = function(parentId){
    	active.subWorkOrder(parentId);
    }
    //增加评论
    window.evaluateAddPage = function(id){
    	active.evaluateAddPage(id);
    }
    //增加子工单
    window.subWorkOrderAddPage = function(parentId){
    	active.subWorkOrderAddPage(parentId);
    }
    //完成工单
    window.finish = function(id){
    	active.finish(id);
    }
    //删除工单
    window.del = function(id){
    	active.del(id);
    }
    //下载
    window.downLoad = function(fileName,filePath){
    	active.downLoad(fileName,filePath);
    }
  //工具栏按钮,基本功能:新增,批量删除以及重置.新功能基本都在此处理
    var active = {
        //新增
        add: function () {
            dialog('新增工单信息表', '/workOrder/addPage', '60%', '80%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/workOrder/add"
                    , data: field
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            //数据刷新
                        	location.reload();
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
    ,detail: function(id){
    	 dialogOk('工单信息表详情', '/workOrder/detailPage/'+id, '60%', '80%');
    }
    //确认工单
    ,confirm:function(id){
    	layer.open({
    		skin:"confirm"
    		,
            type: 2
            ,
            title: '确认工单信息'
            ,
            content: '/workOrder/confirmPage/' +id
            ,
            area: ['80%', '90%']
            ,
            btn: ['<i class="layui-icon layui-icon-ok"></i>通过', '<i class="layui-icon layui-icon-close"></i>驳回', '<i class="layui-icon layui-icon-return">返回']
            ,
            yes: function (index, layero) {
                var iframeWindow = window['layui-layer-iframe' + index]
                    , submitID = 'confirm-submit'
                    , submit = layero.find('iframe').contents().find('#' + submitID);

                //监听提交
                iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                    var field = data.field; //获取提交的字段
                    field.workOrderOperation=1;
                    $.ajax({
                        type: "post"
                        , data:field
                        , url: "/workOrder/confirm"
                        , dataType: "json"
                        , success: function (result) {
                            layer.msg(result.msg);
                            if (result.code == 0) {
                            	location.reload();
                                layer.close(index); //关闭弹层
                            }
                        }
                    });
                });
                submit.trigger('click');
            }
            ,
            btn2: function (index, layero) {
                var iframeWindow = window['layui-layer-iframe' + index]
                    , submitID = 'confirm-submit'
                    , submit = layero.find('iframe').contents().find('#' + submitID);

                //监听提交
                iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                    var field = data.field; //获取提交的字段
                    field.workOrderOperation=2;
                    if(field.handleOpinion == ''){
                        layer.msg('处理意见不能为空');
                        return;
                    }
                    $.ajax({
                        type: "post"
                        , data:field
                        , url: "workOrder/confirm"
                        , dataType: "json"
                        , success: function (result) {
                            layer.msg(result.msg);
                            if (result.code == 0) {
                            	location.reload();
                                layer.close(index); //关闭弹层
                            }
                        }
                    });
                });
                submit.trigger('click');
                return false;
            }
            ,
            btn3:function (index, layero) {
            }
        });
    }
    ,subWorkOrder: function(parentId){
   	 dialogOk('子工单信息列表', '/workOrder/subWorkOrderPage/'+parentId, '70%', '90%');
   }
    ,evaluateAddPage:function(id){
        dialog('评论', '/workOrder/evaluateAddPage/'+id, '100%', '90%', 'evaluate-submit', function (index, field) {
            $.ajax({
                type: "post"
                , url: "/workOrder/evaluateAdd"
                , data: field
                , dataType: "json"
                , success: function (result) {
                    if (result.code == 0) {
                        //数据刷新
                    	location.reload();
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
    ,subWorkOrderAddPage: function (parentId) {
        dialog('新增子工单信息表', '/workOrder/subWorkOrderAddPage/'+parentId, '100%', '90%', 'subWorkOrderAdd-submit', function (index, field) {
            $.ajax({
                type: "post"
                , url: "/workOrder/subWorkOrderAdd"
                , data: field
                , dataType: "json"
                , success: function (result) {
                    if (result.code == 0) {
                        //数据刷新
                    	parent.location.reload();
                    	location.reload();
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
    ,finish: function(id) {
    	 layer.confirm('确定完成吗?', {icon: 3, title:'提示'}, function (index) {
             $.ajax({
                 type: "post"
                 , url: "/workOrder/finish/" + id
                 , dataType: "json"
                 , success: function (result) {
                     if (result.code == 0) {
                    	 location.reload();
                         layer.msg('操作成功');
                     }
                     else {
                         layer.msg(result.msg);
                     }
                 }
             });
         });
    }
    ,del: function(id) {
    	layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function (index) {
            $.ajax({
                type: "post"
                , url: "/workOrder/delete/" +id
                , dataType: "json"
                , success: function (result) {
                    if (result.code == 0) {
                    	location.reload();
                        layer.msg('已删除');
                    }
                    else {
                        layer.msg(result.msg);
                    }
                }
            });
        });
    }
    ,downLoad: function(fileName,filePath){
    	window.open('/userDownloadFile/download?filePath=' + filePath + '&fileName=' + fileName + '&id=ceshi', '_blank');
    }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('workOrder', {})
});