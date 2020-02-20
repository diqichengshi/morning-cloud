package com.posp.ui.feign;

import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.*;

import com.posp.message.common.dto.RespMsgDTO;
import ${commonPackageName}.ao.*;
import ${commonPackageName}.common.bo.*;
import ${commonPackageName}.common.entity.*;
import ${commonPackageName}.common.query.*;
import com.posp.ui.feign.impl.*;

/**
 * ${table.comments!""}服务
 *
 * @date ${dateTime}
 * @author  ${author}
 */
@FeignClient(
    name     = "${serviceName}-service",
    url      = "${r'${web.ui.gateway}'}/api/web-ui-gateway/${serviceName}-service/v1/${table.smallCamelName}s",
    fallback = ${table.bigCamelName}ServiceFeignHystrixImpl.class
)
public interface I${table.bigCamelName}ServiceFeign {

    /**
     * 删除指定id的记录
     *
     * @param ${pkColumn.propertyName} 记录pk主键
     * @return
     */
    @DeleteMapping("/${pkColumn.propertyName}")
    RespMsgDTO delete(@RequestParam("${pkColumn.propertyName}") ${pkColumn.javaType} ${pkColumn.propertyName});

    /**
     * 添加记录
     *
     * @param record 新增类
     * @return RespMsgDTO 成功或失败
     */
    @PostMapping()
    RespMsgDTO insert(@RequestBody ${table.bigCamelName}AO record);

    /**
     * 根据条件查询记录，返回列表
     *
     * @param query 查询条件类
     * @return RespMsgDTO<List<${table.bigCamelName}DO>> 列表
     */
    @PostMapping("/params")
    RespMsgDTO<List<${table.bigCamelName}DO>> listPage(@RequestBody ${table.bigCamelName}Query query);

    /**
     * 修改指定id的记录
     *
     * @param record 修改类,必须设置id
     * @return RespMsgDTO 成功或失败
     */
    @PutMapping()
    RespMsgDTO update(@RequestBody ${table.bigCamelName}BO record);

    /**
     * 获取指定id的记录
     *
     * @param ${pkColumn.propertyName} 记录pk主键
     * @return
     */
    @GetMapping("/${pkColumn.propertyName}")
    RespMsgDTO<${table.bigCamelName}DO> get(@RequestParam("${pkColumn.propertyName}") ${pkColumn.javaType} ${pkColumn.propertyName});

    /**
     * 批量新增记录
     * @param list 记录列表
     * @return 成功或失败
     */
    @PostMapping("/batch")
    RespMsgDTO batchInsert(@RequestBody List<${table.bigCamelName}AO> list);

    /**
     * 批量删除指定ID的记录
     * @param ids 记录主键数组
     * @return 成功或失败
     */
    @DeleteMapping("/batch/ids")
    RespMsgDTO batchDelete(@RequestParam(value = "ids") String[] ids);
}
