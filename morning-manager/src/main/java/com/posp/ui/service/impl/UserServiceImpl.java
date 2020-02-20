package com.posp.ui.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.posp.common.service.user.ao.UserAO;
import com.posp.common.service.user.bo.UserBO;
import com.posp.common.service.user.query.UserQuery;
import com.posp.message.common.exception.PospBusinessException;
import com.posp.tool.common.data.UuidUtil;
import com.posp.tool.common.string.StringUtil;
import com.posp.ui.dao.IUserMapper;
import com.posp.ui.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.posp.common.service.user.entyty.RoleDO;
import com.posp.common.service.user.entyty.UserDO;
import com.posp.common.service.user.query.RoleQuery;
import com.posp.message.common.constants.PermissionConstants;
import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import com.posp.ui.entity.UserVO;
import com.posp.ui.service.IUserService;
import com.posp.ui.util.Constant;
import com.posp.ui.util.ShiroUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * 用户包装服务实现类
 *
 * @author 高峰
 * @version v1.0.1, 2018/09/06  02:05:16 下午
 */
@Service
@Slf4j
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserMapper userMapper;
    @Autowired
    private IRoleService roleService;

    @Override
    public List<RoleDO> listRolesById(String userId) {
        List<RoleDO> list= null;
        // 管理员是没有配置菜单数据的，获取全部菜单,最高权限
        if (Constant.SUPER_ADMIN.equals(userId)) {
            RoleQuery query = new RoleQuery();
            //权限相关属性
            query.setUserNo(ShiroUtil.getUserName());
            query.setOrganizeCode(ShiroUtil.getUserEntity().getOrgCode());
            query.setPermissionType(ShiroUtil.getUserEntity().getDataPermission());
            list = roleService.listPage(query);
        } else {
            list = listRolesById(userId);
        }
        if ((null == list) || list.isEmpty()) {
            return null;
        }
        return list;
    }

    @Override
    public UserVO getUserByName(String username) {

        UserDO user =   userMapper.getByUsername(username);
        UserVO loginUser = new UserVO(user);
        return loginUser;
    }

    @Override
    public List<RoleDO> listRolesByCreateUserId() {
        RespMsgDTO<List<RoleDO>> resp = null;
        RoleQuery query = new RoleQuery();
        query.setUserNo(ShiroUtil.getUserName());
        query.setPermissionType(PermissionConstants.DATA_PERMISSION_3);
       /* if(PermissionConstants.DATA_PERMISSION_0.equals(ShiroUtil.getUserEntity().getDataPermission())) {
            query.setPermissionType(ShiroUtil.getUserEntity().getDataPermission());
        }else{
            query.setUserNo(ShiroUtil.getUserName());
            query.setPermissionType(PermissionConstants.DATA_PERMISSION_3);
        }*/
        query.setStatus("1");
        // 是否为空
        List<RoleDO> list =roleService.listPage(query);
        if ((null == list) || list.isEmpty()) {
            return null;
        }
        return list;
    }

    @Override
    public int delete(String id) throws DataAccessException {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(UserAO record) throws DataAccessException, PospBusinessException {
        //判断用户名唯一
        UserDO user = userMapper.getByUsername(record.getUsername());
        if (null != user) {
            throw new PospBusinessException("用户名已存在!");
        }
        UserDO entity = new UserDO();

        entity.setId(UuidUtil.getUuid());
        entity.setUsername(record.getUsername());
        entity.setPassword(record.getPassword());
        entity.setEmail(record.getEmail());
        entity.setMobile(record.getMobile());
        entity.setName(record.getName());
        entity.setOrgCode(record.getOrgCode());
        entity.setStatus(record.getStatus());
        entity.setMobileAuthStatus(record.getMobileAuthStatus());
        entity.setRealAuthStatus(record.getRealAuthStatus());
        entity.setPwdErrorCnt(record.getPwdErrorCnt());
        entity.setLoginReserve(record.getLoginReserve());
        entity.setRegisterFrom(record.getRegisterFrom());
        entity.setDataPermission(record.getDataPermission());
        entity.setCreateUserId(record.getCreateUserId());
        entity.setCreateTime(new Date());
        entity.setLastUserId(record.getLastUserId());
        entity.setLastModTime(new Date());
        entity.setMobileEncrypt(record.getMobileEncrypt());
        entity.setDeleteStatus("0");
        entity.setKeyName(record.getKeyName());
        entity.setEmailAuthStatus("0");
        entity.setMobileAuthStatus("0");
        entity.setRealAuthStatus("0");
        entity.setStatus("1");
        entity.setIsOperate(record.getIsOperate());
        return userMapper.insert(entity);
    }
    @Override
    public String  insertUser(UserAO record) throws DataAccessException, PospBusinessException {
        //判断用户名唯一
        UserDO user = userMapper.getByUsername(record.getUsername());
        if (null != user) {
            throw new PospBusinessException("用户名已存在!");
        }
        UserDO entity = new UserDO();

        entity.setId(UuidUtil.getUuid());
        entity.setUsername(record.getUsername());
        entity.setPassword(record.getPassword());
        entity.setEmail(record.getEmail());
        entity.setMobile(record.getMobile());
        entity.setName(record.getName());
        entity.setOrgCode(record.getOrgCode());
        entity.setStatus(record.getStatus());
        entity.setMobileAuthStatus(record.getMobileAuthStatus());
        entity.setRealAuthStatus(record.getRealAuthStatus());
        entity.setPwdErrorCnt(record.getPwdErrorCnt());
        entity.setLoginReserve(record.getLoginReserve());
        entity.setRegisterFrom(record.getRegisterFrom());
        entity.setDataPermission(record.getDataPermission());
        entity.setCreateUserId(record.getCreateUserId());
        entity.setCreateTime(new Date());
        entity.setLastUserId(record.getLastUserId());
        entity.setLastModTime(new Date());
        entity.setMobileEncrypt(record.getMobileEncrypt());
        entity.setDeleteStatus("0");
        entity.setKeyName(record.getKeyName());
        entity.setEmailAuthStatus("0");
        entity.setMobileAuthStatus("0");
        entity.setRealAuthStatus("0");
        entity.setStatus("1");
        entity.setIsOperate(record.getIsOperate());
        userMapper.insert(entity);
        return  entity.getId();
    }
    @Override
    public List<UserDO> listPage(UserQuery query) {
        PageHelper.startPage(query.getPageNumber(), query.getPageSize());
        //处理数据权限问题
        if (PermissionConstants.DATA_PERMISSION_1.equals(query.getPermissionType())) {
            query.setOrgCode(query.getOrganizeCode());
            return userMapper.selectByParam(query);
        } else if (PermissionConstants.DATA_PERMISSION_3.equals(query.getPermissionType())) {
            query.setCreateUserId(query.getUserNo());
            return userMapper.selectByParam(query);
        } else if (PermissionConstants.DATA_PERMISSION_2.equals(query.getPermissionType())) {
            return userMapper.selectByParamAndOrg(query);
        } else if (PermissionConstants.DATA_PERMISSION_0.equals(query.getPermissionType())) {
            return userMapper.selectByParam(query);
        }
        return null;
    }

    @Override
    public int update(UserBO record) throws DataAccessException {
        UserDO entity = new UserDO();

        entity.setId(record.getId());
        entity.setUsername(record.getUsername());
        entity.setPassword(record.getPassword());
        entity.setEmail(record.getEmail());
        entity.setMobileEncrypt(record.getMobileEncrypt());
        entity.setMobile(record.getMobile());
        entity.setName(record.getName());
        entity.setOrgCode(record.getOrgCode());
        entity.setStatus(record.getStatus());
        entity.setMobileAuthStatus(record.getMobileAuthStatus());
        entity.setRealAuthStatus(record.getRealAuthStatus());
        entity.setPwdErrorCnt(record.getPwdErrorCnt());
        entity.setLoginReserve(record.getLoginReserve());
        entity.setRegisterFrom(record.getRegisterFrom());
        entity.setDataPermission(record.getDataPermission());
        entity.setLastUserId(record.getLastUserId());
        entity.setLastModTime(new Date());
        entity.setPasswordModifyTime(record.getPasswordModifyTime());
        entity.setLastLoginTime(record.getLastLoginTime());

        return userMapper.updateByPrimaryKeySelective(entity);
    }

    @Override
    public UserDO get(String id) throws DataAccessException {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public int batchInsert(List<UserAO> list) throws DataAccessException {
        List<UserDO> entityList = new ArrayList<>();
        for (UserAO record : list) {
            UserDO entity = new UserDO();
            entity.setId(UuidUtil.getUuid());
            entity.setUsername(record.getUsername());
            entity.setPassword(record.getPassword());
            entity.setEmail(record.getEmail());
            entity.setMobile(record.getMobile());
            entity.setName(record.getName());
            entity.setOrgCode(record.getOrgCode());
            entity.setStatus(record.getStatus());
            entity.setMobileAuthStatus(record.getMobileAuthStatus());
            entity.setRealAuthStatus(record.getRealAuthStatus());
            entity.setPwdErrorCnt(record.getPwdErrorCnt());
            entity.setLoginReserve(record.getLoginReserve());
            entity.setRegisterFrom(record.getRegisterFrom());
            entity.setDataPermission(record.getDataPermission());
            entity.setCreateUserId(record.getCreateUserId());
            entity.setCreateTime(new Date());
            entity.setLastUserId(record.getLastUserId());
            entity.setLastModTime(new Date());
            entityList.add(entity);
        }
        return userMapper.batchInsert(entityList);
    }
    @Override
    public int batchDelete(String[] ids) throws DataAccessException {
        return userMapper.batchDelete(ids);
    }

    @Override
    public UserDO getByUsername(String username) throws DataAccessException {
        return userMapper.getByUsername(username);
    }

    @Override
    public void updateByUserNameSelective(UserDO userDO) {
        userMapper.updateByUserNameSelective(userDO);
    }
}
