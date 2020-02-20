package com.posp.ui.dao;

import com.posp.common.service.user.entyty.DbTableColumnDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: gaofeng
 * @create: 2018-08-30 23:03:21
 * @description: 数据库表类dao类
 */
@Mapper
public interface ITableColumnMapper {
    List<DbTableColumnDO> selectByName(@Param(value = "name") String name);
}