/**
 * 基础数据表-卡bin表页面相关处理js
 *
 * @author auto generator
 * @date 2018/11/22 17:31:03
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;
    var index= -1;

    showLoading();
    var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/cardBin/selectCardBinListByParam'
        , cols: [[
            {type: 'radio', fixed: 'left', align: 'center'}
            , {field: 'issBankId', title: '发卡行标识', align: 'center', width: '25%'}
            , {field: 'issBankName', title: '发卡行名称', align: 'center', width: '50%'}
            , {
                field: 'status', title: '状态', width: '25%', align: 'center', templet: function (d) {
                    var html = '';
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.status == '0') {
                        html = '<span class="layui-badge">无效</span>';
                    }
                    else if (d.status == 'X' || d.status == 'x') {
                        html = '<span class="layui-badge">注销</span>';
                    }
                    return html;
                }
            }
        ]]
        , page: true
        , where: ''
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none:'暂无数据'}
        ,done:function (res) {   //返回数据执行回调函数
            closeLoading();    //返回数据关闭loading
        }
    };
    table.render(option);

    //监听行单击事件（单击事件为：rowDouble）
    table.on('row(table-operation-filter)', function(obj){
        var data = obj.data;
        parent.cardBin=data;

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
    });
    function showLoading(){
        index=layer.load(2);
    }
    function closeLoading(){
        layer.close(index);
    }

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
                 "issBankName": ""
                , "status": ""
                , "cardType": ""
                , "cardName": ""
                , "issBankId": ""
                , "cardBin": ""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('cardBin', {})
});