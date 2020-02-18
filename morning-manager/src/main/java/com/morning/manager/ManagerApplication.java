package com.morning.manager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class ManagerApplication extends SpringBootServletInitializer {

    private static Logger logger = LoggerFactory.getLogger(ManagerApplication.class);

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ManagerApplication.class);
    }

    /**
     */
    public static void main(String[] args) {
        SpringApplication.run(ManagerApplication.class, args);
        logger.debug("MorningWebApplication启动成功");
    }

}
