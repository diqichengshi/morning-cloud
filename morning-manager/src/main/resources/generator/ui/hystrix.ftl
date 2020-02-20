package com.posp.ui.feign.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import ${commonPackageName}.ao.*;
import ${commonPackageName}.bo.*;
import ${commonPackageName}.entity.*;
import ${commonPackageName}.query.*;
import com.posp.ui.feign.*;

/**
 * ${table.comments}服务熔断类
 *
 * @date ${dateTime}
 * @author  ${author}
 */
@Component
public class ${table.bigCamelName}ServiceFeignHystrixImpl implements I${table.bigCamelName}ServiceFeign {
    @Override
    public RespMsgDTO delete(${pkColumn.javaType} ${pkColumn.propertyName}) {
        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_NETSTAT_ERROR).appendMsg("${serviceName}-service:${table.bigCamelName}");
    }

    @Override
    public RespMsgDTO insert(${table.bigCamelName}AO record) {
        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_NETSTAT_ERROR).appendMsg("${serviceName}-service:${table.bigCamelName}");
    }

    @Override
    public RespMsgDTO<List<${table.bigCamelName}DO>> listPage(${table.bigCamelName}Query query) {
        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_NETSTAT_ERROR).appendMsg("${serviceName}-service:${table.bigCamelName}");
    }

    @Override
    public RespMsgDTO update(${table.bigCamelName}BO record) {
        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_NETSTAT_ERROR).appendMsg("${serviceName}-service:${table.bigCamelName}");
    }

    @Override
    public RespMsgDTO<${table.bigCamelName}DO> get(${pkColumn.javaType} ${pkColumn.propertyName}) {
        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_NETSTAT_ERROR).appendMsg("${serviceName}-service:${table.bigCamelName}");
    }

    @Override
    public RespMsgDTO batchInsert(List<${table.bigCamelName}AO> list) {
        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_NETSTAT_ERROR).appendMsg("${serviceName}-service:${table.bigCamelName}");
    }

    @Override
    public RespMsgDTO batchDelete(String[] ids) {
        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_NETSTAT_ERROR).appendMsg("${serviceName}-service:${table.bigCamelName}");
    }
}
