package com.posp.ui.service;

import com.posp.common.service.user.entyty.DbTableDO;
import com.posp.common.service.user.query.TableQuery;

import java.util.List;

/**
 * @author: gaof
 * @create: 2018/4/28 13:07
 * @Description: 数据库表服务类
 */
public interface ITableService {
    /**
     * 查询表名称列表
     * @param query 查询条件
     * @return 返回列表
     */
    List<DbTableDO> selectTableByName(TableQuery query);

    /**
     * 查询指定表结构
     * @param tableName 表名称
     * @return 返回DbTableDO
     */
    DbTableDO getByTableName(String tableName);
}
