package com.posp.ui.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.posp.common.service.user.ao.MenuAO;
import com.posp.common.service.user.bo.MenuBO;
import com.posp.common.service.user.query.RoleMenuQuery;
import com.posp.tool.common.data.UuidUtil;
import com.posp.ui.dao.IMenuMapper;
import com.posp.ui.service.IRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.posp.common.service.user.entyty.MenuDO;
import com.posp.common.service.user.entyty.RoleMenuDO;
import com.posp.common.service.user.query.MenuQuery;
import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import com.posp.ui.entity.MenuVO;
import com.posp.ui.service.IMenuService;
import com.posp.ui.util.Constant;

/**
 * 菜单服务包装接口实现类
 *
 * @author 高峰
 * @version v1.0.1, 2018/09/06  02:11:03 下午
 */
@Service
public class MenuServiceImpl implements IMenuService {
    @Autowired
    private IMenuMapper menuMapper;
    @Autowired
    private IRoleMenuService roleMenuService;
    @Override
    public List<MenuVO> listByUserId(String userId) {
        List<MenuDO> list = null;

        // 管理员是没有配置菜单数据的，获取全部菜单,最高权限
        if (Constant.SUPER_ADMIN.equals(userId)) {
            list = listPage(new MenuQuery());
        } else {
            list =selectByUserId(userId);
        }

        if ((null == list) || list.isEmpty()) {
            return null;
        }

        // 转换菜单
        List<MenuVO> menuList = new ArrayList<>();

        for (MenuDO menu : list) {
            menuList.add(new MenuVO(menu, false));
        }

        return menuList;
    }

    @Override
    public List<MenuVO> listByUserIdForRole(String userId) {
        List<MenuDO> list= null;

        // 管理员是没有配置菜单数据的，获取全部菜单,最高权限
        if (Constant.SUPER_ADMIN.equals(userId)) {
            list =listPage(new MenuQuery());
        } else {
            list = selectByUserId(userId);
        }

        if ((null == list) || list.isEmpty()) {
            return null;
        }

        // 转换菜单
        List<MenuVO> menuList = new ArrayList<>();

        for (MenuDO menu : list) {
            menuList.add(new MenuVO(menu, true));
        }

        return menuList;
    }

    /**
     * 内部方法，设置树形结构选中节点,分配菜单功能使用
     *
     * @param treeList
     * @param selectList
     * @return
     * @version v1.0.1, 2018/09/10 11:42:30 下午
     * @author gaofeng
     */
    List<MenuVO> setSelect(List<MenuVO> treeList, List<RoleMenuDO> selectList) {
        for (MenuVO menu : treeList) {
            for (RoleMenuDO select : selectList) {
                if (menu.getValue().equals(select.getMenuId())) {
                    menu.setChecked(true);
                    break;
                }
            }
        }
        return treeList;
    }

    @Override
    public List<MenuVO> setSelect(String roleId, List<MenuVO> menuList) {
        // 获取角色的菜单列表
        RoleMenuQuery query = new RoleMenuQuery();
        query.setRoleId(roleId);
        List<RoleMenuDO> selectList = roleMenuService.listPage(query);

        if ((null == selectList) || selectList.isEmpty()) {
            return menuList;
        }

        // 设置选中节点
        return setSelect(menuList, selectList);
    }


    @Override
    public int delete(String id) throws DataAccessException {
        return menuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(MenuAO record) throws DataAccessException {
        MenuDO entity = new MenuDO();

        entity.setId(UuidUtil.getUuid());
        entity.setParentId(record.getParentId());
        entity.setName(record.getName());
        entity.setUrl(record.getUrl());
        entity.setPerms(record.getPerms());
        entity.setType(record.getType());
        entity.setIcon(record.getIcon());
        entity.setSortNo(record.getSortNo());
        entity.setRemark(record.getRemark());
        entity.setCreateUserId(record.getCreateUserId());
        entity.setCreateTime(new Date());
        entity.setLastUserId(record.getLastUserId());
        entity.setLastModTime(new Date());

        return menuMapper.insert(entity);
    }

    @Override
    public List<MenuDO> listPage(MenuQuery query) {
        PageHelper.startPage(query.getPageNumber(), query.getPageSize());
        //处理数据权限问题
        return menuMapper.selectByParam(query);
    }

    @Override
    public int update(MenuBO record) throws DataAccessException {
        MenuDO entity = new MenuDO();

        entity.setId(record.getId());
        entity.setParentId(record.getParentId());
        entity.setName(record.getName());
        entity.setUrl(record.getUrl());
        entity.setPerms(record.getPerms());
        entity.setType(record.getType());
        entity.setIcon(record.getIcon());
        entity.setSortNo(record.getSortNo());
        entity.setRemark(record.getRemark());
        entity.setLastUserId(record.getLastUserId());
        entity.setLastModTime(new Date());

        return menuMapper.updateByPrimaryKeySelective(entity);
    }

    @Override
    public MenuDO get(String id) throws DataAccessException {
        return menuMapper.selectByPrimaryKey(id);
    }

    @Override
    public int batchInsert(List<MenuAO> list) throws DataAccessException {
        List<MenuDO> entityList = new ArrayList<>();
        for (MenuAO record : list) {
            MenuDO entity = new MenuDO();
            entity.setId(UuidUtil.getUuid());
            entity.setParentId(record.getParentId());
            entity.setName(record.getName());
            entity.setUrl(record.getUrl());
            entity.setPerms(record.getPerms());
            entity.setType(record.getType());
            entity.setIcon(record.getIcon());
            entity.setSortNo(record.getSortNo());
            entity.setRemark(record.getRemark());
            entity.setCreateUserId(record.getCreateUserId());
            entity.setCreateTime(new Date());
            entity.setLastUserId(record.getLastUserId());
            entity.setLastModTime(new Date());
            entityList.add(entity);
        }
        return menuMapper.batchInsert(entityList);
    }

    @Override
    public int batchDelete(String[] ids) throws DataAccessException {
        return menuMapper.batchDelete(ids);
    }

    @Override
    public List<MenuDO> selectByUserId(String userId) throws DataAccessException {
        return menuMapper.selectByUserId(userId);
    }
}
