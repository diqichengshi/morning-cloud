package com.morning.common.service.shop.product.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import java.io.Serializable;
import java.util.List;

@JsonInclude(Include.NON_NULL)
public class CategoryVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
    /**
     * 分类ID
     */
	private Long categoryId;
	
    /**
     * 分类名称
     */
	private String name;
	
    /**
     * 页面标题
     */
	private String pageTitle;
	
    /**
     * 页面描述
     */
	private String pageDescription;
	
    /**
     * 页面关键词
     */
	private String pageKeyword;
	
	/**
	 * 商品列表
	 */
	private List<ProductVO> productVoList;
	
	/**
	 * 类目广告列表
	 */
	private List<CategoryAdvertVO> categoryAdvertVoList;
	
	/**
	 * 子级类目列表
	 */
	private List<CategoryVO> childrenCategoryList;
	
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

	public String getPageTitle() {
		return pageTitle;
	}

	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}

	public String getPageDescription() {
		return pageDescription;
	}

	public void setPageDescription(String pageDescription) {
		this.pageDescription = pageDescription;
	}

	public String getPageKeyword() {
		return pageKeyword;
	}

	public void setPageKeyword(String pageKeyword) {
		this.pageKeyword = pageKeyword;
	}

	public List<ProductVO> getProductVoList() {
		return productVoList;
	}

	public void setProductVoList(List<ProductVO> productVoList) {
		this.productVoList = productVoList;
	}

	public List<CategoryAdvertVO> getCategoryAdvertVoList() {
		return categoryAdvertVoList;
	}

	public void setCategoryAdvertVoList(List<CategoryAdvertVO> categoryAdvertVoList) {
		this.categoryAdvertVoList = categoryAdvertVoList;
	}

	public List<CategoryVO> getChildrenCategoryList() {
		return childrenCategoryList;
	}

	public void setChildrenCategoryList(List<CategoryVO> childrenCategoryList) {
		this.childrenCategoryList = childrenCategoryList;
	}

	@Override
	public String toString() {
		return super.toString();
	}
}
