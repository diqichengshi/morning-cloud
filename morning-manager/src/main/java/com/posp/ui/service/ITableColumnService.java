package com.posp.ui.service;


import com.posp.common.service.user.entyty.DbTableColumnDO;

import java.util.List;


/**
 * @author: gaof
 * @create: 2018/4/28 16:42
 * @Description: 数据库表字段相关服务类
 */
public interface ITableColumnService {
    List<DbTableColumnDO> selectByName(String tableName);
}
