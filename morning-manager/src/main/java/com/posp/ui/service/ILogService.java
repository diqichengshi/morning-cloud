package com.posp.ui.service;

import com.posp.common.service.user.ao.LogAO;
import com.posp.common.service.user.bo.LogBO;
import com.posp.common.service.user.entyty.LogDO;
import com.posp.common.service.user.query.LogQuery;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * 操作日志服务接口类
 *
 * @date 2018/11/16 13:40:42
 * @author auto generator
 */
public interface ILogService {

    /**
     * 删除指定ID的记录
     *
     * @param id pk主键
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    int delete(String id) throws DataAccessException;

    /**
     * 添加记录
     *
     * @param record 记录
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    int insert(LogAO record) throws DataAccessException;

    /**
     * 根据参数类查找记录[分页]
     *
     * @param query 查询条件
     * @return 查询记录列表
     * @throws DataAccessException 异常
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    List<LogDO> listPage(LogQuery query) throws DataAccessException;

    /**
     * 修改指定ID的记录
     *
     * @param record 记录
     * @return 修改记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    int update(LogBO record) throws DataAccessException;

    /**
     * 获取指定Id的记录
     *
     * @param id pk主键
     * @return 查询结果记录对象
     * @throws DataAccessException 异常
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    LogDO get(String id) throws DataAccessException;

    /**
     * 批量添加记录
     *
     * @param list 添加记录里诶包
     * @return 添加记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    int batchInsert(List<LogAO> list) throws DataAccessException;

    /**
     * 批量删除记录
     * @param ids 记录id数组
     * @return 删除记录数
     * @throws DataAccessException 异常
     * @date 2018/11/16 13:40:42
     * @author auto generator
     */
    int batchDelete(String[] ids) throws DataAccessException;

}
