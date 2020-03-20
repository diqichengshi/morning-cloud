package com.morning.common.service.shop.product.entity;

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
* 项目名称：morning-product-facade   
* 类名称：Recommend   
* 类描述：Recommend / 推荐位表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年4月11日 下午3:11:40   
*
 */
@TableName("os_recommend")
@Data
public class Recommend implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * Id
     */
	@TableId(value="id", type= IdType.AUTO)
	private String Id;

	/**
	 * 商户号
	 */
	@TableId(value="merchant_id")
	private String merchantId;

	/**
	 * 商品Id
	 */
	@TableId(value="product_id")
	private String productId;
	/**
	 * 推荐类型0:首页推荐,1:店铺推荐
	 */
	private String type;
    /**
     * 名称
     */
	private String name;
    /**
     * 展示图片
     */
	@TableField("show_img")
	private String showImg;
    /**
     * 销售量
     */
	@TableField("sales_volume")
	private Integer salesVolume;
    /**
     * 显示数量
     */
	@TableField("show_price")
	private Integer showPrice;
    /**
     * 状态 1=显示/0=隐藏
     */
	private Integer status;
    /**
     * 备注信息
     */
	private String remarks;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 创建者
     */
	@TableField("create_by")
	private String createBy;
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 更新者
     */
	@TableField("update_by")
	private String updateBy;

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
