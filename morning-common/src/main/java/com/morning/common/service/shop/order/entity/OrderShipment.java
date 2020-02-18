package com.morning.common.service.shop.order.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;


import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：OrderShipment   
* 类描述：OrderShipment / 订单配送表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年5月10日 上午10:30:00   
*
 */
@TableName("os_order_shipment")
@Data
public class OrderShipment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 配送ID
     */
	@TableId(value="order_shipment_id", type= IdType.AUTO)
	private Long orderShipmentId;
    /**
     * 订单ID
     */
	@TableField("order_id")
	private String orderId;
	/**
	 * 用户Id
	 */
	@TableField("user_id")
	private String userId;
    /**
     * 姓名
     */
	@TableField("user_name")
	private String userName;
    /**
     * 手机号码
     */
	@TableField("user_phone")
	private String userPhone;
    /**
     * 省份ID
     */
	@TableField("province_id")
	private Integer provinceId;
    /**
     * 省份名字
     */
	@TableField("province_name")
	private String provinceName;
    /**
     * 城市ID
     */
	@TableField("city_id")
	private Integer cityId;
    /**
     * 城市名字
     */
	@TableField("city_name")
	private String cityName;
    /**
     * 区域ID
     */
	@TableField("district_id")
	private Integer districtId;
    /**
     * 区域名字
     */
	@TableField("district_name")
	private String districtName;
    /**
     * 详细地址
     */
	@TableField("user_adress")
	private String userAdress;
    /**
     * 邮政编码
     */
	@TableField("user_zipcode")
	private Integer userZipcode;
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;

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
