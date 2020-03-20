package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.morning.common.service.shop.product.ao.QueryCommentAO;
import com.morning.common.service.shop.product.dto.ConmmentDetailDTO;
import com.morning.common.service.shop.product.entity.CommentDetail;
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
public interface CommentDetailMapper extends BaseMapper<CommentDetail> {
    /**
     * productDetail 商品推荐列表
     *
     * @param page 分页参数
     * @param query 查询参数
     * @return 商品推荐列表
     */
    List<ConmmentDetailDTO> selectConmmentListPage(Page page,@Param("query") QueryCommentAO query);

}