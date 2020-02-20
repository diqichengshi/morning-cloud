//~ Formatted by Jindent --- http://www.jindent.com
package com.posp.ui.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.posp.ui.entity.UserVO;

/**
 * Shiro工具类
 *
 * @version v1.0.1, 2018/09/06  02:00:46 下午
 * @author 高峰
 */
public class ShiroUtil {

    /**
     * 退出
     *
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static void logout() {
        SecurityUtils.getSubject().logout();
    }

    /**
     * 获取验证码
     *
     * @param key
     * @return
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static String getKaptcha(String key) {
        String kaptcha = null;
        Object object  = getSessionAttribute(key);

        if (null != object) {
            kaptcha = object.toString();
            getSession().removeAttribute(key);
        }

        return kaptcha;
    }

    /**
     * 判断是否登录
     *
     * @return
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static boolean isLogin() {
        return SecurityUtils.getSubject().getPrincipal() != null;
    }

    /**
     * 获取session
     *
     * @return
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static Session getSession() {
        return SecurityUtils.getSubject().getSession();
    }

    /**
     * 获取session中的某个属性
     *
     * @param key
     * @return
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static Object getSessionAttribute(Object key) {
        return getSession().getAttribute(key);
    }

    /**
     * 设置session属性
     *
     * @param key
     * @param value
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static void setSessionAttribute(Object key, Object value) {
        getSession().setAttribute(key, value);
    }

    /**
     * Method description
     *
     * @return
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    /**
     * 获取登录用户实体类
     *
     * @return
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static UserVO getUserEntity() {
        return (UserVO) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 获取登录用户id
     *
     * @return
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static String getUserId() {
        return getUserEntity().getId();
    }

    /**
     * 获取登录用户名称
     *
     * @return
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static String getUserName() {
        return getUserEntity().getUsername();
    }

    /**
     * 获取真实姓名
     *
     * @return
     * @version v1.0.1, 2018/09/06  02:00:35 下午
     * @author 高峰
     */
    public static String getName() {
        return getUserEntity().getName();
    }
}
