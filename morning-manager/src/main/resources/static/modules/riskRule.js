/**
 * 风控规则表页面相关处理js
 *
 * @author auto generator
 * @date 2019/04/17 15:45:07
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

   var option = {
        elem: '#table-data'
        , method: 'post'
        , url: '/riskRule/list'
        , cols: [[
            {type: 'checkbox', fixed: 'left', align: 'center'}
           /* , {field: 'id', title: '', align: 'center', minWidth: 100}*/
            , {field: 'ruleCode',fixed: 'left', title: '规则编号', align: 'center', minWidth: 100}
            , {field: 'ruleName', title: '规则名称', align: 'center', minWidth: 240}
            , {
                field: 'status', title: '状态', minWidth: 80, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.status == '1') {
                        html = '<span class="layui-badge layui-bg-green">有效</span>';
                    }
                    else if (d.status == '0'){
                        html = '<span class="layui-badge">无效</span>';
                    }
                    else if (d.status == 'X' || d.status == 'x'){
                        html = '<span class="layui-badge">注销</span>';
                    }
                    return html;
                }
            }
            , {field: 'remark', title: '备注', align: 'center', minWidth: 300}
           , {field: 'createUserId', title: '创建人', align: 'center', minWidth: 100}

           , {
                field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.createTime != null) {
                        return formatDate(d.createTime);
                    }
                }
            }
           , {field: 'lastUserId', title: '修改人', align: 'center', minWidth: 100}
            , {
                field: 'lastModTime', title: '修改时间', align: 'center', minWidth: 200, templet: function (d) {
                    if (d.lastModTime != null) {
                        return formatDate(d.lastModTime);
                    }
                }
            }

            , {title: '操作', minWidth: 250, align: 'center', fixed: 'right', toolbar: '#table-operation'}
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
       , text: {none: '暂无数据'}
    };
    table.render(option);

    //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
    table.on('tool(table-operation-filter)', function (obj) {
        //按钮所在行的数据对象
        var data = obj.data;
        switch (obj.event) {
            case 'del':
                layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function (index) {
                    $.ajax({
                        type: "post"
                        , url: "/riskRule/delete/" + data.id
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                table.reload('table-data');
                                layer.msg('已删除');
                            }
                            else {
                                layer.msg(result.msg);
                            }
                        }
                    });
                });
                break;
            case 'edit':
                dialog('风控规则表修改', '/riskRule/editPage/' + data.id, '50%', '100%', 'edit-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/riskRule/edit"
                        , data: field
                        , dataType: "json"
                        , success: function (result) {
                            if (result.code == 0) {
                                table.reload('table-data');
                                layer.close(index); //关闭弹层
                            }
                            else {
                                layer.msg(result.msg);
                            }
                        }
                    });
                });
                break;
            case 'detail':
                dialogOk('风控规则表详情', '/riskRule/detailPage/' + data.id, '50%', '100%');
                break;
        }
    });
    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        option.where=field;
        table.render(option);
    });
    //工具栏按钮,基本功能:新增,批量删除以及重置.新功能基本都在此处理
    var active = {
        //批量删除
        batchdel: function () {
            var data = selectMore(table, 'table-data');
            if (null == data) {
                return;
            }
            layer.confirm('确定删除吗？', {icon: 3, title:'提示'}, function (index) {
                var ids = [];
                for (var i = 0; i < data.length; i++) {
                    ids[i] = data[i].id;
                }
                $.ajax({
                    type: "post"
                    , url: "/riskRule/batchDelete"
                    , data: {"ids": ids}
                    , traditional: true
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            table.reload('table-data'); //数据刷新
                            layer.msg('已删除');
                        }
                        else {
                            layer.msg(result.msg);
                        }
                    }
                });
            });
        }
        //新增
        , add: function () {
            dialog('新增风控规则表', '/riskRule/addPage', '30%', '60%', 'add-submit', function (index, field) {
                $.ajax({
                    type: "post"
                    , url: "/riskRule/add"
                    , data: field
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            //数据刷新
                            table.reload('table-data');
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
        //重置,新增的查询条件记得在此处清空
        , reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                "id": ""
                ,"ruleCode":""
                ,"ruleName":""
                ,"status":""
                ,"transCode":""
                ,"startTime":""
                ,"endTime":""
                ,"respCode":""
                ,"mcc":""
                ,"remark":""
                ,"createTimeStart":""
                ,"createTimeEnd":""
                ,"createUserId":""
                ,"lastModTimeStart":""
                ,"lastModTimeEnd":""
                ,"lastUserId":""
                ,"isStop":""
                ,"isDel":""
                ,"isFrozen":""
                ,"isWarnning":""
                ,"isLife":""
                ,"lifeControl":""
                ,"transControl":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });


    layui.use(['form', 'laydate'], function () {
        var $ = layui.$//Jquery
            , form = layui.form;//表单
        //页面加载的时候就初始几个值
        initValue();

        //监听复选框
        form.on('checkbox(transCode)', function (data) {;
            var number = $('input[name="transCode"]'), value = data.value, array = number.val().split(",");
            if (data.elem.checked) {
                number.val(number.val() +","+ value);
            } else {
                var newnumber = "";
                for (var i = 0; i < array.length; i++) {
                    var str = array[i];
                    newnumber += (str != value && str != "" && str != null) ? str + "," : "";
                }
                number.val(newnumber);
            }
        });
    });


    function initValue() {
        var param=$("input[name='transCode']").val(),checkBoxs = $("input[type='checkbox']"), array = param.split(",");
        for (var i = 0; i < array.length; i++) {
            for (var j = 0; j < checkBoxs.length; j++) {
                var checkbox = $(checkBoxs[j]);
                if (checkbox.val() == array[i]) {
                    checkbox.attr('checked','checked');
                    break;
                }
            }
        }
        form.render('checkbox');
    }



    exports('riskRule', {})
});