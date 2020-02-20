package com.posp.ui.dao;

import com.posp.common.service.user.bo.UserMerchantBO;
import com.posp.common.service.user.entyty.UserMerchantDO;
import com.posp.common.service.user.query.UserMerchantQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 商户用户表数据库操作类
 *
 * @author auto generator
 * @date 2018/12/04 13:45:33
 */
@Mapper
public interface IUserMerchantMapper {

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
    int insert(UserMerchantDO record);

    /**
     * 批量添加记录
     *
     * @param list 记录列表
     * @return 添加记录数
     */
    int batchInsert(List<UserMerchantDO> list);

    /**
     * 添加属性有值的纪录
     *
     * @param record 记录
     * @return 添加记录数
     */
    int insertSelective(UserMerchantDO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query 查询条件
     * @return List<UserMerchantDO> 查询结果列表
     */
    List<UserMerchantDO> selectByParam(UserMerchantQuery query);

    /**
     * 根据[参数类]查询记录，本机构以及下属机构权限
     *
     * @param query 查询条件
     * @return List<UserMerchantDO> 查询结果列表
     */
    List<UserMerchantDO> selectByParamAndOrg(UserMerchantQuery query);

    /**
     * 根据主键ID查找记录
     *
     * @param id 主键
     * @return UserMerchant 查询结果列表
     */
    UserMerchantDO selectByPrimaryKey(String id);

    /**
     * 根据手机号查找记录
     *
     * @param mobileEncrypt 手机号密文
     * @return UserMerchant 查询结果列表
     */
    UserMerchantDO selectByMobile(String mobileEncrypt);

    /**
     * 根据主键ID更新记录
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKey(UserMerchantDO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(UserMerchantDO record);

    int updateMerch(UserMerchantBO userMerchantBO);

    UserMerchantDO getByUserName(String userName);

    /**
     * 根据手机密文查询
     */
    List<UserMerchantDO> getByMobileEncrypt(@Param("mobileEncrypt") String mobileEncrypt);
}
