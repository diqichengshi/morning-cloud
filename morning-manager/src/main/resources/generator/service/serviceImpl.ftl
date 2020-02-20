package ${packageName}.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.dao.DataAccessException;
import com.posp.message.common.constants.PermissionConstants;

import com.github.pagehelper.PageHelper;

import ${commonPackageName}.ao.*;
import ${commonPackageName}.bo.*;
import ${commonPackageName}.entity.*;
import ${commonPackageName}.query.*;

import ${packageName}.dao.*;
import ${packageName}.service.*;
import com.posp.tool.common.data.UuidUtil;

/**
 * ${table.comments}服务实现类
 *
 * @date ${dateTime}
 * @author ${author}
 */
@Service
@Slf4j
public class ${table.bigCamelName}ServiceImpl implements I${table.bigCamelName}Service {
    @Autowired
    I${table.bigCamelName}Mapper ${table.smallCamelName}Mapper;

    @Override
    public int delete(${pkColumn.javaType} ${pkColumn.propertyName}) throws DataAccessException {
        return ${table.smallCamelName}Mapper.deleteByPrimaryKey(${pkColumn.propertyName});
    }
    @Override
    public int insert(${table.bigCamelName}AO record) throws DataAccessException {
        ${table.bigCamelName}DO entity = new ${table.bigCamelName}DO();

        <#list columnList as item>
        <#if item.columnName == pkColumn.columnName>
            <#if item.javaType == "String">
        entity.set${item.propertyName?cap_first}(UuidUtil.getUuid());
            <#elseif item.javaType == "Long">
        entity.set${item.propertyName?cap_first}(UuidUtil.getNumUuid());
            <#else>
        entity.set${item.propertyName?cap_first}(record.get${item.propertyName?cap_first}());
            </#if>
        <#else>
            <#if item.propertyName =="createTime">
        entity.set${item.propertyName?cap_first}(new Date());
            <#elseif item.propertyName =="lastModTime">
        entity.set${item.propertyName?cap_first}(new Date());
            <#else>
        entity.set${item.propertyName?cap_first}(record.get${item.propertyName?cap_first}());
            </#if>
        </#if>
        </#list>

        return ${table.smallCamelName}Mapper.insert(entity);
    }
    @Override
    public List<${table.bigCamelName}DO> listPage(${table.bigCamelName}Query query) {
        PageHelper.startPage(query.getPageNumber(), query.getPageSize());
        //处理数据权限问题
        if (PermissionConstants.DATA_PERMISSION_1.equals(query.getPermissionType())) {
            query.setOrgCode(query.getOrganizeCode());
            return ${table.smallCamelName}Mapper.selectByParam(query);
        } else if (PermissionConstants.DATA_PERMISSION_3.equals(query.getPermissionType())) {
            query.setCreateUserId(query.getUserNo());
            return ${table.smallCamelName}Mapper.selectByParam(query);
        } else if (PermissionConstants.DATA_PERMISSION_2.equals(query.getPermissionType())) {
            return ${table.smallCamelName}Mapper.selectByParamAndOrg(query);
        } else if (PermissionConstants.DATA_PERMISSION_0.equals(query.getPermissionType())) {
            return ${table.smallCamelName}Mapper.selectByParam(query);
        }
        return null;
    }
    @Override
    public int update(${table.bigCamelName}BO record) throws DataAccessException {
        ${table.bigCamelName}DO entity = new ${table.bigCamelName}DO();

        <#list columnList as item>
            <#if item.propertyName =="createTime"|| item.propertyName == "createUserId">
            <#elseif item.propertyName =="lastModTime">
        entity.set${item.propertyName?cap_first}(new Date());
            <#else>
        entity.set${item.propertyName?cap_first}(record.get${item.propertyName?cap_first}());
            </#if>
        </#list>

        return ${table.smallCamelName}Mapper.updateByPrimaryKeySelective(entity);
    }
    @Override
    public ${table.bigCamelName}DO get(${pkColumn.javaType} ${pkColumn.propertyName}) throws DataAccessException {
        return ${table.smallCamelName}Mapper.selectByPrimaryKey(${pkColumn.propertyName});
    }

    @Override
    public int batchInsert(List<${table.bigCamelName}AO> list) throws DataAccessException {
        List<${table.bigCamelName}DO> entityList = new ArrayList<>();
        for (${table.bigCamelName}AO record : list) {
            ${table.bigCamelName}DO entity = new ${table.bigCamelName}DO();

        <#list columnList as item>
            <#if item.columnName == pkColumn.columnName>
                <#if item.javaType == "String">
            entity.set${item.propertyName?cap_first}(UuidUtil.getUuid());
                <#elseif item.javaType == "Long">
            entity.set${item.propertyName?cap_first}(UuidUtil.getNumUuid());
                <#else>
            entity.set${item.propertyName?cap_first}(record.get${item.propertyName?cap_first}());
                </#if>
            <#else>
                <#if item.propertyName =="createTime">
            entity.set${item.propertyName?cap_first}(new Date());
                <#elseif item.propertyName =="lastModTime">
            entity.set${item.propertyName?cap_first}(new Date());
                <#else>
            entity.set${item.propertyName?cap_first}(record.get${item.propertyName?cap_first}());
                </#if>
            </#if>
        </#list>
            entityList.add(entity);
        }

        return ${table.smallCamelName}Mapper.batchInsert(entityList);
    }

    @Override
    public int batchDelete(String[] ids) throws DataAccessException {
        return ${table.smallCamelName}Mapper.batchDelete(ids);
    }
}
