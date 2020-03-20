package com.morning.common.service.shop.product.ao;

import com.morning.common.base.BasePageQuery;
import com.morning.common.service.common.PageAO;
import lombok.Data;

import java.io.Serializable;

@Data
public class QueryCommentListAO extends PageAO implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 商品Id
     */
    private String productId;
}
