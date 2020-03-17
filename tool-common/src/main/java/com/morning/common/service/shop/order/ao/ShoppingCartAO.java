package com.morning.common.service.shop.order.ao;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：ShoppingCart   
* 类描述：ShoppingCart / 购物车请求类
* 创建人：赵娟娟
* 创建时间：2017年5月10日 下午3:54:27   
*
 */
@Data
public class ShoppingCartAO implements Serializable {

    private static final long serialVersionUID = 1L;
	/**
	 * 商品编号
	 */
	private String productId;
	/**
	 * 商品规格编号
	 */
	private String kindId;
	/**
	 * 商品规格名称
	 */
	private String kindName;
    /**
     * 用户ID
     */
	private String userId;
    /**
     * 购买数量
     */
	private Integer buyNumber;

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
