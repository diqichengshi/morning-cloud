package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.base.PageInfo;
import com.morning.common.service.shop.product.ao.CommentQueryAO;
import com.morning.common.service.shop.product.dto.ConmmentDTO;
import com.morning.common.service.shop.product.entity.Comment;
import com.morning.common.service.shop.product.vo.CommentVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：CommentMapper
 * 类描述：Comment / 评价表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:14:04
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {
    /**
     * productDetail 商品推荐列表
     * <p>根据传过来的商品Id获取商品商品评论列表<br>
     *
     * @param productId 商品productId
     * @return 商品推荐列表
     */
    List<ConmmentDTO> queryProductConmmentList(@Param("productId") String productId, @Param("pageInfo") PageInfo pageInfo);

}