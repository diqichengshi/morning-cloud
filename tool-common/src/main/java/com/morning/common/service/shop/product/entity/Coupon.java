package com.morning.common.service.shop.product.entity;

import java.time.LocalDateTime;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 优惠券
 * </p>
 *
 * @author 赵娟娟
 * @since 2020-03-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("os_coupon")
public class Coupon implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 优惠券标题（有图片则显示图片）：无门槛50元优惠券 | 单品最高减2000元
     */
    private String title;

    /**
     * 图片
     */
    private String icon;

    /**
     * 可用于：10店铺优惠券 11新人店铺券  20商品优惠券  30类目优惠券  60平台优惠券 61新人平台券
     */
    private Integer used;

    /**
     * 1满减券 2叠加满减券 3无门槛券（需要限制大小）
     */
    private Integer type;

    /**
     * 1可用于特价商品 2不能  默认不能(商品优惠卷除外)
     */
    @TableField("with_special")
    private Integer withSpecial;

    /**
     * 店铺或商品流水号
     */
    @TableField("with_sn")
    private String withSn;

    /**
     * 满多少金额
     */
    @TableField("with_amount")
    private Long withAmount;

    /**
     * 用券金额
     */
    @TableField("used_amount")
    private Integer usedAmount;

    /**
     * 配额：发券数量
     */
    private Integer quota;

    /**
     * 已领取的优惠券数量
     */
    @TableField("take_count")
    private Integer takeCount;

    /**
     * 已使用的优惠券数量
     */
    @TableField("used_count")
    private Integer usedCount;

    /**
     * 发放开始时间
     */
    @TableField("start_time")
    private LocalDateTime startTime;

    /**
     * 发放结束时间
     */
    @TableField("end_time")
    private LocalDateTime endTime;

    /**
     * 时效:1绝对时效（领取后XXX-XXX时间段有效）  2相对时效（领取后N天有效）
     */
    @TableField("valid_type")
    private Integer validType;

    /**
     * 使用开始时间
     */
    @TableField("valid_start_time")
    private LocalDateTime validStartTime;

    /**
     * 使用结束时间
     */
    @TableField("valid_end_time")
    private LocalDateTime validEndTime;

    /**
     * 自领取之日起有效天数
     */
    @TableField("valid_days")
    private Integer validDays;

    /**
     * 1生效 2失效 3已结束
     */
    private Integer status;

    @TableField("create_by")
    private String createBy;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("update_by")
    private String updateBy;

    @TableField("update_time")
    private LocalDateTime updateTime;


}
