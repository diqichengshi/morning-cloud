package com.morning.shop.order.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.morning.common.service.shop.order.entity.OrderProduct;
import com.morning.common.service.shop.order.vo.OrderShoppingCartVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 项目名称：morning-order-service
 * 类名称：OrderProductMapper
 * 类描述：OrderProduct / 订单明细表 数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年5月10日 上午10:33:40
 */
@Mapper
public interface OrderProductMapper extends BaseMapper<OrderProduct> {

    /**
     * 创建订单明细表
     *
     * @param shoppingCartVOs 购物车选中商品
     * @param orderId         订单ID
     * @return
     */
    Integer insertProductList(@Param("shoppingCartVOList") List<OrderShoppingCartVO> shoppingCartVOList,
                              @Param("orderId") String orderId);

}