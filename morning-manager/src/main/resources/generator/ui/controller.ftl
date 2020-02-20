package com.posp.ui.web;

import java.util.List;
import java.util.Map;

import com.posp.tool.common.log.SysLog;
import com.posp.ui.config.WebLog;
import org.apache.shiro.authz.annotation.RequiresPermissions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import ${commonPackageName}.ao.*;
import ${commonPackageName}.bo.*;
import ${commonPackageName}.entity.*;
import ${commonPackageName}.query.*;
import com.posp.tool.common.string.StringUtil;
import com.posp.ui.entity.ResultDTO;
import com.posp.ui.feign.*;
import com.posp.ui.util.ShiroUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * ${table.comments!""}相关Controller
 *
 * @date ${dateTime}
 * @author ${author}
 */
@Controller
@Slf4j
@RequestMapping("/${table.smallCamelName}")
public class ${table.bigCamelName}Controller {
    @Autowired
    I${table.bigCamelName}ServiceFeign ${table.smallCamelName}ServiceFeign;

    /**
     * 新增记录
     *
     * @param params
     * @return
     * @date ${dateTime}
     * @author ${author}
     */
    @ResponseBody
    @PostMapping("/add")
    @RequiresPermissions("${table.smallCamelName}/add")
    @SysLog(value = "新增${table.comments!""}记录")
    @WebLog
    public ResultDTO add(@RequestParam Map<String, Object> params) {
        ${table.bigCamelName}AO record = new ${table.bigCamelName}AO();
        <#list columnList as item>
            <#if item.propertyName == pkColumn.propertyName
                || item.propertyName == "createTime"
                || item.propertyName == "lastUserId"
                || item.propertyName == "lastModTime">
            <#elseif item.propertyName == "createUserId">
        record.set${item.propertyName?cap_first}(ShiroUtil.getUserName());
            <#else>
        ${item.javaType} ${item.propertyName} = (${item.javaType}) params.get("${item.propertyName}");
        if (StringUtil.isNotBlack(${item.propertyName})) {
            record.set${item.propertyName?cap_first}(${item.propertyName});
        }
            </#if>

        </#list>
        RespMsgDTO resp = ${table.smallCamelName}ServiceFeign.insert(record);
        if (!ServiceErrorCodeEnum.SERVICE_OK.getCode().equals(resp.getCode())) {
            return ResultDTO.error(resp.getMessage());
        }
        return ResultDTO.ok();
    }

    /**
     * 新增页面
     *
     * @return
     * @date ${dateTime}
     * @author ${author}
     */
    @GetMapping("/addPage")
    @RequiresPermissions("${table.smallCamelName}/add")
    public String addPage() {
        return "${table.smallCamelName}/add";
    }

    /**
     * 删除单条记录
     *
     * @param id
     * @return
     * @date ${dateTime}
     * @author ${author}
     */
    @ResponseBody
    @PostMapping("/delete/{${pkColumn.propertyName}}")
    @RequiresPermissions("${table.smallCamelName}/delete")
    @SysLog(value = "删除${table.comments!""}记录")
    @WebLog
    public ResultDTO delete(@PathVariable("${pkColumn.propertyName}") ${pkColumn.javaType} ${pkColumn.propertyName}) {
        RespMsgDTO resp = ${table.smallCamelName}ServiceFeign.delete(${pkColumn.propertyName});
        if (!ServiceErrorCodeEnum.SERVICE_OK.getCode().equals(resp.getCode())) {
            return ResultDTO.error(resp.getMessage());
        }
        return ResultDTO.ok();
    }

    /**
     * 删除多条记录
     *
     * @param ${pkColumn.propertyName}s
     * @return
     * @date ${dateTime}
     * @author ${author}
     */
    @ResponseBody
    @PostMapping("/batchDelete")
    @RequiresPermissions("${table.smallCamelName}/batchDelete")
    @SysLog(value = "批量删除${table.comments!""}记录")
    @WebLog
    public ResultDTO batchDelete(@RequestParam(value = "ids") ${pkColumn.javaType}[] ${pkColumn.propertyName}s) {
        RespMsgDTO resp = ${table.smallCamelName}ServiceFeign.batchDelete(${pkColumn.propertyName}s);
        if (!ServiceErrorCodeEnum.SERVICE_OK.getCode().equals(resp.getCode())) {
            return ResultDTO.error(resp.getMessage());
        }
        return ResultDTO.ok();
    }

    /**
     * 详情页面
     *
     * @param ${pkColumn.propertyName}
     * @return
     * @date ${dateTime}
     * @author ${author}
     */
    @GetMapping("/detailPage/{${pkColumn.propertyName}}")
    @RequiresPermissions("${table.smallCamelName}/detail")
    public ModelAndView detailPage(@PathVariable("${pkColumn.propertyName}") ${pkColumn.javaType} ${pkColumn.propertyName}) {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("${table.smallCamelName}/detail");
        RespMsgDTO<${table.bigCamelName}DO> resp   = ${table.smallCamelName}ServiceFeign.get(${pkColumn.propertyName});
        ${table.bigCamelName}DO             entity = resp.getData();
        if (null != entity) {
            mode.addObject("entity", entity);
        }
        return mode;
    }

