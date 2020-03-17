package com.morning.shop.product.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.morning.common.base.MorningResult;
import com.morning.common.tree.TreeNode;
import com.morning.shop.product.service.ICategoryService;


/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：CategoryListController
 * 类描述：电子商城商品分类表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年4月13日 下午1:06:51
 */
@RestController
@RequestMapping(value = "/shop/category")
public class CategoryController {

    @Autowired
    private ICategoryService categoryService;

    /**
     * GET 类目列表
     *
     * @return
     */
    @GetMapping(value = "/queryCategoryAndAdvertList")
    public MorningResult queryCategoryAndAdvertList() {
        List<TreeNode> treeNodeList = categoryService.queryCategoryAndAdvertList();
        return MorningResult.ok(treeNodeList);
    }

}
