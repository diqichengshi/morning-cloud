package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.entity.CommentReply;
import com.morning.shop.product.dao.CommentReplyMapper;
import com.morning.shop.product.service.ICommentReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 项目名称：morning-product-service
 * 类名称：CommentReplyServiceImpl
 * 类描述：CommentReply / 评论回复表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年5月9日 下午12:51:13
 */
@Service("commentReplyService")
public class CommentReplyServiceImpl extends ServiceImpl<CommentReplyMapper, CommentReply> implements ICommentReplyService {

    @Autowired
    private CommentReplyMapper commentReplyMapper;

    @Override
    public Integer updateLike(Long commentReplyId) {
        CommentReply commentReply = commentReplyMapper.selectById(commentReplyId);
        if (commentReply != null) {
            commentReply.setGoodCount(commentReply.getGoodCount() + 1);
            commentReplyMapper.updateById(commentReply);
            return commentReply.getGoodCount();
        } else {
            // TODO 抛出一个评论不存在异常
            return null;
        }
    }

    @Override
    public Integer insertCommentReply(CommentReply commentReply) {
        commentReply.setCreateTime(new Date());
        commentReply.setCreateBy(commentReply.getUserName());
        commentReply.setType(0);// 用户回复
        return commentReplyMapper.insert(commentReply);
    }
}
