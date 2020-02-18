package com.morning.common.service.shop.user.entity;

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
* 项目名称：morning-online-facade   
* 类名称：Email   
* 类描述：Email / 邮箱记录表 实体类  
* 创建人：赵娟娟
* 创建时间：2017年4月8日 下午3:47:12   
*
 */
@TableName("os_email")
@Data
public class Email {

    private static final long serialVersionUID = 1L;

    /**
     * 邮箱ID
     */
	@TableId(value="email_id", type= IdType.AUTO)
	private Long emailId;
    /**
     * 邮箱标识号
     */
	@TableField("email_sign")
	private Long emailSign;
    /**
     * 用户邮箱
     */
	@TableField("user_email")
	private String userEmail;
    /**
     * 邮箱类型：0.找回密码; 1.注册; 2.改变邮箱; 3.通知
     */
	@TableField("email_type")
	private Integer emailType;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 有效开始时间
     */
	@TableField("start_time")
	private Date startTime;
    /**
     * 有效结束时间
     */
	@TableField("end_time")
	private Date endTime;
    /**
     * 新电子邮箱
     */
	@TableField("new_email")
	private String newEmail;
    /**
     * 链接是否已失效：0.失效；1.未失效；
     */
	private Integer status;
    /**
     * 发送状态：0.发送失败；1.发送成功；
     */
	@TableField("send_status")
	private Integer sendStatus;
    /**
     * 验证码
     */
	private String captcha;
    /**
     * 邮箱主题
     */
	@TableField("email_subject")
	private String emailSubject;
    /**
     * 邮箱正文
     */
	@TableField("email_content")
	private String emailContent;
	
	public Email() {
		super();
	}

	public Email(Long emailSign, String userEmail, Integer emailType, Date createTime, Date startTime, Date endTime,
			Integer sendStatus, String captcha, String emailSubject, String emailContent) {
		super();
		this.emailSign = emailSign;
		this.userEmail = userEmail;
		this.emailType = emailType;
		this.createTime = createTime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.sendStatus = sendStatus;
		this.captcha = captcha;
		this.emailSubject = emailSubject;
		this.emailContent = emailContent;
	}

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
