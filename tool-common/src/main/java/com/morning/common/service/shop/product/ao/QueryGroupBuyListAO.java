package com.morning.common.service.shop.product.ao;

import com.morning.common.service.common.PageAO;
import lombok.Data;

@Data
public class QueryGroupBuyListAO extends PageAO  {

    /**
     * 商品Id
     */
    private String type;

}
