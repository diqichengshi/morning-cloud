package com.posp.ui.service.impl;

import com.github.pagehelper.PageHelper;
import com.posp.common.service.user.ao.UserRoleAO;
import com.posp.common.service.user.ao.UserRoleListAO;
import com.posp.common.service.user.bo.UserRoleBO;
import com.posp.common.service.user.entyty.RoleDO;
import com.posp.common.service.user.entyty.RoleMenuDO;
import com.posp.common.service.user.entyty.UserDO;
import com.posp.common.service.user.entyty.UserRoleDO;
import com.posp.common.service.user.query.RoleQuery;
import com.posp.common.service.user.query.UserRoleQuery;
import com.posp.tool.common.data.UuidUtil;
import com.posp.ui.dao.*;
import com.posp.ui.service.IUserRoleService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * 用户-角色服务实现类
 *
 * @author auto generator
 * @version v1.0.1, 2018/09/10 15:35:36
 */
@Service
@Slf4j
public class UserRoleServiceImpl implements IUserRoleService {
    @Autowired
	private IUserRoleMapper userRoleMapper;
    @Autowired
	private IRoleMenuMapper roleMenuMapper;
    @Autowired
	private IUserMapper userMapper;
    @Autowired
	private IOrganizeMapper organizeMapper;
    @Autowired
	private IRoleMapper roleMapper;

    @Override
    public int delete(String id) throws DataAccessException {
        return userRoleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(UserRoleAO record) throws DataAccessException {
        UserRoleDO entity = new UserRoleDO();
        entity.setId(UuidUtil.getUuid());
        entity.setUserId(record.getUserId());
        entity.setRoleId(record.getRoleId());
        return userRoleMapper.insert(entity);
    }
    
    @Override
    public int insertAll(UserRoleListAO record) throws DataAccessException {
        //1.查出当前用户的角色id
        List<String> oldRoleIdList = userRoleMapper.selectRoleIdByUserId(record.getUserId());
        //2.获取被收回的角色id
        List<String> removeRoleIdList = new ArrayList<>();
        if (CollectionUtils.isEmpty(record.getRoleList()) && !CollectionUtils.isEmpty(oldRoleIdList)) {
            for (String roleId : oldRoleIdList) {
                removeRoleIdList.add(roleId);
            }
        } else {
            if (!CollectionUtils.isEmpty(oldRoleIdList)) {
                for (String roleId : oldRoleIdList) {
                    if (!record.getRoleList().contains(roleId)) {
                        removeRoleIdList.add(roleId);
                    }
                }
            }
        }
        if (!CollectionUtils.isEmpty(removeRoleIdList)) {
            //3.根据角色id获取该角色的菜单id
            List<String> menuList = roleMenuMapper.selectMenuIdByRoleId(removeRoleIdList);
            if (!CollectionUtils.isEmpty(menuList)) {
                Map<String, Object> params = new HashMap<>();
                //4.查出当前用户的部门编号
                UserDO user = userMapper.selectByPrimaryKey(record.getUserId());
                //5.根据当前用户部门编号查出子部门编号集合
                List<String> codeList = organizeMapper.selectAllCodeByOrgCode(user.getOrgCode());
                params.put("menuList", menuList);
                params.put("orgCodeList", codeList);
                //6.根据菜单id和部门编号集合获取要修改的角色id
                List<String> roleIds = roleMenuMapper.selectRoleIdIdByMenuId(params);
                //7.删除本机构及下属机构的角色相应菜单权限
                if(!CollectionUtils.isEmpty(roleIds)) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("menuIds", menuList);
                    map.put("roleIds", roleIds);
                    roleMenuMapper.deleteByRoleIdAndMenuId(map);
                }

            }
        }
        // 删除用户已有的记录
        userRoleMapper.deleteByUserId(record.getUserId());
        if ((null == record.getRoleList()) || record.getRoleList().isEmpty()) {
            return 0;
        }
        // 添加所有的角色
        int count = 0;
        for (String roleId : record.getRoleList()) {
            UserRoleDO userRole = new UserRoleDO();
            userRole.setId(UuidUtil.getUuid());
            userRole.setUserId(record.getUserId());
            userRole.setRoleId(roleId);
            count += userRoleMapper.insert(userRole);
        }
        return count;
    }

