package com.morning.common.service.shop.user.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 
* 项目名称：morning-user-facade   
* 类名称：User   
* 类描述：User / 用户表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年4月8日 下午2:12:07   
*
 */
@TableName("os_user")
@Data
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
	@TableId(value="user_id", type= IdType.AUTO)
	private String userId;
    /**
     * 昵称
     */
	@TableField("user_name")
	private String userName;
    /**
     * 登录密码
     */
	@TableField("login_password")
	private String loginPassword;
    /**
     * 加密密码的盐
     */
	private String salt;
    /**
     * 真实姓名
     */
	@TableField("real_name")
	private String realName;
    /**
     * 性别 0=保密/1=男/2=女
     */
	private Integer sex;
    /**
     * 年龄
     */
	private Integer age;
    /**
     * 用户头像
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 状态 0=冻结/1=正常
     */
	private Integer status;
    /**
     * 邮箱激活 0=未激活/1=已激活
     */
	@TableField("email_is_active")
	private Integer emailIsActive;
    /**
     * 电子邮箱
     */
	private String email;
    /**
     * 手机号码
     */
	private String telephone;
    /**
     * 最后登录时间
     */
	@TableField("last_login_time")
	private Date lastLoginTime;
    /**
     * 最后登录IP
     */
	@TableField("last_login_ip")
	private String lastLoginIp;
    /**
     * 登录次数
     */
	@TableField("login_number")
	private Long loginNumber;
    /**
     * 注册时间
     */
	@TableField("regeist_time")
	private Date regeistTime;
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
    /**
     * 消费额
     */
	private BigDecimal amount;
    /**
     * 会员等级ID
     */
	@TableField("rank_id")
	private Long rankId;
    /**
     * 会员积分
     */
	private Integer score;

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
