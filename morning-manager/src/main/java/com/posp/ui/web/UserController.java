package com.posp.ui.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import com.github.pagehelper.PageInfo;
import com.posp.common.service.user.dto.UserDTO;
import com.posp.common.service.user.entyty.LogDO;
import com.posp.message.common.exception.PospBusinessException;
import com.posp.tool.common.bean.BeanUtil;
import com.posp.ui.service.IRoleService;
import com.posp.ui.service.IUserRoleService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
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

import com.posp.common.manager.base.ao.UnionEncryptAO;
import com.posp.common.service.base.entity.ParamDO;
import com.posp.common.service.user.ao.PwdDetailAO;
import com.posp.common.service.user.ao.UserAO;
import com.posp.common.service.user.ao.UserRoleListAO;
import com.posp.common.service.user.bo.UserBO;
import com.posp.common.service.user.entyty.PwdDetailDO;
import com.posp.common.service.user.entyty.RoleDO;
import com.posp.common.service.user.entyty.UserDO;
import com.posp.common.service.user.query.PwdDetailQuery;
import com.posp.common.service.user.query.UserQuery;
import com.posp.message.common.constants.PermissionConstants;
import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.ServiceErrorCodeEnum;
import com.posp.tool.common.log.SysLog;
import com.posp.tool.common.string.StringUtil;
import com.posp.tool.common.time.DateTimeUtil;
import com.posp.ui.config.WebLog;
import com.posp.ui.entity.ResultDTO;
import com.posp.ui.entity.SelectTreeDTO;
import com.posp.ui.entity.UserVO;
import com.posp.ui.service.IUserService;
import com.posp.ui.util.Constant;
import com.posp.ui.util.ShiroUtil;
import com.posp.ui.util.TransferUtils;

import lombok.extern.slf4j.Slf4j;

/**
 * 用户相关Controller
 *
 * @author auto generator
 * @version v1.0.1, 2018/09/10 15:35:36
 */
