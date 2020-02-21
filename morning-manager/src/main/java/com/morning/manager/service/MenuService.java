package com.morning.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.morning.manager.entity.vo.ShowMenuVo;
import com.morning.manager.entity.Menu;

import java.util.List;
import java.util.Map;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface MenuService extends IService<Menu> {

    List<ShowMenuVo> getShowMenuByUser(String userId);

    List<Menu> selectAllMenus(Map<String, Object> map);

    List<Menu> selectAllMenuList(Map<String, Object> map);

    Menu selectById(String parentId);

    Integer getCountByName(String name);

    Integer getCountByPermission(String permission);

    Integer selectFirstLevelMenuMaxSort();

    Integer seleclMenuMaxSortByPArentId(String parentId);

    void saveOrUpdateMenu(Menu menu);
}
