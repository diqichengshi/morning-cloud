//~ Formatted by Jindent --- http://www.jindent.com
package com.posp.ui.service;

import java.util.List;

import com.posp.common.service.user.ao.UserAO;
import com.posp.common.service.user.bo.UserBO;
import com.posp.common.service.user.entyty.RoleDO;
import com.posp.common.service.user.entyty.UserDO;
import com.posp.common.service.user.query.UserQuery;
import com.posp.message.common.exception.PospBusinessException;
import com.posp.ui.entity.UserVO;
import org.springframework.dao.DataAccessException;

/**
 * 登录相关的用户包装服务接口类,屏蔽数据库操作差异
 *
 * @version v1.0.1, 2018/09/06  02:04:33 下午
 * @author 高峰
 */
public interface IUserService {

    /**
     * 获取指定userId的角色列表记录
     *
     * @param userId
     * @return
     * @version v1.0.1, 2018/09/11  02:58:48 下午
     * @author 高峰
     */
    List<RoleDO> listRolesById(String userId);

    /**
     * 获取指定用户名的用户信息，屏蔽后台接口的差异性，必须实现的接口
     *
     * @param username
     * @return
     */
    UserVO getUserByName(String username);

    /**
     * 获取登录用户所能分配的角色(本机构及下属机构创建的角色)
     *
     * @return
     */
    List<RoleDO> listRolesByCreateUserId();

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
    int insert(UserAO record) throws DataAccessException, PospBusinessException;

    String  insertUser(UserAO record) throws DataAccessException, PospBusinessException;

    /**
     * 根据参数类查找记录
     *
     * @param query
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    List<UserDO> listPage(UserQuery query) throws DataAccessException;

    /**
     * 修改指定ID的记录
     *
     * @param record 数据类
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    int update(UserBO record) throws DataAccessException;

    /**
     * 获取指定Id的记录
     *
     * @param id pk主键
     * @return
     * @throws DataAccessException
     * @version v1.0.1, 2018/09/10 15:35:36
     * @author auto generator
     */
    UserDO get(String id) throws DataAccessException;

    /**
     * 批量添加记录
     *
     * @param list 添加记录里诶包
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date 2018/11/15 15:52:59
     * @author auto generator
     */
    int batchInsert(List<UserAO> list) throws DataAccessException;

    /**
     * 批量删除记录
     * @param ids 记录id数组
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date 2018/11/15 15:52:59
     * @author auto generator
     */
    int batchDelete(String[] ids) throws DataAccessException;

    /**
     * 获取username的记录
     * @param username 登录账号
     * @return
     * @throws DataAccessException
     */
    UserDO getByUsername(String username) throws DataAccessException;

    /**
     * 通过UserName（userCode）更新
     * @param userDO
     */
    void updateByUserNameSelective(UserDO userDO);

}
