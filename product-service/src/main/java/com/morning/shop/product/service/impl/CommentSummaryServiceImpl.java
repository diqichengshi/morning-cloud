package com.morning.shop.product.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.entity.CommentSummary;
import com.morning.shop.product.dao.CommentSummaryMapper;
import com.morning.shop.product.service.ICommentSummaryService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 评价汇总表 服务实现类
 * </p>
 *
 * @author 赵娟娟
 * @since 2020-03-20
 */
@Service
public class CommentSummaryServiceImpl extends ServiceImpl<CommentSummaryMapper, CommentSummary> implements ICommentSummaryService {

}
