package com.morning.common.service.shop.product.ao;

import com.morning.common.base.BasePageQuery;
import com.morning.common.base.PageInfo;
import lombok.Data;

import java.io.Serializable;

@Data
public class RecommendQueryAO  implements Serializable {

    private static final long serialVersionUID = 1L;

    private PageInfo pageInfo;
    /**
     * 商品Id
     */
    private String productId;

    public RecommendQueryAO(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }
}
