package com.morning.common.base;

import com.morning.common.base.exception.AbstractBaseExceptionEnum;
import lombok.Data;

import java.io.Serializable;


/**
 * The class Wrapper.
 *
 * @param <T> the type parameter
 */
@Data
public class MorningResult<T> implements Serializable {

    private static final long serialVersionUID = 4893280118017319089L;

    public static final Integer SUCCESS_CODE = 200;
    public static final String SUCCESS_MESSAGE = "操作成功";
    public static final Integer ERROR_CODE = 500;
    public static final String ERROR_MESSAGE = "内部异常";
    private Integer code; // 编号
    private String message; // 信息
    private T result; // 结果数据

    MorningResult() {
        this(SUCCESS_CODE, SUCCESS_MESSAGE);
    }


    MorningResult(Integer code, String message) {
        this(code, message, null);
    }

    MorningResult(Integer code, String message, T result) {
        super();
        this.code = code;
        this.message = message;
        this.result = result;
    }

    public static <E> MorningResult<E> ok() {
        return new MorningResult<>();
    }

    public static <E> MorningResult<E> ok(E o) {
        return new MorningResult<>(MorningResult.SUCCESS_CODE, MorningResult.SUCCESS_MESSAGE, o);
    }
    public static <T> MorningResult<T> error(AbstractBaseExceptionEnum exceptionEnum) {
        return new MorningResult<T>(exceptionEnum.getCode(), exceptionEnum.getMessage());
    }
    public MorningResult<T> appendMsg(String msg) {
        if (org.springframework.util.StringUtils.isEmpty(msg)) {
            return this;
        } else {
            String error = this.getMessage() + ":" + msg;
            this.setMessage(error);
            return this;
        }
    }
}
