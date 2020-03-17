package com.morning.common.service.common;

import com.morning.common.util.StringUtil;
import lombok.Data;

import java.io.Serializable;

/**
 * 类名称：PageAO
 * 类描述：PageAO 分页查询实体类
 * 创建人：赵娟娟
 * 创建时间：2017年4月2日 下午5:31:18
 */
@Data
public class PageAO  {

    /**
     * 数据库中page的参数，从第几条开始取
     */
    private String page;

    /**
     * 每页显示的记录数
     */
    private String size;

    public String getPageSize(){
        if (StringUtil.isBlank(size)){
            return "10";
        }else {
            return size;
        }
    }
}
