package com.posp.ui.dao;

import com.posp.common.service.user.entyty.MenuDO;
import com.posp.common.service.user.query.MenuQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单数据库操作类
 *
 * @date 2018/11/15 17:28:55
 * @author auto generator
 */
@Mapper
public interface IMenuMapper {

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
    int insert(MenuDO record);

    /**
     * 批量添加记录
     * @param list 记录列表
     * @return 添加记录数
     */
    int batchInsert(List<MenuDO> list);

    /**
     * 添加属性有值的纪录
     *
     * @param record 记录
     * @return 添加记录数
     */
    int insertSelective(MenuDO record);

    /**
     * 根据[参数类]查询记录
     *
     * @param query 查询条件
     * @return List<MenuDO> 查询结果列表
     */
    List<MenuDO> selectByParam(MenuQuery query);

    /**
     * 根据主键ID查找记录
     *
     * @param id 主键
     * @return Menu 查询结果列表
     */
    MenuDO selectByPrimaryKey(String id);

    /**
     * 根据主键ID更新记录
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKey(MenuDO record);

    /**
     * 更新属性有值的记录数据
     *
     * @param record 记录
     * @return int 更新记录数
     */
    int updateByPrimaryKeySelective(MenuDO record);
	
		    /**
     * 根据用户id查找所有的菜单
     *
     * @param userId
     * @return
     * @version v1.0.1, 2018/09/06  03:01:40 下午
     * @author 高峰
     */
    List<MenuDO> selectByUserId(String userId);
}
