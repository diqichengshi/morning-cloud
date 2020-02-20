package com.posp.ui.dao;

import com.posp.common.service.user.entyty.LogDO;
import com.posp.common.service.user.query.LogQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 操作日志数据库操作类
 *
 * @date 2018/11/16 13:40:42
 * @author auto generator
 */
@Mapper
public interface ILogMapper {

    /**
     * 根据主键ID删除记录
     *
     * @param id 主键
     * @return int 删除记录数
     */
    int deleteByPrimaryKey(String id);

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
    int insert(LogDO record);

    /**
     * 批量添加记录
     * @param list 记录列表
     * @return 添加记录数
     */
    int batchInsert(List<LogDO> list);

    /**
     * 添加属性有值的纪录
     *
     * @param record 记录
     * @return 添加记录数
     */
    int insertSelective(LogDO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query 查询条件
     * @return List<LogDO> 查询结果列表
     */
    List<LogDO> selectByParam(LogQuery query);

    /**
     * 根据[参数类]查询记录，本机构以及下属机构权限
     *
     * @param query 查询条件
     * @return List<LogDO> 查询结果列表
     */
    List<LogDO> selectByParamAndOrg(LogQuery query);

    /**
     * 根据主键ID查找记录
     *
     * @param id 主键
     * @return Log 查询结果列表
     */
    LogDO selectByPrimaryKey(String id);

    /**
     * 根据主键ID更新记录
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKey(LogDO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(LogDO record);
}
