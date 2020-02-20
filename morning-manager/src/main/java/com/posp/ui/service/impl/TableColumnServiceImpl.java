package com.posp.ui.service.impl;

import com.posp.common.service.user.entyty.DbTableColumnDO;
import com.posp.ui.dao.ITableColumnMapper;
import com.posp.ui.service.ITableColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: gaofeng
 * @create: 2018-08-30 23:01:36
 * @description: 数据库表字段服务实现类
 */
@Service
public class TableColumnServiceImpl implements ITableColumnService {
    @Autowired
    private ITableColumnMapper tableColumnMapper;

    @Override
    public List<DbTableColumnDO> selectByName(String tableName) {
        return tableColumnMapper.selectByName(tableName);
    }
}
