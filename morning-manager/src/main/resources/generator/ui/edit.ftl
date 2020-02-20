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
<div class="layui-form layui-form-pane" style="padding-top: 20px;margin-left: 10px;margin-right: 10px">
    <#list columnList as item>
        <#if item.propertyName == "status">
    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <select name="status">
                <option value="0" th:selected="${r'${entity?.'}status}=='0'">无效</option>
                <option value="1" th:selected="${r'${entity?.'}status}=='1'">有效</option>
            </select>
        </div>
    </div>
        <#elseif item.propertyName == "createTime"
            || item.propertyName == "lastUserId"
            || item.propertyName == "lastModTime"
            || item.propertyName == "createUserId">
        <#else>
    <div class="layui-form-item">
        <label class="layui-form-label">${item.comments!""}</label>
        <div class="layui-input-block">
            <input type="text" name="${item.propertyName}" th:value="${r'${entity?.'}${item.propertyName}${r'}'}" <#if item.propertyName==pkColumn.propertyName> disabled="disabled" </#if><#if item.nullable=="N">lay-verify="required"</#if> autocomplete="on" class="layui-input"/>
        </div>
    </div>
        </#if>
    </#list>
    <div class="layui-form-item layui-hide">
        <input type="button" lay-submit="submit" lay-filter="edit-submit" id="edit-submit" value="提交"/>
    </div>
</div>

<script th:src="@{/layui/layui.js}"></script>
<script>
    layui.config({
        base: '/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', '${table.smallCamelName}'], function () {
    });
</script>
</body>
</html>