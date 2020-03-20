package com.morning.shop.product.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.morning.common.service.shop.product.dto.ReconmmendDTO;
import com.morning.common.service.shop.product.entity.ProductImg;
import com.morning.common.service.shop.product.entity.Recommend;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 类描述：商品图片  数据访问层接口
 * 创建人：赵娟娟
 * 创建时间：2017年4月11日 下午3:15:36
 */
@Mapper
public interface ProductImgMapper extends BaseMapper<ProductImg> {

}