package com.morning.shop.order.config;

import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by 赵娟 on 2019/7/1.
 * 描述:
 */
@Configuration
public class MybatisConfig {
    /*
     * 分页插件，自动识别数据库类型
     * 多租户，请参考官网[插件扩展]
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor page = new PaginationInterceptor();
        //设置方言类型
        page.setDialectType("mysql");
        return page;
    }

}
