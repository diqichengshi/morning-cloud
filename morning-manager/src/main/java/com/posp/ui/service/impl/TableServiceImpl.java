package com.posp.ui.service.impl;

import com.github.pagehelper.PageHelper;
import com.posp.common.service.user.entyty.DbTableDO;
import com.posp.common.service.user.query.TableQuery;
import com.posp.ui.dao.ITableMapper;
import com.posp.ui.service.ITableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: gaofeng
 * @create: 2018-08-30 23:05:16
 * @description: 数据库库表服务实现类
 */
@Service
public class TableServiceImpl implements ITableService {
    @Autowired
    ITableMapper tableMapper;

    @Override
    public List<DbTableDO> selectTableByName(TableQuery query) {
        PageHelper.startPage(query.getPageNumber(), query.getPageSize());
        return tableMapper.selectByName(query.getTableName());
    }

    @Override
    public DbTableDO getByTableName(String tableName) {
        return tableMapper.getByName(tableName);
    }
}
