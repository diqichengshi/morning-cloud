package com.morning.common.service.shop.product.ao;

import com.morning.common.base.PageInfo;
import com.morning.common.service.common.PageAO;
import lombok.Data;

import java.io.Serializable;

@Data
public class QueryRecommendListAO extends PageAO  {

    /**
     * 商品Id
     */
    private String type;

}
