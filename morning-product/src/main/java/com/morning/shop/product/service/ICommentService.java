package com.morning.shop.product.service;

import com.baomidou.mybatisplus.service.IService;
import com.morning.common.base.MorningResult;
import com.morning.common.base.BasePageDTO;
import com.morning.common.base.PageInfo;
import com.morning.common.service.shop.product.ao.CommentQueryAO;
import com.morning.common.service.shop.product.dto.ConmmentDTO;
import com.morning.common.service.shop.product.dto.ConmmentDetailDTO;
import com.morning.common.service.shop.product.entity.Comment;
import com.morning.common.service.shop.product.vo.CommentVO;

import java.util.List;
import java.util.Map;

/**
 * 项目名称：morning-product-facade
 * 类名称：ICommentService
 * 类描述：Comment / 评价表 业务逻辑层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:12:11
 */
public interface ICommentService extends IService<Comment> {
    /**
     * productDetail 商品评论列表
     * <p>根据传过来的商品Id获取商品评论列表<br>
     *
     * @param productId 商品productId
     * @return 商品评论列表
     */
    List<ConmmentDTO> queryProductConmmentList(String productId, PageInfo pageInfo);
    /**
     * productDetail 商品评论详情
     * <p>根据传过来的商品Id获取商品评论详情<br>
     *
     * @param productId 商品productId
     * @return 商品评论详情
     */
    ConmmentDetailDTO queryProductConmmentDetail(String productId);
    /**
     * 根据评价ID更新提问点赞数
     *
     * @param commentId 评价ID
     * @return
     */
    Integer updateLike(String commentId);

}
