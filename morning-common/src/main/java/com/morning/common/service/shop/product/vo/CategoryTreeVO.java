package com.morning.common.service.shop.product.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import java.io.Serializable;
import java.util.List;

@JsonInclude(Include.NON_NULL)
public class CategoryTreeVO  implements Serializable{

	private static final long serialVersionUID = 1L;
	
    /**
     * 分类ID
     */
	private Long categoryId;

	private Long parentId;
    /**
     * 分类名称
     */
	private String name;

	/**
	 * 商品列表
	 */
	private List<CategoryTreeVO> categoryList;

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<CategoryTreeVO> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<CategoryTreeVO> categoryList) {
		this.categoryList = categoryList;
	}

	@Override
	public String toString() {
		return super.toString();
	}
}
