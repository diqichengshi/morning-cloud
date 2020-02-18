package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.morning.common.service.shop.product.entity.CommentReply;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：CommentReplyMapper
 * 类描述：CommentReply / 评论回复表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月9日 下午12:50:18
 */
@Mapper
public interface CommentReplyMapper extends BaseMapper<CommentReply> {

    /**
     * 根据评论ID和状态查找回复列表（排序方式,官方回复最前,其次按回复顺序倒序）
     *
     * @param commentId 评论ID
     * @param status    评论状态
     * @return
     */
    List<CommentReply> listByCommentId(@Param("commentId") Long commentId, @Param("status") Integer status);
}