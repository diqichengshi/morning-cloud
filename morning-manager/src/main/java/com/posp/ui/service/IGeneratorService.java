package com.posp.ui.service;

import com.posp.message.common.exception.PospBusinessException;

/**
 * 代码生成服务
 *
 * @version v1.0.1, 2018/09/06  02:00:06 下午
 * @author 高峰
 */
public interface IGeneratorService {

    /**
     * 生成代码
     *
     * @param tableNames
     * @param serviceName
     * @param menuName
     * @return
     * @throws PospBusinessException
     * @version v1.0.1, 2018/09/06  02:00:06 下午
     * @author 高峰
     */
    byte[] generatorCode(String[] tableNames, String serviceName, String packageName) throws PospBusinessException;
}
