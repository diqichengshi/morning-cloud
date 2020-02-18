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
* 项目名称：morning-user-facade   
* 类名称：UserLoginLog   
* 类描述：UserLoginLog / 用户登录表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年4月8日 下午2:12:36   
*
 */
@TableName("os_user_login_log")
@Data
public class UserLoginLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 登录日志ID
     */
	@TableId(value="log_id", type= IdType.AUTO)
	private Long logId;
    /**
     * 登录时间
     */
	@TableField("login_time")
	private Date loginTime;
    /**
     * 登录IP
     */
	@TableField("user_ip")
	private String userIp;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private Long userId;
    /**
     * 操作系统
     */
	@TableField("operating_system")
	private String operatingSystem;
    /**
     * 浏览器
     */
	private String browser;

	public UserLoginLog() {
		super();
	}

	public UserLoginLog(Date loginTime, String userIp, Long userId, String operatingSystem,
			String browser) {
		super();
		this.loginTime = loginTime;
		this.userIp = userIp;
		this.userId = userId;
		this.operatingSystem = operatingSystem;
		this.browser = browser;
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