    @Override
	public void changeRoles(UserRoleListAO record) throws DataAccessException {
    	log.info("分配角色，请求参数:{}",record.toString());
    	//删除数据库不包含的角色。
    	Map<String,Object> params = new HashMap<String,Object>();
		params.put("userId", record.getUserId());
		params.put("roleId", record.getRoleList());
		//查出该角色不包含的菜单
		List<UserRoleDO> notUserRoleList = userRoleMapper.selectUserNotRoleOfChange(params);
		log.info("分配角色，查询不包含的角色:{}",notUserRoleList.toString());
		
		if(notUserRoleList.size() > 0) {			
			//删除的UserRole的下级菜单
			List<String> removeRoleMenuIdList = new ArrayList<String>();			
			
			//查询下级角色要删除的菜单，不包含本级角色
			List<String> notRoleIdList = new ArrayList<String>();
			for(UserRoleDO d:notUserRoleList) {
				notRoleIdList.add(d.getId());
			}
			List<String> menuList = roleMenuMapper.selectMenuIdByRoleId(notRoleIdList);
			
			/**
			 * 角色要删除的下级菜单，机构存在重合的情况，需要每个角色的菜单独删除。
			 */
			for(String roleId:record.getRoleList()) {
				//查询拥有角色的所有用户
				List<String> orgCodes = new ArrayList<String>();
				//首先查询机构集合
				List<HashMap<String,String>> orcUserRoleList = roleMenuMapper.selectUsersByRoleIdOfChange(roleId);
		        for(HashMap<String,String> map:orcUserRoleList) {
		        	if(StringUtils.isBlank(map.get("groupCodes"))) {
		        		orgCodes.add("00000000");
		        		continue;
		        	}
		        	orgCodes.addAll(getOcgCodes(map.get("orgCode"),map.get("groupCodes")));
		        }
		        //去重
		        removeDuplicate(orgCodes);
		        //去除本角色机构
		        RoleDO role = roleMapper.selectByPrimaryKey(roleId);
				if(orgCodes.contains(role.getOrgCode())) {
					orgCodes.remove(role.getOrgCode());
				}
				log.info("分配角色，查询要删除菜单的机构:{}",orgCodes.toString());
				
				if(orgCodes.size() > 0) {
					//获取下级机构要删除的角色菜单
					Map<String,Object> paramsTmp = new HashMap<String,Object>();
					paramsTmp.put("orgCodeList", orgCodes);
					paramsTmp.put("meruList", menuList);
					List<RoleMenuDO> removeTmp = roleMenuMapper.selectUsersRoleIdOfChange(paramsTmp);
					for(RoleMenuDO d1:removeTmp) {
						removeRoleMenuIdList.add(d1.getId());
					}
				}
				log.info("分配角色，查询要删除的菜单:{}",removeRoleMenuIdList.toString());
				
				int cntDelete = 0;
				if(removeRoleMenuIdList.size() > 0) {
					cntDelete =roleMenuMapper.batchDelete(removeRoleMenuIdList.toArray(new String[removeRoleMenuIdList.size()]));
				}
				
				log.info("分配角色，删除的菜单数量:{}",cntDelete);
			}
			
			//删除本级角色用户关系
			int cntRoleIdDelete = userRoleMapper.batchDelete(notRoleIdList.toArray(new String[notRoleIdList.size()]));
			log.info("分配角色，删除的用户角色数量:{}",cntRoleIdDelete);
		}
		
		//数据库没有的角色
		if(record.getRoleList().size() > 0) {
			List<String> inRoleIdList = userRoleMapper.selectRoleIdByUserId(record.getUserId());
			int count = 0;
			// 添加角色
			for(String roleId:record.getRoleList()) {
				if(!inRoleIdList.contains(roleId)) {
					UserRoleDO userRole = new UserRoleDO();
		            userRole.setId(UuidUtil.getUuid());
		            userRole.setUserId(record.getUserId());
		            userRole.setRoleId(roleId);
		            count += userRoleMapper.insert(userRole);
				}
			}
			log.info("分配角色，查询要添加的角色:{}",count);
		}
    	
	}
    
