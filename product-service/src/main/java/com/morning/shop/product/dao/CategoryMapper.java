package com.morning.shop.product.dao;

import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.morning.common.service.shop.product.entity.Category;
import com.morning.common.service.shop.product.vo.CategoryVO;
import com.morning.common.tree.TreeNode;

/**
 * 项目名称：morning-product-service
 * 类名称：CategoryMapper
 * 类描述：Category / 分类表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月12日 下午4:22:44
 */
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {

    /**
     * 根据状态/类目类型/显示广告数量/是否置顶查找显示置顶分类列表
     *
     * @param status       状态
     * @param type         目录类型
     * @param advertNumber 显示广告数量
     * @param showInTop    是否置顶
     * @param date         广告时间
     * @return
     */
    List<CategoryVO> listTopAndAdvert(@Param("status") Integer status, @Param("type") Integer type,
                                      @Param("advertNumber") Integer advertNumber, @Param("showInTop") Integer showInTop,
                                      @Param("date") Date date);

    /**
     * 根据状态/类目类型/显示广告数量/是否置顶查找显示置顶分类列表
     *
     * @param status       状态
     * @param type         目录类型
     * @param advertNumber 显示广告数量
     * @param showInTop    是否置顶
     * @param date         广告时间
     * @return
     */
    List<Category> selectTopList(@Param("status") Integer status, @Param("showInTop") Integer showInTop);


    /**
     * 根据是否导航/类目类型/导航状态/导航显示数量查找显示导航分类
     *
     * @param showInNav 是否导航
     * @param type      类目类型
     * @param status    类目状态
     * @param navNumber 显示数量
     * @return
     */
    List<CategoryVO> listNav(@Param("showInNav") Integer showInNav, @Param("type") Integer type,
                             @Param("status") Integer status, @Param("navNumber") Integer navNumber);


    List<TreeNode> selectTreeNodeList();

    List<TreeNode> selectByParentId(@Param("parentId") String parentId);
}