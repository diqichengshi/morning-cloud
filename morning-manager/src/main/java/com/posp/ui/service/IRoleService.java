package com.posp.ui.service;

import com.posp.common.service.user.ao.RoleAO;
import com.posp.common.service.user.bo.RoleBO;
import com.posp.common.service.user.entyty.RoleDO;
import com.posp.common.service.user.query.RoleQuery;
import com.posp.message.common.exception.PospBusinessException;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * 角色服务接口类
 *
 * @author auto generator
 * @date 2018/11/16 15:22:21
 */
public interface IRoleService {

    /**
     * 删除指定ID的记录
     *
     * @param id pk主键
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    int delete(String id) throws DataAccessException;

    /**
     * 添加记录
     *
     * @param record 记录
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    int insert(RoleAO record) throws DataAccessException, PospBusinessException;

    /**
     * 根据参数类查找记录[分页]
     *
     * @param query 查询条件
     * @return 查询记录列表
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    List<RoleDO> listPage(RoleQuery query) throws DataAccessException;

    /**
     * 修改指定ID的记录
     *
     * @param record 记录
     * @return 修改记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    int update(RoleBO record) throws DataAccessException, PospBusinessException;

    /**
     * 获取指定Id的记录
     *
     * @param id pk主键
     * @return 查询结果记录对象
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    RoleDO get(String id) throws DataAccessException;

    /**
     * 批量添加记录
     *
     * @param list 添加记录里诶包
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    int batchInsert(List<RoleAO> list) throws DataAccessException;

    /**
     * 批量删除记录
     *
     * @param ids 记录id数组
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 15:22:21
     * @author auto generator
     */
    int batchDelete(String[] ids) throws DataAccessException;

    /**
     * 获取指定userId的角色列表记录
     *
     * @param userId
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/11  02:51:50 下午
     * @author 高峰
     */
    List<RoleDO> selectByUserId(String userId) throws DataAccessException;
}
