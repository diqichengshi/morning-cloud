package com.morning.shop.product.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.morning.common.service.shop.product.dto.AdvertDTO;
import com.morning.common.service.shop.product.dto.AdvertItem;
import com.morning.common.service.shop.product.dto.CarouselDTO;
import com.morning.common.service.shop.product.entity.Advert;
import com.morning.common.service.shop.product.entity.AdvertDO;
import com.morning.shop.product.dao.AdvertMapper;
import com.morning.shop.product.service.IAdvertService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * <p>
 * 首页专栏 服务实现类
 * </p>
 *
 * @author 赵娟
 * @since 2019-10-08
 */
@Service
public class AdvertServiceImpl extends ServiceImpl<AdvertMapper, Advert> implements IAdvertService {
    @Autowired
    private AdvertMapper advertMapper;

    @Override
    public List<CarouselDTO> queryCarouselList() {
        List<Advert> advertList = advertMapper.selectPage(new Page<>(1,4),null);
        List<CarouselDTO> carouselDTOList=new ArrayList<>();
        for (int i = 0; i < advertList.size(); i++) {
            CarouselDTO dto=new CarouselDTO();
            BeanUtils.copyProperties(advertList.get(i),dto);
            carouselDTOList.add(dto);
        }

        return carouselDTOList;
    }

}
