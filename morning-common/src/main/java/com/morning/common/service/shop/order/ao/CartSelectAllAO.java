package com.morning.common.service.shop.order.ao;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.Data;

import java.io.Serializable;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：ShoppingCart   
* 类描述：ShoppingCart / 购物车选择表
* 创建人：赵娟娟
* 创建时间：2017年5月10日 下午3:54:27   
*
 */
@Data
public class CartSelectAllAO implements Serializable {

    private static final long serialVersionUID = 1L;
	/**
	 * 商品规格编号
	 */
	private String kindId;
    /**
     * 用户ID
     */
	private String userId;
	/**
	 * 购物车状态：N:未选中；Y:选中, AN:全不选, AY:全选
	 */
	private String checkStatus;

	@Override
	public String toString() {
		return JSON.toJSONString(this,
				new SerializerFeature[]{
						SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullListAsEmpty,
						SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteNullNumberAsZero,
						SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.UseISO8601DateFormat
				});
	}
}
