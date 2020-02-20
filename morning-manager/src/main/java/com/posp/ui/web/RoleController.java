package com.posp.ui.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.posp.common.service.user.entyty.*;
import com.posp.common.service.user.query.RoleMenuQuery;
import com.posp.message.common.exception.PospBusinessException;
import com.posp.ui.service.IRoleMenuService;
import com.posp.ui.service.IRoleService;
import com.posp.ui.service.IUserService;
import org.apache.commons.lang3.StringUtils;
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

import com.posp.common.service.user.ao.RoleAO;
import com.posp.common.service.user.ao.RoleMenuListAO;
import com.posp.common.service.user.bo.RoleBO;
import com.posp.common.service.user.query.MenuQuery;
import com.posp.common.service.user.query.RoleQuery;
import com.posp.message.common.constants.PermissionConstants;
import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import com.posp.tool.common.log.SysLog;
import com.posp.tool.common.string.StringUtil;
import com.posp.ui.config.WebLog;
import com.posp.ui.entity.MenuVO;
import com.posp.ui.entity.ResultDTO;
import com.posp.ui.service.IMenuService;
import com.posp.ui.util.ListUtil;
import com.posp.ui.util.ShiroUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * 角色相关Controller
 *
 * @author auto generator
 * @version v1.0.1, 2018/09/10 15:35:36
 */
