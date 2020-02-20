package com.posp.ui.dao;

import com.posp.common.service.user.entyty.RoleMenuDO;
import com.posp.common.service.user.query.RoleMenuQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色-菜单数据库操作类
 *
 * @author auto generator
 * @date 2018/11/16 15:22:22
 */
@Mapper
public interface IRoleMenuMapper {

    /**
     * 根据主键ID删除记录
     *
     * @param id 主键
     * @return int 删除记录数
     */
    int deleteByPrimaryKey(String id);

    /**
     * 批量删除记录
     *
     * @param ids 记录id数组
     * @return 删除记录数
     */
    int batchDelete(@Param("ids") String[] ids);

    /**
     * 添加纪录
     *
     * @param record 记录
     * @return int 添加记录数
     */
    int insert(RoleMenuDO record);

    /**
     * 批量添加记录
     *
     * @param list 记录列表
     * @return 添加记录数
     */
    int batchInsert(List<RoleMenuDO> list);

    /**
     * 添加属性有值的纪录
     *
     * @param record 记录
     * @return 添加记录数
     */
    int insertSelective(RoleMenuDO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query 查询条件
     * @return List<RoleMenuDO> 查询结果列表
     */
    List<RoleMenuDO> selectByParam(RoleMenuQuery query);

    /**
     * 根据[参数类]查询记录，本机构以及下属机构权限
     *
     * @param query 查询条件
     * @return List<RoleMenuDO> 查询结果列表
     */
    List<RoleMenuDO> selectByParamAndOrg(RoleMenuQuery query);

    /**
     * 根据主键ID查找记录
     *
     * @param id 主键
     * @return RoleMenu 查询结果列表
     */
    RoleMenuDO selectByPrimaryKey(String id);

    /**
     * 根据主键ID更新记录
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKey(RoleMenuDO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(RoleMenuDO record);

    /**
     * 删除角色id的所有记录
     * @param roleId 角色id
     * @return
     */
    int deleteByRoleId(String roleId);

    /**
     * 根据角色id查出菜单id
     * @param list 角色id
     * @return
     */
    List<String> selectMenuIdByRoleId(List list);

    /**
     * 根据菜单id获取角色id
     * @param params 菜单id
     * @return
     */
    List<String> selectRoleIdIdByMenuId(Map<String, Object> params);

    /**
     * 根据角色Id和菜单id删除记录
     * @param params 角色id
     * @return
     */
    int deleteByRoleIdAndMenuId(Map<String, Object> params);

    /**
     * 用户角色不包含的菜单
     * @param params
     * @return
     */
    public List<RoleMenuDO> selectRoleNotMenuOfChange(Map<String, Object> params);

    /**
     * 查询包含角色的用户机构
     * @param params
     * @return
     */
    public List<HashMap<String,String>>  selectUsersByRoleIdOfChange(String roleId);

    /**
     * 查询要删除的角色与菜单
     * @param params
     * @return
     */
    public List<RoleMenuDO> selectUsersRoleIdOfChange(Map<String, Object> params);
}
