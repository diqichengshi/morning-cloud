package com.morning.manager.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.morning.manager.entity.Menu;
import com.morning.manager.entity.vo.ShowMenuVo;

import java.util.List;
import java.util.Map;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface MenuMapper extends BaseMapper<Menu> {

    List<ShowMenuVo> selectShowMenuByUser(Map<String, Object> map);

    List<Menu> getMenus(Map<String, Object> map);
}