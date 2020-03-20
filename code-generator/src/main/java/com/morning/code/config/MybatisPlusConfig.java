package com.morning.code.config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;

/**
 *
 * @description: mybatisplus配置文件
 * @author: yshexiaobai
 * @Date: 2019年9月5日 上午11:27:12
 */
@Configuration
public class MybatisPlusConfig {

    /**
     * 配置分页插件
     * @return
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor page = new PaginationInterceptor();
        page.setDialectType("mysql");
        return page;
    }

}