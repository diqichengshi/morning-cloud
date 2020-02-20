//~ Formatted by Jindent --- http://www.jindent.com
package com.posp.ui.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.posp.common.service.user.entyty.UserDO;

import lombok.Data;
import org.apache.commons.lang3.StringUtils;

/**
 * 用户类
 *
 * @author 高峰
 * @version v1.0.1, 2018/09/06  01:53:48 下午
 */
@Data
public class UserVO implements Serializable {
    private static final long serialVersionUID = -1373760761780840081L;

    /**
     * 主键ID
     */
    String id;

    /**
     * 用户名
     */
    String username;

    /**
     * 密码
     */
    String password;

    /**
     * 真实姓名
     */
    String name;

    /**
     * 预留信息
     */
    String loginReserve;

    /**
     * 邮箱
     */
    String email;

    /**
     * 手机号
     */
    String mobile;

    /**
     * 部门编码
     */
    String orgCode;

    /**
     * 数据权限
     */
    String dataPermission;

    /**
     * 机构组
     */
    String groupCodes;

    /**
     * 状态:0-禁用,1-正常
     */
    String status;

    /**
     * 是否删除:0-未删除,1-已删除
     */
    String deleteStatus;

    /**
     * 密码错误次数
     */
    Long pwdErrorCnt;

    /**
     * 创建时间
     */
    @JsonFormat(
            timezone = "GMT+8",
            pattern = "yyyy-MM-dd HH:mm:ss"
    )
    Date createTime;

    /**
     * 密码最后修改时间
     */
    Date passwordModifyTime;

    /**
     * 最后一次登录时间
     */
    Date lastLoginTime;
    
    /**
     * 是否管理员 0 否 1是
     */
    String isOperate;

    /**
     * 角色ID列表
     */
    List<Integer> roleIdList;

    /**
     * 部门组索引
     * 运营:-1,分公司:1,一代:10,子代:大于10
     */
    String groupCodesIndex;

    /**
     * Constructs ...
     *
     * @param user
     * @version v1.0.1, 2018/09/06  01:53:48 下午
     * @author 高峰
     */
    public UserVO(UserDO user) {
        this.setId(user.getId());
        this.setMobile(user.getMobile());
        this.setCreateTime(user.getCreateTime());
        this.setEmail(user.getEmail());
        this.setOrgCode(user.getOrgCode());
        this.setPassword(user.getPassword());
        this.setStatus(user.getStatus());
        this.setUsername(user.getUsername());
        this.setLoginReserve(user.getLoginReserve());
        this.setName(user.getName());
        this.setPwdErrorCnt(user.getPwdErrorCnt());
        this.setDataPermission(user.getDataPermission());
        this.setPasswordModifyTime(user.getPasswordModifyTime());
        this.setDeleteStatus(user.getDeleteStatus());
        this.setLastLoginTime(user.getLastLoginTime());
        this.setIsOperate(user.getIsOperate());
        this.setGroupCodes(user.getGroupCodes());
        if(StringUtils.isBlank(user.getGroupCodesIndex())){
            this.setGroupCodesIndex("-1");
        }else{
            this.setGroupCodesIndex(user.getGroupCodesIndex());
        }
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this,
                new SerializerFeature[]{
                        SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullListAsEmpty,
                        SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteNullNumberAsZero,
                        SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.UseISO8601DateFormat
                });
    }
}
