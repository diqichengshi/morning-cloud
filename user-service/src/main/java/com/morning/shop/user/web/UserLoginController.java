package com.morning.shop.user.web;


import com.morning.common.base.MorningResult;
import com.morning.common.base.BaseController;
import com.morning.common.base.exception.enums.SystemErrorEnum;
import com.morning.shop.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * 项目名称：morning-os-web Maven Webapp
 * 类名称：UserLoginController
 * 类描述：用户登录表示层控制器
 * 创建人：赵娟娟
 * 创建时间：2017年4月7日 下午10:54:11
 */
@Controller
@RequestMapping(value = "/user")
public class UserLoginController extends BaseController {

    @Autowired
    private IUserService userService;

    /**
     * POST 根据登录名和登录密码确认用户登录信息
     *
     * @return
     */
    @PostMapping(value = "/login")
    @ResponseBody
    //public MorningResult login(@RequestParam("username") String username, @RequestParam("userName") String password) {
    public MorningResult login(String username, String password) {
        MorningResult morningResult = null;
        // 写死进行测试
        username = "13359478971";
        password = "123456";
        try {
            morningResult = userService.login(username, password);
            return morningResult;
        } catch (Exception e) {
            return MorningResult.error(SystemErrorEnum.SYSTEM_INNER_ERROR);
        }
    }

}
