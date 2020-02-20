package com.posp.ui.service.impl;

import com.github.pagehelper.PageHelper;
import com.posp.common.service.user.ao.RoleMenuAO;
import com.posp.common.service.user.ao.RoleMenuListAO;
import com.posp.common.service.user.bo.RoleMenuBO;
import com.posp.common.service.user.entyty.RoleDO;
import com.posp.common.service.user.entyty.RoleMenuDO;
import com.posp.common.service.user.entyty.UserDO;
import com.posp.common.service.user.query.RoleMenuQuery;
import com.posp.common.service.user.query.RoleQuery;
import com.posp.tool.common.data.UuidUtil;
import com.posp.ui.dao.*;
import com.posp.ui.service.IRoleMenuService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * 角色-菜单服务实现类
 *
 * @author auto generator
 * @date 2018/11/16 15:22:22
 */
@Service
@Slf4j
public class RoleMenuServiceImpl implements IRoleMenuService {
    @Autowired
	private IRoleMenuMapper roleMenuMapper;
    @Autowired
	private IUserRoleMapper userRoleMapper;
    @Autowired
	private IRoleMapper roleMapper;
    @Autowired
	private IOrganizeMapper organizeMapper;
    @Autowired
	private IUserMapper userMapper;

    @Override
    public int delete(String id) throws DataAccessException {
        return roleMenuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(RoleMenuAO record) throws DataAccessException {
        RoleMenuDO entity = new RoleMenuDO();

        entity.setId(UuidUtil.getUuid());
        entity.setMenuId(record.getMenuId());
        entity.setRoleId(record.getRoleId());

        return roleMenuMapper.insert(entity);
    }

    @Override
    public List<RoleMenuDO> listPage(RoleMenuQuery query) {
        PageHelper.startPage(query.getPageNumber(), query.getPageSize());
        //处理数据权限问题
        return roleMenuMapper.selectByParam(query);
    }

    @Override
    public int update(RoleMenuBO record) throws DataAccessException {
        RoleMenuDO entity = new RoleMenuDO();

        entity.setId(record.getId());
        entity.setMenuId(record.getMenuId());
        entity.setRoleId(record.getRoleId());

        return roleMenuMapper.updateByPrimaryKeySelective(entity);
    }

    @Override
    public RoleMenuDO get(String id) throws DataAccessException {
        return roleMenuMapper.selectByPrimaryKey(id);
    }

    @Override
    public int batchInsert(List<RoleMenuAO> list) throws DataAccessException {
        List<RoleMenuDO> entityList = new ArrayList<>();
        for (RoleMenuAO record : list) {
            RoleMenuDO entity = new RoleMenuDO();

            entity.setId(UuidUtil.getUuid());
            entity.setMenuId(record.getMenuId());
            entity.setRoleId(record.getRoleId());
            entityList.add(entity);
        }

        return roleMenuMapper.batchInsert(entityList);
    }

    @Override
    public int batchDelete(String[] ids) throws DataAccessException {
        return roleMenuMapper.batchDelete(ids);
    }

    @Override
    public int insertAll(RoleMenuListAO record) throws DataAccessException {
        if (!CollectionUtils.isEmpty(record.getMenuList())) {
            //1.查出该角色之前拥有的菜单id
            List<String> roleIdList = new ArrayList<>();
            roleIdList.add(record.getRoleId());
            List<String> menuList = roleMenuMapper.selectMenuIdByRoleId(roleIdList);
            //2.得到该角色被移除的菜单id
            List<String> removeMenuList = new ArrayList<>();
            if (!CollectionUtils.isEmpty(menuList)) {
                for (String menuId : menuList) {
                    if (!record.getMenuList().contains(menuId)) {
                        removeMenuList.add(menuId);
                    }
                }
            }
            if (!CollectionUtils.isEmpty(removeMenuList)) {
                //3.查出这个角色的部门编号
                RoleDO role = roleMapper.selectByPrimaryKey(record.getRoleId());
                //4.查询本机构及下属机构部门编号集合
                List<String> orgCodeList = organizeMapper.selectAllCodeByOrgCode(role.getOrgCode());
                //5.查询要删除菜单权限的角色id集合
                Map<String, Object> params = new HashMap<>();
                params.put("menuList", removeMenuList);
                params.put("orgCodeList", orgCodeList);
                List<String> roleIds = roleMenuMapper.selectRoleIdIdByMenuId(params);
                if(!CollectionUtils.isEmpty(roleIds)) {
                    //6.删除本机构及下属机构的角色相应菜单权限
                    Map<String, Object> map = new HashMap<>();
                    map.put("menuIds", removeMenuList);
                    map.put("roleIds", roleIds);
                    roleMenuMapper.deleteByRoleIdAndMenuId(map);
                }
            }

        }
        // 删除角色已有的记录
        roleMenuMapper.deleteByRoleId(record.getRoleId());
        if ((null == record.getMenuList()) || record.getMenuList().isEmpty()) {
            return 0;
        }
        // 添加所有的菜单
        int count = 0;
        List<RoleMenuDO> roleMenuList = new ArrayList<>();
        for (String id : record.getMenuList()) {
            RoleMenuDO role = new RoleMenuDO();
            role.setId(UuidUtil.getUuid());
            role.setRoleId(record.getRoleId());
            role.setMenuId(id);
            roleMenuList.add(role);
        }
        roleMenuMapper.batchInsert(roleMenuList);
        return count;
    }

	@Override
	public void changeMenu(RoleMenuListAO record) throws DataAccessException {
		log.info("分配菜单，请求参数:{}",record.toString());
		//删除数据库不包含的菜单，包括其下级用户角色拥有的。
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("roleId", record.getRoleId());
		params.put("meruId", record.getMenuList());
		//查出该角色不包含的菜单
		List<RoleMenuDO> notRoleMenuList = roleMenuMapper.selectRoleNotMenuOfChange(params);
		log.info("分配菜单，查询不包含的菜单数量:{}",notRoleMenuList.size());
		
		if(notRoleMenuList.size() > 0) {
			//删除的RoleMenu
			List<String> removeRoleMenuIdList = new ArrayList<String>();
			List<String> removeRoleMenuList = new ArrayList<String>();
			//添加本机构要删除的角色菜单
			for(RoleMenuDO d:notRoleMenuList) {
				removeRoleMenuIdList.add(d.getId());
				removeRoleMenuList.add(d.getMenuId());
			}
						
			//查询拥有角色的所有用户
			List<String> orgCodes = new ArrayList<String>();
			//首先查询机构集合
			List<HashMap<String,String>> orcUserRoleList = roleMenuMapper.selectUsersByRoleIdOfChange(record.getRoleId());
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
	        RoleDO role = roleMapper.selectByPrimaryKey(record.getRoleId());
			if(orgCodes.contains(role.getOrgCode())) {
				orgCodes.remove(role.getOrgCode());
			}
			log.info("分配菜单，查询要删除菜单的机构:{}",orgCodes.toString());
			
			if(orgCodes.size() > 0) {
				//获取下级机构要删除的角色菜单
				Map<String,Object> paramsTmp = new HashMap<String,Object>();
				paramsTmp.put("orgCodeList", orgCodes);
				paramsTmp.put("meruList", removeRoleMenuList);
				List<RoleMenuDO> removeTmp = roleMenuMapper.selectUsersRoleIdOfChange(paramsTmp);
				for(RoleMenuDO d1:removeTmp) {
					removeRoleMenuIdList.add(d1.getId());
				}
			}
			log.info("分配菜单，查询要删除的菜单数量:{}",removeRoleMenuIdList.size());
			
			int cntDelete = 0;
			if(removeRoleMenuIdList.size() > 0) {
				cntDelete =roleMenuMapper.batchDelete(removeRoleMenuIdList.toArray(new String[removeRoleMenuIdList.size()]));
			}
			
			log.info("分配菜单，删除的菜单数量:{}",cntDelete);
		}
		
		//数据库没有的菜单
		if(record.getMenuList().size() > 0) {
            List<String> menuList = roleMenuMapper.selectMenuIdByRoleId(new ArrayList<String>(Arrays.asList(record.getRoleId())));
            List<RoleMenuDO> addRoleMenuList = new ArrayList<>();
			for(String menu:record.getMenuList()) {
				if(!menuList.contains(menu)) {
					RoleMenuDO role = new RoleMenuDO();
	                role.setId(UuidUtil.getUuid());
	                role.setRoleId(record.getRoleId());
	                role.setMenuId(menu);
	                addRoleMenuList.add(role);
				}
			}
            
			log.info("分配菜单，查询要添加的菜单:{}",addRoleMenuList.toString());
			if(addRoleMenuList.size() > 0) {
				int cntAdd = roleMenuMapper.batchInsert(addRoleMenuList);
				log.info("分配菜单，添加的菜单数量:{}",cntAdd);
			}
            
		}
	}
	
	@Override
	public void changeMenuParallel(RoleMenuListAO record) throws DataAccessException {
		log.info("分配菜单，请求参数:{}",record.toString());
		//删除数据库不包含的菜单，包括用户角色拥有的。
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("roleId", record.getRoleId());
		params.put("meruId", record.getMenuList());
		//查出该角色不包含的菜单
		List<RoleMenuDO> notRoleMenuList = roleMenuMapper.selectRoleNotMenuOfChange(params);
		log.info("分配菜单，查询不包含的菜单:{}",notRoleMenuList.toString());
						
		if(notRoleMenuList.size() > 0) {
			//删除的RoleMenu
			List<String> removeRoleMenuIdList = new ArrayList<String>();
			List<String> removeMenuIdList = new ArrayList<String>();
			//添加本机构要删除的角色菜单
			for(RoleMenuDO d:notRoleMenuList) {
				removeRoleMenuIdList.add(d.getId());
				removeMenuIdList.add(d.getMenuId());
			}
			log.info("分配菜单，删除的菜单数量:{}",removeMenuIdList.size());
						
			//查询角色的创建用户
			RoleDO roleParam = roleMapper.selectByPrimaryKey(record.getRoleId());
			RoleQuery query = new RoleQuery();
			query.setCreateUserId(roleParam.getCreateUserId());
			List<RoleDO> sameRoleCreateList = roleMapper.selectByParam(query);
			if(sameRoleCreateList.size() > 0) {
				List<String> sameRoleCreateListTmp = new ArrayList<String>(); 
				for(RoleDO rd:sameRoleCreateList) {
					if(!rd.getId().equals(record.getRoleId())) {
						sameRoleCreateListTmp.add(rd.getId());
					}
				}
				if(sameRoleCreateListTmp.size() >0) {
					List<String> sameRoleMenuIdList = roleMenuMapper.selectMenuIdByRoleId(sameRoleCreateListTmp);
					if(sameRoleMenuIdList.size() > 0) {
						//去重
						for(String mid :sameRoleMenuIdList) {
							if(removeMenuIdList.contains(mid)) {
								removeMenuIdList.remove(mid);
							}
						}
					}
					log.info("分配菜单，筛选后删除的菜单数量:{}",removeMenuIdList.size());
				}
			}

			//查询拥有角色的所有用户
			List<String> removeUserList = new ArrayList<String>();
			List<String> userRoleList = userRoleMapper.selectUserIdByRoleId(record.getRoleId());
			if(userRoleList.size() > 0) {
				for(String uid : userRoleList) {
					UserDO user = userMapper.selectByPrimaryKey(uid);
					List<String> userTmp = userMapper.selectUserRecursion(user.getUsername());
					if(userTmp.size() > 0) {
						removeUserList.addAll(userTmp);
					}
					
					if(removeUserList.contains(user.getUsername())) {
						removeUserList.remove(user.getUsername());
					}
				}
			}
			
			//去重
	        removeDuplicate(removeUserList);
	        log.info("分配菜单，查询要删除菜单的用户:{}",removeUserList.toString()); 
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
//				cntDelete =roleMenuMapper.batchDelete(removeRoleMenuIdList.toArray(new String[removeRoleMenuIdList.size()]));
				for(String id:removeRoleMenuIdList) {
					roleMenuMapper.deleteByPrimaryKey(id);
				}
			}
			
			log.info("分配菜单，删除的菜单数量:{}",removeRoleMenuIdList.size());
		}
		
		//数据库没有的菜单
		if(record.getMenuList().size() > 0) {
            List<String> menuList = roleMenuMapper.selectMenuIdByRoleId(new ArrayList<String>(Arrays.asList(record.getRoleId())));
            List<RoleMenuDO> addRoleMenuList = new ArrayList<>();
			for(String menu:record.getMenuList()) {
				if(!menuList.contains(menu)) {
					RoleMenuDO role = new RoleMenuDO();
	                role.setId(UuidUtil.getUuid());
	                role.setRoleId(record.getRoleId());
	                role.setMenuId(menu);
	                addRoleMenuList.add(role);
				}
			}
            
			log.info("分配菜单，查询要添加的菜单:{}",addRoleMenuList.toString());
			if(addRoleMenuList.size() > 0) {
				int cntAdd = roleMenuMapper.batchInsert(addRoleMenuList);
				log.info("分配菜单，添加的菜单数量:{}",cntAdd);
			}
            
		}		
	}
	
