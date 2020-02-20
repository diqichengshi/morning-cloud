package com.posp.ui.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;

/**
 * 生成验证码配置
 *
 * @version v1.0.1, 2018/09/06  03:38:10 下午
 * @author 高峰,原作者[chenyi]
 */
@Configuration
public class KaptchaConfig {

    /**
     * Method description
     *
     * @return
     * @version v1.0.1, 2018/09/06  03:38:10 下午
     * @author 高峰
     */
    @Bean
    public DefaultKaptcha producer() {
        Properties properties = new Properties();
        properties.put("kaptcha.border", "no");
        properties.put("kaptcha.textproducer.font.color", "black");
        properties.put("kaptcha.textproducer.char.space", "5");
        Config         config         = new Config(properties);
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }
}
