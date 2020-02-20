/**
 * 版本更新历史表页面相关处理js
 *
 * @author admin
 * @date 2020/01/14 14:32:26
 */
layui.define(['table','form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    //查询按钮
    form.on('submit(table-search)', function (data) {
        console.info(data);
        var field = data.field;
        table.reload('table-data', {
            where: field,
            page:1
        });
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
                    , url: "/versionRelease/batchDelete"
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
            dialog('新增版本更新信息', '/versionRelease/addPage', '65%', '75%', 'add-submit', function (index, field) {
                var d = layer.load();
                $.ajax({
                    type: "post"
                    , url: "/versionRelease/add"
                    , data: field
                    , dataType: "json"
                    , success: function (result) {
                        if (result.code == 0) {
                            //数据刷新
                            var index = parent.layer.getFrameIndex(window.name);
                            //parent.layer.close(index);
                            //关闭弹层
                            layer.close(d);
                            layer.close(index);
                            location.reload(); //刷新页面

                        }
                        else {
                            layer.close(d);
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
                ,"title":""
                ,"versionNumber":""
                ,"description":""
                ,"isMilestones":""
                ,"releaseDate":""
                ,"createTimeStart":""
                ,"createTimeEnd":""
                ,"createUserId":""
                ,"lastModTimeStart":""
                ,"lastModTimeEnd":""
                ,"lastUserId":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('versionRelease', {})
});