@Controller
@Slf4j
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IUserRoleService userRoleService;

    private static final String SYSTEM_BUSY_PLEASE_TRY_AGAIN = "系统繁忙，请稍后再试";
    private static final String DEPARTMENT_NUMBER_ERROR = "部门编号应为00000000";
    private static final String PERMISSIONS_CHOOSE_ERROR = "权限应为全部";
    private static final String PASSWORD_INCONFORMITY = "密码不符合规则,8-20位且必须包含字母、数字、特殊字符";
    private static final String ORGINAL_PASSWORD_INCORRECT = "原密码不正确";

    /**
     * 新增记录
     *
     * @param params
     * @return
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/add")
    @RequiresPermissions("user/add")
    @SysLog(value = "新增用户记录")
    @WebLog
    public ResultDTO add(@RequestParam Map<String, Object> params) throws PospBusinessException {
        UserAO record = new UserAO();
        String username = (String) params.get("username");
        if (StringUtil.isNotBlack(username)) {
            record.setUsername(username);
        }

        String password = (String) params.get("password");
        if (StringUtil.isNotBlack(password)) {
            //密码加密
            record.setPassword(DigestUtils.sha1Hex(password));
        }

        String email = (String) params.get("email");
        if (StringUtil.isNotBlack(email)) {
            record.setEmail(email);
        }

        String mobile = (String) params.get("mobile");
        if (StringUtil.isNotBlack(mobile)) {
            record.setMobile(mobile);
        }
        if (StringUtil.isNotBlack(mobile)) {
            record.setMobile(mobile);
        }

        String name = (String) params.get("name");
        if (StringUtil.isNotBlack(name)) {
            record.setName(name);
        }

        String orgCode = (String) params.get("orgCode");
        if (StringUtil.isNotBlack(orgCode)) {
            record.setOrgCode(orgCode);
        }

        String status = (String) params.get("status");
        if (StringUtil.isNotBlack(status)) {
            record.setStatus(status);
        }

        String mobileAuthStatus = (String) params.get("mobileAuthStatus");
        if (StringUtil.isNotBlack(mobileAuthStatus)) {
            record.setMobileAuthStatus(mobileAuthStatus);
        }

        String realAuthStatus = (String) params.get("realAuthStatus");
        if (StringUtil.isNotBlack(realAuthStatus)) {
            record.setRealAuthStatus(realAuthStatus);
        }

        record.setPwdErrorCnt(0l);

        String loginReserve = (String) params.get("loginReserve");
        if (StringUtil.isNotBlack(loginReserve)) {
            record.setLoginReserve(loginReserve);
        }

        String registerFrom = (String) params.get("registerFrom");
        if (StringUtil.isNotBlack(registerFrom)) {
            record.setRegisterFrom(registerFrom);
        }

        String dataPermission = (String) params.get("dataPermission");
        if (StringUtil.isNotBlack(dataPermission)) {
            record.setDataPermission(dataPermission);
        }
        //如果数据权限选的是0全部，部门编号应为00000000
        if (PermissionConstants.DATA_PERMISSION_0.equals(dataPermission) && !"00000000".equals(orgCode)) {
            return ResultDTO.error(DEPARTMENT_NUMBER_ERROR);
        }
        if (!PermissionConstants.DATA_PERMISSION_0.equals(dataPermission) && "00000000".equals(orgCode)) {
            return ResultDTO.error(PERMISSIONS_CHOOSE_ERROR);
        }
        record.setIsOperate("0");
        record.setLastUserId(ShiroUtil.getUserName());
        record.setCreateUserId(ShiroUtil.getUserName());
        userService.insert(record);


        return ResultDTO.ok();
    }

    /**
     * 新增页面
     *
     * @return
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    @GetMapping("/addPage")
    @RequiresPermissions("user/add")
    public ModelAndView addPage() {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("user/add");
        mode.addObject("oc", ShiroUtil.getUserEntity().getOrgCode());
        return mode;
        
    }

    /**
     * 删除单条记录
     *
     * @param id
     * @return
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/delete/{id}")
    @RequiresPermissions("user/delete")
    @SysLog(value = "删除用户记录")
    @WebLog
    public ResultDTO delete(@PathVariable("id") String id) {
        userService.delete(id);
        return ResultDTO.ok();
    }

    /**
     * 删除多条记录
     *
     * @param ids
     * @return
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/batchDelete")
    @RequiresPermissions("user/batchDelete")
    @SysLog(value = "批量删除用户记录")
    @WebLog
    public ResultDTO batchDelete(@RequestParam(value = "ids") String[] ids) {
        userService.batchDelete(ids);
        return ResultDTO.ok();
    }

    /**
     * 详情页面
     *
     * @param id
     * @return
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    @GetMapping("/detailPage/{id}")
    @RequiresPermissions("user/detail")
    public ModelAndView detailPage(@PathVariable("id") String id) {
        ModelAndView mode = new ModelAndView();

        mode.setViewName("user/detail");

        UserDO entity = userService.get(id);

        if (null != entity) {
            mode.addObject("entity", entity);
        }

        //获取当前用户的角色
        List<RoleDO> selectList = userService.listRolesById(id);
        if (null != selectList && selectList.size() > 0) {
        	List<SelectTreeDTO> treeList = new ArrayList<>();
        	for (RoleDO role : selectList) {
        		SelectTreeDTO tree = new SelectTreeDTO();
                tree.setValue(role.getId());
                tree.setName(role.getName());
                tree.setSelected(true);
                treeList.add(tree);
        	}
        	mode.addObject("roleList", treeList);
        }
               
        return mode;
    }

    /**
     * 修改记录
     *
     * @param params
     * @return
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/edit")
    @RequiresPermissions("user/edit")
    @SysLog(value = "修改用户记录")
    @WebLog
    public ResultDTO edit(@RequestParam Map<String, Object> params) {
    	//只允许创建人修改创建的角色
    	String createUserId = (String) params.get("createUserId");
    	if(StringUtils.isBlank(createUserId) || !createUserId.equals(ShiroUtil.getUserName())) {
    		return ResultDTO.error("请选择本人创建的用户！");
    	}
    	
        UserBO record = new UserBO();
        String id = (String) params.get("id");

        if (StringUtil.isNotBlack(id)) {
            record.setId(id);
        }

        String username = (String) params.get("username");
        if (StringUtil.isNotBlack(username)) {
            record.setUsername(username);
        }

        String password = (String) params.get("password");
        if (StringUtil.isNotBlack(password)) {
            record.setPassword(password);
        }

        String email = (String) params.get("email");
        if (StringUtil.isNotBlack(email)) {
            record.setEmail(email);
        }

        String mobile = (String) params.get("mobile");
        //KMS手机号加密
        if (StringUtil.isNotBlack(mobile)) {
            record.setMobile(mobile);
        }

        String name = (String) params.get("name");
        if (StringUtil.isNotBlack(name)) {
            record.setName(name);
        }

        String orgCode = (String) params.get("orgCode");
        if (StringUtil.isNotBlack(orgCode)) {
            record.setOrgCode(orgCode);
        }

        String status = (String) params.get("status");
        if (StringUtil.isNotBlack(status)) {
            record.setStatus(status);
        }

       /* String mobileAuthStatus = (String) params.get("mobileAuthStatus");
        if (StringUtil.isNotBlack(mobileAuthStatus)) {
            record.setMobileAuthStatus(mobileAuthStatus);
        }

        String realAuthStatus = (String) params.get("realAuthStatus");
        if (StringUtil.isNotBlack(realAuthStatus)) {
            record.setRealAuthStatus(realAuthStatus);
        }*/


        String loginReserve = (String) params.get("loginReserve");
        if (StringUtil.isNotBlack(loginReserve)) {
            record.setLoginReserve(loginReserve);
        }

        String registerFrom = (String) params.get("registerFrom");
        if (StringUtil.isNotBlack(registerFrom)) {
            record.setRegisterFrom(registerFrom);
        }

        String dataPermission = (String) params.get("dataPermission");
        if (StringUtil.isNotBlack(dataPermission)) {
            record.setDataPermission(dataPermission);
        }
        //如果数据权限选的是0全部，部门编号应为00000000
        if (PermissionConstants.DATA_PERMISSION_0.equals(dataPermission) && !"00000000".equals(orgCode)) {
            return ResultDTO.error("权限选择有误");
        }
        if (!PermissionConstants.DATA_PERMISSION_0.equals(dataPermission) && "00000000".equals(orgCode)) {
            return ResultDTO.error(PERMISSIONS_CHOOSE_ERROR);
        }
        record.setLastUserId(ShiroUtil.getUserName());

        userService.update(record);

        return ResultDTO.ok();
    }

    /**
     * 修改页面
     *
     * @param id
     * @return
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    @GetMapping("/editPage/{id}")
    @RequiresPermissions("user/edit")
    public ModelAndView editPage(@PathVariable("id") String id) {
        ModelAndView mode = new ModelAndView();
        mode.setViewName("user/edit");
        UserDO entity = userService.get(id);

        if (null != entity) {
            mode.addObject("entity", entity);
        }

        return mode;
    }

    /**
     * 主页面
     *
     * @return
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    @GetMapping()
    @RequiresPermissions("user/user")
    public ModelAndView home() {
    	 ModelAndView mode = new ModelAndView();
         mode.setViewName("user/list");
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
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    @ResponseBody
    @PostMapping("/list")
    @RequiresPermissions("user/user")
    @SysLog(value = "查询用户分页记录",hides = {"mobile"})
    public ResultDTO list(@RequestParam Map<String, Object> params) {
        // 查询列表数据,page当前页数,limit每页显示记录条数
        Integer page = Integer.parseInt((String) params.get("page"));
        Integer limit = Integer.parseInt((String) params.get("limit"));
        UserQuery query = new UserQuery();

        query.setPageSize(limit);
        query.setPageNumber(page);

        String id = (String) params.get("id");

        if (StringUtil.isNotBlack(id)) {
            query.setId(id);
        }

        String username = (String) params.get("username");

        if (StringUtil.isNotBlack(username)) {
            query.setUsername(username);
        }

        String password = (String) params.get("password");

        if (StringUtil.isNotBlack(password)) {
            query.setPassword(password);
        }

        String email = (String) params.get("email");

        if (StringUtil.isNotBlack(email)) {
            query.setEmail(email);
        }

        String mobile = (String) params.get("mobile");

        if (StringUtil.isNotBlack(mobile)) {
            query.setMobile(mobile);
        }

        String name = (String) params.get("name");

        if (StringUtil.isNotBlack(name)) {
            query.setName(name);
        }

        String orgCode = (String) params.get("orgCode");

        if (StringUtil.isNotBlack(orgCode)) {
            query.setOrgCode(orgCode);
        }

        String status = (String) params.get("status");

        if (StringUtil.isNotBlack(status)) {
            query.setStatus(status);
        }
        String groupCodesIndex = (String) params.get("groupCodesIndex");

        if (StringUtil.isNotBlack(groupCodesIndex)) {
            query.setGroupCodesIndex(groupCodesIndex);
        }
        String mobileAuthStatus = (String) params.get("mobileAuthStatus");

        if (StringUtil.isNotBlack(mobileAuthStatus)) {
            query.setMobileAuthStatus(mobileAuthStatus);
        }

        String realAuthStatus = (String) params.get("realAuthStatus");

        if (StringUtil.isNotBlack(realAuthStatus)) {
            query.setRealAuthStatus(realAuthStatus);
        }

        String pwdErrorCnt = (String) params.get("pwdErrorCnt");

        if (StringUtil.isNotBlack(pwdErrorCnt)) {
            query.setPwdErrorCnt(Long.parseLong(pwdErrorCnt));
        }

        String loginReserve = (String) params.get("loginReserve");

        if (StringUtil.isNotBlack(loginReserve)) {
            query.setLoginReserve(loginReserve);
        }

        String registerFrom = (String) params.get("registerFrom");

        if (StringUtil.isNotBlack(registerFrom)) {
            query.setRegisterFrom(registerFrom);
        }
       
        String dataPermission = (String) params.get("dataPermission");
        if (StringUtil.isNotBlack(dataPermission)) {
            query.setDataPermission(dataPermission);
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
        //运营用户查询全部，其他按用户数据权限查询
        if("00000000".equals(ShiroUtil.getUserEntity().getOrgCode())) {
        	query.setPermissionType(PermissionConstants.DATA_PERMISSION_0);
        } else {
            query.setPermissionType(ShiroUtil.getUserEntity().getDataPermission());
        }

        List<UserDO> list = userService.listPage(query);

        if ((null == list) || list.isEmpty()) {
            return ResultDTO.ok();
        }

        //设置页面登录用户信息
        List<UserDTO> userDTOList = list.stream().map(e -> {
            UserDTO userDTO = BeanUtil.copyProperties(e, UserDTO.class);
            return userDTO;
        }).collect(Collectors.toList());

        // 如果list不为空,获取总记录数
        PageInfo<LogDO> pageInfo = new PageInfo(list);
        Long             total    = pageInfo.getTotal();
        return ResultDTO.ok().setData(list).setCount(total);
    }

    /**
     * 重置密码
     *
     * @param id
     * @return
     * @version v1.0.1, 2018/09/11 01:50:15 上午
     * @author gaofeng
     */
    @ResponseBody
    @PostMapping("/resetPassword/{id}")
    @RequiresPermissions("user/resetPassword")
    @SysLog(value = "重置用户密码")
    @WebLog
    public ResultDTO resetPassword(@PathVariable("id") String id) {
        UserBO record = new UserBO();
        record.setId(id);
        record.setPassword("123456");
        record.setStatus(Constant.USER_NORMAL);
        record.setPwdErrorCnt(0l);
        record.setPasswordModifyTime(new Date());
        userService.update(record);

        return ResultDTO.ok();
    }

    /**
     * 分配角色页面
     *
     * @param userId 用户id主键
     * @return
     */
    @GetMapping("/rolePage/{userId}")
    @RequiresPermissions("user/role")
    public ModelAndView rolePage(@PathVariable("userId") String userId) {
        ModelAndView model = new ModelAndView();

        model.setViewName("user/role");

        UserDO entity  = userService.get(userId);

        if (null != entity) {
            model.addObject("entity", entity);
        }
        //获取登录用户创建的的角色列表
        List<RoleDO> roleList = userService.listRolesByCreateUserId();
        if (null == roleList || roleList.isEmpty()) {
            return model;
        }
        //获取当前用户的角色，作为选中项
        List<RoleDO> selectList = userService.listRolesById(userId);
        if (null == selectList || selectList.isEmpty()) {
            //不处理选中节点
            List<SelectTreeDTO> treeList = new ArrayList<>();
            for (RoleDO role : roleList) {
                SelectTreeDTO tree = new SelectTreeDTO();
                tree.setValue(role.getId());
                tree.setName(role.getName());
                tree.setSelected(false);
                treeList.add(tree);
            }
            model.addObject("roleList", treeList);
        } else {
            List<SelectTreeDTO> treeList = new ArrayList<>();
            for (RoleDO role : roleList) {
                SelectTreeDTO tree = new SelectTreeDTO();
                tree.setValue(role.getId());
                tree.setName(role.getName());
                tree.setSelected(false);
                //页面选中的节点
                for (RoleDO select : selectList) {
                    if (role.getId().equals(select.getId())) {
                        tree.setSelected(true);
                        break;
                    }
                }
                treeList.add(tree);
            }
            model.addObject("roleList", treeList);
        }

        return model;
    }

    /**
     * 修改用户角色
     *
     * @param params
     * @return
     */
    @ResponseBody
    @PostMapping("/role/edit")
    @RequiresPermissions("user/role")
    @SysLog(value = "修改用户角色")
    @WebLog
    public ResultDTO editRole(@RequestParam Map<String, Object> params) {
        // 遍历map，提交的是多个值
        UserRoleListAO record = new UserRoleListAO();
        List<String> list = new ArrayList<>();

        record.setRoleList(list);

        for (String str : params.keySet()) {
            String value = (String) params.get(str);

            if ("id".equals(str)) {
                record.setUserId(value);
            } else if ("username".equals(str)) {
                // 不处理
            } else {
                list.add(str);
            }
        }

        userRoleService.changeRolesSample(record);

        return ResultDTO.ok();
    }

    /**
     * 修改用户密码
     *
     * @param params
     * @return
     */
    @ResponseBody
    @PostMapping("/password/edit")
    @SysLog(value = "修改用户密码",ignores = {"newLoginPwdEnsure","newLoginPwd","origLoginPwd"})
    @WebLog(value = "修改用户密码",ignores = {"newLoginPwdEnsure","newLoginPwd","origLoginPwd"})
    public ResultDTO editPassword(@RequestParam Map<String, Object> params) {
        String oldPassword = (String) params.get("origLoginPwd");
        String newPassword = (String) params.get("newLoginPwd");
        String loginName = (String) params.get("loginName");
        String newLoginPwdEnsure = (String) params.get("newLoginPwdEnsure");

        if (StringUtils.equals(oldPassword, newPassword)) {
            return ResultDTO.error("原密码和新密码输入一致");
        }
        if (!StringUtils.equals(newLoginPwdEnsure, newPassword)) {
            return ResultDTO.error("两次输入的新登录密码不一致");
        }
        String regEx = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,20}";
        Pattern pattern = Pattern.compile(regEx);
        Matcher matcher = pattern.matcher(newPassword);
        if (!matcher.matches()) {
            return ResultDTO.error(PASSWORD_INCONFORMITY);
        }
        //对密码加密
        String encryptLoginPwd = DigestUtils.sha1Hex(oldPassword);
        String encryptNewLoginPwd = DigestUtils.sha1Hex(newPassword);
        UserVO user = null;
        //从首页修改密码
        if (StringUtil.isNotEmpty(loginName)) {
            // 查询用户信息
            user = userService.getUserByName(loginName);
            if (null == user) {
                return ResultDTO.error(PASSWORD_INCONFORMITY);
            }
            //验证原登录密码是否输入正确
            if (!encryptLoginPwd.equals(user.getPassword())) {
                return ResultDTO.error(ORGINAL_PASSWORD_INCORRECT);
            }
        } else {
            //验证原登录密码是否输入正确
            if (!encryptLoginPwd.equals(ShiroUtil.getUserEntity().getPassword())) {
                return ResultDTO.error(ORGINAL_PASSWORD_INCORRECT);
            }
        }

        //修改密码
        UserBO userBO = new UserBO();
        if (StringUtil.isNotEmpty(loginName)) {
            userBO.setId(user.getId());
        } else {
            userBO.setId(ShiroUtil.getUserId());
        }
        userBO.setPwdErrorCnt(0l);
        userBO.setPasswordModifyTime(new Date());
        userBO.setPassword(encryptNewLoginPwd);
        userService.update(userBO);

        return ResultDTO.ok();
    }

    /**
     * 修改用户预留信息
     *
     * @param params
     * @return
     */
    @ResponseBody
    @PostMapping("/loginReserve/edit")
    @SysLog(value = "修改用户预留信息")
    @WebLog
    public ResultDTO editLoginReserve(@RequestParam Map<String, Object> params) {
        String loginReserve = (String) params.get("loginReserve");
        UserBO userBO = new UserBO();
        userBO.setId(ShiroUtil.getUserId());
        userBO.setLoginReserve(loginReserve);
        userService.update(userBO);

        return ResultDTO.ok();
    }

    /**
     * 修改用户密码页面
     *
     * @return
     * @version v1.0.1, 2019/02/25
     * @author wangjinli
     */
    @RequestMapping("/password")
    public String password() {
        return "user/password";
    }

    /**
     * 修改用户预留信息页面
     *
     * @return
     * @version v1.0.1, 2019/02/26
     * @author wangjinli
     */
    @RequestMapping("/loginReserve")
    public String loginReserve() {
        return "user/loginReserve";
    }

    /**
     * 用户密码判断
     *
     * @return
     * @version v1.0.1, 2019/03/
     * @author wangjinli
     */
    @RequestMapping("/password/judge")
    public String passwordJudge() {
        UserVO user = ShiroUtil.getUserEntity();

        //查询初始密码参数,如果用户密码为初始密码，强制修改密码
        /*RespMsgDTO<ParamDO> pwdResp = paramServiceFeign.getParamByKey(Constant.USER_RESET_LOGIN_PWD);
        if (!ServiceErrorCodeEnum.SERVICE_OK.getCode().equals(pwdResp.getCode())) {
            //跳转到登录页面
            return "redirect:/login";
        }
        ParamDO resetPwdD0 = pwdResp.getData();
        if (null == resetPwdD0) {
            //跳转到登录页面
            return "redirect:/login";
        }
        String resetPwd = resetPwdD0.getKeyValue();
        if (resetPwd.equals(user.getPassword())) {
            //跳转到修改密码页面
            return "user/password";
        }*/
        return "redirect:/index";
    }

}
