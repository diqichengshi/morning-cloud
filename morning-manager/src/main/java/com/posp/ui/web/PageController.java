package com.posp.ui.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 通用类页面配置
 *
 * @version v1.0.1, 2018/09/06  03:40:55 下午
 * @author 高峰
 */
@Controller
public class PageController {

    /**
     * Method description
     *
     * @return
     * @version v1.0.1, 2018/09/06  03:40:55 下午
     * @author 高峰
     */
    @RequestMapping("/home/console")
    public String console() {
        return "home/console";
    }
}
