/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : guolai

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-10 21:50:52
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `guolai_admin`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_admin`;
CREATE TABLE `guolai_admin` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_login_time` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of guolai_admin
-- ----------------------------
INSERT INTO `guolai_admin` VALUES ('1', 'admin', 'a3ab9193e5b81674b87d6b2431f3c75d', '0', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `guolai_article`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_article`;
CREATE TABLE `guolai_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(126) NOT NULL COMMENT '标题',
  `subtitle` varchar(126) DEFAULT NULL COMMENT '副标题',
  `category_id` int(10) DEFAULT NULL COMMENT '文章分类',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '最后一次修改时间',
  `sort` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除 0正常 1已删除',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of guolai_article
-- ----------------------------
INSERT INTO `guolai_article` VALUES ('1', '安徽男子网上', '', '1', '1455615111', '1455616450', '1', '0');

-- ----------------------------
-- Table structure for `guolai_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_article_category`;
CREATE TABLE `guolai_article_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1删除 0 没删除',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of guolai_article_category
-- ----------------------------
INSERT INTO `guolai_article_category` VALUES ('1', '0', '购物指南', '0', '0', '0');

-- ----------------------------
-- Table structure for `guolai_article_category_to_seo`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_article_category_to_seo`;
CREATE TABLE `guolai_article_category_to_seo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL COMMENT '文章分类ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'SEO标题title',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO关键词和检索关键词',
  `descript` varchar(255) DEFAULT NULL COMMENT 'SEO描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`) USING BTREE,
  CONSTRAINT `guolai_article_category_to_seo_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `guolai_article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章分类SEO表';

-- ----------------------------
-- Records of guolai_article_category_to_seo
-- ----------------------------

-- ----------------------------
-- Table structure for `guolai_article_to_detail`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_article_to_detail`;
CREATE TABLE `guolai_article_to_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) NOT NULL,
  `detail` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`) USING BTREE,
  CONSTRAINT `guolai_article_to_detail_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `guolai_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guolai_article_to_detail
-- ----------------------------
INSERT INTO `guolai_article_to_detail` VALUES ('1', '1', '<p>\r\n	aa</p>\r\n');

-- ----------------------------
-- Table structure for `guolai_article_to_seo`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_article_to_seo`;
CREATE TABLE `guolai_article_to_seo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) NOT NULL COMMENT '文章ID',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`) USING BTREE,
  CONSTRAINT `guolai_article_to_seo_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `guolai_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章SEO表';

-- ----------------------------
-- Records of guolai_article_to_seo
-- ----------------------------
INSERT INTO `guolai_article_to_seo` VALUES ('1', '1', '', '');

-- ----------------------------
-- Table structure for `guolai_attr`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_attr`;
CREATE TABLE `guolai_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` mediumint(8) NOT NULL COMMENT '模型ID',
  `type` enum('1','2','3','4') NOT NULL COMMENT '输入控件的类型,1:输入框,2:下拉,3:单选,4:复选',
  `name` varchar(20) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `sort` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`) USING BTREE,
  CONSTRAINT `guolai_attr_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `guolai_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='属性表';

-- ----------------------------
-- Records of guolai_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `guolai_auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_auth_role`;
CREATE TABLE `guolai_auth_role` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '类型：1.url 2.菜单',
  `name` char(20) NOT NULL COMMENT '规则中文描述',
  `site` char(50) NOT NULL COMMENT '规则唯一标识',
  `sort` mediumint(5) NOT NULL COMMENT '排序',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '级别: 0.根节点 1.二级节点 2.叶节点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guolai_auth_role
