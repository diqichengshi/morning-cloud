package com.posp.ui.dao;

import com.posp.common.service.user.entyty.PwdDetailDO;
import com.posp.common.service.user.query.PwdDetailQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 密码修改历史表数据库操作类
 *
 * @date 2018/12/05 22:43:44
 * @author auto generator
 */
@Mapper
public interface IPwdDetailMapper {

    /**
     * 根据主键ID删除记录
     *
     * @param id 主键
     * @return int 删除记录数
     */
    int deleteByPrimaryKey(String id);

    /**
     * 批量删除记录
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
    int insert(PwdDetailDO record);

    /**
     * 批量添加记录
     * @param list 记录列表
     * @return 添加记录数
     */
    int batchInsert(List<PwdDetailDO> list);

    /**
     * 添加属性有值的纪录
     *
     * @param record 记录
     * @return 添加记录数
     */
    int insertSelective(PwdDetailDO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query 查询条件
     * @return List<PwdDetailDO> 查询结果列表
     */
    List<PwdDetailDO> selectByParam(PwdDetailQuery query);

    /**
     * 根据[参数类]查询记录，本机构以及下属机构权限
     *
     * @param query 查询条件
     * @return List<UserDO> 查询结果列表
     */
    List<PwdDetailDO> selectByParamAndOrg(PwdDetailQuery query);

    /**
     * 根据主键ID查找记录
     *
     * @param id 主键
     * @return PwdDetail 查询结果列表
     */
    PwdDetailDO selectByPrimaryKey(String id);

    /**
     * 根据主键ID更新记录
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKey(PwdDetailDO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(PwdDetailDO record);


}
