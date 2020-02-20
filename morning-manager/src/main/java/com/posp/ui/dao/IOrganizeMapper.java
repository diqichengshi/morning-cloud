package com.posp.ui.dao;

import com.posp.common.service.user.bo.OrganizeBO;
import com.posp.common.service.user.entyty.OrganizeDO;
import com.posp.common.service.user.query.OrganizeQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 部门数据库操作类
 *
 * @author auto generator
 * @date 2018/11/20 14:06:21
 */
@Mapper
public interface IOrganizeMapper {

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
    int insert(OrganizeDO record);

    /**
     * 批量添加记录
     *
     * @param list 记录列表
     * @return 添加记录数
     */
    int batchInsert(List<OrganizeDO> list);

    /**
     * 添加属性有值的纪录
     *
     * @param record 记录
     * @return 添加记录数
     */
    int insertSelective(OrganizeDO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query 查询条件
     * @return List<OrganizeDO> 查询结果列表
     */
    List<OrganizeDO> selectByParam(OrganizeQuery query);

    /**
     * 根据[参数类]查询记录，本机构以及下属机构权限
     *
     * @param query 查询条件
     * @return List<OrganizeDO> 查询结果列表
     */
    List<OrganizeDO> selectByParamAndOrg(OrganizeQuery query);

    /**
     * 根据主键ID查找记录
     *
     * @param id 主键
     * @return Organize 查询结果列表
     */
    OrganizeDO selectByPrimaryKey(String id);

    /**
     * 根据主键ID更新记录
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKey(OrganizeDO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(OrganizeDO record);

    /**
     * 根据部门编号查询
     *
     * @param id 主键
     * @return Organize 查询结果列表
     */
    OrganizeDO selectByOrgCode(String code);

    /**
     * 根据部门编号查询子部门编号
     *
     * @param organizeCode
     * @return
     */
    List<String> selectAllCodeByOrgCode(String organizeCode);

    /**
     * 通过部门编码获取
     * @param code
     * @return
     */
    OrganizeDO getByCode(@Param("code") String code);

    int updateByCode(OrganizeBO record);
}
