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
* 类名称：Question   
* 类描述：Question / 提问表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年4月25日 下午7:28:41   
*
 */
@TableName("os_question")
@Data
public class Question {

    private static final long serialVersionUID = 1L;

    /**
     * 提问ID
     */
	@TableId(value="question_id", type= IdType.AUTO)
	private String questionId;
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
     * 提问内容
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
     * 回答内容
     */
	@TableField("answer_content")
	private String answerContent;
    /**
     * 回复人
     */
	@TableField("answer_by")
	private String answerBy;
    /**
     * 回复时间
     */
	@TableField("answer_time")
	private Date answerTime;
    /**
     * 状态：1.已处理；0.未处理；2.不予处理
     */
	private Integer type;
    /**
     * 更新者
     */
	@TableField("update_by")
	private String updateBy;
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
