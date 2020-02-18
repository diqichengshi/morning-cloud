package com.morning.common.base;

import java.io.Serializable;
import java.util.Map;

/**
 * 项目名称：morning-common
 * 类名称：PageInfo
 * 类描述：PageInfo 分页实体类
 * 创建人：赵娟娟
 * 创建时间：2017年4月2日 下午5:31:18
 */
public class PageInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 总记录
     */
    private long total;

    /**
     * 总页数
     */
    private long totalPage;

    /**
     * 数据库中limit的参数，从第几条开始取
     */
    private int offset;

    /**
     * 每页显示的记录数
     */
    private int limit;

    /**
     * 当前页
     */
    private int current;

    /**
     * 分页实体类辅助类
     */
    public static PageInfo buildPageInfo(int offset, int limit) {
        return new PageInfo(offset, limit);
    }

    /**
     * 构造函数私有化
     */
    private PageInfo() {
        super();
    }

    private PageInfo(int current, int limit) {
        // 计算当前页
        if (current < 0) {
            this.current = 1;
        } else {
            // 当前页
            this.current = current;
        }
        // 记录每页显示的记录数
        if (limit < 0) {
            this.limit = limit;
        } else {
            this.limit = limit;
        }
        // 计算开始的记录和结束的记录
        this.offset = (this.current - 1) * this.limit;
    }


    public void count() {
        if (limit <= 0) {
            this.limit = 1;
        }
        // 计算总页数
        long totalPageTemp = this.total / this.limit;
        int plus = (this.total % this.limit) == 0 ? 0 : 1;
        totalPageTemp = totalPageTemp + plus;
        if (totalPageTemp <= 0) {
            totalPageTemp = 1;
        }
        this.totalPage = totalPageTemp;
    }

    public void current() {
        if (limit <= 0) {
            this.limit = 1;
        }
        // 计算当前页数
        this.current = this.offset / this.limit + 1;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
        count();
    }

    public long getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
        current();
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

}
