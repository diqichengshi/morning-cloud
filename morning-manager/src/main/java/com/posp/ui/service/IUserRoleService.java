//~ Formatted by Jindent --- http://www.jindent.com
package com.posp.ui.service;

import com.posp.common.service.user.ao.UserRoleAO;
import com.posp.common.service.user.ao.UserRoleListAO;
import com.posp.common.service.user.bo.UserRoleBO;
import com.posp.common.service.user.entyty.UserRoleDO;
import com.posp.common.service.user.query.UserRoleQuery;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * 用户-角色服务接口类
 *
 * @version v1.0.1, 2018/09/10 15:35:36
 * @author auto generator
 */
public interface IUserRoleService {

    /**
     * 删除指定ID的记录
     *
     * @param id pk主键
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    int delete(String id) throws DataAccessException;

    /**
     * 添加记录
     *
     * @param record 数据类
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    int insert(UserRoleAO record) throws DataAccessException;

    /**
     * 更新角色的所有菜单
     *
     * @param record
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/11  03:24:45 下午
     * @author 高峰
     */
    int insertAll(UserRoleListAO record) throws DataAccessException;
    
    /**
     * 更新角色的所有菜单(包括下级用户)
     *
     * @param record
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2019/08/16
     * @author liwei
     */
    public void changeRoles(UserRoleListAO record) throws DataAccessException;
    
    /**
     * 更新角色的所有菜单(只变更平级用户)
     *
     * @param record
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2019/08/16
     * @author liwei
     */
    public void changeRolesParallel(UserRoleListAO record) throws DataAccessException;
    
    /**
     * 更新角色的所有菜单(只更新本级创建人的)
     *
     * @param record
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2019/08/16
     * @author liwei
     */
    public void changeRolesSample(UserRoleListAO record) throws DataAccessException;
    
    /**
     * 根据参数类查找记录
     *
     * @param query
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    List<UserRoleDO> list(UserRoleQuery query) throws DataAccessException;

    /**
     * 修改指定ID的记录
     *
     * @param record 数据类
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    int update(UserRoleBO record) throws DataAccessException;

    /**
     * 获取指定Id的记录
     *
     * @param id pk主键
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    UserRoleDO get(String id) throws DataAccessException;

    int insertRole(UserRoleAO userRole);
}
