package com.morning.shop.product.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.morning.common.constant.RedisKey;
import com.morning.common.constant.enums.CategoryTypeEnum;
import com.morning.common.constant.enums.YesOrNotEnum;
import com.morning.common.util.JsonUtil;
import com.morning.common.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.entity.Category;
import com.morning.common.service.shop.product.vo.CategoryVO;
import com.morning.common.tree.TreeNode;
import com.morning.shop.product.dao.CategoryMapper;
import com.morning.shop.product.service.ICategoryService;

/**
 * 项目名称：morning-product-service
 * 类名称：CategoryServiceImpl
 * 类描述：Category / 分类表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月12日 下午4:24:19
 */
@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Override
    public List<CategoryVO> listTopAndAdvert(Integer showNumber, Integer advertNumber) {

        String redisCategoryVoList = redisTemplate.opsForValue().
                get(RedisKey.MORNING_INDEX + ":top_category_key");

        List<CategoryVO> categoryVoList = new ArrayList<>();
        if (StringUtil.isNotEmpty(redisCategoryVoList)) {
            categoryVoList = JsonUtil.toList(redisCategoryVoList, CategoryVO.class);
        } else {
            categoryVoList = categoryMapper.listTopAndAdvert(YesOrNotEnum.Y.getCode(),
                    CategoryTypeEnum.FIRST.getType(), advertNumber,
                    YesOrNotEnum.Y.getCode(), new Date());
            redisTemplate.opsForValue().set(RedisKey.MORNING_INDEX +
                    ":top_category_key", JsonUtil.toJsonStr(categoryVoList));
        }
        return categoryVoList;
    }

    @Override
    public List<TreeNode> queryCategoryAndAdvertList() {
        List<TreeNode> list = new ArrayList<>();
        List<TreeNode> treeNodeList1 = categoryMapper.selectByParentId("1");
        for (TreeNode n1 : treeNodeList1) {
            // 第二级
            List<TreeNode> treeNodeList2 = categoryMapper.selectByParentId(n1.getId());
            for (TreeNode n2 : treeNodeList2) {
                List<TreeNode> treeNodeList3 = categoryMapper.selectByParentId(n2.getId());
                n2.setChildren(treeNodeList3);
            }
            n1.setChildren(treeNodeList2);
            list.add(n1);
        }

        return list;
    }


    @Override
    public List<Category> selectTopList(Integer status, Integer showInTop) {
        return categoryMapper.selectTopList(status, showInTop);
    }
}
