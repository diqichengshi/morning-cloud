package com.morning.common.service.shop.user.ao;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;


import java.util.Date;

/**
 * 
* 项目名称：morning-user-facade   
* 类名称：Address   
* 类描述：Address / 收获地址表 实体类   
* 创建人：赵娟娟
* 创建时间：2017年5月9日 下午9:57:12   
*
 */
public class AddressAO {

    private static final long serialVersionUID = 1L;

    /**
     * 收获地址ID
     */
	private Long addressId;

	private String  defaultAddress;
    /**
     * 用户ID
     */
	private Long userId;
    /**
     * 姓名
     */
	private String userName;
    /**
     * 地址标签
     */
	private String userTag;
    /**
     * 手机号码
     */
	private String userPhone;
    /**
     * 省份ID
     */
	private Integer provinceId;
    /**
     * 省份名字
     */
	private String provinceName;
    /**
     * 城市ID
     */
	private Integer cityId;
    /**
     * 城市名字
     */
	private String cityName;
    /**
     * 区域ID
     */
	private Integer districtId;
    /**
     * 区域名字
     */
	private String districtName;
    /**
     * 详细地址
     */
	private String userAdress;
    /**
     * 邮政编码
     */
	private Integer userZipcode;
    /**
     * 创建时间
     */
	private Date createTime;
    /**
     * 更新时间
     */
	private Date updateTime;


	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public String getDefaultAddress() {
		return defaultAddress;
	}

	public void setDefaultAddress(String defaultAddress) {
		this.defaultAddress = defaultAddress;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserTag() {
		return userTag;
	}

	public void setUserTag(String userTag) {
		this.userTag = userTag;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Integer getDistrictId() {
		return districtId;
	}

	public void setDistrictId(Integer districtId) {
		this.districtId = districtId;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public String getUserAdress() {
		return userAdress;
	}

	public void setUserAdress(String userAdress) {
		this.userAdress = userAdress;
	}

	public Integer getUserZipcode() {
		return userZipcode;
	}

	public void setUserZipcode(Integer userZipcode) {
		this.userZipcode = userZipcode;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this,
				new SerializerFeature[] {
						SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullListAsEmpty,
						SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteNullNumberAsZero,
						SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.UseISO8601DateFormat
				});
	}
}
