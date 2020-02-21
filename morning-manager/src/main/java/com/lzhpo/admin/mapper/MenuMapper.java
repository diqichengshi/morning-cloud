package com.lzhpo.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lzhpo.admin.entity.Menu;
import com.lzhpo.admin.entity.vo.ShowMenuVo;

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