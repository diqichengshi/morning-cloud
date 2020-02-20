package com.posp.ui.web;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.posp.ui.service.ILogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.posp.common.service.user.ao.LogAO;
import com.posp.common.service.user.bo.LogBO;
import com.posp.common.service.user.entyty.LogDO;
import com.posp.common.service.user.query.LogQuery;
import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import com.posp.tool.common.log.SysLog;
import com.posp.tool.common.string.StringUtil;
import com.posp.ui.config.WebLog;
import com.posp.ui.entity.ResultDTO;
import com.posp.ui.util.ShiroUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * 操作日志相关Controller
 *
 * @date 2018/11/16 13:40:42
 * @author auto generator
 */
@Controller
@Slf4j
@RequestMapping("/log")
public class LogController {
    @Autowired
    ILogService logService;

    /**
     * 新增记录
     *
     * @param params
     * @return
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/add")
    @RequiresPermissions("log/add")
    @SysLog(value = "新增操作日志记录")
    @WebLog
    public ResultDTO add(@RequestParam Map<String, Object> params) {
        LogAO record = new LogAO();

        String ip = (String) params.get("ip");
        if (StringUtil.isNotBlack(ip)) {
            record.setIp(ip);
        }

        String url = (String) params.get("url");
        if (StringUtil.isNotBlack(url)) {
            record.setUrl(url);
        }

        String httpMethod = (String) params.get("httpMethod");
        if (StringUtil.isNotBlack(httpMethod)) {
            record.setHttpMethod(httpMethod);
        }

        String classMethod = (String) params.get("classMethod");
        if (StringUtil.isNotBlack(classMethod)) {
            record.setClassMethod(classMethod);
        }

        String args = (String) params.get("args");
        if (StringUtil.isNotBlack(args)) {
            record.setArgs(args);
        }

        String code = (String) params.get("code");
        if (StringUtil.isNotBlack(code)) {
            record.setCode(code);
        }

        String message = (String) params.get("message");
        if (StringUtil.isNotBlack(message)) {
            record.setMessage(message);
        }

        String remark = (String) params.get("remark");
        if (StringUtil.isNotBlack(remark)) {
            record.setRemark(remark);
        }

        String orgCode = (String) params.get("orgCode");
        if (StringUtil.isNotBlack(orgCode)) {
            record.setOrgCode(orgCode);
        }

        record.setCreateUserId(ShiroUtil.getUserName());

        logService.insert(record);

        return ResultDTO.ok();
    }

    /**
     * 新增页面
     *
     * @return
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    @GetMapping("/addPage")
    @RequiresPermissions("log/add")
    public String addPage() {
        return "log/add";
    }

    /**
     * 删除单条记录
     *
     * @param id
     * @return
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/delete/{id}")
    @RequiresPermissions("log/delete")
    @SysLog(value = "删除操作日志记录")
    @WebLog
    public ResultDTO delete(@PathVariable("id") String id) {
        logService.delete(id);
        return ResultDTO.ok();
    }

    /**
     * 删除多条记录
     *
     * @param ids
     * @return
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/batchDelete")
    @RequiresPermissions("log/batchDelete")
    @SysLog(value = "批量删除操作日志记录")
    @WebLog
    public ResultDTO batchDelete(@RequestParam(value = "ids") String[] ids) {
        logService.batchDelete(ids);
        return ResultDTO.ok();
    }

    /**
     * 详情页面
     *
     * @param id
     * @return
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    @GetMapping("/detailPage/{id}")
    @RequiresPermissions("log/detail")
    public ModelAndView detailPage(@PathVariable("id") String id) {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("log/detail");
        LogDO   entity = logService.get(id);
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
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/edit")
    @RequiresPermissions("log/edit")
    @SysLog(value = "修改操作日志记录")
    @WebLog
    public ResultDTO edit(@RequestParam Map<String, Object> params) {
        LogBO record     = new LogBO();

        String id = (String) params.get("id");
        if (StringUtil.isNotBlack(id)) {
            record.setId(id);
        }

        String ip = (String) params.get("ip");
        if (StringUtil.isNotBlack(ip)) {
            record.setIp(ip);
        }

        String url = (String) params.get("url");
        if (StringUtil.isNotBlack(url)) {
            record.setUrl(url);
        }

        String httpMethod = (String) params.get("httpMethod");
        if (StringUtil.isNotBlack(httpMethod)) {
            record.setHttpMethod(httpMethod);
        }

        String classMethod = (String) params.get("classMethod");
        if (StringUtil.isNotBlack(classMethod)) {
            record.setClassMethod(classMethod);
        }

        String args = (String) params.get("args");
        if (StringUtil.isNotBlack(args)) {
            record.setArgs(args);
        }

        String code = (String) params.get("code");
        if (StringUtil.isNotBlack(code)) {
            record.setCode(code);
        }

        String message = (String) params.get("message");
        if (StringUtil.isNotBlack(message)) {
            record.setMessage(message);
        }

        String remark = (String) params.get("remark");
        if (StringUtil.isNotBlack(remark)) {
            record.setRemark(remark);
        }

        String orgCode = (String) params.get("orgCode");
        if (StringUtil.isNotBlack(orgCode)) {
            record.setOrgCode(orgCode);
        }

        logService.update(record);

        return ResultDTO.ok();
    }

    /**
     * 修改页面
     *
     * @param id
     * @return
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    @GetMapping("/editPage/{id}")
    @RequiresPermissions("log/edit")
    public ModelAndView editPage(@PathVariable("id") String id) {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("log/edit");
        LogDO             entity   = logService.get(id);
        if (null != entity) {
            mode.addObject("entity", entity);
        }
        return mode;
    }

    /**
     * 主页面
     *
     * @return
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    @GetMapping()
    @RequiresPermissions("log")
    public String home() {
        return "log/list";
    }

    /**
     * 查询主页数据
     *
     * @param params
     * @return
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/list")
    @RequiresPermissions("log")
    @SysLog(value = "查询操作日志分页记录")
    public ResultDTO list(@RequestParam Map<String, Object> params) {
        // 查询列表数据,page当前页数,limit每页显示记录条数
        Integer page  = Integer.parseInt((String) params.get("page"));
        Integer limit = Integer.parseInt((String) params.get("limit"));
        LogQuery query = new LogQuery();
        query.setPageSize(limit);
        query.setPageNumber(page);
        String id = (String) params.get("id");
        if (StringUtil.isNotBlack(id)) {
            query.setId(id);
        }
        String ip = (String) params.get("ip");
        if (StringUtil.isNotBlack(ip)) {
            query.setIp(ip);
        }
        String url = (String) params.get("url");
        if (StringUtil.isNotBlack(url)) {
            query.setUrl(url);
        }
        String httpMethod = (String) params.get("httpMethod");
        if (StringUtil.isNotBlack(httpMethod)) {
            query.setHttpMethod(httpMethod);
        }
        String classMethod = (String) params.get("classMethod");
        if (StringUtil.isNotBlack(classMethod)) {
            query.setClassMethod(classMethod);
        }
        String args = (String) params.get("args");
        if (StringUtil.isNotBlack(args)) {
            query.setArgs(args);
        }
        String code = (String) params.get("code");
        if (StringUtil.isNotBlack(code)) {
            query.setCode(code);
        }
        String message = (String) params.get("message");
        if (StringUtil.isNotBlack(message)) {
            query.setMessage(message);
        }
        String remark = (String) params.get("remark");
        if (StringUtil.isNotBlack(remark)) {
            query.setRemark(remark);
        }
        String orgCode = (String) params.get("orgCode");
        if (StringUtil.isNotBlack(orgCode)) {
            query.setOrgCode(orgCode);
        }
        String createUserId = (String) params.get("createUserId");
        if (StringUtil.isNotBlack(createUserId)) {
            query.setCreateUserId(createUserId);
        }
        String createTimeStart = (String) params.get("createTimeStart");
        if (StringUtil.isNotBlack(createTimeStart)) {
            query.setCreateTimeStart(createTimeStart);
        }
        String createTimeEnd = (String) params.get("createTimeEnd");
        if (StringUtil.isNotBlack(createTimeEnd)) {
            query.setCreateTimeEnd(createTimeEnd);
        }

        //权限相关属性
        query.setUserNo(ShiroUtil.getUserName());
        query.setOrganizeCode(ShiroUtil.getUserEntity().getOrgCode());
        query.setPermissionType(ShiroUtil.getUserEntity().getDataPermission());

        List<LogDO>             list= logService.listPage(query);
        if ((null == list) || list.isEmpty()) {
            return ResultDTO.ok();
        }
        // 如果list不为空,获取总记录数
        PageInfo<LogDO> pageInfo = new PageInfo(list);
        Long             total    = pageInfo.getTotal();
        return ResultDTO.ok().setData(list).setCount(total);
    }
}