-- ----------------------------
INSERT INTO `guolai_auth_role` VALUES ('1', '0', 'Admin', '2', '商品管理', 'Goods', '0', '0');
INSERT INTO `guolai_auth_role` VALUES ('2', '1', 'Admin', '2', '商品列表', 'Goods/index', '0', '1');
INSERT INTO `guolai_auth_role` VALUES ('3', '0', 'Admin', '2', '系统管理', 'System', '3', '0');
INSERT INTO `guolai_auth_role` VALUES ('4', '3', 'Admin', '2', '权限管理', 'Auth/index', '1', '1');
INSERT INTO `guolai_auth_role` VALUES ('5', '1', 'Admin', '2', '添加商品', 'Goods/add', '1', '1');
INSERT INTO `guolai_auth_role` VALUES ('6', '1', 'Admin', '2', '商品分类', 'GoodsCategory/index', '2', '1');
INSERT INTO `guolai_auth_role` VALUES ('8', '1', 'Admin', '2', '模型列表', 'GoodsAttr/index', '4', '1');
INSERT INTO `guolai_auth_role` VALUES ('9', '1', 'Admin', '1', '添加模型', 'GoodsAttr/add', '5', '1');
INSERT INTO `guolai_auth_role` VALUES ('10', '1', 'Admin', '1', '编辑商品', 'Goods/edit', '6', '1');
INSERT INTO `guolai_auth_role` VALUES ('11', '0', 'Admin', '2', '文章管理', 'Article', '1', '0');
INSERT INTO `guolai_auth_role` VALUES ('12', '11', 'Admin', '2', '文章列表', 'Article/index', '0', '1');
INSERT INTO `guolai_auth_role` VALUES ('13', '11', 'Admin', '2', '文章分类', 'ArticleCategory/index', '2', '1');
INSERT INTO `guolai_auth_role` VALUES ('14', '11', 'Admin', '2', '添加文章', 'Article/add', '1', '1');
INSERT INTO `guolai_auth_role` VALUES ('15', '11', 'Admin', '1', '编辑文章', 'Article/edit', '3', '1');
INSERT INTO `guolai_auth_role` VALUES ('16', '0', 'Admin', '2', '广告管理', 'Banner', '2', '0');
INSERT INTO `guolai_auth_role` VALUES ('17', '16', 'Admin', '2', '广告位列表', 'Banner/position', '0', '1');
INSERT INTO `guolai_auth_role` VALUES ('18', '16', 'Admin', '2', '广告列表', 'Banner/index', '1', '1');
INSERT INTO `guolai_auth_role` VALUES ('19', '16', 'Admin', '1', '广告位编辑', 'Banner/position_edit', '2', '1');
INSERT INTO `guolai_auth_role` VALUES ('20', '16', 'Admin', '1', '添加广告位', 'Banner/position_add', '3', '1');
INSERT INTO `guolai_auth_role` VALUES ('21', '16', 'Admin', '1', '添加广告', 'Banner/add', '4', '1');

-- ----------------------------
-- Table structure for `guolai_banner`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_banner`;
CREATE TABLE `guolai_banner` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `position_id` int(10) NOT NULL COMMENT '广告位ID',
  `name` varchar(50) NOT NULL COMMENT '广告名称',
  `intro` varchar(120) DEFAULT NULL COMMENT '广告简述',
  `image` varchar(255) NOT NULL COMMENT '广告图片',
  `link` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态 1.开启 0.关闭',
  `sort` mediumint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除 0正常 1已删除',
  PRIMARY KEY (`id`),
  KEY `position_id` (`position_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Records of guolai_banner
-- ----------------------------

-- ----------------------------
-- Table structure for `guolai_banner_position`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_banner_position`;
CREATE TABLE `guolai_banner_position` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '广告位名称',
  `intro` varchar(120) DEFAULT NULL COMMENT '广告位描述',
  `width` smallint(5) NOT NULL DEFAULT '0' COMMENT '广告位宽度',
  `height` smallint(5) NOT NULL DEFAULT '0' COMMENT '广告位高度',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `sort` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态 1.开启 0.关闭',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除 0正常 1已删除',
  PRIMARY KEY (`id`),
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告位';

-- ----------------------------
-- Records of guolai_banner_position
-- ----------------------------
INSERT INTO `guolai_banner_position` VALUES ('1', '首页Banner', '', '640', '320', '1460273089', '0', '1', '0');

-- ----------------------------
-- Table structure for `guolai_goods`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_goods`;
CREATE TABLE `guolai_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `intro` varchar(126) DEFAULT NULL,
  `goods_no` varchar(20) NOT NULL COMMENT '商品货号',
  `category_id` int(10) DEFAULT NULL,
  `model_id` mediumint(8) DEFAULT NULL,
  `search_words` varchar(50) DEFAULT NULL COMMENT '商品搜索词库,逗号分隔',
  `sell_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本价格',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品状态 0下架 1上架',
  `up_time` int(10) DEFAULT NULL COMMENT '上架时间',
  `down_time` int(10) DEFAULT NULL COMMENT '下架时间',
  `update_time` int(10) NOT NULL COMMENT '最后一次修改时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `store_nums` int(10) NOT NULL DEFAULT '0' COMMENT '库存',
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '重量',
  `unit` varchar(6) DEFAULT NULL COMMENT '计量单位',
  `visit` int(10) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `favorite` int(10) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `comments` int(10) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `sale` int(10) DEFAULT NULL COMMENT '销量',
  `sort` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除 0正常 1已删除',
  PRIMARY KEY (`id`),
  KEY `is_del` (`is_del`),
  KEY `status` (`status`),
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guolai_goods
-- ----------------------------
INSERT INTO `guolai_goods` VALUES ('1', '烟台栖霞苹果新鲜水果产地直供', null, '1', '2', '0', '苹果', '60.00', '20.00', '1', null, null, '1460108216', '1460105337', '2000', '15.00', '箱', '0', '0', '0', null, '0', '0');

