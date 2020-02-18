/*
Navicat MySQL Data Transfer

Source Server         : 106.52.83.225
Source Server Version : 50564
Source Host           : 106.52.83.225:3306
Source Database       : morning_shopping

Target Server Type    : MYSQL
Target Server Version : 50564
File Encoding         : 65001

Date: 2019-10-14 17:17:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for os_address
-- ----------------------------
DROP TABLE IF EXISTS `os_address`;
CREATE TABLE `os_address` (
  `address_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收获地址ID',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认地址',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `user_tag` varchar(64) DEFAULT NULL COMMENT '地址标签',
  `user_phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `province_id` int(10) unsigned DEFAULT NULL COMMENT '省份ID',
  `province_name` varchar(64) DEFAULT NULL COMMENT '省份名字',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '城市ID',
  `city_name` varchar(64) DEFAULT NULL COMMENT '城市名字',
  `county_id` int(10) unsigned DEFAULT NULL COMMENT '区域ID',
  `county_name` varchar(64) DEFAULT NULL COMMENT '区域名字',
  `user_adress` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `user_zipcode` int(6) DEFAULT NULL COMMENT '邮政编码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收获地址表';

-- ----------------------------
-- Records of os_address
-- ----------------------------
INSERT INTO `os_address` VALUES ('3', 'N', '1', '陈星星', '家', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:14', '2017-03-16 18:48:18');
INSERT INTO `os_address` VALUES ('24', 'N', '1', '陈星星', '大苏打', '18857105127', '1', '北京市', '2', '北京市', '3', '东城区', '大撒旦3d大苏打', '321231', '2017-05-10 02:15:40', null);
INSERT INTO `os_address` VALUES ('25', 'N', '1', '陈星星', '学校', '18857105127', '804', '辽宁省', '822', '朝阳市', '825', '北票市', '杭州师范大学仓前校区', '123456', '2017-05-10 02:16:48', '2017-05-10 15:39:11');

-- ----------------------------
-- Table structure for os_advert
-- ----------------------------
DROP TABLE IF EXISTS `os_advert`;
CREATE TABLE `os_advert` (
  `id` bigint(32) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '专栏名称',
  `type` varchar(2) DEFAULT NULL,
  `product_id` varchar(32) DEFAULT NULL COMMENT '商品Id',
  `title` varchar(100) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `pic_img` varchar(100) DEFAULT NULL,
  `position` varchar(2) DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页专栏';

-- ----------------------------
-- Records of os_advert
-- ----------------------------
INSERT INTO `os_advert` VALUES ('0', '电脑数码', '4', null, null, null, 'static/img/index/computer/item-computer-1.jpg', '0');
INSERT INTO `os_advert` VALUES ('1', '电脑数码', '4', null, '电脑馆', '笔记本999元限量秒！', 'static/img/index/computer/item-computer-2.jpg', '1');
INSERT INTO `os_advert` VALUES ('2', '电脑数码', '4', null, '外设装备', '1000减618', 'static/img/index/computer/item-computer-1-3.jpg', '1');
INSERT INTO `os_advert` VALUES ('3', '电脑数码', '4', null, '电脑配件', '联合满减最高省618', 'static/img/index/computer/item-computer-1-4.jpg', '1');
INSERT INTO `os_advert` VALUES ('4', '电脑数码', '4', null, '办公生活', '5折神券 精品文具', 'static/img/index/computer/item-computer-1-5.jpg', '1');
INSERT INTO `os_advert` VALUES ('5', '电脑数码', '4', null, null, null, 'static/img/index/computer/item-computer-1-6.jpg', '2');
INSERT INTO `os_advert` VALUES ('6', '电脑数码', '4', null, null, null, 'static/img/index/computer/item-computer-1-7.jpg', '2');
INSERT INTO `os_advert` VALUES ('7', '电脑数码', '4', null, null, null, 'static/img/index/computer/item-computer-1-8.jpg', '2');
INSERT INTO `os_advert` VALUES ('8', '电脑数码', '5', null, null, null, 'static/img/index/computer/item-computer-2-1.jpg', '0');
INSERT INTO `os_advert` VALUES ('9', '电脑数码', '5', null, '平板电脑', '爆款平板12期免息', 'static/img/index/computer/item-computer-2-2.jpg', '1');
INSERT INTO `os_advert` VALUES ('10', '电脑数码', '5', null, '智能酷玩', '抢999减666神券', 'static/img/index/computer/item-computer-2-3.jpg', '1');
INSERT INTO `os_advert` VALUES ('11', '电脑数码', '5', null, '娱乐影音', '大牌耳机低至5折', 'static/img/index/computer/item-computer-2-4.jpg', '1');
INSERT INTO `os_advert` VALUES ('12', '电脑数码', '5', null, '摄影摄像', '大牌相机5折抢', 'static/img/index/computer/item-computer-2-5.jpg', '1');
INSERT INTO `os_advert` VALUES ('13', '电脑数码', '5', null, null, null, 'static/img/index/computer/item-computer-2-6.jpg', '2');
INSERT INTO `os_advert` VALUES ('14', '电脑数码', '5', null, null, null, 'static/img/index/computer/item-computer-2-7.jpg', '2');
INSERT INTO `os_advert` VALUES ('15', '电脑数码', '5', null, null, null, 'static/img/index/computer/item-computer-2-8.jpg', '2');
INSERT INTO `os_advert` VALUES ('16', '爱吃', '6', null, null, null, 'static/img/index/eat/item-eat-1-1.jpg', '0');
INSERT INTO `os_advert` VALUES ('17', '爱吃', '6', null, '粮油调味', '买2免1', 'static/img/index/eat/item-eat-1-2.jpg', '1');
INSERT INTO `os_advert` VALUES ('18', '爱吃', '6', null, '饮料冲调', '第二件半价', 'static/img/index/eat/item-eat-1-3.jpg', '1');
INSERT INTO `os_advert` VALUES ('19', '爱吃', '6', null, '休闲零食', '满99减40', 'static/img/index/eat/item-eat-1-4.jpg', '1');
INSERT INTO `os_advert` VALUES ('20', '爱吃', '6', null, '中外名酒', '满199减100', 'static/img/index/eat/item-eat-1-5.jpg', '1');
INSERT INTO `os_advert` VALUES ('21', '爱吃', '6', null, null, null, 'static/img/index/eat/item-eat-1-6.jpg', '2');
INSERT INTO `os_advert` VALUES ('22', '爱吃', '6', null, null, null, 'static/img/index/eat/item-eat-1-7.jpg', '2');
INSERT INTO `os_advert` VALUES ('23', '爱吃', '6', null, null, null, 'static/img/index/eat/item-eat-1-8.jpg', '2');
INSERT INTO `os_advert` VALUES ('24', '爱吃', '7', null, null, null, 'static/img/index/eat/item-eat-2-1.jpg', '0');
INSERT INTO `os_advert` VALUES ('25', '爱吃', '7', null, '东家菜', '丰富好味', 'static/img/index/eat/item-eat-2-2.jpg', '1');
INSERT INTO `os_advert` VALUES ('26', '爱吃', '7', null, '东家菜', '丰富好味', 'static/img/index/eat/item-eat-2-2.jpg', '1');
INSERT INTO `os_advert` VALUES ('27', '爱吃', '7', null, '东家菜', '丰富好味', 'static/img/index/eat/item-eat-2-2.jpg', '1');
INSERT INTO `os_advert` VALUES ('28', '爱吃', '7', null, '东家菜', '丰富好味', 'static/img/index/eat/item-eat-2-2.jpg', '1');
INSERT INTO `os_advert` VALUES ('29', '爱吃', '7', null, null, null, 'static/img/index/eat/item-eat-2-6.jpg', '2');
INSERT INTO `os_advert` VALUES ('30', '爱吃', '7', null, null, null, 'static/img/index/eat/item-eat-2-7.jpg', '2');
INSERT INTO `os_advert` VALUES ('31', '爱吃', '7', null, null, null, 'static/img/index/eat/item-eat-2-8.jpg', '2');

-- ----------------------------
-- Table structure for os_category
-- ----------------------------
DROP TABLE IF EXISTS `os_category`;
CREATE TABLE `os_category` (
  `category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `type` tinyint(2) DEFAULT NULL COMMENT '目录类型 2=二级目录/1=一级目录/0=总目录',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态 1=显示/0=隐藏',
  `show_in_nav` tinyint(2) DEFAULT '0' COMMENT '是否导航栏 1=显示/0=隐藏',
  `show_in_top` tinyint(2) DEFAULT '0' COMMENT '是否置顶 1=置顶/0=默认',
  `show_in_hot` tinyint(2) DEFAULT '0' COMMENT '是否热门 1=热门/0=默认',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `page_title` varchar(64) DEFAULT NULL COMMENT '页面标题',
  `page_description` varchar(64) DEFAULT NULL COMMENT '页面描述',
  `page_keyword` varchar(64) DEFAULT NULL COMMENT '页面关键词',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4499 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of os_category
-- ----------------------------
INSERT INTO `os_category` VALUES ('1', '0', '全部商品', null, '0', '1', '0', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '全部商品', null, null, null);
INSERT INTO `os_category` VALUES ('2', '1', '家用电器', '10', '1', '0', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '插线板', null, null, null);
INSERT INTO `os_category` VALUES ('3', '1', '手机/运营商/数码', '100', '1', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-06-08 07:06:07', '猫宁', '手机', '小米手机,超乎你的想象,性能超级棒;小米手机,超乎你的想象,性能超级棒.', '小米手机,超乎你的想象,性能超级棒', '小米手机');
INSERT INTO `os_category` VALUES ('4', '1', '电脑/办公', '200', '1', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-06-08 06:51:01', '猫宁', '智能硬件', null, null, '');
INSERT INTO `os_category` VALUES ('5', '1', '家居/家具/家装/厨具', '300', '1', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '笔记本/平板', null, null, null);
INSERT INTO `os_category` VALUES ('6', '1', '男装/女装/童装/内衣', '400', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '路由器/移动电源', null, null, null);
INSERT INTO `os_category` VALUES ('7', '1', '美妆/个护清洁/宠物', '500', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '周边配件', null, null, null);
INSERT INTO `os_category` VALUES ('8', '1', '女鞋/箱包/钟表/珠宝', '600', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '耳机/音响', null, null, null);
INSERT INTO `os_category` VALUES ('9', '1', '男鞋/运动/户外', '700', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '保护套/贴膜', null, null, null);
INSERT INTO `os_category` VALUES ('10', '1', '房产/汽车/汽车用品', '800', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '生活周边', null, null, null);
INSERT INTO `os_category` VALUES ('11', '1', '母婴/玩具乐器', '10', '2', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-06-08 06:48:38', '猫宁', '手环及配件', '手环及配件', '手环及配件', '手环及配件');
INSERT INTO `os_category` VALUES ('12', '1', '食品/酒类/生鲜/特产', '20', '2', '1', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能健康', null, null, null);
INSERT INTO `os_category` VALUES ('13', '1', '艺术/礼品鲜花/农资绿植', '30', '2', '1', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能家居', null, null, null);
INSERT INTO `os_category` VALUES ('14', '1', '医药保健/计生情趣', '40', '2', '1', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能出行', null, null, null);
INSERT INTO `os_category` VALUES ('15', '1', '图书/文娱/电子书', '10', '2', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '笔记本电脑', null, null, null);
INSERT INTO `os_category` VALUES ('16', '1', '机票/酒店/旅游/生活', '20', '2', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '平板电脑', null, null, null);
INSERT INTO `os_category` VALUES ('17', '1', '理财/众筹/白条/保险', '10', '2', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '路由器', null, null, null);
INSERT INTO `os_category` VALUES ('18', '1', '安装/维修/清洗保养', '20', '2', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '移动电源', null, null, null);
INSERT INTO `os_category` VALUES ('19', '1', '工艺品', '30', '2', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '路由器配件', null, null, null);
INSERT INTO `os_category` VALUES ('1848', '10', '车载电器', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1849', '1848', '行车记录仪', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1850', '1848', '车载充电器', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1851', '1848', '车机导航', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1852', '1848', '车载蓝牙', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1853', '1848', '智能驾驶', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1854', '1848', '对讲电台', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1855', '1848', '倒车雷达', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1856', '1848', '导航仪', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1857', '1848', '安全预警仪', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1858', '1848', '车载净化器', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1859', '1848', '车载吸尘器', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1860', '1848', '汽车音响', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1861', '1848', '车载冰箱', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1862', '1848', '应急电源', '13', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1863', '1848', '逆变器', '14', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1864', '1848', '车载影音', '15', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1865', '1848', '车载生活电器', '16', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1866', '1848', '车载电器配件', '17', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1867', '10', '美容清洗', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1868', '1867', '洗车机', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1869', '1867', '洗车水枪', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1870', '1867', '玻璃水', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1871', '1867', '清洁剂', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1872', '1867', '镀晶镀膜', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1873', '1867', '车蜡', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1874', '1867', '汽车贴膜', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1875', '1867', '底盘装甲', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1876', '1867', '补漆笔', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1877', '1867', '毛巾掸子', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1878', '1867', '洗车配件', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1879', '10', '安全自驾', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1880', '1879', '胎压监测', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1881', '1879', '充气泵', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1882', '1879', '灭火器', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1883', '1879', '车载床', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1884', '1879', '应急救援', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1885', '1879', '防盗设备', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1886', '1879', '自驾野营', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1887', '1879', '摩托车', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1888', '1879', '摩托周边', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1889', '1879', '保温箱', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1890', '1879', '储物箱', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1891', '10', '汽车服务', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1892', '1891', '保养维修', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1893', '1891', '洗车', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1894', '1891', '钣金喷漆', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1895', '1891', '清洗美容', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1896', '1891', '功能升级', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1897', '1891', '改装服务', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1898', '1891', 'ETC', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1899', '1891', '驾驶培训', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1900', '1891', '油卡充值', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1901', '1891', '加油卡', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1902', '11', '奶粉', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1903', '1902', '1段', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1904', '1902', '2段', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1905', '1902', '3段', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1906', '1902', '4段', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1907', '1902', '孕妈奶粉', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1908', '1902', '特殊配方奶粉', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1909', '1902', '有机奶粉', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1910', '11', '营养辅食', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1911', '1910', '米粉/菜粉', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1912', '1910', '面条/粥', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1913', '1910', '果泥/果汁', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1914', '1910', '益生菌/初乳', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1915', '1910', 'DHA', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1916', '1910', '钙铁锌/维生素', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1917', '1910', '清火/开胃', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1918', '1910', '宝宝零食', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1919', '11', '尿裤湿巾', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1920', '1919', 'NB', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1921', '1919', 'S', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1922', '1919', 'M', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1923', '1919', 'L', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1924', '1919', 'XL', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1925', '1919', 'XXL', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1926', '1919', '拉拉裤', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1927', '1919', '成人尿裤', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1928', '1919', '婴儿湿巾', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1929', '11', '喂养用品', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1930', '1929', '奶瓶奶嘴', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1931', '1929', '吸奶器', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1932', '1929', '暖奶消毒', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1933', '1929', '辅食料理机', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1934', '1929', '牙胶安抚', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1935', '1929', '食物存储', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1936', '1929', '儿童餐具', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1937', '1929', '水壶/水杯', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1938', '1929', '围兜/防溅衣', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1939', '11', '洗护用品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1940', '1939', '宝宝护肤', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1941', '1939', '日常护理', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1942', '1939', '洗发沐浴', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1943', '1939', '洗澡用具', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1944', '1939', '洗衣液/皂', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1945', '1939', '理发器', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1946', '1939', '婴儿口腔清洁', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1947', '1939', '座便器', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1948', '1939', '驱蚊防晒', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1949', '11', '寝居服饰', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1950', '1949', '睡袋/抱被', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1951', '1949', '婴儿枕', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1952', '1949', '毛毯棉被', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1953', '1949', '婴童床品', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1954', '1949', '浴巾/浴衣', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1955', '1949', '毛巾/口水巾', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1956', '1949', '婴儿礼盒', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1957', '1949', '婴儿内衣', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1958', '1949', '婴儿外出服', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1959', '1949', '隔尿垫巾', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1960', '1949', '尿布', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1961', '1949', '安全防护', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1962', '1949', '爬行垫', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1963', '1949', '婴儿鞋帽袜', '13', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1964', '11', '妈妈专区', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1965', '1964', '防辐射服', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1966', '1964', '孕妈装', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1967', '1964', '孕妇护肤', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1968', '1964', '妈咪包/背婴带', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1969', '1964', '待产护理', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1970', '1964', '产后塑身', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1971', '1964', '文胸/内裤', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1972', '1964', '防溢乳垫', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1973', '1964', '孕期营养', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1974', '11', '童车童床', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1975', '1974', '安全座椅', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1976', '1974', '婴儿推车', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1977', '1974', '婴儿床', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1978', '1974', '婴儿床垫', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1979', '1974', '餐椅', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1980', '1974', '学步车', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1981', '1974', '三轮车', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1982', '1974', '自行车', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1983', '1974', '扭扭车', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1984', '1974', '滑板车', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1985', '1974', '电动车', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1986', '11', '玩具', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1987', '1986', '适用年龄', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1988', '1986', '遥控/电动', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1989', '1986', '益智玩具', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1990', '1986', '积木拼插', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1991', '1986', '动漫玩具', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1992', '1986', '毛绒布艺', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1993', '1986', '模型玩具', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1994', '1986', '健身玩具', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1995', '1986', '娃娃玩具', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1996', '1986', '绘画/DIY', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1997', '1986', '创意减压', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1998', '11', '乐器', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('1999', '1998', '钢琴', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2000', '1998', '电钢琴', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2001', '1998', '电子琴', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2002', '1998', '吉他', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2003', '1998', '尤克里里', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2004', '1998', '打击乐器', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2005', '1998', '西洋管弦', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2006', '1998', '民族乐器', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2007', '1998', '乐器配件', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2008', '12', '新鲜水果', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2009', '2008', '苹果', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2010', '2008', '橙子', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2011', '2008', '奇异果/猕猴桃', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2012', '2008', '火龙果', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2013', '2008', '榴莲', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2014', '2008', '芒果', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2015', '2008', '椰子', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2016', '2008', '车厘子', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2017', '2008', '百香果', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2018', '2008', '柚子', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2019', '2008', '国产水果', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2020', '2008', '进口水果', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2021', '12', '蔬菜蛋品', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2022', '2021', '蛋品', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2023', '2021', '叶菜类', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2024', '2021', '根茎类', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2025', '2021', '葱姜蒜椒', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2026', '2021', '鲜菌菇', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2027', '2021', '茄果瓜类', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2028', '2021', '半加工蔬菜', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2029', '2021', '半加工豆制品', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2030', '2021', '玉米', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2031', '2021', '山药', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2032', '2021', '地瓜/红薯', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2033', '12', '精选肉类', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2034', '2033', '猪肉', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2035', '2033', '牛肉', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2036', '2033', '羊肉', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2037', '2033', '鸡肉', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2038', '2033', '鸭肉', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2039', '2033', '冷鲜肉', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2040', '2033', '特色肉类', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2041', '2033', '内脏类', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2042', '2033', '冷藏熟食', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2043', '2033', '牛排', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2044', '2033', '牛腩', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2045', '2033', '鸡翅', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2046', '12', '海鲜水产', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2047', '2046', '鱼类', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2048', '2046', '虾类', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2049', '2046', '蟹类', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2050', '2046', '贝类', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2051', '2046', '海参', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2052', '2046', '鱿鱼/章鱼', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2053', '2046', '活鲜', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2054', '2046', '三文鱼', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2055', '2046', '大闸蟹', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2056', '2046', '小龙虾', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2057', '2046', '海鲜加工品', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2058', '2046', '海产干货', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2059', '12', '冷饮冻食', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2060', '2059', '水饺/馄饨', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2061', '2059', '汤圆/元宵', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2062', '2059', '面点', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2063', '2059', '烘焙半成品', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2064', '2059', '奶酪/黄油', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2065', '2059', '方便速食', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2066', '2059', '火锅丸串', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2067', '2059', '冰淇淋', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2068', '2059', '冷藏饮料', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2069', '2059', '低温奶', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2070', '12', '中外名酒', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2071', '2070', '白酒', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2072', '2070', '葡萄酒', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2073', '2070', '洋酒', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2074', '2070', '啤酒', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2075', '2070', '黄酒/养生酒', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2076', '2070', '收藏酒/陈年老酒', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2077', '12', '进口食品', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2078', '2077', '牛奶', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2079', '2077', '饼干蛋糕', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2080', '2077', '糖/巧克力', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2081', '2077', '零食', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2082', '2077', '水', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2083', '2077', '饮料', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2084', '2077', '咖啡粉', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2085', '2077', '冲调品', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2086', '2077', '油', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2087', '2077', '方便食品', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2088', '2077', '米面调味', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2089', '12', '休闲食品', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2090', '2089', '中华老字号', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2091', '2089', '营养零食', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2092', '2089', '休闲零食', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2093', '2089', '膨化食品', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2094', '2089', '坚果炒货', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2095', '2089', '肉干/熟食', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2096', '2089', '蜜饯果干', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2097', '2089', '糖果/巧克力', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2098', '2089', '饼干蛋糕', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2099', '12', '地方特产', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2100', '2099', '北京', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2101', '2099', '上海', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2102', '2099', '新疆', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2103', '2099', '陕西', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2104', '2099', '湖南', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2105', '2099', '云南', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2106', '2099', '山东', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2107', '2099', '江西', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2108', '2099', '宿迁', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2109', '2099', '成都', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2110', '2099', '内蒙古', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2111', '2099', '广西', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2112', '12', '茗茶', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2113', '2112', '铁观音', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2114', '2112', '普洱', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2115', '2112', '龙井', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2116', '2112', '绿茶', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2117', '2112', '红茶', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2118', '2112', '乌龙茶', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2119', '2112', '茉莉花茶', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2120', '2112', '花草茶', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2121', '2112', '花果茶', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2122', '2112', '黑茶', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2123', '2112', '白茶', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2124', '2112', '养生茶', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2125', '2112', '其他茶', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2126', '12', '饮料冲调', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2127', '2126', '饮料', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2128', '2126', '牛奶酸奶', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2129', '2126', '饮用水', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2130', '2126', '咖啡/奶茶', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2131', '2126', '蜂蜜/蜂产品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2132', '2126', '冲饮谷物', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2133', '2126', '成人奶粉', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2134', '12', '粮油调味', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2135', '2134', '大米', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2136', '2134', '食用油', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2137', '2134', '面', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2138', '2134', '杂粮', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2139', '2134', '调味品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2140', '2134', '南北干货', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2141', '2134', '方便食品', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2142', '2134', '烘焙原料', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2143', '2134', '有机食品', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2144', '13', '艺术品', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2145', '2144', '油画', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2146', '2144', '版画', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2147', '2144', '水墨画', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2148', '2144', '书法', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2149', '2144', '雕塑', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2150', '2144', '艺术画册', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2151', '2144', '艺术衍生品', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2152', '13', '火机烟具', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2153', '2152', '电子烟', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2154', '2152', '烟油', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2155', '2152', '打火机', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2156', '2152', '烟嘴', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2157', '2152', '烟盒', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2158', '2152', '烟斗', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2159', '13', '礼品', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2160', '2159', '创意礼品', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2161', '2159', '电子礼品', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2162', '2159', '工艺礼品', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2163', '2159', '美妆礼品', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2164', '2159', '婚庆节庆', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2165', '2159', '礼盒礼券', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2166', '2159', '礼品定制', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2167', '2159', '军刀军具', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2168', '2159', '古董文玩', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2169', '2159', '收藏品', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2170', '2159', '礼品文具', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2171', '2159', '熏香', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2172', '2159', '京东卡', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2173', '13', '鲜花速递', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2174', '2173', '鲜花', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2175', '2173', '每周一花', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2176', '2173', '永生花', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2177', '2173', '香皂花', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2178', '2173', '卡通花束', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2179', '2173', '干花', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2180', '13', '绿植园艺', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2181', '2180', '桌面绿植', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2182', '2180', '苗木', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2183', '2180', '绿植盆栽', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2184', '2180', '多肉植物', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2185', '2180', '花卉', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2186', '2180', '种子种球', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2187', '2180', '花盆花器', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2188', '2180', '园艺土肥', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2189', '2180', '园艺工具', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2190', '2180', '园林机械', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2191', '13', '种子', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2192', '2191', '花草林木类', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2193', '2191', '蔬菜/菌类', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2194', '2191', '瓜果类', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2195', '2191', '大田作物类', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2196', '13', '农药', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2197', '2196', '杀虫剂', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2198', '2196', '杀菌剂', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2199', '2196', '除草剂', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2200', '2196', '植物生长调节剂', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2201', '13', '肥料', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2202', '2201', '氮/磷/钾肥', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2203', '2201', '复合肥', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2204', '2201', '生物菌肥', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2205', '2201', '水溶/叶面肥', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2206', '2201', '有机肥', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2207', '13', '畜牧养殖', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2208', '2207', '中兽药', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2209', '2207', '西兽药', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2210', '2207', '兽医器具', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2211', '2207', '生产/运输器具', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2212', '2207', '预混料', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2213', '2207', '浓缩料', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2214', '2207', '饲料添加剂', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2215', '2207', '全价料', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2216', '2207', '赶猪器/注射器', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2217', '2207', '养殖场专用', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2218', '13', '农机农具', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2219', '2218', '微耕机', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2220', '2218', '喷雾器', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2221', '2218', '割草机', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2222', '2218', '农机整机', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2223', '2218', '农机配件', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2224', '2218', '小型农机具', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2225', '2218', '农膜', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2226', '2218', '农技服务', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2227', '14', '中西药品', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2228', '2227', '感冒咳嗽', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2229', '2227', '补肾壮阳', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2230', '2227', '补气养血', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2231', '2227', '止痛镇痛', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2232', '2227', '耳鼻喉用药', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2233', '2227', '眼科用药', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2234', '2227', '口腔用药', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2235', '2227', '皮肤用药', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2236', '2227', '肠胃消化', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2237', '2227', '风湿骨外伤', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2238', '2227', '维生素/钙', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2239', '2227', '男科/泌尿', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2240', '2227', '妇科用药', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2241', '2227', '儿科用药', '13', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2242', '2227', '心脑血管', '14', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2243', '2227', '避孕药', '15', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2244', '2227', '肝胆用药', '16', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2245', '14', '营养健康', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2246', '2245', '增强免疫', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2247', '2245', '骨骼健康', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2248', '2245', '补肾强身', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2249', '2245', '肠胃养护', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2250', '2245', '调节三高', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2251', '2245', '缓解疲劳', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2252', '2245', '养肝护肝', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2253', '2245', '改善贫血', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2254', '2245', '清咽利喉', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2255', '2245', '美容养颜', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2256', '2245', '减肥塑身', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2257', '2245', '改善睡眠', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2258', '2245', '明目益智', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2259', '14', '营养成分', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2260', '2259', '维生素/矿物质', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2261', '2259', '胶原蛋白', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2262', '2259', '益生菌', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2263', '2259', '蛋白粉', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2264', '2259', '玛咖', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2265', '2259', '酵素', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2266', '2259', '膳食纤维', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2267', '2259', '叶酸', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2268', '2259', '番茄红素', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2269', '2259', '左旋肉碱', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2270', '14', '滋补养生', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2271', '2270', '阿胶', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2272', '2270', '蜂蜜/蜂产品', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2273', '2270', '枸杞', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2274', '2270', '燕窝', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2275', '2270', '冬虫夏草', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2276', '2270', '人参/西洋参', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2277', '2270', '三七', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2278', '2270', '鹿茸', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2279', '2270', '雪蛤', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2280', '2270', '青钱柳', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2281', '2270', '石斛/枫斗', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2282', '2270', '灵芝/孢子粉', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2283', '2270', '当归', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2284', '2270', '养生茶饮', '13', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2285', '2270', '药食同源', '14', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2286', '14', '计生情趣', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2287', '2286', '避孕套', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2288', '2286', '排卵验孕', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2289', '2286', '润滑液', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2290', '2286', '男用延时', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2291', '2286', '飞机杯', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2292', '2286', '倒模', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2293', '2286', '仿真娃娃', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2294', '2286', '震动棒', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2295', '2286', '跳蛋', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2296', '2286', '仿真阳具', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2297', '2286', '情趣内衣', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2298', '14', '保健器械', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2299', '2298', '血压计', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2300', '2298', '血糖仪', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2301', '2298', '心电仪', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2302', '2298', '体温计', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2303', '2298', '胎心仪', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2304', '2298', '制氧机', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2305', '2298', '呼吸机', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2306', '2298', '雾化器', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2307', '2298', '助听器', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2308', '2298', '轮椅', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2309', '2298', '拐杖', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2310', '2298', '护理床', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2311', '2298', '中医保健', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2312', '2298', '养生器械', '13', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2313', '2298', '理疗仪', '14', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2314', '2298', '家庭护理', '15', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2315', '2298', '智能健康', '16', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2316', '2298', '出行常备', '17', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2317', '14', '护理护具', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2318', '2317', '口罩', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2319', '2317', '眼罩/耳塞', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2320', '2317', '跌打损伤', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2321', '2317', '创可贴', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2322', '2317', '暖贴', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2323', '2317', '鼻喉护理', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2324', '2317', '眼部保健', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2325', '2317', '美体护理', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2326', '14', '隐形眼镜', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2327', '2326', '彩色隐形', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2328', '2326', '透明隐形', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2329', '2326', '日抛', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2330', '2326', '月抛', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2331', '2326', '半年抛', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2332', '2326', '双周抛', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2333', '2326', '护理液', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2334', '2326', '润眼液', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2335', '2326', '大直径', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2336', '2326', '欧美混血', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2337', '2326', '眼镜配件', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2338', '14', '健康服务', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2339', '2338', '体检套餐', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2340', '2338', '口腔齿科', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2341', '2338', '基因检测', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2342', '2338', '孕产服务', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2343', '2338', '美容塑型', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2344', '2338', '老年体检', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2345', '15', '文学', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2346', '2345', '小说', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2347', '2345', '散文随笔', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2348', '2345', '青春文学', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2349', '2345', '传记', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2350', '2345', '动漫', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2351', '2345', '悬疑推理', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2352', '2345', '科幻', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2353', '2345', '武侠', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2354', '2345', '世界名著', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2355', '15', '童书', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2356', '2355', '0-2岁', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2357', '2355', '3-6岁', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2358', '2355', '7-10岁', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2359', '2355', '11-14岁', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2360', '2355', '儿童文学', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2361', '2355', '绘本', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2362', '2355', '科普百科', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2363', '2355', '幼儿启蒙', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2364', '2355', '智力开发', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2365', '2355', '少儿英语', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2366', '2355', '玩具书', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2367', '15', '教材教辅', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2368', '2367', '教材', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2369', '2367', '中小学教辅', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2370', '2367', '考试', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2371', '2367', '外语学习', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2372', '2367', '字典词典', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2373', '2367', '课外读物', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2374', '2367', '英语四六级', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2375', '2367', '会计类考试', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2376', '2367', '国家公务员', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2377', '15', '人文社科', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2378', '2377', '历史', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2379', '2377', '心理学', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2380', '2377', '政治军事', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2381', '2377', '传统文化', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2382', '2377', '哲学宗教', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2383', '2377', '社会科学', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2384', '2377', '法律', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2385', '2377', '文化', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2386', '2377', '党政专区', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2387', '15', '经管励志', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2388', '2387', '管理', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2389', '2387', '金融', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2390', '2387', '经济', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2391', '2387', '市场营销', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2392', '2387', '领导力', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2393', '2387', '股票', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2394', '2387', '投资', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2395', '2387', '励志与成功', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2396', '2387', '自我完善', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2397', '15', '艺术', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2398', '2397', '绘画', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2399', '2397', '摄影', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2400', '2397', '音乐', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2401', '2397', '书法', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2402', '2397', '连环画', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2403', '2397', '设计', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2404', '2397', '建筑艺术', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2405', '2397', '艺术史', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2406', '2397', '影视', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2407', '15', '科学技术', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2408', '2407', '计算机与互联网', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2409', '2407', '科普', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2410', '2407', '建筑', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2411', '2407', '工业技术', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2412', '2407', '电子通信', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2413', '2407', '医学', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2414', '2407', '科学与自然', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2415', '2407', '农林', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2416', '15', '生活', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2417', '2416', '育儿家教', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2418', '2416', '孕产胎教', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2419', '2416', '健身保健', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2420', '2416', '旅游地图', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2421', '2416', '手工DIY', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2422', '2416', '烹饪美食', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2423', '15', '', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2424', '2423', '杂志/期刊', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2425', '2423', '英文原版书', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2426', '2423', '港台图书', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2427', '15', '文娱音像', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2428', '2427', '音乐', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2429', '2427', '影视', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2430', '2427', '教育音像', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2431', '2427', '游戏', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2432', '2427', '影视/动漫周边', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2433', '15', '教育培训', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2434', '2433', '中小学教育', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2435', '2433', '素质培养', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2436', '2433', '出国留学', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2437', '2433', '语言培训', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2438', '2433', '学历教育', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2439', '2433', '职业培训', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2440', '15', '电子书', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2441', '2440', '小说', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2442', '2440', '文学', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2443', '2440', '励志与成功', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2444', '2440', '经济管理', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2445', '2440', '传记', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2446', '2440', '社会科学', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2447', '2440', '计算机与互联网', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2448', '2440', '进口原版', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2449', '15', '邮币', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2450', '2449', '邮票', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2451', '2449', '钱币', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2452', '2449', '邮资封片', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2453', '2449', '磁卡', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2454', '2449', '票证', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2455', '2449', '礼品册', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2456', '16', '交通出行', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2457', '2456', '国内机票', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2458', '2456', '国际机票', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2459', '2456', '火车票', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2460', '2456', '机场服务', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2461', '2456', '机票套餐', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2462', '16', '酒店预订', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2463', '2462', '国内酒店', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2464', '2462', '国际酒店', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2465', '2462', '酒店套餐', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2466', '2462', '超值精选', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2467', '16', '旅游度假', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2468', '2467', '国内旅游', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2469', '2467', '出境旅游', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2470', '2467', '全球签证', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2471', '2467', '景点门票', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2472', '2467', '邮轮', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2473', '2467', '旅行保险', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2474', '16', '商旅服务', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2475', '2474', '企业差旅', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2476', '2474', '团队建设', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2477', '2474', '奖励旅游', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2478', '2474', '会议周边', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2479', '2474', '会议展览', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2480', '16', '演出票务', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2481', '2480', '电影选座', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2482', '2480', '演唱会', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2483', '2480', '音乐会', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2484', '2480', '话剧歌剧', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2485', '2480', '体育赛事', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2486', '2480', '舞蹈芭蕾', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2487', '2480', '戏曲综艺', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2488', '16', '生活缴费', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2489', '2488', '水费', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2490', '2488', '电费', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2491', '2488', '燃气费', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2492', '2488', '城市通', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2493', '2488', '油卡充值', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2494', '2488', '加油卡', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2495', '16', '生活服务', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2496', '2495', '家政保洁', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2497', '2495', '摄影写真', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2498', '2495', '丽人/养生', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2499', '2495', '代理代办', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2500', '16', '彩票', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2501', '2500', '数据图表', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2502', '2500', '彩民服务', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2503', '16', '游戏', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2504', '2503', 'QQ充值', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2505', '2503', '游戏点卡', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2506', '2503', '网页游戏', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2507', '2503', '游戏周边', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2508', '2503', '手机游戏', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2509', '2503', '单机游戏', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2510', '16', '', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2511', '2510', '海外房产', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2512', '2510', '海外购物', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2513', '17', '理财', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2514', '2513', '京东小金库', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2515', '2513', '基金理财', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2516', '2513', '定期理财', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2517', '17', '众筹', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2518', '2517', '智能硬件', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2519', '2517', '流行文化', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2520', '2517', '生活美学', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2521', '2517', '公益', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2522', '2517', '其他权益众筹', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2523', '17', '东家', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2524', '2523', '类固收', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2525', '2523', '私募股权', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2526', '2523', '阳光私募', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2527', '2523', '投资策略', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2528', '17', '白条', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2529', '2528', '京东白条', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2530', '2528', '白条联名卡', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2531', '2528', '京东钢镚', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2532', '2528', '旅游白条', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2533', '2528', '安居白条', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2534', '2528', '校园金融', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2535', '2528', '京东金采', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2536', '17', '支付', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2537', '2536', '京东支付', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2538', '17', '保险', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2539', '2538', '健康险', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2540', '2538', '人寿险', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2541', '2538', '意外险', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2542', '2538', '旅行险', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2543', '2538', '财产险', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2544', '2538', '车险', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2545', '17', '股票', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2546', '2545', '实时资讯', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2547', '2545', '市场行情', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2548', '2545', '投资达人', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2549', '2545', '量化平台', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2550', '18', '家电安装', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2551', '2550', '空调安装', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2552', '2550', '电视安装', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2553', '2550', '洗衣机安装', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2554', '2550', '热水器安装', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2555', '2550', '烟机/灶具安装', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2556', '2550', '净水器安装', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2557', '18', '办公安装', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2558', '2557', '电脑安装', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2559', '2557', '办公设备安装', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2560', '18', '家居安装', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2561', '2560', '家具安装', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2562', '2560', '灯具安装', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2563', '2560', '智能家居安装', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2564', '2560', '五金卫浴安装', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2565', '2560', '晾衣架安装', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2566', '18', '家电维修', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2567', '2566', '空调维修', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2568', '2566', '电视维修', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2569', '2566', '洗衣机维修', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2570', '2566', '冰箱维修', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2571', '2566', '热水器维修', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2572', '2566', '油烟机维修', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2573', '2566', '燃气灶维修', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2574', '18', '手机维修', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2575', '2574', '屏幕换新', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2576', '2574', '电池换新', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2577', '2574', '手机故障', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2578', '2574', '保障服务', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2579', '18', '办公维修', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2580', '2579', '笔记本维修', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2581', '2579', '平板维修', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2582', '18', '数码维修', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2583', '2582', '智能家居维修', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2584', '2582', '无人机维修', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2585', '2582', '智能设备维修', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2586', '18', '清洗保养', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2587', '2586', '家电清洗', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2588', '2586', '家居家纺洗护', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2589', '2586', '服装洗护', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2590', '2586', '鞋靴箱包保养', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2591', '18', '特色服务', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2592', '2591', '家庭优惠套装', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2593', '2591', '企悦服务', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2594', '2591', '体育服务', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2595', '2591', '骑行服务', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2596', '2591', '钟表维修/保养', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2597', '19', '工具', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2598', '2597', '手动工具', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2599', '2597', '电动工具', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2600', '2597', '测量工具', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2601', '2597', '气动工具', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2602', '2597', '工具套装', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2603', '2597', '工具配件', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2604', '19', '劳动防护', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2605', '2604', '手部防护', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2606', '2604', '足部防护', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2607', '2604', '身体防护', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2608', '2604', '头部防护', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2609', '2604', '眼脸部防护', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2610', '2604', '呼吸防护', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2611', '2604', '坠落防护', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2612', '2604', '静电无尘', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2613', '19', '工控配电', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2614', '2613', '电线电缆', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2615', '2613', '开关插座', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2616', '2613', '低压配电', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2617', '2613', '控制保护', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2618', '2613', '电力检测', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2619', '2613', '工业控制', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2620', '2613', '自动化', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2621', '2613', '电料辅件', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2622', '19', '仪器仪表', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2623', '2622', '温度仪表', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2624', '2622', '电工仪表', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2625', '2622', '气体检测', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2626', '2622', '分析检测', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2627', '2622', '压力仪表', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2628', '2622', '流量仪表', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2629', '2622', '物位仪表', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2630', '2622', '阻容感及晶振', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2631', '2622', '半导体', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2632', '2622', '模块及开发板', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2633', '19', '清洁用品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2634', '2633', '清洁工具', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2635', '2633', '清洁设备', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2636', '2633', '清洗保养品', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2637', '2633', '工业擦拭', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2638', '2633', '地垫', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2639', '2633', '垃圾处理', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2640', '19', '化学品', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2641', '2640', '润滑剂', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2642', '2640', '胶粘剂', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2643', '2640', '化学试剂', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2644', '2640', '工业涂层', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2645', '2640', '清洗剂', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2646', '2640', '防锈剂', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2647', '2640', '脱模剂', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2648', '19', '安全消防', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2649', '2648', '警示标识', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2650', '2648', '应急处理', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2651', '2648', '监控设备', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2652', '2648', '安全锁具', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2653', '2648', '化学品存储', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2654', '2648', '消防器材', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2655', '2648', '消防服装', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2656', '19', '仓储包装', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2657', '2656', '包装工具', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2658', '2656', '包装耗材', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2659', '2656', '标签耗材', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2660', '2656', '搬运设备', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2661', '2656', '存储设备', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2662', '19', '焊接紧固', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2663', '2662', '五金紧固件', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2664', '2662', '密封件', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2665', '2662', '焊接设备', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2666', '2662', '焊接耗材', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2667', '19', '机械配件', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2668', '2667', '轴承', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2669', '2667', '皮带链条', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2670', '2667', '机械零配件', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2671', '2667', '机床及附件', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2672', '2667', '刀具', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2673', '2667', '气动元件', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2674', '2667', '泵阀类', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2675', '19', '暖通照明', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2676', '2675', '暖通', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2677', '2675', '工业照明', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2678', '2675', '管材管件', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2679', '19', '实验用品', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2680', '2679', '实验室试剂', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2681', '2679', '实验室耗材', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2682', '2679', '实验室设备', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2683', '2', '电视', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2684', '2683', '超薄电视', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2685', '2683', 'OLED电视', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2686', '2683', '曲面电视', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2687', '2683', '4K超清电视', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2688', '2683', '55英寸', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2689', '2683', '65英寸', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2690', '2683', '电视配件', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2691', '2', '空调', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2692', '2691', '壁挂式空调', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2693', '2691', '柜式空调', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2694', '2691', '中央空调', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2695', '2691', '一级能效空调', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2696', '2691', '变频空调', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2697', '2691', '1.5匹空调', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2698', '2691', '以旧换新', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2699', '2', '洗衣机', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2700', '2699', '滚筒洗衣机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2701', '2699', '洗烘一体机', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2702', '2699', '波轮洗衣机', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2703', '2699', '迷你洗衣机', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2704', '2699', '烘干机', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2705', '2699', '洗衣机配件', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2706', '2', '冰箱', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2707', '2706', '多门', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2708', '2706', '对开门', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2709', '2706', '三门', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2710', '2706', '双门', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2711', '2706', '冷柜/冰吧', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2712', '2706', '酒柜', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2713', '2706', '冰箱配件', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2714', '2', '厨卫大电', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2715', '2714', '油烟机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2716', '2714', '燃气灶', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2717', '2714', '烟灶套装', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2718', '2714', '集成灶', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2719', '2714', '消毒柜', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2720', '2714', '洗碗机', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2721', '2714', '电热水器', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2722', '2714', '燃气热水器', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2723', '2714', '嵌入式厨电', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2724', '2', '厨房小电', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2725', '2724', '破壁机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2726', '2724', '电烤箱', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2727', '2724', '电饭煲', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2728', '2724', '电压力锅', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2729', '2724', '电炖锅', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2730', '2724', '豆浆机', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2731', '2724', '料理机', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2732', '2724', '咖啡机', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2733', '2724', '电饼铛', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2734', '2724', '榨汁机/原汁机', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2735', '2724', '电水壶/热水瓶', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2736', '2724', '微波炉', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2737', '2724', '电火锅', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2738', '2724', '养生壶', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2739', '2724', '电磁炉', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2740', '2724', '面包机', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2741', '2724', '空气炸锅', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2742', '2724', '面条机', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2743', '2724', '电陶炉', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2744', '2724', '煮蛋器', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2745', '2724', '电烧烤炉', '20', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2746', '2', '生活电器', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2747', '2746', '空气净化器', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2748', '2746', '除湿机', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2749', '2746', '干衣机', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2750', '2746', '电风扇', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2751', '2746', '冷风扇', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2752', '2746', '吸尘器', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2753', '2746', '除螨仪', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2754', '2746', '扫地机器人', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2755', '2746', '蒸汽拖把/拖地机', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2756', '2746', '电话机', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2757', '2746', '饮水机', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2758', '2746', '净水器', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2759', '2746', '取暖电器', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2760', '2746', '挂烫机/熨斗', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2761', '2746', '加湿器', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2762', '2746', '毛球修剪器', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2763', '2746', '生活电器配件', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2764', '2', '个护健康', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2765', '2764', '剃须刀', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2766', '2764', '电动牙刷', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2767', '2764', '电吹风', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2768', '2764', '美容器', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2769', '2764', '洁面仪', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2770', '2764', '按摩器', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2771', '2764', '健康秤', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2772', '2764', '卷/直发器', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2773', '2764', '剃/脱毛器', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2774', '2764', '理发器', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2775', '2764', '足浴盆', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2776', '2764', '足疗机', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2777', '2764', '按摩椅', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2778', '2', '视听影音', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2779', '2778', '家庭影院', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2780', '2778', 'KTV音响', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2781', '2778', '迷你音响', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2782', '2778', 'DVD', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2783', '2778', '功放', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2784', '2778', '回音壁', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2785', '2778', '麦克风', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2786', '3', '手机通讯', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2787', '2786', '手机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2788', '2786', '游戏手机', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2789', '2786', '老人机', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2790', '2786', '对讲机', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2791', '2786', '以旧换新', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2792', '2786', '手机维修', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2793', '3', '运营商', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2794', '2793', '合约机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2795', '2793', '选号码', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2796', '2793', '固话宽带', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2797', '2793', '办套餐', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2798', '2793', '充话费/流量', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2799', '2793', '中国电信', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2800', '2793', '中国移动', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2801', '2793', '中国联通', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2802', '2793', '京东通信', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2803', '2793', '170选号', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2804', '2793', '上网卡', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2805', '3', '手机配件', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2806', '2805', '手机壳', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2807', '2805', '贴膜', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2808', '2805', '手机存储卡', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2809', '2805', '数据线', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2810', '2805', '充电器', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2811', '2805', '手机耳机', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2812', '2805', '创意配件', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2813', '2805', '手机饰品', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2814', '2805', '手机电池', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2815', '2805', '苹果周边', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2816', '2805', '移动电源', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2817', '2805', '蓝牙耳机', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2818', '2805', '手机支架', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2819', '2805', '车载配件', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2820', '2805', '拍照配件', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2821', '3', '摄影摄像', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2822', '2821', '数码相机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2823', '2821', '单电/微单相机', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2824', '2821', '单反相机', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2825', '2821', '拍立得', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2826', '2821', '运动相机', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2827', '2821', '摄像机', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2828', '2821', '镜头', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2829', '2821', '户外器材', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2830', '2821', '影棚器材', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2831', '2821', '冲印服务', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2832', '2821', '数码相框', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2833', '3', '数码配件', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2834', '2833', '存储卡', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2835', '2833', '三脚架/云台', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2836', '2833', '相机包', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2837', '2833', '滤镜', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2838', '2833', '闪光灯/手柄', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2839', '2833', '相机清洁/贴膜', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2840', '2833', '机身附件', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2841', '2833', '镜头附件', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2842', '2833', '读卡器', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2843', '2833', '支架', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2844', '2833', '电池/充电器', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2845', '3', '影音娱乐', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2846', '2845', '耳机/耳麦', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2847', '2845', '音箱/音响', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2848', '2845', '智能音箱', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2849', '2845', '便携/无线音箱', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2850', '2845', '收音机', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2851', '2845', '麦克风', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2852', '2845', 'MP3/MP4', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2853', '2845', '专业音频', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2854', '2845', '音频线', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2855', '3', '智能设备', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2856', '2855', '智能手环', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2857', '2855', '智能手表', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2858', '2855', '智能眼镜', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2859', '2855', '智能机器人', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2860', '2855', '运动跟踪器', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2861', '2855', '健康监测', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2862', '2855', '智能配饰', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2863', '2855', '智能家居', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2864', '2855', '体感车', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2865', '2855', '无人机', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2866', '3', '电子教育', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2867', '2866', '学生平板', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2868', '2866', '点读机/笔', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2869', '2866', '早教益智', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2870', '2866', '录音笔', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2871', '2866', '电纸书', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2872', '2866', '电子词典', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2873', '2866', '复读机', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2874', '2866', '翻译机', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2875', '4', '电脑整机', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2876', '2875', '笔记本', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2877', '2875', '游戏本', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2878', '2875', '平板电脑', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2879', '2875', '平板电脑配件', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2880', '2875', '台式机', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2881', '2875', '一体机', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2882', '2875', '服务器/工作站', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2883', '2875', '笔记本配件', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2884', '4', '电脑配件', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2885', '2884', '显示器', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2886', '2884', 'CPU', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2887', '2884', '主板', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2888', '2884', '显卡', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2889', '2884', '硬盘', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2890', '2884', '内存', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2891', '2884', '机箱', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2892', '2884', '电源', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2893', '2884', '散热器', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2894', '2884', '显示器支架', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2895', '2884', '刻录机/光驱', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2896', '2884', '声卡/扩展卡', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2897', '2884', '装机配件', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2898', '2884', 'SSD固态硬盘', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2899', '2884', '组装电脑', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2900', '2884', 'HUB/集线器', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2901', '4', '外设产品', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2902', '2901', '鼠标', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2903', '2901', '键盘', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2904', '2901', '键鼠套装', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2905', '2901', '网络仪表仪器', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2906', '2901', 'U盘', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2907', '2901', '移动硬盘', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2908', '2901', '鼠标垫', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2909', '2901', '摄像头', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2910', '2901', '线缆', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2911', '2901', '手写板', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2912', '2901', '硬盘盒', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2913', '2901', '电脑工具', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2914', '2901', '电脑清洁', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2915', '2901', 'UPS电源', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2916', '2901', '插座', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2917', '4', '游戏设备', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2918', '2917', '游戏机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2919', '2917', '游戏耳机', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2920', '2917', '手柄/方向盘', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2921', '2917', '游戏软件', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2922', '2917', '游戏周边', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2923', '4', '网络产品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2924', '2923', '路由器', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2925', '2923', '网络机顶盒', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2926', '2923', '交换机', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2927', '2923', '网络存储', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2928', '2923', '网卡', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2929', '2923', '4G/3G上网', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2930', '2923', '网线', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2931', '2923', '网络配件', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2932', '4', '办公设备', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2933', '2932', '投影机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2934', '2932', '投影配件', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2935', '2932', '多功能一体机', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2936', '2932', '打印机', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2937', '2932', '传真设备', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2938', '2932', '验钞/点钞机', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2939', '2932', '扫描设备', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2940', '2932', '复合机', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2941', '2932', '碎纸机', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2942', '2932', '考勤门禁', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2943', '2932', '收银机', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2944', '2932', '会议音频视频', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2945', '2932', '保险柜', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2946', '2932', '装订/封装机', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2947', '2932', '安防监控', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2948', '2932', '办公家具', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2949', '2932', '白板', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2950', '4', '文具', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2951', '2950', '笔类', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2952', '2950', '本册/便签', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2953', '2950', '办公文具', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2954', '2950', '文件收纳', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2955', '2950', '学生文具', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2956', '2950', '计算器', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2957', '2950', '画具画材', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2958', '2950', '财会用品', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2959', '4', '耗材', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2960', '2959', '硒鼓/墨粉', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2961', '2959', '墨盒', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2962', '2959', '色带', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2963', '2959', '纸类', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2964', '2959', '刻录光盘', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2965', '4', '服务产品', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2966', '2965', '延保服务', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2967', '2965', '上门安装', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2968', '2965', '维修保养', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2969', '2965', '电脑软件', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2970', '5', '厨具', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2971', '2970', '水具酒具', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2972', '2970', '烹饪锅具', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2973', '2970', '炒锅', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2974', '2970', '餐具', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2975', '2970', '厨房配件', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2976', '2970', '刀剪菜板', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2977', '2970', '锅具套装', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2978', '2970', '茶具', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2979', '2970', '咖啡具', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2980', '2970', '保温杯', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2981', '2970', '保鲜盒', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2982', '5', '家纺', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2983', '2982', '四件套', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2984', '2982', '被子', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2985', '2982', '枕芯', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2986', '2982', '毛巾浴巾', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2987', '2982', '电热毯', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2988', '2982', '地毯地垫', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2989', '2982', '床垫/床褥', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2990', '2982', '毯子', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2991', '2982', '抱枕靠垫', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2992', '2982', '窗帘/窗纱', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2993', '2982', '床单/床笠', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2994', '2982', '被套', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2995', '2982', '枕巾枕套', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2996', '2982', '沙发垫套/椅垫', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2997', '2982', '桌布/罩件', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2998', '2982', '羽绒被', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('2999', '2982', '蚕丝被', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3000', '2982', '乳胶枕', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3001', '5', '生活日用', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3002', '3001', '收纳用品', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3003', '3001', '雨伞雨具', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3004', '3001', '净化除味', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3005', '3001', '浴室用品', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3006', '3001', '洗晒/熨烫', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3007', '3001', '缝纫/针织用品', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3008', '3001', '保暖防护', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3009', '3001', '清洁工具', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3010', '5', '家装软饰', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3011', '3010', '装饰字画', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3012', '3010', '装饰摆件', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3013', '3010', '手工/十字绣', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3014', '3010', '相框/照片墙', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3015', '3010', '墙贴/装饰贴', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3016', '3010', '花瓶花艺', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3017', '3010', '香薰蜡烛', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3018', '3010', '节庆饰品', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3019', '3010', '钟饰', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3020', '3010', '帘艺隔断', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3021', '3010', '创意家居', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3022', '3010', '3D立体墙贴', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3023', '3010', '玻璃贴纸', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3024', '3010', '电视背景墙', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3025', '3010', '电表箱装饰画', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3026', '5', '灯具', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3027', '3026', '吸顶灯', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3028', '3026', '吊灯', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3029', '3026', '台灯', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3030', '3026', '筒灯射灯', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3031', '3026', '庭院灯', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3032', '3026', '装饰灯', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3033', '3026', 'LED灯', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3034', '3026', '氛围照明', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3035', '3026', '落地灯', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3036', '3026', '应急灯/手电', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3037', '3026', '节能灯', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3038', '5', '家具', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3039', '3038', '客厅', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3040', '3038', '卧室', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3041', '3038', '餐厅', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3042', '3038', '书房', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3043', '3038', '儿童', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3044', '3038', '储物', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3045', '3038', '商业办公', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3046', '3038', '阳台户外', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3047', '3038', '电脑桌', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3048', '3038', '电视柜', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3049', '3038', '茶几', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3050', '3038', '办公柜', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3051', '3038', '进口/原创', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3052', '3038', '沙发', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3053', '3038', '床', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3054', '3038', '床垫', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3055', '3038', '餐桌', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3056', '3038', '衣柜', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3057', '3038', '书架', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3058', '3038', '鞋柜', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3059', '3038', '置物架', '20', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3060', '3038', '电脑椅', '21', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3061', '3038', '晾衣架', '22', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3062', '3038', '红木', '23', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3063', '5', '全屋定制', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3064', '3063', '定制衣柜', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3065', '3063', '榻榻米', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3066', '3063', '橱柜', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3067', '3063', '门', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3068', '3063', '室内门', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3069', '3063', '防盗门', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3070', '3063', '窗', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3071', '3063', '淋浴房', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3072', '3063', '壁挂炉', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3073', '3063', '散热器', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3074', '5', '建筑材料', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3075', '3074', '油漆涂料', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3076', '3074', '涂刷辅料', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3077', '3074', '瓷砖', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3078', '3074', '地板', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3079', '3074', '壁纸', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3080', '3074', '强化地板', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3081', '3074', '美缝剂', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3082', '3074', '防水涂料', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3083', '3074', '管材管件', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3084', '3074', '木材/板材', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3085', '5', '厨房卫浴', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3086', '3085', '水槽', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3087', '3085', '龙头', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3088', '3085', '淋浴花洒', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3089', '3085', '马桶', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3090', '3085', '智能马桶', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3091', '3085', '智能马桶盖', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3092', '3085', '厨卫挂件', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3093', '3085', '浴室柜', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3094', '3085', '浴霸', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3095', '3085', '集成吊顶', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3096', '3085', '垃圾处理器', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3097', '5', '五金电工', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3098', '3097', '指纹锁', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3099', '3097', '电动工具', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3100', '3097', '手动工具', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3101', '3097', '测量工具', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3102', '3097', '工具箱', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3103', '3097', '劳防用品', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3104', '3097', '开关插座', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3105', '3097', '配电箱/断路器', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3106', '3097', '机械锁', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3107', '3097', '拉手', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3108', '5', '装修设计', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3109', '3108', '全包装修', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3110', '3108', '半包装修', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3111', '3108', '家装设计', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3112', '3108', '高端设计', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3113', '3108', '局部装修', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3114', '3108', '安装服务', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3115', '3108', '装修公司', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3116', '3108', '旧房翻新', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3117', '6', '女装', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3118', '3117', '当季热卖', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3119', '3117', '新品推荐', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3120', '3117', '商场同款', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3121', '3117', '时尚套装', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3122', '3117', '连衣裙', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3123', '3117', '套装裙', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3124', '3117', '半身裙', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3125', '3117', 'T恤', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3126', '3117', '衬衫', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3127', '3117', '雪纺衫', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3128', '3117', '短外套', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3129', '3117', '卫衣', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3130', '3117', '针织衫', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3131', '3117', '小西装', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3132', '3117', '风衣', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3133', '3117', '休闲裤', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3134', '3117', '牛仔裤', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3135', '3117', '短裤', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3136', '3117', '打底裤', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3137', '3117', '正装裤', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3138', '3117', '打底衫', '20', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3139', '3117', '毛衣', '21', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3140', '3117', '马甲', '22', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3141', '3117', '吊带/背心', '23', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3142', '3117', '毛呢大衣', '24', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3143', '3117', '羽绒服', '25', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3144', '3117', '仿皮皮衣', '26', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3145', '3117', '真皮皮衣', '27', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3146', '3117', '羊绒衫', '28', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3147', '3117', '棉服', '29', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3148', '3117', '皮草', '30', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3149', '3117', '加绒裤', '31', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3150', '3117', '中老年女装', '32', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3151', '3117', '大码女装', '33', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3152', '3117', '旗袍/唐装', '34', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3153', '3117', '礼服', '35', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3154', '3117', '婚纱', '36', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3155', '3117', '设计师/潮牌', '37', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3156', '6', '男装', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3157', '3156', '当季热卖', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3158', '3156', '新品推荐', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3159', '3156', 'T恤', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3160', '3156', '牛仔裤', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3161', '3156', '休闲裤', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3162', '3156', '衬衫', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3163', '3156', '短裤', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3164', '3156', 'POLO衫', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3165', '3156', '羽绒服', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3166', '3156', '棉服', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3167', '3156', '真皮皮衣', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3168', '3156', '夹克', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3169', '3156', '卫衣', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3170', '3156', '毛呢大衣', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3171', '3156', '大码男装', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3172', '3156', '西服套装', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3173', '3156', '仿皮皮衣', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3174', '3156', '风衣', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3175', '3156', '针织衫', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3176', '3156', '马甲/背心', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3177', '3156', '羊毛衫', '20', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3178', '3156', '羊绒衫', '21', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3179', '3156', '西服', '22', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3180', '3156', '西裤', '23', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3181', '3156', '卫裤/运动裤', '24', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3182', '3156', '工装', '25', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3183', '3156', '设计师/潮牌', '26', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3184', '3156', '唐装/中山装', '27', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3185', '3156', '中老年男装', '28', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3186', '3156', '加绒裤', '29', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3187', '6', '内衣', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3188', '3187', '文胸', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3189', '3187', '睡衣/家居服', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3190', '3187', '男士内裤', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3191', '3187', '女士内裤', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3192', '3187', '吊带/背心', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3193', '3187', '文胸套装', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3194', '3187', '情侣睡衣', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3195', '3187', '塑身美体', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3196', '3187', '少女文胸', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3197', '3187', '休闲棉袜', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3198', '3187', '商务男袜', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3199', '3187', '连裤袜/丝袜', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3200', '3187', '美腿袜', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3201', '3187', '打底裤袜', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3202', '3187', '抹胸', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3203', '3187', '内衣配件', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3204', '3187', '大码内衣', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3205', '3187', '打底衫', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3206', '3187', '泳衣', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3207', '3187', '秋衣秋裤', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3208', '3187', '保暖内衣', '20', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3209', '6', '配饰', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3210', '3209', '太阳镜', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3211', '3209', '光学镜架/镜片', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3212', '3209', '棒球帽', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3213', '3209', '遮阳帽', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3214', '3209', '防辐射眼镜', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3215', '3209', '女士围巾/披肩', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3216', '3209', '遮阳伞/雨伞', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3217', '3209', '老花镜', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3218', '3209', '鸭舌帽', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3219', '3209', '礼帽', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3220', '3209', '男士丝巾/围巾', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3221', '3209', '毛线帽', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3222', '3209', '贝雷帽', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3223', '3209', '真皮手套', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3224', '3209', '毛线手套', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3225', '3209', '围巾/手套/帽子套装', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3226', '3209', '口罩', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3227', '3209', '耳罩/耳包', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3228', '3209', '毛线/布面料', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3229', '3209', '钥匙扣', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3230', '3209', '袖扣', '20', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3231', '3209', '领带/领结/领带夹', '21', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3232', '3209', '游泳镜', '22', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3233', '3209', '男士腰带/礼盒', '23', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3234', '3209', '女士腰带/礼盒', '24', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3235', '6', '童装', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3236', '3235', '套装', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3237', '3235', '卫衣', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3238', '3235', '裤子', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3239', '3235', '外套/大衣', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3240', '3235', '毛衣/针织衫', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3241', '3235', '衬衫', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3242', '3235', '户外/运动服', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3243', '3235', 'T恤', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3244', '3235', '裙子', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3245', '3235', '亲子装', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3246', '3235', '礼服/演出服', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3247', '3235', '羽绒服', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3248', '3235', '棉服', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3249', '3235', '内衣裤', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3250', '3235', '配饰', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3251', '3235', '家居服', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3252', '3235', '马甲', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3253', '3235', '袜子', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3254', '3235', '民族服装', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3255', '3235', '婴儿礼盒', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3256', '3235', '连体衣/爬服', '20', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3257', '6', '童鞋', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3258', '3257', '运动鞋', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3259', '3257', '靴子', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3260', '3257', '帆布鞋', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3261', '3257', '皮鞋', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3262', '3257', '棉鞋', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3263', '3257', '凉鞋', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3264', '3257', '拖鞋', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3265', '7', '时尚女鞋', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3266', '3265', '新品推荐', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3267', '3265', '单鞋', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3268', '3265', '休闲鞋', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3269', '3265', '帆布鞋', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3270', '3265', '妈妈鞋', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3271', '3265', '布鞋/绣花鞋', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3272', '3265', '女靴', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3273', '3265', '踝靴', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3274', '3265', '马丁靴', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3275', '3265', '雪地靴', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3276', '3265', '雨鞋/雨靴', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3277', '3265', '高跟鞋', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3278', '3265', '凉鞋', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3279', '3265', '拖鞋/人字拖', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3280', '3265', '鱼嘴鞋', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3281', '3265', '内增高', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3282', '3265', '坡跟鞋', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3283', '3265', '防水台', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3284', '3265', '松糕鞋', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3285', '3265', '鞋配件', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3286', '7', '潮流女包', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3287', '3286', '真皮包', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3288', '3286', '单肩包', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3289', '3286', '手提包', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3290', '3286', '斜挎包', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3291', '3286', '双肩包', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3292', '3286', '钱包', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3293', '3286', '手拿包', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3294', '3286', '卡包/零钱包', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3295', '3286', '钥匙包', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3296', '7', '精品男包', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3297', '3296', '男士钱包', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3298', '3296', '双肩包', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3299', '3296', '单肩/斜挎包', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3300', '3296', '商务公文包', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3301', '3296', '男士手包', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3302', '3296', '卡包名片夹', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3303', '3296', '钥匙包', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3304', '7', '功能箱包', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3305', '3304', '拉杆箱', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3306', '3304', '拉杆包', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3307', '3304', '旅行包', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3308', '3304', '电脑包', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3309', '3304', '休闲运动包', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3310', '3304', '书包', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3311', '3304', '登山包', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3312', '3304', '腰包/胸包', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3313', '3304', '旅行配件', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3314', '7', '奢侈品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3315', '3314', '箱包', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3316', '3314', '钱包', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3317', '3314', '服饰', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3318', '3314', '腰带', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3319', '3314', '鞋靴', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3320', '3314', '太阳镜/眼镜框', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3321', '3314', '饰品', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3322', '3314', '配件', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3323', '7', '', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3324', '3323', 'GUCCI', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3325', '3323', 'COACH', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3326', '3323', '雷朋', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3327', '3323', '施华洛世奇', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3328', '3323', 'MK', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3329', '3323', '阿玛尼', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3330', '3323', '菲拉格慕', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3331', '3323', 'VERSACE', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3332', '3323', '普拉达', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3333', '3323', '巴宝莉', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3334', '3323', '万宝龙', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3335', '7', '钟表', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3336', '3335', '天梭', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3337', '3335', '浪琴', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3338', '3335', '欧米茄', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3339', '3335', '泰格豪雅', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3340', '3335', 'DW', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3341', '3335', '卡西欧', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3342', '3335', '西铁城', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3343', '3335', '天王', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3344', '3335', '瑞表', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3345', '3335', '国表', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3346', '3335', '日韩表', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3347', '3335', '欧美表', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3348', '3335', '德表', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3349', '3335', '儿童手表', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3350', '3335', '智能手表', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3351', '3335', '闹钟', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3352', '3335', '挂钟', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3353', '3335', '座钟', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3354', '3335', '钟表配件', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3355', '3335', '钟表维修', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3356', '7', '珠宝首饰', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3357', '3356', '黄金', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3358', '3356', 'K金', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3359', '3356', '时尚饰品', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3360', '3356', '钻石', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3361', '3356', '翡翠玉石', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3362', '3356', '银饰', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3363', '3356', '水晶玛瑙', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3364', '3356', '彩宝', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3365', '3356', '铂金', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3366', '3356', '木手串/把件', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3367', '3356', '珍珠', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3368', '3356', '发饰', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3369', '7', '金银投资', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3370', '3369', '投资金', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3371', '3369', '投资银', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3372', '3369', '投资收藏', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3373', '8', '时尚女鞋', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3374', '3373', '新品推荐', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3375', '3373', '单鞋', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3376', '3373', '休闲鞋', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3377', '3373', '帆布鞋', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3378', '3373', '妈妈鞋', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3379', '3373', '布鞋/绣花鞋', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3380', '3373', '女靴', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3381', '3373', '踝靴', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3382', '3373', '马丁靴', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3383', '3373', '雪地靴', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3384', '3373', '雨鞋/雨靴', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3385', '3373', '高跟鞋', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3386', '3373', '凉鞋', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3387', '3373', '拖鞋/人字拖', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3388', '3373', '鱼嘴鞋', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3389', '3373', '内增高', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3390', '3373', '坡跟鞋', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3391', '3373', '防水台', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3392', '3373', '松糕鞋', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3393', '3373', '鞋配件', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3394', '8', '潮流女包', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3395', '3394', '真皮包', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3396', '3394', '单肩包', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3397', '3394', '手提包', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3398', '3394', '斜挎包', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3399', '3394', '双肩包', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3400', '3394', '钱包', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3401', '3394', '手拿包', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3402', '3394', '卡包/零钱包', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3403', '3394', '钥匙包', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3404', '8', '精品男包', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3405', '3404', '男士钱包', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3406', '3404', '双肩包', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3407', '3404', '单肩/斜挎包', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3408', '3404', '商务公文包', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3409', '3404', '男士手包', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3410', '3404', '卡包名片夹', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3411', '3404', '钥匙包', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3412', '8', '功能箱包', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3413', '3412', '拉杆箱', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3414', '3412', '拉杆包', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3415', '3412', '旅行包', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3416', '3412', '电脑包', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3417', '3412', '休闲运动包', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3418', '3412', '书包', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3419', '3412', '登山包', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3420', '3412', '腰包/胸包', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3421', '3412', '旅行配件', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3422', '8', '奢侈品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3423', '3422', '箱包', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3424', '3422', '钱包', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3425', '3422', '服饰', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3426', '3422', '腰带', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3427', '3422', '鞋靴', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3428', '3422', '太阳镜/眼镜框', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3429', '3422', '饰品', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3430', '3422', '配件', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3431', '8', '', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3432', '3431', 'GUCCI', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3433', '3431', 'COACH', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3434', '3431', '雷朋', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3435', '3431', '施华洛世奇', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3436', '3431', 'MK', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3437', '3431', '阿玛尼', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3438', '3431', '菲拉格慕', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3439', '3431', 'VERSACE', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3440', '3431', '普拉达', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3441', '3431', '巴宝莉', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3442', '3431', '万宝龙', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3443', '8', '钟表', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3444', '3443', '天梭', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3445', '3443', '浪琴', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3446', '3443', '欧米茄', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3447', '3443', '泰格豪雅', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3448', '3443', 'DW', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3449', '3443', '卡西欧', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3450', '3443', '西铁城', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3451', '3443', '天王', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3452', '3443', '瑞表', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3453', '3443', '国表', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3454', '3443', '日韩表', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3455', '3443', '欧美表', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3456', '3443', '德表', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3457', '3443', '儿童手表', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3458', '3443', '智能手表', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3459', '3443', '闹钟', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3460', '3443', '挂钟', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3461', '3443', '座钟', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3462', '3443', '钟表配件', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3463', '3443', '钟表维修', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3464', '8', '珠宝首饰', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3465', '3464', '黄金', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3466', '3464', 'K金', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3467', '3464', '时尚饰品', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3468', '3464', '钻石', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3469', '3464', '翡翠玉石', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3470', '3464', '银饰', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3471', '3464', '水晶玛瑙', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3472', '3464', '彩宝', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3473', '3464', '铂金', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3474', '3464', '木手串/把件', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3475', '3464', '珍珠', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3476', '3464', '发饰', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3477', '8', '金银投资', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3478', '3477', '投资金', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3479', '3477', '投资银', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3480', '3477', '投资收藏', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3481', '9', '奶粉', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3482', '3481', '1段', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3483', '3481', '2段', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3484', '3481', '3段', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3485', '3481', '4段', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3486', '3481', '孕妈奶粉', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3487', '3481', '特殊配方奶粉', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3488', '3481', '有机奶粉', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3489', '9', '营养辅食', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3490', '3489', '米粉/菜粉', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3491', '3489', '面条/粥', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3492', '3489', '果泥/果汁', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3493', '3489', '益生菌/初乳', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3494', '3489', 'DHA', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3495', '3489', '钙铁锌/维生素', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3496', '3489', '清火/开胃', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3497', '3489', '宝宝零食', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3498', '9', '尿裤湿巾', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3499', '3498', 'NB', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3500', '3498', 'S', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3501', '3498', 'M', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3502', '3498', 'L', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3503', '3498', 'XL', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3504', '3498', 'XXL', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3505', '3498', '拉拉裤', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3506', '3498', '成人尿裤', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3507', '3498', '婴儿湿巾', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3508', '9', '喂养用品', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3509', '3508', '奶瓶奶嘴', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3510', '3508', '吸奶器', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3511', '3508', '暖奶消毒', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3512', '3508', '辅食料理机', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3513', '3508', '牙胶安抚', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3514', '3508', '食物存储', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3515', '3508', '儿童餐具', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3516', '3508', '水壶/水杯', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3517', '3508', '围兜/防溅衣', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3518', '9', '洗护用品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3519', '3518', '宝宝护肤', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3520', '3518', '日常护理', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3521', '3518', '洗发沐浴', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3522', '3518', '洗澡用具', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3523', '3518', '洗衣液/皂', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3524', '3518', '理发器', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3525', '3518', '婴儿口腔清洁', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3526', '3518', '座便器', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3527', '3518', '驱蚊防晒', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3528', '9', '寝居服饰', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3529', '3528', '睡袋/抱被', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3530', '3528', '婴儿枕', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3531', '3528', '毛毯棉被', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3532', '3528', '婴童床品', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3533', '3528', '浴巾/浴衣', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3534', '3528', '毛巾/口水巾', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3535', '3528', '婴儿礼盒', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3536', '3528', '婴儿内衣', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3537', '3528', '婴儿外出服', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3538', '3528', '隔尿垫巾', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3539', '3528', '尿布', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3540', '3528', '安全防护', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3541', '3528', '爬行垫', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3542', '3528', '婴儿鞋帽袜', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3543', '9', '妈妈专区', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3544', '3543', '防辐射服', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3545', '3543', '孕妈装', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3546', '3543', '孕妇护肤', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3547', '3543', '妈咪包/背婴带', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3548', '3543', '待产护理', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3549', '3543', '产后塑身', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3550', '3543', '文胸/内裤', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3551', '3543', '防溢乳垫', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3552', '3543', '孕期营养', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3553', '9', '童车童床', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3554', '3553', '安全座椅', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3555', '3553', '婴儿推车', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3556', '3553', '婴儿床', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3557', '3553', '婴儿床垫', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3558', '3553', '餐椅', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3559', '3553', '学步车', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3560', '3553', '三轮车', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3561', '3553', '自行车', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3562', '3553', '扭扭车', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3563', '3553', '滑板车', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3564', '3553', '电动车', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3565', '9', '玩具', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3566', '3565', '适用年龄', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3567', '3565', '遥控/电动', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3568', '3565', '益智玩具', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3569', '3565', '积木拼插', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3570', '3565', '动漫玩具', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3571', '3565', '毛绒布艺', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3572', '3565', '模型玩具', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3573', '3565', '健身玩具', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3574', '3565', '娃娃玩具', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3575', '3565', '绘画/DIY', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3576', '3565', '创意减压', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3577', '9', '乐器', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3578', '3577', '钢琴', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3579', '3577', '电钢琴', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3580', '3577', '电子琴', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3581', '3577', '吉他', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3582', '3577', '尤克里里', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3583', '3577', '打击乐器', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3584', '3577', '西洋管弦', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3585', '3577', '民族乐器', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3586', '3577', '乐器配件', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3587', '10', '房产', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3588', '3587', '最新开盘', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3589', '3587', '普通住宅', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3590', '3587', '别墅', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3591', '3587', '商业办公', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3592', '3587', '海外房产', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3593', '3587', '文旅地产', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3594', '3587', '长租公寓', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3595', '10', '汽车车型', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3596', '3595', '微型车', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3597', '3595', '小型车', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3598', '3595', '紧凑型车', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3599', '3595', '中型车', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3600', '3595', '中大型车', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3601', '3595', '豪华车', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3602', '3595', 'MPV', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3603', '3595', 'SUV', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3604', '3595', '跑车', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3605', '10', '汽车价格', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3606', '3605', '5-8万', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3607', '3605', '8-12万', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3608', '3605', '12-18万', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3609', '3605', '18-25万', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3610', '3605', '25-40万', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3611', '3605', '40万以上', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3612', '10', '汽车品牌', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3613', '3612', '大众', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3614', '3612', '日产', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3615', '3612', '丰田', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3616', '3612', '别克', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3617', '3612', '五菱', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3618', '3612', '本田', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3619', '10', '维修保养', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3620', '3619', '京东保养', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3621', '3619', '汽机油', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3622', '3619', '轮胎', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3623', '3619', '添加剂', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3624', '3619', '防冻液', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3625', '3619', '滤清器', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3626', '3619', '蓄电池', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3627', '3619', '变速箱油/滤', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3628', '3619', '雨刷', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3629', '3619', '刹车片/盘', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3630', '3619', '火花塞', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3631', '3619', '车灯', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3632', '3619', '轮毂', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3633', '3619', '维修配件', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3634', '3619', '汽车玻璃', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3635', '3619', '减震器', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3636', '3619', '正时皮带', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3637', '3619', '汽车喇叭', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3638', '3619', '汽修工具', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3639', '3619', '改装配件', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3640', '3619', '原厂件', '20', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3641', '10', '汽车装饰', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3642', '3641', '座垫座套', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3643', '3641', '脚垫', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3644', '3641', '头枕腰靠', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3645', '3641', '方向盘套', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3646', '3641', '后备箱垫', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3647', '3641', '车载支架', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3648', '3641', '车钥匙扣', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3649', '3641', '香水', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3650', '3641', '炭包/净化剂', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3651', '3641', '扶手箱', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3652', '3641', '挂件摆件', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3653', '3641', '车用收纳袋/盒', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3654', '3641', '遮阳/雪挡', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3655', '3641', '车衣', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3656', '3641', '车贴', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3657', '3641', '踏板', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3658', '3641', '行李架/箱', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3659', '3641', '雨眉', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3660', '3641', '装饰条', '18', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3661', '3641', '装饰灯', '19', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3662', '3641', '功能小件', '20', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3663', '3641', '车身装饰件', '21', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3664', '10', '车载电器', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3665', '3664', '行车记录仪', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3666', '3664', '车载充电器', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3667', '3664', '车机导航', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3668', '3664', '车载蓝牙', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3669', '3664', '智能驾驶', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3670', '3664', '对讲电台', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3671', '3664', '倒车雷达', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3672', '3664', '导航仪', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3673', '3664', '安全预警仪', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3674', '3664', '车载净化器', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3675', '3664', '车载吸尘器', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3676', '3664', '汽车音响', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3677', '3664', '车载冰箱', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3678', '3664', '应急电源', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3679', '3664', '逆变器', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3680', '3664', '车载影音', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3681', '3664', '车载生活电器', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3682', '3664', '车载电器配件', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3683', '10', '美容清洗', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3684', '3683', '洗车机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3685', '3683', '洗车水枪', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3686', '3683', '玻璃水', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3687', '3683', '清洁剂', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3688', '3683', '镀晶镀膜', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3689', '3683', '车蜡', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3690', '3683', '汽车贴膜', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3691', '3683', '底盘装甲', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3692', '3683', '补漆笔', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3693', '3683', '毛巾掸子', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3694', '3683', '洗车配件', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3695', '10', '安全自驾', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3696', '3695', '胎压监测', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3697', '3695', '充气泵', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3698', '3695', '灭火器', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3699', '3695', '车载床', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3700', '3695', '应急救援', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3701', '3695', '防盗设备', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3702', '3695', '自驾野营', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3703', '3695', '摩托车', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3704', '3695', '摩托周边', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3705', '3695', '保温箱', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3706', '3695', '储物箱', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3707', '10', '汽车服务', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3708', '3707', '保养维修', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3709', '3707', '洗车', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3710', '3707', '钣金喷漆', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3711', '3707', '清洗美容', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3712', '3707', '功能升级', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3713', '3707', '改装服务', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3714', '3707', 'ETC', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3715', '3707', '驾驶培训', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3716', '3707', '油卡充值', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3717', '3707', '加油卡', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3718', '11', '奶粉', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3719', '3718', '1段', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3720', '3718', '2段', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3721', '3718', '3段', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3722', '3718', '4段', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3723', '3718', '孕妈奶粉', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3724', '3718', '特殊配方奶粉', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3725', '3718', '有机奶粉', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3726', '11', '营养辅食', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3727', '3726', '米粉/菜粉', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3728', '3726', '面条/粥', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3729', '3726', '果泥/果汁', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3730', '3726', '益生菌/初乳', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3731', '3726', 'DHA', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3732', '3726', '钙铁锌/维生素', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3733', '3726', '清火/开胃', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3734', '3726', '宝宝零食', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3735', '11', '尿裤湿巾', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3736', '3735', 'NB', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3737', '3735', 'S', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3738', '3735', 'M', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3739', '3735', 'L', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3740', '3735', 'XL', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3741', '3735', 'XXL', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3742', '3735', '拉拉裤', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3743', '3735', '成人尿裤', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3744', '3735', '婴儿湿巾', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3745', '11', '喂养用品', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3746', '3745', '奶瓶奶嘴', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3747', '3745', '吸奶器', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3748', '3745', '暖奶消毒', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3749', '3745', '辅食料理机', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3750', '3745', '牙胶安抚', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3751', '3745', '食物存储', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3752', '3745', '儿童餐具', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3753', '3745', '水壶/水杯', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3754', '3745', '围兜/防溅衣', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3755', '11', '洗护用品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3756', '3755', '宝宝护肤', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3757', '3755', '日常护理', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3758', '3755', '洗发沐浴', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3759', '3755', '洗澡用具', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3760', '3755', '洗衣液/皂', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3761', '3755', '理发器', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3762', '3755', '婴儿口腔清洁', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3763', '3755', '座便器', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3764', '3755', '驱蚊防晒', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3765', '11', '寝居服饰', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3766', '3765', '睡袋/抱被', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3767', '3765', '婴儿枕', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3768', '3765', '毛毯棉被', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3769', '3765', '婴童床品', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3770', '3765', '浴巾/浴衣', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3771', '3765', '毛巾/口水巾', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3772', '3765', '婴儿礼盒', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3773', '3765', '婴儿内衣', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3774', '3765', '婴儿外出服', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3775', '3765', '隔尿垫巾', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3776', '3765', '尿布', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3777', '3765', '安全防护', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3778', '3765', '爬行垫', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3779', '3765', '婴儿鞋帽袜', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3780', '11', '妈妈专区', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3781', '3780', '防辐射服', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3782', '3780', '孕妈装', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3783', '3780', '孕妇护肤', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3784', '3780', '妈咪包/背婴带', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3785', '3780', '待产护理', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3786', '3780', '产后塑身', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3787', '3780', '文胸/内裤', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3788', '3780', '防溢乳垫', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3789', '3780', '孕期营养', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3790', '11', '童车童床', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3791', '3790', '安全座椅', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3792', '3790', '婴儿推车', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3793', '3790', '婴儿床', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3794', '3790', '婴儿床垫', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3795', '3790', '餐椅', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3796', '3790', '学步车', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3797', '3790', '三轮车', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3798', '3790', '自行车', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3799', '3790', '扭扭车', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3800', '3790', '滑板车', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3801', '3790', '电动车', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3802', '11', '玩具', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3803', '3802', '适用年龄', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3804', '3802', '遥控/电动', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3805', '3802', '益智玩具', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3806', '3802', '积木拼插', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3807', '3802', '动漫玩具', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3808', '3802', '毛绒布艺', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3809', '3802', '模型玩具', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3810', '3802', '健身玩具', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3811', '3802', '娃娃玩具', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3812', '3802', '绘画/DIY', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3813', '3802', '创意减压', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3814', '11', '乐器', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3815', '3814', '钢琴', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3816', '3814', '电钢琴', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3817', '3814', '电子琴', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3818', '3814', '吉他', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3819', '3814', '尤克里里', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3820', '3814', '打击乐器', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3821', '3814', '西洋管弦', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3822', '3814', '民族乐器', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3823', '3814', '乐器配件', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3824', '12', '新鲜水果', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3825', '3824', '苹果', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3826', '3824', '橙子', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3827', '3824', '奇异果/猕猴桃', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3828', '3824', '火龙果', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3829', '3824', '榴莲', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3830', '3824', '芒果', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3831', '3824', '椰子', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3832', '3824', '车厘子', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3833', '3824', '百香果', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3834', '3824', '柚子', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3835', '3824', '国产水果', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3836', '3824', '进口水果', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3837', '12', '蔬菜蛋品', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3838', '3837', '蛋品', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3839', '3837', '叶菜类', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3840', '3837', '根茎类', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3841', '3837', '葱姜蒜椒', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3842', '3837', '鲜菌菇', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3843', '3837', '茄果瓜类', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3844', '3837', '半加工蔬菜', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3845', '3837', '半加工豆制品', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3846', '3837', '玉米', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3847', '3837', '山药', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3848', '3837', '地瓜/红薯', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3849', '12', '精选肉类', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3850', '3849', '猪肉', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3851', '3849', '牛肉', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3852', '3849', '羊肉', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3853', '3849', '鸡肉', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3854', '3849', '鸭肉', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3855', '3849', '冷鲜肉', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3856', '3849', '特色肉类', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3857', '3849', '内脏类', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3858', '3849', '冷藏熟食', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3859', '3849', '牛排', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3860', '3849', '牛腩', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3861', '3849', '鸡翅', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3862', '12', '海鲜水产', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3863', '3862', '鱼类', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3864', '3862', '虾类', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3865', '3862', '蟹类', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3866', '3862', '贝类', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3867', '3862', '海参', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3868', '3862', '鱿鱼/章鱼', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3869', '3862', '活鲜', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3870', '3862', '三文鱼', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3871', '3862', '大闸蟹', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3872', '3862', '小龙虾', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3873', '3862', '海鲜加工品', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3874', '3862', '海产干货', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3875', '12', '冷饮冻食', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3876', '3875', '水饺/馄饨', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3877', '3875', '汤圆/元宵', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3878', '3875', '面点', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3879', '3875', '烘焙半成品', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3880', '3875', '奶酪/黄油', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3881', '3875', '方便速食', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3882', '3875', '火锅丸串', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3883', '3875', '冰淇淋', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3884', '3875', '冷藏饮料', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3885', '3875', '低温奶', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3886', '12', '中外名酒', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3887', '3886', '白酒', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3888', '3886', '葡萄酒', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3889', '3886', '洋酒', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3890', '3886', '啤酒', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3891', '3886', '黄酒/养生酒', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3892', '3886', '收藏酒/陈年老酒', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3893', '12', '进口食品', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3894', '3893', '牛奶', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3895', '3893', '饼干蛋糕', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3896', '3893', '糖/巧克力', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3897', '3893', '零食', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3898', '3893', '水', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3899', '3893', '饮料', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3900', '3893', '咖啡粉', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3901', '3893', '冲调品', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3902', '3893', '油', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3903', '3893', '方便食品', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3904', '3893', '米面调味', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3905', '12', '休闲食品', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3906', '3905', '中华老字号', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3907', '3905', '营养零食', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3908', '3905', '休闲零食', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3909', '3905', '膨化食品', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3910', '3905', '坚果炒货', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3911', '3905', '肉干/熟食', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3912', '3905', '蜜饯果干', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3913', '3905', '糖果/巧克力', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3914', '3905', '饼干蛋糕', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3915', '12', '地方特产', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3916', '3915', '北京', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3917', '3915', '上海', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3918', '3915', '新疆', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3919', '3915', '陕西', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3920', '3915', '湖南', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3921', '3915', '云南', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3922', '3915', '山东', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3923', '3915', '江西', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3924', '3915', '宿迁', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3925', '3915', '成都', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3926', '3915', '内蒙古', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3927', '3915', '广西', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3928', '12', '茗茶', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3929', '3928', '铁观音', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3930', '3928', '普洱', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3931', '3928', '龙井', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3932', '3928', '绿茶', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3933', '3928', '红茶', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3934', '3928', '乌龙茶', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3935', '3928', '茉莉花茶', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3936', '3928', '花草茶', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3937', '3928', '花果茶', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3938', '3928', '黑茶', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3939', '3928', '白茶', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3940', '3928', '养生茶', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3941', '3928', '其他茶', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3942', '12', '饮料冲调', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3943', '3942', '饮料', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3944', '3942', '牛奶酸奶', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3945', '3942', '饮用水', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3946', '3942', '咖啡/奶茶', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3947', '3942', '蜂蜜/蜂产品', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3948', '3942', '冲饮谷物', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3949', '3942', '成人奶粉', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3950', '12', '粮油调味', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3951', '3950', '大米', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3952', '3950', '食用油', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3953', '3950', '面', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3954', '3950', '杂粮', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3955', '3950', '调味品', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3956', '3950', '南北干货', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3957', '3950', '方便食品', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3958', '3950', '烘焙原料', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3959', '3950', '有机食品', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3960', '13', '艺术品', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3961', '3960', '油画', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3962', '3960', '版画', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3963', '3960', '水墨画', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3964', '3960', '书法', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3965', '3960', '雕塑', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3966', '3960', '艺术画册', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3967', '3960', '艺术衍生品', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3968', '13', '火机烟具', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3969', '3968', '电子烟', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3970', '3968', '烟油', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3971', '3968', '打火机', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3972', '3968', '烟嘴', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3973', '3968', '烟盒', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3974', '3968', '烟斗', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3975', '13', '礼品', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3976', '3975', '创意礼品', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3977', '3975', '电子礼品', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3978', '3975', '工艺礼品', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3979', '3975', '美妆礼品', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3980', '3975', '婚庆节庆', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3981', '3975', '礼盒礼券', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3982', '3975', '礼品定制', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3983', '3975', '军刀军具', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3984', '3975', '古董文玩', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3985', '3975', '收藏品', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3986', '3975', '礼品文具', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3987', '3975', '熏香', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3988', '3975', '京东卡', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3989', '13', '鲜花速递', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3990', '3989', '鲜花', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3991', '3989', '每周一花', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3992', '3989', '永生花', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3993', '3989', '香皂花', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3994', '3989', '卡通花束', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3995', '3989', '干花', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3996', '13', '绿植园艺', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3997', '3996', '桌面绿植', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3998', '3996', '苗木', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('3999', '3996', '绿植盆栽', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4000', '3996', '多肉植物', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4001', '3996', '花卉', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4002', '3996', '种子种球', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4003', '3996', '花盆花器', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4004', '3996', '园艺土肥', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4005', '3996', '园艺工具', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4006', '3996', '园林机械', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4007', '13', '种子', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4008', '4007', '花草林木类', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4009', '4007', '蔬菜/菌类', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4010', '4007', '瓜果类', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4011', '4007', '大田作物类', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4012', '13', '农药', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4013', '4012', '杀虫剂', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4014', '4012', '杀菌剂', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4015', '4012', '除草剂', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4016', '4012', '植物生长调节剂', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4017', '13', '肥料', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4018', '4017', '氮/磷/钾肥', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4019', '4017', '复合肥', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4020', '4017', '生物菌肥', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4021', '4017', '水溶/叶面肥', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4022', '4017', '有机肥', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4023', '13', '畜牧养殖', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4024', '4023', '中兽药', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4025', '4023', '西兽药', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4026', '4023', '兽医器具', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4027', '4023', '生产/运输器具', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4028', '4023', '预混料', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4029', '4023', '浓缩料', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4030', '4023', '饲料添加剂', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4031', '4023', '全价料', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4032', '4023', '赶猪器/注射器', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4033', '4023', '养殖场专用', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4034', '13', '农机农具', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4035', '4034', '微耕机', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4036', '4034', '喷雾器', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4037', '4034', '割草机', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4038', '4034', '农机整机', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4039', '4034', '农机配件', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4040', '4034', '小型农机具', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4041', '4034', '农膜', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4042', '4034', '农技服务', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4043', '14', '中西药品', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4044', '4043', '感冒咳嗽', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4045', '4043', '补肾壮阳', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4046', '4043', '补气养血', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4047', '4043', '止痛镇痛', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4048', '4043', '耳鼻喉用药', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4049', '4043', '眼科用药', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4050', '4043', '口腔用药', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4051', '4043', '皮肤用药', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4052', '4043', '肠胃消化', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4053', '4043', '风湿骨外伤', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4054', '4043', '维生素/钙', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4055', '4043', '男科/泌尿', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4056', '4043', '妇科用药', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4057', '4043', '儿科用药', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4058', '4043', '心脑血管', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4059', '4043', '避孕药', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4060', '4043', '肝胆用药', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4061', '14', '营养健康', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4062', '4061', '增强免疫', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4063', '4061', '骨骼健康', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4064', '4061', '补肾强身', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4065', '4061', '肠胃养护', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4066', '4061', '调节三高', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4067', '4061', '缓解疲劳', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4068', '4061', '养肝护肝', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4069', '4061', '改善贫血', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4070', '4061', '清咽利喉', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4071', '4061', '美容养颜', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4072', '4061', '减肥塑身', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4073', '4061', '改善睡眠', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4074', '4061', '明目益智', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4075', '14', '营养成分', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4076', '4075', '维生素/矿物质', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4077', '4075', '胶原蛋白', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4078', '4075', '益生菌', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4079', '4075', '蛋白粉', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4080', '4075', '玛咖', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4081', '4075', '酵素', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4082', '4075', '膳食纤维', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4083', '4075', '叶酸', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4084', '4075', '番茄红素', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4085', '4075', '左旋肉碱', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4086', '14', '滋补养生', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4087', '4086', '阿胶', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4088', '4086', '蜂蜜/蜂产品', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4089', '4086', '枸杞', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4090', '4086', '燕窝', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4091', '4086', '冬虫夏草', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4092', '4086', '人参/西洋参', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4093', '4086', '三七', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4094', '4086', '鹿茸', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4095', '4086', '雪蛤', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4096', '4086', '青钱柳', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4097', '4086', '石斛/枫斗', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4098', '4086', '灵芝/孢子粉', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4099', '4086', '当归', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4100', '4086', '养生茶饮', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4101', '4086', '药食同源', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4102', '14', '计生情趣', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4103', '4102', '避孕套', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4104', '4102', '排卵验孕', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4105', '4102', '润滑液', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4106', '4102', '男用延时', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4107', '4102', '飞机杯', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4108', '4102', '倒模', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4109', '4102', '仿真娃娃', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4110', '4102', '震动棒', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4111', '4102', '跳蛋', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4112', '4102', '仿真阳具', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4113', '4102', '情趣内衣', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4114', '14', '保健器械', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4115', '4114', '血压计', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4116', '4114', '血糖仪', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4117', '4114', '心电仪', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4118', '4114', '体温计', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4119', '4114', '胎心仪', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4120', '4114', '制氧机', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4121', '4114', '呼吸机', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4122', '4114', '雾化器', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4123', '4114', '助听器', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4124', '4114', '轮椅', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4125', '4114', '拐杖', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4126', '4114', '护理床', '11', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4127', '4114', '中医保健', '12', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4128', '4114', '养生器械', '13', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4129', '4114', '理疗仪', '14', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4130', '4114', '家庭护理', '15', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4131', '4114', '智能健康', '16', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4132', '4114', '出行常备', '17', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4133', '14', '护理护具', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4134', '4133', '口罩', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4135', '4133', '眼罩/耳塞', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4136', '4133', '跌打损伤', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4137', '4133', '创可贴', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4138', '4133', '暖贴', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4139', '4133', '鼻喉护理', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4140', '4133', '眼部保健', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4141', '4133', '美体护理', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4142', '14', '隐形眼镜', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4143', '4142', '彩色隐形', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4144', '4142', '透明隐形', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4145', '4142', '日抛', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4146', '4142', '月抛', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4147', '4142', '半年抛', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4148', '4142', '双周抛', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4149', '4142', '护理液', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4150', '4142', '润眼液', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4151', '4142', '大直径', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4152', '4142', '欧美混血', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4153', '4142', '眼镜配件', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4154', '14', '健康服务', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4155', '4154', '体检套餐', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4156', '4154', '口腔齿科', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4157', '4154', '基因检测', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4158', '4154', '孕产服务', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4159', '4154', '美容塑型', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4160', '4154', '老年体检', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4161', '15', '文学', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4162', '4161', '小说', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4163', '4161', '散文随笔', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4164', '4161', '青春文学', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4165', '4161', '传记', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4166', '4161', '动漫', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4167', '4161', '悬疑推理', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4168', '4161', '科幻', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4169', '4161', '武侠', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4170', '4161', '世界名著', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4171', '15', '童书', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4172', '4171', '0-2岁', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4173', '4171', '3-6岁', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4174', '4171', '7-10岁', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4175', '4171', '11-14岁', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4176', '4171', '儿童文学', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4177', '4171', '绘本', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4178', '4171', '科普百科', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4179', '4171', '幼儿启蒙', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4180', '4171', '智力开发', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4181', '4171', '少儿英语', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4182', '4171', '玩具书', '10', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4183', '15', '教材教辅', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4184', '4183', '教材', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4185', '4183', '中小学教辅', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4186', '4183', '考试', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4187', '4183', '外语学习', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4188', '4183', '字典词典', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4189', '4183', '课外读物', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4190', '4183', '英语四六级', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4191', '4183', '会计类考试', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4192', '4183', '国家公务员', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4193', '15', '人文社科', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4194', '4193', '历史', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4195', '4193', '心理学', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4196', '4193', '政治军事', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4197', '4193', '传统文化', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4198', '4193', '哲学宗教', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4199', '4193', '社会科学', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4200', '4193', '法律', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4201', '4193', '文化', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4202', '4193', '党政专区', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4203', '15', '经管励志', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4204', '4203', '管理', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4205', '4203', '金融', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4206', '4203', '经济', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4207', '4203', '市场营销', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4208', '4203', '领导力', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4209', '4203', '股票', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4210', '4203', '投资', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4211', '4203', '励志与成功', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4212', '4203', '自我完善', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4213', '15', '艺术', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4214', '4213', '绘画', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4215', '4213', '摄影', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4216', '4213', '音乐', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4217', '4213', '书法', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4218', '4213', '连环画', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4219', '4213', '设计', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4220', '4213', '建筑艺术', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4221', '4213', '艺术史', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4222', '4213', '影视', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4223', '15', '科学技术', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4224', '4223', '计算机与互联网', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4225', '4223', '科普', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4226', '4223', '建筑', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4227', '4223', '工业技术', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4228', '4223', '电子通信', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4229', '4223', '医学', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4230', '4223', '科学与自然', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4231', '4223', '农林', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4232', '15', '生活', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4233', '4232', '育儿家教', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4234', '4232', '孕产胎教', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4235', '4232', '健身保健', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4236', '4232', '旅游地图', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4237', '4232', '手工DIY', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4238', '4232', '烹饪美食', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4239', '15', '', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4240', '4239', '杂志/期刊', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4241', '4239', '英文原版书', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4242', '4239', '港台图书', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4243', '15', '文娱音像', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4244', '4243', '音乐', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4245', '4243', '影视', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4246', '4243', '教育音像', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4247', '4243', '游戏', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4248', '4243', '影视/动漫周边', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4249', '15', '教育培训', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4250', '4249', '中小学教育', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4251', '4249', '素质培养', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4252', '4249', '出国留学', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4253', '4249', '语言培训', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4254', '4249', '学历教育', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4255', '4249', '职业培训', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4256', '15', '电子书', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4257', '4256', '小说', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4258', '4256', '文学', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4259', '4256', '励志与成功', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4260', '4256', '经济管理', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4261', '4256', '传记', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4262', '4256', '社会科学', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4263', '4256', '计算机与互联网', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4264', '4256', '进口原版', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4265', '15', '邮币', '12', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4266', '4265', '邮票', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4267', '4265', '钱币', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4268', '4265', '邮资封片', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4269', '4265', '磁卡', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4270', '4265', '票证', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4271', '4265', '礼品册', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4272', '16', '交通出行', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4273', '4272', '国内机票', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4274', '4272', '国际机票', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4275', '4272', '火车票', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4276', '4272', '机场服务', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4277', '4272', '机票套餐', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4278', '16', '酒店预订', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4279', '4278', '国内酒店', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4280', '4278', '国际酒店', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4281', '4278', '酒店套餐', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4282', '4278', '超值精选', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4283', '16', '旅游度假', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4284', '4283', '国内旅游', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4285', '4283', '出境旅游', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4286', '4283', '全球签证', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4287', '4283', '景点门票', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4288', '4283', '邮轮', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4289', '4283', '旅行保险', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4290', '16', '商旅服务', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4291', '4290', '企业差旅', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4292', '4290', '团队建设', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4293', '4290', '奖励旅游', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4294', '4290', '会议周边', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4295', '4290', '会议展览', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4296', '16', '演出票务', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4297', '4296', '电影选座', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4298', '4296', '演唱会', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4299', '4296', '音乐会', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4300', '4296', '话剧歌剧', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4301', '4296', '体育赛事', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4302', '4296', '舞蹈芭蕾', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4303', '4296', '戏曲综艺', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4304', '16', '生活缴费', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4305', '4304', '水费', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4306', '4304', '电费', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4307', '4304', '燃气费', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4308', '4304', '城市通', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4309', '4304', '油卡充值', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4310', '4304', '加油卡', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4311', '16', '生活服务', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4312', '4311', '家政保洁', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4313', '4311', '摄影写真', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4314', '4311', '丽人/养生', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4315', '4311', '代理代办', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4316', '16', '彩票', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4317', '4316', '数据图表', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4318', '4316', '彩民服务', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4319', '16', '游戏', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4320', '4319', 'QQ充值', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4321', '4319', '游戏点卡', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4322', '4319', '网页游戏', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4323', '4319', '游戏周边', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4324', '4319', '手机游戏', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4325', '4319', '单机游戏', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4326', '16', '', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4327', '4326', '海外房产', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4328', '4326', '海外购物', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4329', '17', '理财', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4330', '4329', '京东小金库', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4331', '4329', '基金理财', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4332', '4329', '定期理财', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4333', '17', '众筹', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4334', '4333', '智能硬件', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4335', '4333', '流行文化', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4336', '4333', '生活美学', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4337', '4333', '公益', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4338', '4333', '其他权益众筹', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4339', '17', '东家', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4340', '4339', '类固收', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4341', '4339', '私募股权', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4342', '4339', '阳光私募', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4343', '4339', '投资策略', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4344', '17', '白条', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4345', '4344', '京东白条', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4346', '4344', '白条联名卡', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4347', '4344', '京东钢镚', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4348', '4344', '旅游白条', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4349', '4344', '安居白条', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4350', '4344', '校园金融', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4351', '4344', '京东金采', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4352', '17', '支付', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4353', '4352', '京东支付', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4354', '17', '保险', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4355', '4354', '健康险', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4356', '4354', '人寿险', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4357', '4354', '意外险', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4358', '4354', '旅行险', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4359', '4354', '财产险', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4360', '4354', '车险', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4361', '17', '股票', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4362', '4361', '实时资讯', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4363', '4361', '市场行情', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4364', '4361', '投资达人', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4365', '4361', '量化平台', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4366', '18', '家电安装', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4367', '4366', '空调安装', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4368', '4366', '电视安装', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4369', '4366', '洗衣机安装', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4370', '4366', '热水器安装', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4371', '4366', '烟机/灶具安装', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4372', '4366', '净水器安装', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4373', '18', '办公安装', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4374', '4373', '电脑安装', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4375', '4373', '办公设备安装', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4376', '18', '家居安装', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4377', '4376', '家具安装', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4378', '4376', '灯具安装', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4379', '4376', '智能家居安装', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4380', '4376', '五金卫浴安装', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4381', '4376', '晾衣架安装', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4382', '18', '家电维修', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4383', '4382', '空调维修', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4384', '4382', '电视维修', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4385', '4382', '洗衣机维修', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4386', '4382', '冰箱维修', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4387', '4382', '热水器维修', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4388', '4382', '油烟机维修', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4389', '4382', '燃气灶维修', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4390', '18', '手机维修', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4391', '4390', '屏幕换新', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4392', '4390', '电池换新', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4393', '4390', '手机故障', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4394', '4390', '保障服务', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4395', '18', '办公维修', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4396', '4395', '笔记本维修', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4397', '4395', '平板维修', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4398', '18', '数码维修', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4399', '4398', '智能家居维修', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4400', '4398', '无人机维修', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4401', '4398', '智能设备维修', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4402', '18', '清洗保养', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4403', '4402', '家电清洗', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4404', '4402', '家居家纺洗护', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4405', '4402', '服装洗护', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4406', '4402', '鞋靴箱包保养', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4407', '18', '特色服务', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4408', '4407', '家庭优惠套装', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4409', '4407', '企悦服务', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4410', '4407', '体育服务', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4411', '4407', '骑行服务', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4412', '4407', '钟表维修/保养', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4413', '19', '工具', '0', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4414', '4413', '手动工具', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4415', '4413', '电动工具', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4416', '4413', '测量工具', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4417', '4413', '气动工具', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4418', '4413', '工具套装', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4419', '4413', '工具配件', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4420', '19', '劳动防护', '1', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4421', '4420', '手部防护', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4422', '4420', '足部防护', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4423', '4420', '身体防护', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4424', '4420', '头部防护', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4425', '4420', '眼脸部防护', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4426', '4420', '呼吸防护', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4427', '4420', '坠落防护', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4428', '4420', '静电无尘', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4429', '19', '工控配电', '2', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4430', '4429', '电线电缆', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4431', '4429', '开关插座', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4432', '4429', '低压配电', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4433', '4429', '控制保护', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4434', '4429', '电力检测', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4435', '4429', '工业控制', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4436', '4429', '自动化', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4437', '4429', '电料辅件', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4438', '19', '仪器仪表', '3', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4439', '4438', '温度仪表', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4440', '4438', '电工仪表', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4441', '4438', '气体检测', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4442', '4438', '分析检测', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4443', '4438', '压力仪表', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4444', '4438', '流量仪表', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4445', '4438', '物位仪表', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4446', '4438', '阻容感及晶振', '7', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4447', '4438', '半导体', '8', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4448', '4438', '模块及开发板', '9', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4449', '19', '清洁用品', '4', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4450', '4449', '清洁工具', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4451', '4449', '清洁设备', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4452', '4449', '清洗保养品', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4453', '4449', '工业擦拭', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4454', '4449', '地垫', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4455', '4449', '垃圾处理', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4456', '19', '化学品', '5', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4457', '4456', '润滑剂', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4458', '4456', '胶粘剂', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4459', '4456', '化学试剂', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4460', '4456', '工业涂层', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4461', '4456', '清洗剂', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4462', '4456', '防锈剂', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4463', '4456', '脱模剂', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4464', '19', '安全消防', '6', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4465', '4464', '警示标识', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4466', '4464', '应急处理', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4467', '4464', '监控设备', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4468', '4464', '安全锁具', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4469', '4464', '化学品存储', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4470', '4464', '消防器材', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4471', '4464', '消防服装', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4472', '19', '仓储包装', '7', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4473', '4472', '包装工具', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4474', '4472', '包装耗材', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4475', '4472', '标签耗材', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4476', '4472', '搬运设备', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4477', '4472', '存储设备', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4478', '19', '焊接紧固', '8', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4479', '4478', '五金紧固件', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4480', '4478', '密封件', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4481', '4478', '焊接设备', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4482', '4478', '焊接耗材', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4483', '19', '机械配件', '9', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4484', '4483', '轴承', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4485', '4483', '皮带链条', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4486', '4483', '机械零配件', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4487', '4483', '机床及附件', '3', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4488', '4483', '刀具', '4', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4489', '4483', '气动元件', '5', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4490', '4483', '泵阀类', '6', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4491', '19', '暖通照明', '10', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4492', '4491', '暖通', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4493', '4491', '工业照明', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4494', '4491', '管材管件', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4495', '19', '实验用品', '11', '2', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4496', '4495', '实验室试剂', '0', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4497', '4495', '实验室耗材', '1', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `os_category` VALUES ('4498', '4495', '实验室设备', '2', '3', '1', '1', '0', '0', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for os_comment
-- ----------------------------
DROP TABLE IF EXISTS `os_comment`;
CREATE TABLE `os_comment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `star` tinyint(4) DEFAULT NULL COMMENT '评论星级：1,2,3,4,5',
  `content` text COMMENT '评论内容',
  `good_count` int(11) DEFAULT '0' COMMENT '好评数',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `type` tinyint(2) DEFAULT '0' COMMENT '评论类型：1,优质；0,普通',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评价表';

-- ----------------------------
-- Records of os_comment
-- ----------------------------
INSERT INTO `os_comment` VALUES ('32', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\a3592a6eb519428aabfc5076c62ad01d.jpg', '118650', '5', '使用心得：预约新品就开买的，厂家顺丰物流棒棒哒，送货上门，自己十分钟就轻松组装完成，机器边很薄，色彩非常不错。酷开系统非常好用，音质也很好。赶紧联网，晚上可以用它看世界杯了。哇哈哈。', '1571', '1', '1', '2019-03-22 00:50:19', '京东', '2019-03-22 00:50:19', '京东');
INSERT INTO `os_comment` VALUES ('33', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：反应速度有点慢，但绝对对得起这个价格，做工用料嘛，这个价位还要什么自行车？色彩还算不错的，声音嘛，图个响说是了，参数是全高清的，没去测试。总的一句，对得起这个价格 要说不满意的，是它的底座是要上镙丝的，遥控连个电池也没有，这点钱确实不应该省的', '6832', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('34', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：京东配送还挺快，第一天下单第二天上午就送到了，虽然出了一点小差错，他们处理的响应速度很快，电视剧挺好的，以前的几个都是康佳的，质量很好，这次是给老人买的，操作也不算麻烦，老人要看电视台直播节目，装了第三方直播软件后老人也很方便操作，电视机用wifi连接时的响应速度也可以，插网线的话可能更好，这个可能跟网速有关系吧，屏幕的清晰度也可以，机器本身自带的应用也很好，沙发管家，特别是易互动，可以直接把手机上的东西投影到电视上，真的很方便。内存还足可以安装几个应用软件。下次如果还要买的话还考虑买康佳的。', '3884', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('35', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：商品物超所值，看高清720p很顺畅，差不多用两天了，性能哒哒滴。', '6767', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('36', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：包装完好，快递迅速，前一天下单，转天早上京东快递小哥就送货到家了，服务态度还特别好，开箱验机，电视色彩很鲜艳，图像清晰，功能齐全，连接网络很方便，功能强大，连接机顶盒图像也清晰，因为单位办公室电视使用的就是康佳品牌，使用了二年多质量还是这么稳定，所以这次还是选择康佳，大品牌，值得信瀨，网络上看电视也不卡，总之，信濑京东，信懒康佳，服务完美，物美价廉！', '3931', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('37', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：很不错买给家里爸妈平时看看电视，外观时尚大气，超做简单易懂，对于老人家来说非常好。京东物流速度快，农村一样送货上门，还单面让通电检查机器，非常满意', '4808', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('38', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：前几个月买了款也是康佳的32寸，价格1200！只不过屏幕不小心被硬物击破！修的话麻烦不划算所以干脆再买一台！这款kktv和之前的那款比起来分辨率什么的都差不多！内置播放器也是一样的！所以用起来也顺手！就是这款液晶屏和边缘衔接部分没有之前那款结实有些松动！不过价格摆在那里嘛！便宜！就看之后耐用不耐用了！', '5953', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('39', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：效果和我颜色都不错，很满意送货师傅态度特别好必须给五分好评，送货快，上午下单，下午三点半就到了，非常满意，京东就是这样效率高。给小孩看的大小刚好', '1565', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('40', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：第一次在京东买电器，非常满意，五星好评，卖家服务态度很好，不懂得卖家都一一帮忙解决了，快递也很快，包送货上门，教我如何使用，这款电视直接连接无线网密码都能看电视，而且从手机能投影到电视上看，非常方便，想看啥就看啥，下次买电器还上京东买，', '4644', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('41', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：质量真的很不错，手机安装易互动就可以将腾讯视频的东西投射上去，再也不用用手机看电视了，画面清晰，音质挺好的，特意用了几天来评论，没发现别的问题，客服态度也很好，送货及时，安装及时，很喜欢这款电视', '5350', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('42', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：电视机非常清晰质量很好就是语音功能不知道用！京东快递很负责任晚上十点多还给我送货小哥辛苦了', '6999', '1', '1', '2019-03-22 00:50:23', '京东', '2019-03-22 00:50:23', '京东');
INSERT INTO `os_comment` VALUES ('43', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：10月5日下单，7日如约收货，金黄色的金属机身挺漂亮的。画面挺清晰的，声音也不错。2G+16G和当下同一配置的电视机相比，物美价廉。手机投屏后，手机内所有内容都可以放大观看。现已与功放和音响连接，总体满意。', '4646', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('44', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：一开机就连上了wifi 机子够大，清晰度还可以 送货速度真的快 比较满意的一次购物', '8072', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('45', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：用了一个星期，感觉还可以！播放视频还要蛮清晰的，内存也够了！就是主要看能用两三年不会坏就好了?', '1', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('46', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：电视收到了，京东就是给力，55寸的电视够大，清晰度，声音都不错。开机~时间相较比我新家的电视~来算短的了。调试简单自己就能搞定，安装师傅服务的很到位，态度好。电视界面美观大气，晚上关灯看电视，老妹说看电影一样，非常棒。物美价廉赞一个。', '5657', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('47', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：康佳KKTV电视，款式漂亮，外观好看，金属边款，很有质感，网络功能齐全，点播起来方便，反应速度很快。很不错的电视。下次还会选择 。满意的一次购物。值得购买。物流也非常快。喜欢这款电视。希望服务更好。', '42', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('48', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：外观漂亮，颜色超好，内存大反应快，红外遥控器，资源挺丰富立面有我儿子最爱看的宝宝巴士通过易学频道对小孩进行辅导，大屏幕儿子的最爱[愉快]另外物流也很快，服务很周到，不愧是大品牌，大爱KKTV', '7464', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('49', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：之前给爸妈买了台k43非常好用，这次自己要买台65吋的，又选择了KKTV，京东送货一直很给力，很快就到了。自己安装很简单，开机画面很清晰，配置高，反应快，目前一切满意！', '4107', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('50', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：康佳KKTV电视，很不错的电视 ，清晰度很好，颜色很鲜艳，网络功能齐全，点播方便，操作很好。金属边框，音响效果也挺好的。很满意的电视。物流也很快。值得购买的好电视。喜欢这款电视。', '5974', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('51', '955', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：康佳的这款55寸，性价比高，超薄，内存16G，前置@，是18年度最值得购买电视之一！超赞！', '4037', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('52', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：快递哥热心，帮我安装好并调试。效果非常好，大气金属边。系统使用方便筒单好用。', '5141', '1', '1', '2019-03-22 00:50:27', '京东', '2019-03-22 00:50:27', '京东');
INSERT INTO `os_comment` VALUES ('53', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a3592a6eb519428aabfc5076c62ad01d.jpg', '118650', '5', '使用心得：预约新品就开买的，厂家顺丰物流棒棒哒，送货上门，自己十分钟就轻松组装完成，机器边很薄，色彩非常不错。酷开系统非常好用，音质也很好。赶紧联网，晚上可以用它看世界杯了。哇哈哈。', '2560', '1', '1', '2019-03-22 00:52:39', '京东', '2019-03-22 00:52:39', '京东');
INSERT INTO `os_comment` VALUES ('54', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：反应速度有点慢，但绝对对得起这个价格，做工用料嘛，这个价位还要什么自行车？色彩还算不错的，声音嘛，图个响说是了，参数是全高清的，没去测试。总的一句，对得起这个价格 要说不满意的，是它的底座是要上镙丝的，遥控连个电池也没有，这点钱确实不应该省的', '8698', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('55', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：京东配送还挺快，第一天下单第二天上午就送到了，虽然出了一点小差错，他们处理的响应速度很快，电视剧挺好的，以前的几个都是康佳的，质量很好，这次是给老人买的，操作也不算麻烦，老人要看电视台直播节目，装了第三方直播软件后老人也很方便操作，电视机用wifi连接时的响应速度也可以，插网线的话可能更好，这个可能跟网速有关系吧，屏幕的清晰度也可以，机器本身自带的应用也很好，沙发管家，特别是易互动，可以直接把手机上的东西投影到电视上，真的很方便。内存还足可以安装几个应用软件。下次如果还要买的话还考虑买康佳的。', '5147', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('56', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：商品物超所值，看高清720p很顺畅，差不多用两天了，性能哒哒滴。', '2108', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('57', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：包装完好，快递迅速，前一天下单，转天早上京东快递小哥就送货到家了，服务态度还特别好，开箱验机，电视色彩很鲜艳，图像清晰，功能齐全，连接网络很方便，功能强大，连接机顶盒图像也清晰，因为单位办公室电视使用的就是康佳品牌，使用了二年多质量还是这么稳定，所以这次还是选择康佳，大品牌，值得信瀨，网络上看电视也不卡，总之，信濑京东，信懒康佳，服务完美，物美价廉！', '5074', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('58', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：很不错买给家里爸妈平时看看电视，外观时尚大气，超做简单易懂，对于老人家来说非常好。京东物流速度快，农村一样送货上门，还单面让通电检查机器，非常满意', '4247', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('59', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：前几个月买了款也是康佳的32寸，价格1200！只不过屏幕不小心被硬物击破！修的话麻烦不划算所以干脆再买一台！这款kktv和之前的那款比起来分辨率什么的都差不多！内置播放器也是一样的！所以用起来也顺手！就是这款液晶屏和边缘衔接部分没有之前那款结实有些松动！不过价格摆在那里嘛！便宜！就看之后耐用不耐用了！', '1607', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('60', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：效果和我颜色都不错，很满意送货师傅态度特别好必须给五分好评，送货快，上午下单，下午三点半就到了，非常满意，京东就是这样效率高。给小孩看的大小刚好', '1567', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('61', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：第一次在京东买电器，非常满意，五星好评，卖家服务态度很好，不懂得卖家都一一帮忙解决了，快递也很快，包送货上门，教我如何使用，这款电视直接连接无线网密码都能看电视，而且从手机能投影到电视上看，非常方便，想看啥就看啥，下次买电器还上京东买，', '518', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('62', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：质量真的很不错，手机安装易互动就可以将腾讯视频的东西投射上去，再也不用用手机看电视了，画面清晰，音质挺好的，特意用了几天来评论，没发现别的问题，客服态度也很好，送货及时，安装及时，很喜欢这款电视', '1043', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('63', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f334694a737340b3afd5a9b314b397b6.jpg', '118649', '5', '使用心得：电视机非常清晰质量很好就是语音功能不知道用！京东快递很负责任晚上十点多还给我送货小哥辛苦了', '2536', '1', '1', '2019-03-22 00:52:43', '京东', '2019-03-22 00:52:43', '京东');
INSERT INTO `os_comment` VALUES ('64', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：10月5日下单，7日如约收货，金黄色的金属机身挺漂亮的。画面挺清晰的，声音也不错。2G+16G和当下同一配置的电视机相比，物美价廉。手机投屏后，手机内所有内容都可以放大观看。现已与功放和音响连接，总体满意。', '7514', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('65', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：一开机就连上了wifi 机子够大，清晰度还可以 送货速度真的快 比较满意的一次购物', '8472', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('66', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：用了一个星期，感觉还可以！播放视频还要蛮清晰的，内存也够了！就是主要看能用两三年不会坏就好了?', '4978', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('67', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：电视收到了，京东就是给力，55寸的电视够大，清晰度，声音都不错。开机~时间相较比我新家的电视~来算短的了。调试简单自己就能搞定，安装师傅服务的很到位，态度好。电视界面美观大气，晚上关灯看电视，老妹说看电影一样，非常棒。物美价廉赞一个。', '9687', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('68', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：康佳KKTV电视，款式漂亮，外观好看，金属边款，很有质感，网络功能齐全，点播起来方便，反应速度很快。很不错的电视。下次还会选择 。满意的一次购物。值得购买。物流也非常快。喜欢这款电视。希望服务更好。', '736', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('69', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：外观漂亮，颜色超好，内存大反应快，红外遥控器，资源挺丰富立面有我儿子最爱看的宝宝巴士通过易学频道对小孩进行辅导，大屏幕儿子的最爱[愉快]另外物流也很快，服务很周到，不愧是大品牌，大爱KKTV', '4903', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('70', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：之前给爸妈买了台k43非常好用，这次自己要买台65吋的，又选择了KKTV，京东送货一直很给力，很快就到了。自己安装很简单，开机画面很清晰，配置高，反应快，目前一切满意！', '3836', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('71', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：康佳KKTV电视，很不错的电视 ，清晰度很好，颜色很鲜艳，网络功能齐全，点播方便，操作很好。金属边框，音响效果也挺好的。很满意的电视。物流也很快。值得购买的好电视。喜欢这款电视。', '6803', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('72', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：康佳的这款55寸，性价比高，超薄，内存16G，前置@，是18年度最值得购买电视之一！超赞！', '3531', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('73', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7057367f97e4472797db24258a18af71.jpg', '118648', '5', '使用心得：快递哥热心，帮我安装好并调试。效果非常好，大气金属边。系统使用方便筒单好用。', '7759', '1', '1', '2019-03-22 00:52:47', '京东', '2019-03-22 00:52:47', '京东');
INSERT INTO `os_comment` VALUES ('74', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：这款电视机很轻薄，很漂亮，曲面的画面感比平面的看着更舒服，影像很清楚，使用也很方便，电视预装的软件都很好，很周到，看、听、唱K歌的软件都有很好用很喜欢，不用自己再安装了，满足了我所有的要求。电视送到家，安装师傅佷快就上门给安装了，安装师傅很耐心的做了调试，给力。记得第一次来京东购物是在网络上看到京东的新闻，于是便抱着上京东看看，试买的心态买下了第一把剃须刀，结果被京东贴的服务深深感动，暖心的服务让我义无反顾的爱上了京东，从此只要家里有任何需要，第一想到的就是上京东，现在几乎不上实体店买了，因为在实体店买的东西拿回家你不喜欢，不可以退，京东可以，实体店买的东西有质量问题想换新的不可以，只能修，但京东可以，所以给京东一万个赞！我动员我身边的朋友都上京东了，京东是不是该给我发个红包，嘿嘿！京东购物让人如此放心、暖心、舒心，京东好样的！愿京东越来越来好，京东加油！', '7525', '1', '1', '2019-03-22 00:52:51', '京东', '2019-03-22 00:52:51', '京东');
INSERT INTO `os_comment` VALUES ('75', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：非常满意的一次购物，看了几天才来评价。首先说说送货速度，我在西部小县城乡下，第一天下单第二天就到，不得不佩服京东的物流。第二，外观，画质超级清晰，刚送回来看了下网络电视感觉不是很清晰，后来发现是动画片的原因，一般别的都很清晰。55寸够大，边框小，曲面上档次，总的来说就是高大上，最重要的一点不坏眼睛，不坏眼睛，不坏眼睛，重要的事情说三遍。朋友家的海信平面看一会儿眼睛发涨。这也是我选这款的重要原因之一，本来还看好海信的，可是在朋友家看了一会儿后放弃了。家里有小孩的注意了有些平面电视真的坏眼睛。为了眼睛建议选择曲面，看几小时不会累，当然一般电视还是得少看。 第三，说说性能功能，这款是TCL最新款吧，2018才上市，功能该有的都有，我也没仔细去研究，正常使用没问题，性能就比较满意了，开机不过10秒左右吧，或许更短，反应速度很快，处理器不错。反正我没感觉，上面电视很多并且基本都是免费的，这点很满意不像广电的看啥都要钱，我也是无语了。在说音质，感觉很不错，我老爸经常放音乐听，挺清晰的。总的来说是一次很满意的购物，性价比超级高，这个价位买到这么好的电视，我很满意。', '6208', '1', '1', '2019-03-22 00:52:51', '京东', '2019-03-22 00:52:51', '京东');
INSERT INTO `os_comment` VALUES ('76', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：因为搬家，急需电视机，(之前的老式电视机被淘汰了)在实体店与京东网店来回的逛，反复对比，无论是功能还是性价比，都一一对比过，最后在京东看中了TCL，55寸这款，大牌子值得信赖，还赶巧了，此款正在活动期间，于是果断预约，下单，购买的，当天下午6点下单，晚上就有来电确认订单情况，并预约好送货的时间以及，在此对京东的服务态度很满意，收到货后，打开非常的惊喜，整体比想象中的大，放在客厅非常的美观大方，觉得都把房子都提高了一个档次，再说说电视的本身，无论是画面的色彩还是音质上都非常的棒。金属v字形，底座很有质感，10.7毫米金属窄边设计，显得电视机更薄，4000R曲面设计，不仅是观看视界更开阔，也更立体，视觉效果非常的好，总有种置身于电影院的感觉。功能很多很全，有影视，游戏，K歌，教育，等等，满足各类人群的观看需求，特别是家里的小朋友，非常的喜欢，自己搜索动画片，还会从历史收藏中搜索观看记录，总之很满意。喜欢的亲们放心购买。哦，还得谢谢送货送货师傅，对各方面的功能以及使用都一一详细介绍，也一再交代，把盒子保存好，有任何问题及一些不会使用的电视功能都可以随时联系他，再次感谢！', '2057', '1', '1', '2019-03-22 00:52:51', '京东', '2019-03-22 00:52:51', '京东');
INSERT INTO `os_comment` VALUES ('77', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：电视17号收到的，晚上进行了暴力测试后就来晒单评价了，首先从平面选到曲面，经过多次对比最后选中了TCL这一款，搞活动价格还不错，TCL新品，京东物流还是一样正常发货很给力。家住在农村，师傅还是很热情的送到了家里挂在墙上分分钟搞定。附加100安装费 这款电视无论是在音质上还是画面的色彩上都是非常棒的，特别是画面很满意UHD+HDR，先说说外观挺漂亮，特别是10厘米金属窄边设计显得电视更薄，4000R曲率设计，不仅使观看视界更开阔，也显得人物更立体，和电影院的3D效果没两样，这是我非常满意的一点，画面清晰，色彩饱满，对比度高，不容易刺激眼睛。很喜欢自带的前置音响，减少音量的流失，有环绕立体声的感觉，在加上杜比音效，使声音更加立体，声音可以启动夜间模式，自动调节音量，不会扰民，另外蓝牙4.0完全足够了可以同时接两个蓝牙设备不卡，可以换一个语音遥控器就更完美了，（这个是不带语音遥控器的但是支持遥控器语音功能的）==未完待续 请看追加', '2566', '1', '1', '2019-03-22 00:52:51', '京东', '2019-03-22 00:52:51', '京东');
INSERT INTO `os_comment` VALUES ('78', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：在活动之前看了好多品牌的电视机，选来选去最终还是觉得Tcl电视比较好，它的曲面技术是所有电视里面最先进的。其他品牌因为不具备该高超的技术，基本不敢主打曲面电视。趁着315搞活动，毫不犹豫的选择了该款电视机。今天十分欣喜的收到电视机，迫不及待的打开，机体纤薄，但高级灰的颜色，显得优雅尊贵。其曲面弧度贴合人眼的观看习惯，不仅健康护眼，能降低视觉疲劳，再搭配上立体画质引擎，更能使画面自然鲜活，生动立体，让使用者视野更宽广、环抱感更强，画面更立体，临场感也更强烈。简直是大爱。它的声音清澈纯净，层次感强，能够让观看者感受到声音在传输过程中直射入耳的无损耗真实感，最大程度的保证音效。再加上它的大内存，与智慧型遥控，性价比极高，是一款很值得推荐使用的。以后坐在家里看电视，简直就是视觉与听觉的享受。本来计划挂在墙上，快递小哥给耐心的分析了一下墙体结构，觉得不太适合，最后选择座式贴心的给放好最佳的观看位置并讲解了一些注意事项。给快递小哥点赞！', '8237', '1', '1', '2019-03-22 00:52:51', '京东', '2019-03-22 00:52:51', '京东');
INSERT INTO `os_comment` VALUES ('79', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：近些年，家电一直在京东买，送货超快，直接入户，非常方便。 最近家里要买电视，网上搜索查看，有介绍曲面电视做的好的主要就是TCL、三星和海信这些，个人觉得TCL的曲面电视做得更为先进也更为突出。就拿它们的新品H8800系列来说吧，它率先实现了量子点版110%NTSC、其他版本96%NTSC的高色域覆盖。另外，其性.价.比也是行业中最高的，价位也绝对是行业中最为实.惠的。感觉TCL曲面就挺好的 而且是国产的 我就挺支持国货，于是就选择了这款TCL曲面电视，电视收到非常惊喜，超薄的，外观很漂亮。 表面呈现曲面状，大曲面屏幕就像一个抛物线有个焦点一样，观看有个最佳区域，在这个位置看视频就会有“与屏幕表面各个点的距离都一样”的感觉，比起一般屏幕还是有优势的。让你的眼睛可以倍感舒服，让你可以更好的享受电视生活，超级棒的一种特点！ TCL这款曲面屏电视，在曲面、色彩、清晰、声音、四大方面有着无与伦比的临场感体验，看电视的体验很不错，有种身临其境的感觉，我和家里人都挺喜欢的。', '6757', '1', '1', '2019-03-22 00:52:51', '京东', '2019-03-22 00:52:51', '京东');
INSERT INTO `os_comment` VALUES ('80', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：想象不到的清楚！曲屏看片来真爽死人！！！音色震撼！！！京东物流的快递哥！！服务态度很好！还免费安装！及时回访！！！京东杠杠的！！！！', '5215', '1', '1', '2019-03-22 00:52:51', '京东', '2019-03-22 00:52:51', '京东');
INSERT INTO `os_comment` VALUES ('81', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：电视已收到，自己装上，总体感觉很棒，样子美观，画质清晰， 很满意的一次购物，终于可以放心了。', '2998', '1', '1', '2019-03-22 00:52:52', '京东', '2019-03-22 00:52:52', '京东');
INSERT INTO `os_comment` VALUES ('82', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：性价比很高，看电视，电影很好，出了点小问题，客服很热情高效，第二天就给换了，京东值得信赖。', '7427', '1', '1', '2019-03-22 00:52:52', '京东', '2019-03-22 00:52:52', '京东');
INSERT INTO `os_comment` VALUES ('83', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f1363c2d29e247529311be1fb1d33654.jpg', '118647', '5', '使用心得：还不错吧，挺好的！还有语音功能，也挺好用的！画面也可以！', '5327', '1', '1', '2019-03-22 00:52:52', '京东', '2019-03-22 00:52:52', '京东');
INSERT INTO `os_comment` VALUES ('84', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dce44c6599841a18e18d06cb3449ea7.jpg', '118646', '5', '使用心得：此用户未填写评价内容', '9691', '1', '1', '2019-03-22 00:52:56', '京东', '2019-03-22 00:52:56', '京东');
INSERT INTO `os_comment` VALUES ('85', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：电视机性价比很高，画质优美，反应超级快屏幕几乎没有透光跟瑕疵，京东商城物流送货快，售后安装服务很及时，态度好，安装完了还教你怎么使用跟日常使用需要注意什么，挂架安装收费合理，相信京东，相信长虹大品牌，你值得拥有，电视刚刚使用，很多功能还要学习一下。反正就是一次很愉快的购物。现在还没有开通腾讯会员，等开通了会员看看4k电影体验一下极致画面！', '9657', '1', '1', '2019-03-22 00:52:59', '京东', '2019-03-22 00:52:59', '京东');
INSERT INTO `os_comment` VALUES ('86', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：D3P人工智能电视，蔷薇金的金属质感，外观确实很好看，很多朋友来家里都会夸，是一体机，边框也窄， 也是被颜值征服的。买回来事实证明，影音 也很不错，4K屏幕，海思第六代图形引擎，HDR+,点阵光控，SRS音效，基本上你能想到的最先进的电视视听技术它都包含，目前反应也很快，题主可以放心购买，求采纳。', '6028', '1', '1', '2019-03-22 00:53:00', '京东', '2019-03-22 00:53:00', '京东');
INSERT INTO `os_comment` VALUES ('87', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：选了好久的电视，决定选个画质好一点，功能强大一点的，然后就锁定了这款55D3P，虽然在同类尺寸的产品中属于稍贵的，但看中性能强大，画质好，而且做工很美。下面就来详细说一下优点和使用体验 1、首先说画质，确实非常不错，4K超高清效果很好，毕竟是这款产品的一大卖点，采用了矩阵式背光也是我欣赏的一点。检测了一下是LG的屏幕，还是挺欣慰的。 2、第二个就是性能了，性能很强大，不用多解释，这么高的配置摆在那里，A73、2G DDR4。操作起来很流畅，这个大家绝对不用担心。 3、做工很精美，一体金属边框，无缝弯折工艺很美，而且很显档次，背面介绍说采用双层背板，最外一层塑料，里面还有一层金属背板，非常不错！遥控器做工不错，还可以立着，很人性化的设计，而且时尚美观。 4、电视内容丰富。语音控制很强大，识别率很高，调闹钟啊、搜天气啊、快进后退啊、找电视剧这些都秒识别，给个赞！ 5、售后很不错，送货人员送上门，帮忙开箱验货，很认真负责。 6、希望京东承诺的200E卡准时打到账号里面哈，谢谢！', '3452', '1', '1', '2019-03-22 00:53:00', '京东', '2019-03-22 00:53:00', '京东');
INSERT INTO `os_comment` VALUES ('88', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：11月1日晚上下单，11月3日送到，这么这么大的电视竟然只有一个人来送，我只好跟快递小哥一起两个人把电视走楼梯搬到5楼，虽然对于我来说也不算什么太粗重，但服务应该可以更完善合理些吧。 75寸很大，比我家的饭桌还大，但觉得视觉上还能承受更大的尺寸，呵呵。 显示效果还不错，播放4K演示片非常清晰，接高清广电机顶盒1080I效果还可以，看足球感觉也不错，也没有太明显的拖影。 以前用的是长虹自产屏的等离子50寸，用了7年都在很好的服役，现在搬到主人房去继续使用。 漏光还是会有的，就看你自己能否接受了，液晶想没有漏光是不可能的了。 液晶的色彩就肯定比不上等离子了，但还可以接受吧，胜在够大！ 遥控是蓝牙的，好处就算怎样按都可以响应得到，但是功能就少很多了。 升级到了最新版本开机20秒左右吧，有15秒长虹的开机动画，也不算广告，对广告恶心的用户可以放心。 但是的WiFi网速很不错，wifi 5G比一般安卓盒子都稳定些，测速10M每秒以上。 自带安卓系统性能还好，也就一般般吧，非高端用户性能足够了，可以随意安装app UMAX模式挺好的，该模式下颜色跟音响都还不错 挂架孔距是60*30cm 就这么多了，支持国产！', '7519', '1', '1', '2019-03-22 00:53:00', '京东', '2019-03-22 00:53:00', '京东');
INSERT INTO `os_comment` VALUES ('89', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：送给姐姐乔迁新居的礼物，她非常喜欢。第一次在网上购买这么大的物件，最初还有点忐忑不安，综合电视机本身配置及品牌知名度最后选择从小就听说的长虹，售前客服非常耐心，不愧是这么多年的大品牌，值得信赖，做工很好。电视非常薄，听姐姐说电视上面的摇杆式物理按键相当新颖，画面非常细致，色彩亮丽，2g/16g高速内存，A73处理器，更是锦上添花。京东的配送速度也超级快，从下单到送货上门只花了一天不到的时间。非常愉快的一次购物体验，祝长虹大卖?', '6657', '1', '1', '2019-03-22 00:53:00', '京东', '2019-03-22 00:53:00', '京东');
INSERT INTO `os_comment` VALUES ('90', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：电视很好，非常满意，就是昨天刚买就开始秒杀了，想退了再买一次。另外三米多的距离有点大，把我闺女看晕了，可能刚开始还不适应。', '8411', '1', '1', '2019-03-22 00:53:00', '京东', '2019-03-22 00:53:00', '京东');
INSERT INTO `os_comment` VALUES ('91', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：性价比比较高，选了好久才决定买长虹这款，外观时尚，联网后运行速度也挺快。今天到货太晚了，准备明天上午再上墙！送货师傅也很辛苦，这么大的箱子一个人送货。非常感谢！', '4532', '1', '1', '2019-03-22 00:53:00', '京东', '2019-03-22 00:53:00', '京东');
INSERT INTO `os_comment` VALUES ('92', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：给家里老年人买的，对这款电视都很满意！长虹的UMAX功能非常好用，打开该功能可以很好的保护眼睛，看电视不会太刺眼。和实体店的长虹电视比内存更大，价格更便宜，成像效果都挺好的。家里用的50M宽带看网络电视完全不卡。还可以把手机的视频和照片投屏到电视上，很方便。为了赶在春节能看春节晚会，选择京东购买，送货很快，安装师傅服务也很好，30元的安装费，如果上墙安装费要高一些。值得推荐的一款电视。', '5784', '1', '1', '2019-03-22 00:53:00', '京东', '2019-03-22 00:53:00', '京东');
INSERT INTO `os_comment` VALUES ('93', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：心仪长虹这台平板电视很久了，65D3P，长虹品牌高端系列产品。就打算618在京东上买家电，为了在618买到合适的电视，从5月份就开始关注各个品牌的电视，海尔、海信、创维、乐视、康佳、长虹、TC L、各个品牌看了好几遍，最后目光锁定在长虹65D3P，对京东的快递点个赞。 说下感受：外观大气、精美，放在客厅就是一件艺术品，连一向眼光挑剔的老婆都赞不绝口，喜欢的不得了，而且跟我家的装修风格很搭，这是缘分，还是巧合？ 配置强悍，A73芯片唯快不破，貌似其他品牌的电视都是A53，除了长虹，还没看到过A73的芯片，而且2G运存是DDR4的，这配置在其他品牌也很少见，再过两年也不过时，我是搞机族，自然知道这些配置对系统的运行速度意味着什么，这也是我选择这台电视的主要原因。事实上，通过这两天的现场观看，打开各种应用确实接近秒开，流畅如丝般润滑，你懂得。 最后，说下安装服务，长虹售后服务人员按时到家里进行了安装，过程中现场解说各种功能如何使用，很有耐心，一直到我懂的如何', '2795', '1', '1', '2019-03-22 00:53:00', '京东', '2019-03-22 00:53:00', '京东');
INSERT INTO `os_comment` VALUES ('94', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ee4589b1afa243eea0f57efd830d7c79.jpg', '118645', '5', '使用心得：电视很清晰，用了几天才来评论，第一天看起眼不舒服，是突然画面大了，之前用机顶盒的时候老人和孩子在选择看电视很不方便，语音遥控功能特别的好，小孩可以任意换自己喜欢的动画片，儿歌。老人想看那个频道也方便，直接呼叫想看的频道，电视反应也很快，长虹电视大品牌，值得信奈，之前的电视十年了没有任何问题。所以选择了长虹。安装师傅和客服都很热情，由于智能电视连接无线WiFi，没有了外接电视频道信号，咨询客服后很耐心的告知下载了直播软件安装后国内所有电视频道都有，包括各省内频道。邻居看后也准备换一台。希望此评能给想着手的朋友有帮助。', '2041', '1', '1', '2019-03-22 00:53:00', '京东', '2019-03-22 00:53:00', '京东');
INSERT INTO `os_comment` VALUES ('95', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\c637d5e12d0b476ea71614b5b73e3543.jpg', '118644', '5', '使用心得：十一活动买的，很不错，物流超快，农村都送货上门，自己和老爸折腾了一下午才安装好的，很满意，声音，清晰度都很好，尤其是配置好，不是@高清，特意选得这款', '8398', '1', '1', '2019-03-22 00:53:03', '京东', '2019-03-22 00:53:03', '京东');
INSERT INTO `os_comment` VALUES ('96', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\c637d5e12d0b476ea71614b5b73e3543.jpg', '118644', '5', '使用心得：服务非常好', '2974', '1', '1', '2019-03-22 00:53:03', '京东', '2019-03-22 00:53:03', '京东');
INSERT INTO `os_comment` VALUES ('97', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\c637d5e12d0b476ea71614b5b73e3543.jpg', '118644', '5', '使用心得：电视没法看，一点也不清楚，这个客服只管卖，卖了有什么问题，只有一个打电话联系海信，差差差', '2184', '1', '1', '2019-03-22 00:53:03', '京东', '2019-03-22 00:53:03', '京东');
INSERT INTO `os_comment` VALUES ('98', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e34d85bfe02a44c7bad9900b092f7498.jpg', '118643', '5', '使用心得：十一活动买的，很不错，物流超快，农村都送货上门，自己和老爸折腾了一下午才安装好的，很满意，声音，清晰度都很好，尤其是配置好，不是@高清，特意选得这款', '2111', '1', '1', '2019-03-22 00:53:06', '京东', '2019-03-22 00:53:06', '京东');
INSERT INTO `os_comment` VALUES ('99', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e34d85bfe02a44c7bad9900b092f7498.jpg', '118643', '5', '使用心得：服务非常好', '2066', '1', '1', '2019-03-22 00:53:06', '京东', '2019-03-22 00:53:06', '京东');
INSERT INTO `os_comment` VALUES ('100', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e34d85bfe02a44c7bad9900b092f7498.jpg', '118643', '5', '使用心得：电视没法看，一点也不清楚，这个客服只管卖，卖了有什么问题，只有一个打电话联系海信，差差差', '3861', '1', '1', '2019-03-22 00:53:06', '京东', '2019-03-22 00:53:06', '京东');
INSERT INTO `os_comment` VALUES ('101', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：配送速度快，快递小哥很是热情。关于电视，不愧为4K百分之百色域的屏幕，显示非常清晰靓丽，买之前去过线下商场，在5千多这个价位，TCL这款产品没有对手啊。电视的外观设计也非常好看，电视也非常薄（我也不会天天跑到侧面去看电视，哈哈），全金属的材质也让电视更有质感，整体辨识度颇高。电视的功能也非常齐全，不愧为超纤薄AI电视，我可以通过语音操控电视的绝大部分操作，将多层的操作换做一句话即可。虚拟环绕声系统，还是有一些环绕声场的感觉，有需要时再买一套音箱配套吧。还有整个电视运行得非常流畅，这点非常满意，另外系统集成了腾讯视频等海量影音资源，数字电视明年都不用购买了，哈哈。归根到底，电视始终是用来“看”的，不俗的屏幕参数，画质表现细腻、清晰，色彩可以说是在该价位段的惊艳之选，这次的选择，我非常满意，推荐一个！', '4470', '1', '1', '2019-03-22 00:53:14', '京东', '2019-03-22 00:53:14', '京东');
INSERT INTO `os_comment` VALUES ('102', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：家里电视已经用了十来年，实在看不下去了，决定换个薄的。定格在55寸性价比高的大牌。开始考虑东芝想装比一下可被同事骂一顿，后来看小米，创维，酷开，海尔…一天时间看完所有，最重要就是筛选，很多两千多的不是超薄的而且塑料感太强下不了手，最后和米3S，Pk不是一体成型有螺丝厚度节能都不行，果断下单。毕竟TCL王牌电视众所周知，隔天到货就是快，因为不挂墙所有准备自己安装，安装师傅要隔天来等不了了，自己有高清数据线，链接上机顶盒，看起来就是不一样。而且自己也把电视遥控器链接上盒子可以盒子频道，音质效果也相当给力，两个字形容惊艳，客服也很好认真解答所有问题，非常满意的一次购物', '4217', '1', '1', '2019-03-22 00:53:14', '京东', '2019-03-22 00:53:14', '京东');
INSERT INTO `os_comment` VALUES ('103', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：首先感谢快递小哥周到的服务，送货到安装一气呵成，调试电视周到细心，在说一下京东快捷，28号晚10点下的订单，29号下午就已经到家，第一次在京东上买大件物品，体验超棒，支持京东！！！', '9530', '1', '1', '2019-03-22 00:53:14', '京东', '2019-03-22 00:53:14', '京东');
INSERT INTO `os_comment` VALUES ('104', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：电视机各方面都不错，底部金属散热不错，很暖，微热烫手散热性能说明不错，TCL新款，43的有点大????这是小遗憾，电视一切安好，父母看，网络功能有点鸡肋，但是网络做的不错，与?米的电视相比，开机无广告，看网络视频的话，还是有的', '2037', '1', '1', '2019-03-22 00:53:14', '京东', '2019-03-22 00:53:14', '京东');
INSERT INTO `os_comment` VALUES ('105', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：元旦当天下单，2号送到，京东配送不得不佩服 ，配送人员2号来和我一起开箱子验机器，检查屏幕联网调试，免费给安装脚架。 2号晚上预约安装挂墙，3号一早就来挂墙了，安装师傅很好。 最后来说说电视，这个时候买主要是迁入新居，TCL的电视值得信赖，这款性价比高。最重要的是我看中了它的颜值，后边面板真的是超级薄。挂上去了没法拍照了。 再说颜色，真的是不错，从左右两边看感觉可视角度比较大。2号晚上关掉所有灯，测试了下屏幕，是液晶屏，所以黑色图片下电视下边是有些白的。 电视开机很快，有语音助手，电视遥控器带电池，这点很贴心，电视无论联网还是机顶盒都是很流畅，很满意这次的购物！ 最后必须要夸一下客服，真的是有求必应，及时应答，这点必须点赞！', '1145', '1', '1', '2019-03-22 00:53:14', '京东', '2019-03-22 00:53:14', '京东');
INSERT INTO `os_comment` VALUES ('106', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：画质清晰，不卡顿，内容丰富，好多影片都可以免费观看，比如爱奇艺现在还需要会员费，这基本都可以免费观看，累死唐人街探案什么的，本来打算办个会员的，但是现在觉得不用会员也够看，担心多余了，看了好久才买的，而且还说送京东e卡100太划算。', '7233', '1', '1', '2019-03-22 00:53:14', '京东', '2019-03-22 00:53:14', '京东');
INSERT INTO `os_comment` VALUES ('107', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：大年初四，京东的送货时效依然优秀，师傅辛苦了!电视是给父母买的，客厅很大，需要大屏，价位适中即可，所以挑选了这台TCL的产品，来说说评价： 优点：1、TCL作为老牌的国产电子企业，时至今日，做工工艺确实可算优秀了，比我自己家的索尼在做工上不差，比较精细，品质感有了，确实做到了超薄； 2、软屏，面板素质不错，面板驱动电子单元表现较好，整体色彩表现符合描述和个人预期； 3、智能部分表现不错，硬件配置足够用，操作系统和语音控制单元亲测流畅，体验比较好； 4、非库存商品，18年1月底制造的，很新。 不足之处： 1、看了一段足球比赛，动态画面因为缺乏运动补偿功能，表现比较吃力，拖影明显，稳定性欠缺，很影响观看感受； 2、音效中规中矩，没有太多可说的，就是个普通电视水准吧。 整体来说，5000来块钱的价位选择这款个人还是比较满意的，性价比不错，TCL作为老牌企业已然跟上了近几年电视智能化的步伐，产品整体表现让人满意。这款电视，参考价格和综合表现，能给到78分的水平。 以上个人主观评价，全手码，供有意选购的朋友参考。', '8404', '1', '1', '2019-03-22 00:53:14', '京东', '2019-03-22 00:53:14', '京东');
INSERT INTO `os_comment` VALUES ('108', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：速度很快一天就到了，电视很时尚，很薄，样子好看，看电影很刺激，音效也棒棒的，尤其是智能化特别实用，值得购买', '5560', '1', '1', '2019-03-22 00:53:15', '京东', '2019-03-22 00:53:15', '京东');
INSERT INTO `os_comment` VALUES ('109', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：电视外观很棒，很薄配上银色边框很显档次。个人感觉音响系统不错（没用过其他牌子的平板电视）。美中不足的就是因为是50寸版本所以rom偏小，ram也不是2g版本，但整体运行效果还是很快的。自己稍微郁闷的是电视买小了买55寸的就更完美了！', '9979', '1', '1', '2019-03-22 00:53:15', '京东', '2019-03-22 00:53:15', '京东');
INSERT INTO `os_comment` VALUES ('110', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\a43bd20e50d04fe2b81be2f0f20709e7.jpg', '118642', '5', '使用心得：电视的清晰度非常不错，不过还是要取决于影片的片源。 外观的厚度也是非常薄，为了方便观察，又手机壳作为参照物，与手机壳的厚度差不多(手机是华W的P10)。 边框也是很窄的，电视嘛还是需要一些框框的，开着才有电视的感觉。 功能上嘛，毕竟刚使用，还有一些不是很了解，但遥控器语音还是不错的，比直接语音的要好用一些（这个是深有体会的，对比楼下另一台）。 色彩我个人认为挺不错的。 声音超赞超赞超赞，听音乐那感觉真的很不错，有视频的，不知道能不能听出来效果。 送货到家的，要爬6楼，给送货的师傅点个赞', '1047', '1', '1', '2019-03-22 00:53:15', '京东', '2019-03-22 00:53:15', '京东');
INSERT INTO `os_comment` VALUES ('111', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：我买这台电视的主要原因是，它叫＇子夜游侠＇外观很大气，很喜欢。其次是我是个球迷，被18年的世界杯宣传吸引住的。电视总体用着不错，三色4k真4k电视，系统流畅，在四千块钱以为算是性价比很高的了。说下不足的地方，用电信的iptv看直播不如之前的40寸的看着清晰，（要是买60寸以上的会更不清晰）还有就是聚好看里面的东西，想看的电影和电视剧好多都得需要开通企鹅会员，我花了199元包年。后来我一个朋友说他认识的人有企鹅会员卡年140元就可以包年，后来又花了140续了一年的腾讯企鹅会员。总得来说这台电视值得推荐购买的。', '9426', '1', '1', '2019-03-22 00:53:20', '京东', '2019-03-22 00:53:20', '京东');
INSERT INTO `os_comment` VALUES ('112', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：海信国内的好品牌，本来想买其他的品牌，想想还是买海信吧，快递小哥挺好的，辛苦他了！要扛到6楼！清晰度挺好的，就是一般都要会员才能看，不然就手机投屏看！机型是超薄款的，就是电视下边一圈的散热烫的厉害，不知道是不是毛病，总体都挺好的，还没安装，先自己搭了支架看看！', '6307', '1', '1', '2019-03-22 00:53:20', '京东', '2019-03-22 00:53:20', '京东');
INSERT INTO `os_comment` VALUES ('113', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：用了几天才来评价，总的来说还是不错，性价比跟其他电视比起来更划得来。这个价格也没得说。虽然我晚买几天就涨了*块。等再使用一段时间再来评价', '2719', '1', '1', '2019-03-22 00:53:20', '京东', '2019-03-22 00:53:20', '京东');
INSERT INTO `os_comment` VALUES ('114', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：我昨天订的货，今天下午就到了，看到非常完美，有大气一下就看的不一样了，有漂亮有好看，真是好，快递小哥给安装好后看的非常清楚，', '3868', '1', '1', '2019-03-22 00:53:20', '京东', '2019-03-22 00:53:20', '京东');
INSERT INTO `os_comment` VALUES ('115', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：这款海信电视机很好，很满意的一次购物，电视机画面特别清晰，语音遥控特好用，售后服务态度也很好，谢谢卖家，也谢谢快递员。', '1505', '1', '1', '2019-03-22 00:53:20', '京东', '2019-03-22 00:53:20', '京东');
INSERT INTO `os_comment` VALUES ('116', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：不错 挺好 送货快 画面清晰 声音也挺不错 师傅挺好的 甚么都是搞好的！！！', '8596', '1', '1', '2019-03-22 00:53:20', '京东', '2019-03-22 00:53:20', '京东');
INSERT INTO `os_comment` VALUES ('117', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：28号拍了一台，29号拍了一台，第一台没有音响送。第二天送了一个音响。我心里那个不平衡啊。好伤心呐！好伤心……', '7704', '1', '1', '2019-03-22 00:53:20', '京东', '2019-03-22 00:53:20', '京东');
INSERT INTO `os_comment` VALUES ('118', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：物美价廉，海信的质量值得信耐，清晰度还是不错的，好评。物流很准时，送货师傅态度很好，干活很仔细好评！', '2748', '1', '1', '2019-03-22 00:53:20', '京东', '2019-03-22 00:53:20', '京东');
INSERT INTO `os_comment` VALUES ('119', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：最**倒霉的一次网购，本人8月31日购买的此电视，物流9月1日送到我家，由于电视机较大，本人叫送物流的那个小伙子不要开箱。物流人员说公司要求非要开箱通电，通电之后试机确实没有问题，我又和物流人员合力把电视抬到无人居住的房间床上静置了一夜，期间绝对无发生任何碰撞或者移动，到第二天安装人员上门通电试机电视屏幕内屏就碎了。安装人员回复无法鉴定哪个环节出了问题，只告知外力破坏。一台外表没有任何刮痕和破损痕迹的电视机在静置一夜后内屏就碎裂了，本人现在也不知道是哪个环节出了问题。本人连续多日找到京东要求退换，京东售后给出的方案就是采销部无法处理，京东售后又叫我找厂家。厂家就说是外力破坏不属于三包范围。最后京东给出的处理方案就是我自费维修，此台电视在我家中已放置十日才有厂家联系我自费维修，本电视我是三千二百元购买的，现在维修厂家报价为二千五百五十元。这种费用全部只能作为消费者的我自己承担。网络购物维权真的太难太难。被人像皮球一样到处踢，警示后面购买此电视机的消费者，货到家后坚决不允许物流人员开箱验货，之签收外包装完好，待安装人员上门后再进行开箱验货安装。本人就当此次花钱买教训，我就是真的CL***了', '3034', '1', '1', '2019-03-22 00:53:21', '京东', '2019-03-22 00:53:21', '京东');
INSERT INTO `os_comment` VALUES ('120', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0bcbc5ba645b434ba5f4779bdecfd205.jpg', '118641', '5', '使用心得：快递小哥帮着调试好了才走，很贴心。电视也很高大上。国产品牌的崛起，真好！', '3650', '1', '1', '2019-03-22 00:53:21', '京东', '2019-03-22 00:53:21', '京东');
INSERT INTO `os_comment` VALUES ('121', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13fbe59d51af427a8bf81954e8c64f11.jpg', '118640', '5', '使用心得：还行，第二次买这个品牌的电视机了，客厅一个卧室一个。', '5503', '1', '1', '2019-03-22 00:53:28', '京东', '2019-03-22 00:53:28', '京东');
INSERT INTO `os_comment` VALUES ('122', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：性价比不错的一款飞利浦电视，之前旧机也是飞利浦，用了N年没毛病，现也买飞利浦。此机超薄边框，画质色彩都不错。动态画面稍微有拖影，但要留意看才会感觉，不影响正常观赏，到手后自己感觉色温不舒服，基本是画质设置都调了一遍，终于舒服啦?性价比之选！唯一不满的是开机硬~，这就是高性价比的代价吧。', '45', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('123', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：这是我人生第一次在苟栋的三星，而且这三星是给客服给我退的款，毕竟经营不易，但产品我不真不想想给星。首先是这个新品第一天特价抢购，第二天就以满价减百的形式降价，连申请价格保护都不行，我直接退货客服才开始紧张退回这个差价，这点我还是认同的，不过这种营销手段很恶心有没有。然后折腾完过了评论送会员的时间，当然我真不知道这存不存在的毕竟这是你们销售的手法，我就算了，但最大的问题在于产品本身，我买这款产品是参照过去飞利浦的质量来决定的，但这款产品除了便宜真找不到什么亮点，刷新率我不知道多少，但玩ps4有严重拖影，颜色表现尚可，起码比什么米的好得多，就是宽容度不够，亮的地方光灿灿一团，黑的地方黑糊糊一坨，大家可以参考视频，而且机身造工一股浓浓的组装山寨味，最令人痛心的是参数里面@的写着支持HDR,我也没期待有什么大效果就想开来过过瘾，他么的原来只是支持u盘播放视频hdr，这到底是什么鬼，这不是嘘假宣传偷换概念吗？现在把包装都扔了都退不了，真后悔没加*块钱买个大法，这钱省得糟心，这么多年苟栋的忠实客户，我也不是怎么挑剔的人，但这次购物之旅真的黑暗，这三星妥妥的送给你们。', '8906', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('124', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：对飞利浦还是有点感情的，原来家里的显像管电视基本都是飞利浦的。这次给三星的原因是：因为这款电视在人性化方面还需完善。首先，买回来是当电视机用的而不是上网用的，上网还不如用电脑呢。这机子每次开机都先是上网的界面，要看电视每次开机都要先选择信号源后选HDMI才能看电视，真的太麻烦了，这点不如某信的电视。其次，这个电视用5CM左右的胶带把边框和屏幕贴住，在安装后揭掉胶带有些胶留在屏幕上不好清除，怕划坏屏幕只好留在屏幕上。电视的功能和个性设置方面方面觉得比某信的强，这点应该肯定，电视就应该是电视而不应该是那些花里胡哨不伦不类的东西。第三，连上网络后就有广告了，时间也较长令人讨厌，这方面某信电视就有一个快速启动省略了这一阶段。第四，各种接口不在电视的边框边缘附近，由于接口较深对于挂在墙上的电视来说，插拔接线等动作一是难以看到接口二是插拔困难，极为的麻烦和不方便。小结一下主要不足：信号源无记忆保存功能，各类接口位置不在边框附近。如果以后不改进的话将不再考虑飞利浦了。', '9797', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('125', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：清晰度非常棒，找了蓝光HD1080P的样片作投屏测试，模特脸上的汗毛都看得清清楚楚，无线网络连接很方便。美中不足在刚开机黑屏时背光似乎并不均匀，另外断电后无法记忆上次关机时的信号输入源，用有线电视机顶盒每次都得重新选择HDMI信号源。', '5705', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('126', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：传统品牌，图像清晰，值得购买。', '6473', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('127', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：挑了好几款最终选择的这款 确实没失望 电视画面不错 系统一点也不卡顿 性价比很高 飞利浦老牌子还是很值得信赖的 在京东买过很多大家电了 还没遇到过什么问题 比较满意', '7831', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('128', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：今天下午刚到家就打开看上了，显示效果很好非常细腻，系统流畅反应迅速是我想要的。京东物流就是好，快！包装完好，没有破损电视就更不用说了整个就是一个好字！', '9045', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('129', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：一段时间内，买了第四台了。价格不算贵，电视质量非常好。飞利浦大品牌信得过。', '9039', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('130', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：配送人员很热情，服务态度超级好。都没找售后安装，让他们直接给我装上了。剩下的自己就搞定了。', '1526', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('131', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\ad5620d0a7404e0da42e21458f0d736f.jpg', '118638', '5', '使用心得：手机拍出来的效果不怎么好，但实际效果是很棒的，很薄，音量也很好', '415', '1', '1', '2019-03-22 00:53:45', '京东', '2019-03-22 00:53:45', '京东');
INSERT INTO `os_comment` VALUES ('132', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：创维电视的二百优穗卷：【 ynh.在线/7w 】复￥制括号内内容。到浏￥览器中￥打开领取，很不错，比较清晰的，配送服务很不错，送到家，还顺带给我装上调试好。服务很棒。', '5226', '1', '1', '2019-03-22 00:53:52', '京东', '2019-03-22 00:53:52', '京东');
INSERT INTO `os_comment` VALUES ('133', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：很不错，比较清晰的，配送服务很不错，送到家，还顺带给我装上调试好。服务很棒。', '2405', '1', '1', '2019-03-22 00:53:52', '京东', '2019-03-22 00:53:52', '京东');
INSERT INTO `os_comment` VALUES ('134', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：第一次在京东买家电，创维大品牌。看了好久，选择了创维，很多朋友都买的创维，屏幕清晰，音质好，正好客厅使用。', '2222', '1', '1', '2019-03-22 00:53:52', '京东', '2019-03-22 00:53:52', '京东');
INSERT INTO `os_comment` VALUES ('135', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：买之前选了一个月，最终选择创维，毕竟价格不错。现在用了一个周，表现不错。电脑开了共享，电脑下载，然后电视播放共享文件夹视频，真的太过瘾了，唯一不足就是只能播放mp4 格式，可能我还没有找到解决办法吧。就显示效果而言真的不错，真的是4K显示屏。', '5894', '1', '1', '2019-03-22 00:53:52', '京东', '2019-03-22 00:53:52', '京东');
INSERT INTO `os_comment` VALUES ('136', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：视频录不出效果，个人觉得颜色挺正的 创维算是电视里面的大牌子了 50寸足够大 没有找安装师傅 我爸爸自己安装的 很满意 网上买电器只相信京东自营！', '2214', '1', '1', '2019-03-22 00:53:52', '京东', '2019-03-22 00:53:52', '京东');
INSERT INTO `os_comment` VALUES ('137', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：很实用，价钱也很便宜比起那些大品牌不低啥！支持国产', '5478', '1', '1', '2019-03-22 00:53:52', '京东', '2019-03-22 00:53:52', '京东');
INSERT INTO `os_comment` VALUES ('138', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：我们这的送货师傅超级好，很喜欢他新搬来的小区他很负责家店送货，提前电话预约好时间不耽误事情，自己联系厂家派人来上门安装，挂墙100元包括打洞，可以连无线网直接播放，退出儿童页面出现算术题，懵了', '4915', '1', '1', '2019-03-22 00:53:52', '京东', '2019-03-22 00:53:52', '京东');
INSERT INTO `os_comment` VALUES ('139', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：试用了2天才评价，接电脑电视都挺好。感觉放1080P效果很好。这个价位还是挺值的。', '5031', '1', '1', '2019-03-22 00:53:52', '京东', '2019-03-22 00:53:52', '京东');
INSERT INTO `os_comment` VALUES ('140', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：不错。有线无线都支持，手机能当遥控器，语音搜索，不过这搜索太弱鸡了。手机电脑支持DLNA投屏镜像啥的，但是不是所有本地视频投到电视都播放正常，有些声音视频不能解码。总的来说，认为很不错的', '8234', '1', '1', '2019-03-22 00:53:53', '京东', '2019-03-22 00:53:53', '京东');
INSERT INTO `os_comment` VALUES ('141', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\22e658e4db8f467aaae7d6d2d8cba92c.jpg', '118637', '5', '使用心得：电视收到了，哇！比想象中的大多了，要是买个50 寸的就好了，清晰度挺好的，等看一段时间再来评价吧。', '4380', '1', '1', '2019-03-22 00:53:53', '京东', '2019-03-22 00:53:53', '京东');
INSERT INTO `os_comment` VALUES ('142', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：家里这些年用的一直都是长虹电视，质量好，效果佳。这次装修了自己的家，买电视前爸妈专门叮嘱我一定要买长虹品牌。这款电视是新款，超级超级薄，性价比超高，在实体店逛了几天，可以说这个款式完胜其他各种品牌。视觉冲击感很强，音响效果也是棒棒哒！内置服务也都很到位。非常非常满意。客服态度非常好，问了不少问题也都得到了充分的解答。总之是一次完美的购物体验，感谢长虹。', '7323', '1', '1', '2019-03-22 00:53:59', '京东', '2019-03-22 00:53:59', '京东');
INSERT INTO `os_comment` VALUES ('143', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：各大实体店多方考核，本来是准备买海信的，连型号都已经选好了，就等着3.15拍了。但是最终还是选了长虹，毕竟是老品牌了，从内心里还是比较信赖的。而且这款是新款，功能满意，价格也很合适。到货后，果然没有让我失望，画质清晰，音效也很棒，特别是它的UMAX功能，太棒了。有电影院的效果哦。还有电视真的很薄，和我的三星手机一样薄。还在观望的朋友们可以下手了，性价比还是可以的。我的决定还是没有错，值得购买。', '8001', '1', '1', '2019-03-22 00:53:59', '京东', '2019-03-22 00:53:59', '京东');
INSERT INTO `os_comment` VALUES ('144', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：用了两天才来评价，长虹大品牌值得信赖，军工品质保证，55D6Ｐ新品，A73架构64核处理器，2G的DDR4内存，性能强劲，16G存储空间够大，定制系统稳定，速度快,无广告超赞?，全面屏178广角，色彩广域，运动补偿，还有UMAX观影，效果出众，体验到位！音效不错，杜比环绕，模式丰富，蓝牙语音遥控，操作自由自在，对比海信、创维、tcl选中 长虹，性价比出众。', '9699', '1', '1', '2019-03-22 00:53:59', '京东', '2019-03-22 00:53:59', '京东');
INSERT INTO `os_comment` VALUES ('145', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：到货快，画质清晰，音质不错', '3922', '1', '1', '2019-03-22 00:53:59', '京东', '2019-03-22 00:53:59', '京东');
INSERT INTO `os_comment` VALUES ('146', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：第一次网上购买家电，选了好久。最后选择了国产长虹。55寸超薄外观挺大气。送货超级快。拍下两天就给送来了。电视机效果清晰，音质好没有漏光，语音功能非常强大。京东客服态度很好。由于我家新房还没入住，等搬家入住再来追加评价。55d6p比想像中的要好很多', '3181', '1', '1', '2019-03-22 00:53:59', '京东', '2019-03-22 00:53:59', '京东');
INSERT INTO `os_comment` VALUES ('147', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：电视确实比较薄，画面质量清晰，开机速度非常快，最关键的是开机么有广告。接口方面只有两个u**接口，两个hdmi接口，一个天线，一个同轴音频接口。接口偏少，关键是没有模拟音频接口，老音箱必须买转接器才行。开机后应用安装方便便捷，屏幕画质饱满，memc功能么有发现哪里设置。准备看速度与激情测试下。屏幕为软屏，不知道厂家，基本各项功能符合预期。', '1012', '1', '1', '2019-03-22 00:54:00', '京东', '2019-03-22 00:54:00', '京东');
INSERT INTO `os_comment` VALUES ('148', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：多次逛实体店，锁定了长虹的q5k，就是价格太贵，无意中浏览京东发现了d6p，虽然是网络型号，但配置不低，应该是海思芯片，cpu是双核A73,但gpu是mail450稍低，不过视频播放足够了，电视外形不错，超薄，连续播放5个多小时，机器后背只是下部稍热，上部分还是冰凉。通过播放测试片，可以看出，虽然是软屏，但显示效果不错，开启UMAX模式后，色彩更好，更真实，声音清晰，不浑浊，而且硬件视频解码能力不错，60M码率的烤鸭视频也能顺利播放，通过防抖测试视频可以看出，防抖能力不错，最惊喜的是播放 H265，10bit，HDR，2160P，杜比5.1，大小5G的普罗米修斯视频，电视能自动识别出杜比和HDR，这点同长虹实体店的q5k，q5n是基本一致的，这点要比其他品牌强。语音识别准确率很高，确实给老人小孩使用电视提供了方便，还可以通过U盘安装软件。总之，以不足4千的价格能买到这样的产品，值了，长虹值得信任。', '4270', '1', '1', '2019-03-22 00:54:00', '京东', '2019-03-22 00:54:00', '京东');
INSERT INTO `os_comment` VALUES ('149', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：嗯，第一个收到货速度很快，我26号下午下的单，27号上午就收到货了，然后呢，就是打开包裝感觉也很大气，小孩子也很喜欢。第二个，电视机的画质非常细腻，效果也很好，然后大气吧，感觉就是跟看电影一样，还有就是开启UMAX确实效果不同，但是说实话，如果说是跟那独立低音炮来比，还是说有种欠缺这个也能理解，第三个就是安装，刚开始安装，师傅还是感觉蛮好，但是后面呢说实话就不敢苟同，非常的不爽，原来我有一个电视机挂架，也是长虹的，当然在之前我也了解过，如果是我现在买的电视机用不上，就出錢裝新架子，100元我也同意，后来他就把那个旧的架子拆下来，刚开始他是说要收费，我就说这个很简单，就四个螺丝拧下来，他也同意帮忙，就不收费了，我当时蛮心中感謝他，用了一块铁片挂架把电视机装上去，下面是用一砣发泡板把他頂起来（实际挂架是要两块铁片上下把电视机拖起来，才能垂直稳固的）后面直接导致就是不垂直是斜的，而且电视机直接压到电源线，還说沒关系，我打电话让他回来，重新弄，好了以后，我收拾现场的时候，发现旧的的挂架又没了，我就想，是不是师傅順走了，打电话过去，结果真是他顺走了，我让他还回來！真是一次不開心的过程', '9750', '1', '1', '2019-03-22 00:54:00', '京东', '2019-03-22 00:54:00', '京东');
INSERT INTO `os_comment` VALUES ('150', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：选电视选了很长时间，趁3.15活动，在网上正好瞅见这款，商场导购也一直向我们推荐长虹的电视，所以趁活动果断出手。货到后，迫不及待的连上网看，画面清晰、自然，安装方便快捷，以后每天回家都有电视看了。', '2025', '1', '1', '2019-03-22 00:54:00', '京东', '2019-03-22 00:54:00', '京东');
INSERT INTO `os_comment` VALUES ('151', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\f35e250bb88945419801553439427da4.jpg', '118636', '5', '使用心得：京东快递没的说，隔天就到了，还专门检验能用才走的。自己安装了脚架，超级简单的啊。。。。。。自己设置的电视，感觉自己棒棒哒，哈哈。电视清晰度还是不错，很考验视频的质量，价位在这，不能和上万的电视比，性价比不错。语音识别很灵敏，不过这个语音K歌的时候有延迟啊，延迟至少2秒，不知道怎么回事啊，是技术不成熟吗？投屏也很好用，苹果手机直接就能投，不过看B占上的视频不流畅，优酷的就还好，这是怎么回事……后续还有什么发现到时候再来追评', '6433', '1', '1', '2019-03-22 00:54:00', '京东', '2019-03-22 00:54:00', '京东');
INSERT INTO `os_comment` VALUES ('152', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\7a73754f6eac44ae84f30b3a27094270.jpg', '118635', '5', '使用心得：电视收到了安装后效果还不错，开机启动速度很快，不错的购物，赞一个', '6125', '1', '1', '2019-03-22 00:54:08', '京东', '2019-03-22 00:54:08', '京东');
INSERT INTO `os_comment` VALUES ('153', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\cab561e55862404d945d445f3517b5af.jpg', '95157', '5', '使用心得：不错的选择，媳妇很喜欢，款式质量都很好，数字也刚好符合今天女王节的哦', '6825', '1', '1', '2019-03-22 00:54:10', '京东', '2019-03-22 00:54:10', '京东');
INSERT INTO `os_comment` VALUES ('154', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：很好，送货速度很快，机子也很漂亮，赞一个', '3340', '1', '1', '2019-03-22 00:54:21', '京东', '2019-03-22 00:54:21', '京东');
INSERT INTO `os_comment` VALUES ('155', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：很不错的电视，价廉物美，对得起这个价格，满足一般消费者需求，要求高的另当别论', '1620', '1', '1', '2019-03-22 00:54:22', '京东', '2019-03-22 00:54:22', '京东');
INSERT INTO `os_comment` VALUES ('156', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：电视尺寸很大，65寸的果然够霸气！客厅本身还算可以的，这个电视买之前还担心会不会太大了，安装好后电视柜刚刚好，不错！电视图像颜色鲜艳，显示屏不错的，而且一点都不卡，ddr4果然是不错，智能电视依然相信老品牌康佳，赞一个！', '5119', '1', '1', '2019-03-22 00:54:22', '京东', '2019-03-22 00:54:22', '京东');
INSERT INTO `os_comment` VALUES ('157', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：9月28号预定的，5号到货，昨天刚安装好。显示很清晰，看电影超爽。康佳老品牌就是棒棒哒，好几个亲戚过来说好好，等用段时间质量没有问题，他们也想买。希望品质棒棒哒，用段时间再加追评。', '6348', '1', '1', '2019-03-22 00:54:22', '京东', '2019-03-22 00:54:22', '京东');
INSERT INTO `os_comment` VALUES ('158', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：6号买的7号安装，物流很快，电视外观简单大方，边框很小，挂墙显得大气，试播一下图像清晰，反应灵敏，是个不错的机子，主要是看中LG硬屏，音质也很好的。安装好网络，再来追评', '929', '1', '1', '2019-03-22 00:54:22', '京东', '2019-03-22 00:54:22', '京东');
INSERT INTO `os_comment` VALUES ('159', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：物流速度真的每次都还是很满意的，而且康佳品牌的质量也是值得信赖的。', '1401', '1', '1', '2019-03-22 00:54:22', '京东', '2019-03-22 00:54:22', '京东');
INSERT INTO `os_comment` VALUES ('160', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：电视还不错，安装没有网络，特意下载了两个视频，使用u盘播放，暂未发现漏光问题', '1583', '1', '1', '2019-03-22 00:54:22', '京东', '2019-03-22 00:54:22', '京东');
INSERT INTO `os_comment` VALUES ('161', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：电视还可以，物流太慢，重要的事情说三遍，，物流太慢，太慢物流，物流太慢', '7602', '1', '1', '2019-03-22 00:54:22', '京东', '2019-03-22 00:54:22', '京东');
INSERT INTO `os_comment` VALUES ('162', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：电视很好。很高端，音质不错', '5376', '1', '1', '2019-03-22 00:54:22', '京东', '2019-03-22 00:54:22', '京东');
INSERT INTO `os_comment` VALUES ('163', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\b61cfe1443c64890b512108f436fa98d.jpg', '118634', '5', '使用心得：比TCL好多了，康佳电视好', '8553', '1', '1', '2019-03-22 00:54:22', '京东', '2019-03-22 00:54:22', '京东');
INSERT INTO `os_comment` VALUES ('164', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\6f28749217e34a60b0bdb4658b08e335.jpg', '118633', '5', '使用心得：电视很好，物流也快，顺丰给送来的，服务也很好', '1269', '1', '1', '2019-03-22 00:54:34', '京东', '2019-03-22 00:54:34', '京东');
INSERT INTO `os_comment` VALUES ('165', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fef964fc907842e3878547db9c227cc2.jpg', '95151', '5', '使用心得：帽子很好质量也好带着好看', '3531', '1', '1', '2019-03-22 00:54:41', '京东', '2019-03-22 00:54:41', '京东');
INSERT INTO `os_comment` VALUES ('166', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\e5afe330ef984ade959c765d04a67208.jpg', '95150', '5', '使用心得：跟样品沒差别，以后还来买，谢谢厂家。', '21', '1', '1', '2019-03-22 00:54:46', '京东', '2019-03-22 00:54:46', '京东');
INSERT INTO `os_comment` VALUES ('167', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：25号0点下的单，27号就到了，我家在6楼，京东的快递小哥就是给力，上楼已经汗流夹背了，由衷的感谢！还帮我打开包装，通电试机，再一次谢谢快递小哥！下面我来说说电视，我买的这款是影院系列，无论是在音质上，还是画面的色彩上都非常棒。首先说说外观挺漂亮，，特别是10厘米金属窄边设计，显得电视更薄，4000R曲面设计，不仅使观看视界更开阔，也许人物更立体，有一些电影院的3d效果，这个特点我非常喜欢。画面清晰。色彩饱满。对比度高，不刺激眼球。非常喜欢自带的前置音响。前置音响的特点是，减少，音量的流失。声音清楚杂音。有环绕立体声的感觉。加上杜音效。使声音更加立体。特别提出，音量可以启用，夜间模式，自动调节音量，不会扰民，另外，蓝牙单独，两个可以关闭屏幕。可以播放手机音乐，享受音乐带来的恬静，开机速度非常，真快，大约20秒左右。这款电视人工智能。想看什么台直接对电视说就可以了，特别适合老年人。遥控器的设计简洁大方，使用方便。另外还有一个功能是内置设视频播放丰富的资源，可以选择，种类繁多。自带教育资源内容，也很丰富。可以，为孩子，学习成长提供便利的条件。自带的是K歌软件，实现了在家卡拉ok，客服态度好', '5745', '1', '1', '2019-03-22 00:54:46', '京东', '2019-03-22 00:54:46', '京东');
INSERT INTO `os_comment` VALUES ('168', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：选购过程:因小孩打碎了原有电视，开始关注所有国产品牌，选了一些备选机型，也去了实体店，甚至个人经销商，要么配置不符合我要求，要么价格达不到心里预期，最后定下这款，付款后删掉购物车十几种机型。 使用:自带软件比想像的多不少，满足基本需求;合适片源，清晰度不错;音质比之前的电视好;速度比较块，希望以后也一样。 购物插曲:下单是双11凌晨4点多下单，然后醒来降价了100元，也不能保价，后来联系客服，成功保价。 不足:使用语音控制没成功，是不是方法不对？有空好好研究下。', '6658', '1', '1', '2019-03-22 00:54:46', '京东', '2019-03-22 00:54:46', '京东');
INSERT INTO `os_comment` VALUES ('169', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：我是双11买的，专门预约到18日收货，快递老师傅给力，开箱验收，并插电测试后才要求签单，完美屏，不花不漏光，音响效果不错。第一台曲屏电视，客厅放台55寸的就可以了，语音摇控要先对码，对好后就要看你普通话的标准度了，，，三生三世，3344??，有些功能还需要在使用中去发现，以后再做评价，TCL电视值得拥有。', '3964', '1', '1', '2019-03-22 00:54:46', '京东', '2019-03-22 00:54:46', '京东');
INSERT INTO `os_comment` VALUES ('170', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：买电子产品还是首选京东，经常在京东买电子产品，从没有失望过，这次，在京东买的电视的体验也是非常好！快递，速度非常快，虽然是双11买的，但是12号就送到了！师傅们坚持在12号的晚上送到家里了，感谢！安装非常简单，因为不需要挂在墙上，所以老公自己弄好了。可以看网络电视，也可以看直播信号，不管是老人看电视还是孩子看动画片，无论是音质还是画面都非常棒！看看我拍的视频吧', '9205', '1', '1', '2019-03-22 00:54:46', '京东', '2019-03-22 00:54:46', '京东');
INSERT INTO `os_comment` VALUES ('171', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：电话好大，京东送货就是快，送货师傅很给力，六楼直接背上来了，由于网线还没接，现在网络还不知道，但是，已经试用了蓝牙关屏听歌功能，非常人性化的功能，等网络连接好了，再来追评', '193', '1', '1', '2019-03-22 00:54:46', '京东', '2019-03-22 00:54:46', '京东');
INSERT INTO `os_comment` VALUES ('172', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：这款电视到手价比较划算，外观漂亮包装完好，安装人员的服务也是非常好的！值得拥有，用一段时间再评价！', '7129', '1', '1', '2019-03-22 00:54:47', '京东', '2019-03-22 00:54:47', '京东');
INSERT INTO `os_comment` VALUES ('173', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：买回来有几天了，一直忙没来得及评价，电视看起来太爽了，电视超大，送快递小哥服务特别好，帮我开箱验货！感谢京东的服务！', '3335', '1', '1', '2019-03-22 00:54:47', '京东', '2019-03-22 00:54:47', '京东');
INSERT INTO `os_comment` VALUES ('174', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：物流给力，当天下单，当天就送到了，快递员也热情，开箱检查，由于工作时间我没时间安装，所以预约今天早上，今天早上一早师傅就来了，安装很快，电视初步体验还是不错，没网只能开机看看界面，安装师傅带有U盘给测试了下。就是不知道后期使用咋样，期待搬进新房使用效果', '6956', '1', '1', '2019-03-22 00:54:47', '京东', '2019-03-22 00:54:47', '京东');
INSERT INTO `os_comment` VALUES ('175', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：买了几天两台，，55和49各一台， 1.55轻漏光，中间偏右，其他地方还好，主要就是晚上，不开灯看电影有点难受，强迫症，黑色的时候比较明显，其他地方还好，曲面有个不好，看的时候偏右就左边泛白，偏左右边白，轻微，但是垂直看泛白就严重，只是单纯测试，但是有点瑕疵不舒服，49的就很完美，检测软件在4k显示比较模糊，我自己下载4k视频了播放不了，自带软件播放感觉一般。没有5g可惜。 2.语音功能不要指望太多，有的资源还好，没有就鸡肋，启动个第三方程序就多次失败，因为必须全称，有英文字母也得念对，搜索不想打字也不能语音输入， 3.软件商城，软件太少启动必有广告，如果下载其他商场，只能下载不能安装，还说安全考虑，可以正常电脑下载U盘安装，这逻辑13b不，我也服了客服了， 4.前面说了一堆问题，说说我唯一惊喜得把，多屏互动，虽然不是表面意思的，共享屏幕，但是无线安装很好用，手机下载安装包，无线推送安装，很方便，需要在一个无线网下才行，但是很易用，我很多软件就是这样安装的。除此之外就是能当个遥控器。', '6175', '1', '1', '2019-03-22 00:54:47', '京东', '2019-03-22 00:54:47', '京东');
INSERT INTO `os_comment` VALUES ('176', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\fe0a041a3b4f493bb9bfea35eaae0c6a.jpg', '118632', '5', '使用心得：6月18号是促销活动，在实体店对比了好几款同类品牌，一开始对三星比较感兴趣，经过两天的了解，感觉这两个品牌还是TCL这个品牌比其他好一些，最后决定买TCL，性价比高，操作简单，外观高大上，有夜间声音模式，声控播放很赞。无论是机型外观，都非常满意。 2017年6月22日11点26分提交订单，最让我欣慰的是京东的服务态度太好，2017年6月23日，一上班服务人员就打电话给我，他们的热情服务令我非常满意，热情到位。 25号下午货就收到了，送货人员送货上门机器完好无损，直接把电视送到了4楼家中，很热情，收货，当场开箱验货，还帮我把电视底座装好，服务很好。 通过几天了解和体验，感觉非常好，前置音响声音听起来很舒服，声音立体感也不错！开机速度很快，连接网络也挺给力一点都不卡，操作起来很便捷易懂不繁琐！功能很强大，首先速度快，画面清晣，外观大气，功能非常全，该有的功能全有了，主要是观看时色彩很好，看多久眼睛都不会累，而且音质非常捧，名副其实的正品，在同样的配置价格很优势，第一次在京东上买电视，原来很担心质量问题，现在放心了，下次还在京东买东西。非常愉快的一次购物，网上买家电首选京东，发货还是挺快的。', '1847', '1', '1', '2019-03-22 00:54:47', '京东', '2019-03-22 00:54:47', '京东');
INSERT INTO `os_comment` VALUES ('177', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\0dece22fea8041c5a80aec0ac1a86f43.jpg', '95149', '5', '使用心得：此用户未填写评价内容', '6482', '1', '1', '2019-03-22 00:54:50', '京东', '2019-03-22 00:54:50', '京东');
INSERT INTO `os_comment` VALUES ('178', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\3e9d529b28cc4388a6cb98d5a4b959a7.jpg', '95148', '5', '使用心得：没有图片片好看', '8881', '1', '1', '2019-03-22 00:54:54', '京东', '2019-03-22 00:54:54', '京东');
INSERT INTO `os_comment` VALUES ('179', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：创维电视的二百优穗卷：【 ynh.在线/7w 】复￥制括号内内容。到浏￥览器中￥打开领取，很不错，比较清晰的，配送服务很不错，送到家，还顺带给我装上调试好。服务很棒。', '6787', '1', '1', '2019-03-22 00:54:59', '京东', '2019-03-22 00:54:59', '京东');
INSERT INTO `os_comment` VALUES ('180', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：很不错，比较清晰的，配送服务很不错，送到家，还顺带给我装上调试好。服务很棒。', '9717', '1', '1', '2019-03-22 00:54:59', '京东', '2019-03-22 00:54:59', '京东');
INSERT INTO `os_comment` VALUES ('181', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：第一次在京东买家电，创维大品牌。看了好久，选择了创维，很多朋友都买的创维，屏幕清晰，音质好，正好客厅使用。', '6254', '1', '1', '2019-03-22 00:55:00', '京东', '2019-03-22 00:55:00', '京东');
INSERT INTO `os_comment` VALUES ('182', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：买之前选了一个月，最终选择创维，毕竟价格不错。现在用了一个周，表现不错。电脑开了共享，电脑下载，然后电视播放共享文件夹视频，真的太过瘾了，唯一不足就是只能播放mp4 格式，可能我还没有找到解决办法吧。就显示效果而言真的不错，真的是4K显示屏。', '5491', '1', '1', '2019-03-22 00:55:00', '京东', '2019-03-22 00:55:00', '京东');
INSERT INTO `os_comment` VALUES ('183', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：视频录不出效果，个人觉得颜色挺正的 创维算是电视里面的大牌子了 50寸足够大 没有找安装师傅 我爸爸自己安装的 很满意 网上买电器只相信京东自营！', '2784', '1', '1', '2019-03-22 00:55:00', '京东', '2019-03-22 00:55:00', '京东');
INSERT INTO `os_comment` VALUES ('184', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：很实用，价钱也很便宜比起那些大品牌不低啥！支持国产', '646', '1', '1', '2019-03-22 00:55:00', '京东', '2019-03-22 00:55:00', '京东');
INSERT INTO `os_comment` VALUES ('185', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：我们这的送货师傅超级好，很喜欢他新搬来的小区他很负责家店送货，提前电话预约好时间不耽误事情，自己联系厂家派人来上门安装，挂墙100元包括打洞，可以连无线网直接播放，退出儿童页面出现算术题，懵了', '8223', '1', '1', '2019-03-22 00:55:00', '京东', '2019-03-22 00:55:00', '京东');
INSERT INTO `os_comment` VALUES ('186', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：试用了2天才评价，接电脑电视都挺好。感觉放1080P效果很好。这个价位还是挺值的。', '591', '1', '1', '2019-03-22 00:55:00', '京东', '2019-03-22 00:55:00', '京东');
INSERT INTO `os_comment` VALUES ('187', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：不错。有线无线都支持，手机能当遥控器，语音搜索，不过这搜索太弱鸡了。手机电脑支持DLNA投屏镜像啥的，但是不是所有本地视频投到电视都播放正常，有些声音视频不能解码。总的来说，认为很不错的', '1550', '1', '1', '2019-03-22 00:55:00', '京东', '2019-03-22 00:55:00', '京东');
INSERT INTO `os_comment` VALUES ('188', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\583531def6de414289312fcbf776ab54.jpg', '118631', '5', '使用心得：电视收到了，哇！比想象中的大多了，要是买个50 寸的就好了，清晰度挺好的，等看一段时间再来评价吧。', '2450', '1', '1', '2019-03-22 00:55:00', '京东', '2019-03-22 00:55:00', '京东');
INSERT INTO `os_comment` VALUES ('189', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：小米好东西，电视的速度很快，比两年前买的百度盒子快多了，优惠一百后买的，不错', '2503', '1', '1', '2019-03-22 00:55:11', '京东', '2019-03-22 00:55:11', '京东');
INSERT INTO `os_comment` VALUES ('190', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：第一次买小米电视，很好，很薄，人工智能反应很快，就是怕电视以后散热不行，以后再补充吧', '4593', '1', '1', '2019-03-22 00:55:11', '京东', '2019-03-22 00:55:11', '京东');
INSERT INTO `os_comment` VALUES ('191', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：确实很惊艳，真的太薄了，比手机还薄，帅！！', '3461', '1', '1', '2019-03-22 00:55:11', '京东', '2019-03-22 00:55:11', '京东');
INSERT INTO `os_comment` VALUES ('192', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：第一次买那么大的电视！之前家里是32寸的电视用了好几年，分辨率还是古董的1366x768，这次直接升级50寸4K，感觉太震撼了，看啥都爽！语音也很方便，还挺准确的哈哈。和自己之前的21.5寸显示器对比看就知道多大了！用过小米盒子很好上手。就是有广告不太爽，不过听说现在的互联网电视都有广告了……', '1863', '1', '1', '2019-03-22 00:55:11', '京东', '2019-03-22 00:55:11', '京东');
INSERT INTO `os_comment` VALUES ('193', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：发货速度很快，昨天下午下单今天下午就到了，不过不是京东物流，但是送货师傅也挺好，提前二十分钟打电话联系，还给搬到了家里。电视感觉不错，效果挺好的，还没有列入网络，看的是广电的，感觉挺好。', '5877', '1', '1', '2019-03-22 00:55:11', '京东', '2019-03-22 00:55:11', '京东');
INSERT INTO `os_comment` VALUES ('194', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：京东农村也送货上门不错，反应挺快的，一千块钱值了。', '2530', '1', '1', '2019-03-22 00:55:12', '京东', '2019-03-22 00:55:12', '京东');
INSERT INTO `os_comment` VALUES ('195', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：电视很好很强大，语音功能很使用，确实很薄，薄的移动都需要小心翼翼，屏很不错显示也很高清，总之高端大气上档次。', '8042', '1', '1', '2019-03-22 00:55:12', '京东', '2019-03-22 00:55:12', '京东');
INSERT INTO `os_comment` VALUES ('196', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：小米电视果然没让我失望，嗯非常薄，外观大气挂在墙上，很配我的客厅', '2890', '1', '1', '2019-03-22 00:55:12', '京东', '2019-03-22 00:55:12', '京东');
INSERT INTO `os_comment` VALUES ('197', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：真的是弯的，23333，送货师傅态度挺好的，就是小米安装费有点贵，挂架太垃圾了，还不如四五十的收费九十九，安装费100，电视节目比乐视多许多。', '7650', '1', '1', '2019-03-22 00:55:12', '京东', '2019-03-22 00:55:12', '京东');
INSERT INTO `os_comment` VALUES ('198', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9dd07a32e88c4a7295dd405d7c3e6036.jpg', '118630', '5', '使用心得：不错????好评', '7034', '1', '1', '2019-03-22 00:55:12', '京东', '2019-03-22 00:55:12', '京东');
INSERT INTO `os_comment` VALUES ('199', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：反应速度有点慢，但绝对对得起这个价格，做工用料嘛，这个价位还要什么自行车？色彩还算不错的，声音嘛，图个响说是了，参数是全高清的，没去测试。总的一句，对得起这个价格 要说不满意的，是它的底座是要上镙丝的，遥控连个电池也没有，这点钱确实不应该省的', '2001', '1', '1', '2019-03-22 00:55:22', '京东', '2019-03-22 00:55:22', '京东');
INSERT INTO `os_comment` VALUES ('200', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：商品物超所值，看高清720p很顺畅，差不多用两天了，性能哒哒滴。', '8234', '1', '1', '2019-03-22 00:55:22', '京东', '2019-03-22 00:55:22', '京东');
INSERT INTO `os_comment` VALUES ('201', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：一直以来,家电都是网购,这次到海南琼海买家电也选择网购,1月26曰下单,2月3日货到,自已安装,开机后发现屏幕右边出现6.5公分竖向条纹,4日上午要求换货,6日京东派维修人员上门检测,鉴定为屏裂,后同意换货,承诺8日送货上门,因已人约定7日一早环鸟游3天,9日晚返回,10日中午送货到家.守信,重承诺,以后买家电还选京东.唯一不满的是送货速度较慢.', '924', '1', '1', '2019-03-22 00:55:22', '京东', '2019-03-22 00:55:22', '京东');
INSERT INTO `os_comment` VALUES ('202', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：很不错买给家里爸妈平时看看电视，外观时尚大气，超做简单易懂，对于老人家来说非常好。京东物流速度快，农村一样送货上门，还单面让通电检查机器，非常满意', '5225', '1', '1', '2019-03-22 00:55:22', '京东', '2019-03-22 00:55:22', '京东');
INSERT INTO `os_comment` VALUES ('203', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：看到好几天电视质量很好满意一次购物', '3493', '1', '1', '2019-03-22 00:55:22', '京东', '2019-03-22 00:55:22', '京东');
INSERT INTO `os_comment` VALUES ('204', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：京东配送还挺快，第一天下单第二天上午就送到了，虽然出了一点小差错，他们处理的响应速度很快，电视剧挺好的，以前的几个都是康佳的，质量很好，这次是给老人买的，操作也不算麻烦，老人要看电视台直播节目，装了第三方直播软件后老人也很方便操作，电视机用wifi连接时的响应速度也可以，插网线的话可能更好，这个可能跟网速有关系吧，屏幕的清晰度也可以，机器本身自带的应用也很好，沙发管家，特别是易互动，可以直接把手机上的东西投影到电视上，真的很方便。内存还足可以安装几个应用软件。下次如果还要买的话还考虑买康佳的。', '158', '1', '1', '2019-03-22 00:55:22', '京东', '2019-03-22 00:55:22', '京东');
INSERT INTO `os_comment` VALUES ('205', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：快递迷路，需要人去接，放下就走了不管安装，还放倒了，安装个底座还要付费，报修了两次，都说不是他们的问题是信号问题，但是本地U盘播放也不是很清晰，给爷爷奶奶买的，凑合着看吧', '4396', '1', '1', '2019-03-22 00:55:22', '京东', '2019-03-22 00:55:22', '京东');
INSERT INTO `os_comment` VALUES ('206', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：送货挺快的，已经安装好了，声音不错，分辨率还可以，安装了几个常用的看视频的软件，内存稍微小了点，不过也够用了，反应也还可以，这个价位性价比还算行！', '1777', '1', '1', '2019-03-22 00:55:22', '京东', '2019-03-22 00:55:22', '京东');
INSERT INTO `os_comment` VALUES ('207', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：电视机非常清晰质量很好就是语音功能不知道用！京东快递很负责任晚上十点多还给我送货小哥辛苦了', '2961', '1', '1', '2019-03-22 00:55:23', '京东', '2019-03-22 00:55:23', '京东');
INSERT INTO `os_comment` VALUES ('208', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9386ba560841474f99f339e3121e01eb.jpg', '118629', '5', '使用心得：电视很不错，安装师傅也很负责。', '7331', '1', '1', '2019-03-22 00:55:23', '京东', '2019-03-22 00:55:23', '京东');
INSERT INTO `os_comment` VALUES ('209', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：家里电视已经用了十来年，实在看不下去了，决定换个薄的。定格在55寸性价比高的大牌。开始考虑东芝想装比一下可被同事骂一顿，后来看小米，创维，酷开，海尔…一天时间看完所有，最重要就是筛选，很多两千多的不是超薄的而且塑料感太强下不了手，最后和米3S，Pk不是一体成型有螺丝厚度节能都不行，果断下单。毕竟TCL王牌电视众所周知，隔天到货就是快，因为不挂墙所有准备自己安装，安装师傅要隔天来等不了了，自己有高清数据线，链接上机顶盒，看起来就是不一样。而且自己也把电视遥控器链接上盒子可以盒子频道，音质效果也相当给力，两个字形容惊艳，客服也很好认真解答所有问题，非常满意的一次购物', '6271', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('210', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：今天终于安装上宽带，电视可以看啦。已经买到一周，但一直因为没有网络而不能使用，着急，哈哈。 分享一下使用情况，给各位心动的小伙伴参考下: 1，功能上真的是非常实用以及智能了。收货后发现遥控器好像是蓝牙的，比红外的信号好很多。另外人工智能也非常好识别，语音切换很流畅。 2，外观看起来银灰色更加有质感，比家里之前的黑色电视漂亮很多，颜值高，哈哈。 3，画质方面试了下播放自带软件里的4K，很清晰，画面很好。不过片源不是很多。 4，音质的话，反正我觉得音响设备非常棒，音量在白天调到时就足够用了。当然，家里如果有老人，个人觉得十五也足够了。 5，最重要的一个优点:开机无广告。开机广告厂家会很赚，但是显然TCL会为客户着想，没有为了利益牺牲客户的舒适度。 准备用一段时间看看后，给爸妈也买一台。', '8749', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('211', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：新房装修好了快一个多月了，就缺个电视机没有买，线下去了 实体店去看，当时觉得海信的电视不错，但是性价比不高，也没有什么力度大的活动。这次刚好赶上了双十一，京东活动力度很大，电器也在京东买过几次，都挺好的。因为老家就买了一台TCL的电视，看了十多年，还依然坚挺，索性电视就选择了TCL的，放弃了海信。相对来说TCL的电视性价比绝对的高，价格也合理！主要是薄啊，4K超高清屏幕，还有人工智能语音，国货当自强！电视第二天送到才预约安装，本以为要隔天才能过来安装，没想到半个小时安装师傅就打我电话了，效率出乎意料的高。这次购物体验很满意，敬京东，敬TCL！', '4589', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('212', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：首先感谢快递小哥周到的服务，送货到安装一气呵成，调试电视周到细心，在说一下京东快捷，28号晚10点下的订单，29号下午就已经到家，第一次在京东上买大件物品，体验超棒，支持京东！！！', '4466', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('213', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：最近想入手一台电视，实体店和网上对比最后选中了这一款智慧型电视。首先，查看外包装箱说明书，出厂日期，确保是正品。整机颜色银色，金属材质，厚度和小米六手机差不多，边框，无接缝，一体成型，三米距离，几乎感觉不到边框的存在，然后调出系统菜单。查看机器配置，和网页参数完全一致！32核！4G内存，16G大闪存。播放那年花开月正圆是4k画质很流畅。清晰度很高，下来，重点测试智慧语音小T功能。明星脸部识别。能完美识别并准确报出电视图像中的人物信息，以及相关演出作品。这一功能我在其它品牌电视中没有发现过。完美执行快进快退，加减声音，定位播放时间进度。播放电影中可以直接语音，加减乘除运算。点播查找电影，电视剧，查询天气，歌曲，以及应用软件，讲笑话，翻译。全都可以完美运行，关键是流畅度，反应率非常非常高。内置腾讯视频片源很多，内置音乐播放软件。听歌很方便，播放音乐，音质层次感很强，音色悦耳无失真。可选择不同场景音效。HDR效果对比很明显，色彩逼真。层次分明。总之电视整体印象，智慧化非常好，非常高，运行速度非常流畅。画质清晰，全程4k，音质的清脆度和重低音表现都非常好，非常棒的一款电视，选择的很对。', '3017', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('214', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：不错的一款4K电视，买来了还特意开了宽带。这个春节就宅在家里看电影了。不错的选择', '8740', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('215', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：配送速度快，快递小哥很是热情。关于电视，不愧为4K百分之百色域的屏幕，显示非常清晰靓丽，买之前去过线下商场，在5千多这个价位，TCL这款产品没有对手啊。电视的外观设计也非常好看，电视也非常薄（我也不会天天跑到侧面去看电视，哈哈），全金属的材质也让电视更有质感，整体辨识度颇高。电视的功能也非常齐全，不愧为超纤薄AI电视，我可以通过语音操控电视的绝大部分操作，将多层的操作换做一句话即可。虚拟环绕声系统，还是有一些环绕声场的感觉，有需要时再买一套音箱配套吧。还有整个电视运行得非常流畅，这点非常满意，另外系统集成了腾讯视频等海量影音资源，数字电视明年都不用购买了，哈哈。归根到底，电视始终是用来“看”的，不俗的屏幕参数，画质表现细腻、清晰，色彩可以说是在该价位段的惊艳之选，这次的选择，我非常满意，推荐一个！', '4753', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('216', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：网上这台电视机显得特别的薄，特别的好看。我是双11当天下的单，今天到的货。京东的物流速度没话说。但是这台电视机，和网上宣传的差别很大。一，从这个电视剧中的做工来说，材质和网站上的不一样。二就是这个电视机，才第一天，居然会死机，偶尔。三，就是这个，宣传的，语音快进，根本无法识别。所以建议大家，一定要慎重考虑。', '8543', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('217', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：电视机各方面都不错，底部金属散热不错，很暖，微热烫手散热性能说明不错，TCL新款，43的有点大????这是小遗憾，电视一切安好，父母看，网络功能有点鸡肋，但是网络做的不错，与?米的电视相比，开机无广告，看网络视频的话，还是有的', '7582', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('218', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\82f474ec6d094c0ca28657b6f644a54a.jpg', '118628', '5', '使用心得：因为是给父母买的，下单之前还是比较忐忑的，整个过程是非常满意的。先说一下京东神一样的速度，刚下单没多久就有工作人员和家里人联系送货时间，下单后第二天中午就送到家里了，当天晚上就有工作人员上门安装，并耐心指导我父母电视的使用，服务超赞。说一下电视，个人觉得目前国产和进口没有区别，而且这款的颜值真是没得说，电视非常薄，画质也非常清晰，当然如果可以建议买个会员，高清资源看着会很爽，音效也是目前对比过的电视中非常不错的', '1041', '1', '1', '2019-03-22 00:55:31', '京东', '2019-03-22 00:55:31', '京东');
INSERT INTO `os_comment` VALUES ('219', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：看了很多家对比了很多款电视，在能接受的价格区间选择了这一款海信电视。我还是得满意的！！京东送货速度就是快，试用了几天再来评价的，很好的一次购物体验！', '694', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('220', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：给快递小哥点赞，点赞，再点赞，服务态度超好。这台EC750∪S画面颜色纯正，图像清晰', '782', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('221', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：物流超赞，次日就到了。值得信赖，高清，', '3025', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('222', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：还可以，物美价廉！和商场的画质一样！用后会在追评', '9547', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('223', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：电视非常好，家里买的第二台海信了。晚上下单第二天就到了！', '7076', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('224', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：不孬，比较喜欢，效果非常好', '7369', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('225', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：此用户未填写评价内容', '5817', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('226', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：电视很好，很清晰', '4218', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('227', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：速度太快了', '6668', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('228', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\13f6869c04b14bac97638388c7e5b060.jpg', '118627', '5', '使用心得：电视家里人都非常喜欢，自己家和父母家亲戚家都是用的海信电视，这次买新房果断就又买了海信，国产老品牌真是质量非常好。安装师傅说我们在京东买的太值了，这种功能的在实体怎么也得四千多。海信的安装师傅特别好，安装好了再三跟我们说注意事项。遥控器语音功能真的特别好，调电视方便太多了，非常适合老人孩子，喜欢的就赶紧入手吧。', '9422', '1', '1', '2019-03-22 00:55:38', '京东', '2019-03-22 00:55:38', '京东');
INSERT INTO `os_comment` VALUES ('229', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：用了几天才来评价，总的来说还是不错，性价比跟其他电视比起来更划得来。这个价格也没得说。虽然我晚买几天就涨了*块。等再使用一段时间再来评价', '1996', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('230', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：这款海信电视机很好，很满意的一次购物，电视机画面特别清晰，语音遥控特好用，售后服务态度也很好，谢谢卖家，也谢谢快递员。', '9357', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('231', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：不错 挺好 送货快 画面清晰 声音也挺不错 师傅挺好的 甚么都是搞好的！！！', '984', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('232', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：物美价廉，海信的质量值得信耐，清晰度还是不错的，好评。物流很准时，送货师傅态度很好，干活很仔细好评！', '2648', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('233', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：最**倒霉的一次网购，本人8月31日购买的此电视，物流9月1日送到我家，由于电视机较大，本人叫送物流的那个小伙子不要开箱。物流人员说公司要求非要开箱通电，通电之后试机确实没有问题，我又和物流人员合力把电视抬到无人居住的房间床上静置了一夜，期间绝对无发生任何碰撞或者移动，到第二天安装人员上门通电试机电视屏幕内屏就碎了。安装人员回复无法鉴定哪个环节出了问题，只告知外力破坏。一台外表没有任何刮痕和破损痕迹的电视机在静置一夜后内屏就碎裂了，本人现在也不知道是哪个环节出了问题。本人连续多日找到京东要求退换，京东售后给出的方案就是采销部无法处理，京东售后又叫我找厂家。厂家就说是外力破坏不属于三包范围。最后京东给出的处理方案就是我自费维修，此台电视在我家中已放置十日才有厂家联系我自费维修，本电视我是三千二百元购买的，现在维修厂家报价为二千五百五十元。这种费用全部只能作为消费者的我自己承担。网络购物维权真的太难太难。被人像皮球一样到处踢，警示后面购买此电视机的消费者，货到家后坚决不允许物流人员开箱验货，之签收外包装完好，待安装人员上门后再进行开箱验货安装。本人就当此次花钱买教训，我就是真的CL***了', '9739', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('234', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：快递小哥帮着调试好了才走，很贴心。电视也很高大上。国产品牌的崛起，真好！', '1573', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('235', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：电视很好，质量也好，很清晰，第二次海信电视了，自主品牌好，快递很给力！', '3291', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('236', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：电视机挺好的，屏幕分辨率挺好的，价格也不贵，趁着活动买的，快递员也很不错！值得回购！', '3402', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('237', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：用了几天才评价，总的来说还不错，性价比跟其他的电视比更划算。物流特别快，售后更棒。', '6017', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('238', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1393549ee45048488fe8f2608d723b76.jpg', '118626', '5', '使用心得：东西很好 很满意。高端大气上档次，所有的家用电器我都在京东买的，朋亲戚朋友我也都介绍给他们，让他们用京东的产品，买的放心，用的舒心，非常感谢我们本地的京东专卖店，对我们的很负责任。', '7915', '1', '1', '2019-03-22 00:55:43', '京东', '2019-03-22 00:55:43', '京东');
INSERT INTO `os_comment` VALUES ('239', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9ce70a0f129249dbaddde26baee76098.jpg', '118625', '5', '使用心得：十一活动买的，很不错，物流超快，农村都送货上门，自己和老爸折腾了一下午才安装好的，很满意，声音，清晰度都很好，尤其是配置好，不是@高清，特意选得这款', '8106', '1', '1', '2019-03-22 00:55:48', '京东', '2019-03-22 00:55:48', '京东');
INSERT INTO `os_comment` VALUES ('240', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9ce70a0f129249dbaddde26baee76098.jpg', '118625', '5', '使用心得：服务非常好', '9223', '1', '1', '2019-03-22 00:55:48', '京东', '2019-03-22 00:55:48', '京东');
INSERT INTO `os_comment` VALUES ('241', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\9ce70a0f129249dbaddde26baee76098.jpg', '118625', '5', '使用心得：电视没法看，一点也不清楚，这个客服只管卖，卖了有什么问题，只有一个打电话联系海信，差差差', '903', '1', '1', '2019-03-22 00:55:48', '京东', '2019-03-22 00:55:48', '京东');
INSERT INTO `os_comment` VALUES ('242', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：创维电视的二百优穗卷：【 ynh.在线/7w 】复￥制括号内内容。到浏￥览器中￥打开领取，很不错，比较清晰的，配送服务很不错，送到家，还顺带给我装上调试好。服务很棒。', '8262', '1', '1', '2019-03-22 00:55:53', '京东', '2019-03-22 00:55:53', '京东');
INSERT INTO `os_comment` VALUES ('243', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：很不错，比较清晰的，配送服务很不错，送到家，还顺带给我装上调试好。服务很棒。', '5532', '1', '1', '2019-03-22 00:55:53', '京东', '2019-03-22 00:55:53', '京东');
INSERT INTO `os_comment` VALUES ('244', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：第一次在京东买家电，创维大品牌。看了好久，选择了创维，很多朋友都买的创维，屏幕清晰，音质好，正好客厅使用。', '4631', '1', '1', '2019-03-22 00:55:53', '京东', '2019-03-22 00:55:53', '京东');
INSERT INTO `os_comment` VALUES ('245', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：买之前选了一个月，最终选择创维，毕竟价格不错。现在用了一个周，表现不错。电脑开了共享，电脑下载，然后电视播放共享文件夹视频，真的太过瘾了，唯一不足就是只能播放mp4 格式，可能我还没有找到解决办法吧。就显示效果而言真的不错，真的是4K显示屏。', '538', '1', '1', '2019-03-22 00:55:53', '京东', '2019-03-22 00:55:53', '京东');
INSERT INTO `os_comment` VALUES ('246', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：视频录不出效果，个人觉得颜色挺正的 创维算是电视里面的大牌子了 50寸足够大 没有找安装师傅 我爸爸自己安装的 很满意 网上买电器只相信京东自营！', '2261', '1', '1', '2019-03-22 00:55:53', '京东', '2019-03-22 00:55:53', '京东');
INSERT INTO `os_comment` VALUES ('247', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：很实用，价钱也很便宜比起那些大品牌不低啥！支持国产', '3142', '1', '1', '2019-03-22 00:55:53', '京东', '2019-03-22 00:55:53', '京东');
INSERT INTO `os_comment` VALUES ('248', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：我们这的送货师傅超级好，很喜欢他新搬来的小区他很负责家店送货，提前电话预约好时间不耽误事情，自己联系厂家派人来上门安装，挂墙100元包括打洞，可以连无线网直接播放，退出儿童页面出现算术题，懵了', '5925', '1', '1', '2019-03-22 00:55:53', '京东', '2019-03-22 00:55:53', '京东');
INSERT INTO `os_comment` VALUES ('249', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：试用了2天才评价，接电脑电视都挺好。感觉放1080P效果很好。这个价位还是挺值的。', '8989', '1', '1', '2019-03-22 00:55:53', '京东', '2019-03-22 00:55:53', '京东');
INSERT INTO `os_comment` VALUES ('250', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：不错。有线无线都支持，手机能当遥控器，语音搜索，不过这搜索太弱鸡了。手机电脑支持DLNA投屏镜像啥的，但是不是所有本地视频投到电视都播放正常，有些声音视频不能解码。总的来说，认为很不错的', '6405', '1', '1', '2019-03-22 00:55:53', '京东', '2019-03-22 00:55:53', '京东');
INSERT INTO `os_comment` VALUES ('251', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\821469639cff4272861be05bbd1320aa.jpg', '118624', '5', '使用心得：电视收到了，哇！比想象中的大多了，要是买个50 寸的就好了，清晰度挺好的，等看一段时间再来评价吧。', '2270', '1', '1', '2019-03-22 00:55:54', '京东', '2019-03-22 00:55:54', '京东');
INSERT INTO `os_comment` VALUES ('252', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\587ed008c94949ecab6a8d41839d9c43.jpg', '95127', '5', '使用心得：不错的选择，媳妇很喜欢，款式质量都很好，数字也刚好符合今天女王节的哦', '2618', '1', '1', '2019-03-22 00:55:54', '京东', '2019-03-22 00:55:54', '京东');
INSERT INTO `os_comment` VALUES ('253', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\1970acba0dbd49a3a90567270a7d0b45.jpg', '118623', '5', '使用心得：送货师傅服务态度非常好，送货速度也很快，商品质量非常棒！京东的送货师傅非常给力！', '649', '1', '1', '2019-03-22 00:55:59', '京东', '2019-03-22 00:55:59', '京东');
INSERT INTO `os_comment` VALUES ('254', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：创维电视的二百优穗卷：【 ynh.在线/7w 】复￥制括号内内容。到浏￥览器中￥打开领取，很不错，比较清晰的，配送服务很不错，送到家，还顺带给我装上调试好。服务很棒。', '4717', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('255', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：很不错，比较清晰的，配送服务很不错，送到家，还顺带给我装上调试好。服务很棒。', '9048', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('256', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：第一次在京东买家电，创维大品牌。看了好久，选择了创维，很多朋友都买的创维，屏幕清晰，音质好，正好客厅使用。', '6706', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('257', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：买之前选了一个月，最终选择创维，毕竟价格不错。现在用了一个周，表现不错。电脑开了共享，电脑下载，然后电视播放共享文件夹视频，真的太过瘾了，唯一不足就是只能播放mp4 格式，可能我还没有找到解决办法吧。就显示效果而言真的不错，真的是4K显示屏。', '9682', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('258', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：视频录不出效果，个人觉得颜色挺正的 创维算是电视里面的大牌子了 50寸足够大 没有找安装师傅 我爸爸自己安装的 很满意 网上买电器只相信京东自营！', '2259', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('259', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：很实用，价钱也很便宜比起那些大品牌不低啥！支持国产', '5335', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('260', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：我们这的送货师傅超级好，很喜欢他新搬来的小区他很负责家店送货，提前电话预约好时间不耽误事情，自己联系厂家派人来上门安装，挂墙100元包括打洞，可以连无线网直接播放，退出儿童页面出现算术题，懵了', '136', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('261', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：试用了2天才评价，接电脑电视都挺好。感觉放1080P效果很好。这个价位还是挺值的。', '5065', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('262', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：不错。有线无线都支持，手机能当遥控器，语音搜索，不过这搜索太弱鸡了。手机电脑支持DLNA投屏镜像啥的，但是不是所有本地视频投到电视都播放正常，有些声音视频不能解码。总的来说，认为很不错的', '4704', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('263', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\e41833fa568a4d539bb5aacb5f00b516.jpg', '118622', '5', '使用心得：电视收到了，哇！比想象中的大多了，要是买个50 寸的就好了，清晰度挺好的，等看一段时间再来评价吧。', '6805', '1', '1', '2019-03-22 00:56:07', '京东', '2019-03-22 00:56:07', '京东');
INSERT INTO `os_comment` VALUES ('264', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\f18db0c66dc647ceabd9bdbb3870930c.jpg', '95120', '5', '使用心得：帽子很好质量也好带着好看', '5238', '1', '1', '2019-03-22 00:56:10', '京东', '2019-03-22 00:56:10', '京东');
INSERT INTO `os_comment` VALUES ('265', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\48388d3ae02a4a09923ae31841acb988.jpg', '118621', '5', '使用心得：装上感觉还不错，要了一个架子，*元，装上也很牢固，目前打开看画质还算清晰，还有待长期观察，先好评啦', '485', '1', '1', '2019-03-22 00:56:12', '京东', '2019-03-22 00:56:12', '京东');
INSERT INTO `os_comment` VALUES ('266', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\00df0a94c91e4d5392f17703a9afa6f1.jpg', '95119', '5', '使用心得：此用户未填写评价内容', '8114', '1', '1', '2019-03-22 00:56:12', '京东', '2019-03-22 00:56:12', '京东');
INSERT INTO `os_comment` VALUES ('267', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\6a66a9dadc05498c86926eaa695e3833.jpg', '95118', '5', '使用心得：没有图片片好看', '4965', '1', '1', '2019-03-22 00:56:14', '京东', '2019-03-22 00:56:14', '京东');
INSERT INTO `os_comment` VALUES ('268', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3a0a63362a144ef1a3cfdb6f02dd4f77.jpg', '118620', '5', '使用心得：预约新品就开买的，厂家顺丰物流棒棒哒，送货上门，自己十分钟就轻松组装完成，机器边很薄，色彩非常不错。酷开系统非常好用，音质也很好。赶紧联网，晚上可以用它看世界杯了。哇哈哈。', '9366', '1', '1', '2019-03-22 00:56:16', '京东', '2019-03-22 00:56:16', '京东');
INSERT INTO `os_comment` VALUES ('269', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\212c70131cd341b5a063375eca882a1d.jpg', '95117', '5', '使用心得：衣服质量不错,样式也好,有弹力,给下面的mm做个参考,买小了,再买两件', '7125', '1', '1', '2019-03-22 00:56:17', '京东', '2019-03-22 00:56:17', '京东');
INSERT INTO `os_comment` VALUES ('270', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\27b012bb314949449ab76fc408f0e4ec.jpg', '95116', '5', '使用心得：物流很给力，衣服的质量也很好呢，穿在身上特别舒服，卖家推荐的尺码大小合适', '6421', '1', '1', '2019-03-22 00:56:20', '京东', '2019-03-22 00:56:20', '京东');
INSERT INTO `os_comment` VALUES ('271', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\27b012bb314949449ab76fc408f0e4ec.jpg', '95116', '5', '使用心得：衣服穿在身上效果很好，质量很好，款式新颖，很满意的一次购物。', '3954', '1', '1', '2019-03-22 00:56:20', '京东', '2019-03-22 00:56:20', '京东');
INSERT INTO `os_comment` VALUES ('272', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\27b012bb314949449ab76fc408f0e4ec.jpg', '95116', '5', '使用心得：面料特别的舒服，比在实体店买实惠很多呢，质量特别好，面料舒服', '3394', '1', '1', '2019-03-22 00:56:20', '京东', '2019-03-22 00:56:20', '京东');
INSERT INTO `os_comment` VALUES ('273', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：反应速度有点慢，但绝对对得起这个价格，做工用料嘛，这个价位还要什么自行车？色彩还算不错的，声音嘛，图个响说是了，参数是全高清的，没去测试。总的一句，对得起这个价格 要说不满意的，是它的底座是要上镙丝的，遥控连个电池也没有，这点钱确实不应该省的', '319', '1', '1', '2019-03-22 00:56:21', '京东', '2019-03-22 00:56:21', '京东');
INSERT INTO `os_comment` VALUES ('274', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：京东配送还挺快，第一天下单第二天上午就送到了，虽然出了一点小差错，他们处理的响应速度很快，电视剧挺好的，以前的几个都是康佳的，质量很好，这次是给老人买的，操作也不算麻烦，老人要看电视台直播节目，装了第三方直播软件后老人也很方便操作，电视机用wifi连接时的响应速度也可以，插网线的话可能更好，这个可能跟网速有关系吧，屏幕的清晰度也可以，机器本身自带的应用也很好，沙发管家，特别是易互动，可以直接把手机上的东西投影到电视上，真的很方便。内存还足可以安装几个应用软件。下次如果还要买的话还考虑买康佳的。', '197', '1', '1', '2019-03-22 00:56:21', '京东', '2019-03-22 00:56:21', '京东');
INSERT INTO `os_comment` VALUES ('275', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：商品物超所值，看高清720p很顺畅，差不多用两天了，性能哒哒滴。', '7184', '1', '1', '2019-03-22 00:56:21', '京东', '2019-03-22 00:56:21', '京东');
INSERT INTO `os_comment` VALUES ('276', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：包装完好，快递迅速，前一天下单，转天早上京东快递小哥就送货到家了，服务态度还特别好，开箱验机，电视色彩很鲜艳，图像清晰，功能齐全，连接网络很方便，功能强大，连接机顶盒图像也清晰，因为单位办公室电视使用的就是康佳品牌，使用了二年多质量还是这么稳定，所以这次还是选择康佳，大品牌，值得信瀨，网络上看电视也不卡，总之，信濑京东，信懒康佳，服务完美，物美价廉！', '6412', '1', '1', '2019-03-22 00:56:21', '京东', '2019-03-22 00:56:21', '京东');
INSERT INTO `os_comment` VALUES ('277', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：很不错买给家里爸妈平时看看电视，外观时尚大气，超做简单易懂，对于老人家来说非常好。京东物流速度快，农村一样送货上门，还单面让通电检查机器，非常满意', '3758', '1', '1', '2019-03-22 00:56:21', '京东', '2019-03-22 00:56:21', '京东');
INSERT INTO `os_comment` VALUES ('278', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：前几个月买了款也是康佳的32寸，价格1200！只不过屏幕不小心被硬物击破！修的话麻烦不划算所以干脆再买一台！这款kktv和之前的那款比起来分辨率什么的都差不多！内置播放器也是一样的！所以用起来也顺手！就是这款液晶屏和边缘衔接部分没有之前那款结实有些松动！不过价格摆在那里嘛！便宜！就看之后耐用不耐用了！', '936', '1', '1', '2019-03-22 00:56:21', '京东', '2019-03-22 00:56:21', '京东');
INSERT INTO `os_comment` VALUES ('279', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：效果和我颜色都不错，很满意送货师傅态度特别好必须给五分好评，送货快，上午下单，下午三点半就到了，非常满意，京东就是这样效率高。给小孩看的大小刚好', '5973', '1', '1', '2019-03-22 00:56:21', '京东', '2019-03-22 00:56:21', '京东');
INSERT INTO `os_comment` VALUES ('280', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：第一次在京东买电器，非常满意，五星好评，卖家服务态度很好，不懂得卖家都一一帮忙解决了，快递也很快，包送货上门，教我如何使用，这款电视直接连接无线网密码都能看电视，而且从手机能投影到电视上看，非常方便，想看啥就看啥，下次买电器还上京东买，', '7686', '1', '1', '2019-03-22 00:56:21', '京东', '2019-03-22 00:56:21', '京东');
INSERT INTO `os_comment` VALUES ('281', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：质量真的很不错，手机安装易互动就可以将腾讯视频的东西投射上去，再也不用用手机看电视了，画面清晰，音质挺好的，特意用了几天来评论，没发现别的问题，客服态度也很好，送货及时，安装及时，很喜欢这款电视', '9231', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('282', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\3298c22c919e4c29a9aa59329ad8ca89.jpg', '118619', '5', '使用心得：电视机非常清晰质量很好就是语音功能不知道用！京东快递很负责任晚上十点多还给我送货小哥辛苦了', '8932', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('283', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：衣服质量可以，挺合身的，客服也很赞', '4264', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('284', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：特别信赖这家，商品很满意，颜色大小等都比较满意物流也快，价格不错, 惠而不贵真漂亮值得大家信任, 不得不给好评 不论质量还是服务 物流都非常好', '2887', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('285', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：宝贝收到了，很漂亮，客服也很好，因为临时要出差怕收不到货，和客服说了立马就帮我解决了今天就收到了，太感谢了-特别仙女！特别好看而且没色差！大爱', '4637', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('286', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：还是很好的哟，没有让我失望，做工和质量都很好，发货快，物流快-又买了一件，&nbsp;还会光顾的 物流给力，质量挺好的', '4803', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('287', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：发货速度快, 颜色也是今年的流行色很正, 不错不错还会再买的-宝贝收到了，外观精巧，包装有档次，物流也很快，赞、很赞、非常赞', '7660', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('288', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：宝贝收到，如卖家描述一样，服务态度好，物流更没话说-商家服务认真负责,和商家描述的一样好一次不错的购物,快递很快东西很喜欢', '2182', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('289', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：很喜欢哦，跟卖家聊天很开心呢，有什么问题都一一解决了-颜色好看没色差 特别漂亮 同事都说好！', '4831', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('290', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：款式非常合适,物流服务很贴心很耐心,赞一下-宝贝收到不错，和图片描述一样，大小正合适，', '7308', '1', '1', '2019-03-22 00:56:22', '京东', '2019-03-22 00:56:22', '京东');
INSERT INTO `os_comment` VALUES ('291', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：收到了，和图片描述相符，质量杠杠的，-快递好给力, 大爱性价比高, 简约时尚做工精细', '532', '1', '1', '2019-03-22 00:56:23', '京东', '2019-03-22 00:56:23', '京东');
INSERT INTO `os_comment` VALUES ('292', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\fdba70ebedbc4490a5d4ce22b3a69095.jpg', '95115', '5', '使用心得：商品包装非常好,物流非常赞隔天就收到货-京东购物，值得放心，适合我。', '4157', '1', '1', '2019-03-22 00:56:23', '京东', '2019-03-22 00:56:23', '京东');
INSERT INTO `os_comment` VALUES ('293', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：10月5日下单，7日如约收货，金黄色的金属机身挺漂亮的。画面挺清晰的，声音也不错。2G+16G和当下同一配置的电视机相比，物美价廉。手机投屏后，手机内所有内容都可以放大观看。现已与功放和音响连接，总体满意。', '4104', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('294', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：一开机就连上了wifi 机子够大，清晰度还可以 送货速度真的快 比较满意的一次购物', '6861', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('295', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：用了一个星期，感觉还可以！播放视频还要蛮清晰的，内存也够了！就是主要看能用两三年不会坏就好了?', '9181', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('296', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：电视收到了，京东就是给力，55寸的电视够大，清晰度，声音都不错。开机~时间相较比我新家的电视~来算短的了。调试简单自己就能搞定，安装师傅服务的很到位，态度好。电视界面美观大气，晚上关灯看电视，老妹说看电影一样，非常棒。物美价廉赞一个。', '5502', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('297', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：康佳KKTV电视，款式漂亮，外观好看，金属边款，很有质感，网络功能齐全，点播起来方便，反应速度很快。很不错的电视。下次还会选择 。满意的一次购物。值得购买。物流也非常快。喜欢这款电视。希望服务更好。', '8476', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('298', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：外观漂亮，颜色超好，内存大反应快，红外遥控器，资源挺丰富立面有我儿子最爱看的宝宝巴士通过易学频道对小孩进行辅导，大屏幕儿子的最爱[愉快]另外物流也很快，服务很周到，不愧是大品牌，大爱KKTV', '6200', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('299', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：之前给爸妈买了台k43非常好用，这次自己要买台65吋的，又选择了KKTV，京东送货一直很给力，很快就到了。自己安装很简单，开机画面很清晰，配置高，反应快，目前一切满意！', '6345', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('300', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：康佳KKTV电视，很不错的电视 ，清晰度很好，颜色很鲜艳，网络功能齐全，点播方便，操作很好。金属边框，音响效果也挺好的。很满意的电视。物流也很快。值得购买的好电视。喜欢这款电视。', '3134', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('301', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：康佳的这款55寸，性价比高，超薄，内存16G，前置@，是18年度最值得购买电视之一！超赞！', '7206', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('302', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\d3686cc7627d464ebdab022fbbb86ddf.jpg', '118618', '5', '使用心得：快递哥热心，帮我安装好并调试。效果非常好，大气金属边。系统使用方便筒单好用。', '8285', '1', '1', '2019-03-22 00:56:26', '京东', '2019-03-22 00:56:26', '京东');
INSERT INTO `os_comment` VALUES ('303', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\d783247cfd294539946c1e67990aa668.jpg', '95113', '5', '使用心得：东西不错，料子摸着挺舒服的，价格合适穿着好看，下次需要还会回购。赞', '4764', '1', '1', '2019-03-22 00:56:27', '京东', '2019-03-22 00:56:27', '京东');
INSERT INTO `os_comment` VALUES ('304', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\1bd338bb7c3d4718960f2b47485bb0a0.jpg', '95112', '5', '使用心得：夹克质量真的好，下次还来，相信京东值得信赖。', '2655', '1', '1', '2019-03-22 00:56:29', '京东', '2019-03-22 00:56:29', '京东');
INSERT INTO `os_comment` VALUES ('305', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：这款电视机很轻薄，很漂亮，曲面的画面感比平面的看着更舒服，影像很清楚，使用也很方便，电视预装的软件都很好，很周到，看、听、唱K歌的软件都有很好用很喜欢，不用自己再安装了，满足了我所有的要求。电视送到家，安装师傅佷快就上门给安装了，安装师傅很耐心的做了调试，给力。记得第一次来京东购物是在网络上看到京东的新闻，于是便抱着上京东看看，试买的心态买下了第一把剃须刀，结果被京东贴的服务深深感动，暖心的服务让我义无反顾的爱上了京东，从此只要家里有任何需要，第一想到的就是上京东，现在几乎不上实体店买了，因为在实体店买的东西拿回家你不喜欢，不可以退，京东可以，实体店买的东西有质量问题想换新的不可以，只能修，但京东可以，所以给京东一万个赞！我动员我身边的朋友都上京东了，京东是不是该给我发个红包，嘿嘿！京东购物让人如此放心、暖心、舒心，京东好样的！愿京东越来越来好，京东加油！', '3032', '1', '1', '2019-03-22 00:56:31', '京东', '2019-03-22 00:56:31', '京东');
INSERT INTO `os_comment` VALUES ('306', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：非常满意的一次购物，看了几天才来评价。首先说说送货速度，我在西部小县城乡下，第一天下单第二天就到，不得不佩服京东的物流。第二，外观，画质超级清晰，刚送回来看了下网络电视感觉不是很清晰，后来发现是动画片的原因，一般别的都很清晰。55寸够大，边框小，曲面上档次，总的来说就是高大上，最重要的一点不坏眼睛，不坏眼睛，不坏眼睛，重要的事情说三遍。朋友家的海信平面看一会儿眼睛发涨。这也是我选这款的重要原因之一，本来还看好海信的，可是在朋友家看了一会儿后放弃了。家里有小孩的注意了有些平面电视真的坏眼睛。为了眼睛建议选择曲面，看几小时不会累，当然一般电视还是得少看。 第三，说说性能功能，这款是TCL最新款吧，2018才上市，功能该有的都有，我也没仔细去研究，正常使用没问题，性能就比较满意了，开机不过10秒左右吧，或许更短，反应速度很快，处理器不错。反正我没感觉，上面电视很多并且基本都是免费的，这点很满意不像广电的看啥都要钱，我也是无语了。在说音质，感觉很不错，我老爸经常放音乐听，挺清晰的。总的来说是一次很满意的购物，性价比超级高，这个价位买到这么好的电视，我很满意。', '9305', '1', '1', '2019-03-22 00:56:31', '京东', '2019-03-22 00:56:31', '京东');
INSERT INTO `os_comment` VALUES ('307', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：因为搬家，急需电视机，(之前的老式电视机被淘汰了)在实体店与京东网店来回的逛，反复对比，无论是功能还是性价比，都一一对比过，最后在京东看中了TCL，55寸这款，大牌子值得信赖，还赶巧了，此款正在活动期间，于是果断预约，下单，购买的，当天下午6点下单，晚上就有来电确认订单情况，并预约好送货的时间以及，在此对京东的服务态度很满意，收到货后，打开非常的惊喜，整体比想象中的大，放在客厅非常的美观大方，觉得都把房子都提高了一个档次，再说说电视的本身，无论是画面的色彩还是音质上都非常的棒。金属v字形，底座很有质感，10.7毫米金属窄边设计，显得电视机更薄，4000R曲面设计，不仅是观看视界更开阔，也更立体，视觉效果非常的好，总有种置身于电影院的感觉。功能很多很全，有影视，游戏，K歌，教育，等等，满足各类人群的观看需求，特别是家里的小朋友，非常的喜欢，自己搜索动画片，还会从历史收藏中搜索观看记录，总之很满意。喜欢的亲们放心购买。哦，还得谢谢送货送货师傅，对各方面的功能以及使用都一一详细介绍，也一再交代，把盒子保存好，有任何问题及一些不会使用的电视功能都可以随时联系他，再次感谢！', '6030', '1', '1', '2019-03-22 00:56:31', '京东', '2019-03-22 00:56:31', '京东');
INSERT INTO `os_comment` VALUES ('308', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：电视17号收到的，晚上进行了暴力测试后就来晒单评价了，首先从平面选到曲面，经过多次对比最后选中了TCL这一款，搞活动价格还不错，TCL新品，京东物流还是一样正常发货很给力。家住在农村，师傅还是很热情的送到了家里挂在墙上分分钟搞定。附加100安装费 这款电视无论是在音质上还是画面的色彩上都是非常棒的，特别是画面很满意UHD+HDR，先说说外观挺漂亮，特别是10厘米金属窄边设计显得电视更薄，4000R曲率设计，不仅使观看视界更开阔，也显得人物更立体，和电影院的3D效果没两样，这是我非常满意的一点，画面清晰，色彩饱满，对比度高，不容易刺激眼睛。很喜欢自带的前置音响，减少音量的流失，有环绕立体声的感觉，在加上杜比音效，使声音更加立体，声音可以启动夜间模式，自动调节音量，不会扰民，另外蓝牙4.0完全足够了可以同时接两个蓝牙设备不卡，可以换一个语音遥控器就更完美了，（这个是不带语音遥控器的但是支持遥控器语音功能的）==未完待续 请看追加', '8702', '1', '1', '2019-03-22 00:56:31', '京东', '2019-03-22 00:56:31', '京东');
INSERT INTO `os_comment` VALUES ('309', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：在活动之前看了好多品牌的电视机，选来选去最终还是觉得Tcl电视比较好，它的曲面技术是所有电视里面最先进的。其他品牌因为不具备该高超的技术，基本不敢主打曲面电视。趁着315搞活动，毫不犹豫的选择了该款电视机。今天十分欣喜的收到电视机，迫不及待的打开，机体纤薄，但高级灰的颜色，显得优雅尊贵。其曲面弧度贴合人眼的观看习惯，不仅健康护眼，能降低视觉疲劳，再搭配上立体画质引擎，更能使画面自然鲜活，生动立体，让使用者视野更宽广、环抱感更强，画面更立体，临场感也更强烈。简直是大爱。它的声音清澈纯净，层次感强，能够让观看者感受到声音在传输过程中直射入耳的无损耗真实感，最大程度的保证音效。再加上它的大内存，与智慧型遥控，性价比极高，是一款很值得推荐使用的。以后坐在家里看电视，简直就是视觉与听觉的享受。本来计划挂在墙上，快递小哥给耐心的分析了一下墙体结构，觉得不太适合，最后选择座式贴心的给放好最佳的观看位置并讲解了一些注意事项。给快递小哥点赞！', '1121', '1', '1', '2019-03-22 00:56:31', '京东', '2019-03-22 00:56:31', '京东');
INSERT INTO `os_comment` VALUES ('310', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：近些年，家电一直在京东买，送货超快，直接入户，非常方便。 最近家里要买电视，网上搜索查看，有介绍曲面电视做的好的主要就是TCL、三星和海信这些，个人觉得TCL的曲面电视做得更为先进也更为突出。就拿它们的新品H8800系列来说吧，它率先实现了量子点版110%NTSC、其他版本96%NTSC的高色域覆盖。另外，其性.价.比也是行业中最高的，价位也绝对是行业中最为实.惠的。感觉TCL曲面就挺好的 而且是国产的 我就挺支持国货，于是就选择了这款TCL曲面电视，电视收到非常惊喜，超薄的，外观很漂亮。 表面呈现曲面状，大曲面屏幕就像一个抛物线有个焦点一样，观看有个最佳区域，在这个位置看视频就会有“与屏幕表面各个点的距离都一样”的感觉，比起一般屏幕还是有优势的。让你的眼睛可以倍感舒服，让你可以更好的享受电视生活，超级棒的一种特点！ TCL这款曲面屏电视，在曲面、色彩、清晰、声音、四大方面有着无与伦比的临场感体验，看电视的体验很不错，有种身临其境的感觉，我和家里人都挺喜欢的。', '7615', '1', '1', '2019-03-22 00:56:31', '京东', '2019-03-22 00:56:31', '京东');
INSERT INTO `os_comment` VALUES ('311', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\19f56a1f9edc4dcfbf7191120fa4ce8a.jpg', '95111', '5', '使用心得：衣服很好看而且物流很快 好评', '1857', '1', '1', '2019-03-22 00:56:31', '京东', '2019-03-22 00:56:31', '京东');
INSERT INTO `os_comment` VALUES ('312', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：想象不到的清楚！曲屏看片来真爽死人！！！音色震撼！！！京东物流的快递哥！！服务态度很好！还免费安装！及时回访！！！京东杠杠的！！！！', '9264', '1', '1', '2019-03-22 00:56:31', '京东', '2019-03-22 00:56:31', '京东');
INSERT INTO `os_comment` VALUES ('313', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：电视已收到，自己装上，总体感觉很棒，样子美观，画质清晰， 很满意的一次购物，终于可以放心了。', '7756', '1', '1', '2019-03-22 00:56:32', '京东', '2019-03-22 00:56:32', '京东');
INSERT INTO `os_comment` VALUES ('314', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：性价比很高，看电视，电影很好，出了点小问题，客服很热情高效，第二天就给换了，京东值得信赖。', '5316', '1', '1', '2019-03-22 00:56:32', '京东', '2019-03-22 00:56:32', '京东');
INSERT INTO `os_comment` VALUES ('315', '1648', '1', '穿鞋子的猫', 'product\\20190319000000\\0d95d64c469e4d2b80a12c37fde464d8.jpg', '118617', '5', '使用心得：还不错吧，挺好的！还有语音功能，也挺好用的！画面也可以！', '3544', '1', '1', '2019-03-22 00:56:32', '京东', '2019-03-22 00:56:32', '京东');
INSERT INTO `os_comment` VALUES ('316', '1648', '1', '穿鞋子的猫', 'product\\20190319003434\\e460e131295a43ee9c3f1bc94ce7ba66.jpg', '95110', '5', '使用心得：物流很给力，衣服的质量也很好呢，穿在身上特别舒服，卖家推荐的尺码大小合适', '5910', '1', '1', '2019-03-22 00:56:34', '京东', '2019-03-22 00:56:34', '京东');
INSERT INTO `os_comment` VALUES ('2010', '1016', '1', '穿鞋子的猫', 'product\\20190319152626\\308b9d96e65546f291176601cc68452c.jpg', '80603', '5', '使用心得：宝贝很软，穿着很舒服，很适合，质量很不错，价格很好。', '2612', '1', '1', '2019-03-22 01:04:13', '京东', '2019-03-22 01:04:13', '京东');

-- ----------------------------
-- Table structure for os_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `os_comment_reply`;
CREATE TABLE `os_comment_reply` (
  `comment_reply_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论回复ID',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '评论ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `good_count` int(11) DEFAULT '0' COMMENT '好评数',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `type` tinyint(2) DEFAULT '0' COMMENT '评论类型：1,官方回复；0,用户回复',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`comment_reply_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论回复表';

-- ----------------------------
-- Records of os_comment_reply
-- ----------------------------
INSERT INTO `os_comment_reply` VALUES ('1', '8', '1', '猫宁', 'default/avatar/avatar_8.jpg', '很好用啊', '17', '1', '1', '2017-03-04 15:41:37', null, '2017-03-04 15:41:40', null);
INSERT INTO `os_comment_reply` VALUES ('2', '8', '1', '猫宁', 'default/avatar/avatar_4.jpg', '测试2', '0', '1', '0', '2017-03-04 15:42:00', null, null, null);
INSERT INTO `os_comment_reply` VALUES ('3', '8', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试3', '0', '0', '0', '2017-03-04 15:42:00', null, null, null);
INSERT INTO `os_comment_reply` VALUES ('4', '8', '1', '猫宁', 'default/avatar/avatar_8.jpg', '测试3', '0', '1', '0', '2017-03-04 15:42:00', null, null, null);
INSERT INTO `os_comment_reply` VALUES ('5', '10', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '超级赞！~赞', '0', '1', '0', '2017-05-15 14:18:22', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('6', '10', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '超级赞！~赞', '0', '1', '0', '2017-05-15 14:21:27', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('7', '12', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '', '0', '1', '0', '2017-05-15 14:22:41', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('8', '12', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '', '0', '1', '0', '2017-05-15 14:23:12', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('9', '12', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '赞赞岁男子拿', '0', '1', '0', '2017-05-15 14:25:03', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('10', '12', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '咱按时打算的', '0', '1', '0', '2017-05-15 14:25:09', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('11', '20', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '赞赞赞！~', '0', '1', '0', '2017-05-15 14:34:17', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('12', '20', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '赞赞赞！~', '0', '1', '0', '2017-05-15 14:34:19', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('13', '18', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '赞赞赞！~', '0', '1', '0', '2017-05-15 14:34:29', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('14', '19', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '赞赞男咋！~', '0', '1', '0', '2017-05-15 14:35:35', '穿鞋子的猫', null, null);
INSERT INTO `os_comment_reply` VALUES ('15', '10', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '咱在那咋咋！', '0', '1', '0', '2017-05-16 12:53:32', '穿鞋子的猫', null, null);

-- ----------------------------
-- Table structure for os_email
-- ----------------------------
DROP TABLE IF EXISTS `os_email`;
CREATE TABLE `os_email` (
  `email_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '邮箱ID',
  `email_sign` bigint(20) unsigned DEFAULT NULL COMMENT '邮箱标识号',
  `user_email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `email_type` tinyint(4) DEFAULT NULL COMMENT '邮箱类型：0.找回密码；1.注册；2.改变邮箱；3.通知',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `start_time` datetime DEFAULT NULL COMMENT '有效开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '有效结束时间',
  `new_email` varchar(50) DEFAULT NULL COMMENT '新电子邮箱',
  `status` tinyint(1) DEFAULT '1' COMMENT '链接是否已失效：0.失效；1.未失效；',
  `send_status` tinyint(1) DEFAULT NULL COMMENT '发送状态：0.发送失败；1.发送成功；',
  `captcha` varchar(10) DEFAULT NULL COMMENT '验证码',
  `email_subject` varchar(255) DEFAULT NULL COMMENT '邮箱主题',
  `email_content` text COMMENT '邮箱正文',
  PRIMARY KEY (`email_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邮箱记录表';

-- ----------------------------
-- Records of os_email
-- ----------------------------
INSERT INTO `os_email` VALUES ('1', '1487701725134975', '810170512@qq.com', '0', '2017-02-22 02:28:44', '2017-02-22 02:28:44', '2017-02-22 02:31:44', null, null, '1', 'czTZtJ', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487701724488,\"captcha\":\"czTZtJ\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('2', '1487745251478729', '810170512@qq.com', '0', '2017-02-22 14:34:10', '2017-02-22 14:34:10', '2017-02-22 14:37:10', null, null, '1', 'XrrCjK', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745250328,\"captcha\":\"XrrCjK\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('3', '1487745291967494', '810170512@qq.com', '0', '2017-02-22 14:34:50', '2017-02-22 14:34:50', '2017-02-22 14:37:50', null, null, '1', 'Yi58cm', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745290356,\"captcha\":\"Yi58cm\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('4', '1487745367690376', '810170512@qq.com', '0', '2017-02-22 14:36:07', '2017-02-22 14:36:07', '2017-02-22 14:39:07', null, null, '1', 'ZnM7LT', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745367013,\"captcha\":\"ZnM7LT\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('5', '1487745465859777', '810170512@qq.com', '0', '2017-02-22 14:37:45', '2017-02-22 14:37:45', '2017-02-22 14:40:45', null, null, '1', 'rPTYKh', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745465071,\"captcha\":\"rPTYKh\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('6', '1487745514897267', '810170512@qq.com', '0', '2017-02-22 14:38:34', '2017-02-22 14:38:34', '2017-02-22 14:41:34', null, null, '1', 'pkNcix', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745514377,\"captcha\":\"pkNcix\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('7', '1487745585180268', '810170512@qq.com', '0', '2017-02-22 14:39:45', '2017-02-22 14:39:45', '2017-02-22 14:42:45', null, null, '1', 'wqymfP', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745584699,\"captcha\":\"wqymfP\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('8', '1487747001532713', '810170512@qq.com', '0', '2017-02-22 15:03:21', '2017-02-22 15:03:21', '2017-02-22 15:06:21', null, null, '1', '2BRBgt', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747000793,\"captcha\":\"2BRBgt\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('9', '1487747066956961', '810170512@qq.com', '0', '2017-02-22 15:04:26', '2017-02-22 15:04:26', '2017-02-22 15:07:26', null, null, '1', 'H6Uj5q', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747066378,\"captcha\":\"H6Uj5q\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('10', '1487747245006097', '810170512@qq.com', '0', '2017-02-22 15:07:23', '2017-02-22 15:07:23', '2017-02-22 15:10:23', null, null, '1', 'KuNGJ5', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747243254,\"captcha\":\"KuNGJ5\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('11', '1487747326676692', '810170512@qq.com', '0', '2017-02-22 15:08:46', '2017-02-22 15:08:46', '2017-02-22 15:11:46', null, null, '1', 'dmTK0O', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747325962,\"captcha\":\"dmTK0O\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('12', '1487747420406932', '810170512@qq.com', '0', '2017-02-22 15:10:20', '2017-02-22 15:10:20', '2017-02-22 15:13:20', null, null, '1', '4l49sL', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747419544,\"captcha\":\"4l49sL\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('13', '1487747679673929', '810170512@qq.com', '0', '2017-02-22 15:14:39', '2017-02-22 15:14:39', '2017-02-22 15:17:39', null, null, '1', 'tpmrp9', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747678855,\"captcha\":\"tpmrp9\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('14', '1487747718595384', '810170512@qq.com', '0', '2017-02-22 15:15:18', '2017-02-22 15:15:18', '2017-02-22 15:18:18', null, null, '1', 'KJT5rb', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747717836,\"captcha\":\"KJT5rb\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('15', '1487747750712149', '810170512@qq.com', '0', '2017-02-22 15:15:50', '2017-02-22 15:15:50', '2017-02-22 15:18:50', null, null, '1', 'GA4WY0', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747750226,\"captcha\":\"GA4WY0\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('16', '1487747787753452', '810170512@qq.com', '0', '2017-02-22 15:16:27', '2017-02-22 15:16:27', '2017-02-22 15:19:27', null, null, '1', 't2Ioou', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747787269,\"captcha\":\"t2Ioou\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('17', '1487749320998554', '810170512@qq.com', '0', '2017-02-22 15:41:59', '2017-02-22 15:41:59', '2017-02-22 15:44:59', null, null, '1', 'e44wxl', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487749319458,\"captcha\":\"e44wxl\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('18', '1487749446841660', '810170512@qq.com', '0', '2017-02-22 15:44:05', '2017-02-22 15:44:05', '2017-02-22 15:47:05', null, null, '1', 'lRPJel', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487749444869,\"captcha\":\"lRPJel\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('19', '1487751876226966', '810170512@qq.com', '0', '2017-02-22 16:24:34', '2017-02-22 16:24:34', '2017-02-22 16:27:34', null, '0', '1', '8errLm', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487751873978,\"captcha\":\"8errLm\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('20', '1487752312477679', '810170512@qq.com', '0', '2017-02-22 16:31:52', '2017-02-22 16:31:52', '2017-02-22 16:34:52', null, '0', '1', 'LVlQWq', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487752311660,\"captcha\":\"LVlQWq\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('21', '1487752705280100', '810170512@qq.com', '0', '2017-02-22 16:38:24', '2017-02-22 16:38:24', '2017-02-22 16:41:24', null, '0', '1', 'GIx3hA', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487752703525,\"captcha\":\"GIx3hA\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('22', '1487752992885442', '810170512@qq.com', '0', '2017-02-22 16:43:12', '2017-02-22 16:43:12', '2017-02-22 16:46:12', null, '0', '1', 'vMEH28', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487752992241,\"captcha\":\"vMEH28\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('23', '1487753204821656', '810170512@qq.com', '0', '2017-02-22 16:46:44', '2017-02-22 16:46:44', '2017-02-22 16:49:44', null, '0', '1', 'Z5VGUo', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487753204102,\"captcha\":\"Z5VGUo\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('24', '1487766672370815', '5524551@qq.com', '1', '2017-02-22 20:31:11', '2017-02-22 20:31:11', '2017-02-22 20:34:11', null, '1', '1', 'aPMA2T', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487766671298,\"captcha\":\"aPMA2T\",\"userNumber\":148776666975620,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('25', '1487766781695935', '5524551@qq.com', '1', '2017-02-22 20:33:01', '2017-02-22 20:33:01', '2017-02-22 20:36:01', null, '1', '1', 'PacTrm', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487766781056,\"captcha\":\"PacTrm\",\"userNumber\":148776666975620,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('26', '1487772029160876', '5524551@qq.com', '1', '2017-02-22 22:00:28', '2017-02-22 22:00:28', '2017-02-22 22:03:28', null, '0', '1', 'QMzNU8', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487772028390,\"captcha\":\"QMzNU8\",\"userNumber\":148777202714541,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('27', '1487772322320673', '5524551@qq.com', '1', '2017-02-22 22:05:22', '2017-02-22 22:05:22', '2017-02-22 22:08:22', null, '0', '1', 'z4iSN2', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487772321714,\"captcha\":\"z4iSN2\",\"userNumber\":148777232058127,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('28', '1487772599839706', '5524551@qq.com', '1', '2017-02-22 22:09:59', '2017-02-22 22:09:59', '2017-02-22 22:12:59', null, '0', '1', 'EYYR47', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487772599321,\"captcha\":\"EYYR47\",\"userNumber\":148777259696399,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('29', '1487772954429560', '5524551@qq.com', '1', '2017-02-22 22:15:54', '2017-02-22 22:15:54', '2017-02-22 22:18:54', null, '0', '1', 'I6qEet', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487772953745,\"captcha\":\"I6qEet\",\"userNumber\":148777295260796,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('30', '1487773065968082', '5524551@qq.com', '1', '2017-02-22 22:17:46', '2017-02-22 22:17:46', '2017-02-22 22:20:46', null, '0', '1', 'XAJK83', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487773065500,\"captcha\":\"XAJK83\",\"userNumber\":148777306444101,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('31', '1487774822132418', '5524551@qq.com', '1', '2017-02-22 22:47:01', '2017-02-22 22:47:01', '2017-02-22 22:50:01', null, '0', '1', 'aRh8Jg', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487774821115,\"captcha\":\"aRh8Jg\",\"userNumber\":148777481346536,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('32', '1487776595249887', '810170512@qq.com', '1', '2017-02-22 23:16:35', '2017-02-22 23:16:35', '2017-02-22 23:19:35', null, '1', '0', '87jyVc', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487776594743,\"captcha\":\"87jyVc\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('33', '1487776598551251', '810170512@qq.com', '1', '2017-02-22 23:16:38', '2017-02-22 23:16:38', '2017-02-22 23:19:38', null, '1', '0', 'HkWpwV', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487776598070,\"captcha\":\"HkWpwV\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('34', '1487777000826262', '810170512@qq.com', '1', '2017-02-22 23:23:20', '2017-02-22 23:23:20', '2017-02-22 23:26:20', null, '1', '1', 'EKkA6w', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777000076,\"captcha\":\"EKkA6w\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('35', '1487777112813288', '810170512@qq.com', '1', '2017-02-22 23:25:12', '2017-02-22 23:25:12', '2017-02-22 23:28:12', null, '1', '0', 'Ny5dvw', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777111837,\"captcha\":\"Ny5dvw\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('36', '1487777144646057', '810170512@qq.com', '1', '2017-02-22 23:25:28', '2017-02-22 23:25:28', '2017-02-22 23:28:28', null, '1', '0', '70zoYS', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777128336,\"captcha\":\"70zoYS\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('37', '1487777263454157', '810170512@qq.com', '1', '2017-02-22 23:27:43', '2017-02-22 23:27:43', '2017-02-22 23:30:43', null, '1', '0', '4LaZH4', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777262744,\"captcha\":\"4LaZH4\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('38', '1487777471768088', '810170512@qq.com', '1', '2017-02-22 23:31:11', '2017-02-22 23:31:11', '2017-02-22 23:34:11', null, '1', '0', 'NOdGcK', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777470819,\"captcha\":\"NOdGcK\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('39', '1487777545288280', '810170512@qq.com', '1', '2017-02-22 23:32:24', '2017-02-22 23:32:24', '2017-02-22 23:35:24', null, '1', '1', 'LHArBs', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777543711,\"captcha\":\"LHArBs\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('40', '1487778625942492', '810170512@qq.com', '1', '2017-02-22 23:50:25', '2017-02-22 23:50:25', '2017-02-22 23:53:25', null, '1', '1', 'SYt86d', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487778625015,\"captcha\":\"SYt86d\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('41', '1487871021985261', '810170512@qq.com', '1', '2017-02-24 01:30:21', '2017-02-24 01:30:21', '2017-02-24 01:33:21', null, '1', '0', 'nSfx28', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487871021429,\"captcha\":\"nSfx28\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('42', '1487871651886848', '810170512@qq.com', '1', '2017-02-24 01:40:51', '2017-02-24 01:40:51', '2017-02-24 01:43:51', null, '1', '0', 'xAgV07', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487871651448,\"captcha\":\"xAgV07\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('43', '1487872361649136', '810170512@qq.com', '1', '2017-02-24 01:52:40', '2017-02-24 01:52:40', '2017-02-24 01:55:40', null, '0', '1', 'oGK86A', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487872359991,\"captcha\":\"oGK86A\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('44', '1487872717291930', '810170512@qq.com', '1', '2017-02-24 01:58:36', '2017-02-24 01:58:36', '2017-02-24 02:01:36', null, '1', '1', 'd5NfKw', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487872715960,\"captcha\":\"d5NfKw\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('45', '1491647990273599', '810170512@qq.com', '1', '2017-04-08 10:39:48', '2017-04-08 10:39:48', '2017-04-08 10:42:48', null, '1', '0', 'wDv3PE', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491647988476,\"captcha\":\"wDv3PE\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('46', '1491648978701782', '810170512@qq.com', '1', '2017-04-08 18:56:18', '2017-04-08 18:56:18', '2017-04-08 18:59:18', null, '1', '0', 'aSoCTQ', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491648978124,\"captcha\":\"aSoCTQ\",\"userNumber\":149164897706941,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('47', '1491650284203754', '810170512@qq.com', '1', '2017-04-08 19:18:03', '2017-04-08 19:18:03', '2017-04-08 19:21:03', null, '1', '1', 'Ur1dQu', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650282983,\"captcha\":\"Ur1dQu\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('48', '1491650337955742', '810170512@qq.com', '1', '2017-04-08 19:18:57', '2017-04-08 19:18:57', '2017-04-08 19:21:57', null, '1', '1', 'g8vsWi', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650337155,\"captcha\":\"g8vsWi\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('49', '1491650453642741', '810170512@qq.com', '1', '2017-04-08 19:20:53', '2017-04-08 19:20:53', '2017-04-08 19:23:53', null, '1', '1', '8MBurs', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650452974,\"captcha\":\"8MBurs\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('50', '1491650676395336', '810170512@qq.com', '1', '2017-04-08 19:24:35', '2017-04-08 19:24:35', '2017-04-08 19:27:35', null, '1', '1', 'jwggOx', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650675469,\"captcha\":\"jwggOx\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('51', '1491650942874317', '810170512@qq.com', '1', '2017-04-08 19:29:02', '2017-04-08 19:29:02', '2017-04-08 19:32:02', null, '1', '1', '4JnujD', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650942232,\"captcha\":\"4JnujD\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('52', '1491651220510927', '810170512@qq.com', '1', '2017-04-08 19:33:39', '2017-04-08 19:33:39', '2017-04-08 19:36:39', null, '1', '0', 'xp7Fjc', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491651219234,\"captcha\":\"xp7Fjc\",\"userNumber\":149165121788087,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('53', '1491651440462718', '810170512@qq.com', '1', '2017-04-08 19:37:19', '2017-04-08 19:37:19', '2017-04-08 19:40:19', null, '1', '1', 'cMRBnf', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491651439395,\"captcha\":\"cMRBnf\",\"userNumber\":149165143828831,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('54', '1491651593536722', '810170512@qq.com', '1', '2017-04-08 11:39:52', '2017-04-08 11:39:52', '2017-04-08 11:42:52', null, '1', '1', 'B6Uh34', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491651592428,\"captcha\":\"B6Uh34\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('55', '1491654257199640', '810170512@qq.com', '1', '2017-04-08 12:24:15', '2017-04-08 12:24:15', '2017-04-08 12:27:15', null, '0', '1', 'G0bF8l', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491654255022,\"captcha\":\"G0bF8l\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('56', '1491654607426876', '810170512@qq.com', '1', '2017-04-08 12:30:04', '2017-04-08 12:30:04', '2017-04-08 12:33:04', null, '0', '1', 'uWx8di', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491654604262,\"captcha\":\"uWx8di\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('57', '1492502674486770', '810170512@qq.com', '1', '2017-04-18 08:04:33', '2017-04-18 08:04:33', '2017-04-18 08:07:33', null, '0', '1', 'sJyo8K', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1492502672892,\"captcha\":\"sJyo8K\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');

-- ----------------------------
-- Table structure for os_favorite
-- ----------------------------
DROP TABLE IF EXISTS `os_favorite`;
CREATE TABLE `os_favorite` (
  `favorite_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏表ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `product_id` bigint(20) unsigned DEFAULT NULL COMMENT '商品ID',
  `product_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品编号',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `show_price` decimal(10,2) DEFAULT NULL COMMENT '显示价格',
  `status` tinyint(2) DEFAULT '1' COMMENT '商品状态：1,上架；2,下架',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`favorite_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏夹表';

-- ----------------------------
-- Records of os_favorite
-- ----------------------------
INSERT INTO `os_favorite` VALUES ('10', '1', '4', '1472581245880', '魅蓝 Note5', 'images/goods/20170226/1471798388806.jpg', '1099.00', '1', '2017-03-29 18:19:16', '1');

-- ----------------------------
-- Table structure for os_kind
-- ----------------------------
DROP TABLE IF EXISTS `os_kind`;
CREATE TABLE `os_kind` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `kind_id` varchar(32) DEFAULT NULL COMMENT '规格Id',
  `product_id` varchar(32) DEFAULT NULL COMMENT '商品Id',
  `type` int(2) DEFAULT NULL COMMENT '类型1:颜色',
  `name` varchar(64) DEFAULT NULL COMMENT '规格名称',
  `pic_img` varchar(100) DEFAULT NULL COMMENT '显示图片',
  `show_price` decimal(12,2) DEFAULT NULL COMMENT '价格',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='规格表\r\n';

-- ----------------------------
-- Records of os_kind
-- ----------------------------
INSERT INTO `os_kind` VALUES ('1', '1', '1016', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('2', '2', '1016', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '29.00', '1', '2', '2019-09-25 17:29:50', '猫宁', '2019-09-25 17:30:12', '猫宁');
INSERT INTO `os_kind` VALUES ('3', '3', '1016', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.50', '1', '3', '2019-09-25 17:29:53', '猫宁', '2019-09-25 17:30:18', '猫宁');
INSERT INTO `os_kind` VALUES ('4', '4', '1016', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '32.00', '1', '4', '2019-09-25 17:29:56', '猫宁', '2019-09-25 17:30:20', '猫宁');
INSERT INTO `os_kind` VALUES ('5', '5', '1016', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '32.00', '1', '5', '2019-09-25 17:29:59', '猫宁', '2019-09-25 17:30:24', '猫宁');
INSERT INTO `os_kind` VALUES ('6', '6', '1016', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '35.00', '1', '6', '2019-09-25 17:30:01', '猫宁', '2019-09-25 17:30:26', '猫宁');
INSERT INTO `os_kind` VALUES ('7', '7', '955', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('8', '8', '955', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '29.00', '1', '2', '2019-09-25 17:29:50', '猫宁', '2019-09-25 17:30:12', '猫宁');
INSERT INTO `os_kind` VALUES ('9', '9', '955', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.50', '1', '3', '2019-09-25 17:29:53', '猫宁', '2019-09-25 17:30:18', '猫宁');
INSERT INTO `os_kind` VALUES ('10', '10', '955', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '32.00', '1', '4', '2019-09-25 17:29:56', '猫宁', '2019-09-25 17:30:20', '猫宁');
INSERT INTO `os_kind` VALUES ('11', '11', '955', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '32.00', '1', '5', '2019-09-25 17:29:59', '猫宁', '2019-09-25 17:30:24', '猫宁');
INSERT INTO `os_kind` VALUES ('12', '12', '955', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '35.00', '1', '6', '2019-09-25 17:30:01', '猫宁', '2019-09-25 17:30:26', '猫宁');
INSERT INTO `os_kind` VALUES ('13', '13', '974', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('14', '14', '974', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '29.00', '1', '2', '2019-09-25 17:29:50', '猫宁', '2019-09-25 17:30:12', '猫宁');
INSERT INTO `os_kind` VALUES ('15', '15', '974', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.50', '1', '3', '2019-09-25 17:29:53', '猫宁', '2019-09-25 17:30:18', '猫宁');
INSERT INTO `os_kind` VALUES ('16', '16', '974', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '32.00', '1', '4', '2019-09-25 17:29:56', '猫宁', '2019-09-25 17:30:20', '猫宁');
INSERT INTO `os_kind` VALUES ('17', '17', '974', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '32.00', '1', '5', '2019-09-25 17:29:59', '猫宁', '2019-09-25 17:30:24', '猫宁');
INSERT INTO `os_kind` VALUES ('18', '18', '974', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '35.00', '1', '6', '2019-09-25 17:30:01', '猫宁', '2019-09-25 17:30:26', '猫宁');
INSERT INTO `os_kind` VALUES ('19', '19', '1014', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('20', '20', '1016', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('21', '21', '1017', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('22', '22', '1018', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('23', '23', '1019', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('24', '24', '1020', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('25', '25', '1021', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('26', '26', '1022', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('27', '27', '1023', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('28', '28', '1024', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('29', '29', '1025', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('30', '30', '1026', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('31', '31', '1027', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('32', '32', '1028', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('33', '33', '1029', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('34', '34', '1030', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('35', '35', '1031', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('36', '36', '1032', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('37', '37', '1033', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('38', '38', '1035', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('39', '39', '1036', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('40', '40', '1037', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('41', '41', '1038', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('42', '42', '1039', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('43', '43', '1040', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('44', '44', '1041', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('45', '45', '1042', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('46', '46', '1043', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('47', '47', '1074', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('48', '48', '1075', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('49', '49', '1076', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('50', '50', '1077', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('51', '51', '1078', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('52', '52', '1079', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('53', '53', '1080', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('54', '54', '1081', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('55', '55', '1082', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('56', '56', '1634', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('57', '57', '1635', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('58', '58', '1636', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('59', '59', '1637', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('60', '60', '1638', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('61', '61', '1639', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('62', '62', '1640', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('63', '63', '1641', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('64', '64', '1642', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('65', '65', '1643', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('66', '66', '1644', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('67', '67', '1645', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('68', '68', '1646', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('69', '69', '1647', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('70', '70', '1648', '1', '4.7英寸-深邃蓝', 'static/img/goodsDetail/pack/1.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('71', '71', '1014', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('72', '72', '1016', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('73', '73', '1017', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('74', '74', '1018', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('75', '75', '1019', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('76', '76', '1020', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('77', '77', '1021', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('78', '78', '1022', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('79', '79', '1023', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('80', '80', '1024', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('81', '81', '1025', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('82', '82', '1026', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('83', '83', '1027', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('84', '84', '1028', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('85', '85', '1029', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('86', '86', '1030', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('87', '87', '1031', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('88', '88', '1032', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('89', '89', '1033', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('90', '90', '1035', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('91', '91', '1036', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('92', '92', '1037', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('93', '93', '1038', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('94', '94', '1039', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('95', '95', '1040', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('96', '96', '1041', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('97', '97', '1042', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('98', '98', '1043', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('99', '99', '1074', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('100', '100', '1075', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('101', '101', '1076', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('102', '102', '1077', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('103', '103', '1078', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('104', '104', '1079', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('105', '105', '1080', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('106', '106', '1081', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('107', '107', '1082', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('108', '108', '1634', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('109', '109', '1635', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('110', '110', '1636', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('111', '111', '1637', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('112', '112', '1638', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('113', '113', '1639', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('114', '114', '1640', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('115', '115', '1641', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('116', '116', '1642', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('117', '117', '1643', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('118', '118', '1644', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('119', '119', '1645', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('120', '120', '1646', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('121', '121', '1647', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('122', '122', '1648', '1', '4.7英寸-星空黑', 'static/img/goodsDetail/pack/2.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('123', '123', '1014', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('124', '124', '1016', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('125', '125', '1017', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('126', '126', '1018', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('127', '127', '1019', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('128', '128', '1020', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('129', '129', '1021', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('130', '130', '1022', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('131', '131', '1023', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('132', '132', '1024', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('133', '133', '1025', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('134', '134', '1026', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('135', '135', '1027', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('136', '136', '1028', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('137', '137', '1029', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('138', '138', '1030', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('139', '139', '1031', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('140', '140', '1032', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('141', '141', '1033', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('142', '142', '1035', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('143', '143', '1036', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('144', '144', '1037', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('145', '145', '1038', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('146', '146', '1039', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('147', '147', '1040', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('148', '148', '1041', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('149', '149', '1042', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('150', '150', '1043', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('151', '151', '1074', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('152', '152', '1075', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('153', '153', '1076', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('154', '154', '1077', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('155', '155', '1078', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('156', '156', '1079', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('157', '157', '1080', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('158', '158', '1081', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('159', '159', '1082', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('160', '160', '1634', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('161', '161', '1635', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('162', '162', '1636', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('163', '163', '1637', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('164', '164', '1638', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('165', '165', '1639', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('166', '166', '1640', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('167', '167', '1641', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('168', '168', '1642', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('169', '169', '1643', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('170', '170', '1644', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('171', '171', '1645', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('172', '172', '1646', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('173', '173', '1647', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('174', '174', '1648', '1', '5.5英寸-香槟金', 'static/img/goodsDetail/pack/3.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('175', '175', '1014', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('176', '176', '1016', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('177', '177', '1017', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('178', '178', '1018', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('179', '179', '1019', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('180', '180', '1020', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('181', '181', '1021', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('182', '182', '1022', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('183', '183', '1023', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('184', '184', '1024', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('185', '185', '1025', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('186', '186', '1026', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('187', '187', '1027', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('188', '188', '1028', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('189', '189', '1029', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('190', '190', '1030', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('191', '191', '1031', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('192', '192', '1032', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('193', '193', '1033', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('194', '194', '1035', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('195', '195', '1036', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('196', '196', '1037', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('197', '197', '1038', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('198', '198', '1039', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('199', '199', '1040', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('200', '200', '1041', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('201', '201', '1042', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('202', '202', '1043', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('203', '203', '1074', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('204', '204', '1075', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('205', '205', '1076', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('206', '206', '1077', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('207', '207', '1078', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('208', '208', '1079', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('209', '209', '1080', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('210', '210', '1081', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('211', '211', '1082', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('212', '212', '1634', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('213', '213', '1635', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('214', '214', '1636', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('215', '215', '1637', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('216', '216', '1638', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('217', '217', '1639', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('218', '218', '1640', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('219', '219', '1641', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('220', '220', '1642', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('221', '221', '1643', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('222', '222', '1644', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('223', '223', '1645', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('224', '224', '1646', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('225', '225', '1647', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('226', '226', '1648', '1', '5.5英寸-深邃蓝', 'static/img/goodsDetail/pack/5.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('227', '227', '1014', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('228', '228', '1016', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('229', '229', '1017', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('230', '230', '1018', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('231', '231', '1019', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('232', '232', '1020', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('233', '233', '1021', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('234', '234', '1022', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('235', '235', '1023', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('236', '236', '1024', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('237', '237', '1025', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('238', '238', '1026', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('239', '239', '1027', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('240', '240', '1028', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('241', '241', '1029', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('242', '242', '1030', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('243', '243', '1031', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('244', '244', '1032', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('245', '245', '1033', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('246', '246', '1035', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('247', '247', '1036', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('248', '248', '1037', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('249', '249', '1038', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('250', '250', '1039', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('251', '251', '1040', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('252', '252', '1041', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('253', '253', '1042', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('254', '254', '1043', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('255', '255', '1074', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('256', '256', '1075', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('257', '257', '1076', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('258', '258', '1077', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('259', '259', '1078', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('260', '260', '1079', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('261', '261', '1080', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('262', '262', '1081', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('263', '263', '1082', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('264', '264', '1634', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('265', '265', '1635', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('266', '266', '1636', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('267', '267', '1637', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('268', '268', '1638', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('269', '269', '1639', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('270', '270', '1640', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('271', '271', '1641', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('272', '272', '1642', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('273', '273', '1643', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('274', '274', '1644', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('275', '275', '1645', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('276', '276', '1646', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('277', '277', '1647', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('278', '278', '1648', '1', '5.5英寸-星空黑', 'static/img/goodsDetail/pack/6.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('279', '279', '1014', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('280', '280', '1016', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('281', '281', '1017', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('282', '282', '1018', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('283', '283', '1019', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('284', '284', '1020', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('285', '285', '1021', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('286', '286', '1022', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('287', '287', '1023', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('288', '288', '1024', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('289', '289', '1025', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('290', '290', '1026', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('291', '291', '1027', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('292', '292', '1028', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('293', '293', '1029', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('294', '294', '1030', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('295', '295', '1031', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('296', '296', '1032', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('297', '297', '1033', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('298', '298', '1035', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('299', '299', '1036', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('300', '300', '1037', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('301', '301', '1038', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('302', '302', '1039', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('303', '303', '1040', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('304', '304', '1041', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('305', '305', '1042', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('306', '306', '1043', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('307', '307', '1074', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('308', '308', '1075', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('309', '309', '1076', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('310', '310', '1077', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('311', '311', '1078', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('312', '312', '1079', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('313', '313', '1080', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('314', '314', '1081', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('315', '315', '1082', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('316', '316', '1634', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('317', '317', '1635', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('318', '318', '1636', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('319', '319', '1637', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('320', '320', '1638', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('321', '321', '1639', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('322', '322', '1640', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('323', '323', '1641', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('324', '324', '1642', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('325', '325', '1643', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('326', '326', '1644', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('327', '327', '1645', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('328', '328', '1646', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('329', '329', '1647', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');
INSERT INTO `os_kind` VALUES ('330', '330', '1648', '1', '5.5英寸-玫瑰金', 'static/img/goodsDetail/pack/4.jpg', '28.00', '1', '1', '2019-09-25 17:29:47', '猫宁', '2019-09-25 17:30:08', '猫宁');

-- ----------------------------
-- Table structure for os_label
-- ----------------------------
DROP TABLE IF EXISTS `os_label`;
CREATE TABLE `os_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `label_name` varchar(20) DEFAULT NULL COMMENT '标签名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `sort` int(9) DEFAULT NULL COMMENT '权限排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品标签表';

-- ----------------------------
-- Records of os_label
-- ----------------------------
INSERT INTO `os_label` VALUES ('1', '热销', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', null);
INSERT INTO `os_label` VALUES ('2', '新品', '1', '2', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', null);
INSERT INTO `os_label` VALUES ('3', '现货', '1', '3', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', null);
INSERT INTO `os_label` VALUES ('4', '有赠品', '1', '4', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', null);

-- ----------------------------
-- Table structure for os_order
-- ----------------------------
DROP TABLE IF EXISTS `os_order`;
CREATE TABLE `os_order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_number` bigint(20) DEFAULT NULL COMMENT '订单编号,系统生成',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pay_type` tinyint(2) DEFAULT '1' COMMENT '支付方式 0=线下支付，1=在线支付',
  `shipment_time` tinyint(2) DEFAULT NULL COMMENT '配送时间 1=不限送货时间，2=工作日送货，3=双休日、假日送货',
  `shipment_type` tinyint(2) DEFAULT '0' COMMENT '配送方式 0=快递配送（免运费），1=快递配送（运费）',
  `shipment_amount` decimal(10,0) DEFAULT '0' COMMENT '快递费',
  `invoice_type` tinyint(2) DEFAULT NULL COMMENT '支付方式 1=不开发票，2=电子发票，3=普通发票',
  `invoice_title` varchar(64) DEFAULT NULL COMMENT '发票抬头',
  `order_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_amount` decimal(10,0) DEFAULT '0' COMMENT '订单金额',
  `order_score` int(11) DEFAULT '0' COMMENT '订单积分',
  `pay_amount` decimal(10,0) DEFAULT NULL COMMENT '支付金额 = 订单金额 + 快递费',
  `buy_number` int(11) DEFAULT NULL COMMENT '商品总数量',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of os_order
-- ----------------------------
INSERT INTO `os_order` VALUES ('27', '15543048148984276', '1', '1', '1', '1', '0', '1', null, '1', '2019-04-03 23:20:14', '2019-04-03 23:20:14', '1799', '1799', '1799', '1');

-- ----------------------------
-- Table structure for os_order_product
-- ----------------------------
DROP TABLE IF EXISTS `os_order_product`;
CREATE TABLE `os_order_product` (
  `order_product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单商品ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `product_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品编号',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `product_spec_attr_id` bigint(20) unsigned DEFAULT NULL COMMENT '商品规格编号',
  `product_spec_attr_name` varchar(64) DEFAULT NULL COMMENT '商品规格名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `buy_number` int(11) DEFAULT NULL COMMENT '商品总数量',
  `product_score` int(11) DEFAULT NULL COMMENT '商品总积分',
  `product_amount` decimal(10,0) DEFAULT NULL COMMENT '商品总金额',
  `comment_status` tinyint(2) DEFAULT '0' COMMENT '评论状态 0=未评论，1=已评论',
  PRIMARY KEY (`order_product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单明细表';

-- ----------------------------
-- Records of os_order_product
-- ----------------------------
INSERT INTO `os_order_product` VALUES ('38', '27', '118634', '康佳(KONKA)B50U 50英寸 4K超高清HDR AI人工智能语音 8G大内存 金属机身 智能网络电视平板液晶电视机', 'product/20190319000000/b61cfe1443c64890b512108f436fa98d.jpg', '94', '55吋4K人工智能新品2+64G内存 ', '1799.00', '1799', '1', '1799', '1799', '0');

-- ----------------------------
-- Table structure for os_order_shipment
-- ----------------------------
DROP TABLE IF EXISTS `os_order_shipment`;
CREATE TABLE `os_order_shipment` (
  `order_shipment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '配送ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `user_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `user_phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `province_id` int(10) unsigned DEFAULT NULL COMMENT '省份ID',
  `province_name` varchar(64) DEFAULT NULL COMMENT '省份名字',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '城市ID',
  `city_name` varchar(64) DEFAULT NULL COMMENT '城市名字',
  `district_id` int(10) unsigned DEFAULT NULL COMMENT '区域ID',
  `district_name` varchar(64) DEFAULT NULL COMMENT '区域名字',
  `user_adress` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `user_zipcode` int(6) DEFAULT NULL COMMENT '邮政编码',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_shipment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单配送表';

-- ----------------------------
-- Records of os_order_shipment
-- ----------------------------
INSERT INTO `os_order_shipment` VALUES ('27', '27', '陈星星', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:18');

-- ----------------------------
-- Table structure for os_product
-- ----------------------------
DROP TABLE IF EXISTS `os_product`;
CREATE TABLE `os_product` (
  `id` bigint(32) NOT NULL COMMENT '主键',
  `product_id` varchar(20) NOT NULL COMMENT '商品ID',
  `shop_id` varchar(32) DEFAULT NULL COMMENT '商户Id',
  `category_id` varchar(20) DEFAULT NULL COMMENT '分类Id',
  `label_id` varchar(10) DEFAULT NULL COMMENT '标签Id',
  `name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `brand` varchar(64) DEFAULT NULL COMMENT '品牌',
  `show_score` int(11) DEFAULT NULL COMMENT '显示积分',
  `show_price` decimal(10,2) DEFAULT NULL COMMENT '显示价格',
  `show_status` tinyint(2) DEFAULT '0' COMMENT '显示状态',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `sales_volume` int(11) DEFAULT NULL COMMENT '销售量',
  `page_views` int(11) DEFAULT NULL COMMENT '游览量',
  `comment_number` int(11) DEFAULT NULL COMMENT '评论数量',
  `comment_num_detail` varchar(0) DEFAULT NULL COMMENT '评论数详情[追评,好评,中评,差评]',
  `favorite_number` int(11) DEFAULT NULL COMMENT '收藏数',
  `question_number` int(11) DEFAULT NULL COMMENT '提问数',
  `big_img` varchar(255) DEFAULT NULL COMMENT '大图',
  `small_img` varchar(255) DEFAULT NULL COMMENT '小图',
  `tags` varchar(255) DEFAULT NULL COMMENT '商品标签',
  `discount` varchar(255) DEFAULT NULL COMMENT '商品折扣',
  `promotion` varchar(255) DEFAULT NULL COMMENT '商品推广',
  `introduce` varchar(200) DEFAULT NULL COMMENT '商品介绍',
  `detail` text COMMENT '商品介绍',
  `parameter` text COMMENT '商品参数',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `shelve_by` varchar(64) DEFAULT NULL COMMENT '上架人',
  `shelve_time` datetime DEFAULT NULL COMMENT '上架时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of os_product
-- ----------------------------
INSERT INTO `os_product` VALUES ('955', '955', '1523565656', '2067', '2067', '芯硅谷 C4719 LDPE透明平口塑料袋 305×406mm 1箱(100只/包×10)', '2067', '619', '619.90', '1', '2492', '3178', '5031', '3047', null, '1809', '2590', 'static/img/goodsList/item-show-5.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 C4719 LDPE透明平口塑料袋 305×406mm 1箱(100只/包×10)', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:35', '京东', '2019-03-17 22:58:35', '京东', '2019-03-17 22:58:35', '京东');
INSERT INTO `os_product` VALUES ('974', '974', '1523565656', '2067', '2067', '谱析光学581玻璃比色皿光程5mm两通光德国进口玻璃耐酸碱可开票', '2067', '53', '53.00', '1', '4582', '1713', '4202', '2360', null, '1578', '1742', 'static/img/goodsList/item-show-6.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '谱析光学581玻璃比色皿光程5mm两通光德国进口玻璃耐酸碱可开票', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:35', '京东', '2019-03-17 22:58:35', '京东', '2019-03-17 22:58:35', '京东');
INSERT INTO `os_product` VALUES ('1014', '1014', '1523565656', '2067', '2067', '省惠Whatman玻璃微纤维滤纸934-AH1827-110/125/150 1.5um 6809-5522含普票价', '2067', '3750', '3750.00', '1', '3433', '5030', '5913', '2656', null, '2458', '936', 'static/img/goodsList/item-show-1.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '省惠Whatman玻璃微纤维滤纸934-AH1827-110/125/150 1.5um 6809-5522含普票价', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1016', '1016', '1523565656', '2067', '2067', '芯硅谷 B6026 兰白线四氟滴定管，兰白线酸式滴定管;兰白滴定管 容积 10ml 1盒（1支）', '2067', '226', '226.70', '1', '3415', '2009', '4960', '198', null, '1553', '5453', 'static/img/goodsList/item-show-2.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 B6026 兰白线四氟滴定管，兰白线酸式滴定管;兰白滴定管 容积 10ml 1盒（1支）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1017', '1017', '1523565656', '2067', '2067', '【森飞实验耗材】硅胶管 实验室硅胶软管 8*12MM', '2067', '16', '16.00', '1', '774', '950', '1055', '5020', null, '388', '453', 'static/img/goodsList/item-show-3.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '【森飞实验耗材】硅胶管 实验室硅胶软管 8*12MM', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1018', '1018', '1523565656', '2067', '2067', '芯硅谷 H5975 六角量筒，TC量入式量筒;玻璃量筒;刻度量筒 500ml 1盒（2个）', '2067', '188', '188.20', '1', '5621', '4720', '2395', '505', null, '3281', '3903', 'static/img/goodsList/item-show-4.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 H5975 六角量筒，TC量入式量筒;玻璃量筒;刻度量筒 500ml 1盒（2个）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1019', '1019', '1523565656', '2067', '2067', '芯硅谷 C5983 圆底量筒,TC量入式,高硼硅料,5-2000ml 100ml 1盒2个', '2067', '46', '46.80', '1', '1781', '2748', '2806', '5463', null, '3236', '153', 'static/img/goodsList/item-show-5.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 C5983 圆底量筒,TC量入式,高硼硅料,5-2000ml 100ml 1盒2个', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1020', '1020', '1523565656', '2067', '2067', '德国泛特（FORANT） 81101224 玻璃三角烧瓶 容积：3000ml', '2067', '331', '331.24', '1', '4041', '5576', '844', '1796', null, '335', '1056', 'static/img/goodsList/item-show-6.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '德国泛特（FORANT） 81101224 玻璃三角烧瓶 容积：3000ml', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1021', '1021', '1523565656', '2067', '2067', '开票耐温1600度/99%氧化铝圆柱形坩埚刚玉材质灰分挥发多规格 1400ml(130x130)', '2067', '160', '160.00', '1', '2858', '1636', '1798', '4587', null, '3963', '4816', 'static/img/goodsList/item-show-7.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '开票耐温1600度/99%氧化铝圆柱形坩埚刚玉材质灰分挥发多规格 1400ml(130x130)', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1022', '1022', '1523565656', '2067', '2067', '【森飞实验】实验室耗材 pm996 Parafilm封口膜', '2067', '135', '135.00', '1', '2164', '3449', '457', '5544', null, '811', '2909', 'static/img/goodsList/item-show-8.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '【森飞实验】实验室耗材 pm996 Parafilm封口膜', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1023', '1023', '1523565656', '2067', '2067', '省惠whatman1号定性滤纸1001-047/055/070/090/110/125mm 11um 1001-110含普票', '2067', '126', '126.00', '1', '2243', '335', '2889', '1958', null, '4161', '95', 'static/img/goodsList/item-show-1.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '省惠whatman1号定性滤纸1001-047/055/070/090/110/125mm 11um 1001-110含普票', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1024', '1024', '1523565656', '2067', '2067', '芯硅谷 R6105 移液器支架 移液枪架 类型 环型', '2067', '234', '234.90', '1', '4721', '3323', '1071', '5156', null, '369', '3744', 'static/img/goodsList/item-show-2.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 R6105 移液器支架 移液枪架 类型 环型', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1025', '1025', '1523565656', '2067', '2067', '芯硅谷 F2820 高密度聚乙烯氟化堆码桶 10L,瓶口直径50mm 1个', '2067', '92', '92.90', '1', '4875', '3610', '2686', '1905', null, '1361', '435', 'static/img/goodsList/item-show-3.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 F2820 高密度聚乙烯氟化堆码桶 10L,瓶口直径50mm 1个', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1026', '1026', '1523565656', '2067', '2067', '塑料放水桶5000ml水龙头密封加厚蒸馏水桶耐酸碱小号实验室水桶', '2067', '178', '178.00', '1', '4210', '2076', '4212', '53', null, '5694', '2940', 'static/img/goodsList/item-show-4.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '塑料放水桶5000ml水龙头密封加厚蒸馏水桶耐酸碱小号实验室水桶', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1027', '1027', '1523565656', '2067', '2067', '德国泛特（FORANT）81101304 玻璃扁型称量瓶 尺寸:50x30mm', '2067', '167', '167.58', '1', '420', '5549', '1001', '549', null, '385', '1394', 'static/img/goodsList/item-show-5.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '德国泛特（FORANT）81101304 玻璃扁型称量瓶 尺寸:50x30mm', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1028', '1028', '1523565656', '2067', '2067', '【实验耗材】实验用定性滤纸 圆形 方形实验室滤纸片美术绘画大张滤纸直径20/25CM/30CM 圆形30CM 慢速100张/盒', '2067', '78', '78.00', '1', '1468', '3512', '4367', '2583', null, '2840', '4148', 'static/img/goodsList/item-show-6.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '【实验耗材】实验用定性滤纸 圆形 方形实验室滤纸片美术绘画大张滤纸直径20/25CM/30CM 圆形30CM 慢速100张/盒', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1029', '1029', '1523565656', '2067', '2067', '芯硅谷 S3318 不锈钢消毒筒 ,不锈钢滴管灭菌筒;不锈钢吸管消毒筒 直径×高度76×350mm;1个', '2067', '156', '156.70', '1', '77', '913', '827', '5266', null, '1044', '4554', 'static/img/goodsList/item-show-7.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 S3318 不锈钢消毒筒 ,不锈钢滴管灭菌筒;不锈钢吸管消毒筒 直径×高度76×350mm;1个', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1030', '1030', '1523565656', '2067', '2067', '芯硅谷 P3963 普通型载玻片 无书写面,抛光边,45°角 1包(50片/盒×2)', '2067', '29', '29.15', '1', '1980', '27', '3035', '578', null, '2696', '4323', 'static/img/goodsList/item-show-8.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 P3963 普通型载玻片 无书写面,抛光边,45°角 1包(50片/盒×2)', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1031', '1031', '1523565656', '2067', '2067', '芯硅谷 A1423 铝箔卷 铝箔纸 锡纸 长60m;宽*厚300*0.018mm,无花纹', '2067', '66', '66.40', '1', '3667', '3391', '689', '5089', null, '4345', '1949', 'static/img/goodsList/item-show-1.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 A1423 铝箔卷 铝箔纸 锡纸 长60m;宽*厚300*0.018mm,无花纹', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1032', '1032', '1523565656', '2067', '2067', '推玻片 血涂推片 骨髓推片 7101载玻片 50片/盒', '2067', '118', '118.80', '1', '393', '4874', '336', '5710', null, '1636', '2776', 'static/img/goodsList/item-show-2.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '推玻片 血涂推片 骨髓推片 7101载玻片 50片/盒', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1033', '1033', '1523565656', '2067', '2067', '【福盼实验室】实验室耗材 pm996 Parafilm封口膜 实验室膜', '2067', '118', '118.00', '1', '2959', '2194', '5614', '1280', null, '1144', '2030', 'static/img/goodsList/item-show-3.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '【福盼实验室】实验室耗材 pm996 Parafilm封口膜 实验室膜', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1035', '1035', '1523565656', '2067', '2067', '【实验耗材】实验室手套 丁晴手套 乳胶手套 检查手套 橡胶手套 耐酸碱手套 检查手套 50付/盒', '2067', '48', '48.00', '1', '1616', '2346', '3059', '1267', null, '806', '1820', 'static/img/goodsList/item-show-4.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '【实验耗材】实验室手套 丁晴手套 乳胶手套 检查手套 橡胶手套 耐酸碱手套 检查手套 50付/盒', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1036', '1036', '1523565656', '2067', '2067', 'AS ONE 6-633-01 自封袋(未灭菌) A-4 (300张)', '2067', '87', '87.56', '1', '5200', '5143', '4449', '2491', null, '599', '3007', 'static/img/goodsList/item-show-5.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', 'AS ONE 6-633-01 自封袋(未灭菌) A-4 (300张)', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1037', '1037', '1523565656', '2067', '2067', '勤凯工业品玻璃容量瓶/天玻容量瓶A级100ml实验室化学仪器耗材', '2067', '41', '41.00', '1', '3149', '675', '1064', '2653', null, '573', '3572', 'static/img/goodsList/item-show-6.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '勤凯工业品玻璃容量瓶/天玻容量瓶A级100ml实验室化学仪器耗材', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1038', '1038', '1523565656', '2067', '2067', '丽科有机沼液肥 蔬菜瓜果绿色植物营养液叶面肥果树液体肥料 沼液肥2瓶 1kg', '2067', '39', '39.20', '1', '141', '5945', '3973', '5791', null, '1068', '2837', 'static/img/goodsList/item-show-7.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '丽科有机沼液肥 蔬菜瓜果绿色植物营养液叶面肥果树液体肥料 沼液肥2瓶 1kg', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1039', '1039', '1523565656', '2067', '2067', 'AS ONE 1-4622-16 聚丙烯带把手烧杯2000ml（1个）', '2067', '39', '39.40', '1', '3256', '3697', '4671', '2990', null, '3615', '3468', 'static/img/goodsList/item-show-8.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', 'AS ONE 1-4622-16 聚丙烯带把手烧杯2000ml（1个）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1040', '1040', '1523565656', '2067', '2067', '冰禹（ICEY）广口圆身瓶 防漏样品试剂瓶实验耗材 1000ML PP', '2067', '39', '39.00', '1', '3853', '647', '5434', '3578', null, '2870', '2825', 'static/img/goodsList/item-show-1.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '冰禹（ICEY）广口圆身瓶 防漏样品试剂瓶实验耗材 1000ML PP', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1041', '1041', '1523565656', '2067', '2067', 'EP离心管塑料pcr圆底带刻度微量实验室耗材0.5 1.5 2 5 10 15 50ml 螺口圆底50ml*50只', '2067', '25', '25.00', '1', '3498', '4141', '1154', '2916', null, '3504', '3717', 'static/img/goodsList/item-show-2.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', 'EP离心管塑料pcr圆底带刻度微量实验室耗材0.5 1.5 2 5 10 15 50ml 螺口圆底50ml*50只', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1042', '1042', '1523565656', '2067', '2067', '芯硅谷 G6034 玻璃棒 6mm× 300mm 1盒(40根)', '2067', '61', '61.90', '1', '5927', '762', '1466', '3843', null, '2907', '4110', 'static/img/goodsList/item-show-3.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '芯硅谷 G6034 玻璃棒 6mm× 300mm 1盒(40根)', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1043', '1043', '1523565656', '2067', '2067', '优百思（YOUBAISI） 适用佳能836 835墨盒 IP1188墨盒黑色墨盒 连供墨盒 添加墨水(100ML黑色)4支', '2067', '61', '61.00', '1', '1137', '3386', '3866', '4467', null, '4019', '3398', 'static/img/goodsList/item-show-4.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '优百思（YOUBAISI） 适用佳能836 835墨盒 IP1188墨盒黑色墨盒 连供墨盒 添加墨水(100ML黑色)4支', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东', '2019-03-17 22:58:39', '京东');
INSERT INTO `os_product` VALUES ('1074', '1074', '1523565656', '2067', '2067', '标准口蒸馏弯头 24*24 蒸馏弯头75度 玻璃仪器 实验室耗材', '2067', '18', '18.50', '1', '5904', '2640', '2927', '4801', null, '5371', '4654', 'static/img/goodsList/item-show-5.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '标准口蒸馏弯头 24*24 蒸馏弯头75度 玻璃仪器 实验室耗材', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东');
INSERT INTO `os_product` VALUES ('1075', '1075', '1523565656', '2067', '2067', '上心（SHANGXIN）烧杯夹 耐高温铁夹 28cm 实验室耗材 化学实验器材', '2067', '8', '8.00', '1', '2105', '3040', '3037', '4604', null, '2797', '1076', 'static/img/goodsList/item-show-6.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '上心（SHANGXIN）烧杯夹 耐高温铁夹 28cm 实验室耗材 化学实验器材', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东');
INSERT INTO `os_product` VALUES ('1076', '1076', '1523565656', '2067', '2067', '苏品 接种丝 100根/包 镍铬丝 接种针 接种环 实验耗材 实验室器材', '2067', '16', '16.00', '1', '4812', '1279', '401', '2612', null, '3868', '3413', 'static/img/goodsList/item-show-7.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '苏品 接种丝 100根/包 镍铬丝 接种针 接种环 实验耗材 实验室器材', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东');
INSERT INTO `os_product` VALUES ('1077', '1077', '1523565656', '2067', '2067', '塑料冲洗瓶塑形镜OK镜喷码机清洗瓶长嘴实验室浇水瓶壶 窄口250ml', '2067', '19', '19.00', '1', '5742', '3272', '4889', '5245', null, '4949', '1835', 'static/img/goodsList/item-show-8.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '塑料冲洗瓶塑形镜OK镜喷码机清洗瓶长嘴实验室浇水瓶壶 窄口250ml', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东');
INSERT INTO `os_product` VALUES ('1078', '1078', '1523565656', '2067', '2067', '【福盼实验室】【实验耗材】加厚玻璃烧杯 带把手 带柄烧杯 带刻度酒杯 500ML', '2067', '14', '14.00', '1', '2270', '521', '5243', '386', null, '1137', '4932', 'static/img/goodsList/item-show-1.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '【福盼实验室】【实验耗材】加厚玻璃烧杯 带把手 带柄烧杯 带刻度酒杯 500ML', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东');
INSERT INTO `os_product` VALUES ('1079', '1079', '1523565656', '2067', '2067', '罗本德 消毒快餐盒 铝制饭盒0.85L灭菌盒1.4L 实验室耗材 1.4L', '2067', '14', '14.00', '1', '123', '4784', '5543', '4192', null, '2834', '1155', 'static/img/goodsList/item-show-2.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '罗本德 消毒快餐盒 铝制饭盒0.85L灭菌盒1.4L 实验室耗材 1.4L', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东');
INSERT INTO `os_product` VALUES ('1080', '1080', '1523565656', '2067', '2067', '格物致知（GEWUZHIZHI） 一包 一次性塑料滴管 带刻度 巴氏吸管 实验室耗材 教学仪器 器材 3mL 一包100支', '2067', '13', '13.00', '1', '5801', '4356', '5983', '1802', null, '4759', '2976', 'static/img/goodsList/item-show-3.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '格物致知（GEWUZHIZHI） 一包 一次性塑料滴管 带刻度 巴氏吸管 实验室耗材 教学仪器 器材 3mL 一包100支', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东');
INSERT INTO `os_product` VALUES ('1081', '1081', '1523565656', '2067', '2067', '思齐（SiQi） 石棉网 多规格隔热网 化学实验器材实验室用品 耗材12.5cm15cm20cm 石棉网20cm', '2067', '3', '3.00', '1', '4633', '1426', '1284', '2431', null, '3289', '5413', 'static/img/goodsList/item-show-4.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '思齐（SiQi） 石棉网 多规格隔热网 化学实验器材实验室用品 耗材12.5cm15cm20cm 石棉网20cm', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东');
INSERT INTO `os_product` VALUES ('1082', '1082', '1523565656', '2067', '2067', '冲版机过滤棉芯10寸线绕棉芯电镀专用过滤芯 PP棉滤芯 净水器滤芯 5Um绕线20寸(50CM)', '2067', '14', '14.00', '1', '5759', '59', '467', '746', null, '2168', '134', 'static/img/goodsList/item-show-5.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '冲版机过滤棉芯10寸线绕棉芯电镀专用过滤芯 PP棉滤芯 净水器滤芯 5Um绕线20寸(50CM)', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东', '2019-03-17 22:58:44', '京东');
INSERT INTO `os_product` VALUES ('1634', '1634', '1523565656', '2067', '2067', '伟星 白色PPR水管 纤维复合冷热水管 饮用水管 质保50年 4分/20*3.4 20米（2米/根*10）', '2067', '363', '363.00', '1', '2894', '2015', '4482', '2434', null, '969', '2426', 'static/img/goodsList/item-show-6.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 白色PPR水管 纤维复合冷热水管 饮用水管 质保50年 4分/20*3.4 20米（2米/根*10）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1635', '1635', '1523565656', '2067', '2067', '语塑 PVC排水管材管件 存水弯DN50 工程款PS1401 30只装CCJC', '2067', '180', '180.00', '1', '3193', '3895', '3005', '3931', null, '4338', '5729', 'static/img/goodsList/item-show-7.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '语塑 PVC排水管材管件 存水弯DN50 工程款PS1401 30只装CCJC', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1636', '1636', '1523565656', '2067', '2067', '国标阀门 黄铜截止阀 工程旋塞式内螺纹铜截止阀 DN50', '2067', '188', '188.86', '1', '1278', '1427', '1577', '348', null, '779', '3364', 'static/img/goodsList/item-show-8.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '国标阀门 黄铜截止阀 工程旋塞式内螺纹铜截止阀 DN50', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1637', '1637', '1523565656', '2067', '2067', '伟星 白色环保PPR20 4分配件 管材管件 PPR水管配件水暖管件 等径三通20/4分 白色（10个/袋）', '2067', '55', '55.00', '1', '2810', '1448', '4866', '1948', null, '2880', '5628', 'static/img/goodsList/item-show-1.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 白色环保PPR20 4分配件 管材管件 PPR水管配件水暖管件 等径三通20/4分 白色（10个/袋）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1638', '1638', '1523565656', '2067', '2067', '伟星 PPR管材 管件20 4分配件 PPR水管配件水暖管件白色 内丝弯头20/4分*1/2 白色', '2067', '19', '19.00', '1', '4212', '2954', '1597', '2690', null, '62', '47', 'static/img/goodsList/item-show-2.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 PPR管材 管件20 4分配件 PPR水管配件水暖管件白色 内丝弯头20/4分*1/2 白色', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1639', '1639', '1523565656', '2067', '2067', '伟星 白色环保PPR20 4分配件 管材管件 PPR水管配件水暖管件 外丝直接20/4分*1/2 白色（5个/袋）', '2067', '108', '108.00', '1', '628', '4427', '5386', '1604', null, '3667', '1350', 'static/img/goodsList/item-show-3.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 白色环保PPR20 4分配件 管材管件 PPR水管配件水暖管件 外丝直接20/4分*1/2 白色（5个/袋）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1640', '1640', '1523565656', '2067', '2067', '伟星 白色环保PPR20 4分配件 管材管件 PPR水管配件水暖管件 内丝弯头20/4分*1/2 白色（5个/袋）', '2067', '109', '109.00', '1', '2502', '1270', '4136', '5947', null, '146', '607', 'static/img/goodsList/item-show-4.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 白色环保PPR20 4分配件 管材管件 PPR水管配件水暖管件 内丝弯头20/4分*1/2 白色（5个/袋）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1641', '1641', '1523565656', '2067', '2067', '伟星 绿色环保PPR25 6分配件 管材管件 PPR水管配件水暖管件 双热熔球阀25/6分 绿色（1个/袋）', '2067', '149', '149.00', '1', '4625', '5066', '4520', '923', null, '1726', '4980', 'static/img/goodsList/item-show-5.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 绿色环保PPR25 6分配件 管材管件 PPR水管配件水暖管件 双热熔球阀25/6分 绿色（1个/袋）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1642', '1642', '1523565656', '2067', '2067', '伟星 PPR管材管件25 6分ppr水管配件 PPR水暖管件 截止阀25/6分 白色', '2067', '109', '109.00', '1', '3614', '3517', '4191', '4769', null, '2192', '5077', 'static/img/goodsList/item-show-6.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 PPR管材管件25 6分ppr水管配件 PPR水暖管件 截止阀25/6分 白色', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1643', '1643', '1523565656', '2067', '2067', '伟星 传鸿PPR水管热熔器 热熔机 PPR 管材管件热熔器 焊接工具 20-32 600W', '2067', '528', '528.00', '1', '4193', '2386', '1391', '3075', null, '5778', '4443', 'static/img/goodsList/item-show-7.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 传鸿PPR水管热熔器 热熔机 PPR 管材管件热熔器 焊接工具 20-32 600W', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1644', '1644', '1523565656', '2067', '2067', '天一金牛 PPR双头活接铜球阀 20 25 32 4分 6分 ppr水管配件 20', '2067', '45', '45.50', '1', '4123', '1378', '379', '1067', null, '4310', '980', 'static/img/goodsList/item-show-8.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '天一金牛 PPR双头活接铜球阀 20 25 32 4分 6分 ppr水管配件 20', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1645', '1645', '1523565656', '2067', '2067', '国标pvc钢手柄球阀 给水阀门 20 25 32 50 75 110 开关止水阀 110', '2067', '129', '129.00', '1', '2030', '5726', '3720', '2104', null, '4213', '3568', 'static/img/goodsList/item-show-1.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '国标pvc钢手柄球阀 给水阀门 20 25 32 50 75 110 开关止水阀 110', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1646', '1646', '1523565656', '2067', '2067', '伟星 白色环保PPR25 6分配件 管材管件 PPR水管配件 90度弯头25/6分 白色（10个/袋）', '2067', '53', '53.00', '1', '3782', '495', '5459', '1318', null, '2134', '2900', 'static/img/goodsList/item-show-2.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 白色环保PPR25 6分配件 管材管件 PPR水管配件 90度弯头25/6分 白色（10个/袋）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1647', '1647', '1523565656', '2067', '2067', '伟星 白色环保PPR20 4分配件 管材管件 PPR水管配件水暖管件 90度弯头20/4分 白色（10个/袋）', '2067', '53', '53.00', '1', '814', '3294', '4134', '276', null, '4028', '3791', 'static/img/goodsList/item-show-3.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 白色环保PPR20 4分配件 管材管件 PPR水管配件水暖管件 90度弯头20/4分 白色（10个/袋）', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');
INSERT INTO `os_product` VALUES ('1648', '1648', '1523565656', '2067', '2067', '伟星 ppr水管 白色PPR纤维复合冷热水通用型水管 ppr管材 暖气管 6分/25*3.5壁厚 2米/根', '2067', '42', '42.00', '1', '4725', '2983', '4290', '3424', null, '1735', '4255', 'static/img/goodsList/item-show-4.jpg', '[\'static/img/goodsDetail/item-detail-1.jpg\',\'static/img/goodsDetail/item-detail-2.jpg\',\'static/img/goodsDetail/item-detail-3.jpg\',\'static/img/goodsDetail/item-detail-4.jpg\']', '[\"满69-20元\",\"关注产品★送钢化膜\",\"BIT配次日达\"]', '[\"满148减10\",\"满218减20\",\"满288减30\"]', '[\"跨店满减\",\"多买优惠\"]', '伟星 ppr水管 白色PPR纤维复合冷热水通用型水管 ppr管材 暖气管 6分/25*3.5壁厚 2米/根', '[\'static/img/goodsDetail/intro/1.jpg\',\'static/img/goodsDetail/intro/2.jpg\',\'static/img/goodsDetail/intro/3.jpg\',\'static/img/goodsDetail/intro/4.jpg\']', '[{key: \'商品名称\',value: \'iPhone7手机壳\'},{key: \'商品编号\',value: \'10435663237\'},{key: \'店铺\',value: \'GavinShop\'},{key: \'商品毛重\',value: \'100.00g\'},{key: \'商品产地\',value: \'中国大陆\'},{key: \'机型\',value: \'iPhone7\'},{key: \'材质\',value: \'PC/塑料\'},{key: \'款式\',value: \'软壳\'},{key: \'适用人群\',value: \'通用\'}]', '猫宁精品', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东', '2019-03-17 22:59:21', '京东');

-- ----------------------------
-- Table structure for os_question
-- ----------------------------
DROP TABLE IF EXISTS `os_question`;
CREATE TABLE `os_question` (
  `question_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '提问ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `content` varchar(255) DEFAULT NULL COMMENT '提问内容',
  `good_count` int(11) DEFAULT '0' COMMENT '好评数',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态：1.显示；0.隐藏',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `answer_content` varchar(255) DEFAULT NULL COMMENT '回答内容',
  `answer_by` varchar(255) DEFAULT NULL COMMENT '回复人',
  `answer_time` datetime DEFAULT NULL COMMENT '回复时间',
  `type` tinyint(2) DEFAULT '0' COMMENT '状态：1.已处理；0.未处理；2.不予处理',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='提问表';

-- ----------------------------
-- Records of os_question
-- ----------------------------
INSERT INTO `os_question` VALUES ('1', '1', '1', '猫宁', 'default/avatar/avatar_8.jpg', '商城的所有产品必须超过150免邮配送么', '4', '1', '2017-03-05 01:09:03', '猫宁', '您好，购买手机是免邮的~购买配件等商品在150元以下，需按照10元/单标准支付邮费， “满150元免邮费”需以实际支付金额超过150元为准。小米电视、空气净化器、体重秤因商品特殊性不参与满150元包邮活动。如遇活动期，资费标准以活动公告为准哦，感谢您对小米的支持，祝您购物愉快~', '猫宁', '2017-03-05 01:11:04', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('2', '1', '1', '猫宁', 'default/avatar/avatar_4.jpg', '邮费多少', '57', '1', '2017-03-05 01:09:03', '猫宁', '您好，购买手机是免邮的~购买配件等商品在150元以下，需按照10元/单标准支付邮费， “满150元免邮费”需以实际支付金额超过150元为准。小米电视、空气净化器、体重秤因商品特殊性不参与满150元包邮活动。如遇活动期，资费标准以活动公告为准哦，感谢您对小米的支持，祝您购物愉快~', '猫宁', '2017-03-05 01:11:04', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('3', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '57', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:04', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('4', '1', '1', '猫宁', 'default/avatar/avatar_8.jpg', '测试提问', '57', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:05', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('5', '1', '1', '猫宁', 'default/avatar/avatar_4.jpg', '测试提问', '57', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:05', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('6', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:05', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('7', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('8', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('9', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('10', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('11', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('12', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('13', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '你hi奥？', '111', '1', '2017-03-29 20:43:35', '1', '回复，回复', '猫宁', '2017-03-29 20:43:56', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('14', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '我可以进行提问吗？', '118', '1', '2017-03-29 20:48:33', '1', '当然可以啊', '猫宁', '2017-03-29 20:48:54', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('15', '3', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '我可以进行题吗？', '99', '1', '2017-03-29 20:43:35', '1', '回复，回复', '猫宁', '2017-03-29 20:43:56', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('16', '3', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '我看ifsdaf斯蒂芬', '100', '1', '2017-03-29 20:48:33', '1', '当然可以啊', '猫宁', '2017-03-29 20:48:54', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('17', '3', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '电视发射点发斯蒂芬', '0', '0', '2017-05-11 14:27:58', '穿鞋子的猫', null, null, null, '0', null, null);
INSERT INTO `os_question` VALUES ('18', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '撒大帝', '0', '0', '2017-05-11 15:47:52', '穿鞋子的猫', null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for os_recommend
-- ----------------------------
DROP TABLE IF EXISTS `os_recommend`;
CREATE TABLE `os_recommend` (
  `recommend_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐位Id',
  `product_id` int(11) DEFAULT NULL COMMENT '商品Id',
  `name` varchar(64) DEFAULT NULL COMMENT '推荐位名称',
  `type` int(1) DEFAULT NULL COMMENT '推荐类型0:首页推荐,1:店铺推荐，2:购物车推荐',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `sales_volume` int(11) DEFAULT '0' COMMENT '销售量',
  `show_price` int(11) DEFAULT NULL COMMENT '显示价格',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态 1=显示/0=隐藏',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`recommend_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='推荐位表';

-- ----------------------------
-- Records of os_recommend
-- ----------------------------
INSERT INTO `os_recommend` VALUES ('1', '955', 'iPhone7/6s/8钢化膜苹果7Plus全屏全覆盖3D抗蓝', '1', 'static/img/otherBuy/1.jpg', '10', '29', '1', '2017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('2', '974', '苹果数据线 苹果iPhoneX/6s/7plus/8充电线', '1', 'static/img/otherBuy/2.jpg', '10', '10', '1', '2017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('3', '1014', '苹果8/7/6/6s钢化膜 iphone8/7/6s/6钢化玻璃', '1', 'static/img/otherBuy/3.jpg', '4', '4', '1', '2017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('4', '1016', 'iPhone6s/7钢化膜苹果8 Plus手机膜抗蓝光非全屏', '1', 'static/img/otherBuy/4.jpg', '10', '10', '1', '2017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('5', '1017', '苹果6s手机壳iPhone6s Plus保护壳防摔全', '1', 'static/img/otherBuy/5.jpg', '0', '29', '0', '0017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('6', '1018', 'iPhone7/8手机壳手机套防摔磨砂保护壳星空黑☆全包保护', '1', 'static/img/otherBuy/6.jpg', '0', '10', '0', '0017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('7', '1019', '数据线 适用于苹果iPhone 6s/6plus/7plus/8/X', '1', 'static/img/otherBuy/7.jpg', '0', '29', '0', '0017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('8', '1020', 'iPhone8/7/6S/6钢化膜 苹果8/7/6s/6玻璃膜 手机高', '1', 'static/img/otherBuy/8.jpg', '0', '10', '0', '0017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');

-- ----------------------------
-- Table structure for os_shop
-- ----------------------------
DROP TABLE IF EXISTS `os_shop`;
CREATE TABLE `os_shop` (
  `shop_id` varchar(32) NOT NULL COMMENT '买家id',
  `real_name` varchar(32) DEFAULT NULL COMMENT '买家名称',
  `shop_name` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `addr` varchar(255) DEFAULT NULL COMMENT '注册地址',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of os_shop
-- ----------------------------
INSERT INTO `os_shop` VALUES ('1523565656', '最亮的星', 'IPhone专卖店', null);

-- ----------------------------
-- Table structure for os_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `os_shopping_cart`;
CREATE TABLE `os_shopping_cart` (
  `cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `product_id` bigint(20) DEFAULT NULL,
  `kind_id` varchar(30) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `buy_number` int(11) DEFAULT '1' COMMENT '购买数量',
  `check_status` char(2) DEFAULT '1' COMMENT '购物车状态：N:未选中；Y:选中',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- ----------------------------
-- Records of os_shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for os_user
-- ----------------------------
DROP TABLE IF EXISTS `os_user`;
CREATE TABLE `os_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_number` bigint(20) unsigned DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `login_password` varchar(256) DEFAULT NULL COMMENT '登录密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '加密密码的盐',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别 0=保密/1=男/2=女',
  `age` tinyint(4) DEFAULT '0' COMMENT '年龄',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0=冻结/1=正常',
  `email_is_active` tinyint(1) DEFAULT '0' COMMENT '邮箱激活 0=未激活/1=已激活',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `telephone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `login_number` bigint(20) DEFAULT '0' COMMENT '登录次数',
  `regeist_time` datetime DEFAULT NULL COMMENT '注册时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `amount` decimal(10,0) DEFAULT '0' COMMENT '消费额',
  `rank_id` bigint(20) DEFAULT NULL COMMENT '会员等级ID',
  `score` int(11) DEFAULT '0' COMMENT '会员积分',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of os_user
-- ----------------------------
INSERT INTO `os_user` VALUES ('1', '14875975007231277', '穿鞋子的猫', 'e10adc3949ba59abbe56e057f20f883e', 'IeA7iu', '陈星星', '0', '0', 'default/avatar/avatar_8.jpg', '1', '1', '810170512@qq.com', '13359478971', '2019-04-03 23:18:17', '192.168.213.1', '90', '2017-02-21 15:19:07', null, '2017-02-24 01:53:02', '穿鞋子的猫', null, null, '0');
INSERT INTO `os_user` VALUES ('8', '148777295260796', '陈星星', 'e10adc3949ba59abbe56e057f20f883e', 'jmslV1', '陈星星', '0', '0', 'default/avatar/avatar_4.jpg', '1', '1', '55245511@qq.com', '13359478972', '2017-02-22 22:16:24', '172.27.201.108', '1', '2017-02-22 22:15:53', '陈星星', null, null, '0', null, '0');
INSERT INTO `os_user` VALUES ('12', '148777481346536', '陈星星', 'e10adc3949ba59abbe56e057f20f883e', 'uN2Gdw', '陈星星', '0', '0', 'default/avatar/avatar_5.jpg', '1', '1', '55245521@qq.com', '13359478973', null, null, '0', '2017-02-22 22:46:53', '陈星星', null, null, '0', null, '0');
INSERT INTO `os_user` VALUES ('28', '149165425386333', '陈星星', 'e10adc3949ba59abbe56e057f20f883e', '9B9H9P', '陈星星', '0', '0', 'default/avatar/avatar_7.jpg', '1', '1', '810170513@qq.com', '13359478974', '2017-05-09 13:10:28', '172.27.85.77', '0', '2017-04-08 12:24:14', '陈星星', '2017-04-18 08:05:39', '陈星星', '0', null, '0');

-- ----------------------------
-- Table structure for os_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `os_user_login_log`;
CREATE TABLE `os_user_login_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `user_ip` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `operating_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户登录表';
