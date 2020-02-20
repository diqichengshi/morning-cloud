package ${packageName}.web;

import java.util.List;
import com.posp.tool.common.log.SysLog;

import ${packageName}.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.github.pagehelper.PageInfo;

import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import ${commonPackageName}.ao.*;
import ${commonPackageName}.bo.*;
import ${commonPackageName}.entity.*;
import ${commonPackageName}.query.*;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import lombok.extern.slf4j.Slf4j;

/**
 * ${table.comments!""}相关APIs
 *
 * @date ${dateTime}
 * @author ${author}
 */
@RestController
@Slf4j
@Api(description = "${table.comments}相关APIs ")
@RequestMapping("/${table.smallCamelName}s")
@SuppressWarnings("unchecked")
public class ${table.bigCamelName}Controller {
    @Autowired
    I${table.bigCamelName}Service     ${table.smallCamelName}Service;

    /**
     * 删除指定ID的记录
     *
     * @param id 记录主键
     * @return RespMsgDTO 成功或失败
     * @date ${dateTime}
     * @author ${author}
     */
    @ApiOperation(value = "删除指定ID的记录",notes = "记录id必填")
    @DeleteMapping("/${pkColumn.propertyName}")
    @SysLog(value = "${table.comments!""}APIs-删除指定ID的记录")
    public RespMsgDTO delete(@RequestParam("${pkColumn.propertyName}") ${pkColumn.javaType} ${pkColumn.propertyName}) {
        int row = ${table.smallCamelName}Service.delete(${pkColumn.propertyName});

        if (0 == row) {
            return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_BUSINESS_ERROR).appendMsg("记录不存在");
        }
        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_OK);
    }

    /**
     * 批量删除指定ID的记录
     *
     * @param ids 记录主键数组
     * @return RespMsgDTO 成功或失败
     * @date ${dateTime}
     * @author ${author}
     */
    @ApiOperation(value = "批量删除指定ID的记录",notes = "记录id必填")
    @DeleteMapping("/batch/ids")
    @SysLog(value = "${table.comments!""}APIs-批量删除指定ID的记录")
    public RespMsgDTO batchDelete(@RequestParam(value = "ids") String[] ids) {
        int row = ${table.smallCamelName}Service.batchDelete(ids);

        if (0 == row) {
            return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_BUSINESS_ERROR).appendMsg("记录不存在");
        }

        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_OK);
    }
    /**
     * 新增记录
     *
     * @param record 数据类
     * @return 成功或失败
     * @date ${dateTime}
     * @author ${author}
     */
    @ApiOperation(value = "新增记录",notes = "新增记录")
    @PostMapping()
    @SysLog(value = "${table.comments!""}APIs-新增记录")
    public RespMsgDTO insert(@RequestBody ${table.bigCamelName}AO record) {
        //新增记录失败，会返回异常DataAccessException，由全局异常处理BaseGlobalExceptionHandler返回失败
        ${table.smallCamelName}Service.insert(record);

        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_OK);
    }

    /**
     * 批量新增记录
     *
     * @param list 记录列表
     * @return 成功或失败
     * @date ${dateTime}
     * @author ${author}
     */
    @ApiOperation(value = "批量新增记录",notes = "批量新增记录")
    @PostMapping("/batch")
    @SysLog(value = "数据字典APIs-批量新增记录")
    public RespMsgDTO batchInsert(@RequestBody List<${table.bigCamelName}AO> list) {
        //新增记录失败，会返回异常DataAccessException，由全局异常处理BaseGlobalExceptionHandler返回失败
        ${table.smallCamelName}Service.batchInsert(list);
        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_OK);
    }

    /**
     * 根据查询条件,获取记录数据[分页]
     *
     * @param query
     * @return ${table.bigCamelName}DO列表数据
     * @date ${dateTime}
     * @author ${author}
     */
    @ApiOperation(value = "根据查询条件,获取记录数据[分页]",notes = "pageNum:当前页数,pageSize:当前页显示记录数")
    @PostMapping("/params")
    @SysLog(value = "${table.comments!""}APIs-根据查询条件,获取记录数据[分页]", isPrint = false)
    public RespMsgDTO<List<${table.bigCamelName}DO>> listPage(@RequestBody ${table.bigCamelName}Query query) {
        List<${table.bigCamelName}DO> list = ${table.smallCamelName}Service.listPage(query);
        // 如果list为空,直接返回成功
        if (list.isEmpty()) {
            return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_OK);
        }
        // 如果list不为空,获取总记录数
        PageInfo<${table.bigCamelName}DO> pageInfo = new PageInfo(list);
        Long             total    = pageInfo.getTotal();

        return RespMsgDTO.build()
                .setErrorCode(ServiceErrorCodeEnum.SERVICE_OK)
                .setData(list)
                .setTotal(total);
    }

    /**
     * 修改指定ID的记录
     *
     * @param record 数据类
     * @return RespMsgDTO
     * @date ${dateTime}
     * @author ${author}
     */
    @ApiOperation(value = "修改指定ID的记录",notes = "记录id必填")
    @PutMapping()
    @SysLog(value = "${table.comments!""}APIs-修改指定ID的记录")
    public RespMsgDTO update(@RequestBody ${table.bigCamelName}BO record) {
        int row = ${table.smallCamelName}Service.update(record);
        if (0 == row) {
            return RespMsgDTO.build()
                    .setErrorCode(ServiceErrorCodeEnum.SERVICE_BUSINESS_ERROR)
                    .appendMsg("记录不存在");
        }

        return RespMsgDTO.build().setErrorCode(ServiceErrorCodeEnum.SERVICE_OK);
    }

    /**
     * 获取主键ID的记录
     *
     * @param ${pkColumn.propertyName} 主键ID
     * @return RespMsgDTO<${table.bigCamelName}DO>
     * @date ${dateTime}
     * @author ${author}
     */
    @ApiOperation(value = "获取Id的记录",notes = "记录id必填")
    @GetMapping("/${pkColumn.propertyName}")
    @SysLog(value = "${table.comments!""}APIs-获取Id的记录")
    public RespMsgDTO<${table.bigCamelName}DO> get(@RequestParam("${pkColumn.propertyName}") ${pkColumn.javaType} ${pkColumn.propertyName}) {
        ${table.bigCamelName}DO entity = ${table.smallCamelName}Service.get(${pkColumn.propertyName});

        if (null == entity) {
            return RespMsgDTO.build()
                    .setErrorCode(ServiceErrorCodeEnum.SERVICE_BUSINESS_ERROR)
                    .appendMsg("记录不存在");
        }

        return RespMsgDTO.build()
                .setErrorCode(ServiceErrorCodeEnum.SERVICE_OK)
                .setData(entity);
    }
}