    @Override
	public void changeRolesParallel(UserRoleListAO record) throws DataAccessException {
    	log.info("分配角色，请求参数:{}",record.toString());
    	//删除数据库不包含的角色。

		Map<String,Object> params = new HashMap<String,Object>();
		params.put("userId", record.getUserId());
		params.put("roleId", record.getRoleList());
		//查出该角色不包含的角色
		List<UserRoleDO> notUserRoleList = userRoleMapper.selectUserNotRoleOfChange(params);
		log.info("分配角色，查询不包含的角色:{}",notUserRoleList.toString());
		
		if(notUserRoleList.size() > 0) {
			List<String> delRoleMenuIdList = new ArrayList<String>();
			List<String> notRoleIdList = new ArrayList<String>();
			for(UserRoleDO d:notUserRoleList) {
				notRoleIdList.add(d.getRoleId());
				delRoleMenuIdList.add(d.getId());
			}
			
			UserDO user = userMapper.selectByPrimaryKey(record.getUserId());
			//删除的UserRole的用户
			List<String> removeUserList = new ArrayList<String>();
			List<String> userTmp = userMapper.selectUserRecursion(user.getUsername());
			if(userTmp.size() > 0) {
				removeUserList.addAll(userTmp);
			}
			
			//去重
	        removeDuplicate(removeUserList);
	        if(removeUserList.contains(user.getUsername())) {
	        	removeUserList.remove(user.getUsername());
	        }
	        
	        log.info("分配角色，查询要删除菜单的用户:{}",removeUserList.toString());
	        
	        //查询删除角色的菜单
	        List<String> removeMenuIdList = new ArrayList<String>();
	        List<String> notMenuList = roleMenuMapper.selectMenuIdByRoleId(notRoleIdList);
	        if(notMenuList.size() > 0) {
	        	//查询用户创建的角色
				/*RoleQuery query = new RoleQuery();
		    	query.setCreateUserId(user.getUsername());
				List<RoleDO> removeRoleCreateList = roleMapper.selectByParam(query);
				List<String> removeRoleSelfList = new ArrayList<String>();
				if(removeRoleCreateList.size() > 0) {
					for(RoleDO d1:removeRoleCreateList) {
						removeRoleSelfList.add(d1.getId());
					}
				}	*/	
//				log.info("分配角色，查询用户创建的角色:{}",removeRoleSelfList.toString());
//	        	List<String> notMenuSelfList = roleMenuMapper.selectMenuIdByRoleId(removeRoleSelfList);
	        	
	        	//查询用户拥有角色相同的菜单
	        	List<String> sameMenuIdList = new ArrayList<String>(); 
	        	List<String> allUserRoleList = userRoleMapper.selectRoleIdByUserId(record.getUserId());
	        	allUserRoleList.removeAll(notRoleIdList);
	        	log.info("分配角色，用户拥有的角色:{}",allUserRoleList.toString());
	        	if(allUserRoleList.size() > 0) {
	        		sameMenuIdList = roleMenuMapper.selectMenuIdByRoleId(allUserRoleList);
	        		log.info("分配角色，用户拥有的角色的菜单数量:{}",sameMenuIdList.size());
	        		if(sameMenuIdList.size() > 0) {
	        			List<String> sameMenuIdListTmp = roleMenuMapper.selectMenuIdByRoleId(notRoleIdList);
	        			sameMenuIdList.retainAll(sameMenuIdListTmp);
	        		}
	        		log.info("分配角色，筛选后用户拥有的角色的菜单数量:{}",sameMenuIdList.size());
	        	}	        		        		        	
	        	
	        	if(notMenuList.size() > 0) {
	        		for(String menu:notMenuList) {
	        			if(!sameMenuIdList.contains(menu)) {
	        				removeMenuIdList.add(menu);
	        			}	        			
	        		}
	        	}
	        }
	        log.info("分配角色，要删除的菜单数量:{}",removeMenuIdList.size());
	        	        
	        //删除的UserRole的菜单
			List<String> removeRoleMenuIdList = new ArrayList<String>();
	        if(removeUserList.size() > 0 && removeMenuIdList.size() > 0) {
	        	//查询用户拥有的角色
	        	Map<String,Object> paramsDel = new HashMap<String,Object>();
	        	paramsDel.put("userlist", removeUserList);
	        	paramsDel.put("menulist", removeMenuIdList);
		        List<String> urIdListTmp = userRoleMapper.selectRoleMenuIdByUserName(paramsDel);
		        if(urIdListTmp.size() > 0) {
		        	removeRoleMenuIdList.addAll(urIdListTmp);
		        }
	        }
	        
//	        int cntDelete = 0;
			if(removeRoleMenuIdList.size() > 0) {
				for(String id:removeRoleMenuIdList) {
//					cntDelete =roleMenuMapper.batchDelete(removeRoleMenuIdList.toArray(new String[removeRoleMenuIdList.size()]));
					roleMenuMapper.deleteByPrimaryKey(id);
				}				
			}
			
			log.info("分配角色，删除的菜单数量:{}",removeRoleMenuIdList.size());
			
			//删除本级角色用户关系
			int cntRoleIdDelete = userRoleMapper.batchDelete(delRoleMenuIdList.toArray(new String[delRoleMenuIdList.size()]));
			log.info("分配角色，删除的用户角色数量:{}",cntRoleIdDelete);
		}
		
		//删除本级用户的角色
		
		
		//数据库没有的角色
		if(record.getRoleList().size() > 0) {
			List<String> inRoleIdList = userRoleMapper.selectRoleIdByUserId(record.getUserId());
			int count = 0;
			// 添加角色
			for(String roleId:record.getRoleList()) {
				if(!inRoleIdList.contains(roleId)) {
					UserRoleDO userRole = new UserRoleDO();
		            userRole.setId(UuidUtil.getUuid());
		            userRole.setUserId(record.getUserId());
		            userRole.setRoleId(roleId);
		            count += userRoleMapper.insert(userRole);
				}
			}
			log.info("分配角色，查询要添加的角色:{}",count);
		}		
	}
    
