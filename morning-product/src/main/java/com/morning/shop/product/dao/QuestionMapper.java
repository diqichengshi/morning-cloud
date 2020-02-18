package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.base.PageInfo;
import com.morning.common.service.shop.product.entity.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * 项目名称：morning-product-service
 * 类名称：QuestionMapper
 * 类描述：Question / 提问表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月25日 下午7:30:56
 */
@Mapper
public interface QuestionMapper extends BaseMapper<Question> {

    /**
     * 根据商品ID和提问状态查找提问列表
     *
     * @param productId 商品ID
     * @param status    提问状态
     * @param pageInfo  分页信息
     * @param rowBounds 分页实体类
     * @return
     */
    List<Question> listByProductId(@Param("productId") String productId, @Param("status") Integer status,
                                   @Param("pageInfo") PageInfo pageInfo);

    /**
     * 根据提问ID更新提问点赞数
     *
     * @param questionId 提问ID
     * @return
     */
    Integer updateLike(String questionId);

}