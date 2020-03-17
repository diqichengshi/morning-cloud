package com.morning.shop.order.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.base.PageInfo;
import com.morning.common.service.shop.order.entity.Order;
import com.morning.common.service.shop.order.vo.OrderVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 项目名称：morning-order-service
 * 类名称：OrderMapper
 * 类描述：Order / 订单表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 上午10:33:13
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {

    /**
     * 根据用户ID、订单状态列表、分页信息、搜索内容查找订单总记录数
     *
     * @param userId    用户ID
     * @param typeValue 订单状态列表
     * @param search    搜索内容
     * @return
     */
    Integer getCount(@Param("userId") String userId,/* @Param("typeValue") String typeValue,*/
                     @Param("search") String search);

    /**
     * 根据用户ID、订单状态列表、分页信息、搜索内容查找订单列表
     *
     * @param userId    用户ID
     * @param typeValue 订单状态列表
     * @param pageInfo  分页信息
     * @param search    搜索内容
     * @return
     */
    List<OrderVO> list(@Param("userId") String userId, /*@Param("typeValue") String typeValue,*/
                       @Param("pageInfo") PageInfo pageInfo, @Param("search") String search);

    /**
     * 根据用户ID、订单编号查找订单信息
     *
     * @param userId      用户ID
     * @param orderNumber 订单编号
     * @return
     */
    OrderVO getOrder(@Param("userId") String userId, @Param("orderId") String orderId);
}