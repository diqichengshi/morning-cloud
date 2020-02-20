package com.posp.ui.web;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.posp.common.service.agent.entity.AgentDO;
import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import com.posp.tool.common.log.SysLog;
import com.posp.ui.config.WebLog;
import com.posp.ui.entity.MenuVO;
import com.posp.ui.entity.ResultDTO;
import com.posp.ui.service.IMenuService;
import com.posp.ui.util.ListUtil;
import com.posp.ui.util.ShiroUtil;

/**
 * 登录相关Controller
 *
 * @author 高峰
 * @version v1.0.1, 2018/09/06  03:26:07 下午
 */
@Controller
public class LoginController {
    @Autowired
    Producer producer;
    @Autowired
    IMenuService menuService;
    //分公司级别(0:运营,1:分公司)
    private String USER_LEVEL_OS = "0";
    private String USER_LEVEL_COMPANY = "1";

    /**
     * 生成验证码
     *
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @RequestMapping("captcha.jpg")
    public void captcha(HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");

        // 生成文字验证码
        String text = producer.createText();
        // 生成图片验证码
        BufferedImage image = producer.createImage(text);

        // 保存到shiro session
        ShiroUtil.setSessionAttribute(Constants.KAPTCHA_SESSION_KEY, text);

        ServletOutputStream out = response.getOutputStream();

        ImageIO.write(image, "jpg", out);
    }

    /**
     * 登录页面
     *
     * @return
     */
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * 登录验证
     *
     * @param username
     * @param password
     * @param vercode
     * @return
     */
    @ResponseBody
    @PostMapping("/sys/login")
    @SysLog(value = "登录",ignores = {"password"})
    @WebLog(value = "登录",ignores = {"password"})
    public ResultDTO login(String username, String password, String vercode) {
        String kaptcha = ShiroUtil.getKaptcha(Constants.KAPTCHA_SESSION_KEY);
        if (null == kaptcha) {
            return ResultDTO.error("验证码已失效");
        }
        if (null == vercode) {
            return ResultDTO.error("验证码不能为空");
        }
        if (!kaptcha.equalsIgnoreCase(vercode)) {
            return ResultDTO.error("验证码不正确");
        }
        try {
            Subject subject = ShiroUtil.getSubject();
            // 加密
            password = DigestUtils.sha1Hex(password);
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);

            subject.login(token);
        } catch (UnknownAccountException e) {
            return ResultDTO.error(e.getMessage());
        } catch (IncorrectCredentialsException e) {
            return ResultDTO.error(e.getMessage());
        } catch (LockedAccountException e) {
            return ResultDTO.error(e.getMessage());
        } catch (AuthenticationException e) {
            return ResultDTO.error("账户验证失败");
        }

        return ResultDTO.ok();
    }

    /**
     * 退出操作
     *
     * @return
     */
    @ResponseBody
    @GetMapping(value = "/logout")
    @SysLog(value = "退出")
    @WebLog
    public ResultDTO logout() {
        ShiroUtil.logout();

        return ResultDTO.ok();
    }

    /**
     * 系统首页，动态展示菜单
     *
     * @return
     */
    @GetMapping("/index")
    public ModelAndView main() {
        ModelAndView model = new ModelAndView();

        model.setViewName("index");

        List<MenuVO> menuList = menuService.listByUserId(ShiroUtil.getUserId());
        if (CollectionUtils.isEmpty(menuList)) {
            return model;
        }
        //转换为树形结构
        menuList = ListUtil.toTreeMenu(menuList, 1);
        model.addObject("menuList", menuList);
       /* if ( "00000000".equals(ShiroUtil.getUserEntity().getOrgCode())){
            model.addObject("userLevel", USER_LEVEL_OS);
        }else{
            RespMsgDTO<AgentDO> orgAgentRespMsg = agentServiceFeign.getAgentByAgentId(ShiroUtil.getUserEntity().getOrgCode());
            if(ServiceErrorCodeEnum.SERVICE_OK.getCode().equals(orgAgentRespMsg.getCode()) &&  null != orgAgentRespMsg.getData()){
                AgentDO orgAgentDO = orgAgentRespMsg.getData();
                //分公司的公告,0级是分公司
                if ("0".equals(orgAgentDO.getAgentLevel())){
                    model.addObject("userLevel", USER_LEVEL_COMPANY);
                }else{
                    model.addObject("userLevel", USER_LEVEL_OS);
                }
            }
        }*/
        model.addObject("userLevel", USER_LEVEL_OS);
        return model;
    }

    /**
     * 跳转到登录页面
     *
     * @return
     */
    @GetMapping("/")
    public String root() {
        return "login";
    }
}
