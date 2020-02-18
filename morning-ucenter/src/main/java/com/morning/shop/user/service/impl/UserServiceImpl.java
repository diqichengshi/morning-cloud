package com.morning.shop.user.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.base.MorningResult;
import com.morning.common.base.exception.ValidateException;
import com.morning.common.base.exception.enums.UserExceptionEnum;
import com.morning.common.constant.RedisKey;
import com.morning.common.constant.enums.YesOrNotEnum;
import com.morning.common.service.shop.user.entity.User;
import com.morning.common.service.shop.user.entity.UserLoginLog;
import com.morning.common.service.shop.user.vo.AuthToken;
import com.morning.common.service.shop.user.vo.UserVO;
import com.morning.common.util.JsonUtil;
import com.morning.common.util.MiscUtil;
import com.morning.common.util.HideDataUtil;
import com.morning.shop.user.dao.UserLoginLogMapper;
import com.morning.shop.user.dao.UserMapper;
import com.morning.shop.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 项目名称：morning-user-service
 * 类名称：UserServiceImpl
 * 类描述：User / 用户表 业务逻辑层接口实现
 * 创建人：赵娟娟
 * 创建时间：2017年4月8日 下午2:17:12
 */
@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserLoginLogMapper userLoginLogMapper;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Override
    public Integer insertUser(User user) throws ValidateException {
        // 邮箱唯一性验证（邮箱存在且已经被激活）
        User emailUser = userMapper.selectOne(user);
        if (emailUser != null && YesOrNotEnum.Y.getCode().equals(emailUser.getEmailIsActive())) {
            throw new ValidateException(UserExceptionEnum.LOGIN_REGISTER_EMAIL_REPEAT);
        }
        if (emailUser != null && YesOrNotEnum.N.getCode().equals(emailUser.getEmailIsActive())) {
            userMapper.deleteById(emailUser.getUserId()); // 如果未被激活则删除用户
        }
        user.setUserId(MiscUtil.getUuid());
        user.setSalt(MiscUtil.getRandomString(6));
        user.setPicImg(this.getPicImg());
        user.setRegeistTime(new Date());
        user.setCreateBy(user.getUserName());
        user.setLoginPassword(MiscUtil.md5Hex(user.getLoginPassword(), user.getSalt()));
        return userMapper.insert(user);
    }

    @Override
    public User getByLoginName(String loginName) {
        return userMapper.getByLoginName(loginName);
    }

    @Override
    public User getByEmail(String email) {
        User queryUser=new User();
        queryUser.setEmail(email);
        return userMapper.selectOne(queryUser);
    }

    @Override
    public UserVO getById(String userId) {
        UserVO userVO = userMapper.getById(userId);
        userVO.setTelephone(HideDataUtil.hidePhoneNo(userVO.getTelephone()));
        userVO.setEmail(HideDataUtil.hideCardNo(userVO.getEmail()));
        return userVO;
    }

    @Override
    public Integer updateLogById(String userId, UserLoginLog userLoginLog) {

        // 创建用户登录日志
        userLoginLogMapper.insert(userLoginLog);

        // 更新用户登录日志
        User user = new User();
        user.setUserId(userId);
        user.setLastLoginIp(userLoginLog.getUserIp());
        user.setLastLoginTime(new Date());
        return userMapper.updateById(user);
    }

    @Override
    public Integer updateEmailActive(String email) {
        User user = new User();
        user.setEmailIsActive(YesOrNotEnum.Y.getCode());
        user.setUpdateTime(new Date());
        user.setUpdateBy(email);

        User queryUser = new User();
        queryUser.setEmail(email);
        return userMapper.updateById(user);
    }

    @Override
    public Integer updatePerfectUser(String email, String telephone, String realName) throws ValidateException {
        // 判断手机唯一性
        User user = new User();
        user.setTelephone(telephone);
        if (userMapper.selectCount(new EntityWrapper<>(user)) > 0) {
            throw new ValidateException(UserExceptionEnum.LOGIN_REGISTER_PHONE_REPEAT);
        }
        // 完善个人信息
        user.setRealName(realName);
        user.setUpdateTime(new Date());
        user.setUpdateBy(email);

        User queryUser = new User();
        queryUser.setEmail(email);
        return userMapper.updateById(user);
    }

    @Override
    public Integer updatePasswordByEmail(String loginPassword, String email) {
        User user = userMapper.getByLoginName(email);
        user.setLoginPassword(MiscUtil.md5Hex(loginPassword, user.getSalt()));
        user.setUpdateTime(new Date());
        user.setUpdateBy(user.getUserName());
        return userMapper.updateById(user);
    }

    @Override
    public MorningResult login(String username, String password) {
        User user = userMapper.getByLoginName(username);

        if (user == null || user.getEmailIsActive().equals(YesOrNotEnum.N.getCode())) {
            return MorningResult.error(UserExceptionEnum.LOGIN_USERNAME_PASSWORD_ERROR);// 没找到帐号或者邮箱未被激活
        }

        if (YesOrNotEnum.N.getCode().equals(user.getStatus())) {
            return MorningResult.error(UserExceptionEnum.LOGIN_USERNAME_PASSWORD_ERROR);// 校验用户状态
        }

        //生成token并写入缓存
        String token = UUID.randomUUID().toString();
        redisTemplate.opsForValue().set(RedisKey.USER_SESSION_KEY + ":" + token, JsonUtil.toJsonStr(user));
        redisTemplate.expire(RedisKey.USER_SESSION_KEY + ":" + token,
                RedisKey.REDIS_SSO_SESSION_EXPIRE, TimeUnit.SECONDS);

        //返回token
        AuthToken authToken = new AuthToken();
        authToken.setAccessToken(token);
        authToken.setExpiresIn("86400");
        authToken.setLoginName(username);
        authToken.setTimestamp(new Date());

        return MorningResult.ok(authToken);
    }

    /**
     * 系统默认头像
     */
    private static String[] defaultAvatar = {"avatar_1.jpg", "avatar_2.jpg", "avatar_3.jpg", "avatar_4.jpg",
            "avatar_5.jpg", "avatar_6.jpg", "avatar_7.jpg", "avatar_8.jpg"};

    /**
     * 获得系统默认的头像
     */
    public static String getPicImg() {
        // 系统默认头像名
        String picImg = randomItem(defaultAvatar);
        // 系统 默认头像路径
        StringBuilder picImgUrl = new StringBuilder();
        // picImgUrl.append(WebSiteFileBelongEnum.DEFAULT.getBelong());
        // picImgUrl.append(File.separator);
        // picImgUrl.append(WebSiteFileBelongEnum.AVATAR.getBelong());
        picImgUrl.append(File.separator);
        picImgUrl.append(picImg);

        // 将绝对路径"\"替换成"/"
        return picImgUrl.toString().replaceAll("\\\\", "/");
    }


    /**
     * 从指定的数组中随机数组中的某个元素
     *
     * @param param 指定的数组
     * @return 随机元素
     */
    public static <T> T randomItem(T[] param) {
        int index = integer(0, param.length);
        return param[index];
    }

    /**
     * 生成制定范围内的随机数
     *
     * @param scopeMin 最小数
     * @param scoeMax  最大数
     * @return 随机数
     */
    public static int integer(int scopeMin, int scoeMax) {
        Random random = new Random();
        return random.nextInt(scoeMax) % (scoeMax - scopeMin + 1) + scopeMin;
    }
}
