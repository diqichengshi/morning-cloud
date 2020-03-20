package com.morning.code.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.alibaba.druid.pool.DruidDataSource;

/**
 * @description:数据源配置文件
 * @author: yshexiaobai
 * @Date: 2019年9月5日 上午11:20:40
 */
@Configuration
public class DataSourceConfig {

    @Bean(name="dataSource")
    public DataSource dataSource() {
        return new DruidDataSource();
    }
}