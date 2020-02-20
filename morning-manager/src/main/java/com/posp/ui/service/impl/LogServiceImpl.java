package com.posp.ui.service.impl;

import com.github.pagehelper.PageHelper;
import com.posp.common.service.user.ao.LogAO;
import com.posp.common.service.user.bo.LogBO;
import com.posp.common.service.user.entyty.LogDO;
import com.posp.common.service.user.query.LogQuery;
import com.posp.message.common.constants.PermissionConstants;
import com.posp.tool.common.data.UuidUtil;
import com.posp.tool.common.string.StringUtil;
import com.posp.ui.dao.ILogMapper;
import com.posp.ui.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 操作日志服务实现类
 *
 * @author auto generator
 * @date 2018/11/16 13:40:42
 */
@Service
public class LogServiceImpl implements ILogService {
    @Autowired
    ILogMapper logMapper;

    @Override
    public int delete(String id) throws DataAccessException {
        return logMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(LogAO record) throws DataAccessException {
        LogDO entity = new LogDO();
        //对于web-ui需要使用id更新操作，特殊处理一下
        if (StringUtil.isBlank(record.getId())) {
            entity.setId(UuidUtil.getUuid());
        } else {
            entity.setId(record.getId());
        }
        entity.setIp(record.getIp());
        entity.setUrl(record.getUrl());
        entity.setHttpMethod(record.getHttpMethod());
        entity.setClassMethod(record.getClassMethod());
        entity.setArgs(record.getArgs());
        entity.setCode(record.getCode());
        entity.setMessage(record.getMessage());
        entity.setRemark(record.getRemark());
        entity.setOrgCode(record.getOrgCode());
        entity.setCreateUserId(record.getCreateUserId());
        entity.setCreateTime(new Date());

        return logMapper.insert(entity);
    }

    @Override
    public List<LogDO> listPage(LogQuery query) {
        PageHelper.startPage(query.getPageNumber(), query.getPageSize());
        //处理数据权限问题
        if (PermissionConstants.DATA_PERMISSION_1.equals(query.getPermissionType())) {
            query.setOrgCode(query.getOrganizeCode());
            return logMapper.selectByParam(query);
        } else if (PermissionConstants.DATA_PERMISSION_3.equals(query.getPermissionType())) {
            query.setCreateUserId(query.getUserNo());
            return logMapper.selectByParam(query);
        } else if (PermissionConstants.DATA_PERMISSION_2.equals(query.getPermissionType())) {
            return logMapper.selectByParamAndOrg(query);
        } else if (PermissionConstants.DATA_PERMISSION_0.equals(query.getPermissionType())) {
            return logMapper.selectByParam(query);
        }
        return null;
    }

    @Override
    public int update(LogBO record) throws DataAccessException {
        LogDO entity = new LogDO();

        entity.setId(record.getId());
        entity.setIp(record.getIp());
        entity.setUrl(record.getUrl());
        entity.setHttpMethod(record.getHttpMethod());
        entity.setClassMethod(record.getClassMethod());
        entity.setArgs(record.getArgs());
        entity.setCode(record.getCode());
        entity.setMessage(record.getMessage());
        entity.setRemark(record.getRemark());
        entity.setOrgCode(record.getOrgCode());

        return logMapper.updateByPrimaryKeySelective(entity);
    }

    @Override
    public LogDO get(String id) throws DataAccessException {
        return logMapper.selectByPrimaryKey(id);
    }

    @Override
    public int batchInsert(List<LogAO> list) throws DataAccessException {
        List<LogDO> entityList = new ArrayList<>();
        for (LogAO record : list) {
            LogDO entity = new LogDO();

            entity.setId(UuidUtil.getUuid());
            entity.setIp(record.getIp());
            entity.setUrl(record.getUrl());
            entity.setHttpMethod(record.getHttpMethod());
            entity.setClassMethod(record.getClassMethod());
            entity.setArgs(record.getArgs());
            entity.setCode(record.getCode());
            entity.setMessage(record.getMessage());
            entity.setRemark(record.getRemark());
            entity.setOrgCode(record.getOrgCode());
            entity.setCreateUserId(record.getCreateUserId());
            entity.setCreateTime(new Date());
            entityList.add(entity);
        }

        return logMapper.batchInsert(entityList);
    }

    @Override
    public int batchDelete(String[] ids) throws DataAccessException {
        return logMapper.batchDelete(ids);
    }
}
