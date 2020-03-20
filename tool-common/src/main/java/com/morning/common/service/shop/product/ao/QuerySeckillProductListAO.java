package com.morning.common.service.shop.product.ao;

import com.morning.common.service.common.PageAO;
import lombok.Data;

@Data
public class QuerySeckillProductListAO extends PageAO  {

    /**
     * 商品Id
     */
    private String type;

}
