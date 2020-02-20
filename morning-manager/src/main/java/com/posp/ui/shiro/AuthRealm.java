package com.posp.ui.shiro;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.posp.common.service.user.bo.UserBO;
import com.posp.common.service.user.entyty.RoleDO;
import com.posp.ui.entity.MenuVO;
import com.posp.ui.entity.UserVO;
import com.posp.ui.service.IMenuService;
import com.posp.ui.service.IUserService;
import com.posp.ui.util.Constant;

/**
 * 认证授权
 *
 * @version v1.0.1, 2018/09/06  03:25:07 下午
 * @author 高峰
 */
public class AuthRealm extends AuthorizingRealm {
    @Autowired
    private IUserService userService;
    @Autowired
    private IMenuService menuService;

    /**
     * 认证(登录时调用)
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
        // 查询用户信息
        UserVO user = userService.getUserByName(username);
        // 账号不存在
        if (user == null) {
            throw new UnknownAccountException("用户名或密码不正确");
        }
        // 账号锁定，非有效状态
        if (Constant.USER_FROZEN.equals(user.getStatus())) {
            throw new LockedAccountException("该用户已经被冻结,请联系管理员");
        }
        // 密码错误
        if (!password.equals(user.getPassword())) {
            if(user.getPwdErrorCnt() >= 4){
                //冻结用户状态
                UserBO userBO = new UserBO();
                userBO.setId(user.getId());
                userBO.setStatus(Constant.USER_FROZEN);
                userService.update(userBO);
                throw new LockedAccountException("该用户已经被冻结,请联系管理员");
            }else{
                //修改用户密码错误次数
                UserBO userBO = new UserBO();
                userBO.setId(user.getId());
                userBO.setPwdErrorCnt(user.getPwdErrorCnt() + 1);
                userService.update(userBO);
            }
            throw new IncorrectCredentialsException("用户名或密码不正确");
        }
        // 登陆成功情况下，更新用户最后一次登录时间和密码错误次数清零和最后一次登录时间
        UserBO userBO = new UserBO();
        userBO.setId(user.getId());
        userBO.setLastLoginTime(new Date());
        if(user.getPwdErrorCnt() != 0) {
            userBO.setPwdErrorCnt(0l);
        }
        userService.update(userBO);
        if(null == user.getLoginReserve()){
            user.setLoginReserve("");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password, getName());
        return info;
    }

    /**
     * 授权(验证权限时调用)
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        UserVO user     = (UserVO) principals.getPrimaryPrincipal();
        String          userId   = user.getId();
        List<MenuVO> menuList = menuService.listByUserId(userId);
        if (null == menuList) {
            return new SimpleAuthorizationInfo();
        }
        List<String> permsList = new ArrayList<>();
        for (MenuVO menu : menuList) {
            permsList.add(menu.getPerms());
        }
        // 用户权限列表
        Set<String> permsSet = new HashSet<String>();
        for (String perms : permsList) {
            if (StringUtils.isBlank(perms)) {
                continue;
            }
            permsSet.addAll(Arrays.asList(perms.trim().split(",")));
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(permsSet);
        //用户角色列表
        List<RoleDO> roles = userService.listRolesById(userId);
        if(null != roles) {
            Set<String> rolesList = new HashSet<>();
            for (RoleDO role : roles) {
                if (StringUtils.isBlank(role.getName())) {
                    continue;
                }
                rolesList.add(role.getName());                
            }
			// 全部数据权限
			if ("00000000".equals(user.getOrgCode())) {
				rolesList.add("00000000");
			}
            info.setRoles(rolesList);
        }
        return info;
    }
}