    /**
     * 修改记录
     *
     * @param params
     * @return
     * @date ${dateTime}
     * @author ${author}
     */
    @ResponseBody
    @PostMapping("/edit")
    @RequiresPermissions("${table.smallCamelName}/edit")
    @SysLog(value = "修改${table.comments!""}记录")
    @WebLog
    public ResultDTO edit(@RequestParam Map<String, Object> params) {
        ${table.bigCamelName}BO record     = new ${table.bigCamelName}BO();

        <#list columnList as item>
            <#if item.propertyName == "lastModTime"
                || item.propertyName == "createTime"
                || item.propertyName == "createUserId">
            <#elseif item.propertyName == "lastUserId">
        record.set${item.propertyName?cap_first}(ShiroUtil.getUserName());
            <#else>
        ${item.javaType} ${item.propertyName} = (${item.javaType}) params.get("${item.propertyName}");
        if (StringUtil.isNotBlack(${item.propertyName})) {
            record.set${item.propertyName?cap_first}(${item.propertyName});
        }
            </#if>

        </#list>
        RespMsgDTO resp = ${table.smallCamelName}ServiceFeign.update(record);
        if (!ServiceErrorCodeEnum.SERVICE_OK.getCode().equals(resp.getCode())) {
            return ResultDTO.error(resp.getMessage());
        }
        return ResultDTO.ok();
    }

    /**
     * 修改页面
     *
     * @param ${pkColumn.propertyName}
     * @return
     * @date ${dateTime}
     * @author ${author}
     */
    @GetMapping("/editPage/{${pkColumn.propertyName}}")
    @RequiresPermissions("${table.smallCamelName}/edit")
    public ModelAndView editPage(@PathVariable("${pkColumn.propertyName}") ${pkColumn.javaType} ${pkColumn.propertyName}) {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("${table.smallCamelName}/edit");
        RespMsgDTO<${table.bigCamelName}DO> resp   = ${table.smallCamelName}ServiceFeign.get(${pkColumn.propertyName});
        ${table.bigCamelName}DO             entity = resp.getData();
        if (null != entity) {
            mode.addObject("entity", entity);
        }
        return mode;
    }

    /**
     * 主页面
     *
     * @return
     * @date ${dateTime}
     * @author ${author}
     */
    @GetMapping()
    @RequiresPermissions("${table.smallCamelName}")
    public String home() {
        return "${table.smallCamelName}/list";
    }

    /**
     * 查询主页数据
     *
     * @param params
     * @return
     * @date ${dateTime}
     * @author ${author}
     */
    @ResponseBody
    @PostMapping("/list")
    @RequiresPermissions("${table.smallCamelName}")
    @SysLog(value = "查询${table.comments!""}分页记录")
    public ResultDTO list(@RequestParam Map<String, Object> params) {
        // 查询列表数据,page当前页数,limit每页显示记录条数
        Integer page  = Integer.parseInt((String) params.get("page"));
        Integer limit = Integer.parseInt((String) params.get("limit"));
        ${table.bigCamelName}Query query = new ${table.bigCamelName}Query();
        query.setPageSize(limit);
        query.setPageNumber(page);
        <#list columnList as item>
            <#if item.javaType == "Date">
        String ${item.propertyName}Start = (String) params.get("${item.propertyName}Start");
        if (StringUtil.isNotBlack(${item.propertyName}Start)) {
            query.set${item.propertyName?cap_first}Start(${item.propertyName}Start);
        }
        String ${item.propertyName}End = (String) params.get("${item.propertyName}End");
        if (StringUtil.isNotBlack(${item.propertyName}End)) {
            query.set${item.propertyName?cap_first}End(${item.propertyName}End);
        }
            <#else>
        ${item.javaType} ${item.propertyName} = (${item.javaType}) params.get("${item.propertyName}");
        if (StringUtil.isNotBlack(${item.propertyName})) {
            query.set${item.propertyName?cap_first}(${item.propertyName});
        }
        </#if>
        </#list>

        //权限相关属性
        query.setUserNo(ShiroUtil.getUserName());
        query.setOrganizeCode(ShiroUtil.getUserEntity().getOrgCode());
        query.setPermissionType(ShiroUtil.getUserEntity().getDataPermission());

        RespMsgDTO<List<${table.bigCamelName}DO>> resp = ${table.smallCamelName}ServiceFeign.listPage(query);
        List<${table.bigCamelName}DO>             list = resp.getData();
        if ((null == list) || list.isEmpty()) {
            return ResultDTO.ok();
        }
        return ResultDTO.ok().setData(list).setCount(resp.getTotal());
    }
}