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
 * 项目名称：morning-user-facade
 * 类名称：Address
 * 类描述：Address / 收获地址表 实体类
 * 创建人：赵娟娟
 * 创建时间：2017年5月9日 下午9:57:12
 */
@TableName("os_address")
@Data
public class Address implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 收获地址ID
     */
    @TableId(value = "address_id", type = IdType.AUTO)
    private String addressId;

    @TableField("is_default")
    private String isDefault;
    /**
     * 用户ID
     */
    @TableField("user_id")
    private String userId;
    /**
     * 姓名
     */
    @TableField("user_name")
    private String userName;
    /**
     * 地址标签
     */
    @TableField("user_tag")
    private String userTag;
    /**
     * 手机号码
     */
    @TableField("user_phone")
    private String userPhone;
    /**
     * 省份ID
     */
    @TableField("province_id")
    private Integer provinceId;
    /**
     * 省份名字
     */
    @TableField("province_name")
    private String provinceName;
    /**
     * 城市ID
     */
    @TableField("city_id")
    private Integer cityId;
    /**
     * 城市名字
     */
    @TableField("city_name")
    private String cityName;
    /**
     * 区域ID
     */
    @TableField("county_id")
    private Integer countyId;
    /**
     * 区域名字
     */
    @TableField("county_name")
    private String countyName;
    /**
     * 详细地址
     */
    @TableField("user_adress")
    private String userAdress;
    /**
     * 邮政编码
     */
    @TableField("user_zipcode")
    private Integer userZipcode;
    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;
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
