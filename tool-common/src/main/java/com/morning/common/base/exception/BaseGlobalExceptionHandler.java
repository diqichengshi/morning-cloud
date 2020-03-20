package com.morning.common.base.exception;

import com.morning.common.base.MorningResult;
import com.morning.common.base.exception.enums.SystemErrorEnum;
import com.morning.common.log.LogUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.sql.SQLException;


/**
 * @author: gaof
 * @create: 2018/10/15 13:38
 * @version: v1.0.1
 * @Description: 全局统一的异常处理类, 只处理基本异常
 */
@ControllerAdvice
@Slf4j
public class BaseGlobalExceptionHandler {
    /**
     * 处理@RequestBody类型的异常
     *
     * @param e 异常类
     * @return 校验异常
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    public MorningResult<String> handleValidationException(MethodArgumentNotValidException e, HttpServletRequest request) {
        LogUtil.logHeader(request);
        StringBuffer errors = new StringBuffer();
        BindingResult bindingResult = e.getBindingResult();
        if (bindingResult.hasErrors()) {
            for (FieldError fieldError : bindingResult.getFieldErrors()) {
                errors.append(fieldError.getDefaultMessage());
            }
        }
        LogUtil.logResult(0L
                , SystemErrorEnum.SYSTEM_VALIDATED_ERROR + errors.toString());
        MorningResult<String> result=MorningResult.error(SystemErrorEnum.SYSTEM_VALIDATED_ERROR);
        result.appendMsg(errors.toString());
        return result;
    }

    /**
     * 处理@RequestParam类型的异常 @Validated要注解在类上
     *
     * @param e 异常类
     * @return 校验异常
     */
    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseBody
    public MorningResult<String> handleValidationException(ConstraintViolationException e) {
        StringBuffer errors = new StringBuffer();

        for (ConstraintViolation<?> s : e.getConstraintViolations()) {
            errors.append(s.getInvalidValue() + ": " + s.getMessage());
        }
        LogUtil.logResult(0L
                , SystemErrorEnum.SYSTEM_VALIDATED_ERROR + errors.toString());
        MorningResult<String> result=MorningResult.error(SystemErrorEnum.SYSTEM_VALIDATED_ERROR);
        result.appendMsg(errors.toString());
        return result;
    }

    /**
     * controller的异常补漏处理，以防业务上没有处理，接口直接报异常，虽然把异常信息返回给发送端不友好，但是利于后期维护
     *
     * @param e 异常类
     * @return 业务异常
     */
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public MorningResult<String> handleException(Exception e) {
        log.info("异常信息:{}", e.getMessage());
        log.error(ExceptionUtils.getStackTrace(e));
        LogUtil.logResult(0L, SystemErrorEnum.SYSTEM_INNER_ERROR + e.toString());
        MorningResult<String> result=MorningResult.error(SystemErrorEnum.SYSTEM_INNER_ERROR);
        result.appendMsg(e.getMessage());
        return result;
    }

    /**
     * 自定义业务异常
     *
     * @param e 异常类
     * @return 业务失败
     */
    @ExceptionHandler(BusinessException.class)
    @ResponseBody
    public MorningResult<String> handleBusinessException(BusinessException e) {
        log.info("自定义异常信息:{}", e.getMessage());
        LogUtil.logResult(0L, SystemErrorEnum.SYSTEM_BUSINESS_ERROR.getCode() +":" + e.getMessage());
        MorningResult<String> result=MorningResult.error(SystemErrorEnum.SYSTEM_BUSINESS_ERROR);
        result.appendMsg(e.getMessage().toString());
        return result;
    }

    /**
     * 数据库异常
     *
     * @param e 异常类
     * @return 业务失败
     */
    @ExceptionHandler(DataAccessException.class)
    @ResponseBody
    public MorningResult<String> handleDataAccessException(DataAccessException e) {
        log.info("数据库异常信息:{}", e.getMessage());
        log.error(ExceptionUtils.getStackTrace(e));
        String error = SqlExceptionUtil.parseSqlException(e.getMessage());

        LogUtil.logResult(0L
                , SystemErrorEnum.SYSTEM_INNER_ERROR.getCode()+":" + e.getMessage());
        MorningResult<String> result=MorningResult.error(SystemErrorEnum.SYSTEM_INNER_ERROR);
        result.appendMsg(error);
        return result;
    }

    /**
     * 数据库异常
     *
     * @param e 异常类
     * @return 业务失败
     */
    @ExceptionHandler(SQLException.class)
    @ResponseBody
    public MorningResult<String> handleSQLException(SQLException e) {
        log.info("数据库异常信息:{}", e.getMessage());
        log.error(ExceptionUtils.getStackTrace(e));
        // String error = SqlExceptionUtil.parseSqlException(e.getMessage());

        LogUtil.logResult(0L, SystemErrorEnum.SYSTEM_INNER_ERROR + ":" + e.getMessage());
        MorningResult<String> result=MorningResult.error(SystemErrorEnum.SYSTEM_INNER_ERROR);
        result.appendMsg(e.getMessage().toString());
        return result;
    }
}
