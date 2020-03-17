package com.morning.common.service.shop.product.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 赵娟 on 2019/4/1.
 * 描述:
 */
@Data
public class SpecificationVO implements Serializable {
    private static final long serialVersionUID = 1L;

    private String specificationId;
    private String specificationName;
    private List<String> specificationAttributeList;

}
