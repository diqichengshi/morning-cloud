package com.morning.common.service.shop.product.entity;

import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 评价汇总表
 * </p>
 *
 * @author 赵娟娟
 * @since 2020-03-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("os_comment_summary")
public class CommentSummary implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 评价ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 商品ID
     */
    @TableField("product_id")
    private Long productId;

    /**
     * 好评数
     */
    @TableField("total_count")
    private Integer totalCount;

    /**
     * 好评数
     */
    @TableField("good_count")
    private Integer goodCount;

    /**
     * 好评数
     */
    @TableField("middle_count")
    private Integer middleCount;

    /**
     * 差评数
     */
    @TableField("bad_count")
    private Integer badCount;

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
     * 更新时间
     */
    @TableField("update_time")
    private Date updateTime;
    /**
     * 更新者
     */
    @TableField("update_by")
    private String updateBy;


}
