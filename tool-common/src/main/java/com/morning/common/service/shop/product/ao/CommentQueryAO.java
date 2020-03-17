package com.morning.common.service.shop.product.ao;

import com.morning.common.base.BasePageQuery;
import lombok.Data;

import java.io.Serializable;

@Data
public class CommentQueryAO extends BasePageQuery implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 商品Id
     */
    private String productId;
}
