package com.morning.jedis;


import redis.clients.jedis.Jedis;

public class JedisTest {


    public static void main(String[] args) {
        Jedis jedis = RedisUtils.getConnection();
        System.out.println("名称"+jedis.get("name"));
        RedisUtils.closeConnection(jedis);
    }
}
