//~ Formatted by Jindent --- http://www.jindent.com
package com.posp.ui.entity;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.posp.common.service.user.entyty.MenuDO;

import lombok.Data;

/**
 * 菜单类,带有属性结构，方便页面操作
 *
 * @author 高峰
 * @version v1.0.1, 2018/09/06  01:54:34 下午
 */
@Data
public class MenuVO {

    /**
     * 菜单ID
     */
    public String value;

    /**
     * 父菜单ID，一级菜单为0
     */
    public String parentId;

    /**
     * 父菜单名称
     */
    public String parentName;

    /**
     * 菜单名称
     */
    public String name;

    /**
     * 菜单URL
     */
    public String url;

    /**
     * 授权(多个用/分隔，如：user/list,user/create)
     */
    public String perms;

    /**
     * 类型     0：目录   1：菜单   2：按钮
     */
    public String menuType;

    /**
     * 菜单图标
     */
    public String icon;

    /**
     * 排序
     */
    public Integer sortNo;

    /**
     * tree属性 是否选中
     */
    public Boolean checked;

    /**
     * 下级子菜单
     */
    public List<MenuVO> list;

    /**
     * 无参构造
     */
    public MenuVO() {
    }

    /**
     * 使用系统菜单类构造此类
     *
     * @param menu
     * @param remarkFlag true:在名称后边追加备注，用户分配角色;false:默认不追加，只处理菜单类型，目录和按钮不处理
     */
    public MenuVO(MenuDO menu, boolean remarkFlag) {
        if ( null == menu){
            return;
        }
        this.setValue(menu.getId());
        this.setParentId(menu.getParentId());
        this.setIcon(menu.getIcon());
        this.setPerms(menu.getPerms());
        if (("1".equals(menu.getType()) || "2".equals(menu.getType())) && true == remarkFlag && null != menu.getRemark() && !menu.getRemark().isEmpty()) {
            this.setName(menu.getName() + "-[" + menu.getRemark() + "]");
        } else {
            this.setName(menu.getName());
        }
        this.setUrl(menu.getUrl());
        this.setMenuType(menu.getType());
        this.setSortNo(Integer.parseInt(menu.getSortNo()));
        this.setChecked(false);
        this.setSortNo(Integer.parseInt(menu.getSortNo()));
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this,
                new SerializerFeature[]{
                        SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullListAsEmpty,
                        SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteNullNumberAsZero,
                        SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.UseISO8601DateFormat
                });
    }
}
