package com.posp.ui.web;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.posp.common.service.user.entyty.LogDO;
import com.posp.ui.service.IMenuService;
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

import com.posp.common.service.user.ao.MenuAO;
import com.posp.common.service.user.bo.MenuBO;
import com.posp.common.service.user.entyty.MenuDO;
import com.posp.common.service.user.query.MenuQuery;
import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import com.posp.tool.common.log.SysLog;
import com.posp.tool.common.string.StringUtil;
import com.posp.ui.config.WebLog;
import com.posp.ui.entity.ResultDTO;
import com.posp.ui.util.ShiroUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * 菜单相关Controller
 *
 * @author auto generator
 * @date 2018/11/15 17:28:55
 */
@Controller
@Slf4j
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private IMenuService menuService;

    /**
     * 新增记录
     *
     * @param params
     * @return
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/add")
    @RequiresPermissions("menu/add")
    @SysLog(value = "新增菜单记录")
    @WebLog
    public ResultDTO add(@RequestParam Map<String, Object> params) {
        MenuAO record = new MenuAO();
        String parentId = (String) params.get("parentId");

        if (StringUtil.isNotBlack(parentId)) {
            record.setParentId(parentId);
        }

        String name = (String) params.get("name");

        if (StringUtil.isNotBlack(name)) {
            record.setName(name);
        }

        String url = (String) params.get("url");

        if (StringUtil.isNotBlack(url)) {
            record.setUrl(url);
        }

        String perms = (String) params.get("perms");

        if (StringUtil.isNotBlack(perms)) {
            record.setPerms(perms);
        }

        String type = (String) params.get("type");

        if (StringUtil.isNotBlack(type)) {
            record.setType(type);
        }

        String icon = (String) params.get("icon");

        if (StringUtil.isNotBlack(icon)) {
            record.setIcon(icon);
        }

        String sortNo = (String) params.get("sortNo");

        if (StringUtil.isNotBlack(sortNo)) {
            record.setSortNo(sortNo);
        }

        String remark = (String) params.get("remark");
        if (StringUtil.isNotBlack(remark)) {
            record.setRemark(remark);
        }
        record.setCreateUserId(ShiroUtil.getUserName());

        menuService.insert(record);

        return ResultDTO.ok();
    }

    /**
     * 新增页面
     *
     * @return
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    @GetMapping("/addPage")
    @RequiresPermissions("menu/add")
    public String addPage() {
        return "menu/add";
    }

    /**
     * 删除单条记录
     *
     * @param id
     * @return
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/delete/{id}")
    @RequiresPermissions("menu/delete")
    @SysLog(value = "删除菜单记录")
    @WebLog
    public ResultDTO delete(@PathVariable("id") String id) {
        menuService.delete(id);
        return ResultDTO.ok();
    }

    /**
     * 删除多条记录
     *
     * @param ids
     * @return
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/batchDelete")
    @RequiresPermissions("menu/batchDelete")
    @SysLog(value = "批量删除菜单记录")
    @WebLog
    public ResultDTO batchDelete(@RequestParam(value = "ids") String[] ids) {
        menuService.batchDelete(ids);
        return ResultDTO.ok();
    }

    /**
     * 详情页面
     *
     * @param id
     * @return
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    @GetMapping("/detailPage/{id}")
    @RequiresPermissions("menu/detail")
    public ModelAndView detailPage(@PathVariable("id") String id) {
        ModelAndView model = new ModelAndView();
        model.setViewName("menu/detail");
        MenuDO entity = menuService.get(id);
        if (null != entity) {
            model.addObject("entity", entity);
        }

        return model;
    }

    /**
     * 修改记录
     *
     * @param params
     * @return
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/edit")
    @RequiresPermissions("menu/edit")
    @SysLog(value = "修改菜单记录")
    @WebLog
    public ResultDTO edit(@RequestParam Map<String, Object> params) {
        MenuBO record = new MenuBO();
        String id = (String) params.get("id");

        if (StringUtil.isNotBlack(id)) {
            record.setId(id);
        }

        String parentId = (String) params.get("parentId");

        if (StringUtil.isNotBlack(parentId)) {
            record.setParentId(parentId);
        }

        String name = (String) params.get("name");

        if (StringUtil.isNotBlack(name)) {
            record.setName(name);
        }

        String url = (String) params.get("url");

        if (StringUtil.isNotBlack(url)) {
            record.setUrl(url);
        }

        String perms = (String) params.get("perms");

        if (StringUtil.isNotBlack(perms)) {
            record.setPerms(perms);
        }

        String type = (String) params.get("type");

        if (StringUtil.isNotBlack(type)) {
            record.setType(type);
        }

        String icon = (String) params.get("icon");

        if (StringUtil.isNotBlack(icon)) {
            record.setIcon(icon);
        }

        String sortNo = (String) params.get("sortNo");

        if (StringUtil.isNotBlack(sortNo)) {
            record.setSortNo(sortNo);
        }

        String remark = (String) params.get("remark");
        if (StringUtil.isNotBlack(remark)) {
            record.setRemark(remark);
        } else {
        	record.setRemark("");
        }
        record.setLastUserId(ShiroUtil.getUserName());

        menuService.update(record);
        return ResultDTO.ok();
    }

    /**
     * 修改页面
     *
     * @param id
     * @return
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    @GetMapping("/editPage/{id}")
    @RequiresPermissions("menu/edit")
    public ModelAndView editPage(@PathVariable("id") String id) {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("menu/edit");
        MenuDO entity = menuService.get(id);

        if (null != entity) {
            mode.addObject("entity", entity);
        }

        return mode;
    }

    /**
     * 主页面
     *
     * @return
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    @GetMapping()
    @RequiresPermissions("menu")
    public String home() {
        return "menu/list";
    }

    /**
     * 查询主页数据
     *
     * @param params
     * @return
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/list")
    @RequiresPermissions("menu")
    @SysLog(value = "查询菜单分页记录")
    public ResultDTO list(@RequestParam Map<String, Object> params) {
        // 查询列表数据,page当前页数,limit每页显示记录条数
        Integer page = Integer.parseInt((String) params.get("page"));
        Integer limit = Integer.parseInt((String) params.get("limit"));
        MenuQuery query = new MenuQuery();

        query.setPageSize(limit);
        query.setPageNumber(page);

        String id = (String) params.get("id");

        if (StringUtil.isNotBlack(id)) {
            query.setId(id);
        }

        String parentId = (String) params.get("parentId");

        if (StringUtil.isNotBlack(parentId)) {
            query.setParentId(parentId);
        }

        String name = (String) params.get("name");

        if (StringUtil.isNotBlack(name)) {
            query.setName(name);
        }

        String url = (String) params.get("url");

        if (StringUtil.isNotBlack(url)) {
            query.setUrl(url);
        }

        String perms = (String) params.get("perms");

        if (StringUtil.isNotBlack(perms)) {
            query.setPerms(perms);
        }

        String type = (String) params.get("type");

        if (StringUtil.isNotBlack(type)) {
            query.setType(type);
        }

        String icon = (String) params.get("icon");

        if (StringUtil.isNotBlack(icon)) {
            query.setIcon(icon);
        }

        String sortNo = (String) params.get("sortNo");

        if (StringUtil.isNotBlack(sortNo)) {
            query.setSortNo(sortNo);
        }
        String remark = (String) params.get("remark");
        if (StringUtil.isNotBlack(remark)) {
            query.setRemark(remark);
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

        String lastUserId = (String) params.get("lastUserId");

        if (StringUtil.isNotBlack(lastUserId)) {
            query.setLastUserId(lastUserId);
        }

        String lastModTimeStart = (String) params.get("lastModTimeStart");

        if (StringUtil.isNotBlack(lastModTimeStart)) {
            query.setLastModTimeStart(lastModTimeStart);
        }

        String lastModTimeEnd = (String) params.get("lastModTimeEnd");

        if (StringUtil.isNotBlack(lastModTimeEnd)) {
            query.setLastModTimeEnd(lastModTimeEnd);
        }

        //权限相关属性
        query.setUserNo(ShiroUtil.getUserName());
        query.setOrganizeCode(ShiroUtil.getUserEntity().getOrgCode());
        query.setPermissionType(ShiroUtil.getUserEntity().getDataPermission());
        List<MenuDO> list = menuService.listPage(query);

        if ((null == list) || list.isEmpty()) {
            return ResultDTO.ok();
        }

        // 如果list不为空,获取总记录数
        PageInfo<LogDO> pageInfo = new PageInfo(list);
        Long             total    = pageInfo.getTotal();
        return ResultDTO.ok().setData(list).setCount(total);
    }
}
