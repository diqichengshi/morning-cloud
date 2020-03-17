package com.morning.shop.order.util;

import com.morning.common.constant.RedisKey;
import com.morning.common.util.MiscUtil;
import com.morning.common.util.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * Created by 赵娟 on 2019/6/1.
 * 描述:
 */
@Component
public class RedisIdGenerator {
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 生成递增序列码
     *
     * @param prefix          前缀
     * @param dailyIncNumSize 日增量长度
     * @return
     */
    public String generate(String prefix, int dailyIncNumSize) {
        String thisTime =  DateUtil.formatString(new Date());
        String store_key = String.join(prefix, thisTime);
        Long inc = redisTemplate.opsForValue().increment(store_key, 1);
        if (inc.compareTo(1L) == 0) { // 第一次，设置过期时间
            redisTemplate.expire(store_key, 2, TimeUnit.DAYS);
        }
        String increment = String.valueOf(Math.round(Math.pow(10, dailyIncNumSize)) + inc).substring(1);
        String random = MiscUtil.getRandomString(10);
        return String.join("", prefix, random, thisTime, increment);
    }

    /**
     * 生成订单号
     */
    public String orderId() {
        String prefix = RedisKey.SHOP_ORDER_ID_PREFIX;
        return generate(prefix, 1);
    }

    /**
     * 生成用户号
     *
     * @return
     */
    public String userId() {
        String prefix = RedisKey.SHOP_USER_ID_PREFIX;
        return generate(prefix, 1);
    }

    public String commonId() {
        String prefix = RedisKey.SHOP_COMMON_ID_PREFIX;
        return generate(prefix, 1);
    }
}
