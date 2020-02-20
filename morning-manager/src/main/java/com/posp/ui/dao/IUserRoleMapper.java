package com.posp.ui.dao;

import com.posp.common.service.user.entyty.UserRoleDO;
import com.posp.common.service.user.query.UserRoleQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户-角色数据库操作类
 *
 * @author 高峰
 * @version v1.0.1, 2018/09/05  05:29:34 下午
 */
@Mapper
public interface IUserRoleMapper {

    /**
     * 根据主键ID删除记录
     *
     * @param id
     * @return int
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
     * 删除用户的所有角色
     *
     * @param userId
     * @return
     * @version v1.0.1, 2018/09/11  03:26:35 下午
     * @author 高峰
     */
    int deleteByUserId(String userId);

    /**
     * 删除这角色和用户的对应关系
     *
     * @param roleId
     * @return
     * @author wangjinli
     */
    int deleteByRoleId(String roleId);

    /**
     * 添加纪录
     *
     * @param record
     * @return int
     */
    int insert(UserRoleDO record);

    /**
     * 添加属性有值的纪录
     *
     * @param record
     * @return
     */
    int insertSelective(UserRoleDO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query
     * @return List<UserRoleDO>
     */
    List<UserRoleDO> selectByParam(UserRoleQuery query);

    /**
     * 根据主键ID查找记录
     *
     * @param id
     * @return UserRole
     */
    UserRoleDO selectByPrimaryKey(String id);

    /**
     * 根据主键ID更新记录
     *
     * @param record
     * @return int
     */
    int updateByPrimaryKey(UserRoleDO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record
     * @return int
     */
    int updateByPrimaryKeySelective(UserRoleDO record);

    /**
     * 根据用户id查角色id
     *
     * @param userId
     * @return list
     */
    List<String> selectRoleIdByUserId(String userId);

    /**
     * 根据角色id查用户id
     *
     * @param roleId
     * @return list
     */
    List<String> selectUserIdByRoleId(String roleId);
    
    /**
     * 用户不包含的角色
     * @param params
     * @return
     */
    public List<UserRoleDO> selectUserNotRoleOfChange(Map<String, Object> params);

    /**
     * 查询用户拥有的菜单ID
     * @param userName
     * @return
     */
    public List<String> selectRoleMenuIdByUserName(Map<String, Object> params);
    
    /**
     * 根据角色id查出用户名
     * @param roleId
     * @return
     */
    public List<String> selectUserNameByRoleId(List<String> roleId);


    int insertRole(UserRoleDO record);
    
}
