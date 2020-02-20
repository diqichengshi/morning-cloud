package com.posp.ui.service;

import com.posp.common.service.user.ao.RoleMenuAO;
import com.posp.common.service.user.ao.RoleMenuListAO;
import com.posp.common.service.user.bo.RoleMenuBO;
import com.posp.common.service.user.entyty.RoleMenuDO;
import com.posp.common.service.user.query.RoleMenuQuery;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * 角色-菜单服务接口类
 *
 * @author auto generator
 * @date 2018/11/16 15:22:22
 */
public interface IRoleMenuService {

    /**
     * 删除指定ID的记录
     *
     * @param id pk主键
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:22
     * @author auto generator
     */
    int delete(String id) throws DataAccessException;

    /**
     * 添加记录
     *
     * @param record 记录
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:22
     * @author auto generator
     */
    int insert(RoleMenuAO record) throws DataAccessException;

    /**
     * 根据参数类查找记录[分页]
     *
     * @param query 查询条件
     * @return 查询记录列表
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:22
     * @author auto generator
     */
    List<RoleMenuDO> listPage(RoleMenuQuery query) throws DataAccessException;

    /**
     * 修改指定ID的记录
     *
     * @param record 记录
     * @return 修改记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:22
     * @author auto generator
     */
    int update(RoleMenuBO record) throws DataAccessException;

    /**
     * 获取指定Id的记录
     *
     * @param id pk主键
     * @return 查询结果记录对象
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:22
     * @author auto generator
     */
    RoleMenuDO get(String id) throws DataAccessException;

    /**
     * 批量添加记录
     *
     * @param list 添加记录里诶包
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:22
     * @author auto generator
     */
    int batchInsert(List<RoleMenuAO> list) throws DataAccessException;

    /**
     * 批量删除记录
     *
     * @param ids 记录id数组
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:22
     * @author auto generator
     */
    int batchDelete(String[] ids) throws DataAccessException;

    /**
     * 添加角色的所有菜单
     *
     * @param record 角色菜单记录
     * @return
     * @throws DataAccessException
     */
    int insertAll(RoleMenuListAO record) throws DataAccessException;
    
    /**
     * 变更角色的菜单(包括下级用户)
     *
     * @param record 角色菜单记录
     * @return
     * @throws DataAccessException
     */
    public void changeMenu(RoleMenuListAO record) throws DataAccessException;
    
    /**
     * 变更角色的菜单(只变更平级用户)
     *
     * @param record 角色菜单记录
     * @return
     * @throws DataAccessException
     */
    public void changeMenuParallel(RoleMenuListAO record) throws DataAccessException;
    
    /**
     * 变更角色的菜单(只更新本级创建人的)
     *
     * @param record 角色菜单记录
     * @return
     * @throws DataAccessException
     */
    public void changeMenuSample(RoleMenuListAO record) throws DataAccessException;
}