    @Override
	public void changeRolesSample(UserRoleListAO record) throws DataAccessException {
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("userId", record.getUserId());
		params.put("roleId", record.getRoleList());
		//查出该角色不包含的角色
		List<UserRoleDO> notUserRoleList = userRoleMapper.selectUserNotRoleOfChange(params);
		log.info("分配角色，查询不包含的角色:{}",notUserRoleList.toString());
		
		if(notUserRoleList.size() > 0) {
			List<String> delRoleMenuIdList = new ArrayList<String>();
			for(UserRoleDO d:notUserRoleList) {
				delRoleMenuIdList.add(d.getId());
				delMenuByRole(d.getRoleId());
			}
			
			//删除本级角色用户关系
			int cntRoleIdDelete = userRoleMapper.batchDelete(delRoleMenuIdList.toArray(new String[delRoleMenuIdList.size()]));
			log.info("分配角色，删除的用户角色数量:{}",cntRoleIdDelete);
		}
		
		//数据库没有的角色
		if(record.getRoleList().size() > 0) {
			List<String> inRoleIdList = userRoleMapper.selectRoleIdByUserId(record.getUserId());
			int count = 0;
			// 添加角色
			for(String roleId:record.getRoleList()) {
				if(!inRoleIdList.contains(roleId)) {
					UserRoleDO userRole = new UserRoleDO();
		            userRole.setId(UuidUtil.getUuid());
		            userRole.setUserId(record.getUserId());
		            userRole.setRoleId(roleId);
		            count += userRoleMapper.insert(userRole);
				}
			}
			log.info("分配角色，添加的用户角色数量:{}",count);
		}		
	}
    
