package com.morning.common.tree;

import java.util.List;

/**
 * Created by 赵娟 on 2019/7/14.
 * 描述:
 */
public class TreeNode {
    private String id;
    private String pid;
    private String name;
    private List<TreeNode> children;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public List<TreeNode> getChildren() {
        return children;
    }
    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }
    @Override
    public String toString() {
        return "TreeNode [id=" + id + ", pid=" + pid + ", name=" + name + ", children=" + children + "]";
    }
    public TreeNode() {
    }
    public TreeNode(String id, String name, String pid) {
        this.id = id;
        this.pid = pid;
        this.name = name;
    }
}
