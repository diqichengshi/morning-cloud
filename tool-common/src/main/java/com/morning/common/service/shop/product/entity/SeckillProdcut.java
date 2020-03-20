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
* 类名称：GroupBuy
* 类描述：GroupBuy / 秒杀商品 实体类
* 创建人：赵娟娟
* 创建时间：2017年4月11日 下午3:11:40   
*
 */
@TableName("os_seckill_product")
@Data
public class SeckillProdcut implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 推荐位Id
     */
	@TableId(value="id", type= IdType.AUTO)
	private String id;

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
     * 推荐位名称
     */
	private String title;
    /**
     * 代码简称
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

	@TableField("create_time")
	private Date createTime;

	@TableField("create_by")
	private Date createBy;

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
