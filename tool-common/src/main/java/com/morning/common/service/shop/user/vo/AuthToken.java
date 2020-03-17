package com.morning.common.service.shop.user.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by 赵娟 on 2019/5/9.
 * 描述:
 */
@Data
public class AuthToken implements Serializable {

    private static final long serialVersionUID = 1L;

    private String accessToken;
    private String expiresIn;
    private String loginName;
    private Date timestamp;
}
