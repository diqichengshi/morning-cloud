package com.posp.ui.dao;

import com.posp.common.service.user.entyty.PcuserDO;
import com.posp.common.service.user.entyty.UserAgentDO;
import com.posp.common.service.user.query.PcuserQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户表数据库操作类
 *
 * @date 2018/12/06 14:22:13
 * @author auto generator
 */
@Mapper
public interface IPcuserMapper {

    /**
     * 根据主键ID删除记录
     *
     * @param id 主键
     * @return int 删除记录数
     */
    int deleteByPrimaryKey(Long id);

    /**
     * 批量删除记录
     * @param ids 记录id数组
     * @return 删除记录数
     */
    int batchDelete(@Param("ids") Long[] ids);

    /**
     * 添加纪录
     *
     * @param record 记录
     * @return int 添加记录数
     */
    int insert(PcuserDO record);

    /**
     * 批量添加记录
     * @param list 记录列表
     * @return 添加记录数
     */
    int batchInsert(List<PcuserDO> list);

    /**
     * 添加属性有值的纪录
     *
     * @param record 记录
     * @return 添加记录数
     */
    int insertSelective(PcuserDO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query 查询条件
     * @return List<PcuserDO> 查询结果列表
     */
    List<PcuserDO> selectByParam(PcuserQuery query);

    /**
     * 根据[参数类]查询记录，本机构以及下属机构权限
     *
     * @param query 查询条件
     * @return List<OrganizeDO> 查询结果列表
     */
    List<PcuserDO> selectByParamAndOrg(PcuserQuery query);

    /**
     * 根据主键ID查找记录
     *
     * @param id 主键
     * @return Pcuser 查询结果列表
     */
    PcuserDO selectByPrimaryKey(Long id);

    /**
     * 根据用户号查询记录
     * @param userNo 登陆用户名
     * @return
     */
    PcuserDO selectByUserNo(@Param("userNo") String userNo);

    /**
     * 根据主键ID更新记录
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKey(PcuserDO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(PcuserDO record);
    //新增userAgent
    void insertUserAgent(UserAgentDO agent);
    /**
     * 获取用户信息
     * @param id
     * @return
     */
    PcuserDO selectUserInfo(long id);
}
