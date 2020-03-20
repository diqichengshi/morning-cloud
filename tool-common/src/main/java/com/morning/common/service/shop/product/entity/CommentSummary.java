package com.morning.common.service.shop.product.entity;

import java.time.LocalDateTime;
import java.io.Serializable;

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

    private static final long serialVersionUID=1L;

    /**
     * 评价ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 商品ID
     */
    private Long productId;

    /**
     * 好评数
     */
    private Integer totalCount;

    /**
     * 好评数
     */
    private Integer goodCount;

    /**
     * 好评数
     */
    private Integer middleCount;

    /**
     * 差评数
     */
    private Integer badCount;

    /**
     * 状态：1.显示；0.隐藏
     */
    private Integer status;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 更新者
     */
    private String updateBy;


}
