/**
 * 交易摘要表页面相关处理js
 *
 * @author admin
 * @date 2019/09/01 17:25:06
 */
layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    table.render({
        elem: '#table-data'
        , method: 'post'
        , url: '/remitFlow/list'
        , cols: [[
            {field: 'id', title: '主键', align: 'center', minWidth: 1, hide: true}
            , {field: 'accountName', title: '开户人姓名', align: 'center', minWidth: 100}
            , {
                field: 'accountType', title: '账户类型', minWidth: 80, align: 'center', templet: function (d) {
                    var html = null;
                    if (d.accountType == 'G') {
                        html = '<span class="layui-badge layui-bg-green">对公</span>';
                    }
                    else if (d.accountType == 'S') {
                        html = '<span class="layui-badge">对私</span>';
                    }
                    return html;
                }
            }
            , {field: 'bankName', title: '银行名称', align: 'center', minWidth: 200}
            , {field: 'accountNoMask', title: '卡号', align: 'center', minWidth: 200}
            , {field: 'remitAmount', title: '清算金额(元)', align: 'center', minWidth: 200, templet: function (d) {
            	 if (d.remitAmount != null) {
	                    var reAmt =  "￥" + formatMoney(d.remitAmount, 2);
	                    var html = '<font color="#00A600">'+reAmt+'</font>';
	                    return html;
	                }else{
	                    return '';
	                }
         		}
            }
            , {field: 'receiveAmount', title: '收款到账金额(元)', align: 'center', minWidth: 200, templet: function (d) {
	                if (d.receiveAmount != null) {
	                    var reAmt =  "￥" + formatMoney(d.receiveAmount, 2);
	                    var html = '<font color="#00A600">'+reAmt+'</font>';
	                    return html;
	                }else{
	                    return '';
	                }
            	}
            }
            , {field: 'remitStatus', title: '清算状态', align: 'center', minWidth: 80, templet: function (d) {
	            	var html;
	                if (d.remitStatus == '0') {
	                    html = '<span>未清算</span>'
	                } else if (d.remitStatus == '1') {
	                    html = '<span>已清算</span>'
	                } else if (d.remitStatus == '2') {
	                    html = '<span>清算中</span>'
	                } else if (d.remitStatus == '3') {
	                    html = '<span>清算失败</span>'
	                } else {
	                    html = '<span></span>'
	                }
	                return html;
	            }
        	}
            , {field: 'remitFlowUuid', title: '清算流水号', align: 'center', minWidth: 300}
            , {field: 'walletFlowUuid', title: '钱包流水号', align: 'center', minWidth: 300}
            , {field: 'traceNo', title: '系统跟踪号', align: 'center', minWidth: 160}
            , {field: 'remitFlowNo', title: '流水号', align: 'center', minWidth: 160}
            , {field: 'origFlowNo', title: '原流水号', align: 'center', minWidth: 160}
            , {field: 'createTime', title: '创建时间', align: 'center', minWidth: 200, templet: function (d) {
	                if (d.createTime != null) {
	                    return formatDate(d.createTime);
	                }else{
	                    return '';
	                }
	            }
            }
        ]]
        , page: true
        , limit: 10
        , limits: [10, 20, 30, 40, 50, 75, 100]
        , text: {none: '暂无数据'}
    });

    //查询按钮
    form.on('submit(table-search)', function (data) {
        var field = data.field;
        table.reload('table-data', {
            where: field,
            page:1
        });
    });
    //工具栏按钮,基本功能:新增,批量删除以及重置.新功能基本都在此处理
    var active = {
        //重置,新增的查询条件记得在此处清空
        reset: function () {
            //form-search 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
            form.val("form-search", {
                "agentId":""
                ,"merchId":""
                ,"cardNo":""
                ,"beginRemitDate":""
                ,"endRemitDate":""
            })
        }
    };
    //监听工具栏按钮操作
    $('.layui-btn.layuiadmin-btn-admin').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    exports('remitFlow', {})
});