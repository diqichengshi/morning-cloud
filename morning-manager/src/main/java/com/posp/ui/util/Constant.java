package com.posp.ui.util;

/**
 * 页面常量类
 *
 * @author 高峰
 * @version v1.0.1, 2018/09/06  03:39:49 下午
 */
public class Constant {

    /**
     * 超级管理员ID
     */
    public static final String SUPER_ADMIN = "1";

    /**
     * 初始默认密码
     */
    public static final String PASSWORD = "123456";

    /**
     * 用户默认初始登陆密码
     */
    public static final String USER_RESET_LOGIN_PWD = "USER_RESET_LOGIN_PWD";

    /**
     * 用户状态:0-冻结
     */
    public static final String USER_FROZEN = "0";
    /**
     * 用户状态:1-正常
     */
    public static final String USER_NORMAL = "1";

    /**
     * 登录密码过期时间
     */
    public static final String USER_LOGIN_PWD_VALID_DURATION = "S_USER_LOGIN_PWD_VALID_DURATION";

    /**
     * 修改密码类型
     * 1-修改密码;2-重置密码;3-设置手势密码
     */
    public static final String USER_PWD_TYPE_MODIFY = "1";
    public static final String USER_PWD_TYPE_RESET = "2";


    /**
     * 用户类型:1-机构用户;2-商户用户;
     */
    public static final String ORGANIZATION_USER = "1";
    public static final String MERCHANT_USER = "2";

    /**
     * 商户默认登录密码
     */
    public static final String USER_LOGINPWD_MERCH = "USER_LOGINPWD_MERCH";
    /**
     * 代理商用户默认登录密码
     */
    public static final String USER_LOGIN_PWD_AGENT = "USER_LOGINPWD_AGENT";
    /**
     *  风控规则交易码
     */
    public  static  final  String RISKRULE_TRANSCODE ="RISKRULE_TRANSCODE";

    /**
     * 菜单类型枚举类
     */
    public enum MenuTypeEnum {

        /**
         * 目录
         */
        CATALOG(0),

        /**
         * 菜单
         */
        MENU(1),

        /**
         * 按钮
         */
        BUTTON(2);

        private int value;

        /**
         * Constructs ...
         *
         * @param value
         * @version v1.0.1, 2018/09/06  03:39:49 下午
         * @author 高峰
         */
        private MenuTypeEnum(int value) {
            this.value = value;
        }

        /**
         * Method description
         *
         * @return
         * @version v1.0.1, 2018/09/06  03:39:49 下午
         * @author 高峰
         */
        public int getValue() {
            return value;
        }
    }

    /**
     * 顶级菜单枚举类
     */
    public enum TopMenuEnum {
        TopMenu("0", "顶级菜单"), TopOrg("0", "顶级部门");

        private final String desc;
        private final String code;

        /**
         * Constructs ...
         *
         * @param code
         * @param desc
         * @version v1.0.1, 2018/09/06  03:39:49 下午
         * @author 高峰
         */
        private TopMenuEnum(String code, String desc) {
            this.code = code;
            this.desc = desc;
        }

        /**
         * Method description
         *
         * @return
         * @version v1.0.1, 2018/09/06  03:39:49 下午
         * @author 高峰
         */
        public String getCode() {
            return code;
        }

        /**
         * Method description
         *
         * @return
         * @version v1.0.1, 2018/09/06  03:39:49 下午
         * @author 高峰
         */
        public String getDesc() {
            return desc;
        }
    }
}
