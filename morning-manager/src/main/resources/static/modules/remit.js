/**
 * 2.0助代通代理商返还表页面相关处理js（代理商终端管理）
 *
 * @author admin
 * @date 2019/07/11 16:39:31
 */



layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;
    var nowDate = new Date();
    var year = nowDate.getFullYear();
    var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1)
        : nowDate.getMonth() + 1;
    var day = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate
        .getDate();
    var date = year + "" + month + "" + day;

    layui.use(['layer', 'table', 'laypage'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var laypage = layui.laypage;

        var limit = 10;
        var realData;
        var showData;
        var count;
        var serch = {"merchNo":null,"remitDate":date};
        network(serch);
        //执行一个 table 实例
        table.render({
            elem: '#table-data',
            page: true,
            limit: 10
            , cols: [[
                 {field: 'accountNoMask', title: '卡号', align: 'center', minWidth: 100, hide: true}
                , {field: 'handleStatus', title: '处理状态', align: 'center', minWidth: 100, hide: true}
                , {field: 'accountName', fixed: 'left', title: '开户人姓名 ', align: 'center', minWidth: 150}
                , {
                    field: 'remitAmount', title: '清算金额(元)', align: 'center', minWidth: 160, templet: function (d) {
                        if (d.remitAmount != null) {
                            var reAmt = "￥" + formatMoney(d.remitAmount, 2);
                            var html = '<font color="#00A600">' + reAmt + '</font>';
                            return html;
                        }
                    }
                }
                , {
                    field: 'receiveAmount', title: '收款到账金额(元)', align: 'center', minWidth: 180, templet: function (d) {
                        if (d.receiveAmount != null) {
                            var reAmt = "￥" + formatMoney(d.receiveAmount, 2);
                            var html = '<font color="#00A600">' + reAmt + '</font>';
                            return html;
                        }
                    }
                }
                , {
                    field: 'remitStatus', title: '清算状态', align: 'center', minWidth: 130, templet: function (d) {
                        var html = null;
                        if (d.remitStatus == '1') {
                            html = '<span class="layui-badge layui-bg-green">已清算</span>';
                        }
                        else if (d.remitStatus == '0') {
                            html = '<span class="layui-badge layui-bg-red">未清算</span>';
                        }
                        else if (d.remitStatus == '2') {
                            html = '<span class="layui-badge layui-bg-blue">清算中</span>';
                        }
                        else if (d.remitStatus == '3') {
                            html = '<span class="layui-badge layui-bg-black">清算失败</span>';
                        }
                        return html;
                    }
                }
                , {
                    field: 'remitType ', title: '清算类型', align: 'center', minWidth: 120, templet: function (d) {
                        var html = null;
                        if (d.remitType == '1') {
                            html = '<span class="layui-badge layui-bg-green">实时代付</span>';
                        }
                        else if (d.remitType == '2') {
                            html = '<span class="layui-badge layui-bg-blue">批量代付</span>';
                        }
                        return html;
                    }
                }
                , {
                    field: 'withdrawDepositFee',
                    title: '提现费用(元)',
                    align: 'center',
                    minWidth: 150,
                    templet: function (d) {
                        if (d.withdrawDepositFee != null) {
                            var reAmt = "￥" + formatMoney(d.withdrawDepositFee, 2);
                            var html = '<font color="#00A600">' + reAmt + '</font>';
                            return html;
                        }
                    }
                }
                , {
                    field: 'withdrawDepositSingleFee',
                    title: '提现单笔费用(元)',
                    align: 'center',
                    minWidth: 180,
                    templet: function (d) {
                        if (d.withdrawDepositSingleFee != null) {
                            var reAmt = "￥" + formatMoney(d.withdrawDepositSingleFee, 2);
                            var html = '<font color="#00A600">' + reAmt + '</font>';
                            return html;
                        }
                    }
                }
                , {
                    field: 'businessType ', title: '业务类型', align: 'center', minWidth: 100, templet: function (d) {
                        var html = null;
                        if (d.businessType == '1') {
                            html = '<span class="layui-badge layui-bg-green">POS</span>';
                        }
                        else if (d.businessType == '2') {
                            html = '<span class="layui-badge layui-bg-red">二维码</span>';
                        }
                        else if (d.businessType == '3') {
                            html = '<span class="layui-badge layui-bg-blue">快捷</span>';
                        }
                        else if (d.businessType == null) {
                            html = '';
                        }
                        return html;
                    }
                }
                , {
                    field: 'riskDay', title: '风险预存期', align: 'center', minWidth: 130, templet: function (d) {
                        var html = null;
                        if (d.riskDay == '1') {
                            html = '<span class="layui-badge layui-bg-green">T1</span>';
                        }
                        else if (d.riskDay == '0') {
                            html = '<span class="layui-badge layui-bg-red">D0</span>';
                        }
                        return html;
                    }
                }
                , {
                    field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
                        if (d.createTime != null) {
                            return formatDate(d.createTime);
                        }
                    }
                }
                , {title: '操作', minWidth: 200, align: 'center', fixed: 'right', toolbar: '#table-operation'}
            ]]
            , data: showData
            , text: {none:'暂无数据'}
        });

  function page9(){
      //总页数大于页码总数
        laypage.render({
          //elem: 'demo1',
            count: count//数据总数
            , limit: limit  //每页显示的条数。laypage将会借助 count 和 limit 计算出分页数。
           // , layout: [ 'prev', 'page', 'next', 'count', 'skip']
            , jump: function (obj, first) {
                //首次不执行
                if (!first) {
                    //执行重载
                    showData = realData.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                  //  showData=realData.slice(obj.curr-1,2)
                  table.reload("table-data",{data:showData});

                }
            }
        });
  }
        function network(field) {
            $.ajax({
                type: "post",
                url: '/merchAccountFrozen/getRemitFlowsList',
                data: field,
                success: function (res) {
                    if (res.code == 0) {
                        realData = res.data;
                     //   showData=realData.slice(0,10);
                        count =   res.count;
                        //table.reload("table-data",{data:null});
                       $(".layui-table-main").html('<div class="layui-none">暂无数据</div>');
                        $(".layui-table-fixed-r").html('<div class="layui-none"></div>');

                    } else {
                        layer.msg(res.msg);
                    }
                }
            });
        }
        function getData(field) {
            $.ajax({
                type: "post",
                url: '/merchAccountFrozen/getRemitFlowsList',
                data: field,
                success: function (res) {
                    if (res.code == 0) {
                        realData = res.data;
                        count =   res.count;
                        console.log(count);
                        if(count==null){
                            $(".layui-table-main").html('<div class="layui-none">暂无数据</div>');
                            $(".layui-table-fixed-l").html('<div class="layui-none"></div>');
                            $(".layui-table-fixed-r").html('<div class="layui-none"></div>');
                            $(".layui-table-page").html('<div class="layui-none"></div>');
                        }else{
                            table.reload("table-data",{data:realData});
                            page9()
                        }
                       ;
                    } else {
                        layer.msg(res.msg);
                    }
                }
            });
        }


        //表格操作按钮,功能:详情,修改,删除,都是单条记录，基本不用动.table-operation-filter为table的lay-filter值
        table.on('tool(table-operation-filter)', function (obj) {
            //按钮所在行的数据对象
            var data = obj.data;
            switch (obj.event) {
                case 'del':
                    layer.confirm('确定删除吗?', {icon: 3, title: '提示'}, function (index) {
                        $.ajax({
                            type: "post"
                            , url: "/termActivityAgent/delete/" + data.id
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
                    dialog('助代通代理商返还表修改', '/termActivityAgent/editPage/' + data.id, '30%', '60%', 'edit-submit', function (index, field) {
                        $.ajax({
                            type: "post"
                            , url: "/termActivityAgent/edit"
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
                /*  case 'detail':
                     var param = JSON.stringify(data);
                     console.log(param);
                      dialogOk('详情', '/merchAccountFrozen/detailRemitPage/'+data.accountNoMask+"/"
                       +data.accountName, '60%', '80%');
                      break;*/
                case 'detail':
                    var param = JSON.stringify(data);

                    layer.open({
                        type: 2
                        , title: '详情'
                        , content: '/merchAccountFrozen/detailRemitPage/'
                        // , offset: '200px'
                        , area: ['60%', '80%']
                        , btn: ['<i class="layui-icon layui-icon-return">返回']
                        , success: function (layero, index) {

                            var body = layer.getChildFrame('body', index);
                            var iframeWin = window[layero.find('iframe')[0]['name']];
                            body.find("#accountName").val(data.accountName);
                            body.find("#accountNoMask").val(data.accountNoMask);
                            body.find("#receiveAmount").val(formatMoney(data.receiveAmount, 2));
                            body.find("#remitAmount").val(formatMoney(data.remitAmount, 2));
                            body.find("#createTime").val(formatDate(data.createTime));
                            body.find("#withdrawDepositFee").val(formatMoney(data.withdrawDepositFee, 2));
                            body.find("#withdrawDepositSingleFee").val(formatMoney(data.withdrawDepositSingleFee, 2));

                            if (data.remitStatus == 1) {
                                body.find("#remitStatus").val('已清算');
                            }
                            if (data.remitStatus == 0) {
                                body.find("#remitStatus").val('未清算');
                            }
                            if (data.remitStatus == 2) {
                                body.find("#remitStatus").val('清算中');
                            }
                            if (data.remitStatus == 3) {
                                body.find("#remitStatus").val('清算失败');
                            }
                            body.find("#remitType").val(data.remitType == 1 ? '实时代付' : '批量代付');

                            if (data.businessType == 1) {
                                body.find("#businessType").val('POS');

                            }
                            if (data.businessType == 2) {
                                body.find("#businessType").val('二维码');
                            }
                            if (data.businessType == 3) {
                                body.find("#businessType").val('快捷');
                            }
                            body.find("#businessType").val(data.businessType == 1 ? 'pos' : '二维码');
                            body.find("#riskDay").val(data.riskDay == 1 ? 'T1' : 'D0');
                            if (data.handleStatus == 1) {
                                body.find("#handleStatus").val('已处理');
                            }
                            if (data.handleStatus == 0) {
                                body.find("#handleStatus").val('未处理');
                            }
                            if (data.handleStatus == 2) {
                                body.find("#handleStatus").val('处理中');
                            }
                            if (data.handleStatus == 3) {
                                body.find("#handleStatus").val('无需处理');
                            }

                        }
                    });
                    break;
            }
        });
        //查询按钮
        form.on('submit(table-search)', function (data) {
            console.log(data.field);
            if(data.field.merchNo==null||data.field.merchNo==""){
                layer.msg("请填写商户号");
            }
            if(data.field.remitDate==null||data.field.remitDate==""){
                layer.msg("请填写清算时间");
            }
            var field = data.field;
            getData(field);

        });
        //工具栏按钮,基本功能:新增,批量删除以及重置.新功能基本都在此处理
        var active = {
            //批量删除
            batchdel: function () {
                var data = selectMore(table, 'table-data');
                if (null == data) {
                    return;
                }
                layer.confirm('确定删除吗？', {icon: 3, title: '提示'}, function (index) {
                    var ids = [];
                    for (var i = 0; i < data.length; i++) {
                        ids[i] = data[i].id;
                    }
                    $.ajax({
                        type: "post"
                        , url: "/termActivityAgent/batchDelete"
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
                dialog('新增助代通代理商返还表', '/termActivityAgent/addPage', '30%', '60%', 'add-submit', function (index, field) {
                    $.ajax({
                        type: "post"
                        , url: "/termActivityAgent/add"
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
                    "merchNo": ""
                    , "remitDate": date

                })
            }
        };
        //监听工具栏按钮操作
        $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        exports('remit', {})
    })

});

