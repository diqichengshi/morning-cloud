package com.posp.ui.service.impl;

import com.github.pagehelper.PageHelper;
import com.posp.common.service.user.ao.RoleAO;
import com.posp.common.service.user.bo.RoleBO;
import com.posp.common.service.user.entyty.RoleDO;
import com.posp.common.service.user.query.RoleQuery;
import com.posp.message.common.constants.PermissionConstants;
import com.posp.message.common.exception.PospBusinessException;
import com.posp.tool.common.data.UuidUtil;
import com.posp.ui.dao.IRoleMapper;
import com.posp.ui.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 角色服务实现类
 *
 * @author auto generator
 * @date 2018/11/16 15:22:21
 */
@Service
public class RoleServiceImpl implements IRoleService {
    @Autowired
    IRoleMapper roleMapper;

    @Override
    public int delete(String id) throws DataAccessException {
        return roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(RoleAO record) throws DataAccessException, PospBusinessException {
        int count = roleMapper.selectByName(record.getName());
        if (count >= 1) {
            throw new PospBusinessException("角色名称已存在!");
        }

        RoleDO entity = new RoleDO();

        entity.setId(UuidUtil.getUuid());
        entity.setName(record.getName());
        entity.setStatus(record.getStatus());
        entity.setOrgCode(record.getOrgCode());
        entity.setRemark(record.getRemark());
        entity.setCreateUserId(record.getCreateUserId());
        entity.setCreateTime(new Date());
        entity.setLastUserId(record.getLastUserId());
        entity.setLastModTime(new Date());

        return roleMapper.insert(entity);
    }

    @Override
    public List<RoleDO> listPage(RoleQuery query) {
        PageHelper.startPage(query.getPageNumber(), query.getPageSize());
        //处理数据权限问题
        if (PermissionConstants.DATA_PERMISSION_1.equals(query.getPermissionType())) {
            query.setOrgCode(query.getOrganizeCode());
            return roleMapper.selectByParam(query);
        } else if (PermissionConstants.DATA_PERMISSION_3.equals(query.getPermissionType())) {
            query.setCreateUserId(query.getUserNo());
            return roleMapper.selectByParam(query);
        } else if (PermissionConstants.DATA_PERMISSION_2.equals(query.getPermissionType())) {
            return roleMapper.selectByParamAndOrg(query);
        } else if (PermissionConstants.DATA_PERMISSION_0.equals(query.getPermissionType())) {
            return roleMapper.selectByParam(query);
        }
        return null;
    }

    @Override
    public int update(RoleBO record) throws DataAccessException, PospBusinessException {
        RoleDO entity = new RoleDO();

        entity.setId(record.getId());
        entity.setName(record.getName());
        entity.setStatus(record.getStatus());
        entity.setOrgCode(record.getOrgCode());
        entity.setRemark(record.getRemark());
        entity.setLastUserId(record.getLastUserId());
        entity.setLastModTime(new Date());

        return roleMapper.updateByPrimaryKeySelective(entity);
    }

    @Override
    public RoleDO get(String id) throws DataAccessException {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int batchInsert(List<RoleAO> list) throws DataAccessException {
        List<RoleDO> entityList = new ArrayList<>();
        for (RoleAO record : list) {
            RoleDO entity = new RoleDO();

            entity.setId(UuidUtil.getUuid());
            entity.setName(record.getName());
            entity.setStatus(record.getStatus());
            entity.setOrgCode(record.getOrgCode());
            entity.setRemark(record.getRemark());
            entity.setCreateUserId(record.getCreateUserId());
            entity.setCreateTime(new Date());
            entity.setLastUserId(record.getLastUserId());
            entity.setLastModTime(new Date());
            entityList.add(entity);
        }

        return roleMapper.batchInsert(entityList);
    }

    @Override
    public int batchDelete(String[] ids) throws DataAccessException {
        return roleMapper.batchDelete(ids);
    }

    @Override
    public List<RoleDO> selectByUserId(String userId) throws DataAccessException {
        return roleMapper.selectByUserId(userId);
    }
}