	@Override
	public void changeMenuSample(RoleMenuListAO record) throws DataAccessException {
		//删除数据库不包含的菜单，包括用户角色拥有的。
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("roleId", record.getRoleId());
		params.put("meruId", record.getMenuList());
		//查出该角色不包含的菜单
		List<RoleMenuDO> notRoleMenuList = roleMenuMapper.selectRoleNotMenuOfChange(params);
		log.info("分配菜单，查询不包含的菜单:{}",notRoleMenuList.toString());
						
		if(notRoleMenuList.size() > 0) {
			//删除的RoleMenu
			List<String> removeRoleMenuIdList = new ArrayList<String>();
			List<String> removeMenuIdList = new ArrayList<String>();
			//添加本机构要删除的角色菜单
			for(RoleMenuDO d:notRoleMenuList) {
				removeRoleMenuIdList.add(d.getId());
				removeMenuIdList.add(d.getMenuId());
			}			

			//查询拥有角色的所有用户
			List<String> userRoleList = userRoleMapper.selectUserIdByRoleId(record.getRoleId());
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
							log.info("分配菜单，删除的子角色菜单数量:{}",cnt);
						}												
					}					
				}
			}
			
			if(removeRoleMenuIdList.size() > 0) {
				for(String id:removeRoleMenuIdList) {
					roleMenuMapper.deleteByPrimaryKey(id);
				}
			}
			
			log.info("分配菜单，删除的菜单数量:{}",removeRoleMenuIdList.size());
		}
		
		//数据库没有的菜单
		if(record.getMenuList().size() > 0) {
            List<String> menuList = roleMenuMapper.selectMenuIdByRoleId(new ArrayList<String>(Arrays.asList(record.getRoleId())));
            List<RoleMenuDO> addRoleMenuList = new ArrayList<>();
			for(String menu:record.getMenuList()) {
				if(!menuList.contains(menu)) {
					RoleMenuDO role = new RoleMenuDO();
	                role.setId(UuidUtil.getUuid());
	                role.setRoleId(record.getRoleId());
	                role.setMenuId(menu);
	                addRoleMenuList.add(role);
				}
			}
            
			log.info("分配菜单，查询要添加的菜单:{}",addRoleMenuList.toString());
			if(addRoleMenuList.size() > 0) {
				int cntAdd = roleMenuMapper.batchInsert(addRoleMenuList);
				log.info("分配菜单，添加的菜单数量:{}",cntAdd);
			}
            
		}
		
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
