/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : jsp

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 30/05/2022 08:46:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uID` int NOT NULL COMMENT '用户id\r\n',
  `mID` int NULL DEFAULT NULL COMMENT '带表回复的消息ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `ptime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uID`(`uID`) USING BTREE,
  INDEX `mID`(`mID`) USING BTREE,
  CONSTRAINT `uID` FOREIGN KEY (`uID`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1266 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (3, 21, 6, '我回复的“我回复的FC”', '2022-05-26 12:04:00');
INSERT INTO `message` VALUES (6, 1, NULL, '啊大苏打实打实的啊大大', '2022-05-28 08:51:51');
INSERT INTO `message` VALUES (7, 1, NULL, '1231231311111111', '2022-05-28 08:52:06');
INSERT INTO `message` VALUES (8, 1, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (9, 1, NULL, '123123123', '2022-05-28 08:51:51');
INSERT INTO `message` VALUES (10, 1, NULL, '1231231311111111', '2022-05-28 08:52:06');
INSERT INTO `message` VALUES (11, 1, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (14, 1, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (15, 1, NULL, '123123123', '2022-05-28 08:51:51');
INSERT INTO `message` VALUES (16, 1, NULL, '1231231311111111', '2022-05-28 08:52:06');
INSERT INTO `message` VALUES (17, 1, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (18, 1, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (19, 1, NULL, '123123123', '2022-05-28 08:51:51');
INSERT INTO `message` VALUES (20, 1, NULL, '1231231311111111', '2022-05-28 08:52:06');
INSERT INTO `message` VALUES (21, 1, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (22, 1, NULL, '123123123', '2022-05-28 08:51:51');
INSERT INTO `message` VALUES (23, 1, NULL, '1231231311111111', '2022-05-28 08:52:06');
INSERT INTO `message` VALUES (25, 1, NULL, '123123123', '2022-05-28 08:51:51');
INSERT INTO `message` VALUES (26, 1, NULL, '1231231311111111', '2022-05-28 08:52:06');
INSERT INTO `message` VALUES (28, 17, NULL, '123123123', '2022-05-28 08:51:51');
INSERT INTO `message` VALUES (29, 17, NULL, '1231231311111111', '2022-05-28 08:52:06');
INSERT INTO `message` VALUES (30, 21, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (31, 19, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (32, 20, NULL, '123123123', '2022-05-28 08:51:51');
INSERT INTO `message` VALUES (33, 13, NULL, '1231231311111111', '2022-05-28 08:52:06');
INSERT INTO `message` VALUES (34, 21, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (37, 1, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (42, 1, NULL, '测试', '2022-05-28 08:52:20');
INSERT INTO `message` VALUES (43, 1, NULL, '123123123', '2022-05-28 08:51:51');
INSERT INTO `message` VALUES (46, 2, NULL, '1231231231231312312311111111111111111111111111113333333333333333333333333333377777777777777777777777777777777777777', '2022-05-14 09:25:48');
INSERT INTO `message` VALUES (1236, 1, NULL, 'dsadadasdasdasdsd', '2022-05-28 10:52:23');
INSERT INTO `message` VALUES (1237, 1, NULL, 'dsadadasdasdasdsd', '2022-05-28 10:53:07');
INSERT INTO `message` VALUES (1239, 1, NULL, '111', '2022-05-28 10:54:37');
INSERT INTO `message` VALUES (1240, 1, 10, '222', '2022-05-28 10:55:37');
INSERT INTO `message` VALUES (1242, 1, NULL, '哈喽，。我是哈哈哈哈', '2022-05-28 11:02:41');
INSERT INTO `message` VALUES (1243, 1, NULL, '哈喽， 我是大厦是的\r\n\r\nsdasd阿松大\r\n\r\n\r\n\r\n阿萨大大撒旦\r\n\r\n\r\n\r\n\r\nasdsa\r\n\r\n\r\n测试多行是否可以 成功', '2022-05-28 11:03:23');
INSERT INTO `message` VALUES (1244, 1, NULL, '大大撒旦\r\nsdadasdad\r\n\r\n\r\nasdasda\r\n\r\n\r\n\r\n\r\nasdasdasd\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nasdada\r\n测试多行', '2022-05-28 11:04:36');
INSERT INTO `message` VALUES (1246, 1, NULL, '21312123\r\n啊实打实的\r\nadasdasd\r\n\r\n\r\nasdasd\r\n\r\n测试多行', '2022-05-28 11:09:14');
INSERT INTO `message` VALUES (1248, 1, NULL, '大苏打撒旦\r\n\r\n\r\n\r\n\r\n啊实打实的\r\n\r\n\r\n\r\n成！！！！！！！！！', '2022-05-28 11:14:07');
INSERT INTO `message` VALUES (1249, 1, NULL, '啊实打实的\r\n\r\n\r\n阿德飒飒\r\n\r\n\r\n111111111\r\n换行！！！！！！！！', '2022-05-28 11:15:20');
INSERT INTO `message` VALUES (1250, 1, NULL, '    啊实打实的\r\n\r\n\r\n\r\n\r\n\r\n\r\n 阿德飒飒 111111111 \r\n\r\n\r\n\r\n\r\n\r\n换行！！！！！！！！', '2022-05-28 11:17:08');
INSERT INTO `message` VALUES (1251, 1, NULL, '啊实打实大苏打2\r\n\r\n\r\n\r\n3212\r\n3123\r\n\r\n\r\n\r\n\r\n\r\n😒', '2022-05-28 11:25:14');
INSERT INTO `message` VALUES (1252, 1, NULL, '啊大苏打的\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n1111', '2022-05-28 11:33:15');
INSERT INTO `message` VALUES (1253, 1, NULL, '123123123\r\n\r\n\r\n\r\n\r\n12312312313', '2022-05-28 11:35:09');
INSERT INTO `message` VALUES (1254, 1, NULL, '12312313123', '2022-05-28 11:37:49');
INSERT INTO `message` VALUES (1255, 1, NULL, '3424', '2022-05-28 11:38:18');
INSERT INTO `message` VALUES (1256, 1, NULL, '我打算大苏打', '2022-05-28 11:38:22');
INSERT INTO `message` VALUES (1259, 47, NULL, '12312312312\r\n\r\n\r\n\r\n\r\n哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈23', '2022-05-28 11:49:16');
INSERT INTO `message` VALUES (1261, 45, NULL, '123', '2022-05-29 13:21:51');
INSERT INTO `message` VALUES (1262, 45, 1259, '111111111111111111111111111\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n1111111111111111111111', '2022-05-29 13:26:54');
INSERT INTO `message` VALUES (1263, 45, 1259, '111111111111111111111111111111111', '2022-05-29 13:27:14');
INSERT INTO `message` VALUES (1265, 45, 1264, '123123123', '2022-05-29 13:30:13');
INSERT INTO `message` VALUES (1267, 1, 1265, 'w wq q q ', '2022-05-29 15:58:59');
INSERT INTO `message` VALUES (1268, 45, 1251, '12312 v', '2022-05-29 16:00:13');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ptime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '注意！！', '这只是一条测试，，，，，1hou后面还有内容111111111111111111222222222222222233333333333333333333333333333333333333333322555555555555555555555555550000000000000000000000000099999999999999999999999<br><br>                              WK-2022-5-25', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (2, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (3, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (4, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (5, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (6, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (7, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (8, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (9, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (10, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (11, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (12, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (13, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (14, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (15, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (16, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (17, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (18, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (19, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (20, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (21, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (22, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');
INSERT INTO `notice` VALUES (23, '注意！！', '这只是一条测试，，，，，', '2022-05-25 16:33:42');
INSERT INTO `notice` VALUES (24, '致本系统的使用者们', '欢迎来玩 kang17.xyz', '2022-05-25 16:33:46');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '交易ID',
  `userID` int NOT NULL COMMENT '用户ID',
  `productID` int NOT NULL COMMENT '产品ID',
  `num` int NOT NULL DEFAULT 0 COMMENT '数量',
  `totalPrice` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总价',
  `tradeTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易日期',
  `status` int NOT NULL DEFAULT 0 COMMENT '0 未支付 1支付成功',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID1`(`userID`) USING BTREE,
  INDEX `proID`(`productID`) USING BTREE,
  CONSTRAINT `proID` FOREIGN KEY (`productID`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userID1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 1, 1, 1, 10.12, '2022-05-29 16:52:04', 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扇名',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `pro_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价',
  `inventory` int NOT NULL COMMENT '库存',
  `sales` int NOT NULL COMMENT '销售数量',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类别',
  `fan_material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扇面材质',
  `fan_bone_material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扇骨材质',
  `fan_bone_num` int NOT NULL COMMENT '扇骨数量',
  `fan_bone_length` int NOT NULL COMMENT '扇骨长度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '油漆边双色龙骨扇_粉色', 40.00, 1.00, 14, 1233, '1.jpg', '日式女扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (2, '油漆边双色龙骨扇_红色', 50.00, 2.00, 95, 1230, '2.jpg', '日式女扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (3, '油漆边双色龙骨扇_蓝色', 40.00, 3.00, 91, 1, '3.jpg', '仿古男扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (4, '油漆边双色龙骨扇_紫色', 40.00, 999.00, 81, 2, '4.jpg', '仿古男扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (5, '短梢手绘折扇_梅花', 60.00, 998.00, 71, 29, '5.jpg', '仿古男扇', '绢', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (6, '短梢手绘折扇_桃花', 80.00, 20.00, 50, 50, '6.jpg', '日式女扇', '绢', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (7, '7', 40.00, 18.00, 14, 86, '7.jpg', '日式女扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (8, '8', 40.00, 18.00, 14, 86, '8.jpg', '日式女扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (9, '9', 50.00, 18.00, 95, 5, '9.jpg', '日式女扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (10, '10', 40.00, 17.00, 91, 9, '10.jpg', '仿古男扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (11, '11', 40.00, 16.00, 81, 19, '11.jpg', '仿古男扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (12, '12', 60.00, 18.00, 71, 29, '12.jpg', '仿古男扇', '绢', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (13, '13', 80.00, 20.00, 50, 50, '13.jpg', '日式女扇', '绢', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (14, '14', 40.00, 18.00, 14, 86, '14.jpg', '日式女扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (15, '15', 40.00, 18.00, 14, 86, '15.jpg', '韩国扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (16, '16', 50.00, 18.00, 95, 5, '16.jpg', '韩国扇', '丝绸', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (17, '17', 40.00, 17.00, 91, 9, '17.jpg', '仿古男扇', '丝绸', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (18, '18', 40.00, 16.00, 81, 19, '18.jpg', '仿古男扇', '丝绸', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (19, '19', 60.00, 18.00, 71, 29, '19.jpg', '仿古男扇', '丝绸', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (20, '20', 80.00, 20.00, 50, 50, '20.jpg', '仿古男扇', '丝绸', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (21, '21', 40.00, 18.00, 14, 86, '21.jpg', '韩国扇', '丝绸', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (22, '22', 40.00, 18.00, 14, 86, '22.jpg', '韩国扇', '丝绸', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (23, '23', 50.00, 18.00, 95, 5, '23.jpg', '韩国扇', '丝绸', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (24, '24', 40.00, 17.00, 91, 9, '24.jpg', '韩国扇', '丝绸', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (25, '25', 40.00, 16.00, 81, 19, '25.jpg', '韩国扇', '丝绸', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (26, '26', 60.00, 18.00, 71, 29, '26.jpg', '檀香扇', '丝绸', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (27, '27', 80.00, 20.00, 50, 50, '27.jpg', '韩国扇', '丝绸', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (28, '28', 40.00, 18.00, 14, 86, '28.jpg', '韩国扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (29, '29', 40.00, 18.00, 14, 86, '29.jpg', '檀香扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (30, '30', 50.00, 18.00, 95, 5, '30.jpg', '檀香扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (31, '31', 40.00, 17.00, 91, 9, '31.jpg', '檀香扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (32, '32', 40.00, 16.00, 81, 19, '32.jpg', '檀香扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (33, '33', 60.00, 18.00, 71, 29, '33.jpg', '檀香扇', '绢', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (34, '34', 80.00, 20.00, 50, 50, '34.jpg', '礼品广告扇', '绢', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (35, '35', 50.00, 18.00, 95, 5, '35.jpg', '礼品广告扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (36, '36', 40.00, 17.00, 91, 9, '36.jpg', '礼品广告扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (37, '37', 40.00, 16.00, 81, 19, '37.jpg', '礼品广告扇', '绢', '头青加厚', 8, 20);
INSERT INTO `product` VALUES (38, '38', 60.00, 18.00, 71, 29, '38.jpg', '礼品广告扇', '绢', '头青加厚', 12, 22);
INSERT INTO `product` VALUES (39, '39', 80.00, 20.00, 50, 50, '39.jpg', '礼品广告扇', '绢', '头青加厚', 12, 22);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `userID` int NOT NULL COMMENT '用户ID',
  `productID` int NOT NULL COMMENT '产品ID',
  `num` int NOT NULL COMMENT '数量',
  PRIMARY KEY (`userID`, `productID`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  CONSTRAINT `productID` FOREIGN KEY (`productID`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES (1, 2, 1);
INSERT INTO `shoppingcart` VALUES (1, 14, 1);
INSERT INTO `shoppingcart` VALUES (19, 2, 1);
INSERT INTO `shoppingcart` VALUES (44, 1, 225);
INSERT INTO `shoppingcart` VALUES (44, 2, 1);
INSERT INTO `shoppingcart` VALUES (44, 3, 112);
INSERT INTO `shoppingcart` VALUES (44, 28, 112);
INSERT INTO `shoppingcart` VALUES (45, 4, 1);
INSERT INTO `shoppingcart` VALUES (45, 6, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `passwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `hobby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '爱好',
  `online` int NOT NULL DEFAULT 0 COMMENT '0下线 1在线',
  `balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `headpic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', '男', '爬山,钓鱼', 1, 10000.00, '');
INSERT INTO `user` VALUES (2, 'wk', '654321', '男', '爬山,钓鱼', 0, 10000.00, NULL);
INSERT INTO `user` VALUES (13, '12', '12', '男', '爬山,钓鱼', 0, 10000.00, NULL);
INSERT INTO `user` VALUES (15, '1212', '121212', '男', '爬山,钓鱼', 1, 10000.00, NULL);
INSERT INTO `user` VALUES (17, '1231231', '123123', '女', '爬山,钓鱼', 1, 10000.00, NULL);
INSERT INTO `user` VALUES (18, '11111', '123123', '男', '钓鱼', 0, 10000.00, NULL);
INSERT INTO `user` VALUES (19, '121212', '121212', '男', '爬山', 0, 1230.00, NULL);
INSERT INTO `user` VALUES (20, '123123', '123123', '男', '爬山', 1, 0.00, NULL);
INSERT INTO `user` VALUES (21, '王康', '123123', '女', '爬山,钓鱼', 1, 0.00, NULL);
INSERT INTO `user` VALUES (22, '啊哈哈哈', '123', '男', '爬山,钓鱼', 0, 0.00, NULL);
INSERT INTO `user` VALUES (42, '12aaa', '12', '男', '爬山,钓鱼', 1, 0.00, NULL);
INSERT INTO `user` VALUES (43, 'aaa', 'aaa', '男', '爬山', 0, 0.00, NULL);
INSERT INTO `user` VALUES (44, '王庆康', '123', '男', '爬山', 1, 0.00, NULL);
INSERT INTO `user` VALUES (45, '1', '1', '男', '爬山', 1, 0.00, NULL);
INSERT INTO `user` VALUES (46, 'wang某人', '1', '男', '爬山', 1, 0.00, NULL);
INSERT INTO `user` VALUES (47, '123', '123', '男', '爬山,钓鱼', 1, 0.00, NULL);
INSERT INTO `user` VALUES (48, '123', '123', '男', '爬山', 0, 0.00, NULL);
INSERT INTO `user` VALUES (49, 'wangkang', '123', '男', '爬山', 0, 0.00, NULL);
INSERT INTO `user` VALUES (50, '123', '123', '男', '爬山', 0, 0.00, NULL);

SET FOREIGN_KEY_CHECKS = 1;
