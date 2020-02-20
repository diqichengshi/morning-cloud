package ${packageName}.service;

import org.springframework.dao.DataAccessException;

import ${commonPackageName}.ao.*;
import ${commonPackageName}.bo.*;
import ${commonPackageName}.entity.*;
import ${commonPackageName}.query.*;

import java.util.List;

/**
 * ${table.comments}服务接口类
 *
 * @date ${dateTime}
 * @author ${author}
 */
public interface I${table.bigCamelName}Service {

    /**
     * 删除指定ID的记录
     *
     * @param ${pkColumn.propertyName} pk主键
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date ${dateTime}
     * @author ${author}
     */
    int delete(${pkColumn.javaType} ${pkColumn.propertyName}) throws DataAccessException;

    /**
     * 添加记录
     *
     * @param record 记录
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date ${dateTime}
     * @author ${author}
     */
    int insert(${table.bigCamelName}AO record) throws DataAccessException;

    /**
     * 根据参数类查找记录[分页]
     *
     * @param query 查询条件
     * @return 查询记录列表
     * @throws DataAccessException 异常
     * @date ${dateTime}
     * @author ${author}
     */
    List<${table.bigCamelName}DO> listPage(${table.bigCamelName}Query query) throws DataAccessException;

    /**
     * 修改指定ID的记录
     *
     * @param record 记录
     * @return 修改记录数
     * @throws DataAccessException 异常
     * @date ${dateTime}
     * @author ${author}
     */
    int update(${table.bigCamelName}BO record) throws DataAccessException;

    /**
     * 获取指定Id的记录
     *
     * @param ${pkColumn.propertyName} pk主键
     * @return 查询结果记录对象
     * @throws DataAccessException 异常
     * @date ${dateTime}
     * @author ${author}
     */
    ${table.bigCamelName}DO get(${pkColumn.javaType} ${pkColumn.propertyName}) throws DataAccessException;

    /**
     * 批量添加记录
     *
     * @param list 添加记录里诶包
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date ${dateTime}
     * @author ${author}
     */
    int batchInsert(List<${table.bigCamelName}AO> list) throws DataAccessException;

    /**
     * 批量删除记录
     * @param ids 记录id数组
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date ${dateTime}
     * @author ${author}
     */
    int batchDelete(String[] ids) throws DataAccessException;

}