    private void delMenuByRole(String roleId) {
    	log.info("分配角色，删除子角色的菜单:{}",roleId);
    	//查询拥有角色的所有用户
		List<String> userRoleList = userRoleMapper.selectUserIdByRoleId(roleId);
		List<String> removeMenuIdList = roleMenuMapper.selectMenuIdByRoleId(new ArrayList<String>(Arrays.asList(roleId)));
		if(userRoleList.size() > 0) {
			for(String uid : userRoleList) {
				UserDO user = userMapper.selectByPrimaryKey(uid);					
				//用户创建的角色
				RoleQuery query = new RoleQuery();
				query.setCreateUserId(user.getUsername());
				List<RoleDO> sameRoleCreateList = roleMapper.selectByParam(query);
				if(sameRoleCreateList.size() > 0) {
					List<String> sameRoleCreateListTmp = new ArrayList<String>(); 
					for(RoleDO rd:sameRoleCreateList) {
						sameRoleCreateListTmp.add(rd.getId());
					}
					
					if(sameRoleCreateListTmp.size() > 0 && removeMenuIdList.size() > 0) {
						Map<String,Object> rmParams = new HashMap<String,Object>();
						rmParams.put("menuIds", removeMenuIdList);
						rmParams.put("roleIds", sameRoleCreateListTmp);						
						int cnt = roleMenuMapper.deleteByRoleIdAndMenuId(rmParams);
						log.info("分配角色，删除的子角色菜单数量:{}",cnt);
					}												
				}					
			}
		}
		
    }
    
    @Override
    public List<UserRoleDO> list(UserRoleQuery query) {
        PageHelper.startPage(query.getPageNumber(), query.getPageSize());
        return userRoleMapper.selectByParam(query);
    }

    @Override
    public int update(UserRoleBO record) throws DataAccessException {
        UserRoleDO entity = new UserRoleDO();
        entity.setId(record.getId());
        entity.setUserId(record.getUserId());
        entity.setRoleId(record.getRoleId());
        return userRoleMapper.updateByPrimaryKeySelective(entity);
    }

    @Override
    public UserRoleDO get(String id) throws DataAccessException {
        return userRoleMapper.selectByPrimaryKey(id);
    }

	@Override
	public int  insertRole(UserRoleAO userRole) {
		UserRoleDO entity = new UserRoleDO();
		entity.setId(UuidUtil.getUuid());
		entity.setUserId(userRole.getUserId());
		entity.setRoleId(userRole.getRoleId());

		return 	userRoleMapper.insertRole(entity);
	}

	/**
	 * 拆分部门
	 * @param OrgCode
	 * @param groupCodes
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private List<String> getOcgCodes(String OrgCode,String groupCodes){
		int index = groupCodes.indexOf(OrgCode);
		List<String> list = null;
		if(index < 0) {
			return list;
		} else {
			String tmp = groupCodes.substring(groupCodes.indexOf(OrgCode));
			list =  new ArrayList(Arrays.asList(tmp.split(",")));		
			return list;
		}
			
	}
	
	/**
	 * 去重
	 * @param list
	 */
	private void removeDuplicate(List<String> list) {
	    HashSet<String> set = new HashSet<String>(list);
	    list.clear();
	    list.addAll(set);
	}	
}
