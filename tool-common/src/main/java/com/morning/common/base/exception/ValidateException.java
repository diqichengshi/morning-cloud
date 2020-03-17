package com.morning.common.base.exception;

/**
 * 
* 类名称：ValidateException
* 类描述：ValidateException 验证异常   
* 创建人：赵娟娟
* 创建时间：2017年3月31日 下午12:55:39   
*
 */
public class ValidateException extends BaseException {

	private static final long serialVersionUID = 1L;
	
	/** 返回状态码 */
	private Integer code;
	
	public ValidateException() {
		super();
	}
	
	public ValidateException(String message) {
		super(message);
	}

	public ValidateException(AbstractBaseExceptionEnum exceptionEnum) {
		super(exceptionEnum.getMessage());
		this.code = exceptionEnum.getCode();
	}
	
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

}