-- ----------------------------
-- Table structure for `guolai_goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_goods_category`;
CREATE TABLE `guolai_goods_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `icon` varchar(255) NOT NULL COMMENT '分类图标',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态 1.开启 0.关闭',
  `sort` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1删除 0 没删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='产品分类表';

-- ----------------------------
-- Records of guolai_goods_category
-- ----------------------------
INSERT INTO `guolai_goods_category` VALUES ('1', '火龙果', 'images/pitaya.png', '1', '0', '0');
INSERT INTO `guolai_goods_category` VALUES ('2', '苹果', 'images/apple.png', '1', '1', '0');
INSERT INTO `guolai_goods_category` VALUES ('3', '小番茄', 'images/inmato.png', '1', '2', '0');
INSERT INTO `guolai_goods_category` VALUES ('4', '红枣', 'images/reddates.png', '1', '3', '0');

-- ----------------------------
-- Table structure for `guolai_goods_category_to_seo`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_goods_category_to_seo`;
CREATE TABLE `guolai_goods_category_to_seo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL COMMENT '商品分类ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'SEO标题title',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO关键词和检索关键词',
  `descript` varchar(255) DEFAULT NULL COMMENT 'SEO描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`) USING BTREE,
  CONSTRAINT `guolai_goods_category_to_seo_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `guolai_goods_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='产品分类SEO表';

-- ----------------------------
-- Records of guolai_goods_category_to_seo
-- ----------------------------
INSERT INTO `guolai_goods_category_to_seo` VALUES ('1', '1', '火龙果', '火龙果', '');
INSERT INTO `guolai_goods_category_to_seo` VALUES ('2', '2', '苹果', '苹果', '');
INSERT INTO `guolai_goods_category_to_seo` VALUES ('3', '3', '小番茄', '小番茄', '');
INSERT INTO `guolai_goods_category_to_seo` VALUES ('4', '4', '红枣', '红枣', '');

-- ----------------------------
-- Table structure for `guolai_goods_to_attr`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_goods_to_attr`;
CREATE TABLE `guolai_goods_to_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `model_id` mediumint(8) NOT NULL,
  `attr_id` int(11) NOT NULL,
  `attr_value` varchar(255) DEFAULT NULL,
  `sort` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `attr_id` (`attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `guolai_goods_to_attr_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `guolai_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guolai_goods_to_attr_ibfk_2` FOREIGN KEY (`attr_id`) REFERENCES `guolai_attr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guolai_goods_to_attr_ibfk_3` FOREIGN KEY (`model_id`) REFERENCES `guolai_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guolai_goods_to_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `guolai_goods_to_commend`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_goods_to_commend`;
CREATE TABLE `guolai_goods_to_commend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `commend_id` tinyint(1) NOT NULL COMMENT '推荐类型ID 1:最新商品 2:特价商品 3:热卖商品 4:推荐商品',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `commend_id` (`commend_id`) USING BTREE,
  CONSTRAINT `guolai_goods_to_commend_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `guolai_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐商品类型关联表';

-- ----------------------------
-- Records of guolai_goods_to_commend
-- ----------------------------

-- ----------------------------
-- Table structure for `guolai_goods_to_detail`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_goods_to_detail`;
CREATE TABLE `guolai_goods_to_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `detail` longtext COMMENT '商品详情',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `guolai_goods_to_detail_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `guolai_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品详情表';

-- ----------------------------
-- Records of guolai_goods_to_detail
-- ----------------------------
INSERT INTO `guolai_goods_to_detail` VALUES ('1', '1', '');

-- ----------------------------
-- Table structure for `guolai_goods_to_price`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_goods_to_price`;
CREATE TABLE `guolai_goods_to_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `num` smallint(5) NOT NULL DEFAULT '1' COMMENT '批发大于数量',
  `price` double(8,2) NOT NULL COMMENT '发批价格',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `guolai_goods_to_price_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `guolai_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guolai_goods_to_price
-- ----------------------------
INSERT INTO `guolai_goods_to_price` VALUES ('3', '1', '1', '60.00');

-- ----------------------------
-- Table structure for `guolai_goods_to_seo`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_goods_to_seo`;
CREATE TABLE `guolai_goods_to_seo` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO关键词和检索关键词',
  `description` varchar(255) DEFAULT NULL COMMENT 'SEO描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `guolai_goods_to_seo_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `guolai_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品SEO表';

-- ----------------------------
-- Records of guolai_goods_to_seo
-- ----------------------------
INSERT INTO `guolai_goods_to_seo` VALUES ('0', '1', '', '');

-- ----------------------------
-- Table structure for `guolai_model`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_model`;
CREATE TABLE `guolai_model` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '模型名称',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除 0正常 1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品模型表';

-- ----------------------------
-- Records of guolai_model
-- ----------------------------

-- ----------------------------
-- Table structure for `guolai_session`
-- ----------------------------
DROP TABLE IF EXISTS `guolai_session`;
CREATE TABLE `guolai_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `session_expire` int(11) DEFAULT NULL,
  `session_data` mediumblob,
  PRIMARY KEY (`id`,`session_id`),
  UNIQUE KEY `session_id` (`session_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1805 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guolai_session
-- ----------------------------
INSERT INTO `guolai_session` VALUES ('1804', '9o60bvfs4haqphrf0b4almb9q0', '1460291658', 0x61646D696E5F7C613A313A7B733A333A225F6964223B733A313A2231223B7D);
