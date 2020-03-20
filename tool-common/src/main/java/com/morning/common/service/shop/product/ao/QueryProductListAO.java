package com.morning.common.service.shop.product.ao;

import com.morning.common.base.PageInfo;
import com.morning.common.service.common.PageAO;
import lombok.Data;

@Data
public class QueryProductListAO extends PageAO {


   private String queryType;

   private String categoryId;

}
