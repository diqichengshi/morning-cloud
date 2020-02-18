package com.morning.common.base.exception;

/**
 * 
* 项目名称：morning-common   
* 类名称：BusinessException   
* 类描述：BusinessException 业务异常   
* 创建人：赵娟娟
* 创建时间：2017年3月31日 下午12:53:32   
*
 */
public class BusinessException extends BaseException {

	private static final long serialVersionUID = 1L;
	
	/** 返回状态码 */
	private Integer code;
	
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

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}
	
}
