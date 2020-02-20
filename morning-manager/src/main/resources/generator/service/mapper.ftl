package ${packageName}.dao;

import ${commonPackageName}.entity.*;
import ${commonPackageName}.query.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ${table.comments}数据库操作类
 *
 * @date ${dateTime}
 * @author ${author}
 */
@Mapper
public interface I${table.bigCamelName}Mapper {

    /**
     * 根据主键ID删除记录
     *
     * @param ${pkColumn.propertyName} 主键
     * @return int 删除记录数
     */
    int deleteByPrimaryKey(${pkColumn.javaType} ${pkColumn.propertyName});

    /**
     * 批量删除记录
     * @param ids 记录id数组
     * @return 删除记录数
     */
    int batchDelete(@Param("ids") String[] ids);

    /**
     * 添加纪录
     *
     * @param record 记录
     * @return int 添加记录数
     */
    int insert(${table.bigCamelName}DO record);

    /**
     * 批量添加记录
     * @param list 记录列表
     * @return 添加记录数
     */
    int batchInsert(List<${table.bigCamelName}DO> list);

    /**
     * 添加属性有值的纪录
     *
     * @param record 记录
     * @return 添加记录数
     */
    int insertSelective(${table.bigCamelName}DO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query 查询条件
     * @return List<${table.bigCamelName}DO> 查询结果列表
     */
    List<${table.bigCamelName}DO> selectByParam(${table.bigCamelName}Query query);

    /**
     * 根据[参数类]查询记录，本机构以及下属机构权限
     *
     * @param query 查询条件
     * @return List<${table.bigCamelName}DO> 查询结果列表
     */
    List<${table.bigCamelName}DO> selectByParamAndOrg(${table.bigCamelName}Query query);

    /**
     * 根据主键ID查找记录
     *
     * @param id 主键
     * @return ${table.bigCamelName} 查询结果列表
     */
    ${table.bigCamelName}DO selectByPrimaryKey(${pkColumn.javaType} ${pkColumn.propertyName});

    /**
     * 根据主键ID更新记录
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKey(${table.bigCamelName}DO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(${table.bigCamelName}DO record);
}
