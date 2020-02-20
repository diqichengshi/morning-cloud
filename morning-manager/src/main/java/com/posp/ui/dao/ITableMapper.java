package com.posp.ui.dao;

import com.posp.common.service.user.entyty.DbTableDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: gaofeng
 * @create: 2018-08-30 23:03:56
 * @description: 数据库表dao类
 */
@Mapper
public interface ITableMapper {
    /**
     * 查询表名称列表
     * @param tableName 查询条件
     * @return 返回列表
     */
    List<DbTableDO> selectByName(@Param(value = "tableName") String tableName);

    /**
     * 查询指定表结构
     * @param tableName 表名称
     * @return 返回DbTableDO
     */
    DbTableDO getByName(@Param(value = "tableName") String tableName);
}