@Controller
@Slf4j
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IMenuService menuService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleMenuService roleMenuService;

    /**
     * 新增记录
     *
     * @param params
     * @return
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/add")
    @RequiresPermissions("role/add")
    @SysLog(value = "新增角色记录")
    @WebLog
    public ResultDTO add(@RequestParam Map<String, Object> params) throws PospBusinessException {
        RoleAO record = new RoleAO();
        String name = (String) params.get("name");

        if (StringUtil.isNotBlack(name)) {
            record.setName(name);
        }

        String status = (String) params.get("status");

        if (StringUtil.isNotBlack(status)) {
            record.setStatus(status);
        }
        //如果不是运营操作，角色的部门编号为当前登录用户的部门编号
        /*if (!"0".equals(ShiroUtil.getUserEntity().getDataPermission())) {
        }*/

        record.setOrgCode(ShiroUtil.getUserEntity().getOrgCode());


        String remark = (String) params.get("remark");

        if (StringUtil.isNotBlack(remark)) {
            record.setRemark(remark);
        }

        record.setCreateUserId(ShiroUtil.getUserName());

        roleService.insert(record);

        return ResultDTO.ok();
    }

    /**
     * 新增页面
     *
     * @return
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    @GetMapping("/addPage")
    @RequiresPermissions("role/add")
    public String addPage() {
        return "role/add";
    }

    /**
     * 删除单条记录
     *
     * @param id
     * @return
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/delete/{id}")
    @RequiresPermissions("role/delete")
    @SysLog(value = "删除角色记录")
    @WebLog
    public ResultDTO delete(@PathVariable("id") String id) {
        roleService.delete(id);
        return ResultDTO.ok();
    }

    /**
     * 删除多条记录
     *
     * @param ids
     * @return
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/batchDelete")
    @RequiresPermissions("role/batchDelete")
    @SysLog(value = "批量删除角色记录")
    @WebLog
    public ResultDTO batchDelete(@RequestParam(value = "ids") String[] ids) {
        roleService.batchDelete(ids);
        return ResultDTO.ok();
    }

    /**
     * 详情页面
     *
     * @param id
     * @return
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    @GetMapping("/detailPage/{id}")
    @RequiresPermissions("role/detail")
    public ModelAndView detailPage(@PathVariable("id") String id) {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("role/detail");
        RoleDO entity = roleService.get(id);
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
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/edit")
    @RequiresPermissions("role/edit")
    @WebLog(value = "修改角色记录")
    public ResultDTO edit(@RequestParam Map<String, Object> params) throws PospBusinessException {
    	//只允许创建人修改创建的角色
    	String createUserId = (String) params.get("createUserId");
    	if(StringUtils.isBlank(createUserId) || !createUserId.equals(ShiroUtil.getUserName())) {
    		return ResultDTO.error("请选择本人创建的角色！");
    	}
    	
        RoleBO record = new RoleBO();
        String id = (String) params.get("id");

        if (StringUtil.isNotBlack(id)) {
            record.setId(id);
        }

        String name = (String) params.get("name");

        if (StringUtil.isNotBlack(name)) {
            record.setName(name);
        }

        String status = (String) params.get("status");

        if (StringUtil.isNotBlack(status)) {
            record.setStatus(status);
        }

        String orgCode = (String) params.get("orgCode");
        if (StringUtil.isNotBlack(orgCode)) {
            record.setOrgCode(orgCode);
        }
        String remark = (String) params.get("remark");
        if (StringUtil.isNotBlack(remark)) {
            record.setRemark(remark);
        } else {
        	record.setRemark("");
        }

        record.setLastUserId(ShiroUtil.getUserName());

        roleService.update(record);

        return ResultDTO.ok();
    }

    /**
     * 修改角色的菜单
     *
     * @param params
     * @return
     * @version v1.0.1, 2018/09/10  07:53:34 下午
     * @author 高峰
     */
    @ResponseBody
    @PostMapping("/menu/edit")
    @RequiresPermissions("role/menu")
    @WebLog(value = "分配菜单",removes = {"authids"})
    public ResultDTO editMenu(@RequestParam Map<String, Object> params) {
        // 遍历map，转换菜单的数据，tree提交的是多个值
        RoleMenuListAO record = new RoleMenuListAO();
        List<String> list = new ArrayList<>();

        record.setMenuList(list);

        for (String str : params.keySet()) {
            String value = (String) params.get(str);

            if ("roleId".equals(str)) {
                record.setRoleId(value);
            } else if ("roleName".equals(str)) {
                // 不处理
            } else {
                list.add(value);
            }
        }

        roleMenuService.changeMenuSample(record);

        return ResultDTO.ok();
    }

    /**
     * 修改页面
     *
     * @param id
     * @return
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    @GetMapping("/editPage/{id}")
    @RequiresPermissions("role/edit")
    public ModelAndView editPage(@PathVariable("id") String id) {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("role/edit");
        RoleDO entity = roleService.get(id);
        if (null != entity) {
            mode.addObject("entity", entity);
        }
        return mode;
    }

    /**
     * 主页面
     *
     * @return
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    @GetMapping()
    @RequiresPermissions("role")
    public ModelAndView home() {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("role/list");
        mode.addObject("loginUserName",ShiroUtil.getUserName());
        mode.addObject("loginIsOperate",ShiroUtil.getUserEntity().getIsOperate());
        mode.addObject("loginOrgCode",ShiroUtil.getUserEntity().getOrgCode());
        
       return mode;
    }

    /**
     * 查询主页数据
     *
     * @param params
     * @return
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/list")
    @RequiresPermissions("role")
    @SysLog(value = "查询角色分页记录")
    public ResultDTO list(@RequestParam Map<String, Object> params) {
        // 查询列表数据,page当前页数,limit每页显示记录条数
        Integer page = Integer.parseInt((String) params.get("page"));
        Integer limit = Integer.parseInt((String) params.get("limit"));
        RoleQuery query = new RoleQuery();
        query.setPageSize(limit);
        query.setPageNumber(page);
        String id = (String) params.get("id");
        if (StringUtil.isNotBlack(id)) {
            query.setId(id);
        }
        String name = (String) params.get("name");
        if (StringUtil.isNotBlack(name)) {
            query.setName(name);
        }
        String status = (String) params.get("status");
        if (StringUtil.isNotBlack(status)) {
            query.setStatus(status);
        }
        String orgCode = (String) params.get("orgCode");
        if (StringUtil.isNotBlack(orgCode)) {
            query.setOrgCode(orgCode);
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
        //运营用户查询全部，其他查询本机构        
        if("00000000".equals(ShiroUtil.getUserEntity().getOrgCode())) {
        	query.setPermissionType(PermissionConstants.DATA_PERMISSION_0);
        } else {
        	query.setPermissionType(PermissionConstants.DATA_PERMISSION_1);
        }

        List<RoleDO> list  = roleService.listPage(query);
        if ((null == list) || list.isEmpty()) {
            return ResultDTO.ok();
        }
        
        //设置页面登录用户信息
        for(RoleDO r : list) {
        	r.setLoginUserName(ShiroUtil.getUserName());
        }

        // 如果list不为空,获取总记录数
        PageInfo<LogDO> pageInfo = new PageInfo(list);
        Long             total    = pageInfo.getTotal();
        return ResultDTO.ok().setData(list).setCount(total);
    }

    /**
     * 分配菜单页面数据列表
     *
     * @param roleId
     * @return
     * @version v1.0.1, 2018/09/10  07:02:10 下午
     * @author 高峰
     */
    @ResponseBody
    @PostMapping("/menu/list/{roleId}")
    @RequiresPermissions("role/menu")
    public ResultDTO treeMenus(@PathVariable("roleId") String roleId) {

        // 登录用户的菜单列表，树形结构
        RoleDO role = roleService.get(roleId);
        List<MenuVO> menuList = null;
        if (ShiroUtil.getUserId().equals(role.getCreateUserId())) {
            menuList = menuService.listByUserIdForRole(ShiroUtil.getUserId());
        } else {
            UserDO userDO = userService.getByUsername(role.getCreateUserId());
            menuList = menuService.listByUserIdForRole(userDO.getId());
        }

        List<MenuVO> ret = new ArrayList<MenuVO>();
        if(!"00000000".equals(ShiroUtil.getUserEntity().getOrgCode()) || !"1".equals(ShiroUtil.getUserEntity().getIsOperate())) {
        	List<String> urlList = new ArrayList<String>(Arrays.asList("/user/add","/user/setRole","/role/add","role/menu"));
        	Iterator<MenuVO> iterator = menuList.iterator();
        	while(iterator.hasNext()) {
        		MenuVO m = iterator.next();
        		if(!urlList.contains(m.getUrl())) {
        			ret.add(m);
            	}
        	}
        }else {
        	ret = menuList;
        }
        
        // 获取角色的所有菜单，设置选中节点
        ret = menuService.setSelect(roleId, ret);
        //转换为树形结构
        ret = ListUtil.toTreeMenu(ret, 2);

        if ((null == ret) || ret.isEmpty()) {
            return ResultDTO.ok();
        }


        return ResultDTO.ok().setData(ret);
    }
    
    /**
     * 分配菜单页面数据列表-详情
     *
     * @param roleId
     * @return
     * @version v1.0.1, 2018/09/10  07:02:10 下午
     * @author 高峰
     */
    @ResponseBody
    @PostMapping("/menu/list/datail/{roleId}")
    public ResultDTO treeMenusDetail(@PathVariable("roleId") String roleId) {
        // 登录用户的菜单列表，树形结构
        List<MenuVO> menuList = new ArrayList<MenuVO>();
        RoleMenuQuery queryRoleMenu = new RoleMenuQuery();
        queryRoleMenu.setRoleId(roleId);
        List<RoleMenuDO> roleMenuList = roleMenuService.listPage(queryRoleMenu);
        for(RoleMenuDO d:roleMenuList) {
            MenuQuery query = new MenuQuery();
            query.setId(d.getMenuId());
            List<MenuDO> list =menuService.listPage(query);
            for (MenuDO menu : list) {
                menuList.add(new MenuVO(menu, true));
            }
        }

        List<MenuVO> ret = new ArrayList<MenuVO>();
        if(!"00000000".equals(ShiroUtil.getUserEntity().getOrgCode()) || !"1".equals(ShiroUtil.getUserEntity().getIsOperate())) {
        	List<String> urlList = new ArrayList<String>(Arrays.asList("/user/add","/user/setRole","/role/add","role/menu"));
        	Iterator<MenuVO> iterator = menuList.iterator();
        	while(iterator.hasNext()) {
        		MenuVO m = iterator.next();
        		if(!urlList.contains(m.getUrl())) {
        			ret.add(m);
            	}
        	}
        }else {
        	ret = menuList;
        }

        // 获取角色的所有菜单，设置选中节点
        ret = menuService.setSelect(roleId, ret);
        //转换为树形结构
        ret = ListUtil.toTreeMenu(ret, 2);

        if ((null == ret) || ret.isEmpty()) {
            return ResultDTO.ok();
        }
        
        Collections.sort(ret,new Comparator<MenuVO>() {
            public int compare(MenuVO obj1, MenuVO obj2) {
            	int v1 = obj1.getSortNo().intValue();
            	int v2 = obj2.getSortNo().intValue();
            	return v1 > v2 ? 1 : (v1 == v2 ? 0 : -1);
            }
        });        
        
        return ResultDTO.ok().setData(ret);
    }

    /**
     * 分配菜单页面
     *
     * @param roleId
     * @return
     */
    @GetMapping("/menuPage/{roleId}")
    @RequiresPermissions("role/menu")
    public ModelAndView menuPage(@PathVariable("roleId") String roleId) {
        ModelAndView mode = new ModelAndView();

        mode.setViewName("role/menu");

        // 角色信息
        RoleDO entity = roleService.get(roleId);

        if (null != entity) {
            mode.addObject("entity", entity);            
        }

/*        // 登录用户的菜单列表，树形结构
        List<MenuVO> menuList = menuService.listTreeMenusByUserId(ShiroUtil.getUserId());
        // 角色的菜单列表,先简单处理一下，看看效果
        if ((null == menuList) || menuList.isEmpty()) {
            return mode;
        }
        mode.addObject("menuList", menuList);*/
        return mode;
    }
}
