package com.morning.shop.product.service.impl;


import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.base.BasePageDTO;
import com.morning.common.base.PageInfo;
import com.morning.common.service.shop.product.entity.Product;
import com.morning.common.service.shop.product.entity.Question;
import com.morning.shop.product.dao.ProductMapper;
import com.morning.shop.product.dao.QuestionMapper;
import com.morning.shop.product.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：QuestionServiceImpl
 * 类描述：Question / 提问表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月25日 下午7:31:17
 */
@Service("questionService")
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question> implements IQuestionService {

    @Autowired
    private QuestionMapper questionMapper;
    @Autowired
    private ProductMapper productMapper;

    @Override
    public Integer insertQuestion(Question question) {
        String productId = question.getProductId();
        Product product = productMapper.selectById(productId);
        if (product != null) {
            // question.setProductId(productId);
            question.setCreateTime(new Date());
            question.setCreateBy(question.getUserName());
            return questionMapper.insert(question);
        } else {
            // TODO 抛出一个商品不存在的异常
            return null;
        }
    }

    @Override
    public BasePageDTO<Question> listByProductId(String productId, Integer status, PageInfo pageInfo) {
      /*  Page<Question> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
        List<Question> questions = questionMapper.listByProductId(productId, status, pageInfo);
        pageInfo.setTotal(page.getTotal());
        return new BasePageDTO<Question>(pageInfo, questions);*/
      return null;
    }

    @Override
    public Integer updateLike(String questionId) {
        questionMapper.updateLike(questionId);
        Question question = questionMapper.selectById(questionId);
        return question.getGoodCount();
    }
}
