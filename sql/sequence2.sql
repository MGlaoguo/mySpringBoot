/*
 Navicat Premium Data Transfer

 Source Server         : 121.43.153.227
 Source Server Type    : MySQL
 Source Server Version : 50625
 Source Host           : 121.43.153.227:3306
 Source Schema         : sequence2

 Target Server Type    : MySQL
 Target Server Version : 50625
 File Encoding         : 65001

 Date: 30/08/2018 17:57:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sequence_ae_faq
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_faq`;
CREATE TABLE `sequence_ae_faq`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_faq_content
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_faq_content`;
CREATE TABLE `sequence_ae_faq_content`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_faq_welcome
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_faq_welcome`;
CREATE TABLE `sequence_ae_faq_welcome`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_issue
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_issue`;
CREATE TABLE `sequence_ae_issue`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_order_extension
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_order_extension`;
CREATE TABLE `sequence_ae_order_extension`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_product`;
CREATE TABLE `sequence_ae_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_product_autotask
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_product_autotask`;
CREATE TABLE `sequence_ae_product_autotask`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_product_autotask_result
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_product_autotask_result`;
CREATE TABLE `sequence_ae_product_autotask_result`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_product_sku`;
CREATE TABLE `sequence_ae_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_promotion`;
CREATE TABLE `sequence_ae_promotion`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ae_promotion_product_rela
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ae_promotion_product_rela`;
CREATE TABLE `sequence_ae_promotion_product_rela`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ali1688_gather_data_claim
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ali1688_gather_data_claim`;
CREATE TABLE `sequence_ali1688_gather_data_claim`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ali1688_invoice
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ali1688_invoice`;
CREATE TABLE `sequence_ali1688_invoice`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ali1688_localgood_good_relation
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ali1688_localgood_good_relation`;
CREATE TABLE `sequence_ali1688_localgood_good_relation`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ali1688_order
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ali1688_order`;
CREATE TABLE `sequence_ali1688_order`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ali1688_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ali1688_order_goods`;
CREATE TABLE `sequence_ali1688_order_goods`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ali1688_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ali1688_product`;
CREATE TABLE `sequence_ali1688_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ali1688_product_goods
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ali1688_product_goods`;
CREATE TABLE `sequence_ali1688_product_goods`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ali1688_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ali1688_receive_address`;
CREATE TABLE `sequence_ali1688_receive_address`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ali1688_supplier
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ali1688_supplier`;
CREATE TABLE `sequence_ali1688_supplier`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_allot_goods_relation
-- ----------------------------
DROP TABLE IF EXISTS `sequence_allot_goods_relation`;
CREATE TABLE `sequence_allot_goods_relation`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_allot_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sequence_allot_logistics`;
CREATE TABLE `sequence_allot_logistics`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_allot_order
-- ----------------------------
DROP TABLE IF EXISTS `sequence_allot_order`;
CREATE TABLE `sequence_allot_order`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_amazon_inventory_supply
-- ----------------------------
DROP TABLE IF EXISTS `sequence_amazon_inventory_supply`;
CREATE TABLE `sequence_amazon_inventory_supply`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_amazon_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_amazon_product`;
CREATE TABLE `sequence_amazon_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_amazon_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_amazon_product_sku`;
CREATE TABLE `sequence_amazon_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_cd_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_cd_product`;
CREATE TABLE `sequence_cd_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_cd_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_cd_product_sku`;
CREATE TABLE `sequence_cd_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_dh_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_dh_product`;
CREATE TABLE `sequence_dh_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_dh_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_dh_product_gather`;
CREATE TABLE `sequence_dh_product_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_dh_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_dh_product_sku`;
CREATE TABLE `sequence_dh_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_dh_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_dh_product_sku_gather`;
CREATE TABLE `sequence_dh_product_sku_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_dispute
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_dispute`;
CREATE TABLE `sequence_ebay_dispute`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_dispute_messages
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_dispute_messages`;
CREATE TABLE `sequence_ebay_dispute_messages`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_dispute_resolutions
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_dispute_resolutions`;
CREATE TABLE `sequence_ebay_dispute_resolutions`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_feedback
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_feedback`;
CREATE TABLE `sequence_ebay_feedback`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_feedback_result_record
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_feedback_result_record`;
CREATE TABLE `sequence_ebay_feedback_result_record`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_my_message
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_my_message`;
CREATE TABLE `sequence_ebay_my_message`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_product`;
CREATE TABLE `sequence_ebay_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_product_autotask
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_product_autotask`;
CREATE TABLE `sequence_ebay_product_autotask`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_product_autotask_result
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_product_autotask_result`;
CREATE TABLE `sequence_ebay_product_autotask_result`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_product_gather`;
CREATE TABLE `sequence_ebay_product_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_product_sku`;
CREATE TABLE `sequence_ebay_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_ebay_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_ebay_product_sku_gather`;
CREATE TABLE `sequence_ebay_product_sku_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_finance_payment
-- ----------------------------
DROP TABLE IF EXISTS `sequence_finance_payment`;
CREATE TABLE `sequence_finance_payment`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_finance_payment_relation
-- ----------------------------
DROP TABLE IF EXISTS `sequence_finance_payment_relation`;
CREATE TABLE `sequence_finance_payment_relation`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_goods_arrival
-- ----------------------------
DROP TABLE IF EXISTS `sequence_goods_arrival`;
CREATE TABLE `sequence_goods_arrival`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_goods_arrival_log
-- ----------------------------
DROP TABLE IF EXISTS `sequence_goods_arrival_log`;
CREATE TABLE `sequence_goods_arrival_log`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_goods_sku_supply_chain_sku_relation
-- ----------------------------
DROP TABLE IF EXISTS `sequence_goods_sku_supply_chain_sku_relation`;
CREATE TABLE `sequence_goods_sku_supply_chain_sku_relation`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_joom_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_joom_product`;
CREATE TABLE `sequence_joom_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_joom_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_joom_product_gather`;
CREATE TABLE `sequence_joom_product_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_joom_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_joom_product_sku`;
CREATE TABLE `sequence_joom_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_joom_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_joom_product_sku_gather`;
CREATE TABLE `sequence_joom_product_sku_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_kikuu_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_kikuu_product`;
CREATE TABLE `sequence_kikuu_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_kikuu_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_kikuu_product_gather`;
CREATE TABLE `sequence_kikuu_product_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_kikuu_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_kikuu_product_sku`;
CREATE TABLE `sequence_kikuu_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_kikuu_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_kikuu_product_sku_gather`;
CREATE TABLE `sequence_kikuu_product_sku_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_lazada_feed
-- ----------------------------
DROP TABLE IF EXISTS `sequence_lazada_feed`;
CREATE TABLE `sequence_lazada_feed`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_lazada_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_lazada_product`;
CREATE TABLE `sequence_lazada_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_lazada_product_gather_new
-- ----------------------------
DROP TABLE IF EXISTS `sequence_lazada_product_gather_new`;
CREATE TABLE `sequence_lazada_product_gather_new`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_lazada_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_lazada_product_sku`;
CREATE TABLE `sequence_lazada_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_lazada_product_sku_gather_new
-- ----------------------------
DROP TABLE IF EXISTS `sequence_lazada_product_sku_gather_new`;
CREATE TABLE `sequence_lazada_product_sku_gather_new`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
-- Table structure for sequence_order_rule_sync_log
-- ----------------------------
DROP TABLE IF EXISTS `sequence_order_rule_sync_log`;
CREATE TABLE `sequence_order_rule_sync_log`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_product_label
-- ----------------------------
DROP TABLE IF EXISTS `sequence_product_label`;
CREATE TABLE `sequence_product_label`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_purchase_advice
-- ----------------------------
DROP TABLE IF EXISTS `sequence_purchase_advice`;
CREATE TABLE `sequence_purchase_advice`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_purchase_goods_relation
-- ----------------------------
DROP TABLE IF EXISTS `sequence_purchase_goods_relation`;
CREATE TABLE `sequence_purchase_goods_relation`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_purchase_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sequence_purchase_logistics`;
CREATE TABLE `sequence_purchase_logistics`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `sequence_purchase_order`;
CREATE TABLE `sequence_purchase_order`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_purchase_plan
-- ----------------------------
DROP TABLE IF EXISTS `sequence_purchase_plan`;
CREATE TABLE `sequence_purchase_plan`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_shopee_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_shopee_product`;
CREATE TABLE `sequence_shopee_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_shopee_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_shopee_product_gather`;
CREATE TABLE `sequence_shopee_product_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_shopee_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_shopee_product_sku`;
CREATE TABLE `sequence_shopee_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_shopee_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_shopee_product_sku_gather`;
CREATE TABLE `sequence_shopee_product_sku_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_shopify_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_shopify_product`;
CREATE TABLE `sequence_shopify_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_shopify_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_shopify_product_gather`;
CREATE TABLE `sequence_shopify_product_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_shopify_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_shopify_product_sku`;
CREATE TABLE `sequence_shopify_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_shopify_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_shopify_product_sku_gather`;
CREATE TABLE `sequence_shopify_product_sku_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_buyer
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_buyer`;
CREATE TABLE `sequence_sm_buyer`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_freight_template
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_freight_template`;
CREATE TABLE `sequence_sm_freight_template`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_freight_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_freight_template_detail`;
CREATE TABLE `sequence_sm_freight_template_detail`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_gather_data
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_gather_data`;
CREATE TABLE `sequence_sm_gather_data`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_gather_data_claim
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_gather_data_claim`;
CREATE TABLE `sequence_sm_gather_data_claim`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_goods
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_goods`;
CREATE TABLE `sequence_sm_goods`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_goods_sku`;
CREATE TABLE `sequence_sm_goods_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_goods_sku_combine
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_goods_sku_combine`;
CREATE TABLE `sequence_sm_goods_sku_combine`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_goods_sku_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_goods_sku_product`;
CREATE TABLE `sequence_sm_goods_sku_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_goods_sku_relation
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_goods_sku_relation`;
CREATE TABLE `sequence_sm_goods_sku_relation`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_goods_sku_supplier
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_goods_sku_supplier`;
CREATE TABLE `sequence_sm_goods_sku_supplier`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_label
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_label`;
CREATE TABLE `sequence_sm_label`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_logistics`;
CREATE TABLE `sequence_sm_logistics`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_logistics_tracking
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_logistics_tracking`;
CREATE TABLE `sequence_sm_logistics_tracking`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_message_log
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_message_log`;
CREATE TABLE `sequence_sm_message_log`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_msg
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_msg`;
CREATE TABLE `sequence_sm_msg`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_order
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_order`;
CREATE TABLE `sequence_sm_order`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_order_item
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_order_item`;
CREATE TABLE `sequence_sm_order_item`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_order_label
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_order_label`;
CREATE TABLE `sequence_sm_order_label`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_order_logistics`;
CREATE TABLE `sequence_sm_order_logistics`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_order_logistics_label
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_order_logistics_label`;
CREATE TABLE `sequence_sm_order_logistics_label`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_order_message
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_order_message`;
CREATE TABLE `sequence_sm_order_message`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_package_item
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_package_item`;
CREATE TABLE `sequence_sm_package_item`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_product_gather`;
CREATE TABLE `sequence_sm_product_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_product_sku_gather`;
CREATE TABLE `sequence_sm_product_sku_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_quick_menu
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_quick_menu`;
CREATE TABLE `sequence_sm_quick_menu`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_shipment
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_shipment`;
CREATE TABLE `sequence_sm_shipment`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_supplier`;
CREATE TABLE `sequence_sm_supplier`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_sm_upload_forecast
-- ----------------------------
DROP TABLE IF EXISTS `sequence_sm_upload_forecast`;
CREATE TABLE `sequence_sm_upload_forecast`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_stock
-- ----------------------------
DROP TABLE IF EXISTS `sequence_stock`;
CREATE TABLE `sequence_stock`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_stock_check
-- ----------------------------
DROP TABLE IF EXISTS `sequence_stock_check`;
CREATE TABLE `sequence_stock_check`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_stock_check_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_stock_check_sku`;
CREATE TABLE `sequence_stock_check_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_stock_log
-- ----------------------------
DROP TABLE IF EXISTS `sequence_stock_log`;
CREATE TABLE `sequence_stock_log`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_stock_position
-- ----------------------------
DROP TABLE IF EXISTS `sequence_stock_position`;
CREATE TABLE `sequence_stock_position`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_test
-- ----------------------------
DROP TABLE IF EXISTS `sequence_test`;
CREATE TABLE `sequence_test`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_tophatter_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_tophatter_product`;
CREATE TABLE `sequence_tophatter_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_tophatter_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_tophatter_product_gather`;
CREATE TABLE `sequence_tophatter_product_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_tophatter_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_tophatter_product_sku`;
CREATE TABLE `sequence_tophatter_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_tophatter_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_tophatter_product_sku_gather`;
CREATE TABLE `sequence_tophatter_product_sku_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_user
-- ----------------------------
DROP TABLE IF EXISTS `sequence_user`;
CREATE TABLE `sequence_user`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wanyitong_oms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wanyitong_oms_inventory`;
CREATE TABLE `sequence_wanyitong_oms_inventory`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `sequence_warehouse`;
CREATE TABLE `sequence_warehouse`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_warehouse_position
-- ----------------------------
DROP TABLE IF EXISTS `sequence_warehouse_position`;
CREATE TABLE `sequence_warehouse_position`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_warehouse_shelf
-- ----------------------------
DROP TABLE IF EXISTS `sequence_warehouse_shelf`;
CREATE TABLE `sequence_warehouse_shelf`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_order_fine
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_order_fine`;
CREATE TABLE `sequence_wish_order_fine`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_product
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_product`;
CREATE TABLE `sequence_wish_product`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_product_boost_campaign
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_product_boost_campaign`;
CREATE TABLE `sequence_wish_product_boost_campaign`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_product_boost_campaign_item
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_product_boost_campaign_item`;
CREATE TABLE `sequence_wish_product_boost_campaign_item`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_product_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_product_gather`;
CREATE TABLE `sequence_wish_product_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_product_inventory
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_product_inventory`;
CREATE TABLE `sequence_wish_product_inventory`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_product_inventory_relation
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_product_inventory_relation`;
CREATE TABLE `sequence_wish_product_inventory_relation`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_product_sku`;
CREATE TABLE `sequence_wish_product_sku`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_product_sku_gather
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_product_sku_gather`;
CREATE TABLE `sequence_wish_product_sku_gather`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_ticket
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_ticket`;
CREATE TABLE `sequence_wish_ticket`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_ticket_reply
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_ticket_reply`;
CREATE TABLE `sequence_wish_ticket_reply`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sequence_wish_univiewed_noti
-- ----------------------------
DROP TABLE IF EXISTS `sequence_wish_univiewed_noti`;
CREATE TABLE `sequence_wish_univiewed_noti`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `gmt_create` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
