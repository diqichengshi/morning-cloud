//~ Formatted by Jindent --- http://www.jindent.com
package com.morning.common.base.exception;

/**
 * sql异常解析工具类
 *
 * @version v1.0.1, 2018/09/05  08:46:37 下午
 * @author 高峰
 */
public class SqlExceptionUtil {

    /**
     * 解析sql的异常信息，正常的异常信息非常多的信息，把这个异常信息返回给请求端，不太友好，此方法尝试解析，如果无法解析，则原信息返回
     *
     * @param sqlError e.getMessage()
     * @return 解析后比较友好并且准确的异常信息
     * @version v1.0.1, 2018/09/05  08:48:28 下午
     * @author 高峰
     */
    public static String parseSqlException(String sqlError) {
        String   error  = sqlError;
        String[] errors = sqlError.split("\n");
        for (String err : errors) {
            if (err.contains("ORA")) {
                String[] oracleErrors = err.split("ORA");
                error = "ORA" + oracleErrors[1];
                break;
            }
        }
        return error;
    }
}
