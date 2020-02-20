<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="com.posp.service.${serviceName}.dao.I${table.bigCamelName}Mapper">
    <resultMap id="BaseResultMap" type="${commonPackageName}.entity.${table.bigCamelName}DO">
        <#list columnList as item>
        <#if item.columnName=="ID">
        <${item.propertyName} column="${item.columnName}" property="${item.propertyName}" jdbcType="${item.jdbcType}"/>
        <#else>
        <result column="${item.columnName}" property="${item.propertyName}" jdbcType="${item.jdbcType}"/>
        </#if>
        </#list>
    </resultMap>
    <sql id="Base_Column_List">
        <#list columnList as item>${item.columnName}<#if item_has_next>,</#if></#list>
    </sql>
    <select id="selectByPrimaryKey" resultMap="BaseResultMap" parameterType="java.lang.${pkColumn.javaType}">
        SELECT <include refid="Base_Column_List"/> FROM ${table.tableName} WHERE ${pkColumn.columnName} = <#noparse>#{</#noparse>${pkColumn.propertyName},jdbcType=${pkColumn.jdbcType}}
    </select>
    <delete id="deleteByPrimaryKey" parameterType="java.lang.${pkColumn.javaType}">
        DELETE FROM ${table.tableName} WHERE ${pkColumn.columnName} = <#noparse>#{</#noparse>${pkColumn.propertyName},jdbcType=${pkColumn.jdbcType}}
    </delete>
    <insert id="insert" parameterType="${commonPackageName}.entity.${table.bigCamelName}DO">
        INSERT INTO ${table.tableName} (<#list columnList as item>${item.columnName}<#if item_has_next>,</#if></#list>)
        VALUES(<#list columnList as item><#noparse>#{</#noparse>${item.propertyName},jdbcType=${item.jdbcType}}<#if item_has_next>,</#if></#list>)
    </insert>
    <insert id="insertSelective" parameterType="${commonPackageName}.entity.${table.bigCamelName}DO">
        INSERT INTO ${table.tableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list columnList as item>
            <if test="${item.propertyName} != null">
                ${item.columnName}<#if item_has_next>,</#if>
            </if>
            </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list columnList as item>
            <if test="${item.propertyName} != null">
                <#noparse>#{</#noparse>${item.propertyName},jdbcType=${item.jdbcType}}<#if item_has_next>,</#if>
            </if>
            </#list>
        </trim>
    </insert>
    <update id="updateByPrimaryKeySelective" parameterType="${commonPackageName}.entity.${table.bigCamelName}DO">
        UPDATE ${table.tableName}
        <set>
            <#list columnList as item>
            <#if item.columnName != pkColumn.columnName>
            <if test="${item.propertyName} != null">
                ${item.columnName} = <#noparse>#{</#noparse>${item.propertyName},jdbcType=${item.jdbcType}}<#if item_has_next>,</#if>
            </if>
            </#if>
            </#list>
        </set>
        WHERE ${pkColumn.columnName} = <#noparse>#{</#noparse>${pkColumn.propertyName},jdbcType=${pkColumn.jdbcType}}
    </update>
    <update id="updateByPrimaryKey" parameterType="${commonPackageName}.entity.${table.bigCamelName}DO">
        UPDATE ${table.tableName}
        SET
            <#list columnList as item>
            <#if item.columnName != pkColumn.columnName>
            ${item.columnName} = <#noparse>#{</#noparse>${item.propertyName},jdbcType=${item.jdbcType}}<#if item_has_next>,</#if>
            </#if>
            </#list>
        WHERE ${pkColumn.columnName} = <#noparse>#{</#noparse>${pkColumn.propertyName},jdbcType=${pkColumn.jdbcType}}
    </update>
    <!--自定义分页查询条件-->
    <sql id="whereQueryParam">
    <#list columnList as item>
        <#if item.jdbcType=="TIMESTAMP">
        <if test="${item.propertyName}Start != null and ${item.propertyName}Start != ''">
            AND TO_CHAR(${item.columnName},'YYYYMMDD') &gt;= <#noparse>#{</#noparse>${item.propertyName}Start}
        </if>
        <if test="${item.propertyName}End != null and ${item.propertyName}End != ''">
            AND TO_CHAR(${item.columnName},'YYYYMMDD') &lt;= <#noparse>#{</#noparse>${item.propertyName}End}
        </if>
        <#else>
        <if test="${item.propertyName} != null and ${item.propertyName} != ''">
            AND ${item.columnName} = <#noparse>#{</#noparse>${item.propertyName}}
        </if>
        </#if>
    </#list>
    </sql>
    <!--自定义分页方法-->
    <select id="selectByParam" resultMap="BaseResultMap" parameterType="${commonPackageName}.query.${table.bigCamelName}Query">
        SELECT
        <include refid="Base_Column_List"/>
        FROM ${table.tableName}
        <where>
            <include refid="whereQueryParam"></include>
        </where>
    </select>
    <!--自定义分页方法-权限,本机构以及下属机构-->
    <select id="selectByParamAndOrg" resultMap="BaseResultMap" parameterType="${commonPackageName}.query.${table.bigCamelName}Query">
        SELECT
        <include refid="Base_Column_List"/>
        FROM ${table.tableName}
        <where>
            ORG_CODE IN (SELECT code FROM S_ORGANIZE WHERE INSTR(GROUP_CODES,<#noparse>#{</#noparse>organizeCode})>0)
            <include refid="whereQueryParam"></include>
        </where>
    </select>
    <!--批量删除-->
    <delete id="batchDelete" parameterType="java.util.List">
        DELETE FROM ${table.tableName} WHERE ID IN
        <foreach collection="ids" item="item" index="index" open="(" close=")" separator=",">
        <#noparse>#{</#noparse>item}
        </foreach>
    </delete>
    <!--批量新增-->
    <insert id="batchInsert" parameterType="java.util.List">
        INSERT INTO ${table.tableName} (<#list columnList as item>${item.columnName}<#if item_has_next>,</#if></#list>)
        SELECT a.* FROM (
        <foreach collection="list" item="item" index="index" separator="UNION ALL">
            SELECT
        <#list columnList as item>
            <#noparse>#{</#noparse>item.${item.propertyName},jdbcType=${item.jdbcType}}<#if item_has_next>,</#if>
        </#list>
            FROM dual
        </foreach>
        ) a
    </insert>
</mapper>