package com.morning.common.redis;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import redis.clients.jedis.JedisCluster;

import javax.annotation.Resource;

@Component
@Slf4j
public class RedisService {
    @Resource
    private RedisTemplate redisTemplate;

    public boolean setString(String key, String value) {
        try {
            redisTemplate.opsForValue().set(key, String.valueOf(value));
        } catch (Exception ex) {
            log.error("setString:{Key:" + key + ",value" + value + "}", ex);
            return false;
        }
        return true;
    }


    public String getString(String key) {
        String value= null;
        try {
            value = (String) redisTemplate.opsForValue().get(key);
        } catch (Exception ex) {
            log.error("getString:{Key:" + key + ",value" + value + "}", ex);
            return "";
        }
        if (value.equals("[]")){
            return "";
        }
        return value;
    }

}
