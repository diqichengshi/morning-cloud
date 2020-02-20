/**
 * 修改密码js
 *
 * @author auto generator
 * @date 2019-03-22
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , layer = layui.layer
        , laytpl = layui.laytpl
        , setter = layui.setter
        , view = layui.view
        , admin = layui.admin
        , form = layui.form;
    form.on('submit(ok)', function (data) {
        $.ajax({
            url: '/user/password/edit',
            method: 'post',
            data: data.field,
            dataType: 'JSON',
            success: function (result) {
                if (result.code == 0) {
                    layer.msg(result.msg);
                    //执行退出接口
                    admin.req({
                        url: '/logout'
                        , type: 'get'
                        , data: {}
                        , done: function (res) {
                            //清空本地记录的 token，并跳转到登入页
                            admin.exit(function () {
                                window.parent.location.reload();//刷新父页面
                                location.href = '/login';
                            });
                        }
                    });
                }
                else {
                    layer.msg(result.msg);
                }
            }
        });

    });
    exports('password', {})
});