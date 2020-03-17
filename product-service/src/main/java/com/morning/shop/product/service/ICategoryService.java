package com.morning.shop.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.tree.TreeNode;
import com.morning.common.service.shop.product.entity.Category;
import com.morning.common.service.shop.product.vo.CategoryVO;

import java.util.List;

/**
 * 项目名称：morning-product-facade
 * 类名称：ICategoryService
 * 类描述：Category / 分类表 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月12日 下午4:21:11
 */
public interface ICategoryService extends IService<Category> {

    /**
     * 根据商品显示数量/广告数量查找显示置顶分类列表
     *
     * @param showNumber   商品显示数量
     * @param advertNumber 广告数量
     * @return
     */
    List<CategoryVO> listTopAndAdvert(Integer showNumber, Integer advertNumber);

    List<TreeNode> queryCategoryAndAdvertList();

    List<Category> selectTopList(Integer status, Integer showInTop);
}
