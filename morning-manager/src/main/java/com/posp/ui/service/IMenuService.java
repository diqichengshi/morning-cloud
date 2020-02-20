package com.posp.ui.service;

import java.util.List;

import com.posp.common.service.user.ao.MenuAO;
import com.posp.common.service.user.bo.MenuBO;
import com.posp.common.service.user.entyty.MenuDO;
import com.posp.common.service.user.query.MenuQuery;
import com.posp.ui.entity.MenuVO;
import org.springframework.dao.DataAccessException;

/**
 * 菜单服务包装接口类
 *
 * @version v1.0.1, 2018/09/06  02:08:53 下午
 * @author 高峰
 */
public interface IMenuService {

    /**
     * 获取指定userId的菜单，列表结构，必须实现的接口(shiro使用)
     * 用于展示左侧菜单
     * @param userId
     * @return
     */
    List<MenuVO> listByUserId(String userId);

    /**
     * 取指定userId的菜单，列表结构
     * 用户角色分配菜单使用
     * 展示的方式不一样，在分配菜单页面中，需要展示备注信息，而左侧菜单是不需要，原来是使用listByUserId，现在拆分出来
     * @param userId
     * @return
     */
    List<MenuVO> listByUserIdForRole(String userId);

    /**
     * 设置节点选中项
     *
     * @param roleId
     * @param menuList 全部菜单列表，取的是当前登录用户的菜单列表,IMenuService.listTreeByUserId()返回值
     * @return
     * @version        v1.0.1, 2018/09/10 10:56:21 下午
     * @author         gaofeng
     */
    List<MenuVO> setSelect(String roleId, List<MenuVO> menuList);


    /**
     * 删除指定ID的记录
     *
     * @param id pk主键
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    int delete(String id) throws DataAccessException;

    /**
     * 添加记录
     *
     * @param record 记录
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    int insert(MenuAO record) throws DataAccessException;

    /**
     * 根据参数类查找记录[分页]
     *
     * @param query 查询条件
     * @return 查询记录列表
     * @throws DataAccessException 异常
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    List<MenuDO> listPage(MenuQuery query) throws DataAccessException;

    /**
     * 修改指定ID的记录
     *
     * @param record 记录
     * @return 修改记录数
     * @throws DataAccessException 异常
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    int update(MenuBO record) throws DataAccessException;

    /**
     * 获取指定Id的记录
     *
     * @param id pk主键
     * @return 查询结果记录对象
     * @throws DataAccessException 异常
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    MenuDO get(String id) throws DataAccessException;

    /**
     * 批量添加记录
     *
     * @param list 添加记录里诶包
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    int batchInsert(List<MenuAO> list) throws DataAccessException;

    /**
     * 批量删除记录
     * @param ids 记录id数组
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date 2018/11/15 17:28:55
     * @author auto generator
     */
    int batchDelete(String[] ids) throws DataAccessException;

    /**
     * 获取指定用户的的菜单
     *
     * @param userId
     * @return
     * @throws DataAccessException
     * @date   018/09/10 01:08:33 上午
     * @author gaofeng
     */
    List<MenuDO> selectByUserId(String userId) throws DataAccessException;

}
