/*
 * Copyright (c) 2018. paascloud.net All Rights Reserved.
 * 项目名称：paascloud快速搭建企业级分布式微服务平台
 * 类名称：LoginAuthDto.java
 * 创建人：刘兆明
 * 联系方式：paascloud.net@gmail.com
 * 开源地址: https://github.com/paascloud
 * 博客地址: http://blog.paascloud.net
 * 项目官网: http://paascloud.net
 */
package com.morning.common.base;

import lombok.Data;

import java.io.Serializable;

/**
 * 系统登陆用户
 */
@Data
public class UserInfo implements Serializable {
	private static final long serialVersionUID = -1137852221455042256L;
	private String userId;
	private String loginName;
	private String userName;
	private String groupId;
	private String groupName;

	public UserInfo() {
	}

	public UserInfo(String userId, String loginName, String userName) {
		this.userId = userId;
		this.loginName = loginName;
		this.userName = userName;
	}

	public UserInfo(String userId, String loginName, String userName, String groupId, String groupName) {
		this.userId = userId;
		this.loginName = loginName;
		this.userName = userName;
		this.groupId = groupId;
		this.groupName = groupName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
}
