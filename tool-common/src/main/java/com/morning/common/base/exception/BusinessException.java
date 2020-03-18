package com.morning.common.base.exception;

/**
 * 
* 类名称：BusinessException
* 类描述：BusinessException 业务异常   
* 创建人：赵娟娟
* 创建时间：2017年3月31日 下午12:53:32   
*
 */
public class BusinessException extends BaseException {

	private static final long serialVersionUID = 1L;
	
	/** 返回状态码 */
	private String code;
	
	public BusinessException() {
		super();
	}
	
	public BusinessException(String message) {
		super(message);
	}

	public BusinessException(AbstractBaseExceptionEnum exception) {
		super(exception.getMessage());
		this.code = exception.getCode();
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}
