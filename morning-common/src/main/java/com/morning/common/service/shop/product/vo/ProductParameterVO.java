package com.morning.common.service.shop.product.vo;

import com.morning.common.base.KvBean;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 赵娟 on 2019/7/1.
 * 描述:
 */
public class ProductParameterVO implements Serializable {
    /**
     * 商品ID
     */
    private String productId;
    /**
     * 参数名
     */
    private String group;
    private List<KvBean> paramList;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public List<KvBean> getParamList() {
        return paramList;
    }

    public void setParamList(List<KvBean> paramList) {
        this.paramList = paramList;
    }
}
