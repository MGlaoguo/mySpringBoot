/*
 Navicat Premium Data Transfer

 Source Server         : 121.43.153.227
 Source Server Type    : MySQL
 Source Server Version : 50625
 Source Host           : 121.43.153.227:3306
 Source Schema         : storemanager

 Target Server Type    : MySQL
 Target Server Version : 50625
 File Encoding         : 65001

 Date: 30/08/2018 17:56:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ae_cainiao_auth
-- ----------------------------
DROP TABLE IF EXISTS `ae_cainiao_auth`;
CREATE TABLE `ae_cainiao_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ali_id` bigint(20) NOT NULL,
  `resource_owner` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cn_user_id` bigint(20) NOT NULL COMMENT '菜鸟账号id',
  `access_token` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expire_date` datetime(0) NULL DEFAULT NULL COMMENT 'accessToken过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `ali_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通菜鸟物流授权表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_cainiao_handover
-- ----------------------------
DROP TABLE IF EXISTS `ae_cainiao_handover`;
CREATE TABLE `ae_cainiao_handover`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `handover_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交接单',
  `wh_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实仓编码',
  `handover_create_time` datetime(0) NOT NULL COMMENT '交接单创建时间',
  `handover_cancel_time` datetime(0) NULL DEFAULT NULL COMMENT '交接单取消时间',
  `handover_status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交接单状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `handover_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通菜鸟物流交接单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_color
-- ----------------------------
DROP TABLE IF EXISTS `ae_color`;
CREATE TABLE `ae_color`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `en_color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zh_color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 462 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_faq
-- ----------------------------
DROP TABLE IF EXISTS `ae_faq`;
CREATE TABLE `ae_faq`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT 'userId',
  `category_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目ID',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `content_language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言：目前支持5种语言：en_US，es_ES，fr_FR，pt_BR，ru_RU',
  `faq_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型 common 通用、category 类目',
  `sort_num` int(10) NULL DEFAULT NULL COMMENT '排序号 倒叙',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态: 已发布 online,未发布 offline',
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'faq标题',
  `faq_id` bigint(20) NOT NULL COMMENT '速卖通问题ID',
  `seller_admin_login_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卖家主账号ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `faq_id`, `seller_admin_login_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6817 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通问题' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_faq_content
-- ----------------------------
DROP TABLE IF EXISTS `ae_faq_content`;
CREATE TABLE `ae_faq_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT 'userId',
  `faq_answer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'faq回答',
  `faq_question` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'faq题目',
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言：目前支持5种语言：en_US，es_ES，fr_FR，pt_BR，ru_RU',
  `faq_content_id` bigint(20) NOT NULL COMMENT '内容id',
  `ae_faq_id` bigint(20) NOT NULL COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `faq_content_id`, `ae_faq_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7464 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通问题内容' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_faq_language
-- ----------------------------
DROP TABLE IF EXISTS `ae_faq_language`;
CREATE TABLE `ae_faq_language`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
  `language_cn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
  `language_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 471 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通买家常见问题支持语言' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_faq_welcome
-- ----------------------------
DROP TABLE IF EXISTS `ae_faq_welcome`;
CREATE TABLE `ae_faq_welcome`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT 'userId',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '欢迎词正文',
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言：目前支持5种语言：en_US，es_ES，fr_FR，pt_BR，ru_RU',
  `seller_admin_login_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卖家主账号ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `seller_admin_login_id`, `language`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5405 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通欢迎词' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_issue
-- ----------------------------
DROP TABLE IF EXISTS `ae_issue`;
CREATE TABLE `ae_issue`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺授权ID',
  `buyer_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家登录ID',
  `buyer_signer_full_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家姓名',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `issue_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纠纷ID',
  `issue_status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纠纷状态',
  `parent_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子订单ID',
  `reason_english` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文原因',
  `reason_chinese` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文原因',
  `issue_gmt_create` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '纠纷创建时间',
  `issue_gmt_modified` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '纠纷修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `issue_id`(`issue_id`) USING BTREE,
  INDEX `buyerOrder`(`user_id`, `auth_id`, `order_id`, `buyer_login_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通纠纷' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_order_extension
-- ----------------------------
DROP TABLE IF EXISTS `ae_order_extension`;
CREATE TABLE `ae_order_extension`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `auth_alias` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_price` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单金额',
  `order_shipment_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `order_status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `order_buyer` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `order_buyer_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extended_times` tinyint(4) NULL DEFAULT NULL COMMENT '已延长次数',
  `extend_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '延长状态',
  `extend_date` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '延期时间',
  `currrency` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `myOrder_id`(`order_id`) USING BTREE,
  UNIQUE INDEX `authorder`(`auth_id`, `order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_order_extension_config
-- ----------------------------
DROP TABLE IF EXISTS `ae_order_extension_config`;
CREATE TABLE `ae_order_extension_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `extend_days` int(4) NULL DEFAULT NULL COMMENT '延长天数',
  `extend_shipment` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运输方式',
  `extend_country` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `extend_times` tinyint(4) NULL DEFAULT NULL COMMENT '延长次数',
  `extend_threshold` tinyint(4) NULL DEFAULT NULL COMMENT '延长的最后期限',
  `extend_comments` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_id` bigint(20) NOT NULL DEFAULT 0,
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'on',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniuaId`(`user_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4854 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_product
-- ----------------------------
DROP TABLE IF EXISTS `ae_product`;
CREATE TABLE `ae_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `ali_id` bigint(20) NOT NULL COMMENT '用户aliID',
  `ae_gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'ae的创建时间',
  `ae_gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ae的修改时间',
  `delivery_time` int(11) NULL DEFAULT NULL COMMENT '商品的备货期',
  `owner_member_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品拥有者的login_id',
  `owner_member_seq` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品拥有者的id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '产品ID',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '产品所在类目的ID',
  `SUBJECT` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `package_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否打包销售y表示打包销售',
  `lot_num` int(11) NULL DEFAULT NULL COMMENT '每包的数量',
  `package_length` int(11) NULL DEFAULT NULL COMMENT '产品长度',
  `package_width` int(11) NULL DEFAULT NULL COMMENT '产品的宽度',
  `package_height` int(11) NULL DEFAULT NULL COMMENT '产品的高度',
  `gross_weight` decimal(12, 3) NULL DEFAULT NULL COMMENT '产品的毛重',
  `is_pack_sell` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否支持自定义记重',
  `reduce_strategy` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存的扣减策略,place_order_withhold或payment_success_deduct',
  `group_ids` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品所在的产品分组列表,[1002141,10024524]',
  `bulk_discount` int(11) NULL DEFAULT NULL COMMENT '产品的批发折扣',
  `image_urls` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `product_unit` int(11) NULL DEFAULT NULL COMMENT '产品的单位',
  `ws_valid_num` int(11) NULL DEFAULT NULL COMMENT '产品的有效期',
  `src` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品的来源isv',
  `ws_offline_date` datetime(0) NULL DEFAULT NULL COMMENT '产品的下架日期',
  `ws_display` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品的下架原因,如expire_offline',
  `product_status_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品的线上状态',
  `currency_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品的货币单位。美元: USD, 卢布: RUB',
  `freight_template_id` bigint(20) NULL DEFAULT NULL COMMENT '产品关联的运费模版ID',
  `add_unit` int(11) NULL DEFAULT NULL,
  `add_weight` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `base_unit` int(11) NULL DEFAULT NULL COMMENT '自定义计重的基本产品件数',
  `bulk_order` int(11) NULL DEFAULT NULL COMMENT '享受批发价的产品数',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '产品所关联的产品分组ID',
  `is_image_dynamic` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否动态图片的产品',
  `product_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '单品产品的价格。',
  `promise_template_id` bigint(20) NULL DEFAULT NULL COMMENT '产品所关联的服务模版',
  `sizechart_id` bigint(20) NULL DEFAULT NULL COMMENT '产品所关联的尺码模版ID',
  `version` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品版本号',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原链接',
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`, `ali_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3558 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_product_autotask
-- ----------------------------
DROP TABLE IF EXISTS `ae_product_autotask`;
CREATE TABLE `ae_product_autotask`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `gmt_create` datetime(0) NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'gmtCreate',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'gmtModified',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'creator',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'modifier',
  `is_deleted` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'isDeleted',
  `auth_id` bigint(20) NULL DEFAULT -1 COMMENT 'authId',
  `rule` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'rule',
  `ali_id` bigint(20) NOT NULL DEFAULT 0 COMMENT 'aeProductId',
  `latest_ae_product_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'latestAeProductId',
  `sku` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'sku属性',
  `site` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '站点',
  `list_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '固价  多属性',
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品标题',
  `product_id` bigint(20) NOT NULL DEFAULT -1 COMMENT 'productId',
  `task_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'taskName',
  `rule_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ruleType',
  `times_success` int(12) NOT NULL DEFAULT -1 COMMENT '成功次数',
  `sold_quantity` int(12) NULL DEFAULT -1 COMMENT 'soldQuantity',
  `picture_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'pictureUrl',
  `product_end_time` datetime(0) NULL DEFAULT '1000-01-01 00:00:00' COMMENT '该产品以及重新刊登后的新id的结束时间',
  `user_id` bigint(20) NOT NULL DEFAULT -1 COMMENT 'userId',
  `task_type` tinyint(4) NULL DEFAULT NULL,
  `task_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_task_key`(`user_id`, `auth_id`, `product_id`, `task_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2403 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ae_product_autotask' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_product_autotask_result
-- ----------------------------
DROP TABLE IF EXISTS `ae_product_autotask_result`;
CREATE TABLE `ae_product_autotask_result`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `gmt_create` datetime(0) NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'gmtCreate',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'gmtModified',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'creator',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'modifier',
  `is_deleted` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'isDeleted',
  `user_id` bigint(20) NOT NULL DEFAULT -1 COMMENT 'userId',
  `task_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'taskId',
  `task_result` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'success or falied',
  `task_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'taskDesc',
  `task_time` datetime(0) NULL DEFAULT '1000-01-01 00:00:00' COMMENT 'taskTime',
  `supply_quantity` int(12) NULL DEFAULT -1 COMMENT 'supplyQuantity',
  `task_rule_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'taskRuleName',
  `flag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '占位符',
  `auth_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid_taskkId_index`(`user_id`, `task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4426 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ae_product_autotask_result' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_product_group
-- ----------------------------
DROP TABLE IF EXISTS `ae_product_group`;
CREATE TABLE `ae_product_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL COMMENT '分组id',
  `group_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
  `parent_group_id` bigint(20) NOT NULL COMMENT '父分组id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1278 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通产品分组' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `ae_product_sku`;
CREATE TABLE `ae_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `ali_id` bigint(20) NOT NULL COMMENT '用户aliID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID',
  `aeop_sku_property` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性对象',
  `sku_property` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性对象',
  `sku_price` decimal(12, 2) NULL DEFAULT NULL COMMENT 'sku的售价（美元）',
  `sku_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku的自定义code',
  `sku_stock` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Sku库存,数据格式有货y，无货n；至少有一条sku记录是有货的。',
  `ipm_sku_stock` bigint(20) NULL DEFAULT NULL COMMENT 'SKU实际可售库存属性ipmSkuStock',
  `sku_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU ID',
  `currency_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `sku_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku的key',
  `version` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品版本号',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`, `sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23564 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_promotion
-- ----------------------------
DROP TABLE IF EXISTS `ae_promotion`;
CREATE TABLE `ae_promotion`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT 'userId',
  `apply_scene` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动展示场景',
  `attract_end_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招商结束时间',
  `attract_start_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招商开始时间',
  `creator_login_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人登录账号',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息描述',
  `display_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前台展示活动名称',
  `pay_time_limit` int(10) NULL DEFAULT NULL COMMENT '支付时间限制',
  `prom_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动模式 店铺活动store, 平台活动platform',
  `prom_rule` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动库存策略',
  `promotion_id` int(20) NOT NULL COMMENT '活动ID',
  `release_end_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布结束时间',
  `release_start_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布开始时间',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动状态 发布中releasing, 发布已结束releasEnd, 冻结中，当前时间在 发布开始时间RELEASE_START_DATE减去24小时到发布开始时间RELEASE_START_DATE之间 frozen,新创建，当前时间在发布开始时间RELEASE_START_DATE减去24小时前的活动 created;',
  `stock_channel_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存id',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动类型：店铺活动的限时限量折扣LimitedDiscount, 店铺自主满就减FixedDiscount,店铺自主全店铺打折StoreDiscount,店铺优惠券StoreCoupon,定向店铺优惠券DirectStoreCoupon,金币兑换店铺优惠券CoinsExchangeStoreCoupon,秒抢店铺优惠券GrabStoreCoupon,聚人气店铺优惠券PolyPopularityStoreCoupon, 购物券活动类型ShoppingCoupon,店铺自主满包邮FreeShipping，平台活动的限时限量折扣ProEngine,平台活动的全网大促销GPoint,平台活动的限时限量秒杀GAGA,平台活动的新品推介NewProduct,平台活动的团购GroupBuy',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `promotion_id`, `creator_login_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16895 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通活动' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_promotion_product_rela
-- ----------------------------
DROP TABLE IF EXISTS `ae_promotion_product_rela`;
CREATE TABLE `ae_promotion_product_rela`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT 'userId',
  `promotion_id` int(20) NOT NULL COMMENT '活动ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID',
  `creator_login_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人登录账号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `promotion_id`, `creator_login_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3884 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通活动和产品关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_used_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `ae_used_attribute_value`;
CREATE TABLE `ae_used_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL COMMENT '类目id',
  `pid` bigint(20) NOT NULL COMMENT '属性id',
  `vid` bigint(20) NOT NULL COMMENT '属性值id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ali_id`(`ali_id`, `category_id`, `pid`, `vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通使用过的类目属性值表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ae_used_category
-- ----------------------------
DROP TABLE IF EXISTS `ae_used_category`;
CREATE TABLE `ae_used_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NOT NULL,
  `cate_id` int(11) NOT NULL COMMENT '类目id',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目中文名称(包含上级类目 格式 A > B > C )',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ali_id`(`ali_id`, `cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通使用过的类目' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ali1688_gather_data_claim
-- ----------------------------
DROP TABLE IF EXISTS `ali1688_gather_data_claim`;
CREATE TABLE `ali1688_gather_data_claim`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `gather_data_id` bigint(20) NULL DEFAULT NULL COMMENT 'ali1688产品表id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `site`, `gather_data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ali1688采集数据认领表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ali1688_invoice
-- ----------------------------
DROP TABLE IF EXISTS `ali1688_invoice`;
CREATE TABLE `ali1688_invoice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `invoice_type` int(11) NULL DEFAULT NULL COMMENT '发票类型 0：普通发票，1:增值税发票',
  `province_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份文本',
  `city_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市文本',
  `area_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区文本',
  `town_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '镇文本',
  `post_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `full_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人姓名',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购货公司名（发票抬头）',
  `taxpayer_identifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税识别码',
  `bank_and_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行及帐号',
  `local_invoice_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '增值税本地发票号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2402 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1688平台发票信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ali1688_localgood_good_relation
-- ----------------------------
DROP TABLE IF EXISTS `ali1688_localgood_good_relation`;
CREATE TABLE `ali1688_localgood_good_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `ali_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` bigint(32) NOT NULL COMMENT '1688产品id',
  `sku_id` bigint(60) NOT NULL COMMENT '1688商品SKUID',
  `spec_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688上的商品标识',
  `sku_attributes` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU属性  JSON格式',
  `price` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供货商ID',
  `local_good_sku_id` bigint(50) NULL DEFAULT NULL COMMENT 'sm_goods_sku表ID',
  `product_goods_id` bigint(20) NULL DEFAULT NULL COMMENT '1688 对应的本地商品Id',
  `amount_onsale` int(20) NULL DEFAULT NULL COMMENT '可销售数量',
  `is_default` int(2) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_goods_id`(`user_id`, `product_goods_id`) USING BTREE,
  INDEX `local_good_sku_id`(`user_id`, `local_good_sku_id`) USING BTREE,
  INDEX `sku_id`(`user_id`, `sku_id`) USING BTREE,
  INDEX `supplier_id`(`user_id`, `supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12002 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1688平台商品SKU与本地商品的对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ali1688_order
-- ----------------------------
DROP TABLE IF EXISTS `ali1688_order`;
CREATE TABLE `ali1688_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `ali_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688平台member_id   或者  sm_auth 表seller_id',
  `order_id` bigint(50) NOT NULL COMMENT '1688订单id',
  `order_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '订单金额（单位元）',
  `main_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '商品金额',
  `shipping_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '运费',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易状态，waitbuyerpay:等待买家付款;waitsellersend:等待卖家发货;waitlogisticstakein:等待物流公司揽件;waitbuyerreceive:等待买家收货;waitbuyersign:等待买家签收;signinsuccess:买家已签收;confirm_goods:已收货;success:交易成功;cancel:交易取消;terminated:交易终止;未枚举:其他状态',
  `logistics_company_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司名称',
  `logistics_bill_no` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司运单号',
  `logistics_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688物流编号',
  `pay_way` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式 1688:1-支付宝,2-网商银行信任付,3-诚e赊,4-银行转账,5-赊销宝,6-电子承兑票据,7-账期支付,8-合并支付渠道,9-无打款,10-零售通赊购,13-支付平台,12-声明付款',
  `pay_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付状态。1688:1(未付款);2(已付款);4(全额退款);6(卖家有收到钱，回款完成) ;7(未创建外部支付单);8 (付款前取消) ; 9(正在支付中);12(账期支付,待到账)',
  `msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家留言',
  `arrival_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'on_way' COMMENT '到货状态    on_way未到货，cancel已作废，part部分到货，arrival全部到货',
  `gmt_last_arrival` datetime(0) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库ID',
  `order_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688采购单编号',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供货商ID   ali1688_supplier表',
  `purchase_order_id` bigint(20) NULL DEFAULT NULL COMMENT '本地采购单ID',
  `supplier_login_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688供货商登录ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `order_index`(`user_id`, `order_id`, `id`, `purchase_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1688平台铺货产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ali1688_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ali1688_order_goods`;
CREATE TABLE `ali1688_order_goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `oid` bigint(20) NULL DEFAULT NULL COMMENT '1688订单表主键',
  `order_id` bigint(50) NOT NULL COMMENT '1688订单id',
  `product_id` bigint(30) NOT NULL COMMENT '1688产品ID',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '1688商品SKUID',
  `local_good_sku_id` bigint(20) NULL DEFAULT NULL COMMENT '本地商品SKU',
  `spec_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688上的商品标识',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '采购数量 例如多少个、多少件、多少箱、多少吨',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `img_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_str` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrival_count` int(11) NULL DEFAULT NULL COMMENT '已到货数量',
  `way_count` int(11) NULL DEFAULT NULL COMMENT '未到货数量',
  `unit_price` decimal(11, 2) NULL DEFAULT NULL COMMENT '采购单价',
  `supplier_id` bigint(20) NULL DEFAULT NULL,
  `sku_attributes` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性 JSON',
  `auth_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`user_id`, `oid`, `order_id`, `product_id`) USING BTREE,
  INDEX `auth_id`(`user_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28803 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1688平台铺货商品信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ali1688_product
-- ----------------------------
DROP TABLE IF EXISTS `ali1688_product`;
CREATE TABLE `ali1688_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `ali_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688平台用户ID',
  `product_id` bigint(20) NOT NULL COMMENT '1688产品id',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1688产品标题',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名',
  `image_url` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品图片链接',
  `source_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688 账号',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品链接地址',
  `status` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品状态。published:上网状态;member expired:会员撤销;auto expired:自然过期;expired:过期(包含手动过期与自动过期);member deleted:会员删除;modified:修改;new:新发;deleted:删除;TBD:to be delete;approved:审批通过;auditing:审核中;untread:审核不通过;',
  `reference_price` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参考价格',
  `amount_onsale` double NULL DEFAULT NULL COMMENT '可销售数量',
  `description` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `claim` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '是否认领（y/n）',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供货商ID',
  `supplier_login_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688供货商登录ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ali_product`(`user_id`, `ali_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1688平台铺货产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ali1688_product_goods
-- ----------------------------
DROP TABLE IF EXISTS `ali1688_product_goods`;
CREATE TABLE `ali1688_product_goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `ali_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688 平台用户ID',
  `mong_product_id` bigint(20) NOT NULL COMMENT '芒果产品ID',
  `product_id` bigint(20) NOT NULL COMMENT '1688产品id',
  `sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1688skuCode',
  `sku_id` bigint(20) NOT NULL COMMENT '商品编码',
  `spec_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku_attributes` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU属性  JSON格式',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品状态。published:上网状态;member expired:会员撤销;auto expired:自然过期;expired:过期(包含手动过期与自动过期);member deleted:会员删除;modified:修改;new:新发;deleted:删除;TBD:to be delete;approved:审批通过;auditing:审核中;untread:审核不通过;',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `retailPrice` double NULL DEFAULT NULL COMMENT '建议零售价',
  `amount_onsale` int(20) NULL DEFAULT NULL COMMENT '可销售数量',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供货商ID',
  `supplier_login_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1688供货商登录ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`user_id`, `ali_id`, `product_id`) USING BTREE,
  INDEX `mong_product_id`(`user_id`, `auth_id`, `mong_product_id`) USING BTREE,
  INDEX `sku_id`(`user_id`, `sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15860 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1688平台铺货产品对应的商品SKU表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ali1688_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ali1688_receive_address`;
CREATE TABLE `ali1688_receive_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `address_id` bigint(20) NULL DEFAULT NULL COMMENT '1688地址ID',
  `full_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `city_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市文本',
  `province_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份文本',
  `area_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区文本',
  `town_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '镇文本',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `district_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1602 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '1688平台收货地址信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ali1688_supplier
-- ----------------------------
DROP TABLE IF EXISTS `ali1688_supplier`;
CREATE TABLE `ali1688_supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `seller_login_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `seller_alipay_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `company_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旺铺首页地址',
  `im_in_platform` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sm_supplier_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29415 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for allot_goods_relation
-- ----------------------------
DROP TABLE IF EXISTS `allot_goods_relation`;
CREATE TABLE `allot_goods_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `goods_sku_id` bigint(20) NOT NULL,
  `out_warehouse_id` bigint(20) NOT NULL COMMENT '调出仓库id',
  `in_warehouse_id` bigint(20) NOT NULL COMMENT '调入仓库id',
  `allot_count` int(11) NOT NULL COMMENT '调拨数量',
  `arrival_count` int(11) NOT NULL COMMENT '已到货数量',
  `way_count` int(11) NOT NULL COMMENT '未到货数量',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `allot_order_id` bigint(20) NULL DEFAULT NULL COMMENT '调拨单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7802 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调拨商品关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for allot_logistics
-- ----------------------------
DROP TABLE IF EXISTS `allot_logistics`;
CREATE TABLE `allot_logistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `logistics_provider` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `logistics_provider_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运单号',
  `obj_id` bigint(20) NOT NULL COMMENT '调拨单id',
  `obj_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调拨单编号',
  `shipping` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '运费',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `obj_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3202 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调拨物流表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for allot_order
-- ----------------------------
DROP TABLE IF EXISTS `allot_order`;
CREATE TABLE `allot_order`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `allot_order_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调拨单编号',
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购单状态',
  `out_warehouse_id` bigint(20) NOT NULL COMMENT '调出仓库id',
  `in_warehouse_id` bigint(20) NOT NULL COMMENT '调入仓库id',
  `shipping` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `other_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '其他费用',
  `memo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调拨单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for amazon_category
-- ----------------------------
DROP TABLE IF EXISTS `amazon_category`;
CREATE TABLE `amazon_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_path_by_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_path_by_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_level` int(10) NULL DEFAULT NULL,
  `parent_category_path_by_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leaf_category` tinyint(1) NULL DEFAULT NULL,
  `category_attributes` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refinements_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `amazon_site` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_type_definitions` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_type_file` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_path_by_id`(`category_path_by_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36031 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for amazon_inventory_supply
-- ----------------------------
DROP TABLE IF EXISTS `amazon_inventory_supply`;
CREATE TABLE `amazon_inventory_supply`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `asin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seller_sku` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fn_sku` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amazon_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_condition` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物品状况',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `inbound_quantity` int(10) NOT NULL DEFAULT 0,
  `fulfillable_quantity` int(10) NOT NULL COMMENT '可售数量',
  `unsellable_quantity` int(10) NOT NULL COMMENT '不可售数量',
  `reserved_quantity` int(10) NOT NULL COMMENT '预留数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `Unique_auth_id_asin`(`auth_id`, `asin`) USING BTREE,
  INDEX `Index_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for amazon_product
-- ----------------------------
DROP TABLE IF EXISTS `amazon_product`;
CREATE TABLE `amazon_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `asin` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `brand` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `amazon_site` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '亚马逊站点',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原链接',
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `asin`(`asin`, `amazon_site`) USING BTREE,
  INDEX `user_id`(`user_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 187 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '亚马逊产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for amazon_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `amazon_product_sku`;
CREATE TABLE `amazon_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `parent_asin` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `asin` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sku` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL COMMENT '库存数量',
  `image_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `currency_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货币类型',
  `listing_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '商品的当前价格（包括进行促销的商品）',
  `shipping` decimal(12, 2) NULL DEFAULT NULL COMMENT '商品的运费',
  `regular_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '商品的当前价格（不包括进行促销的商品）',
  `fulfillment_channel` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的配送渠道 Amazon - 亚马逊物流, Merchant - 卖家自行配送',
  `item_condition` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的状况',
  `item_sub_condition` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的子状况',
  `amazon_site` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '亚马逊站点',
  `color` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `asin`(`asin`, `amazon_site`) USING BTREE,
  INDEX `parent_asin`(`parent_asin`) USING BTREE,
  INDEX `user_id`(`user_id`, `sku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1700 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '亚马逊产品sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bj_auth_category
-- ----------------------------
DROP TABLE IF EXISTS `bj_auth_category`;
CREATE TABLE `bj_auth_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NOT NULL COMMENT '授权店铺ID',
  `cate_id` bigint(20) NOT NULL COMMENT '类目ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `cn_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称(中文)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'blanja店铺类目关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bj_category
-- ----------------------------
DROP TABLE IF EXISTS `bj_category`;
CREATE TABLE `bj_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` bigint(20) NOT NULL COMMENT '类目ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `isleaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是叶子节点，y是，n否。',
  `parent_cate_id` bigint(20) NULL DEFAULT NULL COMMENT '父类目ID',
  `ordering` int(11) NULL DEFAULT NULL,
  `cn_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称(中文)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `parent_cate_id`(`parent_cate_id`, `cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4091 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'blanja类目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bj_category_attribute
-- ----------------------------
DROP TABLE IF EXISTS `bj_category_attribute`;
CREATE TABLE `bj_category_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `cate_id` bigint(20) NOT NULL COMMENT '类目id',
  `pid` bigint(20) NOT NULL COMMENT '类目属性id',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `is_sku` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是sku属性',
  `required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必须',
  `show_picture` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否展示图片',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordering` int(11) NULL DEFAULT NULL,
  `cn_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称(中文)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_id`(`cate_id`, `pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2637 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'blanja类目属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bj_category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `bj_category_attribute_value`;
CREATE TABLE `bj_category_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `cate_id` bigint(20) NOT NULL COMMENT '类目id',
  `pid` bigint(20) NOT NULL COMMENT '类目属性id',
  `vid` bigint(20) NOT NULL COMMENT '类目属性值id',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值名称',
  `ordering` int(11) NULL DEFAULT NULL,
  `cn_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值名称(中文)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_id`(`cate_id`, `pid`, `vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144783 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'blanja类目属性值表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bj_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `bj_product_gather`;
CREATE TABLE `bj_product_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `cate_id` bigint(20) NULL DEFAULT NULL COMMENT '类目ID',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品标题',
  `price` int(11) NULL DEFAULT NULL COMMENT '产品价格',
  `list_price` int(11) NULL DEFAULT NULL COMMENT '标签价格',
  `state` int(11) NULL DEFAULT NULL COMMENT '省份',
  `city` int(11) NULL DEFAULT NULL COMMENT '城市',
  `district` int(11) NULL DEFAULT NULL COMMENT '区',
  `weight` decimal(12, 1) NULL DEFAULT NULL COMMENT '商品重量',
  `length` int(11) NULL DEFAULT NULL COMMENT '长度（cm）',
  `width` int(11) NULL DEFAULT NULL COMMENT '宽度（cm）',
  `height` int(11) NULL DEFAULT NULL COMMENT '高度（cm）',
  `buyer_obtain_point` decimal(12, 1) NULL DEFAULT NULL,
  `freight_payer` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付运费者',
  `postage_id` bigint(20) NULL DEFAULT NULL COMMENT '运费模板ID',
  `express_fee` int(11) NULL DEFAULT NULL COMMENT '运费',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情',
  `support_pod` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否支持货代付款',
  `pod_fee` int(11) NULL DEFAULT NULL COMMENT '货代付款费用',
  `image_urls` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图（1-5 json格式）',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集原链接',
  `source_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集的产品Id',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `gather_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型，采集、复制、导入等',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `error_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '线上产品ID',
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `gather_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集序号',
  `properties` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性（pid:vid;pid:vid）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'blanja产品采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bj_product_gather_sequence
-- ----------------------------
DROP TABLE IF EXISTS `bj_product_gather_sequence`;
CREATE TABLE `bj_product_gather_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 444 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bj_product_property_ext_gather
-- ----------------------------
DROP TABLE IF EXISTS `bj_product_property_ext_gather`;
CREATE TABLE `bj_product_property_ext_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `product_gather_id` bigint(20) NULL DEFAULT NULL COMMENT '产品采集表ID',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `properties` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性（pid:vid）',
  `ordering` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `product_gather_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'blanja产品采集产品属性扩展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bj_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `bj_product_sku_gather`;
CREATE TABLE `bj_product_sku_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `product_gather_id` bigint(20) NULL DEFAULT NULL COMMENT '产品采集表ID',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '库存量',
  `price` int(11) NULL DEFAULT NULL COMMENT 'sku价格',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `properties` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性（pid:vid;pid:vid）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `product_gather_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 443 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for black_list_customer
-- ----------------------------
DROP TABLE IF EXISTS `black_list_customer`;
CREATE TABLE `black_list_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `customer_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家id',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `customer_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `INDEX_customerId_site`(`customer_id`, `site`) USING BTREE,
  INDEX `INDEX_userId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for black_list_set
-- ----------------------------
DROP TABLE IF EXISTS `black_list_set`;
CREATE TABLE `black_list_set`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `cloud_enable` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'y',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQUE_userId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for black_list_user
-- ----------------------------
DROP TABLE IF EXISTS `black_list_user`;
CREATE TABLE `black_list_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '当前表ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `black_list_id` bigint(20) NOT NULL COMMENT 'black_list_customer表ID',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_uid_bid`(`black_list_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cd_product
-- ----------------------------
DROP TABLE IF EXISTS `cd_product`;
CREATE TABLE `cd_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `reference` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `offer_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_condition` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_ean` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(12, 2) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL,
  `last_update_time` timestamp(0) NULL DEFAULT NULL,
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28251 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cdek_area
-- ----------------------------
DROP TABLE IF EXISTS `cdek_area`;
CREATE TABLE `cdek_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area_code` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '1:一区 2:二区 3 三区 4 四区',
  `postcode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59829 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for chenglian_address
-- ----------------------------
DROP TABLE IF EXISTS `chenglian_address`;
CREATE TABLE `chenglian_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件地址 交运偏好',
  `address_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件地址id 和 交运偏好id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for child_user_data_authority
-- ----------------------------
DROP TABLE IF EXISTS `child_user_data_authority`;
CREATE TABLE `child_user_data_authority`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `child_user_id` bigint(20) NOT NULL,
  `data_id` bigint(20) NOT NULL COMMENT '权限数据id  仓库表主键id',
  `authority_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限数据类型 warehouse(仓库)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `Unique_User_id_Child_user_id_Data_id_Authority_type`(`user_id`, `child_user_id`, `data_id`, `authority_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for common_id_sequence
-- ----------------------------
DROP TABLE IF EXISTS `common_id_sequence`;
CREATE TABLE `common_id_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32081 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业网站',
  `contact_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别:1/男;0/女',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deal_time` timestamp(0) NULL DEFAULT NULL COMMENT '激活时间',
  `enable_time` timestamp(0) NULL DEFAULT NULL COMMENT '启用时间',
  `disable_time` timestamp(0) NULL DEFAULT NULL COMMENT '到期时间',
  `level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户等级',
  `balance` decimal(11, 4) NULL DEFAULT NULL COMMENT '账户余额',
  `invitation_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县区',
  `check_email` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_mobile` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3557 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for company_backup
-- ----------------------------
DROP TABLE IF EXISTS `company_backup`;
CREATE TABLE `company_backup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业网站',
  `contact_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别:1/男;0/女',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deal_time` timestamp(0) NULL DEFAULT NULL COMMENT '激活时间',
  `enable_time` timestamp(0) NULL DEFAULT NULL COMMENT '启用时间',
  `disable_time` timestamp(0) NULL DEFAULT NULL COMMENT '到期时间',
  `level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户等级',
  `balance` decimal(11, 4) NULL DEFAULT NULL COMMENT '账户余额',
  `invitation_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县区',
  `check_email` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_mobile` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1610 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `Id` int(11) NOT NULL COMMENT '编号',
  `en_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `short_name` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家简称 国家简称',
  `three_short_name` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cn_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名 国家中文名称',
  `gzxb_area` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cpam_freight_area` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mayou_area` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '马来西亚邮政区域码',
  `pingyou_area` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平邮区域码',
  `pick_area` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家分拣码',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for country_distribution_statistical
-- ----------------------------
DROP TABLE IF EXISTS `country_distribution_statistical`;
CREATE TABLE `country_distribution_statistical`  (
  `ae_gmt_create` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每天',
  `ae_gmt_month` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ae_gmt_year` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `site` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `receipt_address_country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货国家简码',
  `customer_number` bigint(20) NULL DEFAULT NULL COMMENT '客户数',
  `order_number` bigint(20) NULL DEFAULT NULL COMMENT '订单总数',
  `pay_amounts` double NULL DEFAULT NULL COMMENT '付款总金额',
  `payment_order` bigint(20) NULL DEFAULT NULL COMMENT '已付款订单',
  `payment_amount` double NULL DEFAULT NULL COMMENT '已付款金额',
  `wait_pay_order` bigint(20) NULL DEFAULT NULL COMMENT '待付款订单',
  `wait_pay_amount` double NULL DEFAULT NULL COMMENT '待付款金额',
  `guest_price` double NULL DEFAULT NULL COMMENT '客单价',
  INDEX `user_auth_site`(`user_id`, `auth_id`, `site`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for country_distribution_statistical_new
-- ----------------------------
DROP TABLE IF EXISTS `country_distribution_statistical_new`;
CREATE TABLE `country_distribution_statistical_new`  (
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `site` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_id` bigint(20) NOT NULL DEFAULT 0,
  `receipt_address_country` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `customer_number` bigint(20) NULL DEFAULT NULL COMMENT '客户数',
  `order_number` bigint(20) NULL DEFAULT NULL COMMENT '订单总数',
  `pay_amounts` double NULL DEFAULT NULL COMMENT '付款总金额',
  `payment_order` bigint(20) NULL DEFAULT NULL COMMENT '已付款订单',
  `payment_amount` double NULL DEFAULT NULL COMMENT '已付款金额',
  `wait_pay_order` bigint(20) NULL DEFAULT NULL COMMENT '待付款订单',
  `wait_pay_amount` double NULL DEFAULT NULL COMMENT '待付款金额',
  `guest_price` double NULL DEFAULT NULL COMMENT '客单价',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '时间范围',
  PRIMARY KEY (`user_id`, `receipt_address_country`, `type`, `auth_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户分布统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for currency_rate
-- ----------------------------
DROP TABLE IF EXISTS `currency_rate`;
CREATE TABLE `currency_rate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_day` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '汇率时间',
  `currency_from` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源币种',
  `currency_to` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标币种',
  `rate` decimal(12, 4) NOT NULL COMMENT '汇率',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `date_day`(`date_day`, `currency_from`, `currency_to`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12608 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '汇率表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_information_statistical
-- ----------------------------
DROP TABLE IF EXISTS `customer_information_statistical`;
CREATE TABLE `customer_information_statistical`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `site` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺id',
  `buyer_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buyer_signer_full_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家名称',
  `order_number` bigint(20) NULL DEFAULT NULL COMMENT '订单总数',
  `pay_amounts` double NULL DEFAULT NULL COMMENT '销售额',
  `payment_order` bigint(20) NULL DEFAULT NULL COMMENT '已付款订单',
  `payment_amounts` double NULL DEFAULT NULL COMMENT '已付款金额',
  `invalid_order` bigint(20) NULL DEFAULT NULL COMMENT '无效订单',
  `invalid_amounts` double NULL DEFAULT NULL COMMENT '无效金额',
  `order_price` double NULL DEFAULT NULL COMMENT '件单价',
  `ae_gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '订单时间',
  `ae_gmt_create_timezone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `order_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `grade_id` bigint(20) NOT NULL COMMENT '客户等级id',
  `grade_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户等级名称',
  `buyer_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家邮箱',
  `ali_id` bigint(20) NULL DEFAULT NULL,
  `country` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  PRIMARY KEY (`user_id`, `auth_id`, `buyer_login_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_statistical
-- ----------------------------
DROP TABLE IF EXISTS `customer_statistical`;
CREATE TABLE `customer_statistical`  (
  `ae_gmt_create` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺id',
  `new_customer_number` bigint(20) NULL DEFAULT NULL COMMENT '新客户数',
  `new_order_number` bigint(20) NULL DEFAULT NULL COMMENT '新订单数',
  `new_pay_amount` double NULL DEFAULT NULL COMMENT '新订单金额',
  `old_customer_number` bigint(20) NULL DEFAULT NULL COMMENT '旧客户数',
  `old_order_number` bigint(20) NULL DEFAULT NULL COMMENT '旧订单数',
  `old_pay_amount` double NULL DEFAULT NULL COMMENT '旧订单金额',
  `customer_number` bigint(20) NULL DEFAULT NULL COMMENT '总客户数',
  `order_number` bigint(20) NULL DEFAULT NULL COMMENT '总订单数',
  `pay_amount` double NULL DEFAULT NULL COMMENT '订单总金额',
  PRIMARY KEY (`user_id`, `ae_gmt_create`, `auth_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for delete_shop_sequence
-- ----------------------------
DROP TABLE IF EXISTS `delete_shop_sequence`;
CREATE TABLE `delete_shop_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dh_category_info
-- ----------------------------
DROP TABLE IF EXISTS `dh_category_info`;
CREATE TABLE `dh_category_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目id',
  `names` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '各语言名称，json格式',
  `isleaf` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有叶子节点',
  `parent_cate_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父类目id',
  `name_path` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级类目的name路径>用逗号分隔',
  `id_path` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级类目的id路径,用>分隔',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_id`(`cate_id`, `parent_cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 194089 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敦煌类目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dh_product
-- ----------------------------
DROP TABLE IF EXISTS `dh_product`;
CREATE TABLE `dh_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品状态',
  `item_code` bigint(20) NOT NULL COMMENT '产品编码',
  `img_url` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品首图地址',
  `item_name` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `operate_date` datetime(0) NULL DEFAULT NULL COMMENT '产品最近修改时间',
  `vaild_day` int(11) NULL DEFAULT NULL COMMENT '产品有效期',
  `version` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_url` varchar(521) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memo` varchar(521) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projected_income` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计收入',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `item_code`(`item_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139570 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敦煌产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dh_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `dh_product_gather`;
CREATE TABLE `dh_product_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `gather_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集序号,用于界面展示的唯一标示符',
  `gather_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型，采集、复制、导入等',
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '如果该字段不为null，表示这条记录是有该账号创建的，如果为null，则表示这条记录是有userid创建的',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段状态，草稿箱、待发布、发布中、发布、发布失败',
  `cate_pub_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布类目id',
  `image_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品首图url',
  `product_name` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `timing_published` datetime(0) NULL DEFAULT NULL COMMENT '发布时间，如果是立马发布，取当前时间，如果是定时发布，取指定时间',
  `l_group_id` bigint(20) NULL DEFAULT 0 COMMENT '产品所属产品组id',
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源网址',
  `can_release` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `invalid_msg` varchar(124) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不可发布原因',
  `item_code` bigint(20) NULL DEFAULT NULL COMMENT '线上产品id',
  `projected_income` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计收入',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `source_site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点ID',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集表的产品Id',
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否模板(y/n)',
  `error_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_msg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141935 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敦煌产品采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dh_product_gather_sequence
-- ----------------------------
DROP TABLE IF EXISTS `dh_product_gather_sequence`;
CREATE TABLE `dh_product_gather_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1209 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dh_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `dh_product_sku`;
CREATE TABLE `dh_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `item_code` bigint(20) NOT NULL COMMENT '产品编码',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `inventory` int(10) NULL DEFAULT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `sku_id` bigint(20) NOT NULL,
  `version` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sku_id`(`sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139826 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敦煌产品sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dh_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `dh_product_sku_gather`;
CREATE TABLE `dh_product_sku_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `product_gather_Id` bigint(20) NULL DEFAULT NULL COMMENT '敦煌产品采集主表id',
  `auth_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140853 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敦煌产品采集sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dh_used_category
-- ----------------------------
DROP TABLE IF EXISTS `dh_used_category`;
CREATE TABLE `dh_used_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `cate_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目id',
  `name_path` varchar(248) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目路径',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_cate_u_id`(`auth_id`, `cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139475 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敦煌常用类目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dhl_order_close_out
-- ----------------------------
DROP TABLE IF EXISTS `dhl_order_close_out`;
CREATE TABLE `dhl_order_close_out`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `agent_auth_id` bigint(20) NOT NULL,
  `pickup_account_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sold_to_account_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shipment_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '标记0,1,2,3,4',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'dhl订单close-out表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dubbo_invoke
-- ----------------------------
DROP TABLE IF EXISTS `dubbo_invoke`;
CREATE TABLE `dubbo_invoke`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_time` datetime(0) NOT NULL,
  `invoke_date` date NOT NULL,
  `service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `consumer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `invoke_time` bigint(20) NULL DEFAULT NULL,
  `success` int(11) NULL DEFAULT NULL,
  `failure` int(11) NULL DEFAULT NULL,
  `elapsed` int(11) NULL DEFAULT NULL,
  `concurrent` int(11) NULL DEFAULT NULL,
  `max_elapsed` int(11) NULL DEFAULT NULL,
  `max_concurrent` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_service`(`service`) USING BTREE,
  INDEX `index_method`(`method`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_category
-- ----------------------------
DROP TABLE IF EXISTS `ebay_category`;
CREATE TABLE `ebay_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_level` int(10) NULL DEFAULT NULL,
  `category_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_category_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leaf_category` tinyint(1) NULL DEFAULT NULL,
  `best_offer_enabled` tinyint(1) NULL DEFAULT NULL,
  `auto_pay_enabled` tinyint(1) NULL DEFAULT NULL,
  `virtual` tinyint(1) NULL DEFAULT NULL,
  `expired` tinyint(1) NULL DEFAULT NULL,
  `condition_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `condition_enabled` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paypal_required` tinyint(1) NULL DEFAULT NULL,
  `best_offer_auto_accept_enabled` tinyint(1) NULL DEFAULT NULL,
  `revise_quantity_allowed` tinyint(1) NULL DEFAULT NULL,
  `revise_price_allowed` tinyint(1) NULL DEFAULT NULL,
  `return_policy_enabled` tinyint(1) NULL DEFAULT NULL,
  `handling_time_enabled` tinyint(1) NULL DEFAULT NULL,
  `variations_enabled` tinyint(1) NULL DEFAULT NULL,
  `ean_enabled` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isbn_enabled` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upc_enabled` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `listing_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(10) NULL DEFAULT NULL,
  `site` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `CATEGORY_ID_INDEX`(`category_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182799 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_category_condition
-- ----------------------------
DROP TABLE IF EXISTS `ebay_category_condition`;
CREATE TABLE `ebay_category_condition`  (
  `condition_id` bigint(20) NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `condition_id`(`condition_id`, `site`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_category_specifics
-- ----------------------------
DROP TABLE IF EXISTS `ebay_category_specifics`;
CREATE TABLE `ebay_category_specifics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `creator` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `specifics_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `value_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `min_values` int(11) NULL DEFAULT NULL,
  `max_values` int(11) NULL DEFAULT NULL,
  `variation_specifics` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `select_mode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recommend_values` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190655 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_dispute
-- ----------------------------
DROP TABLE IF EXISTS `ebay_dispute`;
CREATE TABLE `ebay_dispute`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `created_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `credit_eligibility` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖方是否有资格获得最终价值费用信用',
  `explanation` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纠纷解释',
  `dispute_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纠纷id',
  `modified_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `reason` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建纠纷的理由',
  `record_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述争议的类型',
  `dispute_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纠纷内部状态',
  `dispute_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纠纷状态',
  `item_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'eBay列表的唯一标识符',
  `transaction_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'itemID，transactionID成对使用',
  `order_line_item_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'eBay订单行项目的唯一标识符，基于ItemID和TransactionID的连接，并在这两个ID之间使用连字符',
  `buyer_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买方id',
  `escalation` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买方是否可以关闭争议，并将其升级到易趣网标准采购保护计划',
  `purchase_protection` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买方是否有资格购买易趣网标准购买保护计划',
  `seller_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家id',
  `listing_end_time` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '列表时间',
  `listing_start_time` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '列表时间',
  `quantity` bigint(20) NULL DEFAULT NULL COMMENT '数量',
  `converted_price_currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '3位货币代码',
  `converted_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '转换后的价格',
  `price_currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '3位货币代码',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '原始价格',
  `site_code_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在站点',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `other_party_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等待操作方名字',
  `other_party_role` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等待操作方，买方或者卖方',
  `user_role` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已操作方，买方或者卖方',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `dispute_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_dispute_messages
-- ----------------------------
DROP TABLE IF EXISTS `ebay_dispute_messages`;
CREATE TABLE `ebay_dispute_messages`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `dispute_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纠纷id',
  `created_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `message_id` bigint(20) NOT NULL COMMENT '消息id',
  `message_source` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息来源',
  `message_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `dispute_id`, `message_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_dispute_resolutions
-- ----------------------------
DROP TABLE IF EXISTS `ebay_dispute_resolutions`;
CREATE TABLE `ebay_dispute_resolutions`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `dispute_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resolution_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '解决时间',
  `reason` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原因',
  `record_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纠纷解决记录类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `authdispuuniqid`(`auth_id`, `dispute_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ebay_feedback`;
CREATE TABLE `ebay_feedback`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NOT NULL COMMENT 'auth_id',
  `image_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品标题',
  `order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `transaction_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易标识',
  `product_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ebay itemId',
  `order_line_item_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_place_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `buyer_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家id',
  `seller_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家id',
  `listing_end_time` datetime(0) NULL DEFAULT NULL COMMENT '下架时间',
  `feedback_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3603 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_feedback_result_record
-- ----------------------------
DROP TABLE IF EXISTS `ebay_feedback_result_record`;
CREATE TABLE `ebay_feedback_result_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NOT NULL COMMENT 'auth_id',
  `order_line_item_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `feedback_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_feedback_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易标识',
  `product_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ebay itemId',
  `ebay_user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家或卖家id',
  `comment_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家或卖家评价',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '留评时间',
  `comment_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价类型',
  `commenting_user_score` int(11) NULL DEFAULT NULL COMMENT '评价分数',
  `followup` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `feedback_response` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `feedback_rating_star` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价星级',
  `feedback_revised` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈是否被修改过',
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 569436 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_message_group
-- ----------------------------
DROP TABLE IF EXISTS `ebay_message_group`;
CREATE TABLE `ebay_message_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息组名称',
  `parent_id` bigint(20) NOT NULL COMMENT '父iD',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1023 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_my_message
-- ----------------------------
DROP TABLE IF EXISTS `ebay_my_message`;
CREATE TABLE `ebay_my_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `sender` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件人姓名',
  `recipient_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人id',
  `send_to_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `message_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息id',
  `external_message_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flagged` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已标记(y or n)',
  `is_read` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已读(y or n)',
  `receive_date` datetime(0) NULL DEFAULT NULL COMMENT '接收时间',
  `expiration_date` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `response_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可以回复(y or n)',
  `user_response_date` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `folder_id` tinyint(20) NULL DEFAULT NULL COMMENT '目录id',
  `replied` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已经回复(y or n）',
  `is_high_priority` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是高优先及(y or n）',
  `message_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `question_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题类型',
  `item_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息组id',
  `group_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `message_from` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `message_id`(`message_id`, `auth_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128704 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_product
-- ----------------------------
DROP TABLE IF EXISTS `ebay_product`;
CREATE TABLE `ebay_product`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ebay_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku` varchar(192) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_urls` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `listing_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `primary_category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secondary_category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_primary_category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_secondary_category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `condition_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `start_price` decimal(10, 0) NULL DEFAULT NULL,
  `reserve_price` decimal(10, 0) NULL DEFAULT NULL,
  `buy_it_now_price` decimal(10, 0) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `lot_size` int(11) NULL DEFAULT NULL,
  `specifics` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paypal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_methods` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_requirement` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_policy` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shipping_details` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shipping_package` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `best_offer_enable` tinyint(1) NULL DEFAULT NULL,
  `min_best_offer_price` decimal(10, 0) NULL DEFAULT NULL,
  `max_best_offer_price` decimal(10, 0) NULL DEFAULT NULL,
  `fast_shipping` tinyint(1) NULL DEFAULT NULL,
  `private_listing` tinyint(1) NULL DEFAULT NULL,
  `handling_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `listing_duration` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tax` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extend` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `watch_count` bigint(20) NULL DEFAULT NULL,
  `hit_count` bigint(20) NULL DEFAULT NULL,
  `sold_quantity` int(11) NULL DEFAULT NULL,
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQUE_PRODUCT`(`ebay_product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15345432 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_product_autotask
-- ----------------------------
DROP TABLE IF EXISTS `ebay_product_autotask`;
CREATE TABLE `ebay_product_autotask`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NOT NULL COMMENT 'auth_id',
  `rule` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运行规则',
  `ebay_product_id` bigint(20) NULL DEFAULT NULL COMMENT 'eaby产品id',
  `product_id` bigint(20) NULL DEFAULT NULL,
  `task_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_type` tinyint(1) NULL DEFAULT NULL,
  `task_status` tinyint(1) NULL DEFAULT NULL,
  `rule_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `times_success` int(11) NULL DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `list_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sold_quantity` int(11) NULL DEFAULT NULL,
  `product_end_time` datetime(0) NULL DEFAULT NULL,
  `latest_ebay_product_id` bigint(20) NULL DEFAULT NULL,
  `picture_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_product_id_task`(`ebay_product_id`, `task_type`) USING BTREE,
  INDEX `user_id_index`(`user_id`, `auth_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4401 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_product_autotask_result
-- ----------------------------
DROP TABLE IF EXISTS `ebay_product_autotask_result`;
CREATE TABLE `ebay_product_autotask_result`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `task_id` bigint(20) NOT NULL,
  `task_result` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_time` datetime(0) NULL DEFAULT NULL,
  `return_ebay_product_id` bigint(20) NULL DEFAULT NULL COMMENT '记录用，可能为空',
  `task_rule_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supply_quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_id_ao_task`(`user_id`, `task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `ebay_product_gather`;
CREATE TABLE `ebay_product_gather`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ebay_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku` varchar(192) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_urls` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `listing_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `primary_category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secondary_category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_primary_category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_secondary_category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `condition_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `start_price` decimal(10, 0) NULL DEFAULT NULL,
  `reserve_price` decimal(10, 0) NULL DEFAULT NULL,
  `buy_it_now_price` decimal(10, 0) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `lot_size` int(11) NULL DEFAULT NULL,
  `specifics` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paypal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_methods` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_requirement` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_policy` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shipping_details` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shipping_package` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `best_offer_enable` tinyint(1) NULL DEFAULT NULL,
  `min_best_offer_price` decimal(10, 0) NULL DEFAULT NULL,
  `max_best_offer_price` decimal(10, 0) NULL DEFAULT NULL,
  `fast_shipping` tinyint(1) NULL DEFAULT NULL,
  `private_listing` tinyint(1) NULL DEFAULT NULL,
  `handling_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommands` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `listing_fee` decimal(10, 0) NULL DEFAULT NULL,
  `listing_fee_currency` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `listing_duration` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tax` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_from` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `listing_result` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `local_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gather_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extend` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集原链接',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集的产品Id',
  `source_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `timing_published` datetime(0) NULL DEFAULT NULL,
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `l_group_id` bigint(20) NULL DEFAULT 0 COMMENT '产品本地分组',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `GATHER_NUM`(`gather_num`) USING BTREE,
  INDEX `IDX_UID_SPID_SS`(`user_id`, `source_product_id`, `source_site`) USING BTREE,
  INDEX `STATUS`(`user_id`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 395801 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_product_sequence
-- ----------------------------
DROP TABLE IF EXISTS `ebay_product_sequence`;
CREATE TABLE `ebay_product_sequence`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `ebay_product_sku`;
CREATE TABLE `ebay_product_sku`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku` varchar(192) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `specifics` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ebay_product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isbn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ean` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sold_quantity` int(11) NULL DEFAULT NULL,
  `sku_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PRODUCT_ID`(`user_id`, `ebay_product_id`) USING BTREE,
  INDEX `SKU`(`user_id`, `sku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72452035 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `ebay_product_sku_gather`;
CREATE TABLE `ebay_product_sku_gather`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku` varchar(192) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `specifics` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `upc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isbn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ean` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PRODUCT_ID`(`user_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1187001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_store_category
-- ----------------------------
DROP TABLE IF EXISTS `ebay_store_category`;
CREATE TABLE `ebay_store_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_category_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leaf_category` tinyint(1) NOT NULL,
  `orders` int(10) NOT NULL,
  `version` int(10) NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `CATEGORY_ID_INDEX`(`category_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ebay_sync_log
-- ----------------------------
DROP TABLE IF EXISTS `ebay_sync_log`;
CREATE TABLE `ebay_sync_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(10) NULL DEFAULT NULL,
  `version` int(10) NULL DEFAULT NULL,
  `cost_time` int(10) NULL DEFAULT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_time` datetime(0) NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(10) NULL DEFAULT NULL,
  `auth_id` bigint(10) NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ensogo_category
-- ----------------------------
DROP TABLE IF EXISTS `ensogo_category`;
CREATE TABLE `ensogo_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `cate_id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `name_zh_tw` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称，繁体',
  `depth` int(11) NULL DEFAULT NULL COMMENT '类目深度',
  `parent_cate_id` int(11) NOT NULL,
  `ordering` int(11) NULL DEFAULT NULL,
  `isleaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是叶子节点，y是，n否。',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_id`(`cate_id`) USING BTREE,
  INDEX `parent_cate_id`(`parent_cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ensogo类目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ensogo_product
-- ----------------------------
DROP TABLE IF EXISTS `ensogo_product`;
CREATE TABLE `ensogo_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品ID',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `number_saves` int(11) NULL DEFAULT NULL COMMENT '收藏量',
  `number_sold` int(11) NULL DEFAULT NULL COMMENT '销售量',
  `review_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `countries` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分发站点',
  `parent_sku` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父sku',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品来源链接',
  `main_image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '类目ID',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '产品创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '产品修改时间',
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ensogo在线产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ensogo_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `ensogo_product_gather`;
CREATE TABLE `ensogo_product_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '子账号ID',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品code',
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情描述',
  `tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `image_urls` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '产品的数量',
  `shipping` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `msrp` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `cate_id` int(11) NULL DEFAULT NULL COMMENT 'ensogo类目id',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品来源链接',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源产品id',
  `source_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `product_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上产品ID',
  `request_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建产品的请求ID',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `counties` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传到平台的站点（my|sg|th）',
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否满足发布条件',
  `gather_num` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集编号',
  `extend` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段',
  `shipping_days_min` int(11) NULL DEFAULT NULL COMMENT '运送最小天数',
  `shipping_days_max` int(11) NULL DEFAULT NULL COMMENT '运送最大天数',
  `is_success` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功y:是，n：否',
  `group_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'csv导入批次',
  `countries` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `children` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家价格设置（json）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `source_product_id`, `source_site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ensogo产品采集主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ensogo_product_gather_sequence
-- ----------------------------
DROP TABLE IF EXISTS `ensogo_product_gather_sequence`;
CREATE TABLE `ensogo_product_gather_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ensogo_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `ensogo_product_sku`;
CREATE TABLE `ensogo_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品ID',
  `product_sku_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品SKU的ID',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku名称',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `inventory` int(11) NULL DEFAULT NULL COMMENT '库存',
  `shipping_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运输时间',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用',
  `color` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `countries` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分发站点',
  `prices` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售价',
  `shippings` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运费',
  `msrps` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原价',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_sku_id`(`product_sku_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ensogo在线产品sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ensogo_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `ensogo_product_sku_gather`;
CREATE TABLE `ensogo_product_sku_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `gather_product_id` bigint(20) NOT NULL COMMENT '产品主表ID',
  `sku_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子产品code',
  `size` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `color` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '产品的数量',
  `shipping` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `msrp` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `is_success` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功y:是，n：否',
  `img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku图片',
  `ordering` int(11) NULL DEFAULT NULL,
  `variant_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台sku的id',
  `request_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建sku的请求ID',
  `children` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家价格设置（json）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `gather_product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ensogo产品采集子表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ensogo_register
-- ----------------------------
DROP TABLE IF EXISTS `ensogo_register`;
CREATE TABLE `ensogo_register`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `contact_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `store_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `seller_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ensogo注册表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for epacket_address_code
-- ----------------------------
DROP TABLE IF EXISTS `epacket_address_code`;
CREATE TABLE `epacket_address_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域代码',
  `cn_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市中文名称',
  `en_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市英文名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5207 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'E邮宝城市码表，包括亚太物流' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for finance_payment
-- ----------------------------
DROP TABLE IF EXISTS `finance_payment`;
CREATE TABLE `finance_payment`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `finance_payment_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付款编号',
  `pay_amount` decimal(10, 2) NOT NULL COMMENT '申请付款总金额',
  `actual_pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际付款金额',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请付款类型',
  `obj_id` bigint(20) NOT NULL COMMENT '申请付款的相关id',
  `obj_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请付款的相关编号',
  `status` tinyint(4) NOT NULL COMMENT '财务付款状态',
  `memo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `gmt_pay` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00' COMMENT '付款时间',
  `main_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '主金额',
  `shipping_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `other_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '其他金额',
  `cancel_reason` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消付款原因',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `status`) USING BTREE,
  INDEX `finance_payment_no`(`finance_payment_no`) USING BTREE,
  INDEX `obj_id`(`obj_id`, `user_id`) USING BTREE,
  INDEX `obj_no`(`obj_no`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '财务付款关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for finance_payment_relation
-- ----------------------------
DROP TABLE IF EXISTS `finance_payment_relation`;
CREATE TABLE `finance_payment_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `finance_payment_id` bigint(20) NOT NULL COMMENT '付款id',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请付款类型',
  `obj_id` bigint(20) NOT NULL COMMENT '申请付款的相关id',
  `obj_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请付款的相关编号',
  `main_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '主金额',
  `shipping_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `other_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '其他金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `finance_payment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for finance_payment_sequence
-- ----------------------------
DROP TABLE IF EXISTS `finance_payment_sequence`;
CREATE TABLE `finance_payment_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gather_url
-- ----------------------------
DROP TABLE IF EXISTS `gather_url`;
CREATE TABLE `gather_url`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集url链接',
  `site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采集状态',
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '子账户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集url临时存储表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for global_set
-- ----------------------------
DROP TABLE IF EXISTS `global_set`;
CREATE TABLE `global_set`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `global_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `global_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `global_sub_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `global_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `TYPE_KEY_USER_ID_INDEX`(`user_id`, `global_type`, `global_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_arrival
-- ----------------------------
DROP TABLE IF EXISTS `goods_arrival`;
CREATE TABLE `goods_arrival`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `arrival_count` int(11) NOT NULL COMMENT '到货数量',
  `good_count` int(11) NOT NULL COMMENT '良品数量',
  `inferior_count` int(11) NOT NULL COMMENT '次品数量',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品skuId',
  `goods_arrival_log_id` bigint(20) NOT NULL COMMENT '到货记录ID',
  `unit_price` decimal(10, 2) NOT NULL COMMENT '采购单价',
  `total_count` int(11) NULL DEFAULT NULL COMMENT '总数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `goods_arrival_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 394601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '到货sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_arrival_log
-- ----------------------------
DROP TABLE IF EXISTS `goods_arrival_log`;
CREATE TABLE `goods_arrival_log`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `goods_arrival_log_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到货记录编号',
  `arrival_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到货类型',
  `obj_id` bigint(20) NOT NULL COMMENT '采购单ID或者调拨单ID',
  `obj_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购单编号或者调拨单编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `status` tinyint(4) NOT NULL COMMENT '0：待入库，1:已入库',
  `logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `memo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `shipping` decimal(12, 2) NULL DEFAULT NULL COMMENT '运费',
  `other_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '其他费用',
  `payment_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款状态',
  `arrival_count` int(11) NOT NULL COMMENT '到货数量',
  `stock_log_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库编号',
  `logistics_provider` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `arrival_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '到货金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `obj_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '到货记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_arrival_log_sequence
-- ----------------------------
DROP TABLE IF EXISTS `goods_arrival_log_sequence`;
CREATE TABLE `goods_arrival_log_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_sku_supply_chain_sku_relation
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_supply_chain_sku_relation`;
CREATE TABLE `goods_sku_supply_chain_sku_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `agent_id` bigint(20) NULL DEFAULT NULL,
  `supplier_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编码',
  `sku_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商产品skuId',
  `sku_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商产品skucode',
  `bar_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品条码',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '本地商品主键id',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `sku_property` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性',
  `supply_chain_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应链类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_index`(`agent_id`, `supplier_code`, `sku_code`, `goods_sku_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `goods_sku_Id`(`goods_sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30662 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for joom_product
-- ----------------------------
DROP TABLE IF EXISTS `joom_product`;
CREATE TABLE `joom_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品ID',
  `parent_sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父sku编码',
  `description` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品描述',
  `number_sold` int(11) NULL DEFAULT NULL COMMENT '销量',
  `number_saves` int(11) NULL DEFAULT NULL COMMENT '收藏量',
  `is_promoted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否被推广',
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `upc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通用code编码',
  `dangerous_kind` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '敏感货',
  `tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `auto_tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台标签',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否在售卖',
  `product_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品状态类型',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `extra_images` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展图片',
  `main_image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原链接',
  `date_uploaded` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `brand` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `landing_page_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `joom_express_country_codes` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启用海外仓国家',
  `had_diagnosis` int(1) NULL DEFAULT 0 COMMENT 'joom平台是否有验证信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 213317 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for joom_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `joom_product_gather`;
CREATE TABLE `joom_product_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `sku_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品code',
  `title` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `main_image_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图链接',
  `other_image_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '额外图片链接',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '产品的数量',
  `shipping_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `shipping_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费重量',
  `shipping_days_min` int(11) NULL DEFAULT NULL COMMENT '运送最小天数',
  `shipping_days_max` int(11) NULL DEFAULT NULL COMMENT '运送最大天数',
  `acquire_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '可得金额',
  `msrp` decimal(10, 2) NULL DEFAULT NULL COMMENT '制造商建议零售价',
  `brand` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牌子',
  `upc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通用产品code',
  `dangerous_kind` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '敏感货',
  `landing_page_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联链接',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品来源链接',
  `source_sku_attributes` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源sku属性',
  `recommend_tags` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐标签',
  `recommend_category_name` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类目名称',
  `recommend_category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类目ID',
  `source_site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `is_gather` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为采集数据',
  `category_id` int(11) NULL DEFAULT NULL COMMENT 'joom类目id',
  `joom_product_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'joom线上产品id',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '子账号ID',
  `group_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源产品ID',
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `invalid_msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不能发布原因',
  `timing_published` datetime(0) NULL DEFAULT NULL COMMENT '定时发布时间',
  `group_id` bigint(20) NOT NULL DEFAULT 0,
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否模板产品',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`) USING BTREE,
  INDEX `IDX_status`(`user_id`, `status`) USING BTREE,
  INDEX `IDX_gid_uid`(`group_id`, `user_id`) USING BTREE,
  INDEX `IDX_status_sku`(`is_deleted`, `user_id`, `sku_code`, `status`) USING BTREE,
  INDEX `IDX_USERID_PRODUCTID`(`is_deleted`, `user_id`, `joom_product_id`) USING BTREE,
  INDEX `IDX_user_id`(`user_id`, `source_product_id`, `source_site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142011 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'joom产品采集主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for joom_product_item_gather
-- ----------------------------
DROP TABLE IF EXISTS `joom_product_item_gather`;
CREATE TABLE `joom_product_item_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品主表ID',
  `sku_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子产品code',
  `size` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `color` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '产品的数量',
  `is_success` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功y:是，n：否',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '子账号ID',
  `img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `shipping_days_min` int(11) NULL DEFAULT NULL COMMENT '运送最小天数',
  `shipping_days_max` int(11) NULL DEFAULT NULL COMMENT '运送最大天数',
  `msrp` decimal(10, 2) NULL DEFAULT NULL COMMENT '制造商建议零售价',
  `shipping_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `shipping_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费重量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_user_id_product_id`(`user_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 620411156 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'joom产品采集子表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for joom_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `joom_product_sku`;
CREATE TABLE `joom_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品ID',
  `product_sku_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品SKU的ID',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `msrp` decimal(10, 2) NULL DEFAULT NULL COMMENT '制造商建议零售价',
  `inventory` int(11) NULL DEFAULT NULL COMMENT '库存',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `color` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否在售卖',
  `upc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通用code编码',
  `tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `auto_tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台标签',
  `shipping_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运送时间',
  `shipping` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `shipping_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费重量',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `match_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `main_image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku图片',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_sku_id`(`product_sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61082 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_category
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_category`;
CREATE TABLE `kikuu_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` int(11) NOT NULL COMMENT '类目ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目名称',
  `cn_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目中文名称',
  `isleaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否是叶子节点，y是，n否。',
  `parent_cate_id` int(11) NOT NULL COMMENT '父类目ID',
  `ordering` int(11) NOT NULL COMMENT '排序',
  `meta_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要上传尺码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_id`(`cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11557 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_category_attribute
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_category_attribute`;
CREATE TABLE `kikuu_category_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `store_id` int(11) NOT NULL COMMENT '平台店铺id',
  `cate_id` int(11) NOT NULL COMMENT '类目ID',
  `attr_id` int(11) NOT NULL COMMENT '属性id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `ordering` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `store_id`, `cate_id`, `attr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5903 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_category_attribute_value`;
CREATE TABLE `kikuu_category_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `store_id` int(11) NOT NULL COMMENT '平台店铺id',
  `cate_id` int(11) NOT NULL COMMENT '类目ID',
  `attr_id` int(11) NOT NULL COMMENT '属性id',
  `value_id` int(11) NOT NULL COMMENT '属性值id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值名称',
  `ordering` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `store_id`, `cate_id`, `attr_id`, `value_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92936 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_product
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_product`;
CREATE TABLE `kikuu_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品id',
  `cate_id` int(11) NOT NULL COMMENT '类目ID',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品标题',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品图片链接',
  `status` int(11) NOT NULL COMMENT '状态',
  `battery` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否含电',
  `is_imitation` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否仿牌',
  `is_can_return7` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品是否可支持7天无理由退换',
  `price_unit` tinyint(4) NULL DEFAULT NULL COMMENT '货币类型',
  `product_type` tinyint(4) NOT NULL COMMENT '产品类型 1：单SKU商品，2：多SKU商品',
  `order_limit` int(11) NULL DEFAULT NULL COMMENT '商品下单限购数',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原链接',
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_free_freight` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否包邮（y/n）',
  `product_net_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '商品净重',
  `product_gross_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '商品毛重',
  `pack_load_pieces` int(11) NULL DEFAULT NULL COMMENT '商品包装件数',
  `special_product` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否特殊商品（y：特殊商品（包含膏状体、液体、食品、粉末），n：非特殊商品）',
  `is_customize_weight` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自定义计重',
  `lowest_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '最小价格',
  `highest_Price` decimal(12, 2) NULL DEFAULT NULL COMMENT '最大价格',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 661 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'kikuu在线产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_product_gather`;
CREATE TABLE `kikuu_product_gather`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `cate_id` int(11) NULL DEFAULT NULL COMMENT '类目ID',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品标题',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品图片链接',
  `battery` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否含电（y/n）',
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集原链接',
  `source_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集的产品Id',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `gather_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型，采集、复制、导入等',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `gather_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集序号',
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否模板产品',
  `timing_published` datetime(0) NULL DEFAULT NULL COMMENT '定时发布时间',
  `group_id` bigint(20) NOT NULL DEFAULT -1 COMMENT '分组id',
  `error_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_message` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上产品id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `product_type` tinyint(4) NULL DEFAULT NULL,
  `is_imitation` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_free_freight` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否包邮（y/n）',
  `product_net_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '商品净重',
  `product_gross_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '商品毛重',
  `pack_load_pieces` int(11) NULL DEFAULT NULL COMMENT '商品包装件数',
  `special_product` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否特殊商品（y：特殊商品（包含膏状体、液体、食品、粉末），n：非特殊商品）',
  `is_customize_weight` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自定义计重',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `status`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `auth_id`) USING BTREE,
  INDEX `user_id_3`(`user_id`, `child_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'kikuu产品采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_product_gather_sequence
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_product_gather_sequence`;
CREATE TABLE `kikuu_product_gather_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_product_sku`;
CREATE TABLE `kikuu_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品ID',
  `product_sku_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品skuId',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `sku_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'skuKey',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `reverse_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku图片链接',
  `sku_key_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'skuKey描述',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`, `product_sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1408 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'kikuu在线产品sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_product_sku_gather`;
CREATE TABLE `kikuu_product_sku_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `product_gather_id` bigint(20) NULL DEFAULT NULL COMMENT '产品采集表ID',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `sku_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'skuKey',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `reverse_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku图片链接',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `sku_key_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'skuKey描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `product_gather_id`, `sku_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 843 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'kikuu产品采集sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_size_data
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_size_data`;
CREATE TABLE `kikuu_size_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attr_id` int(11) NOT NULL COMMENT '属性id',
  `value_id` int(11) NOT NULL COMMENT '属性值id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值名称',
  `ordering` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attr_id`(`attr_id`, `value_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kikuu_used_category
-- ----------------------------
DROP TABLE IF EXISTS `kikuu_used_category`;
CREATE TABLE `kikuu_used_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `cate_id` int(11) NOT NULL COMMENT '类目id',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目名称',
  `meta_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要上传尺码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_brands
-- ----------------------------
DROP TABLE IF EXISTS `lazada_brands`;
CREATE TABLE `lazada_brands`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_category
-- ----------------------------
DROP TABLE IF EXISTS `lazada_category`;
CREATE TABLE `lazada_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` bigint(20) NOT NULL COMMENT '类目ID',
  `global_identifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局标示',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `cn_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `isleaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是叶子节点，y是，n否。',
  `parent_cate_id` bigint(20) NULL DEFAULT NULL COMMENT '父类目ID',
  `ordering` int(11) NULL DEFAULT NULL,
  `site` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `parent_cate_id`(`parent_cate_id`, `site`, `cate_id`) USING BTREE,
  INDEX `cate_id`(`cate_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20215 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada类目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_category_attribute
-- ----------------------------
DROP TABLE IF EXISTS `lazada_category_attribute`;
CREATE TABLE `lazada_category_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `cate_id` bigint(20) NOT NULL COMMENT '类目id',
  `label` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `cn_label` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称(中文)',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `feed_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性提交名称',
  `global_identifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局标示',
  `is_mandatory` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必须',
  `is_global_attribute` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否全局属性',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `attribute_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性类型',
  `example_value` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '示例值',
  `ordering` int(11) NULL DEFAULT NULL,
  `site` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_id`(`cate_id`, `site`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120487 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada类目属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `lazada_category_attribute_value`;
CREATE TABLE `lazada_category_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `cate_id` bigint(20) NOT NULL COMMENT '类目id',
  `attribute_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `attribute_value_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值名称',
  `global_identifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局标示',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否默认',
  `ordering` int(11) NULL DEFAULT NULL,
  `site` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_id`(`cate_id`, `site`, `attribute_name`, `attribute_value_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 541697 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada类目属性值表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_category_new
-- ----------------------------
DROP TABLE IF EXISTS `lazada_category_new`;
CREATE TABLE `lazada_category_new`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` int(11) NOT NULL COMMENT '类目ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `isleaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是叶子节点，y是，n否。',
  `parent_cate_id` int(11) NULL DEFAULT NULL COMMENT '父类目ID',
  `ordering` int(11) NULL DEFAULT NULL,
  `site` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `parent_cate_id`(`parent_cate_id`, `site`, `cate_id`) USING BTREE,
  INDEX `cate_id`(`cate_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4094 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada类目新表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_feed
-- ----------------------------
DROP TABLE IF EXISTS `lazada_feed`;
CREATE TABLE `lazada_feed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `feed_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'lazada任务id',
  `feed_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务线上状态',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '任务线上创建时间',
  `updated_date` datetime(0) NULL DEFAULT NULL COMMENT '任务线上修改时间',
  `action` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `total_records` int(11) NULL DEFAULT NULL COMMENT '总记录数',
  `processed_records` int(11) NULL DEFAULT NULL COMMENT '已处理数量',
  `failed_records` int(11) NULL DEFAULT NULL COMMENT '失败记录数',
  `file_path` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交文件路径',
  `source` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `feed_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1752 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada提交任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_mandatory_field
-- ----------------------------
DROP TABLE IF EXISTS `lazada_mandatory_field`;
CREATE TABLE `lazada_mandatory_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '必填字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_product
-- ----------------------------
DROP TABLE IF EXISTS `lazada_product`;
CREATE TABLE `lazada_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `sku` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `brand` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `main_image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品链接',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品状态',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sku`(`sku`, `auth_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15151819 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada在线产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `lazada_product_gather`;
CREATE TABLE `lazada_product_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `cate_id` bigint(20) NULL DEFAULT NULL COMMENT '类目ID',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品标题',
  `brand` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `color_family` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情',
  `short_description` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短描述',
  `package_content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹内容',
  `seller_promotion` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家促销',
  `video` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频链接',
  `min_delivery_time` int(11) NULL DEFAULT NULL COMMENT '最小运输天数',
  `max_delivery_time` int(11) NULL DEFAULT NULL COMMENT '最大运输天数',
  `package_length` decimal(10, 2) NULL DEFAULT NULL,
  `package_width` decimal(10, 2) NULL DEFAULT NULL,
  `package_height` decimal(10, 2) NULL DEFAULT NULL,
  `package_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '包裹的重量',
  `product_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品的重量',
  `product_measures` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品尺寸（12 x 3 x 90）',
  `warranty_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保修类型',
  `warranty` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保修周期',
  `return_policy` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款政策',
  `buyer_protection_details_txt` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家保护细节',
  `manufacturer_txt` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集原链接',
  `source_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集的产品Id',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `gather_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型，采集、复制、导入等',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `gather_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集序号',
  `feed_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务ID',
  `image_urls` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品图片json格式',
  `error_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `extend` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128665 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada产品采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_product_gather_new
-- ----------------------------
DROP TABLE IF EXISTS `lazada_product_gather_new`;
CREATE TABLE `lazada_product_gather_new`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `cate_id` int(11) NULL DEFAULT NULL COMMENT '类目ID',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'SPUId',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品标题(name_ms(马来西亚))',
  `brand` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `model` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集原链接',
  `source_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集的产品Id',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `gather_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型，采集、复制、导入等',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `gather_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集序号',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品图片链接',
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否模板产品',
  `timing_published` datetime(0) NULL DEFAULT NULL COMMENT '定时发布时间',
  `group_id` bigint(20) NOT NULL DEFAULT -1 COMMENT '分组id',
  `min_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '最小金额',
  `max_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '最大金额',
  `error_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_message` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `status`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `auth_id`) USING BTREE,
  INDEX `user_id_3`(`user_id`, `child_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada产品采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_product_gather_sequence
-- ----------------------------
DROP TABLE IF EXISTS `lazada_product_gather_sequence`;
CREATE TABLE `lazada_product_gather_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 696 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `lazada_product_sku`;
CREATE TABLE `lazada_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `parent_sku` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sku` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL COMMENT '库存总数量',
  `available` int(11) NOT NULL COMMENT '有效库存数量',
  `currency_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货币类型',
  `sale_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '商品的当前价格（促销的价格）',
  `price` decimal(12, 2) NOT NULL COMMENT '商品的当前价格（非促销价格）',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品状态',
  `variation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变种',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应线上的ShopSku',
  `sale_start_date` datetime(0) NULL DEFAULT NULL COMMENT '促销开始时间',
  `sale_end_date` datetime(0) NULL DEFAULT NULL COMMENT '促销结束时间',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sku`(`sku`, `auth_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `status`) USING BTREE,
  INDEX `parent_sku`(`parent_sku`) USING BTREE,
  INDEX `auth_id`(`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19255822 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada在线产品sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `lazada_product_sku_gather`;
CREATE TABLE `lazada_product_sku_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `product_gather_id` bigint(20) NULL DEFAULT NULL COMMENT '产品采集表ID',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '库存量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'sku价格',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `sale_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `sale_start_date` datetime(0) NULL DEFAULT NULL COMMENT '促销开始时间',
  `sale_end_date` datetime(0) NULL DEFAULT NULL COMMENT '促销结束时间',
  `variation` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变体',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_success` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否发布成功',
  `error_message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `upc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品upc',
  `feed_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `product_gather_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1312 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada产品采集sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_product_sku_gather_new
-- ----------------------------
DROP TABLE IF EXISTS `lazada_product_sku_gather_new`;
CREATE TABLE `lazada_product_sku_gather_new`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `product_gather_id` bigint(20) NULL DEFAULT NULL COMMENT '产品采集表ID',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `product_gather_id`, `sku_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada产品采集sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_used_brand
-- ----------------------------
DROP TABLE IF EXISTS `lazada_used_brand`;
CREATE TABLE `lazada_used_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `brand` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `brand`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lazada使用过的品牌' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lazada_used_category
-- ----------------------------
DROP TABLE IF EXISTS `lazada_used_category`;
CREATE TABLE `lazada_used_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `cate_id` int(11) NOT NULL COMMENT '类目id',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'kikuu使用过的类目' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for logistics_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `logistics_msg_template`;
CREATE TABLE `logistics_msg_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `is_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `msg_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型(包括站内信、订单留言、邮箱等)',
  `logistics_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流追踪状态',
  `send_days_later` int(11) NULL DEFAULT NULL COMMENT '更新为指定物流追踪状态后几天发送消息',
  `amount_min` decimal(12, 2) NULL DEFAULT NULL COMMENT '最小订单金额',
  `amount_max` decimal(12, 2) NULL DEFAULT NULL COMMENT '最大订单金额',
  `country` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家二字简码（json数据）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lwe_confirm_shipment
-- ----------------------------
DROP TABLE IF EXISTS `lwe_confirm_shipment`;
CREATE TABLE `lwe_confirm_shipment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户编码',
  `logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '标记0,1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `logistics_no`(`logistics_no`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'lwe物流确认表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mark_order_log
-- ----------------------------
DROP TABLE IF EXISTS `mark_order_log`;
CREATE TABLE `mark_order_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `is_mark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否标记过',
  `label_id` bigint(20) NULL DEFAULT NULL COMMENT '标记id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `message_desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `message_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `jump_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转链接',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for my_service
-- ----------------------------
DROP TABLE IF EXISTS `my_service`;
CREATE TABLE `my_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `ali_id` bigint(20) NOT NULL COMMENT '阿里id',
  `resource_owner` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户旺旺ID',
  `PRODUCT_KEY` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品key',
  `BIZ_STATUS` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `gmt_service_end` datetime(0) NOT NULL COMMENT '服务结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 272 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mysql_user_daily_amount
-- ----------------------------
DROP TABLE IF EXISTS `mysql_user_daily_amount`;
CREATE TABLE `mysql_user_daily_amount`  (
  `user_id` bigint(50) NULL DEFAULT 0,
  `oder_number` bigint(50) NULL DEFAULT NULL,
  `money` double(50, 2) NULL DEFAULT NULL,
  `dt` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for od_my_data_updatetable
-- ----------------------------
DROP TABLE IF EXISTS `od_my_data_updatetable`;
CREATE TABLE `od_my_data_updatetable`  (
  `user_id` bigint(20) NULL DEFAULT NULL,
  `order_number` bigint(20) NULL DEFAULT NULL,
  `money` double(10, 2) NULL DEFAULT NULL,
  `gmt_datatime` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for online_product_source
-- ----------------------------
DROP TABLE IF EXISTS `online_product_source`;
CREATE TABLE `online_product_source`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL COMMENT '店铺id',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品id',
  `source_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源站点',
  `source_productId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源产品id',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源url',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `product_id`, `site`, `auth_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for opinion_feedback
-- ----------------------------
DROP TABLE IF EXISTS `opinion_feedback`;
CREATE TABLE `opinion_feedback`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '阿里ID',
  `contact` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正文',
  `ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服端IP',
  `is_resolved` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已解决',
  `url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ord_order
-- ----------------------------
DROP TABLE IF EXISTS `ord_order`;
CREATE TABLE `ord_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORDER_NO` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `ORDER_TITLE` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单标题',
  `order_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态(payment_none、payment_success、cancel)',
  `item_id` bigint(20) NULL DEFAULT NULL COMMENT '产品项id',
  `item_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品项名称',
  `original_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '原价',
  `ULTIMATE_PRICE` decimal(12, 2) NULL DEFAULT NULL COMMENT '最终价',
  `CURRENCY` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种：CNY（人民币），HKD（港币），NTD（新台币），USD（美元），JPY（日币）',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `gmt_pay` timestamp(0) NULL DEFAULT NULL COMMENT '付款时间',
  `payment_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '付款金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ord_order_item
-- ----------------------------
DROP TABLE IF EXISTS `ord_order_item`;
CREATE TABLE `ord_order_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ITEM_NUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单行号',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `product_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品key',
  `product_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `QUANTITY` int(11) NULL DEFAULT NULL COMMENT '数量',
  `UNIT` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计价单位',
  `original_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '原价',
  `ULTIMATE_PRICE` decimal(12, 2) NULL DEFAULT NULL COMMENT '最终价',
  `biz_status` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `GMT_SERVICE_BEGIN` timestamp(0) NULL DEFAULT NULL COMMENT '服务开始时间',
  `GMT_SERVICE_END` timestamp(0) NULL DEFAULT NULL COMMENT '服务结束时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '阿里id',
  `resource_owner` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户旺旺ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ord_product_command
-- ----------------------------
DROP TABLE IF EXISTS `ord_product_command`;
CREATE TABLE `ord_product_command`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `GMT_CREATE` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `GMT_MODIFIED` datetime(0) NOT NULL COMMENT '修改时间',
  `IS_DELETED` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `command` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '命令',
  `pre_command` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前置命令',
  `execute_param` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行条件',
  `execute_value` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行值',
  `publish_id` int(11) NULL DEFAULT NULL COMMENT '发布id',
  `comments` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ord_product_publish
-- ----------------------------
DROP TABLE IF EXISTS `ord_product_publish`;
CREATE TABLE `ord_product_publish`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `GMT_CREATE` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `GMT_MODIFIED` datetime(0) NOT NULL COMMENT '修改时间',
  `IS_DELETED` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `gmt_execute` datetime(0) NULL DEFAULT NULL COMMENT '执行时间',
  `sql` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取产品的sql',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该发布配置的名称',
  `executed_cmds` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需要执行的命令序列',
  `product_keys` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executed_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行类型 timing定时/interval间隔',
  `last_gmt_execute` datetime(0) NULL DEFAULT NULL COMMENT '上一次执行的时间',
  `interval_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行时间',
  `sub_publish` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接下去调用的流程',
  `comments` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注释',
  `domain` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_amount_distribution
-- ----------------------------
DROP TABLE IF EXISTS `order_amount_distribution`;
CREATE TABLE `order_amount_distribution`  (
  `ae_gmt_create` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '每天',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `site` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '所属网站',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺id',
  `payment_order` bigint(20) NULL DEFAULT NULL COMMENT '已付款订单总数',
  `order_Lessthan_One` bigint(20) NULL DEFAULT NULL COMMENT '已付款金额小于1美元',
  `order_OnetoFive` bigint(20) NULL DEFAULT NULL COMMENT '1到5美元',
  `order_FivetoTen` bigint(20) NULL DEFAULT NULL COMMENT '5到10美元',
  `order_TentoTwenty` bigint(20) NULL DEFAULT NULL COMMENT '10到20美元',
  `order_TwentytoFifty` bigint(20) NULL DEFAULT NULL COMMENT '20到50美元',
  `order_FiftytoOnehundred` bigint(20) NULL DEFAULT NULL COMMENT '50到100美元',
  `order_OnehundredtoTwohundred` bigint(20) NULL DEFAULT NULL COMMENT '100到200美元',
  `order_TwohundredtoFivehundred` bigint(20) NULL DEFAULT NULL COMMENT '200到500美元',
  `order_FivehundredtoOnethousand` bigint(20) NULL DEFAULT NULL COMMENT '500到1000美元',
  `order_MorethanOnethousand` bigint(20) NULL DEFAULT NULL COMMENT '大于1000美元',
  `guest_price` double NULL DEFAULT NULL COMMENT '客单价',
  `guest_price_Lessthan_One` bigint(20) NULL DEFAULT NULL COMMENT '客单价小于1美元',
  `guest_price_OnetoFive` bigint(20) NULL DEFAULT NULL COMMENT '客单价1到5美元',
  `guest_price_FivetoTen` bigint(20) NULL DEFAULT NULL COMMENT '5到10美元',
  `guest_price_TentoTwenty` bigint(20) NULL DEFAULT NULL COMMENT '10到20美元',
  `guest_price_TwentytoFifty` bigint(20) NULL DEFAULT NULL COMMENT '20到50美元',
  `guest_price_FiftytoOnehundred` bigint(20) NULL DEFAULT NULL COMMENT '50到100美元',
  `guest_price_OnehundredtoTwohundred` bigint(20) NULL DEFAULT NULL COMMENT '100到200美元',
  `guest_price_TwohundredtoFivehundred` bigint(20) NULL DEFAULT NULL COMMENT '200到500美元',
  `guest_price_FivehundredtoOnethousand` bigint(20) NULL DEFAULT NULL COMMENT '500到1000美元',
  `guest_price_MorethanOnethousand` bigint(20) NULL DEFAULT NULL COMMENT '大于1000美元',
  INDEX `index_uid_agc`(`user_id`, `ae_gmt_create`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_local_remark
-- ----------------------------
DROP TABLE IF EXISTS `order_local_remark`;
CREATE TABLE `order_local_remark`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_profit_base
-- ----------------------------
DROP TABLE IF EXISTS `order_profit_base`;
CREATE TABLE `order_profit_base`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺iD',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `local_order_id` bigint(20) NOT NULL COMMENT '订单表主键id',
  `order_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态,wait:待统计，execute:统计，ignore：不统计',
  `order_gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '下单时间(北京时间)',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `platform_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台佣金',
  `affiliate_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '联盟佣金',
  `payment_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '收款手续费',
  `retund_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  `other_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '其他成本',
  `freight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `currency` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `rate` decimal(16, 8) NULL DEFAULT NULL COMMENT '汇率',
  `memo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_user_set` tinyint(4) NOT NULL COMMENT '是否用户设置（1：用户设置，0：系统设置）',
  `source_pay_amount` decimal(10, 2) NOT NULL COMMENT '原始付款金额',
  `source_platform_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '原始平台佣金',
  `source_affiliate_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '原始联盟佣金',
  `source_retund_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '原始退款金额',
  `lack_product_cost` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缺失产品成本',
  `lack_freight` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缺失运费',
  `order_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `refund_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `local_order_id`) USING BTREE,
  INDEX `order_id`(`order_id`, `site`) USING BTREE,
  INDEX `order_number`(`order_number`, `site`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单利润基础表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_profit_package
-- ----------------------------
DROP TABLE IF EXISTS `order_profit_package`;
CREATE TABLE `order_profit_package`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺iD',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `profit_base_id` bigint(20) NOT NULL COMMENT '订单利润基础表主键id',
  `order_logistics_id` bigint(20) NOT NULL COMMENT '包裹表主键id，非芒果的包裹,为主键id',
  `package_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹号',
  `logistics_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `sys_agent_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货代内单号',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `freight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  `source` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹来源：mango,excel,manual',
  `is_combine` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否合并包裹',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `order_logistics_id`, `source`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单利润包裹表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_profit_product
-- ----------------------------
DROP TABLE IF EXISTS `order_profit_product`;
CREATE TABLE `order_profit_product`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺iD',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `profit_base_id` bigint(20) NOT NULL COMMENT '订单利润基础表主键id',
  `order_item_id` bigint(20) NOT NULL COMMENT '订单行表主键id',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '本地商品sku 主键id，无关联的设置为0',
  `product_count` int(11) NOT NULL COMMENT '产品数量',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '单个产品成本',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '启用y，禁用n',
  `package_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹号, 没有包裹号的时候 设置为 空串',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `goods_sku_id`, `package_id`, `order_item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单利润产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_profit_rate
-- ----------------------------
DROP TABLE IF EXISTS `order_profit_rate`;
CREATE TABLE `order_profit_rate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `currency_from` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源币种',
  `currency_to` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标币种',
  `rate` decimal(16, 8) NULL DEFAULT NULL COMMENT '汇率',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `currency_from`, `currency_to`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单利润汇率' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_profit_result
-- ----------------------------
DROP TABLE IF EXISTS `order_profit_result`;
CREATE TABLE `order_profit_result`  (
  `order_gmt_create` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时间天',
  `gmt_month` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时间月',
  `gmt_year` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时间年',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `auth_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `platform_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台佣金',
  `affiliate_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '联盟佣金',
  `retund_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  `other_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '其他成本',
  `freight` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `dt` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间分区',
  PRIMARY KEY (`user_id`, `auth_id`, `order_gmt_create`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单利润统计结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_rule_sync_log
-- ----------------------------
DROP TABLE IF EXISTS `order_rule_sync_log`;
CREATE TABLE `order_rule_sync_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `rule_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则类型',
  `rule_id` bigint(20) NULL DEFAULT NULL COMMENT '符合规则的规则id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `INDEX_user_id_order_id_site`(`user_id`, `order_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31926 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_sequence
-- ----------------------------
DROP TABLE IF EXISTS `order_sequence`;
CREATE TABLE `order_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_statistics_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_statistics_detail`;
CREATE TABLE `order_statistics_detail`  (
  `ae_gmt_create` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按天',
  `ae_gmt_month` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ae_gmt_year` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `site` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属网站',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺id',
  `customer_number` bigint(20) NULL DEFAULT NULL COMMENT '客户数量',
  `order_number` bigint(20) NULL DEFAULT NULL COMMENT '订单总数',
  `pay_amount` double NULL DEFAULT NULL COMMENT '付款总金额',
  `payment_order` bigint(20) NULL DEFAULT NULL COMMENT '已付款订单',
  `payment_amount` double NULL DEFAULT NULL COMMENT '已付款金额',
  `wait_pay_order` bigint(20) NULL DEFAULT NULL COMMENT '待付款订单',
  `wait_pay_amount` double NULL DEFAULT NULL COMMENT '待付款金额',
  `guest_price` double NULL DEFAULT NULL COMMENT '客单价',
  `refund_order` bigint(20) NULL DEFAULT NULL,
  `refund_amount` double NULL DEFAULT NULL,
  INDEX `index_uid_agc`(`user_id`, `ae_gmt_create`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_statistics_detail_month
-- ----------------------------
DROP TABLE IF EXISTS `order_statistics_detail_month`;
CREATE TABLE `order_statistics_detail_month`  (
  `ae_gmt_create` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `site` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '所属网站',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺id',
  `pay_amount` double NULL DEFAULT NULL COMMENT '销售额',
  `payment_amount` double NULL DEFAULT NULL COMMENT '已付款金额',
  INDEX `index_uid_agc`(`user_id`, `ae_gmt_create`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_task
-- ----------------------------
DROP TABLE IF EXISTS `order_task`;
CREATE TABLE `order_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `task_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `obj_id` int(11) NULL DEFAULT NULL,
  `obj_type` int(11) NULL DEFAULT NULL,
  `status` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `params` int(11) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_time_distribution
-- ----------------------------
DROP TABLE IF EXISTS `order_time_distribution`;
CREATE TABLE `order_time_distribution`  (
  `ae_gmt_create` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建时间按小时',
  `hour` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `site` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '所属网站',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺id',
  `order_number` bigint(20) NULL DEFAULT NULL COMMENT '订单总数',
  `payment_order` bigint(20) NULL DEFAULT NULL COMMENT '已付款订单数',
  INDEX `index_uid_agc`(`user_id`, `ae_gmt_create`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_userid_site_authid_guestprice_day
-- ----------------------------
DROP TABLE IF EXISTS `order_userid_site_authid_guestprice_day`;
CREATE TABLE `order_userid_site_authid_guestprice_day`  (
  `ae_gmt_create` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `site` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `customer_number` bigint(20) NULL DEFAULT NULL,
  `order_number` bigint(20) NULL DEFAULT NULL,
  `pay_amount` double(20, 0) NULL DEFAULT NULL,
  `guest_price` double(20, 0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oss_temp
-- ----------------------------
DROP TABLE IF EXISTS `oss_temp`;
CREATE TABLE `oss_temp`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `oss_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0:文件未删除，1：文件已删除',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'label:标签',
  `channel_id` bigint(20) NULL DEFAULT NULL,
  `template_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 707 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'oss的临时文件路径表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for package_sequence
-- ----------------------------
DROP TABLE IF EXISTS `package_sequence`;
CREATE TABLE `package_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2651 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pay_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_log`;
CREATE TABLE `pay_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `pay_method` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trade_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_fee` decimal(10, 2) NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_pay` datetime(0) NULL DEFAULT NULL,
  `business_body` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `business_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seller_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `third_trade_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `third_trade_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_catagory_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for platform_commission
-- ----------------------------
DROP TABLE IF EXISTS `platform_commission`;
CREATE TABLE `platform_commission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺id',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `percent` decimal(10, 2) NULL DEFAULT NULL COMMENT '佣金比例',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单利润汇率' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for platform_logistics_service
-- ----------------------------
DROP TABLE IF EXISTS `platform_logistics_service`;
CREATE TABLE `platform_logistics_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务简称',
  `full_service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务全称',
  `regular` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号规则',
  `site` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品key',
  `product_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `product_desc` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品描述',
  `icon_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品logo图标',
  `measure_units` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计量单位，有效单位包括Y（年）、M（月）、D（日）、P（个、次、份…）',
  `currency` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种：CNY（人民币），HKD（港币），NTD（新台币），USD（美元），JPY（日币）',
  `base_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '基价',
  `service_detail` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务详情（富文本）',
  `user_count` int(11) NULL DEFAULT NULL COMMENT '用户数量',
  `view_count` int(11) NULL DEFAULT NULL COMMENT '查看数量',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_item
-- ----------------------------
DROP TABLE IF EXISTS `product_item`;
CREATE TABLE `product_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `item_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `product_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品key',
  `version_id` bigint(20) NULL DEFAULT NULL COMMENT '版本id',
  `original_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '原价',
  `ULTIMATE_PRICE` decimal(12, 2) NULL DEFAULT NULL COMMENT '最终价格',
  `validator_key` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证器key',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_hide` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不可购买时是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_label
-- ----------------------------
DROP TABLE IF EXISTS `product_label`;
CREATE TABLE `product_label`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `label_id` bigint(20) NOT NULL COMMENT '标签ID',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品表主键ID',
  `user_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_label_id_product_id_site`(`label_id`, `product_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30797 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `product_monitoring`;
CREATE TABLE `product_monitoring`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `wish_product_id` bigint(20) NOT NULL,
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品来源url',
  `monitoring_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货源监控状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_sales_statistical
-- ----------------------------
DROP TABLE IF EXISTS `product_sales_statistical`;
CREATE TABLE `product_sales_statistical`  (
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属网站',
  `auth_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `wish_product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'wish产品id',
  `merge_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组合的key',
  `product_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品主图URL',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU编码',
  `product_attributes` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品SKU的详细信息',
  `order_number` bigint(20) NULL DEFAULT NULL COMMENT '订单总量',
  `sales_total` bigint(20) NULL DEFAULT NULL COMMENT '销售总量',
  `pay_amounts` double NULL DEFAULT NULL COMMENT '销售总金额',
  `week_order_number` bigint(20) NULL DEFAULT NULL COMMENT '7天内的订单量',
  `week_sales_total` bigint(20) NULL DEFAULT NULL COMMENT '7天内的销售量',
  `week_pay_amounts` double NULL DEFAULT NULL COMMENT '7天内销售总金额',
  `month_order_number` bigint(20) NULL DEFAULT NULL COMMENT '30天的订单量',
  `month_sales_total` bigint(20) NULL DEFAULT NULL COMMENT '30天的销售量',
  `month_pay_amounts` double NULL DEFAULT NULL COMMENT '30天的销售总金额',
  `year_order_number` bigint(20) NULL DEFAULT NULL COMMENT '1年的订单量',
  `year_sales_total` bigint(20) NULL DEFAULT NULL COMMENT '1年的销售量',
  `year_pay_amounts` double NULL DEFAULT NULL COMMENT '1年的销售总金额',
  `currency_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货币单位',
  PRIMARY KEY (`user_id`, `wish_product_id`, `auth_id`, `merge_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品sku销售统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_sales_statistical_nokey
-- ----------------------------
DROP TABLE IF EXISTS `product_sales_statistical_nokey`;
CREATE TABLE `product_sales_statistical_nokey`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺id',
  `wish_product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'wish产品id',
  `order_number` bigint(20) NULL DEFAULT NULL COMMENT '订单总量',
  `sales_total` bigint(20) NULL DEFAULT NULL COMMENT '销售总量',
  `pay_amounts` double NULL DEFAULT NULL COMMENT '销售总金额',
  `week_order_number` bigint(20) NULL DEFAULT NULL COMMENT '7天内的订单量',
  `week_sales_total` bigint(20) NULL DEFAULT NULL COMMENT '7天内的销售量',
  `week_pay_amounts` double NULL DEFAULT NULL COMMENT '7天内销售总金额',
  `month_order_number` bigint(20) NULL DEFAULT NULL COMMENT '30天的订单量',
  `month_sales_total` bigint(20) NULL DEFAULT NULL COMMENT '30天的销售量',
  `month_pay_amounts` double NULL DEFAULT NULL COMMENT '30天的销售总金额',
  `year_order_number` bigint(20) NULL DEFAULT NULL COMMENT '1年的订单量',
  `year_sales_total` bigint(20) NULL DEFAULT NULL COMMENT '1年的销售量',
  `year_pay_amounts` double NULL DEFAULT NULL COMMENT '1年的销售总金额',
  PRIMARY KEY (`user_id`, `auth_id`, `wish_product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品销售统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_version
-- ----------------------------
DROP TABLE IF EXISTS `product_version`;
CREATE TABLE `product_version`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '产品id',
  `base_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '基价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_advice
-- ----------------------------
DROP TABLE IF EXISTS `purchase_advice`;
CREATE TABLE `purchase_advice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku主键',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `purchase_advice_count` int(11) NOT NULL COMMENT '采购建议数量',
  `purchase_plan_count` int(11) NOT NULL DEFAULT 0 COMMENT '采购计划中的数量',
  `version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购建议版本号',
  `stock_count` int(11) NOT NULL COMMENT '库存数量',
  `purchase_way_count` int(11) NOT NULL COMMENT '采购途中的数量',
  `appropriation_way_count` int(11) NOT NULL COMMENT '调拨途中数量',
  `safe_stock_count` int(11) NOT NULL COMMENT '安全库存数量',
  `order_count` int(11) NOT NULL COMMENT '未发货的订单量',
  `position_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓位编号',
  `position_id` bigint(20) NULL DEFAULT NULL COMMENT '仓位ID',
  `average_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `goods_sku_id`, `warehouse_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `warehouse_id`, `version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 529 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购建议表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_goods_relation
-- ----------------------------
DROP TABLE IF EXISTS `purchase_goods_relation`;
CREATE TABLE `purchase_goods_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku主键',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `purchase_count` int(11) NOT NULL COMMENT '采购数量',
  `arrival_count` int(11) NOT NULL COMMENT '已到货数量',
  `way_count` int(11) NOT NULL COMMENT '未到货数量',
  `unit_price` decimal(10, 2) NOT NULL COMMENT '采购单价',
  `purchase_plan_id` bigint(20) NOT NULL COMMENT '采购建议ID',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商ID',
  `purchase_order_id` bigint(20) NULL DEFAULT NULL COMMENT '采购单ID',
  `third_goods_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方商品SKU ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `goods_sku_id`(`goods_sku_id`, `purchase_plan_id`, `warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 406 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购商品关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_logistics
-- ----------------------------
DROP TABLE IF EXISTS `purchase_logistics`;
CREATE TABLE `purchase_logistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `logistics_provider` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `logistics_provider_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运单号',
  `arrival_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到货类型',
  `obj_id` bigint(20) NOT NULL COMMENT '采购单ID或者调拨单ID',
  `obj_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购单编号或者调拨单编号',
  `shipping` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '运费',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `obj_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购物流表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `purchase_order_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购单编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购单状态',
  `supplier_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商ID',
  `memo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `purchase_plan_id` bigint(20) NOT NULL COMMENT '采购计划ID',
  `purchase_plan_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购计划编号',
  `payment_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付款状态',
  `shipping` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `other_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '其他费用',
  `gmt_last_arrival` datetime(0) NULL DEFAULT NULL,
  `supply_order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应链订单id',
  `supply_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应链授权账号id',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购类型：ali1688 1688采购',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `purchase_plan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_order_sequence
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_sequence`;
CREATE TABLE `purchase_order_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 330 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_plan
-- ----------------------------
DROP TABLE IF EXISTS `purchase_plan`;
CREATE TABLE `purchase_plan`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `purchase_plan_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购计划编号',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购计划状态',
  `memo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `check_user_id` bigint(20) NULL DEFAULT NULL COMMENT '审核人',
  `back_reason` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核退回原因',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购类型：ali1688 1688采购',
  `import_batch_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `warehouse_id`, `status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购计划表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_plan_sequence
-- ----------------------------
DROP TABLE IF EXISTS `purchase_plan_sequence`;
CREATE TABLE `purchase_plan_sequence`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rule_express
-- ----------------------------
DROP TABLE IF EXISTS `rule_express`;
CREATE TABLE `rule_express`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `rule_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_express` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规则表达式',
  `rule_value` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则详情，json格式',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '规则优先级',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '是否启用',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `express` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解析类型',
  `action` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '符合规则后要执行的操作',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ebay消息规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_order_profit_base
-- ----------------------------
DROP TABLE IF EXISTS `sequence_order_profit_base`;
CREATE TABLE `sequence_order_profit_base`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_order_profit_package
-- ----------------------------
DROP TABLE IF EXISTS `sequence_order_profit_package`;
CREATE TABLE `sequence_order_profit_package`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_order_profit_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_order_profit_product`;
CREATE TABLE `sequence_order_profit_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_logistics`;
CREATE TABLE `sequence_sm_logistics`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_order
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_order`;
CREATE TABLE `sequence_sm_order`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_order_item
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_order_item`;
CREATE TABLE `sequence_sm_order_item`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_order_logistics`;
CREATE TABLE `sequence_sm_order_logistics`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_shipment
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_shipment`;
CREATE TABLE `sequence_sm_shipment`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for service_limit
-- ----------------------------
DROP TABLE IF EXISTS `service_limit`;
CREATE TABLE `service_limit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `service_point` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务点',
  `serivce_point_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `normal` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `normal_limit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `normal_limit_unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip1_limit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip1_limit_unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip2_limit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip2_limit_unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip3` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip3_limit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip3_limit_unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip4` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip4_limit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip4_limit_unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_new` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否新功能',
  `note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `service_group` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务分组',
  `seq` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_opened` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'y' COMMENT '限制是否开启  y为限制开启  n为不限制  s为前端显示但不限制',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for service_log
-- ----------------------------
DROP TABLE IF EXISTS `service_log`;
CREATE TABLE `service_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `capacity` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity_unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duration` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duration_unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_service_begin` datetime(0) NULL DEFAULT NULL,
  `gmt_service_end` datetime(0) NULL DEFAULT NULL,
  `service_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_owner` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `pay_catagory_info_log_id` bigint(20) NULL DEFAULT NULL COMMENT '购买服务时的价格快照ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopee_category
-- ----------------------------
DROP TABLE IF EXISTS `shopee_category`;
CREATE TABLE `shopee_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` int(11) NOT NULL COMMENT '类目ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `isleaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是叶子节点，y是，n否。',
  `parent_cate_id` int(11) NULL DEFAULT NULL COMMENT '父类目ID',
  `ordering` int(11) NULL DEFAULT NULL,
  `site` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目路径>拼接',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `parent_cate_id`(`parent_cate_id`, `site`, `cate_id`) USING BTREE,
  INDEX `cate_id`(`cate_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8852 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'shopee类目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopee_product
-- ----------------------------
DROP TABLE IF EXISTS `shopee_product`;
CREATE TABLE `shopee_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `item_id` int(11) NOT NULL COMMENT '产品ID',
  `item_sku` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父sku编码',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品状态',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `image` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品图片',
  `currency` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '售价',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '平台创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '平台修改时间',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原链接',
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `item_sku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6985 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopee_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `shopee_product_gather`;
CREATE TABLE `shopee_product_gather`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `cate_id` int(11) NULL DEFAULT NULL COMMENT '类目ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品标题',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品图片链接',
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集原链接',
  `source_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集的产品Id',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `gather_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型，采集、复制、导入等',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `gather_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集序号',
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否模板产品',
  `timing_published` datetime(0) NULL DEFAULT NULL COMMENT '定时发布时间',
  `group_id` bigint(20) NOT NULL DEFAULT -1 COMMENT '分组id',
  `error_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_message` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上产品id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '重量kg',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `status`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `auth_id`) USING BTREE,
  INDEX `user_id_3`(`user_id`, `child_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'shopee产品采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopee_product_gather_sequence
-- ----------------------------
DROP TABLE IF EXISTS `shopee_product_gather_sequence`;
CREATE TABLE `shopee_product_gather_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopee_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `shopee_product_sku`;
CREATE TABLE `shopee_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `item_id` int(11) NOT NULL COMMENT '产品ID',
  `item_sku` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父sku编码',
  `variation_id` int(11) NOT NULL COMMENT '产品SKU的ID',
  `variation_sku` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子sku编码',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子sku状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '平台创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '平台修改时间',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `item_id`(`item_id`, `variation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20786 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopee_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `shopee_product_sku_gather`;
CREATE TABLE `shopee_product_sku_gather`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `product_gather_id` bigint(20) NULL DEFAULT NULL COMMENT '产品采集表ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变体名称',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '售价',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `product_gather_id`, `sku_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'shopee产品采集sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopee_used_category
-- ----------------------------
DROP TABLE IF EXISTS `shopee_used_category`;
CREATE TABLE `shopee_used_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `cate_id` int(11) NOT NULL COMMENT '类目id',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `auth_id`, `cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'shopee使用过的类目' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopify_product
-- ----------------------------
DROP TABLE IF EXISTS `shopify_product`;
CREATE TABLE `shopify_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL COMMENT '产品ID',
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `product_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `main_image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品主图',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6802 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopify_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `shopify_product_gather`;
CREATE TABLE `shopify_product_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '如果该字段不为null，表示这条记录是有子账号创建的，如果为null，则表示这条记录是有userid创建的',
  `l_group_id` bigint(20) NULL DEFAULT 0 COMMENT '产品所属产品组id',
  `gather_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集序号,用于界面展示的唯一标示符',
  `gather_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型，采集、复制、导入等',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集表的产品Id',
  `source_site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点ID',
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源网址',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段状态，草稿箱、待发布、发布中、发布、发布失败',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `can_release` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `timing_published` datetime(0) NULL DEFAULT NULL COMMENT '发布时间，如果是立马发布，取当前时间或者为null，如果是定时发布，取指定时间',
  `invalid_msg` varchar(124) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不可发布原因',
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否模板(y/n)',
  `error_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_msg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `job_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据导入的批次id',
  `main_image` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品首图url',
  `title` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品标题',
  `online_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品发布后的在线产品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141816 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'shopify产品采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopify_product_gather_sequence
-- ----------------------------
DROP TABLE IF EXISTS `shopify_product_gather_sequence`;
CREATE TABLE `shopify_product_gather_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopify_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `shopify_product_sku`;
CREATE TABLE `shopify_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `variant_id` bigint(20) NOT NULL COMMENT '变体ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID',
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '平台创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '平台修改时间',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '售价',
  `compare_at_price` decimal(10, 2) NULL DEFAULT NULL,
  `sku` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `bar_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变体条码',
  `position` tinyint(3) NULL DEFAULT NULL COMMENT '变体位置',
  `fulfillment_service` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grams` int(11) NULL DEFAULT NULL COMMENT '产品重量克',
  `image_id` bigint(20) NULL DEFAULT NULL COMMENT '图片id',
  `inventory_management` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shopify是否跟踪变体库存数量 blank不跟踪 shopify追踪',
  `inventory_policy` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缺货时，是否允许下单 deny不允许 continue允许',
  `inventory_quantity` int(11) NULL DEFAULT NULL COMMENT '变体库存',
  `old_inventory_quantity` int(11) NULL DEFAULT NULL,
  `inventory_quantity_adjustment` int(11) NULL DEFAULT NULL,
  `metafield` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品附加属性',
  `option1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户自定义属性',
  `option2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户自定义属性',
  `option3` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户自定义属性',
  `requires_shipping` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taxable` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` int(10) NULL DEFAULT NULL COMMENT '重量',
  `weight_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `variant_id`(`variant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18163 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopify_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `shopify_product_sku_gather`;
CREATE TABLE `shopify_product_sku_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `product_gather_id` bigint(20) NOT NULL COMMENT '采集产品表主键id',
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上sku编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140469 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'shopify产品sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_agent_print_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_agent_print_template`;
CREATE TABLE `sm_agent_print_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `agent_id` bigint(20) NOT NULL COMMENT '货代ID',
  `print_template_id` bigint(20) NOT NULL COMMENT '打印模板ID',
  `agent_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货代编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4537 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_agent_sender_info
-- ----------------------------
DROP TABLE IF EXISTS `sm_agent_sender_info`;
CREATE TABLE `sm_agent_sender_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `return_unit` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退件单位',
  `customer_agreement` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议客户',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `account_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_amazon_submit_order
-- ----------------------------
DROP TABLE IF EXISTS `sm_amazon_submit_order`;
CREATE TABLE `sm_amazon_submit_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `feed_submission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亚马逊任务id',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亚马逊订单号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '亚马逊提交对应的订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_auth
-- ----------------------------
DROP TABLE IF EXISTS `sm_auth`;
CREATE TABLE `sm_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ali_id` bigint(20) NOT NULL,
  `resource_owner` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refresh_token` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_date` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_binding` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` decimal(12, 2) NULL DEFAULT NULL COMMENT '汇率',
  `app_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_secret` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seller_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seller_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seller_zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_unit` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refresh_token_timeout` datetime(0) NULL DEFAULT NULL COMMENT 'refreshToken过期时间',
  `wish_app_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wish授权key',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属网站（指AE、敦煌网、ebay等',
  `seller_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卖家ID',
  `wish_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wish产品id，用于验证wishappkey是否一致',
  `customer_agreement` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议客户',
  `is_expired` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否授权失效 y失效  n未失效',
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'api版本',
  `access_token` varchar(1536) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_timeout` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63558097 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_auth_clean_tmp
-- ----------------------------
DROP TABLE IF EXISTS `sm_auth_clean_tmp`;
CREATE TABLE `sm_auth_clean_tmp`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `is_cleaned` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'n' COMMENT 'y 已清理，n 未清理',
  `clean_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63558085 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `sm_blacklist`;
CREATE TABLE `sm_blacklist`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `buyer_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家名称',
  `biz_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_buyer
-- ----------------------------
DROP TABLE IF EXISTS `sm_buyer`;
CREATE TABLE `sm_buyer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家账户',
  `buyer_full_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家全名',
  `email` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `country` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `total_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '总成交金额',
  `order_finish_count` int(11) NULL DEFAULT NULL COMMENT '完成的订单数',
  `total_order` int(11) NULL DEFAULT NULL COMMENT '总订单数',
  `last_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_order_status` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近订单状态',
  `gmt_last_order` timestamp(0) NULL DEFAULT NULL COMMENT '最近下单时间',
  `gmt_last_order_timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近下单时区',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `order_pay_count` int(11) NULL DEFAULT NULL,
  `order_amount` decimal(12, 2) NULL DEFAULT NULL,
  `pay_amount` decimal(12, 2) NULL DEFAULT NULL,
  `invalid_amount` decimal(12, 2) NULL DEFAULT NULL,
  `invalid_order` int(11) NULL DEFAULT NULL,
  `order_unit` decimal(12, 2) NULL DEFAULT NULL,
  `grade_id` bigint(20) NULL DEFAULT NULL COMMENT '客户等级ID',
  `grade_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `is_change` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有改动',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `login_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 401362 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_buyer_country
-- ----------------------------
DROP TABLE IF EXISTS `sm_buyer_country`;
CREATE TABLE `sm_buyer_country`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `country` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `buyer_count` int(11) NULL DEFAULT NULL COMMENT '买家数量',
  `order_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `pay_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '已付款金额',
  `total_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '成交金额',
  `invalid_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '无效金额',
  `order_finish_count` int(11) NULL DEFAULT NULL COMMENT '结束订单数',
  `order_pay_count` int(11) NULL DEFAULT NULL COMMENT '已付款订单数',
  `total_order` int(11) NULL DEFAULT NULL COMMENT '总订单数',
  `invalid_order` int(11) NULL DEFAULT NULL COMMENT '无效订单数',
  `customer_unit` decimal(12, 2) NULL DEFAULT NULL COMMENT '客单价',
  `last_days` int(11) NULL DEFAULT NULL COMMENT '最近天数',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `country`, `last_days`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 515675 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_buyer_grade
-- ----------------------------
DROP TABLE IF EXISTS `sm_buyer_grade`;
CREATE TABLE `sm_buyer_grade`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `ali_id` bigint(20) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `amount_min` decimal(12, 2) NULL DEFAULT NULL COMMENT '最小订单金额',
  `amount_max` decimal(12, 2) NULL DEFAULT NULL COMMENT '最大订单金额',
  `logical_operator` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '且、或',
  `count_min` int(11) NULL DEFAULT NULL COMMENT '最小订单数',
  `count_max` int(11) NULL DEFAULT NULL COMMENT '最大订单数',
  `is_change` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有改动',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '匹配顺序',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_buyer_message
-- ----------------------------
DROP TABLE IF EXISTS `sm_buyer_message`;
CREATE TABLE `sm_buyer_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `ae_id` bigint(20) NULL DEFAULT NULL COMMENT 'ae主键',
  `ae_gmt_create` timestamp(0) NULL DEFAULT NULL COMMENT 'ae的创建时间',
  `ae_gmt_create_timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ae的创建时区',
  `sender_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者账号',
  `sender_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者名字',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `relation_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对方账号',
  `relation_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对方名字',
  `not_read_count` int(11) NULL DEFAULT NULL COMMENT '未读数量',
  `total_count` int(11) NULL DEFAULT NULL COMMENT '留言总数',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态：0为待处理，1为已处理',
  `is_user_set` int(11) NULL DEFAULT NULL COMMENT '是否为用户设置：0为系统设置，1为用户设置',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `relation_login_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117352 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_buyer_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_buyer_statistics`;
CREATE TABLE `sm_buyer_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `ali_id` bigint(20) NOT NULL,
  `gmt_statistics_begin` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '统计开始时间(包含)',
  `gmt_statistics_end` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '统计结束时间(不包含)',
  `buyer_count` int(11) NULL DEFAULT NULL COMMENT '买家数量',
  `new_buyer_count` int(11) NULL DEFAULT NULL COMMENT '新客户数量',
  `old_buyer_count` int(11) NULL DEFAULT NULL COMMENT '老客户数量',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '订单数',
  `invalid_count` int(11) NULL DEFAULT NULL COMMENT '无效订单数',
  `new_order_count` int(11) NULL DEFAULT NULL COMMENT '新客户订单数',
  `new_invalid_count` int(11) NULL DEFAULT NULL COMMENT '新客户无效订单数',
  `old_order_count` int(11) NULL DEFAULT NULL COMMENT '老客户订单数',
  `old_invalid_count` int(11) NULL DEFAULT NULL COMMENT '老客户无效订单数',
  `order_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `invalid_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '无效金额',
  `new_order_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '新客户订单金额',
  `new_invalid_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '新客户无效金额',
  `old_order_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '老客户订单金额',
  `old_invalid_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '老客户无效金额',
  `has_finish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已完成统计：y（已完成）、n（未完成）',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `gmt_statistics_begin`, `gmt_statistics_end`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18604 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_carrier_code
-- ----------------------------
DROP TABLE IF EXISTS `sm_carrier_code`;
CREATE TABLE `sm_carrier_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carrier_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chinese_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 489 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_category
-- ----------------------------
DROP TABLE IF EXISTS `sm_category`;
CREATE TABLE `sm_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `LEVEL` tinyint(4) NOT NULL,
  `isleaf` tinyint(1) NOT NULL,
  `zh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `en` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_category_1688
-- ----------------------------
DROP TABLE IF EXISTS `sm_category_1688`;
CREATE TABLE `sm_category_1688`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `category_order` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10095 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_category_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sm_category_attribute`;
CREATE TABLE `sm_category_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `category_id` int(20) NOT NULL COMMENT '类目id',
  `pid` bigint(20) NOT NULL COMMENT '类目属性id',
  `pnames` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称（json）',
  `pvalues` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值（json）',
  `spec` int(11) NULL DEFAULT NULL COMMENT 'sku属性顺序(只有为sku属性时才使用)',
  `is_sku` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是sku属性',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可见',
  `customized_name` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customized_pic` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key_attribute` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否关键属性',
  `required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必须',
  `input_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attribute_show_type_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `units` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_pid` bigint(20) NULL DEFAULT NULL,
  `parent_vid` bigint(20) NULL DEFAULT NULL,
  `ordering` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_id`(`category_id`, `pid`, `parent_pid`, `parent_vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167666 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `sm_category_attribute_value`;
CREATE TABLE `sm_category_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `category_id` int(11) NOT NULL COMMENT '类目id',
  `pid` bigint(20) NOT NULL COMMENT '类目属性id',
  `vid` bigint(20) NOT NULL COMMENT '类目属性值id',
  `names` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值名称（json）',
  `parent_pid` bigint(20) NULL DEFAULT NULL,
  `parent_vid` bigint(20) NULL DEFAULT NULL,
  `ordering` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_id`(`category_id`, `pid`, `vid`, `parent_pid`, `parent_vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1129278 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_category_info
-- ----------------------------
DROP TABLE IF EXISTS `sm_category_info`;
CREATE TABLE `sm_category_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `cate_id` int(11) NOT NULL COMMENT '类目ID',
  `names` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称，各种语言',
  `level` int(11) NULL DEFAULT NULL COMMENT '类目层级',
  `isleaf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是叶子节点，y是，n否。',
  `parent_cate_id` int(11) NULL DEFAULT NULL COMMENT '父类目ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_id`(`cate_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11686 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_declaration_info
-- ----------------------------
DROP TABLE IF EXISTS `sm_declaration_info`;
CREATE TABLE `sm_declaration_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `product_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点',
  `declaration_name_cn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文品名',
  `declaration_name_en` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文品名',
  `declaration_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '报关重量',
  `declaration_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '报关价',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码或skukey',
  `customs_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '海关编码',
  `electric` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否含电',
  `declaration_unit_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '报关单件重量',
  `declaration_unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '报关单价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `product_id`, `site`, `sku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1680 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_declaration_set
-- ----------------------------
DROP TABLE IF EXISTS `sm_declaration_set`;
CREATE TABLE `sm_declaration_set`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `cn_declaration_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文品名',
  `declaration_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文品名',
  `declaration_weight_max` decimal(10, 3) NULL DEFAULT NULL COMMENT '报关重量',
  `weight_percent` int(11) NULL DEFAULT NULL COMMENT '报关重量百分比',
  `declaration_price_max` decimal(10, 2) NULL DEFAULT NULL COMMENT '报关价',
  `price_percent` int(11) NULL DEFAULT NULL COMMENT '报关价格百分比',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义报关信息设置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_erp_order_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sm_erp_order_sequence`;
CREATE TABLE `sm_erp_order_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_evaluation_order
-- ----------------------------
DROP TABLE IF EXISTS `sm_evaluation_order`;
CREATE TABLE `sm_evaluation_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `ali_id` bigint(20) NOT NULL COMMENT '卖家aliId',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_feedback` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否已评价',
  `buyer_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家loginId',
  `pay_amount` decimal(10, 2) NOT NULL COMMENT '订单应付款总金额',
  `short_name` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家简称 国家简称',
  `cn_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名 国家中文名称',
  `buyer_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家全名',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ae_order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45840 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_exception_log`;
CREATE TABLE `sm_exception_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `biz_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务id，如订单号、包裹号、店铺id等',
  `exception_msg` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 429 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '异常日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_export_import_filed
-- ----------------------------
DROP TABLE IF EXISTS `sm_export_import_filed`;
CREATE TABLE `sm_export_import_filed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filed_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `filed_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL COMMENT '类型0:导出 1：导入',
  `module_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_export_import_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_export_import_logistics`;
CREATE TABLE `sm_export_import_logistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `template_id` bigint(20) NOT NULL,
  `logistics_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户导入物流类型',
  `site_logistics_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '各站点物流类型',
  `site` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_export_import_relation
-- ----------------------------
DROP TABLE IF EXISTS `sm_export_import_relation`;
CREATE TABLE `sm_export_import_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `template_id` bigint(20) NOT NULL COMMENT '模板id',
  `export_import_filed_id` bigint(20) NOT NULL COMMENT '系统字段id',
  `user_filed_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段别名',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'y:可导出 n:待导出',
  `user_filed_value` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段默认值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1231 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_export_import_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_export_import_template`;
CREATE TABLE `sm_export_import_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `template_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型0:导出 1：导入',
  `module_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能模块',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否默认模板',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_export_record
-- ----------------------------
DROP TABLE IF EXISTS `sm_export_record`;
CREATE TABLE `sm_export_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NOT NULL COMMENT '卖家aliId',
  `type` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `type_name` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `super_type` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父类型',
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件标题',
  `params` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件json格式',
  `gmt_sync` timestamp(0) NULL DEFAULT NULL COMMENT '数据同步时间',
  `file_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `file_type` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `count` int(11) NULL DEFAULT NULL COMMENT '条数',
  `remark` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_feed_submission_result
-- ----------------------------
DROP TABLE IF EXISTS `sm_feed_submission_result`;
CREATE TABLE `sm_feed_submission_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `feed_submission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亚马逊任务id',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亚马逊订单号',
  `message_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息id唯一值，使用包裹号',
  `result_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果状态码，Error',
  `message_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码为一串数字',
  `result_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误描述',
  `request_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亚马逊请求id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_feedback_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_feedback_log`;
CREATE TABLE `sm_feedback_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ali_id` bigint(20) NOT NULL,
  `feedback_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板内容',
  `score` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评分',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `is_blacklist` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是黑名单用户',
  `is_send_message` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否发送站内信',
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站内信内容',
  `send_message_result` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送站内信结果，success 或 fail',
  `enable_blacklist` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用黑名单',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `error_msg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价失败原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15927 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_feedback_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_feedback_template`;
CREATE TABLE `sm_feedback_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `ali_id` bigint(20) NOT NULL,
  `template_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `template_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板内容',
  `score` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评分',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `is_enabled` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `enable_blacklist` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用黑名单',
  `enable_message` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用站内信',
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站内信内容',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_feedback_template_set
-- ----------------------------
DROP TABLE IF EXISTS `sm_feedback_template_set`;
CREATE TABLE `sm_feedback_template_set`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `auth_id` bigint(20) NOT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价类型（1卖家直评，2针对买家评价回评）',
  `template_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家直评模板ID（超时模板复用）',
  `timeout_days` int(11) NULL DEFAULT NULL COMMENT '买家超时未评天数，超过则自动评价',
  `template_id_1` bigint(20) NULL DEFAULT NULL COMMENT '对应买家评1星的卖家评价模板ID',
  `template_id_2` bigint(20) NULL DEFAULT NULL COMMENT '对应买家评2星的卖家评价模板ID',
  `template_id_3` bigint(20) NULL DEFAULT NULL COMMENT '对应买家评3星的卖家评价模板ID',
  `template_id_4` bigint(20) NULL DEFAULT NULL COMMENT '对应买家评4星的卖家评价模板ID',
  `template_id_5` bigint(20) NULL DEFAULT NULL COMMENT '对应买家评5星的卖家评价模板ID',
  `is_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_freight_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_freight_template`;
CREATE TABLE `sm_freight_template`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `template_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `template_priority` tinyint(4) NULL DEFAULT NULL COMMENT '优先级',
  `template_userd_count` int(11) NULL DEFAULT NULL COMMENT '应用物流数',
  `template_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `myModelName`(`template_name`, `user_id`, `template_priority`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_freight_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `sm_freight_template_detail`;
CREATE TABLE `sm_freight_template_detail`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `template_id` bigint(32) NULL DEFAULT NULL COMMENT '主表id',
  `country` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国家code',
  `country_cn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `country_of_subsection` tinyint(4) NOT NULL COMMENT '国家下有多个分段重量标准',
  `weight_unit` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重量单位',
  `weight_min` int(11) NULL DEFAULT NULL COMMENT '开始重量',
  `weight_max` int(11) NULL DEFAULT NULL COMMENT '结束重量',
  `first_weight` int(11) NULL DEFAULT NULL COMMENT '首重',
  `first_price` double NULL DEFAULT NULL COMMENT '首重运费（人民币）',
  `continued_unit_weight` int(11) NULL DEFAULT NULL COMMENT '续重单位重量',
  `continued_price` double NULL DEFAULT NULL COMMENT '续重单价',
  `registration_fee` double NULL DEFAULT NULL COMMENT '挂号费',
  `discount` double(11, 3) NULL DEFAULT NULL COMMENT '折扣',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `myModelandcountry`(`template_id`, `country`, `country_of_subsection`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_freight_template_logistic_relation
-- ----------------------------
DROP TABLE IF EXISTS `sm_freight_template_logistic_relation`;
CREATE TABLE `sm_freight_template_logistic_relation`  (
  `template_id` bigint(32) NOT NULL,
  `agent_id` bigint(32) NULL DEFAULT NULL,
  `channel_id` bigint(32) NULL DEFAULT NULL,
  `agent_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `channel_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(32) NULL DEFAULT NULL,
  UNIQUE INDEX `logisticTypeuk`(`agent_id`, `channel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_gather_data
-- ----------------------------
DROP TABLE IF EXISTS `sm_gather_data`;
CREATE TABLE `sm_gather_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源网址',
  `source_site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源产品ID',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '来源价格（美元）',
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `claim` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否认领（y/n）',
  `ref_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存储html的id（mongodb）',
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '子账户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `source_product_id`, `source_site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 730 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_gather_data_claim
-- ----------------------------
DROP TABLE IF EXISTS `sm_gather_data_claim`;
CREATE TABLE `sm_gather_data_claim`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `gather_data_id` bigint(20) NULL DEFAULT NULL COMMENT '采集数据表id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `gather_data_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集数据认领表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_gather_variable
-- ----------------------------
DROP TABLE IF EXISTS `sm_gather_variable`;
CREATE TABLE `sm_gather_variable`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `rate` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇率json',
  `profit_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '利润类型',
  `profit_value` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '利润值',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `translate` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否立即翻译',
  `label_profit_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签利润类型',
  `label_profit_value` decimal(10, 2) NULL DEFAULT NULL COMMENT '标签利润值',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods`;
CREATE TABLE `sm_goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '子账户ID',
  `goods_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编码',
  `group_id` bigint(20) NOT NULL COMMENT '商品组',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `single_sku` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否单sku',
  `owner_id` bigint(20) NULL DEFAULT NULL COMMENT '产品所有者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `goods_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1836801 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods_check_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods_check_log`;
CREATE TABLE `sm_goods_check_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '库存商品skuID',
  `number_before` int(11) NULL DEFAULT NULL COMMENT '盘点前数量',
  `number_after` int(11) NULL DEFAULT NULL COMMENT '盘点后数量',
  `reason` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盘点原因',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods_group
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods_group`;
CREATE TABLE `sm_goods_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品组名称',
  `parent_id` bigint(20) NOT NULL COMMENT '父iD',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods_reduce_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods_reduce_log`;
CREATE TABLE `sm_goods_reduce_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `goods_sku_id` bigint(20) NOT NULL,
  `reduce_number` int(11) NOT NULL,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sku_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型：直接正常发货/虚拟发货',
  `goods_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库存编码',
  `goods_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库存商品名称',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存扣减记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods_sku`;
CREATE TABLE `sm_goods_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `goods_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编码',
  `bar_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品条码',
  `sku_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku的key',
  `show_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shu属性显示名称',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品所在类目',
  `cost_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本金额（RMB）',
  `number` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `number_min` int(11) NULL DEFAULT NULL COMMENT '最小数量',
  `gmt_last_check` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后盘点时间',
  `declaration_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '报关重量',
  `declaration_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '报关价',
  `goods_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片链接',
  `declaration_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报关名称',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '商品组ID',
  `super_goods_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父库存编码',
  `number_max` int(11) NULL DEFAULT NULL COMMENT '最大数量',
  `location` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库位',
  `cn_declaration_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文报关名称',
  `sku_property` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `customs_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '海关编码',
  `electric` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否含电',
  `weight` decimal(10, 3) NULL DEFAULT NULL COMMENT 'sku重量（KG）',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_combine` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否组合sku',
  `length` int(11) NULL DEFAULT NULL COMMENT '长（默认cm）',
  `width` int(11) NULL DEFAULT NULL COMMENT '宽（默认cm）',
  `height` int(11) NULL DEFAULT NULL COMMENT '高（默认cm）',
  `owner_id` bigint(20) NULL DEFAULT NULL COMMENT '产品所有者',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  `platform_sku_single` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'y' COMMENT '是否为单个平台sku',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `goods_code`) USING BTREE,
  INDEX `sku_index`(`user_id`, `group_id`, `goods_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3090001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods_sku_combine
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods_sku_combine`;
CREATE TABLE `sm_goods_sku_combine`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL COMMENT '父ID',
  `child_id` bigint(20) NOT NULL COMMENT '子ID',
  `number` int(11) NOT NULL COMMENT '数量',
  `ordering` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `parent_id`, `child_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods_sku_product
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods_sku_product`;
CREATE TABLE `sm_goods_sku_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sku_property` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_sku_id` bigint(20) NOT NULL,
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `match_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `product_id`, `sku_code`, `goods_sku_id`, `match_status`) USING BTREE,
  INDEX `user_id`(`user_id`, `goods_sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5146802 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存和线上产品关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods_sku_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods_sku_product_sku`;
CREATE TABLE `sm_goods_sku_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '库存商品SKUID',
  `product_sku_id` bigint(20) NOT NULL COMMENT '线上产品SKUID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `product_id` bigint(20) NOT NULL COMMENT '线上产品ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `goods_sku_id`(`goods_sku_id`, `product_sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60325 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods_sku_relation
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods_sku_relation`;
CREATE TABLE `sm_goods_sku_relation`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL DEFAULT 0,
  `goods_sku` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '本地商品sku',
  `platform_sku` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台sku',
  `is_deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'n',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `platform_sku_index`(`user_id`, `auth_id`, `platform_sku`) USING BTREE,
  INDEX `user_id`(`user_id`, `platform_sku`, `is_deleted`) USING BTREE,
  INDEX `sku_index`(`id`, `user_id`, `auth_id`, `goods_sku`, `platform_sku`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_goods_sku_supplier
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods_sku_supplier`;
CREATE TABLE `sm_goods_sku_supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品skuID',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商ID',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '进货价',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货源网址',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否是默认供应商',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `goods_sku_id`(`user_id`, `goods_sku_id`, `supplier_id`) USING BTREE,
  INDEX `IDX_uid_sid`(`user_id`, `supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 273601 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_image
-- ----------------------------
DROP TABLE IF EXISTS `sm_image`;
CREATE TABLE `sm_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `ali_id` bigint(20) NOT NULL,
  `file_size` int(11) NULL DEFAULT NULL COMMENT '图片大小',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '图片所在组id',
  `height` int(11) NULL DEFAULT NULL COMMENT '图片长度',
  `width` int(11) NULL DEFAULT NULL COMMENT '图片宽度',
  `iid` bigint(20) NULL DEFAULT NULL COMMENT '图片id',
  `reference_count` int(11) NULL DEFAULT NULL COMMENT '引用数量',
  `display_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示名称',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53688 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_label
-- ----------------------------
DROP TABLE IF EXISTS `sm_label`;
CREATE TABLE `sm_label`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '卖家userId，0则代表公共标签',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `style` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签样式',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30908 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_logistics`;
CREATE TABLE `sm_logistics`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_deleted` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'char',
  `order_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logistics_type_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称 物流方式简码',
  `gmt_received` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `logistics_service_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司名',
  `gmt_send` datetime(0) NULL DEFAULT NULL COMMENT '卖家发货时间',
  `receive_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流收货状态',
  `logistics_detail_info` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爬取得物流详细信息',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实的物流状态',
  `order_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_send_timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_received_timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `freight` decimal(12, 2) NULL DEFAULT NULL COMMENT '运费(CNY)',
  `pack_fee` decimal(12, 2) NULL DEFAULT NULL COMMENT '包装费(CNY)',
  `is_cost_change` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成本有改动',
  `new_logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新运单号',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `ali_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `ae_order_id`(`order_id`, `logistics_no`, `site`) USING BTREE,
  INDEX `IDX_logistics_no`(`logistics_no`) USING BTREE,
  INDEX `IDX_auth_id`(`auth_id`) USING BTREE,
  INDEX `IDX_user_id`(`user_id`) USING BTREE,
  INDEX `IDX_STATUS`(`user_id`, `status`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3817309 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'AE订单物流信息表 AE订单物流信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_logistics_number
-- ----------------------------
DROP TABLE IF EXISTS `sm_logistics_number`;
CREATE TABLE `sm_logistics_number`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运单号',
  `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务简称',
  `long_service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务全称',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态：1：已分配，0:未分配',
  `logistics_type` int(11) NULL DEFAULT NULL COMMENT '类型：1：电子导入，0:手动添加',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '运单号批次ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `logistics_no`(`logistics_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35085 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_logistics_number_group
-- ----------------------------
DROP TABLE IF EXISTS `sm_logistics_number_group`;
CREATE TABLE `sm_logistics_number_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次名称',
  `total_count` int(11) NULL DEFAULT NULL COMMENT '运单号数量',
  `available_count` int(11) NULL DEFAULT NULL COMMENT '未分配数量',
  `cancel_match_count` int(11) NULL DEFAULT NULL COMMENT '取消分配数量',
  `cancel_count` int(11) NULL DEFAULT NULL COMMENT '作废数量',
  `type_id` bigint(20) NULL DEFAULT NULL COMMENT '货代运送方式ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_logistics_tracking
-- ----------------------------
DROP TABLE IF EXISTS `sm_logistics_tracking`;
CREATE TABLE `sm_logistics_tracking`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `logistic_tracking_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流追踪号',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包裹状态',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '运单号添加时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '运单号最后一次自动查询时间',
  `item_time_length` int(20) NULL DEFAULT NULL COMMENT '包裹运输时间（天数）',
  `stay_time_length` int(20) NULL DEFAULT NULL COMMENT '包裹停留时间（自从第一条信息出现后无物流信息的时间）',
  `original_country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件国',
  `destination_country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的国',
  `last_event` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最新一条物流信息',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '最新一条物流信息扫描时间',
  `service_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地运输商简码',
  `carrier_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TrackingMore 运输商简码',
  `order_logistics_id` bigint(20) NULL DEFAULT NULL COMMENT 'sm_order_logistics 表主键',
  `local_order_id` bigint(20) NULL DEFAULT NULL COMMENT 'sm_order 表主键',
  `package_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹号',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `agent_id` bigint(20) NULL DEFAULT NULL COMMENT '关联 sm_shipping_agent.agent_name',
  `shipping_type_id` bigint(20) NULL DEFAULT NULL COMMENT '关联 sm_shipping_type.type_name',
  `country` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件国家二字简码',
  `site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT 'sm_auth 表主键',
  `buyer_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家名称',
  `ae_gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `gmt_pay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `gmt_send` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_mail_temp
-- ----------------------------
DROP TABLE IF EXISTS `sm_mail_temp`;
CREATE TABLE `sm_mail_temp`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUBJECT` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email_text` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_mailbox
-- ----------------------------
DROP TABLE IF EXISTS `sm_mailbox`;
CREATE TABLE `sm_mailbox`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NOT NULL,
  `mail_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件服务器地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_mainimage_preview_temp
-- ----------------------------
DROP TABLE IF EXISTS `sm_mainimage_preview_temp`;
CREATE TABLE `sm_mainimage_preview_temp`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` bigint(20) NOT NULL COMMENT '产品ID',
  `ali_id` bigint(20) NOT NULL COMMENT '阿里id',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `watermarked_image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打过水印后的图片url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_marketing_campaign
-- ----------------------------
DROP TABLE IF EXISTS `sm_marketing_campaign`;
CREATE TABLE `sm_marketing_campaign`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `GMT_CREATE` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `GMT_MODIFIED` datetime(0) NOT NULL COMMENT '修改时间',
  `IS_DELETED` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `ali_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `login_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `campaign_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `gmt_begin` datetime(0) NOT NULL COMMENT '活动开始时间',
  `gmt_end` datetime(0) NOT NULL COMMENT '活动结束时间',
  `is_end_restore_prd` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动结束是否还原产品detail',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动状态',
  `stop_remind` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '停止提醒',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IDX_sm_marketign_campaign_ame`(`campaign_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '营销模块活动' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_marketing_campaign_module
-- ----------------------------
DROP TABLE IF EXISTS `sm_marketing_campaign_module`;
CREATE TABLE `sm_marketing_campaign_module`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `GMT_CREATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `GMT_MODIFIED` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `IS_DELETED` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `user_id` bigint(20) NOT NULL COMMENT 'bigint',
  `ali_id` bigint(20) NOT NULL COMMENT 'bigint',
  `login_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module_id` bigint(20) NOT NULL COMMENT '营销模板ID',
  `campaign_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `is_all_prds` tinyint(1) NULL DEFAULT NULL COMMENT '是否全店铺参与活动',
  `prd_group_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品分组ID',
  `prd_group_ids_count` int(11) NULL DEFAULT NULL COMMENT '产品分组数量',
  `prd_ids` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '是否全店铺参与活动',
  `prd_ids_count` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `position` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板在detail中的位置',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参加活动的模板' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_marketing_campaign_prd
-- ----------------------------
DROP TABLE IF EXISTS `sm_marketing_campaign_prd`;
CREATE TABLE `sm_marketing_campaign_prd`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `GMT_CREATE` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `GMT_MODIFIED` datetime(0) NOT NULL COMMENT '修改时间',
  `IS_DELETED` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `ali_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `login_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ae_prd_id` bigint(20) NOT NULL COMMENT 'ae的产品id',
  `module_id` bigint(20) NOT NULL COMMENT '营销模板ID',
  `campaign_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `module_domain` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板来源AE或Local',
  `use_success` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功使用模板',
  `gmt_rollback` datetime(0) NULL DEFAULT NULL COMMENT '取消模板时间',
  `rollback_success` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功清除模块',
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_publish` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IDX_sm_marketnfo_ae_prd_id`(`ae_prd_id`) USING BTREE,
  INDEX `IDX_sm_marketnfo_module_id`(`module_id`) USING BTREE,
  INDEX `IDX_sm_marketnfo_campaign_id`(`campaign_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '营销活动方案详情记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_marketing_campaign_prd_back
-- ----------------------------
DROP TABLE IF EXISTS `sm_marketing_campaign_prd_back`;
CREATE TABLE `sm_marketing_campaign_prd_back`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `GMT_CREATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `GMT_MODIFIED` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `IS_DELETED` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `product_id` bigint(20) NOT NULL COMMENT 'bigint',
  `user_id` bigint(20) NOT NULL COMMENT 'bigint',
  `ali_id` bigint(20) NOT NULL COMMENT 'bigint',
  `login_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ae_prd_id` bigint(20) NOT NULL COMMENT 'ae的产品id',
  `ae_detail_use` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ae详情备份',
  `ae_detail_rollback` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '清除模块前detail备份',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IDX_sm_marketack_marketin__id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品详情描述备份表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_marketing_module
-- ----------------------------
DROP TABLE IF EXISTS `sm_marketing_module`;
CREATE TABLE `sm_marketing_module`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `GMT_CREATE` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `GMT_MODIFIED` datetime(0) NOT NULL COMMENT '修改时间',
  `IS_DELETED` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `ali_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `login_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板类型key',
  `type_name_cn` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `module` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IDX_ali_id_user_id`(`ali_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据表1 营销模板' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_message
-- ----------------------------
DROP TABLE IF EXISTS `sm_message`;
CREATE TABLE `sm_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `ae_id` bigint(20) NULL DEFAULT NULL COMMENT 'ae主键',
  `ae_gmt_create` timestamp(0) NULL DEFAULT NULL COMMENT 'ae的创建时间',
  `ae_gmt_create_timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ae的创建时区',
  `message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ae信息类型',
  `type_id` bigint(20) NULL DEFAULT NULL COMMENT 'ae类型id',
  `receiver_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收者账号',
  `receiver_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收者名字',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `sender_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者账号',
  `sender_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者名字',
  `relation_id` bigint(20) NULL DEFAULT NULL COMMENT '一对用户关系ID',
  `is_read` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已读',
  `have_file` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否含图片',
  `file_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `order_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单地址',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '产品id',
  `product_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品url',
  `msg_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息类型',
  `relation_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对方账号',
  `relation_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对方名字',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `ae_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 746156 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_message_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_message_log`;
CREATE TABLE `sm_message_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '阿里ID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_login_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_biz_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_success` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_mailbox` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件服务器地址',
  `receive_mailbox` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件服务器端口',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19098201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_message_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_message_template`;
CREATE TABLE `sm_message_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `auth_id` bigint(20) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货留言（shipment_message）等',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点',
  `price_min` double NULL DEFAULT NULL,
  `price_max` double NULL DEFAULT NULL,
  `order_process` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_offset` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sm_message_template_user_id_auth_id_index`(`user_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '货代包裹上的寄件人信息（如宝通达、阿玛）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_msg
-- ----------------------------
DROP TABLE IF EXISTS `sm_msg`;
CREATE TABLE `sm_msg`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺ID',
  `last_message_id` bigint(20) NULL DEFAULT NULL COMMENT '最后一条信息ID',
  `message_time` datetime(0) NULL DEFAULT NULL COMMENT '消息时间',
  `channel_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关系ID',
  `other_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者账号',
  `other_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者名字',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `unread_count` int(11) NULL DEFAULT NULL COMMENT '未读数量',
  `child_id` bigint(20) NULL DEFAULT NULL COMMENT '子ID',
  `last_message_is_own` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后一条信息是否是自己的',
  `deal_stat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理状态',
  `read_stat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '读取状态',
  `rank` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标记',
  `msg_sources` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息类型（站内信、订单留言）',
  `is_user_set` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否用户主动设置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `msg_sources`, `channel_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `channel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_online_seller_address
-- ----------------------------
DROP TABLE IF EXISTS `sm_online_seller_address`;
CREATE TABLE `sm_online_seller_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sender，pickup',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'disable，enable',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `country` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `mobile` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `postcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `street_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `trademanage_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旺旺',
  `county` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `street` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `address_id` bigint(20) NOT NULL,
  `is_need_to_update` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要升级地址',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否速卖通后台默认地址',
  `is_use` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用该地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15055 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通线上发货地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_online_shipping_type
-- ----------------------------
DROP TABLE IF EXISTS `sm_online_shipping_type`;
CREATE TABLE `sm_online_shipping_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `warehouse_carrier_service` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上发货服务编码',
  `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上发货提交时的服务名称',
  `service_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上发货服务类型 比如挂号、平邮、燕文专线等',
  `warehouse_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `service_type_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上发货服务类型具体名称，如中国邮政挂号小包',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通线上发货类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order
-- ----------------------------
DROP TABLE IF EXISTS `sm_order`;
CREATE TABLE `sm_order`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台id',
  `ae_gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ae订单创建时间',
  `ae_gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ae订单更新时间-订单详情接口取得',
  `buyer_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家loginId',
  `buyer_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家email-详情接口',
  `pay_amount` decimal(10, 2) NOT NULL COMMENT '订单应付款总金额',
  `order_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态',
  `isv_memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_signer_full_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家全名',
  `receipt_address_country` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址国家简码',
  `gmt_pay_time` timestamp(0) NULL DEFAULT NULL COMMENT '订单付款时间',
  `logistics_amount` decimal(10, 2) NOT NULL COMMENT '物流运费总价',
  `country` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_person` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `related_order_id` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_main_order` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_printed` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memo_gmt_modified` timestamp(0) NULL DEFAULT NULL,
  `isv_memo_modified` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_printed` timestamp(0) NULL DEFAULT NULL,
  `ae_gmt_create_timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ae_gmt_modified_timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_pay_time_timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_combine` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已合并',
  `issue_status` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refund_status` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loan_status` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_good_expired_date` timestamp(0) NULL DEFAULT NULL,
  `biz_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `local_remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地备注',
  `timeout_left_time` bigint(20) NULL DEFAULT NULL COMMENT 'bigint',
  `local_order_status` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地状态',
  `exception_order` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否异常订单',
  `is_user_set` int(11) NULL DEFAULT NULL COMMENT '是否为用户设置：0为系统设置，1为用户设置',
  `item_count` int(11) NULL DEFAULT NULL COMMENT '订单包含的产品数量',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `order_gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间（在对应网站上时间的北京时间）',
  `order_gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '订单更新时间（在对应网站上时间的北京时间）',
  `gmt_send` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `country_full_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址国家全称',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `ali_id` bigint(20) NOT NULL,
  `transaction_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单交易ID',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父订单号，合并订单需要',
  `sku_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku，多个用逗号隔开',
  `logistics_service_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家所选物流，填写其中一个产品上的物流',
  `lack_declaration` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否填写报关',
  `has_msg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有站内信',
  `has_order_msg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有订单留言',
  `name_not_full` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '俄罗斯名称是否不全',
  `currency_code` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `fulfillment_channel` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送方式',
  `shipment_service_level` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送服务级别',
  `order_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `payment_method` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款方式',
  `gmt_trade_end` datetime(0) NULL DEFAULT NULL COMMENT '订单结束时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `ae_order_id`(`order_id`, `site`) USING BTREE,
  INDEX `buyer_login_id`(`buyer_login_id`) USING BTREE,
  INDEX `order_id-pay_time`(`order_id`, `gmt_pay_time`) USING BTREE,
  INDEX `local_order_status`(`local_order_status`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ali_id`(`ali_id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `local_order_status`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `IDX_order_number`(`order_number`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `is_deleted`(`is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000009491 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单主表 订单主表核心信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_address
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_address`;
CREATE TABLE `sm_order_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `country` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人国家简码',
  `country_full_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人国家全称',
  `zip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `detail_address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `province` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `contact_person` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人名称',
  `mobile_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `buyer_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家邮箱',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10235 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_item
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_item`;
CREATE TABLE `sm_order_item`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'char',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `product_img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品主图URL',
  `product_snap_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时产品快照',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品售卖单位',
  `product_unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品单价',
  `product_count` int(11) NOT NULL COMMENT '产品购买数量',
  `total_product_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该产品购买总价',
  `seller_signer_full_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品所属账号名称sellerSignerFirstName+sellerSignerLastName拼接',
  `ae_memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ae产品备注',
  `logistics_service_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品级别物流公司名称',
  `delivery_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交付时间，或叫航运时间',
  `logistics_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '单个产品的物流金额',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID',
  `product_attributes` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品sku的详细信息',
  `ae_order_item_id` bigint(20) NULL DEFAULT NULL,
  `lot_num` int(11) NULL DEFAULT NULL COMMENT '每包的数量',
  `is_cost_change` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成本有改动',
  `cost_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '最小售卖单位成本金额',
  `sku_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku的key',
  `declaration_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `declaration_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '报关重量',
  `declaration_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '报关价',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `ali_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `wish_product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wish产品ID',
  `cn_declaration_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文报关名称',
  `product_img_ext_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customs_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '海关编码',
  `electric` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否含电',
  `currency_code` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `declaration_unit_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '报关单件重量',
  `declaration_unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '报关单价',
  `package_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台包裹号',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有效 y|n，默认是有效的',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单行类型线上和线下，online|offline',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `ae_order_id`(`order_id`, `ae_order_item_id`, `site`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `auth_id`(`auth_id`) USING BTREE,
  INDEX `ali_id`(`ali_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2300016291 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单产品购买明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_label
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_label`;
CREATE TABLE `sm_order_label`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `label_id` bigint(20) NOT NULL COMMENT '标签ID',
  `order_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `label_id`(`label_id`, `order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26055803 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_logistics`;
CREATE TABLE `sm_order_logistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `logistics_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `send_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货类型：全部发货（all），部分发货（part）',
  `is_virtual` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否虚拟发货',
  `package_weight` decimal(12, 3) NULL DEFAULT NULL COMMENT '包裹重量',
  `is_shipment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已发货',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `service_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流方式简称',
  `long_service_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流方式全称',
  `gmt_send` datetime(0) NULL DEFAULT NULL COMMENT '卖家发货时间',
  `is_reissue` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否补发',
  `history_logistics_no` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改前的运单号,多个的话用英文逗号隔开',
  `local_order_id` bigint(20) NOT NULL COMMENT '订单表主键',
  `is_printed` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否打印',
  `sku_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品code',
  `product_attr` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品属性',
  `send_good_expired_date` datetime(0) NULL DEFAULT NULL COMMENT '发货到期时间',
  `country` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `gmt_printed` datetime(0) NULL DEFAULT NULL COMMENT '包裹打印时间',
  `package_status` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹状态',
  `package_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹号',
  `item_count` int(11) NULL DEFAULT NULL COMMENT '订单包含的产品数量',
  `domestic_logistics_company_id` bigint(20) NULL DEFAULT NULL COMMENT '国内快递id',
  `domestic_logistics_company` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国内快递名称',
  `domestic_tracking_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国内快递单号',
  `warehouse_carrier_service` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际选择物流',
  `is_contains_battery` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否含有锂电池',
  `shipping_type_id` bigint(20) NULL DEFAULT NULL COMMENT '运送方式ID',
  `export_pdf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可导出pdf y:是 n: 否',
  `agent_id` bigint(20) NOT NULL COMMENT '货代ID',
  `online_logistics_id` bigint(20) NULL DEFAULT NULL COMMENT '速卖通线上发货物流订单号',
  `gmt_online_logistics_create` datetime(0) NULL DEFAULT NULL COMMENT '线上物流订单创建时间',
  `delivery_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `print_label_info` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印标签信息',
  `print_display_field` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：orderId 或者:2：packageId',
  `is_display_shop_name` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'y:显示，n:不显示',
  `package_memo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹备注',
  `sf_logistics_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顺丰运单号',
  `hualei_order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '华磊系列货代订单号',
  `sys_agent_order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统对接货代订单号',
  `exception_package` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否异常包裹',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '包裹批次id',
  `is_return` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否退件',
  `is_split` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_move` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否移动的包裹',
  `online_service_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上发货服务类型 比如挂号、平邮、燕文专线等',
  `error_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `msg` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `gmt_virtual_send` datetime(0) NULL DEFAULT NULL COMMENT '卖家虚拟发货时间',
  `submit_chinapost_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'y:提交成功，n:提交失败',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `agent_auth_id` bigint(20) NULL DEFAULT NULL COMMENT '货代授权id',
  `logistics_package_amount` decimal(12, 3) NULL DEFAULT NULL COMMENT '物流运费',
  `logistics_package_weight` decimal(12, 3) NULL DEFAULT NULL COMMENT '物流重量',
  `stock_status` tinyint(4) NULL DEFAULT NULL COMMENT '库存状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `package_status`(`package_status`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `IDX_userid_authid_package_exception`(`is_deleted`, `user_id`, `auth_id`, `package_status`, `exception_package`) USING BTREE,
  INDEX `IDX_user_id_package_id`(`user_id`, `package_id`) USING BTREE,
  INDEX `IDX_IS_AU_US`(`is_virtual`, `auth_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61571 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_logistics_ext
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_logistics_ext`;
CREATE TABLE `sm_order_logistics_ext`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `insurance` decimal(12, 2) NULL DEFAULT NULL COMMENT '保险金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '包裹扩展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_logistics_group
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_logistics_group`;
CREATE TABLE `sm_order_logistics_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `group_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批次名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1126 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_logistics_label
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_logistics_label`;
CREATE TABLE `sm_order_logistics_label`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `label_id` bigint(20) NOT NULL COMMENT '标签ID',
  `package_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包裹号id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `package_id`(`package_id`, `label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15627402 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '包裹标签关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_message
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_message`;
CREATE TABLE `sm_order_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `ae_id` bigint(20) NULL DEFAULT NULL COMMENT 'ae主键',
  `ae_gmt_create` timestamp(0) NULL DEFAULT NULL COMMENT 'ae的创建时间',
  `ae_gmt_create_timezone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ae的创建时区',
  `sender_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者账号',
  `sender_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者名字',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `relation_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对方账号',
  `relation_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对方名字',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `order_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单地址',
  `not_read_count` int(11) NULL DEFAULT NULL COMMENT '未读数量',
  `total_count` int(11) NULL DEFAULT NULL COMMENT '留言总数',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态：0为待处理，1为已处理',
  `is_user_set` int(11) NULL DEFAULT NULL COMMENT '是否为用户设置：0为系统设置，1为用户设置',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207438 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_operate_log`;
CREATE TABLE `sm_order_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `operate_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步、修改地址、确认订单、合并订单、拆分订单、生成包裹、申请运单号、删除包裹、打印、提交发货等',
  `operate_table` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作表',
  `operate_column` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作字段',
  `operate_before` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作前',
  `operate_after` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作后',
  `operate_success` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否操作成功',
  `operate_msg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_profit
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_profit`;
CREATE TABLE `sm_order_profit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_pay_time` timestamp(0) NULL DEFAULT NULL COMMENT '订单付款时间',
  `order_gmt_modified` timestamp(0) NULL DEFAULT NULL COMMENT '订单表的修改时间',
  `order_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `affiliate_commission` decimal(12, 2) NULL DEFAULT NULL COMMENT '联盟佣金比例',
  `refund_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `product_cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '产品成本(CNY)',
  `freight_cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '运费成本(CNY)',
  `pack_cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '包装成本(CNY)',
  `other_cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '其他成本(CNY)',
  `profit` decimal(12, 2) NULL DEFAULT NULL COMMENT '利润',
  `profit_percent` int(11) NULL DEFAULT NULL COMMENT '利润率',
  `has_refund` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有退款',
  `is_invalid` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否无效',
  `rate` decimal(12, 2) NULL DEFAULT NULL COMMENT '汇率',
  `is_amount_change` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有金额变动',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `order_id`) USING BTREE,
  INDEX `IDX_gmt_pay_time`(`gmt_pay_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102163 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_seller
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_seller`;
CREATE TABLE `sm_order_seller`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'char',
  `ae_order_id` bigint(32) NOT NULL COMMENT 'bigint AE订单号',
  `ali_id` bigint(20) NOT NULL COMMENT 'bigint 卖家aliId',
  `login_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `ae_order_id`(`ae_order_id`, `ali_id`) USING BTREE,
  INDEX `ali_id`(`ali_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3687990 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单及卖家账号映射表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_statistics`;
CREATE TABLE `sm_order_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `statistics_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计类型',
  `gmt_statistics_begin` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '统计开始时间(包含)',
  `gmt_statistics_end` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '统计结束时间(不包含)',
  `total_order` int(11) NULL DEFAULT NULL COMMENT '总订单数',
  `order_pay_count` int(11) NULL DEFAULT NULL COMMENT '已付款订单数',
  `pending_pay_order` int(11) NULL DEFAULT NULL COMMENT '待付款订单数',
  `invalid_order` int(11) NULL DEFAULT NULL COMMENT '无效订单数',
  `invalid_percent` int(11) NULL DEFAULT NULL COMMENT '订单无效率',
  `order_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '总订单金额',
  `pay_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '已付款金额',
  `pending_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '待付款金额',
  `invalid_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '无效金额',
  `order_unit` decimal(12, 2) NULL DEFAULT NULL COMMENT '件单价',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `statistics_type`, `gmt_statistics_begin`, `gmt_statistics_end`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53845 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_order_urge_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_order_urge_log`;
CREATE TABLE `sm_order_urge_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `gmt_start` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `gmt_end` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（待执行：wait,成功：success,失败：fail）',
  `msg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `sync_time` bigint(20) NULL DEFAULT NULL COMMENT '消耗的时间（单位:ms）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单催付日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_organization
-- ----------------------------
DROP TABLE IF EXISTS `sm_organization`;
CREATE TABLE `sm_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织名称',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `parent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_package_declaration
-- ----------------------------
DROP TABLE IF EXISTS `sm_package_declaration`;
CREATE TABLE `sm_package_declaration`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `package_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹号',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `cn_declaration_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文品名',
  `declaration_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文品名',
  `declaration_weight` decimal(10, 3) NULL DEFAULT NULL COMMENT '报关重量',
  `declaration_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '报关价',
  `customs_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '海关编码',
  `electric` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否含电',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义报关信息设置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_package_item
-- ----------------------------
DROP TABLE IF EXISTS `sm_package_item`;
CREATE TABLE `sm_package_item`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `order_logistics_id` bigint(20) NOT NULL COMMENT '包裹表主键id',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_item_id` bigint(20) NOT NULL COMMENT '订单行主键id',
  `product_count` int(11) NOT NULL COMMENT '产品数量',
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unique_key` bigint(20) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_key`(`user_id`, `order_logistics_id`, `order_item_id`, `unique_key`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `order_logistics_id`(`order_logistics_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '包裹行表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_package_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_package_logistics`;
CREATE TABLE `sm_package_logistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键id',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `gmt_create` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `gmt_modified` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已删除',
  `order_logistics_id` bigint(20) NULL DEFAULT NULL COMMENT 'sm_order_logistice表主键',
  `logistic_tracking_id` bigint(20) NULL DEFAULT NULL COMMENT 'sm_logistic_tracking 表主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_pay_catagory_info
-- ----------------------------
DROP TABLE IF EXISTS `sm_pay_catagory_info`;
CREATE TABLE `sm_pay_catagory_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付主题',
  `business_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `threahold_count` int(10) NULL DEFAULT NULL COMMENT '单笔满（元 或 单  可以是钱 也可以是商品个数）',
  `discount` double NULL DEFAULT NULL COMMENT '折扣',
  `duration_unit` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多少天是一个单位',
  `capacity_unit` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '容量单位',
  `unit_pay` double NULL DEFAULT NULL COMMENT '单位应该支付的money',
  `duration_unit_mount` int(11) NULL DEFAULT NULL COMMENT '时长付款单位 如图片空间按一个月付款',
  `capacity_unit_mount` int(11) NULL DEFAULT NULL COMMENT '容量付款单位 如图片空间300M为付款单位',
  `gived_amount` bigint(11) NULL DEFAULT NULL COMMENT '赠送数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sm_pay_catagory_info_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_pay_catagory_info_log`;
CREATE TABLE `sm_pay_catagory_info_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID    真实购买用户',
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付主题',
  `business_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `threahold_count` int(10) NULL DEFAULT NULL COMMENT '单笔满（元 或 单  可以是钱 也可以是商品个数）',
  `discount` double NULL DEFAULT NULL COMMENT '折扣',
  `duration_unit` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多少天是一个单位',
  `capacity_unit` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '容量单位',
  `unit_pay` double NULL DEFAULT NULL COMMENT '单位应该支付的money',
  `duration_unit_mount` int(11) NULL DEFAULT NULL COMMENT '时长付款单位 如图片空间按一个月付款',
  `capacity_unit_mount` int(11) NULL DEFAULT NULL COMMENT '容量付款单位 如图片空间300M为付款单位',
  `gived_amount` bigint(11) NULL DEFAULT NULL COMMENT '赠送数量',
  `pay_catagory_info_id` bigint(20) NULL DEFAULT NULL COMMENT '原表ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户购买时的快照' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sm_permission
-- ----------------------------
DROP TABLE IF EXISTS `sm_permission`;
CREATE TABLE `sm_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uri` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `method` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordering` int(11) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `is_old` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `can_allocated` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_key` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uri`(`uri`, `method`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `IDX_group_key`(`group_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 226 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_platform_error_code
-- ----------------------------
DROP TABLE IF EXISTS `sm_platform_error_code`;
CREATE TABLE `sm_platform_error_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台站点',
  `method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台方法',
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台错误码',
  `msg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台错误信息描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `site`(`site`, `code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台错误码表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_position_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `sm_position_goods_sku`;
CREATE TABLE `sm_position_goods_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品ID',
  `position_id` bigint(20) NULL DEFAULT NULL COMMENT '仓位ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_print_set
-- ----------------------------
DROP TABLE IF EXISTS `sm_print_set`;
CREATE TABLE `sm_print_set`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ref_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹号packageId或订单号orderId',
  `show_sku` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否显示sku',
  `show_cn_declaration` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否展示中文报关名称',
  `declare_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报关类型，1：礼物，2：商品货样，3：文件，4：其他',
  `show_declaration` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ref_no_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自编号别名',
  `picking_order_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zero_stock_print` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku_attr` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性',
  `show_name` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配货简称',
  `show_position` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否显示仓位',
  `font_size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字体大小',
  `show_local_sku` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否显示本地sku ： y 或者 n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '打印设置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_print_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_print_template`;
CREATE TABLE `sm_print_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `print_type` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印类型如：A4',
  `label_template` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签模板 chinapost_small_fr',
  `print_page_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印纸张大小 page_a4、page_10x10、page_10x15',
  `other_param` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他打印类型，如华磊系列需传入A4之外，还需要传入其他参数1',
  `group_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板分组key',
  `group_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板分组名称',
  `img_url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预览图片',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '模板顺序',
  `agent_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货代类型，系统货代：agent 芒果：mango',
  `tpl_address_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址标签地址',
  `tpl_customs_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报关信息地址',
  `memo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5234 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product
-- ----------------------------
DROP TABLE IF EXISTS `sm_product`;
CREATE TABLE `sm_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `ali_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '产品所在组',
  `subject` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `keyword` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词1',
  `keyword1` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词2',
  `keyword2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词3',
  `product_status_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品状态',
  `image_urls` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除',
  `is_watermarked` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `original_image_urls` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '产品所在类目',
  `VERSION` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品版本号',
  `cost_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本金额（RMB）',
  `product_alias` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品别名',
  `product_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '产品售价',
  `is_package` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否打包售卖',
  `lot_num` int(11) NULL DEFAULT NULL COMMENT '每包的数量',
  `ae_gmt_create` timestamp(0) NULL DEFAULT NULL COMMENT 'ae的创建时间',
  `ae_gmt_modified` timestamp(0) NULL DEFAULT NULL COMMENT 'ae的修改时间',
  `is_set_cost` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否完全填写产品成本',
  `product_unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品单位',
  `is_stock` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已库存',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`, `ali_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product_copy_info
-- ----------------------------
DROP TABLE IF EXISTS `sm_product_copy_info`;
CREATE TABLE `sm_product_copy_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `GMT_CREATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `GMT_MODIFIED` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `IS_DELETED` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `from_ali_id` bigint(20) NOT NULL COMMENT '待复制产品源店铺',
  `to_ali_id` bigint(20) NOT NULL COMMENT '要复制的目标店铺',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `old_product_id` bigint(20) NOT NULL COMMENT '源店铺产品ID',
  `new_product_id` bigint(20) NULL DEFAULT NULL COMMENT '目标店铺新生成的产品ID',
  `gmt_rpc_copy` datetime(0) NULL DEFAULT NULL COMMENT '复制时间点',
  `rpc_copy_status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '复制状态new,success,fail',
  `rpc_copy_memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '复制结果备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品复制记录主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product_copy_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `sm_product_copy_info_detail`;
CREATE TABLE `sm_product_copy_info_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `GMT_CREATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `GMT_MODIFIED` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `IS_DELETED` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `sm_product_copy_info_id` bigint(20) NOT NULL COMMENT '产品复制对应主表的外键',
  `old_product_id` bigint(20) NOT NULL COMMENT '源产品ID',
  `new_prd_propertys` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_freight_template_id` bigint(20) NULL DEFAULT NULL COMMENT '新店铺的运费模板ID',
  `new_promise_template_id` bigint(20) NULL DEFAULT NULL COMMENT '目标店铺的服务模板ID',
  `new_product_group_id` bigint(20) NULL DEFAULT NULL COMMENT '目标店铺产品分组ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_sm_producail_sm_produc_id`(`sm_product_copy_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品复制信息详情' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product_country_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_product_country_statistics`;
CREATE TABLE `sm_product_country_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `ali_id` bigint(20) NOT NULL COMMENT '卖家aliId',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国家简称',
  `gmt_statistics_end` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后统计时间',
  `order_count_total` int(11) NULL DEFAULT NULL COMMENT '订单总量',
  `count_total` int(11) NULL DEFAULT NULL COMMENT '总销售量',
  `amount_total` decimal(12, 2) NULL DEFAULT NULL COMMENT '总销售额',
  `order_count_last30` int(11) NULL DEFAULT NULL COMMENT '最近30天订单量',
  `count_last30` int(11) NULL DEFAULT NULL COMMENT '最近30天销售量',
  `amount_last30` decimal(12, 2) NULL DEFAULT NULL COMMENT '最近30天销售额',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `product_id`, `country`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product_ext
-- ----------------------------
DROP TABLE IF EXISTS `sm_product_ext`;
CREATE TABLE `sm_product_ext`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `product_id` bigint(20) NOT NULL,
  `subject_score` int(11) NULL DEFAULT NULL COMMENT '字数分数',
  `stack_score` int(11) NULL DEFAULT NULL COMMENT '堆砌分数',
  `group_score` int(11) NULL DEFAULT NULL COMMENT '所在组分数',
  `keyword_score` int(11) NULL DEFAULT NULL COMMENT '关键词分数',
  `keyword1_score` int(11) NULL DEFAULT NULL COMMENT '关键词1分数',
  `keyword2_score` int(11) NULL DEFAULT NULL COMMENT '关键词2分数',
  `total_score` int(11) NULL DEFAULT NULL COMMENT '总分',
  `recommend_category` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject_score_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题分数描述',
  `stack_score_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '堆砌描述',
  `group_score_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐组分数描述',
  `keyword_score_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字分数描述',
  `keyword1_score_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词1分数描述',
  `keyword2_score_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词2分数描述',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除',
  `category_score` int(11) NULL DEFAULT NULL COMMENT '所在类目分数',
  `category_score_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类目分数描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sm_product_gather`;
CREATE TABLE `sm_product_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `subject` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品标题',
  `product_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `keyword1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字1',
  `keyword2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字2',
  `image_urls` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图（1-6 json格式）',
  `source_sku_attributes` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原商品sku（json格式）',
  `attributes` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义属性',
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集原链接',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集的产品Id',
  `source_category_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源类目ID',
  `source_category_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源类目名称',
  `source_site` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `gather_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型，采集、复制、导入等',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `error_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情',
  `sku_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `ipm_sku_stock` int(11) NULL DEFAULT NULL COMMENT '库存量',
  `delivery_time` int(11) NULL DEFAULT NULL COMMENT '发货期',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '类目ID',
  `is_image_dynamic` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否图片动态',
  `is_image_watermark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否加水印',
  `product_unit` int(11) NULL DEFAULT NULL COMMENT '产品单位',
  `package_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否打包销售',
  `lot_num` int(11) NULL DEFAULT NULL COMMENT '每包数量',
  `package_length` int(11) NULL DEFAULT NULL COMMENT '包裹长度',
  `package_width` int(11) NULL DEFAULT NULL COMMENT '包裹宽度',
  `package_height` int(11) NULL DEFAULT NULL COMMENT '包裹高度',
  `gross_weight` decimal(12, 3) NULL DEFAULT NULL COMMENT '商品重量',
  `is_pack_sell` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自定义重量',
  `base_unit` int(11) NULL DEFAULT NULL COMMENT 'is_pack_sell为y时,此项必填。购买几件以内不增加运费。取值范围1-1000',
  `add_unit` int(11) NULL DEFAULT NULL COMMENT 'is_pack_sell为y时,此项必填。 每增加件数.取值范围1-1000',
  `add_weight` decimal(12, 3) NULL DEFAULT NULL COMMENT 'is_pack_sell为y时,此项必填。 对应增加的重量.取值范围:0.001-500.000,保留三位小数,采用进位制,单位:kg',
  `ws_valid_num` int(11) NULL DEFAULT NULL COMMENT '商品有效天数。取值范围:1-30,单位:天',
  `product_propertys` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类目属性（json）',
  `is_bulk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否批发',
  `bulk_order` int(11) NULL DEFAULT NULL COMMENT '批发最小数量 。取值范围2-100000。批发最小数量和批发折扣需同时有值或无值。',
  `bulk_discount` int(11) NULL DEFAULT NULL COMMENT '批发折扣。取值范围:1-99。批发最小数量和批发折扣需同时有值或无值。',
  `promise_template_id` bigint(20) NULL DEFAULT NULL COMMENT '服务模板id',
  `freight_template_id` bigint(20) NULL DEFAULT NULL COMMENT '运费模板id',
  `sizechart_id` bigint(20) NULL DEFAULT NULL COMMENT '尺码表模版Id',
  `group_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品组（1-3 json格式）',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '线上产品ID',
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `gather_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集序号',
  `timing_published` datetime(0) NULL DEFAULT NULL COMMENT '定时发布时间',
  `group_id` bigint(20) NOT NULL DEFAULT 0,
  `mobile_detail` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机版详情',
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `IDX_gid_uid`(`group_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142079 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'smt产品采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product_gather_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sm_product_gather_sequence`;
CREATE TABLE `sm_product_gather_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1233 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sm_product_sku`;
CREATE TABLE `sm_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `product_id` bigint(20) NOT NULL COMMENT '产品ID',
  `sku_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku的key',
  `sku_price` decimal(12, 2) NULL DEFAULT NULL COMMENT 'sku的售价（美元）',
  `sku_cost` decimal(12, 2) NULL DEFAULT NULL COMMENT 'sku的成本（人民币）',
  `sku_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku的自定义code',
  `has_stock` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存是否有货；y是有货，n是无货',
  `sku_property` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性',
  `show_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shu属性显示名称',
  `has_sku_property` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有sku属性：y是有、n是无',
  `has_sku_change` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性是否有改动',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '类目ID',
  `attribute_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_stock` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`, `sku_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sm_product_sku_gather`;
CREATE TABLE `sm_product_sku_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `product_gather_id` bigint(20) NULL DEFAULT NULL COMMENT '产品采集表ID',
  `ipm_sku_stock` int(11) NULL DEFAULT NULL COMMENT '库存量',
  `sku_price` decimal(12, 2) NULL DEFAULT NULL COMMENT 'sku价格',
  `sku_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `sku_property` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku属性',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `product_gather_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 771 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'smt产品采集sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_product_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_product_statistics`;
CREATE TABLE `sm_product_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `ali_id` bigint(20) NOT NULL COMMENT '卖家aliId',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_statistics_end` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后统计时间',
  `order_count_total` int(11) NULL DEFAULT NULL COMMENT '订单总量',
  `count_total` int(11) NULL DEFAULT NULL COMMENT '总销售量',
  `amount_total` decimal(12, 2) NULL DEFAULT NULL COMMENT '总销售额',
  `order_count_last30` int(11) NULL DEFAULT NULL COMMENT '最近30天订单量',
  `count_last30` int(11) NULL DEFAULT NULL COMMENT '最近30天销售量',
  `amount_last30` decimal(12, 2) NULL DEFAULT NULL COMMENT '最近30天销售额',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11379 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_profit_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_profit_statistics`;
CREATE TABLE `sm_profit_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `statistics_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计类型',
  `gmt_statistics_begin` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '统计开始时间(包含)',
  `gmt_statistics_end` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '统计结束时间(不包含)',
  `order_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `escrow_fee` decimal(12, 2) NULL DEFAULT NULL COMMENT '手续费',
  `affiliate_commission` decimal(12, 2) NULL DEFAULT NULL COMMENT '联盟佣金',
  `refund_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `total_cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '总成本',
  `train_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '直通车金额',
  `profit` decimal(12, 2) NULL DEFAULT NULL COMMENT '利润',
  `profit_percent` int(11) NULL DEFAULT NULL COMMENT '利润率',
  `rate` decimal(12, 2) NULL DEFAULT NULL COMMENT '汇率',
  `is_amount_change` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有金额变动',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `statistics_type`, `gmt_statistics_begin`, `gmt_statistics_end`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8411 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_quick_menu
-- ----------------------------
DROP TABLE IF EXISTS `sm_quick_menu`;
CREATE TABLE `sm_quick_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `menu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_ico` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `menu_theme` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单自定义样式',
  `menu_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指向的url',
  `menu_group_id` bigint(20) NULL DEFAULT NULL COMMENT '分组id',
  `menu_group_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1222 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_reply_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_reply_template`;
CREATE TABLE `sm_reply_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId，0则代表公共模板',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属类型',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板内容',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_role
-- ----------------------------
DROP TABLE IF EXISTS `sm_role`;
CREATE TABLE `sm_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sm_role_permission`;
CREATE TABLE `sm_role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_sender_info_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_sender_info_template`;
CREATE TABLE `sm_sender_info_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `sender_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sender_postcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `sender_phone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `sender_mobile` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `sender_province` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `sender_city` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `sender_county` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `sender_street` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `sender_company` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `sender_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `collect_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `collect_postcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `collect_phone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `collect_mobile` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `collect_province` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `collect_city` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `collect_county` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `collect_street` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `collect_company` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `collect_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `collect_province_cn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份中文名称',
  `collect_city_cn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市中文名称',
  `collect_county_cn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县中文名称',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `return_unit` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退件单位',
  `customer_agreement` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议客户',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `sign_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `sender_province_en` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人省份英文',
  `sender_city_en` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人城市英文',
  `sender_county_en` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人区英文',
  `pickup_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '揽收类型：0:上门揽收 1：卖家自送',
  `ec_company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中国邮政大客户号，用来提交到邮政接口使用',
  `chinapost_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中国邮政密钥',
  `logistics_biz` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中国邮政业务类型，提交到邮政接口使用',
  `template_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型：普通、E邮宝、亚太、自定义货代、wish邮',
  `customer_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户代码',
  `return_company` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `return_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `return_street` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `return_city` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `return_province` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `return_county` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `return_postcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `return_phone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `return_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `return_city_en` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `return_province_en` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `return_county_en` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `sender_country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人国家代码',
  `collect_country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '揽收人国家代码',
  `return_country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退件人国家代码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '常用地址信息模板' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_sender_shipping_online_relation
-- ----------------------------
DROP TABLE IF EXISTS `sm_sender_shipping_online_relation`;
CREATE TABLE `sm_sender_shipping_online_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'n',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `agent_id` bigint(20) NOT NULL COMMENT '货代id',
  `type_id` bigint(20) NOT NULL COMMENT '渠道运送方式ID',
  `agent_auth_id` bigint(20) NULL DEFAULT NULL COMMENT '货代授权id',
  `pickup_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '揽收类型：0:上门揽收 1：卖家自送',
  `is_return` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否退件:0:销毁,1:退件',
  `sender_template_id` bigint(20) NULL DEFAULT NULL COMMENT '寄件人模版关联id',
  `collect_template_id` bigint(20) NULL DEFAULT NULL COMMENT '揽收模版关联id',
  `return_template_id` bigint(20) NULL DEFAULT NULL COMMENT '退货模版关联id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `relation_index`(`user_id`, `auth_id`, `site`, `agent_id`, `type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺渠道寄件人信息关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_service_name_carrier_code
-- ----------------------------
DROP TABLE IF EXISTS `sm_service_name_carrier_code`;
CREATE TABLE `sm_service_name_carrier_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '芒果物流方式简称',
  `carrier_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TrackingMore上物流方式简称',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否删除',
  `agent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipment
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipment`;
CREATE TABLE `sm_shipment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `service_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际发货物流服务',
  `logistics_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流追踪号',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `send_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货类型：全部发货（all），部分发货（part）',
  `order_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_virtual` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否虚拟发货',
  `result` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口返回结果',
  `country` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `history` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '历史修改记录，存储json',
  `edit_count` int(11) NULL DEFAULT NULL COMMENT '编辑次数',
  `edit_result` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑接口返回结果',
  `send_goods_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `message_content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  `new_logistics_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新物流追踪号',
  `send_message_result` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送留言接口返回结果',
  `is_send_message` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否发送订单留言',
  `long_service_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际发货物流服务全称',
  `package_weight` decimal(12, 3) NULL DEFAULT NULL COMMENT '包裹重量',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `local_order_id` bigint(20) NULL DEFAULT NULL COMMENT '本地订单表id',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流追踪链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4279 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_agent
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_agent`;
CREATE TABLE `sm_shipping_agent`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `agent_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货代名称',
  `agent_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'S:系统对接货代，U:用户自定义货代',
  `agent_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排列顺序',
  `qq` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货代qq',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `introduction` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货代简介',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货代城市',
  `homepage` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主页',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71448 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_agent_auth
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_agent_auth`;
CREATE TABLE `sm_shipping_agent_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `agent_id` bigint(20) NOT NULL COMMENT '货代ID',
  `token` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权Key',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `agent_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货代编码',
  `cust_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顺丰月结卡号',
  `jshipper_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顺丰寄件方代码',
  `expire_date` datetime(0) NULL DEFAULT NULL COMMENT '到期时间',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权状态（启用：enable|禁用：disable）',
  `alias` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权别名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_sender_info
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_sender_info`;
CREATE TABLE `sm_shipping_sender_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL COMMENT '运送方式ID',
  `sender_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sender_postcode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `sender_phone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `sender_mobile` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `sender_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `sender_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `sender_county` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `sender_street` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `sender_company` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `sender_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `collect_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `collect_postcode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `collect_phone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `collect_mobile` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `collect_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `collect_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `collect_county` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `collect_street` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `collect_company` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `collect_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `collect_province_cn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份中文名称',
  `collect_city_cn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市中文名称',
  `collect_county_cn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县中文名称',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `return_unit` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退件单位',
  `customer_agreement` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议客户',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `customer_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `sender_province_en` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人省份英文',
  `sender_city_en` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人城市英文',
  `sender_county_en` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人区英文',
  `pickup_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '揽收类型：0:上门揽收 1：卖家自送',
  `ec_company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中国邮政大客户号，用来提交到邮政接口使用',
  `chinapost_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中国邮政密钥',
  `logistics_biz` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中国邮政业务类型，提交到邮政接口使用',
  `company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `agent_auth_id` bigint(20) NULL DEFAULT NULL COMMENT '货代授权id',
  `return_company` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `return_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `return_street` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `return_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `return_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `return_county` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `return_postcode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `return_phone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `return_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `return_city_en` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `return_province_en` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `return_county_en` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `sender_country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄件人国家代码',
  `collect_country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '揽收人国家代码',
  `return_country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退件人国家代码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2563 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_type
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_type`;
CREATE TABLE `sm_shipping_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `agent_id` bigint(20) NOT NULL COMMENT '货代ID',
  `type_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '当前使用批次ID',
  `export_pdf` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可导出pdf y:是 n: 否',
  `mode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获得运单号的方式',
  `product_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运送方式代码',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排列顺序',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'disable:废弃 enable：启用',
  `mango_print_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'y:支持，n:不支持',
  `other_param` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他参数，目前用于线下E邮宝',
  `wish_service_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wish默认承运商',
  `ae_service_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ae默认承运商',
  `ae_service_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ae默认查询网址',
  `freight_formula` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运费公式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107645 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_type_freight_formula
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_type_freight_formula`;
CREATE TABLE `sm_shipping_type_freight_formula`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL COMMENT '渠道id',
  `country_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国家二字码',
  `first_weight` decimal(12, 3) NOT NULL COMMENT '首重kg',
  `first_weight_fee` decimal(12, 2) NOT NULL COMMENT '首重费用',
  `freight_per_kg` decimal(12, 2) NOT NULL COMMENT '1kg费用',
  `registration_fee` decimal(12, 2) NOT NULL COMMENT '挂号费',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_id`(`type_id`, `country_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '物流渠道运费公式表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_type_online_address
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_type_online_address`;
CREATE TABLE `sm_shipping_type_online_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `shipping_type_id` bigint(20) NOT NULL,
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sender，pickup',
  `address_id` int(11) NOT NULL,
  `is_return` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否退件',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `shipping_type_id`, `auth_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '速卖通线上发货地址表和芒果渠道关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_type_print_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_type_print_template`;
CREATE TABLE `sm_shipping_type_print_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `shipping_type_id` bigint(20) NOT NULL,
  `print_template_id` bigint(20) NOT NULL,
  `is_default_mango_picking` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'n' COMMENT '是否打印芒果拣货单 n 否 y 是',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shipping_type_id`(`shipping_type_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_type_recommend_carrier
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_type_recommend_carrier`;
CREATE TABLE `sm_shipping_type_recommend_carrier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipping_type_id` bigint(20) NOT NULL,
  `site` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `service_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐承运商',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shipping_type_id`(`shipping_type_id`, `site`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '货代渠道推荐承运商' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_type_relation
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_type_relation`;
CREATE TABLE `sm_shipping_type_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL COMMENT '运送方式ID',
  `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台运送方式简称',
  `custom_service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义承运商',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运送方式查询url',
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台站点',
  `shipping_method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亚马逊配送服务标准（如标准、次晨达）',
  `default_logistics_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认跟踪号',
  `amazon_other` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亚马逊其他',
  `ebay_other` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ebay其他',
  `walmart_other` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `other` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他承运商',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `site`(`site`, `type_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16057 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_type_rule
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_type_rule`;
CREATE TABLE `sm_shipping_type_rule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `rule_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_express` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'express表达式',
  `rule_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `shipping_type_id` bigint(20) NULL DEFAULT NULL COMMENT '发货渠道',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '规则优先级',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用',
  `actions` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则执行动作',
  `agent_auth_id` bigint(20) NULL DEFAULT NULL COMMENT '货代授权id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_userId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6087 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自动化发货渠道规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_type_rule_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_type_rule_log`;
CREATE TABLE `sm_shipping_type_rule_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `rule_id` bigint(20) NULL DEFAULT NULL COMMENT '规则id',
  `shipping_type_id` bigint(20) NULL DEFAULT NULL COMMENT '发货渠道',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `success` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'y:成功 n:失败',
  `package_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包裹号',
  `error_msg` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包裹失败原因',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `agent_auth_id` bigint(20) NULL DEFAULT NULL COMMENT '货代授权id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 818 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自动化生成规则操作日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_shipping_type_use
-- ----------------------------
DROP TABLE IF EXISTS `sm_shipping_type_use`;
CREATE TABLE `sm_shipping_type_use`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL COMMENT '运送方式ID',
  `agent_id` bigint(20) NOT NULL COMMENT '货代ID',
  `is_return` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否支持退件',
  `location_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出口易处理点',
  `declared_currency` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `submit_neidan` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否提交系统内单号,y:提交内单号',
  `agent_auth_id` bigint(20) NULL DEFAULT NULL COMMENT '货代授权id',
  `selfdefine` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义（目前用于线上发货仓库码）',
  `insured` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否买了保险（y/n）',
  `pickup_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '揽收类型：0:上门揽收 1：卖家自送',
  `submit_chinapost` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否提交中国邮政,y或者空:提交，n：不提交',
  `insurance_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '万邑通海外仓最后一公里保险类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2407 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_sku_country_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_sku_country_statistics`;
CREATE TABLE `sm_sku_country_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `ali_id` bigint(20) NOT NULL COMMENT '卖家aliId',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国家简称',
  `sku_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku的key',
  `gmt_statistics_end` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后统计时间',
  `order_count_total` int(11) NULL DEFAULT NULL COMMENT '订单总量',
  `count_total` int(11) NULL DEFAULT NULL COMMENT '总销售量',
  `amount_total` decimal(12, 2) NULL DEFAULT NULL COMMENT '总销售额',
  `order_count_last30` int(11) NULL DEFAULT NULL COMMENT '最近30天订单量',
  `count_last30` int(11) NULL DEFAULT NULL COMMENT '最近30天销售量',
  `amount_last30` decimal(12, 2) NULL DEFAULT NULL COMMENT '最近30天销售额',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `product_id`, `country`, `sku_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 658042 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_sku_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sm_sku_statistics`;
CREATE TABLE `sm_sku_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `ali_id` bigint(20) NOT NULL COMMENT '卖家aliId',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku的key',
  `gmt_statistics_end` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后统计时间',
  `order_count_total` int(11) NULL DEFAULT NULL COMMENT '订单总量',
  `count_total` int(11) NULL DEFAULT NULL COMMENT '总销售量',
  `amount_total` decimal(12, 2) NULL DEFAULT NULL COMMENT '总销售额',
  `order_count_last30` int(11) NULL DEFAULT NULL COMMENT '最近30天订单量',
  `count_last30` int(11) NULL DEFAULT NULL COMMENT '最近30天销售量',
  `amount_last30` decimal(12, 2) NULL DEFAULT NULL COMMENT '最近30天销售额',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `product_id`, `sku_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70853 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_submit_feed
-- ----------------------------
DROP TABLE IF EXISTS `sm_submit_feed`;
CREATE TABLE `sm_submit_feed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `feed_submission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亚马逊任务id',
  `feed_processing_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务线上状态',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地处理状态， 处理中、处理完成、已结束',
  `request_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '亚马逊请求id',
  `file_path` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '亚马逊提交任务结果表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `sm_supplier`;
CREATE TABLE `sm_supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `contact_person` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主页',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `ww` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旺旺',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `arrival_period` int(11) NULL DEFAULT NULL COMMENT '到达周期',
  `receive_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款类型',
  `bank_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `receiver` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款人',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `pay_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `pay_remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付备注',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `system` tinyint(1) NULL DEFAULT NULL COMMENT '0：普通   1为系统添加的供应商  2:1688供货商',
  `supplier_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `supplier_code`(`supplier_code`) USING BTREE,
  INDEX `IDX_uid_name`(`user_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39417 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_sync_all_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_sync_all_log`;
CREATE TABLE `sm_sync_all_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sync_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '同步类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`, `sync_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全量同步记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_sync_fail_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_sync_fail_log`;
CREATE TABLE `sm_sync_fail_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ali_id` bigint(20) NULL DEFAULT NULL COMMENT '卖家aliId',
  `sync_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步类型',
  `sync_fail_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步失败类型',
  `fail_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '失败数据',
  `fail_msg` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `is_resolved` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已解决',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54600 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_sync_job
-- ----------------------------
DROP TABLE IF EXISTS `sm_sync_job`;
CREATE TABLE `sm_sync_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sync_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '同步类型',
  `gmt_sync_start` datetime(0) NULL DEFAULT NULL COMMENT '同步开始时间',
  `gmt_sync_end` datetime(0) NULL DEFAULT NULL COMMENT '同步结束时间',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（待同步：waitSync,同步中：syncing,同步成功：syncSuccess,同步失败：syncFail）',
  `msg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步信息',
  `count` int(11) NULL DEFAULT NULL COMMENT '同步数据数量',
  `sync_time` bigint(20) NULL DEFAULT NULL COMMENT '同步消耗的时间（单位:ms）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12537 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'wish标签联想查询表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_synchronize_log
-- ----------------------------
DROP TABLE IF EXISTS `sm_synchronize_log`;
CREATE TABLE `sm_synchronize_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `ali_id` bigint(20) NOT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `success_count` int(11) NULL DEFAULT NULL,
  `sync_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步类型',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `sync_params` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步参数json格式',
  `is_success` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功',
  `create_date_start` timestamp(0) NULL DEFAULT NULL COMMENT '同步开始时间',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `site` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属网站（指AE、敦煌网、ebay等）',
  `create_date_end` datetime(0) NULL DEFAULT NULL COMMENT '同步结束时间',
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步的机子的ip',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_uid_auid_st`(`user_id`, `auth_id`, `sync_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33624 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_task
-- ----------------------------
DROP TABLE IF EXISTS `sm_task`;
CREATE TABLE `sm_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_upload_forecast
-- ----------------------------
DROP TABLE IF EXISTS `sm_upload_forecast`;
CREATE TABLE `sm_upload_forecast`  (
  `id` bigint(20) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `agent_id` bigint(20) NULL DEFAULT NULL COMMENT '货代id',
  `shipping_type_id` bigint(20) NULL DEFAULT NULL COMMENT '物流方式id',
  `shipping_agent_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货代名称',
  `shipping_type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流方式名称',
  `order_logistics_id` bigint(20) NULL DEFAULT NULL COMMENT 'sm_order_logistics 主键id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_urge_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_urge_template`;
CREATE TABLE `sm_urge_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `ali_id` bigint(20) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `msg_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息类型(包括站内信、订单留言、邮箱等)',
  `subject` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `send_hours_later` int(11) NULL DEFAULT NULL COMMENT '下单后N小时以后发送',
  `is_enabled` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启',
  `enable_blacklist` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用黑名单',
  `amount_min` decimal(12, 2) NULL DEFAULT NULL COMMENT '最小订单金额',
  `amount_max` decimal(12, 2) NULL DEFAULT NULL COMMENT '最大订单金额',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `send_minutes_later` int(11) NULL DEFAULT NULL COMMENT '下单后N分钟以后发送',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user
-- ----------------------------
DROP TABLE IF EXISTS `sm_user`;
CREATE TABLE `sm_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register_date` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `register_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_last_login` timestamp(0) NULL DEFAULT NULL,
  `gmt_expired_code` timestamp(0) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '对应主账号ID',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号的状态',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `check_email` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否验证邮箱',
  `check_mobile` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否验证手机',
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wangwang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dingding` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chinese_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `english_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_id` bigint(20) NULL DEFAULT NULL,
  `default_sys` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认的登录系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130265 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user_app_info
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_app_info`;
CREATE TABLE `sm_user_app_info`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `GMT_CREATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `GMT_MODIFIED` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `IS_DELETED` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除\'n\'否，\'y\'是',
  `user_id` bigint(20) NOT NULL COMMENT '应用本地账号主键',
  `app_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_secret` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_auth`;
CREATE TABLE `sm_user_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `child_user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `child_user_id`, `auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1371 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user_backup
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_backup`;
CREATE TABLE `sm_user_backup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register_date` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `register_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_last_login` timestamp(0) NULL DEFAULT NULL,
  `gmt_expired_code` timestamp(0) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '对应主账号ID',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号的状态',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `check_email` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否验证邮箱',
  `check_mobile` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否验证手机',
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wangwang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dingding` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chinese_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `english_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_id` bigint(20) NULL DEFAULT NULL,
  `default_sys` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认的登录系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1655 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user_backup2
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_backup2`;
CREATE TABLE `sm_user_backup2`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register_date` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `register_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_last_login` timestamp(0) NULL DEFAULT NULL,
  `gmt_expired_code` timestamp(0) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '对应主账号ID',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号的状态',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `check_email` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否验证邮箱',
  `check_mobile` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否验证手机',
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wangwang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dingding` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chinese_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `english_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_id` bigint(20) NULL DEFAULT NULL,
  `default_sys` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认的登录系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73948 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_info`;
CREATE TABLE `sm_user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rate` decimal(12, 2) NULL DEFAULT NULL COMMENT '汇率',
  `send_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货人名称',
  `send_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货地址',
  `send_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货电话',
  `send_zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货邮编',
  `return_unit` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退件单位',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user_personnel
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_personnel`;
CREATE TABLE `sm_user_personnel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `child_user_id` bigint(20) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `child_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_role`;
CREATE TABLE `sm_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `child_user_id` bigint(20) NOT NULL,
  `organization_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `position` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `child_user_id`, `organization_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_warehouse`;
CREATE TABLE `sm_user_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `child_user_id` bigint(20) NOT NULL,
  `warehouse_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `child_user_id`, `warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_user_wx
-- ----------------------------
DROP TABLE IF EXISTS `sm_user_wx`;
CREATE TABLE `sm_user_wx`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户iD',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信id',
  `unionid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开放平台统一id',
  `app_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号或网站应用的appid，用来区分是哪个公众号绑定的',
  `nick_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信昵称',
  `head_img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信头像',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_id`(`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `sm_warehouse`;
CREATE TABLE `sm_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库名称',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库类型',
  `status` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库状态（open/colse）',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否默认仓库',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_warehouse_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `sm_warehouse_goods_sku`;
CREATE TABLE `sm_warehouse_goods_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品ID',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `inventory` int(11) NOT NULL COMMENT '可用库存',
  `intransit_inventory` int(11) NOT NULL COMMENT '在途库存',
  `picking_inventory` int(11) NOT NULL COMMENT '打包库存',
  `alert_inventory` int(11) NOT NULL COMMENT '警戒库存',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `warehouse_id`(`warehouse_id`, `goods_sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_warehouse_position
-- ----------------------------
DROP TABLE IF EXISTS `sm_warehouse_position`;
CREATE TABLE `sm_warehouse_position`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓位编号',
  `row` int(11) NOT NULL COMMENT '第几层',
  `col` int(11) NOT NULL COMMENT '第几列',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `shelf_id` bigint(20) NOT NULL COMMENT '货架ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `shelf_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库仓位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_warehouse_shelf
-- ----------------------------
DROP TABLE IF EXISTS `sm_warehouse_shelf`;
CREATE TABLE `sm_warehouse_shelf`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货架名称',
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货架编号',
  `row` int(11) NOT NULL COMMENT '层',
  `col` int(11) NOT NULL COMMENT '列',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_watermark
-- ----------------------------
DROP TABLE IF EXISTS `sm_watermark`;
CREATE TABLE `sm_watermark`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NOT NULL COMMENT '阿里id',
  `image_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `width` int(11) NULL DEFAULT NULL COMMENT '原始宽度',
  `height` int(11) NULL DEFAULT NULL COMMENT '原始高度',
  `display_width` int(11) NULL DEFAULT NULL COMMENT '显示宽度',
  `display_height` int(11) NULL DEFAULT NULL COMMENT '显示高度',
  `watermark_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水印类型，如：系统水印、自定义水印',
  `watermark_category_id` bigint(20) NULL DEFAULT NULL COMMENT '水印分类id，商业类型，如服饰、饰品等',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_watermark_and_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_watermark_and_template`;
CREATE TABLE `sm_watermark_and_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ali_id` bigint(20) NOT NULL COMMENT '阿里id',
  `watermark_id` bigint(20) NOT NULL COMMENT '水印id',
  `template_id` bigint(20) NOT NULL COMMENT '水印id',
  `x_left` int(11) NULL DEFAULT NULL COMMENT 'x轴坐标',
  `y_top` int(11) NULL DEFAULT NULL COMMENT 'y轴坐标',
  `opacity` decimal(5, 2) NULL DEFAULT NULL COMMENT '透明度',
  `rotate` int(11) NULL DEFAULT NULL COMMENT 'y轴坐标',
  `current_left` decimal(5, 2) NULL DEFAULT NULL COMMENT '未转动时的x坐标',
  `current_top` decimal(5, 2) NULL DEFAULT NULL COMMENT '未转动时的y坐标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_watermark_category
-- ----------------------------
DROP TABLE IF EXISTS `sm_watermark_category`;
CREATE TABLE `sm_watermark_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_watermark_template
-- ----------------------------
DROP TABLE IF EXISTS `sm_watermark_template`;
CREATE TABLE `sm_watermark_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `template_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `ali_id` bigint(20) NOT NULL COMMENT '阿里id',
  `watermark_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水印url',
  `preview_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预览图片url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sm_wx
-- ----------------------------
DROP TABLE IF EXISTS `sm_wx`;
CREATE TABLE `sm_wx`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信id',
  `subscribe` int(11) NULL DEFAULT NULL COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息',
  `nickname` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的昵称',
  `sex` int(11) NULL DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在城市',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在省份',
  `language` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `headimgurl` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空',
  `subscribe_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '用户关注时间。如果用户曾多次关注，则取最后关注时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_country
-- ----------------------------
DROP TABLE IF EXISTS `stat_country`;
CREATE TABLE `stat_country`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `country` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `buyer_count` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `payed_order_amount` decimal(10, 2) NOT NULL,
  `complete_order_amount` decimal(10, 2) NOT NULL,
  `invalid_order_amount` decimal(10, 2) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `payed_order_num` int(11) NOT NULL,
  `complete_order_num` int(11) NOT NULL,
  `invalid_order_num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`, `country`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_country_incr_new
-- ----------------------------
DROP TABLE IF EXISTS `stat_country_incr_new`;
CREATE TABLE `stat_country_incr_new`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `country` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `buyer_count` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `payed_order_amount` decimal(10, 2) NOT NULL,
  `complete_order_amount` decimal(10, 2) NOT NULL,
  `invalid_order_amount` decimal(10, 2) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `payed_order_num` int(11) NOT NULL,
  `complete_order_num` int(11) NOT NULL,
  `invalid_order_num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`, `country`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_country_incr_update
-- ----------------------------
DROP TABLE IF EXISTS `stat_country_incr_update`;
CREATE TABLE `stat_country_incr_update`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `country` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `buyer_count` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `payed_order_amount` decimal(10, 2) NOT NULL,
  `complete_order_amount` decimal(10, 2) NOT NULL,
  `invalid_order_amount` decimal(10, 2) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `payed_order_num` int(11) NOT NULL,
  `complete_order_num` int(11) NOT NULL,
  `invalid_order_num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`, `country`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_customer
-- ----------------------------
DROP TABLE IF EXISTS `stat_customer`;
CREATE TABLE `stat_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `total_customer_num` int(11) NOT NULL,
  `new_customer_num` int(11) NOT NULL,
  `old_customer_num` int(11) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `new_order_num` int(11) NOT NULL,
  `old_order_num` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `new_order_amount` decimal(10, 2) NOT NULL,
  `old_order_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_customer_incr_new
-- ----------------------------
DROP TABLE IF EXISTS `stat_customer_incr_new`;
CREATE TABLE `stat_customer_incr_new`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `total_customer_num` int(11) NOT NULL,
  `new_customer_num` int(11) NOT NULL,
  `old_customer_num` int(11) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `new_order_num` int(11) NOT NULL,
  `old_order_num` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `new_order_amount` decimal(10, 2) NOT NULL,
  `old_order_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_customer_incr_update
-- ----------------------------
DROP TABLE IF EXISTS `stat_customer_incr_update`;
CREATE TABLE `stat_customer_incr_update`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `total_customer_num` int(11) NOT NULL,
  `new_customer_num` int(11) NOT NULL,
  `old_customer_num` int(11) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `new_order_num` int(11) NOT NULL,
  `old_order_num` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `new_order_amount` decimal(10, 2) NOT NULL,
  `old_order_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_order
-- ----------------------------
DROP TABLE IF EXISTS `stat_order`;
CREATE TABLE `stat_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `waitpay_order_num` int(11) NOT NULL,
  `incancel_order_num` int(11) NOT NULL,
  `waitdelivery_order_num` int(11) NOT NULL,
  `partdelivery_order_num` int(11) NOT NULL,
  `waitreceiving_order_num` int(11) NOT NULL,
  `waitconfirmamount_order_num` int(11) NOT NULL,
  `foundprocessingamount_order_num` int(11) NOT NULL,
  `riskcontrol_order_num` int(11) NOT NULL,
  `completed_order_num` int(11) NOT NULL,
  `invalid_order_num` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `waitpay_order_amount` decimal(10, 2) NOT NULL,
  `incancel_order_amount` decimal(10, 2) NOT NULL,
  `waitdelivery_order_amount` decimal(10, 2) NOT NULL,
  `partdelivery_order_amount` decimal(10, 2) NOT NULL,
  `waitreceiving_order_amount` decimal(10, 2) NOT NULL,
  `waitconfirmamount_order_amount` decimal(10, 2) NOT NULL,
  `foundprocessingamount_order_amount` decimal(10, 2) NOT NULL,
  `riskcontrol_order_amount` decimal(10, 2) NOT NULL,
  `completed_order_amount` decimal(10, 2) NOT NULL,
  `invalid_order_amount` decimal(10, 2) NOT NULL,
  `waithandle_order_num` int(11) NOT NULL,
  `deliverydone_order_num` int(11) NOT NULL,
  `refunddone_order_num` int(11) NOT NULL,
  `waithandle_order_amount` decimal(10, 2) NOT NULL,
  `deliverydone_order_amount` decimal(10, 2) NOT NULL,
  `refunddone_order_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_order_incr_new
-- ----------------------------
DROP TABLE IF EXISTS `stat_order_incr_new`;
CREATE TABLE `stat_order_incr_new`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `waitpay_order_num` int(11) NOT NULL,
  `incancel_order_num` int(11) NOT NULL,
  `waitdelivery_order_num` int(11) NOT NULL,
  `partdelivery_order_num` int(11) NOT NULL,
  `waitreceiving_order_num` int(11) NOT NULL,
  `waitconfirmamount_order_num` int(11) NOT NULL,
  `foundprocessingamount_order_num` int(11) NOT NULL,
  `riskcontrol_order_num` int(11) NOT NULL,
  `completed_order_num` int(11) NOT NULL,
  `invalid_order_num` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `waitpay_order_amount` decimal(10, 2) NOT NULL,
  `incancel_order_amount` decimal(10, 2) NOT NULL,
  `waitdelivery_order_amount` decimal(10, 2) NOT NULL,
  `partdelivery_order_amount` decimal(10, 2) NOT NULL,
  `waitreceiving_order_amount` decimal(10, 2) NOT NULL,
  `waitconfirmamount_order_amount` decimal(10, 2) NOT NULL,
  `foundprocessingamount_order_amount` decimal(10, 2) NOT NULL,
  `riskcontrol_order_amount` decimal(10, 2) NOT NULL,
  `completed_order_amount` decimal(10, 2) NOT NULL,
  `invalid_order_amount` decimal(10, 2) NOT NULL,
  `waithandle_order_num` int(11) NOT NULL,
  `deliverydone_order_num` int(11) NOT NULL,
  `refunddone_order_num` int(11) NOT NULL,
  `waithandle_order_amount` decimal(10, 2) NOT NULL,
  `deliverydone_order_amount` decimal(10, 2) NOT NULL,
  `refunddone_order_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_order_incr_update
-- ----------------------------
DROP TABLE IF EXISTS `stat_order_incr_update`;
CREATE TABLE `stat_order_incr_update`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `waitpay_order_num` int(11) NOT NULL,
  `incancel_order_num` int(11) NOT NULL,
  `waitdelivery_order_num` int(11) NOT NULL,
  `partdelivery_order_num` int(11) NOT NULL,
  `waitreceiving_order_num` int(11) NOT NULL,
  `waitconfirmamount_order_num` int(11) NOT NULL,
  `foundprocessingamount_order_num` int(11) NOT NULL,
  `riskcontrol_order_num` int(11) NOT NULL,
  `completed_order_num` int(11) NOT NULL,
  `invalid_order_num` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `waitpay_order_amount` decimal(10, 2) NOT NULL,
  `incancel_order_amount` decimal(10, 2) NOT NULL,
  `waitdelivery_order_amount` decimal(10, 2) NOT NULL,
  `partdelivery_order_amount` decimal(10, 2) NOT NULL,
  `waitreceiving_order_amount` decimal(10, 2) NOT NULL,
  `waitconfirmamount_order_amount` decimal(10, 2) NOT NULL,
  `foundprocessingamount_order_amount` decimal(10, 2) NOT NULL,
  `riskcontrol_order_amount` decimal(10, 2) NOT NULL,
  `completed_order_amount` decimal(10, 2) NOT NULL,
  `invalid_order_amount` decimal(10, 2) NOT NULL,
  `waithandle_order_num` int(11) NOT NULL,
  `deliverydone_order_num` int(11) NOT NULL,
  `refunddone_order_num` int(11) NOT NULL,
  `waithandle_order_amount` decimal(10, 2) NOT NULL,
  `deliverydone_order_amount` decimal(10, 2) NOT NULL,
  `refunddone_order_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_order_snap
-- ----------------------------
DROP TABLE IF EXISTS `stat_order_snap`;
CREATE TABLE `stat_order_snap`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `waitpay_order_num` int(11) NOT NULL,
  `incancel_order_num` int(11) NOT NULL,
  `waitdelivery_order_num` int(11) NOT NULL,
  `partdelivery_order_num` int(11) NOT NULL,
  `waitreceiving_order_num` int(11) NOT NULL,
  `waitconfirmamount_order_num` int(11) NOT NULL,
  `foundprocessingamount_order_num` int(11) NOT NULL,
  `riskcontrol_order_num` int(11) NOT NULL,
  `completed_order_num` int(11) NOT NULL,
  `invalid_order_num` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `waitpay_order_amount` decimal(10, 2) NOT NULL,
  `incancel_order_amount` decimal(10, 2) NOT NULL,
  `waitdelivery_order_amount` decimal(10, 2) NOT NULL,
  `partdelivery_order_amount` decimal(10, 2) NOT NULL,
  `waitreceiving_order_amount` decimal(10, 2) NOT NULL,
  `waitconfirmamount_order_amount` decimal(10, 2) NOT NULL,
  `foundprocessingamount_order_amount` decimal(10, 2) NOT NULL,
  `riskcontrol_order_amount` decimal(10, 2) NOT NULL,
  `completed_order_amount` decimal(10, 2) NOT NULL,
  `invalid_order_amount` decimal(10, 2) NOT NULL,
  `waithandle_order_num` int(11) NOT NULL,
  `deliverydone_order_num` int(11) NOT NULL,
  `refunddone_order_num` int(11) NOT NULL,
  `waithandle_order_amount` decimal(10, 2) NOT NULL,
  `deliverydone_order_amount` decimal(10, 2) NOT NULL,
  `refunddone_order_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_product
-- ----------------------------
DROP TABLE IF EXISTS `stat_product`;
CREATE TABLE `stat_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `product_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品售卖单位',
  `product_unit_price` decimal(10, 2) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `total_product_amount` decimal(10, 2) NOT NULL,
  `payed_product_amount` decimal(10, 2) NOT NULL,
  `complete_product_amount` decimal(10, 2) NOT NULL,
  `invalid_product_amount` decimal(10, 2) NOT NULL,
  `total_product_num` int(11) NOT NULL,
  `payed_product_num` int(11) NOT NULL,
  `complete_product_num` int(11) NOT NULL,
  `invalid_product_num` int(11) NOT NULL,
  `product_img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_product_incr_new
-- ----------------------------
DROP TABLE IF EXISTS `stat_product_incr_new`;
CREATE TABLE `stat_product_incr_new`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `product_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品售卖单位',
  `product_unit_price` decimal(10, 2) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `total_product_amount` decimal(10, 2) NOT NULL,
  `payed_product_amount` decimal(10, 2) NOT NULL,
  `complete_product_amount` decimal(10, 2) NOT NULL,
  `invalid_product_amount` decimal(10, 2) NOT NULL,
  `total_product_num` int(11) NOT NULL,
  `payed_product_num` int(11) NOT NULL,
  `complete_product_num` int(11) NOT NULL,
  `invalid_product_num` int(11) NOT NULL,
  `product_img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_product_incr_update
-- ----------------------------
DROP TABLE IF EXISTS `stat_product_incr_update`;
CREATE TABLE `stat_product_incr_update`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `product_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品售卖单位',
  `product_unit_price` decimal(10, 2) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `total_product_amount` decimal(10, 2) NOT NULL,
  `payed_product_amount` decimal(10, 2) NOT NULL,
  `complete_product_amount` decimal(10, 2) NOT NULL,
  `invalid_product_amount` decimal(10, 2) NOT NULL,
  `total_product_num` int(11) NOT NULL,
  `payed_product_num` int(11) NOT NULL,
  `complete_product_num` int(11) NOT NULL,
  `invalid_product_num` int(11) NOT NULL,
  `product_img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_util_old_customer
-- ----------------------------
DROP TABLE IF EXISTS `stat_util_old_customer`;
CREATE TABLE `stat_util_old_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `buyer_login_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家loginId',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`, `buyer_login_id`) USING BTREE,
  INDEX `BUY_AUTH_ID_INDEX`(`is_deleted`, `auth_id`, `statistical_date`) USING BTREE,
  INDEX `TIME_AUTH_ID_INDEX`(`auth_id`, `statistical_date`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_util_order_status
-- ----------------------------
DROP TABLE IF EXISTS `stat_util_order_status`;
CREATE TABLE `stat_util_order_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loan_status` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mg_gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mg_gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ae_gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ae_gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stat_util_record
-- ----------------------------
DROP TABLE IF EXISTS `stat_util_record`;
CREATE TABLE `stat_util_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `start_id` bigint(20) NOT NULL,
  `end_id` bigint(20) NOT NULL,
  `start_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `save_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NULL DEFAULT NULL,
  `goods_sku_id` bigint(20) NOT NULL,
  `sku` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock_count` int(11) NULL DEFAULT NULL,
  `purchase_way_count` int(11) NULL DEFAULT NULL,
  `appropriation_way_count` int(11) NULL DEFAULT NULL,
  `inferior_stock_count` int(11) NULL DEFAULT NULL,
  `safe_stock_count` int(11) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NOT NULL,
  `unit_price` decimal(10, 2) NULL DEFAULT NULL,
  `currency` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_combine` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否组合sku',
  `memo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `lock_count` int(11) NOT NULL COMMENT '锁定数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1441002 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stock_batch_no_sequence
-- ----------------------------
DROP TABLE IF EXISTS `stock_batch_no_sequence`;
CREATE TABLE `stock_batch_no_sequence`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 795 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stock_check
-- ----------------------------
DROP TABLE IF EXISTS `stock_check`;
CREATE TABLE `stock_check`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `status` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '盘点状态',
  `check_no` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '盘点编号',
  `total_count` int(11) NULL DEFAULT NULL COMMENT '盘点总数',
  `checked_count` int(11) NULL DEFAULT NULL COMMENT '已盘点数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `warehouse_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stock_check_sku
-- ----------------------------
DROP TABLE IF EXISTS `stock_check_sku`;
CREATE TABLE `stock_check_sku`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `goods_sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `warehouse_shelf_id` bigint(20) NULL DEFAULT NULL COMMENT '货架ID',
  `warehouse_position_id` bigint(20) NULL DEFAULT NULL COMMENT '仓位ID',
  `check_number` int(11) NULL DEFAULT NULL COMMENT '盘点数',
  `check_different` int(11) NULL DEFAULT NULL COMMENT '盘点误差',
  `stock_check_id` bigint(20) NOT NULL COMMENT '盘点批次ID',
  `ordering` int(11) NOT NULL COMMENT '排序',
  `status` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '盘点sku状态',
  `stock_count` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `stock_check_id`, `goods_sku_id`, `warehouse_position_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stock_log
-- ----------------------------
DROP TABLE IF EXISTS `stock_log`;
CREATE TABLE `stock_log`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(32) NOT NULL,
  `sku` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_sku_id` bigint(32) NOT NULL,
  `batch_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` bigint(32) NOT NULL,
  `warehouse_shelf_id` bigint(20) NULL DEFAULT NULL,
  `warehouse_shelf_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `warehouse_position_id` bigint(20) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `memo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `record_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operate_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `relation_obj_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit_price` decimal(10, 2) NULL DEFAULT NULL,
  `currency` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `good_product_count` int(11) NULL DEFAULT NULL,
  `inferior_product_count` int(11) NULL DEFAULT NULL,
  `original_stock_count` int(11) NULL DEFAULT NULL,
  `new_stock_count` int(11) NULL DEFAULT NULL,
  `new_stock_unit_price` decimal(10, 2) NULL DEFAULT NULL,
  `original_stock_unit_price` decimal(10, 2) NULL DEFAULT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordering` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '库存记录排序',
  `package_id` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `order_item_id` bigint(20) NULL DEFAULT NULL COMMENT '订单行id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gmt_create`(`gmt_create`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15065807 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stock_position
-- ----------------------------
DROP TABLE IF EXISTS `stock_position`;
CREATE TABLE `stock_position`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NULL DEFAULT NULL,
  `goods_sku_id` bigint(20) NOT NULL,
  `sku` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NOT NULL,
  `warehouse_shelf_id` bigint(20) NOT NULL,
  `warehouse_position_id` bigint(20) NOT NULL,
  `stock_id` bigint(20) NOT NULL,
  `stock_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQUE_INDEX`(`goods_sku_id`, `warehouse_id`, `warehouse_shelf_id`, `warehouse_position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2046204 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for supplier_info
-- ----------------------------
DROP TABLE IF EXISTS `supplier_info`;
CREATE TABLE `supplier_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `supplier_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `contact_person` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主页',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stat_country
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stat_country`;
CREATE TABLE `tmp_stat_country`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `country` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `buyer_count` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `payed_order_amount` decimal(10, 2) NOT NULL,
  `complete_order_amount` decimal(10, 2) NOT NULL,
  `invalid_order_amount` decimal(10, 2) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `payed_order_num` int(11) NOT NULL,
  `complete_order_num` int(11) NOT NULL,
  `invalid_order_num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`, `country`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stat_customer
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stat_customer`;
CREATE TABLE `tmp_stat_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `total_customer_num` int(11) NOT NULL,
  `new_customer_num` int(11) NOT NULL,
  `old_customer_num` int(11) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `new_order_num` int(11) NOT NULL,
  `old_order_num` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `new_order_amount` decimal(10, 2) NOT NULL,
  `old_order_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stat_order
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stat_order`;
CREATE TABLE `tmp_stat_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `waitpay_order_num` int(11) NOT NULL,
  `incancel_order_num` int(11) NOT NULL,
  `waitdelivery_order_num` int(11) NOT NULL,
  `partdelivery_order_num` int(11) NOT NULL,
  `waitreceiving_order_num` int(11) NOT NULL,
  `waitconfirmamount_order_num` int(11) NOT NULL,
  `foundprocessingamount_order_num` int(11) NOT NULL,
  `riskcontrol_order_num` int(11) NOT NULL,
  `completed_order_num` int(11) NOT NULL,
  `invalid_order_num` int(11) NOT NULL,
  `total_order_amount` decimal(10, 2) NOT NULL,
  `waitpay_order_amount` decimal(10, 2) NOT NULL,
  `incancel_order_amount` decimal(10, 2) NOT NULL,
  `waitdelivery_order_amount` decimal(10, 2) NOT NULL,
  `partdelivery_order_amount` decimal(10, 2) NOT NULL,
  `waitreceiving_order_amount` decimal(10, 2) NOT NULL,
  `waitconfirmamount_order_amount` decimal(10, 2) NOT NULL,
  `foundprocessingamount_order_amount` decimal(10, 2) NOT NULL,
  `riskcontrol_order_amount` decimal(10, 2) NOT NULL,
  `completed_order_amount` decimal(10, 2) NOT NULL,
  `invalid_order_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stat_product
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stat_product`;
CREATE TABLE `tmp_stat_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `statistical_date` int(11) NOT NULL,
  `product_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品售卖单位',
  `product_unit_price` decimal(10, 2) NOT NULL,
  `total_order_num` int(11) NOT NULL,
  `total_product_amount` decimal(10, 2) NOT NULL,
  `payed_product_amount` decimal(10, 2) NOT NULL,
  `complete_product_amount` decimal(10, 2) NOT NULL,
  `invalid_product_amount` decimal(10, 2) NOT NULL,
  `total_product_num` int(11) NOT NULL,
  `payed_product_num` int(11) NOT NULL,
  `complete_product_num` int(11) NOT NULL,
  `invalid_product_num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`, `statistical_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tophatter_product
-- ----------------------------
DROP TABLE IF EXISTS `tophatter_product`;
CREATE TABLE `tophatter_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品状态',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '备注',
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `disabled_at` datetime(0) NULL DEFAULT NULL COMMENT '禁用时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品标题',
  `product_condition` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物品状况',
  `brand` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `main_image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `available_quantity` int(11) NULL DEFAULT NULL COMMENT '可售数量',
  `shipping_origin` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货地',
  `starting_bid` decimal(10, 0) NULL DEFAULT NULL,
  `buy_now_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '价格',
  `retail_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '建议零售价',
  `shipping_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '运费',
  `cost_basis` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_authId_productId_skuCode`(`auth_id`, `product_id`, `sku_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 502208 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'tophatter在线产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tophatter_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `tophatter_product_gather`;
CREATE TABLE `tophatter_product_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `parent_sku` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_name` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(140) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品标题',
  `buy_now_price` decimal(18, 0) NULL DEFAULT NULL,
  `retail_price` decimal(18, 0) NULL DEFAULT NULL,
  `cost_basis` decimal(18, 2) NULL DEFAULT NULL,
  `shipping_price` decimal(18, 0) NULL DEFAULT NULL,
  `shipping_origin` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出发地',
  `main_image` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品首图url',
  `starting_bid` decimal(18, 0) NULL DEFAULT NULL COMMENT '起拍价',
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '如果该字段不为null，表示这条记录是有子账号创建的，如果为null，则表示这条记录是有userid创建的',
  `l_group_id` bigint(20) NULL DEFAULT 0 COMMENT '产品所属产品组id',
  `gather_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集序号,用于界面展示的唯一标示符',
  `gather_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集类型，采集、复制、导入等',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集表的产品Id',
  `source_site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点ID',
  `source_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源网址',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段状态，草稿箱、待发布、发布中、发布、发布失败',
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复采集',
  `can_release` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `timing_published` datetime(0) NULL DEFAULT NULL COMMENT '发布时间，如果是立马发布，取当前时间，如果是定时发布，取指定时间',
  `invalid_msg` varchar(124) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不可发布原因',
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否模板(y/n)',
  `error_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_msg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `job_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据导入的批次id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142081 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'tophatter产品采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tophatter_product_gather_sequence
-- ----------------------------
DROP TABLE IF EXISTS `tophatter_product_gather_sequence`;
CREATE TABLE `tophatter_product_gather_sequence`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1091 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tophatter_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `tophatter_product_sku`;
CREATE TABLE `tophatter_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '备注',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  PRIMARY KEY (`id`, `created_at`) USING BTREE,
  UNIQUE INDEX `unique_authId_productId_skuCode`(`auth_id`, `product_id`, `sku_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4322604 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'tophatter在线产品sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tophatter_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `tophatter_product_sku_gather`;
CREATE TABLE `tophatter_product_sku_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线上sku编码',
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL COMMENT '库存',
  `product_gather_id` bigint(20) NOT NULL COMMENT '产品编码',
  `auth_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140499 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'tophatter产品sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录ip',
  `back` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否后门登录',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64388 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wanyitong_oms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wanyitong_oms_inventory`;
CREATE TABLE `wanyitong_oms_inventory`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `agent_auth_id` bigint(20) NOT NULL,
  `warehouse_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inventory` int(10) NOT NULL COMMENT '对应海外仓在库库存，即此时此刻海外仓内对应该产品的库存（注：此库存不是可用库存，因为该数量包括了已被下单但还未出库的产品）',
  `fulfillable_inventory` int(10) NOT NULL COMMENT '可售数量',
  `reserved_inventory` int(10) NOT NULL COMMENT '对应海外仓内已被预订下了海外仓出库单，但还未出库的产品',
  `pipeline_inventory` int(10) NOT NULL COMMENT '在途数量',
  `qty_share_storage` int(10) NOT NULL COMMENT '共享库存',
  `qty_sell_his_out` int(10) NOT NULL COMMENT '历史代销量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `Unique_agentAuthId_warehouseId_productCode`(`agent_auth_id`, `warehouse_id`, `product_code`) USING BTREE,
  INDEX `Normal_userId`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orders` int(11) NULL DEFAULT NULL,
  `system` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `WAREHOUSE_UNIQUE`(`user_id`, `name`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115449 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for warehouse_position
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_position`;
CREATE TABLE `warehouse_position`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `position_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shelf_id` bigint(20) NOT NULL,
  `warehouse_id` bigint(20) NOT NULL,
  `column_index` int(11) NULL DEFAULT NULL,
  `row_index` int(11) NULL DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ordinary',
  `system` tinyint(1) NULL DEFAULT 0,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父仓位ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `POSITION_UNIQUE`(`user_id`, `warehouse_id`, `position_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1007802 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for warehouse_product_report
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_product_report`;
CREATE TABLE `warehouse_product_report`  (
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `stock_in_count` int(18) NULL DEFAULT NULL COMMENT '入库数量',
  `stock_out_count` int(18) NULL DEFAULT NULL COMMENT '出库数量',
  `goods_sku_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '商品sku主键id',
  `warehouse_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '仓库主键id',
  `statistics_date` datetime(0) NOT NULL,
  `record_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'in：入库统计数据；out：出口统计数据；',
  `stock_gmt_create` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库商品报表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for warehouse_product_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_product_statistics_info`;
CREATE TABLE `warehouse_product_statistics_info`  (
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `begin_date` datetime(0) NOT NULL COMMENT '统计数据的开始日期',
  `end_date` datetime(0) NOT NULL COMMENT '统计数据的结束日期'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库商品统计信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for warehouse_shelf
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_shelf`;
CREATE TABLE `warehouse_shelf`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shelf_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position_count` int(11) NULL DEFAULT NULL,
  `position_prefix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `row_count` int(11) NULL DEFAULT NULL,
  `column_count` int(11) NULL DEFAULT NULL,
  `joiner` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NOT NULL,
  `system` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `SHELF_UNIQUE`(`user_id`, `shelf_no`, `warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96401 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for warehouse_shelf_sequence
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_shelf_sequence`;
CREATE TABLE `warehouse_shelf_sequence`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4782 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_announcements_noti
-- ----------------------------
DROP TABLE IF EXISTS `wish_announcements_noti`;
CREATE TABLE `wish_announcements_noti`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `message` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bd_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_id`(`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_extro_image_fail
-- ----------------------------
DROP TABLE IF EXISTS `wish_extro_image_fail`;
CREATE TABLE `wish_extro_image_fail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wish产品id',
  `local_count` int(11) NULL DEFAULT NULL COMMENT '本地额外图片数量',
  `online_count` int(11) NULL DEFAULT NULL COMMENT 'wish额外图片数量',
  `local_extro_image` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地额外图片',
  `online_extro_image` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地额外图片',
  `sku_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品sku',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'wish附图上传失败表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_image_black_list
-- ----------------------------
DROP TABLE IF EXISTS `wish_image_black_list`;
CREATE TABLE `wish_image_black_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_infractions_noti
-- ----------------------------
DROP TABLE IF EXISTS `wish_infractions_noti`;
CREATE TABLE `wish_infractions_noti`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `noti_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `noti_id`(`noti_id`, `auth_id`) USING BTREE,
  INDEX `auth_id`(`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6196 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_order_fine
-- ----------------------------
DROP TABLE IF EXISTS `wish_order_fine`;
CREATE TABLE `wish_order_fine`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `amount` double(11, 0) NULL DEFAULT NULL COMMENT '罚款次数',
  `fine_status` tinyint(4) NULL DEFAULT NULL COMMENT '状态 0 pengding  1 扣除 2 取消',
  `fine_status_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PENDING DEDUCTED CANCELLED',
  `fine_type` tinyint(4) NULL DEFAULT NULL COMMENT '0: ONEOFF\r\n															1: INFRACTION\r\n															2: LOGISTIC_FEE\r\n															3: ONEOFF_FEE\r\n															4: FBW_FEE\r\n															5: PROMOTION_FEE\r\n															6: RETURN_LABEL_FEE\r\n															7: PAID_PLACEMENT_ENROLLMENT_FEE\r\n															8: PAID_PLACEMENT_IMPRESSION_FEE\r\n															9: LEGAL_SETTLEMENT\r\n															10: MERCHANT_INCENTIVE\r\n															11: LATE_CONFIRMED_FULFILLMENT\r\n															12: QUALITY_REFUND_FINE\r\n															13: PROHIBITED_PRODUCT_FINE\r\n															14: MISLEADING_LISTING\r\n															15: SE_CASH_BACK\r\n															16: REPEAT_IP_INFRINGEMENT\r\n															17: IP_INFRINGEMENT\r\n															18: WISH_EXPRESS_VIOLATION\r\n															19: FAKE_TRACKING\r\n															20: UNFULFILLED_ORDER',
  `fine_type_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ONEOFF\r\n																				INFRACTION\r\n																				LOGISTIC_FEE\r\n																				ONEOFF_FEE\r\n																				FBW_FEE\r\n																				PROMOTION_FEE\r\n																				RETURN_LABEL_FEE\r\n																				PAID_PLACEMENT_ENROLLMENT_FEE\r\n																				PAID_PLACEMENT_IMPRESSION_FEE\r\n																				LEGAL_SETTLEMENT\r\n																				MERCHANT_INCENTIVE\r\n																				LATE_CONFIRMED_FULFILLMENT\r\n																				QUALITY_REFUND_FINE\r\n																				PROHIBITED_PRODUCT_FINE\r\n																				MISLEADING_LISTING\r\n																				SE_CASH_BACK\r\n																				REPEAT_IP_INFRINGEMENT\r\n																				IP_INFRINGEMENT\r\n																				WISH_EXPRESS_VIOLATION\r\n																				FAKE_TRACKING\r\n																				UNFULFILLED_ORDER',
  `is_reversed` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cancelled_time` datetime(0) NULL DEFAULT NULL COMMENT '罚款取消时间',
  `cancelled_reason_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '罚款取消时间',
  `payment_deduction_amount` double NULL DEFAULT NULL,
  `fine_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auth_id` bigint(20) NULL DEFAULT NULL,
  `fine_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_key`(`auth_id`, `order_id`, `fine_id`) USING BTREE,
  INDEX `search_index`(`user_id`, `order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 402 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_product
-- ----------------------------
DROP TABLE IF EXISTS `wish_product`;
CREATE TABLE `wish_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品ID',
  `parent_sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父sku编码',
  `description` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品描述',
  `number_sold` int(11) NULL DEFAULT NULL COMMENT '销量',
  `number_saves` int(11) NULL DEFAULT NULL COMMENT '收藏量',
  `is_promoted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否被推广',
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `upc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通用code编码',
  `tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `auto_tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台标签',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否在售卖',
  `product_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品状态类型',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `extra_images` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展图片',
  `main_image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原链接',
  `date_uploaded` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `brand` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `landing_page_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `memo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `wish_express_country_codes` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启用海外仓国家',
  `is_monitoring` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已添加到货源监控',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 214111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_product_boost_campaign
-- ----------------------------
DROP TABLE IF EXISTS `wish_product_boost_campaign`;
CREATE TABLE `wish_product_boost_campaign`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '帐号id',
  `auth_id` bigint(20) NOT NULL COMMENT '店铺权限id',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `gmt_modified` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据修改时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动创建人',
  `modifier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动修改人',
  `campaign_max_budget` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '活动预算',
  `total_enrollment_fees_charged` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '活动商品总报名费',
  `auto_renew` bit(1) NULL DEFAULT b'0' COMMENT '是否自动刷新活动，1：是，0：否',
  `total_campaign_spend` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '活动总开销',
  `total_impressions` bigint(20) NULL DEFAULT NULL COMMENT '活动总流量(游览次数)',
  `sales` int(10) NULL DEFAULT 0 COMMENT '活动中成交笔数',
  `campaign_start_time` timestamp(0) NULL DEFAULT NULL COMMENT '活动开始时间',
  `wish_campaign_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'wish平台活动id',
  `paid_impressions` bigint(20) NULL DEFAULT NULL COMMENT '付费流量',
  `total_impression_fees_charged` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '活动流量总开销',
  `campaign_end_time` timestamp(0) NULL DEFAULT NULL COMMENT '活动结束时间',
  `campaign_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `merchant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'wish平台店铺id',
  `impression_fees_breakdown` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '流量支付信息',
  `gmv` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '活动总成交金额',
  `status` int(2) NULL DEFAULT NULL COMMENT '活动状态:,1:\'NEW\',2: \'STARTED\',3: \'CANCELLED\',4: \'STOPPED\', 5:\'ENDED\',6:\'SAVED\'',
  `is_deleted` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'n' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `third_campaign_id_index`(`wish_campaign_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'wish产品促销活动' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_product_boost_campaign_item
-- ----------------------------
DROP TABLE IF EXISTS `wish_product_boost_campaign_item`;
CREATE TABLE `wish_product_boost_campaign_item`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品添加到活动的时间',
  `gmt_modified` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动中商品修改时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modifier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wish_campaign_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方活动id',
  `actual_charge_rate` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实际竞价支付金额',
  `keywords` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `merchant_bid_rate` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '用户竞价金额',
  `wish_product_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'wish平台产品id',
  `enrollment_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商品报名费',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `campaign_id_index`(`wish_campaign_id`) USING BTREE,
  INDEX `third_product_id_index`(`wish_product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'wish平台活动与商品关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `wish_product_gather`;
CREATE TABLE `wish_product_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `sku_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品code',
  `title` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `main_image_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图链接',
  `other_image_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '额外图片链接',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '产品的数量',
  `shipping_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `acquire_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '可得金额',
  `shipping_days_min` int(11) NULL DEFAULT NULL COMMENT '运送最小天数',
  `shipping_days_max` int(11) NULL DEFAULT NULL COMMENT '运送最大天数',
  `msrp` decimal(10, 2) NULL DEFAULT NULL COMMENT '制造商建议零售价',
  `brand` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '牌子',
  `upc` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通用产品code',
  `landing_page_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联链接',
  `source_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品来源链接',
  `source_image_url` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源图片链接,json格式,多个',
  `source_sku_attributes` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源sku属性',
  `recommend_tags` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐标签',
  `recommend_category_name` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类目名称',
  `recommend_category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类目ID',
  `source_site` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源站点',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `is_gather` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为采集数据',
  `source_main_image_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源主图,只放一个',
  `category_id` int(11) NULL DEFAULT NULL COMMENT 'wish类目id',
  `wish_product_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wish线上产品id',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '子账号ID',
  `group_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_repeat` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否重复',
  `source_product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源产品ID',
  `can_release` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可发布',
  `invalid_msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不能发布原因',
  `timing_published` datetime(0) NULL DEFAULT NULL COMMENT '定时发布时间',
  `group_id` bigint(20) NOT NULL DEFAULT 0,
  `is_template` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否模板产品',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_user_id`(`user_id`) USING BTREE,
  INDEX `IDX_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `auth_id`(`auth_id`) USING BTREE,
  INDEX `IDX_status`(`user_id`, `status`) USING BTREE,
  INDEX `IDX_gid_uid`(`group_id`, `user_id`) USING BTREE,
  INDEX `IDX_status_sku`(`user_id`, `status`, `sku_code`, `is_deleted`) USING BTREE,
  INDEX `IDX_USERID_PRODUCTID`(`user_id`, `wish_product_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142049 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'wish产品采集主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_product_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wish_product_inventory`;
CREATE TABLE `wish_product_inventory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NOT NULL COMMENT 'auth_id',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品id',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `sku_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子sku',
  `parent_sku_code` varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父sku',
  `inventory` int(11) NULL DEFAULT NULL COMMENT '库存',
  `warehouse_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '海外仓名称',
  `color` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `relateKey`(`user_id`, `auth_id`, `product_id`, `warehouse_name`, `sku_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51803 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_product_inventory_relation
-- ----------------------------
DROP TABLE IF EXISTS `wish_product_inventory_relation`;
CREATE TABLE `wish_product_inventory_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NOT NULL COMMENT '授权店铺id',
  `warehouse_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品id',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major_image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `last_updated_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `relateKey`(`auth_id`, `product_id`, `warehouse_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6811 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_product_item_gather
-- ----------------------------
DROP TABLE IF EXISTS `wish_product_item_gather`;
CREATE TABLE `wish_product_item_gather`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `product_id` bigint(20) NOT NULL COMMENT '产品主表ID',
  `sku_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子产品code',
  `size` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `color` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '产品的数量',
  `is_success` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功y:是，n：否',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `child_user_id` bigint(20) NULL DEFAULT NULL COMMENT '子账号ID',
  `img_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  `shipping_days_min` int(11) NULL DEFAULT NULL COMMENT '运送最小天数',
  `shipping_days_max` int(11) NULL DEFAULT NULL COMMENT '运送最大天数',
  `msrp` decimal(10, 2) NULL DEFAULT NULL COMMENT '制造商建议零售价',
  `shipping_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_user_id_product_id`(`user_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 620411141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'wish产品采集子表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `wish_product_sku`;
CREATE TABLE `wish_product_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品ID',
  `product_sku_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品SKU的ID',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `msrp` decimal(10, 2) NULL DEFAULT NULL COMMENT '制造商建议零售价',
  `inventory` int(11) NULL DEFAULT NULL COMMENT '库存',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `color` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `size` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否在售卖',
  `upc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通用code编码',
  `tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `auto_tags` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台标签',
  `shipping_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运送时间',
  `shipping` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `message` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因',
  `match_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `main_image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku图片',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `product_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品成本',
  `pack_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '包材成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_sku_id`(`product_sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3015333808 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_size
-- ----------------------------
DROP TABLE IF EXISTS `wish_size`;
CREATE TABLE `wish_size`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size_id` bigint(20) NOT NULL,
  `size_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `has_other` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有其他值',
  `example` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '示例值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'wish尺寸表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_size_value
-- ----------------------------
DROP TABLE IF EXISTS `wish_size_value`;
CREATE TABLE `wish_size_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `MODIFIER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size_id` bigint(20) NOT NULL,
  `size_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `col` int(11) NULL DEFAULT NULL COMMENT '第几列',
  `ordering` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `size_id`(`size_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_sys_updates_noti
-- ----------------------------
DROP TABLE IF EXISTS `wish_sys_updates_noti`;
CREATE TABLE `wish_sys_updates_noti`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `noti_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `release_date` datetime(0) NULL DEFAULT NULL,
  `cn_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cn_body` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `noti_id`(`noti_id`, `auth_id`) USING BTREE,
  INDEX `auth_id`(`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1248 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_tags_search
-- ----------------------------
DROP TABLE IF EXISTS `wish_tags_search`;
CREATE TABLE `wish_tags_search`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tags_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'wish标签联想查询key',
  `tags_val` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'wish标签联想查询值',
  `count` int(11) NULL DEFAULT NULL COMMENT '查询次数',
  `gmt_last_search` datetime(0) NULL DEFAULT NULL COMMENT '最后一次查询时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tags_key`(`tags_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_ticket
-- ----------------------------
DROP TABLE IF EXISTS `wish_ticket`;
CREATE TABLE `wish_ticket`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `ticket_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state_id` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_update_date` datetime(0) NULL DEFAULT NULL,
  `last_update_date_bj` datetime(0) NULL DEFAULT NULL,
  `open_date` datetime(0) NULL DEFAULT NULL,
  `open_date_bj` datetime(0) NULL DEFAULT NULL,
  `merchant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo_proof` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sublabel` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyer_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `locale` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `joined_date` datetime(0) NULL DEFAULT NULL,
  `joined_date_bj` datetime(0) NULL DEFAULT NULL,
  `orders` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_refund_reason` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `close_date` datetime(0) NULL DEFAULT NULL,
  `close_date_bj` datetime(0) NULL DEFAULT NULL,
  `closed_by` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ticket_id`(`ticket_id`, `auth_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'wish ticket表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_ticket_reply
-- ----------------------------
DROP TABLE IF EXISTS `wish_ticket_reply`;
CREATE TABLE `wish_ticket_reply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NOT NULL,
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_modified` datetime(0) NOT NULL,
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auth_id` bigint(20) NOT NULL,
  `ticket_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sender` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `date_bj` datetime(0) NULL DEFAULT NULL,
  `message` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `translated_message` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `translated_message_zh` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_urls` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ticket_id`(`ticket_id`, `auth_id`, `date`, `sender`) USING BTREE,
  INDEX `user_id`(`user_id`, `ticket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'wish ticket回复表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wish_univiewed_noti
-- ----------------------------
DROP TABLE IF EXISTS `wish_univiewed_noti`;
CREATE TABLE `wish_univiewed_noti`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(0) NOT NULL,
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改者',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `is_mark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否已读',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `auth_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺授权ID',
  `perma_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `noti_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `noti_id`(`noti_id`, `auth_id`) USING BTREE,
  INDEX `auth_id`(`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 550815 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Procedure structure for my_procedure_update_supper_goods_code
-- ----------------------------
DROP PROCEDURE IF EXISTS `my_procedure_update_supper_goods_code`;
delimiter ;;
CREATE PROCEDURE `my_procedure_update_supper_goods_code`()
begin -- 开始存储过程  
declare my_id varchar(32); -- 自定义变量1  
declare my_name varchar(50); -- 自定义变量2
DECLARE new_code varchar(100);-- goodsCode
DECLARE done INT DEFAULT FALSE; -- 自定义控制游标循环变量,默认false  
  
DECLARE My_Cursor CURSOR FOR (SELECT goods_id FROM sm_goods_sku where super_goods_code is null and is_deleted = 'n'); -- 定义游标并输入结果集  
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; -- 绑定控制变量到游标,游标循环结束自动转true  
  
OPEN My_Cursor; -- 打开游标  
  myLoop: LOOP -- 开始循环体,myLoop为自定义循环名,结束循环时用到  
    FETCH My_Cursor into my_id; -- 将游标当前读取行的数据顺序赋予自定义变量12  
    IF done THEN -- 判断是否继续循环  
      LEAVE myLoop; -- 结束循环  
    END IF;  
    -- 自己要做的事情,在 sql 中直接使用自定义变量即可  
		if my_id >0 then
		
    select goods_code into new_code from sm_goods where id = my_id;
		if(new_code is not null) then

			update sm_goods_sku set super_goods_code = new_code ,gmt_modified = now() where IS_DELETED = 'n' and super_goods_code is null and goods_id = my_id ;

		end if;
		end if;
		COMMIT;
		

		#INSERT into s_menu_copy (parent_id,href,add_time) values (url_menu_id,url_info,now());
		#select * from s_url_menu where id = my_id;
     #COMMIT; -- 提交事务  
		 
  END LOOP myLoop; -- 结束自定义循环体  
  CLOSE My_Cursor; -- 关闭游标  
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_update_supper_goods_code
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_update_supper_goods_code`;
delimiter ;;
CREATE PROCEDURE `procedure_update_supper_goods_code`()
begin -- 开始存储过程  
declare my_id varchar(32); -- 自定义变量1  
declare my_name varchar(50); -- 自定义变量2
DECLARE new_code varchar(100);-- goodsCode
DECLARE done INT DEFAULT FALSE; -- 自定义控制游标循环变量,默认false  
  
DECLARE My_Cursor CURSOR FOR (SELECT goods_id FROM sm_goods_sku where super_goods_code is null and is_deleted = 'n'); -- 定义游标并输入结果集  
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; -- 绑定控制变量到游标,游标循环结束自动转true  
  
OPEN My_Cursor; -- 打开游标  
  myLoop: LOOP -- 开始循环体,myLoop为自定义循环名,结束循环时用到  
    FETCH My_Cursor into my_id; -- 将游标当前读取行的数据顺序赋予自定义变量12  
    IF done THEN -- 判断是否继续循环  
      LEAVE myLoop; -- 结束循环  
    END IF;  
    -- 自己要做的事情,在 sql 中直接使用自定义变量即可  
		if my_id >0 then
					select goods_code into new_code from sm_goods where id = my_id;
			if(new_code is not null) then
			update sm_goods_sku set super_goods_code = new_code ,gmt_modified = now() where IS_DELETED = 'n' and super_goods_code is null and goods_id = my_id ;
			end if;
		end if;
		COMMIT;
	 
  END LOOP myLoop; -- 结束自定义循环体  
  CLOSE My_Cursor; -- 关闭游标  
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
