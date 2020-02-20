package com.posp.ui.dao;

import com.posp.common.service.user.entyty.RoleDO;
import com.posp.common.service.user.query.RoleQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色数据库操作类
 *
 * @author auto generator
 * @date 2018/11/16 15:22:21
 */
@Mapper
public interface IRoleMapper {

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
    int insert(RoleDO record);

    /**
     * 批量添加记录
     *
     * @param list 记录列表
     * @return 添加记录数
     */
    int batchInsert(List<RoleDO> list);

    /**
     * 添加属性有值的纪录
     *
     * @param record 记录
     * @return 添加记录数
     */
    int insertSelective(RoleDO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query 查询条件
     * @return List<RoleDO> 查询结果列表
     */
    List<RoleDO> selectByParam(RoleQuery query);

    /**
     * 根据[参数类]查询记录，本机构以及下属机构权限
     *
     * @param query 查询条件
     * @return List<RoleDO> 查询结果列表
     */
    List<RoleDO> selectByParamAndOrg(RoleQuery query);

    /**
     * 根据主键ID查找记录
     *
     * @param id 主键
     * @return Role 查询结果列表
     */
    RoleDO selectByPrimaryKey(String id);

    /**
     * 根据主键ID更新记录
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKey(RoleDO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(RoleDO record);

    /**
     * 获取指定userId的角色列表记录
     *
     * @param userId 用户登录id
     * @return
     */
    List<RoleDO> selectByUserId(String userId);

    /**
     * 判断角色名称重复性
     *
     * @param name 角色名称
     * @return
     */
    int selectByName(String name);

    /**
     * 根据部门编号获取角色id
     *
     * @param
     * @return
     */
    List<String> selectRoleIdIdByOrdCodes(List<String> list);

    /**
     * 将该角色置为无效
     *
     * @param
     * @return
     */
    int updateStatusByRoleId(String roleId);
}
