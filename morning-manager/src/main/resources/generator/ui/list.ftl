<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<head>
    <meta charset="utf-8"/>
    <title>运营管理系统-畅捷支付</title>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <link rel="stylesheet" th:href="@{/layui/css/layui.css}" media="all"/>
    <link rel="stylesheet" th:href="@{/style/admin.css}" media="all"/>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="form-search">
            <div class="layui-form-item">
            <#list columnList as item>
                <#if item.javaType == "String">
                <div class="layui-inline">
                    <label class="layui-form-label">${item.comments!""}</label>
                    <div class="layui-input-inline">
                        <input type="text" name="${item.propertyName}" placeholder="请输入" autocomplete="on" class="layui-input"/>
                    </div>
                </div>
            <#elseif item.javaType == "Date">
                <div class="layui-inline">
                    <label class="layui-form-label">${item.comments!""}</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="${item.propertyName}Start" name="${item.propertyName}Start" placeholder="开始日期" type="text"/>
                            <i class="layui-icon layui-icon-date"></i>
                    </div>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="${item.propertyName}End" name="${item.propertyName}End" placeholder="结束日期" type="text"/>
                            <i class="layui-icon layui-icon-date"></i>
                    </div>
                </div>
                </#if>
            </#list>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <button class="layui-btn layuiadmin-btn-comm" data-type="reload" lay-submit="submit"
                            lay-filter="table-search">
                        <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>查询
                    </button>
                    <button type="reset" class="layui-btn layui-btn-primary layuiadmin-btn-admin" data-type="reset">
                        <i class="layui-icon layui-icon-refresh layuiadmin-button-btn"></i>重置
                    </button>
                </div>
            </div>
        </div>
    <div class="layui-card-body">
        <div class="layui-btn-group">
            <shiro:hasPermission name="${table.smallCamelName}/add">
                <button class="layui-btn layuiadmin-btn-admin" data-type="add">
                    <i class="layui-icon layui-icon-add-1"></i>新增
                </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="${table.smallCamelName}/batchDelete">
                <button class="layui-btn layui-btn-danger layuiadmin-btn-admin" data-type="batchdel">
                    <i class="layui-icon layui-icon-delete"></i>批量删除
                </button>
            </shiro:hasPermission>
        </div>

        <table id="table-data" lay-filter="table-operation-filter"></table>
        <script type="text/html" id="table-operation">
            <shiro:hasPermission name="${table.smallCamelName}/detail">
                <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="detail"><i
                        class="layui-icon layui-icon-about"></i>详情</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="${table.smallCamelName}/edit">
                <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit"><i
                        class="layui-icon layui-icon-edit"></i>修改</a>
            </shiro:hasPermission>
            <shiro:hasPermission name="${table.smallCamelName}/delete">
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i
                        class="layui-icon layui-icon-delete"></i>删除</a>
            </shiro:hasPermission>
        </script>
    </div>
</div>
</div>

<script th:src="@{/layui/layui.js}"></script>
<script th:src="@{/modules/tool.js}"></script>
<script>
    layui.config({
        base: '/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'laydate', '${table.smallCamelName}'], function () {
        var laydate=layui.laydate;

        <#list columnList as item>
            <#if item.javaType == "Date">
        laydate.render({
            elem: '#${item.propertyName}Start'
            , format: 'yyyyMMdd'
        });
        laydate.render({
            elem: '#${item.propertyName}End'
            , format: 'yyyyMMdd'
        });
            </#if>
        </#list>
    });
</script>
</body>
</html>

