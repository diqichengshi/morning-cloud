package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.base.*;
import com.morning.common.constant.ShopConstant;
import com.morning.common.constant.enums.ListNumEnum;
import com.morning.common.service.shop.product.dto.ConmmentDTO;
import com.morning.common.service.shop.product.dto.ConmmentDetailDTO;
import com.morning.common.service.shop.product.entity.Comment;
import com.morning.shop.product.dao.CommentMapper;
import com.morning.shop.product.dao.CommentReplyMapper;
import com.morning.shop.product.service.ICommentService;
import com.morning.shop.product.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：CommentServiceImpl
 * 类描述：Comment / 评价表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:16:30
 */
@Service("commentService")
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {

    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private CommentReplyMapper commentReplyMapper;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    @Autowired
    private IProductService productService;

    @Override
    public List<ConmmentDTO> queryProductConmmentList(String productId, PageInfo pageInfo) {
        if (null == pageInfo) {
            pageInfo = PageInfo.buildPageInfo(ListNumEnum.DEFAULT_LIST_OFFSET.getNum(), ListNumEnum.COMMENT_LIMIT.getNum());
        }
        // List<ConmmentDTO> conmmentDTOList = commentMapper.queryProductConmmentList(productId, pageInfo);
        List<ConmmentDTO> conmmentDTOList = commentMapper.queryProductConmmentList("", pageInfo); // 此处需要修改
        return conmmentDTOList;
    }

    @Override
    public ConmmentDetailDTO queryProductConmmentDetail(String productId) {
        PageInfo pageInfo = PageInfo.buildPageInfo(ListNumEnum.DEFAULT_LIST_OFFSET.getNum(), ListNumEnum.COMMENT_LIMIT.getNum());
        List<ConmmentDTO> conmmentDTOList = commentMapper.queryProductConmmentList(productId, pageInfo);
        ConmmentDetailDTO conmmentDetailDTO=new ConmmentDetailDTO();
        conmmentDetailDTO.setGoodAnalyse(95);
        conmmentDetailDTO.setConmmentTags(ShopConstant.CONMMENT_TAGS);
        conmmentDetailDTO.setConmmentList(conmmentDTOList);
        return conmmentDetailDTO;
    }

    @Override
    public Integer updateLike(String commentId) {
        Comment comment = commentMapper.selectById(commentId);
        if (comment != null) {
            comment.setGoodCount(comment.getGoodCount() + 1);
            commentMapper.updateById(comment);
            return comment.getGoodCount();
        } else {
            // TODO 抛出一个评论不存在异常
            return null;
        }
    }

}
