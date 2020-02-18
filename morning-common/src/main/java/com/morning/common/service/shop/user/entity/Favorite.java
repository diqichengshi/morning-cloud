package com.morning.common.service.shop.user.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 
* 项目名称：morning-user-facade   
* 类名称：Favorite   
* 类描述：Favorite / 收藏夹表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年5月9日 下午7:56:14   
*
 */
@TableName("os_favorite")
@Data
public class Favorite {

    private static final long serialVersionUID = 1L;

    /**
     * 收藏表ID
     */
	@TableId(value="favorite_id", type= IdType.AUTO)
	private String favoriteId;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private String productId;
    /**
     * 商品名称
     */
	private String name;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 显示价格
     */
	@TableField("show_price")
	private BigDecimal showPrice;
    /**
     * 商品状态：1,上架；2,下架
     */
	private Integer status;
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
