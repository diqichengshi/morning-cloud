package com.morning.common.service.shop.product.vo;


import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ShoppingCartVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
    /**
     * 购物车ID
     */
	private Long cartId;
	/**
	 * 商品编号
	 */
	private String productId;
    /**
     * 商品规格编号
     */
	private String productSpecAttrId;
	
    /**
     * 用户ID
     */
	private Long userId;
	
    /**
     * 购买数量
     */
	private Integer buyNumber;
	
    /**
     * 创建时间
     */
	private Date createTime;
	
    /**
     * 更新时间
     */
	private Date updateTime;
	
    /**
     * 购物车状态：0,未选中；1,选中
     */
	private Integer checkStatus;

    /**
     * 商品名称
     */
	private String name;
    /**
     * 展示图片
     */
	private String picImg;
    /**
     * 库存
     */
	private Integer stock;
    /**
     * 销售量
     */
	private Integer salesVolume;
    /**
     * 价格
     */
	private BigDecimal price;
	/**
	 * 商品总金额
	 */
	private BigDecimal productAmount;
    /**
     * 积分
     */
	private Integer score;
    /**
     * 商品总积分
     */
	private Integer productScore;
    /**
     * 规格：规格ID，以“,”相隔
     */
	private String spec;
    /**
     * 规格属性名称
     */
	/*private List<String> specificationAttrName;*/
	/**
	 * 商品规格属性名称
	 */
	private String productSpecAttrName;

	public void getTotal() {
		BigDecimal productAmountTemp = this.getPrice().multiply(new BigDecimal(this.getBuyNumber()));
		Integer productScoreTemp = this.getScore() * this.getBuyNumber();
		this.productAmount = productAmountTemp;
		this.productScore = productScoreTemp;
	}
	
	public Long getCartId() {
		return cartId;
	}

	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductSpecAttrId() {
		return productSpecAttrId;
	}

	public void setProductSpecAttrId(String productSpecAttrId) {
		this.productSpecAttrId = productSpecAttrId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}


	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Integer getStock() {
		return stock;
	}
	
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	
	public Integer getSalesVolume() {
		return salesVolume;
	}
	
	public void setSalesVolume(Integer salesVolume) {
		this.salesVolume = salesVolume;
	}
	
	public BigDecimal getPrice() {
		return price;
	}
	
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	public BigDecimal getProductAmount() {
		BigDecimal productAmountTemp = this.getPrice().multiply(new BigDecimal(this.getBuyNumber()));
		this.productAmount = productAmountTemp;
		return productAmount;
	}

	public void setProductAmount(BigDecimal productAmount) {
		this.productAmount = productAmount;
	}

	public Integer getScore() {
		return score;
	}
	
	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getProductScore() {
		Integer productScoreTemp = this.getScore() * this.getBuyNumber();
		this.productScore = productScoreTemp;
		return productScore;
	}

	public void setProductScore(Integer productScore) {
		this.productScore = productScore;
	}

	public String getSpec() {
		/*if (spec.startsWith(",")){
			spec=spec.substring(1);
		}*/
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	/*public List<String> getSpecificationAttrName() {
		return specificationAttrName;
	}*/

	/*public void setSpecificationAttrName(List<String> specificationAttrName) {
		this.specificationAttrName = specificationAttrName;
	}*/

	/*public String getProductSpecAttrName() {
		StringBuilder productSpecNameTemp = new StringBuilder();
		if (!this.getSpecificationAttrName().isEmpty()) {
			for (String name : this.getSpecificationAttrName()) {
				productSpecNameTemp.append(name);
				productSpecNameTemp.append(" ");
			}
			this.productSpecAttrName = productSpecNameTemp.toString();
		}
		return productSpecAttrName;
	}*/

	public void setProductSpecAttrName(String productSpecAttrName) {
		this.productSpecAttrName = productSpecAttrName;
	}
	@Override
	public String toString() {
		return super.toString();
	}
}
