package com.morning.common.constant;

public interface RedisKey {
    public static final String SHOP_ORDER_ID_PREFIX = "O";
    public static final String SHOP_USER_ID_PREFIX = "U";
    public static final String SHOP_COMMON_ID_PREFIX = "S";

    public static final String PRODUCT_DETAIL = "product_detail";

    public static final String NAVIGATION_BAR = "navigation_bar";

    public static final String HOME_PRODUCT = "home_product";

    public static final String HOME_CATEGORY = "home_category";

    public static final String MORNING_INDEX = "morning_index";

    public static final String USER_SESSION_KEY = "user_session_key";
    /**
     * Session的过期时间30分钟
     */
    public static final int REDIS_SSO_SESSION_EXPIRE = 30000;

}
