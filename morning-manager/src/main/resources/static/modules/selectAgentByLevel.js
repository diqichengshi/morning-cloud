/**
 * 一级代理商基本信息变更表页面相关处理js
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
        , url: '/agent/list/levelOne'
        , cols: [[
            {type: 'radio', fixed: 'left', align: 'center',disabled:true}
            , {field: 'id', title: '', align: 'center', width: 100,hide:true}
            , {field: 'agentId', title: '代理商编号', align: 'center', width: '20%'}
            , {field: 'agentName', title: '代理商名称', align: 'center', width: '30%'}
            //, {field: 'agentLevel', title: '代理商等级', align: 'center', minWidth: 100}
            , {field: 'companyId', title: '所属分公司编号', align: 'center', width: '20%'}
            , {field: 'companyName', title: '所属分公司名称', align: 'center', width: '30%'}

           /* , {
                field: 'status', title: '状态', width:100, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">启用</span>';
                    }
                    else if (d.status == '0'){
                        html = '<span class="layui-badge">禁用</span>';
                    }
                    else if (d.status == 'X' || d.status == 'x'){
                        html = '<span class="layui-badge">注销</span>';
                    }
                    return html;
                }
            }*/
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , where :{"agentLevel":1}
        , text: {none:'暂无数据'}
        ,done:function (res) {   //返回数据执行回调函数
            closeLoading();    //返回数据关闭loading
        }
    };
    table.render(option);
    //查询按钮
    form.on('submit(table-search)', function (data) {
        showLoading();
        var field = data.field;
        field.agentLevel=1;
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
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //复选框点击表格行选中事件
    /*$(document).on("click",".layui-table-body table.layui-table tbody tr", function () {
        var index = $(this).attr('data-index');
        var tableBox = $(this).parents('.layui-table-box');
        //存在固定列
        if (tableBox.find(".layui-table-fixed.layui-table-fixed-l").length>0) {
            tableDiv = tableBox.find(".layui-table-fixed.layui-table-fixed-l");
        } else {
            tableDiv = tableBox.find(".layui-table-body.layui-table-main");
        }
        //获取已选中列并取消选中
        var trs = tableDiv.find(".layui-unselect.layui-form-checkbox.layui-form-checked").parent().parent().parent();
        for(var i = 0;i<trs.length;i++){
            var ind = $(trs[i]).attr("data-index");
            if(ind!=index){
                var checkCell = tableDiv.find("tr[data-index=" + ind + "]").find("td div.laytable-cell-checkbox div.layui-form-checkbox I");
                if (checkCell.length>0) {
                    checkCell.click();
                }
            }
        }
        //选中单击行
        var checkCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-checkbox div.layui-form-checkbox I");
        if (checkCell.length > 0) {
            checkCell.click();
        }
        var data = selectOne(table, 'table-data');
        if(null == data){
            parent.layui.$('#agentId').val(null);
            parent.layui.$('#agentName').val(null);
        }else{
            parent.layui.$('#agentId').val(data.agentId);
            parent.layui.$('#agentName').val(data.agentName);
        }
    });
    $(document).on("click", "td div.laytable-cell-checkbox div.layui-form-checkbox", function (e) {
        e.stopPropagation();
    });*/

    //监听行单击事件（单击事件为：rowDouble）
    table.on('row(table-operation-filter)', function(obj){
        var data = obj.data;
        parent.agent=data;

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
    exports('selectAgent', {})
});