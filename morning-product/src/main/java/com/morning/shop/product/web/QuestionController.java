package com.morning.shop.product.web;


import java.util.Map;

import com.morning.common.constant.enums.YesOrNotEnum;
import org.apache.commons.lang.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.morning.common.base.BasePageDTO;
import com.morning.common.base.MorningResult;
import com.morning.common.base.PageInfo;
import com.morning.common.service.shop.product.entity.Question;
import com.morning.shop.product.service.IQuestionService;

/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：QuestionController
 * 类描述：商品提问表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年4月25日 下午2:46:22
 */
@RestController
@RequestMapping(value = "/shop/question")
public class QuestionController {

    @Autowired
    private IQuestionService questionService;

    /**
     * GET 商品详情页面商品提问
     *
     * @return
     */
    @GetMapping(value = "/askList")
    public MorningResult<BasePageDTO<Question>> askList(@RequestParam Map<String, Object> params, int offset, int limit) {
        String productId = ObjectUtils.toString(params.get("productId"));
        // 根据商品ID查找提问列表
        PageInfo pageInfo = PageInfo.buildPageInfo(offset, limit);

        BasePageDTO<Question> basePageDTO = questionService.listByProductId(
                productId, YesOrNotEnum.Y.getCode(), pageInfo);

        return MorningResult.ok(basePageDTO);
    }


    /**
     * POST 商品提问
     *
     * @return
     */
    @PostMapping(value = "/create")
    @ResponseBody
    public MorningResult<Integer> create(@RequestParam(value = "question") Question question) {
        Integer count = questionService.insertQuestion(question);
        return MorningResult.ok(count);
    }

    /**
     * PUT 点赞商品提问
     *
     * @return
     */
    @PutMapping(value = "/like")
    @ResponseBody
    public MorningResult<Integer> like(@RequestParam(value = "questionId", required = true) String questionId) {
        Integer goodCount = questionService.updateLike(questionId);
        return MorningResult.ok(goodCount);
    }
}
