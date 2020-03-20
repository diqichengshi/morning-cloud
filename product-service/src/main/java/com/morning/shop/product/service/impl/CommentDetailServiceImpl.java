package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.ao.QueryCommentListAO;
import com.morning.common.service.shop.product.dto.ConmmentDetailDTO;
import com.morning.common.service.shop.product.dto.ConmmentDTO;
import com.morning.common.service.shop.product.entity.CommentDetail;
import com.morning.common.service.shop.product.entity.CommentSummary;
import com.morning.shop.product.dao.CommentDetailMapper;
import com.morning.shop.product.dao.CommentReplyMapper;
import com.morning.shop.product.service.ICommentDetailService;
import com.morning.shop.product.service.ICommentSummaryService;
import com.morning.shop.product.service.ISpecParamService;
import org.springframework.beans.BeanUtils;
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
public class CommentDetailServiceImpl extends ServiceImpl<CommentDetailMapper, CommentDetail> implements ICommentDetailService {

    @Autowired
    private CommentDetailMapper commentMapper;
    @Autowired
    private CommentReplyMapper commentReplyMapper;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    @Autowired
    private ISpecParamService specParamService;
    @Autowired
    private ICommentSummaryService commentSummaryService;
    @Override
    public ConmmentDTO queryConmmentList(QueryCommentListAO query){
        ConmmentDTO dto=new ConmmentDTO();
        // 查询汇总信息
        Wrapper summaryWapper=new EntityWrapper();
        summaryWapper.eq("product_id",query.getProductId());
        CommentSummary commentSummary= commentSummaryService.selectOne(summaryWapper);
        BeanUtils.copyProperties(commentSummary,dto);

        // 查询评论列表
        Page page = new Page(query.getReqPage(),query.getReqSize());
        List<ConmmentDetailDTO> list=commentMapper.selectConmmentListPage(page);
        for (ConmmentDetailDTO conmmentDetailDTO:list){
           String nameStitching= specParamService.querySpecParamNameStitching(conmmentDetailDTO.getSpecParamId());
           conmmentDetailDTO.setBuyType(nameStitching);
        }
        dto.setConmmentList(list);

        return dto;
    }

    @Override
    public ConmmentDTO queryProductConmmentDetail(String productId) {
       /* PageInfo pageInfo = PageInfo.buildPageInfo(ListNumEnum.DEFAULT_LIST_OFFSET.getNum(), ListNumEnum.COMMENT_LIMIT.getNum());
        List<ConmmentDTO> conmmentDTOList = commentMapper.queryProductConmmentList(productId, pageInfo);
        ConmmentDetailDTO conmmentDetailDTO=new ConmmentDetailDTO();
        conmmentDetailDTO.setGoodAnalyse(95);
        conmmentDetailDTO.setConmmentTags(ShopConstant.CONMMENT_TAGS);
        conmmentDetailDTO.setConmmentList(conmmentDTOList);
        return conmmentDetailDTO;*/
       return null;
    }

    @Override
    public Integer updateLike(String commentId) {
        CommentDetail comment = commentMapper.selectById(commentId);
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
