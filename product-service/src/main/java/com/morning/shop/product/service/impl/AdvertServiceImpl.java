package com.morning.shop.product.service.impl;

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
    public AdvertDTO queryHomeComputerList() {
        // 电脑专栏
        AdvertItem computer1=this.queryAdvertItemByType("4");
        AdvertItem computer2=this.queryAdvertItemByType("5");
        List<AdvertItem> computerItemList=new ArrayList<>();
        computerItemList.add(computer1);
        computerItemList.add(computer2);

        AdvertDTO advertDTO=new AdvertDTO();
        advertDTO.setTitle("电脑");
        String link="电脑馆, 游戏极品, 装机大师, 职场焕新, 女神频道, 虚拟现实, 二合一平板, 电子教育, 万物周刊";
        advertDTO.setLinkList(Arrays.asList(link.split(",")));
        advertDTO.setItemList(computerItemList);
        return advertDTO;
    }

    @Override
    public AdvertDTO queryHomeEatList() {
        // 爱吃专栏
        AdvertItem eat1 = this.queryAdvertItemByType("6");
        AdvertItem eat2 = this.queryAdvertItemByType("7");
        List<AdvertItem> eatItemList = new ArrayList<>();
        eatItemList.add(eat1);
        eatItemList.add(eat2);

        AdvertDTO advertDTO = new AdvertDTO();
        advertDTO.setTitle("爱吃");
        String link = "休闲零食, 坚果, 牛奶, 饮料冲调, 食用油, 大米, 白酒, 红酒, 烧烤食材, 牛排, 樱桃";
        advertDTO.setLinkList(Arrays.asList(link.split(",")));
        advertDTO.setItemList(eatItemList);
        return advertDTO;
    }

    public AdvertItem queryAdvertItemByType(String type) {
        AdvertItem advertItem = new AdvertItem();
        List<AdvertDO> itemFourList = new ArrayList<>();
        List<AdvertDO> itemContentList = new ArrayList<>();

        Map<String, Object> columnMap = new HashMap<>();
        columnMap.put("type", type);//写表中的列名
        List<Advert> list = advertMapper.selectByMap(columnMap);
        for (int i = 0; i < list.size(); i++) {
            Advert advert = list.get(i);
            AdvertDO tempAdvert = new AdvertDO();
            BeanUtils.copyProperties(advert, tempAdvert);
            if ("0".equals(advert.getPosition())) {
                advertItem.setBigAdvert(tempAdvert);
            }
            if ("1".equals(advert.getPosition())) {
                itemFourList.add(tempAdvert);
            }
            if ("2".equals(advert.getPosition())) {
                itemContentList.add(tempAdvert);
            }
        }
        advertItem.setItemFour(itemFourList);
        advertItem.setItemContent(itemContentList);
        return advertItem;
    }

    @Override
    public CarouselDTO queryCarouselList() {
        String carouselItem="static/img/nav/1.jpg, static/img/nav/2.jpg, static/img/nav/3.jpg, static/img/nav/4.jpg, static/img/nav/5.jpg";
        String activity="static/img/nav/nav_showimg1.jpg,static/img/nav/nav_showimg2.jpg";
        CarouselDTO carouselDTO=new CarouselDTO();
        carouselDTO.setCarouselItemList(Arrays.asList(carouselItem.split(",")));
        carouselDTO.setActivityList(Arrays.asList(activity.split(",")));
        return carouselDTO;
    }

}
