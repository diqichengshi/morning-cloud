package com.morning.shop.product.web;

import java.util.List;
import java.util.Map;

import com.morning.common.service.shop.product.ao.CommentQueryAO;
import com.morning.common.service.shop.product.dto.ConmmentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.morning.common.base.MorningResult;
import com.morning.common.service.shop.product.entity.CommentReply;
import com.morning.shop.product.service.ICommentReplyService;
import com.morning.shop.product.service.ICommentService;


/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：CommentController
 * 类描述：商品评论表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年5月9日 下午12:29:33
 */
@RestController
@RequestMapping(value = "/shop/comment")
public class CommentController {

    @Autowired
    private ICommentService commentService;
    @Autowired
    private ICommentReplyService commentReplyService;

    /**
     * GET 商品评论列表
     *
     * @return
     */
    @GetMapping(value = "/list")
    public MorningResult list(CommentQueryAO queryAO) {
         List<ConmmentDTO> conmmentDTOList= commentService.queryProductConmmentList("",null);
         return null;
    }

    /**
     * PUT 点赞商品评价
     *
     * @return
     */
    @PutMapping(value = "/like")
    @ResponseBody
    public Object like(@RequestParam(value = "commentId", required = true) String commentId) {
        Integer goodCount = commentService.updateLike(commentId);
        return MorningResult.ok(goodCount);
    }

    /**
     * POST 评价回复
     *
     * @return
     */
    @PostMapping(value = "/reply")
    @ResponseBody
    public MorningResult reply(@RequestParam(value = "commentReply") CommentReply commentReply) {
        Integer count = commentReplyService.insertCommentReply(commentReply);
        return MorningResult.ok(count);
    }

    /**
     * PUT 点赞客服回复评价
     *
     * @return
     */
    @PutMapping(value = "/csLike")
    @ResponseBody
    public MorningResult csLike(@RequestParam(value = "commentReplyId", required = true) Long commentReplyId) {
        Integer goodCount = commentReplyService.updateLike(commentReplyId);
        return MorningResult.ok(goodCount);
    }
}
