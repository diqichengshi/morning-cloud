package com.morning.common.base;

import lombok.Data;

import java.io.Serializable;

@Data
public class BasePageQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 数据库中limit的参数，从第几条开始取 */
    private int offset;

    /** 每页显示的记录数 */
    private int limit;
}
