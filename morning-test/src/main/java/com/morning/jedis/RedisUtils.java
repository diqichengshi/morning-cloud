package com.morning.jedis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.ShardedJedisPool;

public class RedisUtils {
    public static Jedis getConnection(){

        Jedis jedis = null;
        try {
            jedis = new Jedis("106.52.83.225",6379);
            jedis.auth("123456!@#$%^");
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (null != jedis){
                try {
                    jedis.close();
                }catch (Exception e){
                    System.out.println("redis连接关闭失败");
                    e.printStackTrace();
                }
            }
        }
        return jedis;

    }

    public static void closeConnection(Jedis jedis ){
        if (null != jedis){
            try {
                jedis.close();
            }catch (Exception e){
                System.out.println("redis连接关闭失败");
                e.printStackTrace();
            }
        }
    }

}
