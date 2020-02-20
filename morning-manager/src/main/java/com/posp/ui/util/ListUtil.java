package com.posp.ui.util;

import java.util.ArrayList;
import java.util.List;

import com.posp.common.service.base.entity.CityDO;
import com.posp.ui.entity.MenuVO;
import com.posp.ui.entity.SelectTreeDTO;

import lombok.Data;

/**
 * @author: gaof
 * @create: 2018/10/24 23:32
 * @description:
 */
@Data
public class ListUtil {

    /**
     * 对菜单操作
     * 将list结构转换为tree结构
     *
     * @param listMenu 列表
     * @param level    级别控制，超出入参级别的数据忽略  tree级别，目前是3级，0：目录   1：菜单   2：按钮
     * @return
     */
    public static List<MenuVO> toTreeMenu(List<MenuVO> listMenu, Integer level) {
        List<MenuVO> tree = new ArrayList<MenuVO>();
        for (MenuVO v : listMenu) {
            if ("0".equalsIgnoreCase(v.getParentId())) {
                tree.add(v);
            }
            for (MenuVO t : listMenu) {
                if (Integer.parseInt(t.getMenuType()) > level) {
                    continue;
                }
                if (t.getParentId().equals(v.getValue())) {
                    if (v.getList() == null) {
                        List<MenuVO> childrens = new ArrayList<MenuVO>();
                        childrens.add(t);
                        v.setList(childrens);
                    } else {
                        v.getList().add(t);
                    }
                }
            }
        }
        return tree;
    }

    /**
     * 将城市list结构转为tree结构，以便级联下拉
     *
     * @param listCity 城市列表
     * @param level    由此级别开始，作为树形结构根节点
     * @return
     */
    public static List<SelectTreeDTO> toTreeCity(List<CityDO> listCity, Integer level) {
        List<SelectTreeDTO> tree = new ArrayList<SelectTreeDTO>();
        for (CityDO d : listCity) {
            SelectTreeDTO s = new SelectTreeDTO();
            s.setName(d.getCityName());
            s.setValue(d.getCityCode());
            if (Integer.parseInt(d.getCityLevel()) == level) {
                tree.add(s);
            }
            for (CityDO t : listCity) {
                if (t.getPCityCode().equals(d.getCityCode())) {
                    SelectTreeDTO m = new SelectTreeDTO();
                    m.setName(t.getCityName());
                    m.setValue(t.getCityCode());

                    if (s.getChildren() == null) {
                        List<SelectTreeDTO> childrens = new ArrayList<SelectTreeDTO>();
                        childrens.add(m);
                        s.setChildren(childrens);
                    } else {
                        s.getChildren().add(m);
                    }
                }
            }
        }
        return tree;
    }
}
