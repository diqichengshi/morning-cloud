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
* 类名称：Comment   
* 类描述：Comment / 评价表   实体类
* 创建人：赵娟娟
* 创建时间：2017年4月11日 下午3:10:21   
*
 */
@TableName("os_comment_detail")
@Data
public class CommentDetail implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 评价ID
     */
	@TableId(value="comment_id", type= IdType.AUTO)
	private String commentId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private String productId;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private String userId;
    /**
     * 昵称
     */
	@TableField("user_name")
	private String userName;
    /**
     * 用户头像
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 订单ID
     */
	@TableField("order_id")
	private Long orderId;
    /**
     * 评论星级：1,2,3,4,5
     */
	private Integer star;
    /**
     * 评论内容
     */
	private String content;
    /**
     * 好评数
     */
	@TableField("good_count")
	private Integer goodCount;
    /**
     * 状态：1.显示；0.隐藏
     */
	private Integer status;
    /**
     * 评论类型：1,优质；0,普通
     */
	private Integer type;
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
