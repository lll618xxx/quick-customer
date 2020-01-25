/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : skyx

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 05/09/2019 17:11:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for skyx_goods
-- ----------------------------
DROP TABLE IF EXISTS `skyx_goods`;
CREATE TABLE `skyx_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名字',
  `category` int(2) NULL DEFAULT NULL COMMENT '商品分类\r\n1-水果/2-蔬菜/3-肉禽\r\n4-水产/5-饮料/6-速食',
  `shopDesc` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `marketPrice` float(10, 2) NULL DEFAULT NULL COMMENT '市场售价',
  `discountPrice` float(10, 2) NULL DEFAULT NULL COMMENT '折扣售价',
  `newComerPrice` float(10, 2) NULL DEFAULT NULL COMMENT '新人售价',
  `saleNum` int(10) NULL DEFAULT NULL COMMENT '商品销量',
  `stock` int(10) NULL DEFAULT NULL COMMENT '商品库存',
  `salesUnit` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售单位',
  `praiseNumber` int(10) NULL DEFAULT NULL COMMENT '好评数量',
  `recommend` int(10) NULL DEFAULT NULL COMMENT '推荐度',
  `coverImage` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skyx_goods
-- ----------------------------
INSERT INTO `skyx_goods` VALUES (1, '美国精选车厘子250g', 1, '源自美国的第一份鲜甜', 49.80, 22.80, 6.80, 200, 40000, '盒', 50, 22, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3395965604,1340755229&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (3, '清远新鲜走地鸡蛋20枚/盒', 3, '清远正宗走地鸡', 28.80, 18.80, 3.80, 18647, 68497, '盒', 204, 45, 'https://ss0.baidu.com/73x1bjeh1BF3odCf/it/u=146315278,1931295774&fm=85&s=5D3E4ADA180340D886A7A26F0300207F');
INSERT INTO `skyx_goods` VALUES (6, '牛顿小苹果', 1, '什么东西砸下来了', 15.80, 10.80, 3.20, 250, 7000, '斤', 140, 25, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3143165141,3437773624&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (7, '香喷喷的梨子', 1, '吃起来真甘甜', 13.80, 8.90, 2.80, 140, 6000, '斤', 80, 85, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2688814238,401046235&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (8, '进口南非橙子', 1, '好甜好甜呀', 14.80, 11.80, 2.80, 269, 5600, '斤', 80, 47, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3493246298,1826986226&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (9, '大理石榴', 1, '咦，这是什么味道', 8.80, 6.90, 1.90, 184, 4810, '斤', 45, 78, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1690969466,1278737485&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (10, '超甜的哈密瓜', 1, '甜到我的内心啦', 17.80, 13.80, 4.80, 471, 2400, '斤', 41, 78, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=405222249,1801504296&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (11, '黑美人西瓜', 1, '这味道哪里见过', 4.80, 2.80, 0.70, 481, 558, '斤', 35, 42, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1072146372,3481022281&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (12, '白心火龙果', 1, '确认过眼神', 14.80, 11.40, 2.10, 591, 7800, '斤', 41, 147, 'https://f10.baidu.com/it/u=2382875610,3593126146&fm=72');
INSERT INTO `skyx_goods` VALUES (13, '国产香蕉', 1, '好黄好长的香蕉', 6.80, 4.80, 1.70, 584, 517, '斤', 24, 584, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4108634734,1686134083&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (14, '特级泰国榴莲', 1, '好香的味道呀', 45.80, 37.40, 8.10, 45, 547, '斤', 41, 147, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1163193126,3996546488&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (15, '泰国顶级山竹', 1, '这是小时候的味道', 14.80, 4.70, 1.50, 54, 687, '斤', 47, 17, 'https://f12.baidu.com/it/u=273180528,241798026&fm=72');
INSERT INTO `skyx_goods` VALUES (16, '西兰花', 2, '好香的西兰花', 8.80, 4.80, 1.80, 54, 517, '斤', 45, 489, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4184003482,2433148932&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (17, '新鲜南瓜', 2, '好香的南瓜', 11.80, 6.70, 1.30, 548, 548, '斤', 54, 571, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2498435793,3208740140&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (18, '蒜头', 2, '好香的蒜头', 4.80, 3.80, 1.20, 42, 541, '斤', 14, 571, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4031722867,473177848&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (19, '土豆', 2, '好香的土豆', 5.80, 4.70, 1.10, 54, 541, '斤', 54, 578, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2332062021,2625535146&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (20, '冷冻鸡腿', 3, '这是我喜欢的肉食', 9.80, 7.80, 2.20, 54, 514, '斤', 571, 156, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3376169704,1532851042&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (21, '儿童牛排', 3, '这是我喜欢的肉食', 10.80, 8.70, 1.40, 50, 541, '斤', 154, 378, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3821423012,3268948930&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (22, '新鲜鸭肉', 3, '这是我喜欢的肉食', 9.80, 7.50, 2.10, 42, 451, '斤', 575, 155, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2772871175,3640128876&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (23, '冷冻鸡爪', 3, '这是我喜欢的肉食', 11.80, 8.80, 2.30, 45, 525, '斤', 174, 345, 'https://f10.baidu.com/it/u=820090892,2731729216&fm=72');
INSERT INTO `skyx_goods` VALUES (24, '无沙花甲', 4, '这是我喜欢的海鲜', 7.80, 6.50, 2.10, 32, 258, '斤', 42, 548, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3464824729,1931136581&fm=15&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (25, '急冻生蚝', 4, '这是我喜欢的肉食', 10.80, 7.80, 1.80, 45, 52, '斤', 185, 458, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1795519257,3077383863&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (26, '大闸蟹', 4, '这是我喜欢的海鲜', 13.80, 8.50, 3.10, 31, 241, '斤', 28, 558, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3845239576,3956243681&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (27, '冰鲜大黄鱼', 4, '这是我喜欢的肉食', 25.80, 15.80, 4.80, 84, 584, '斤', 24, 687, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1272720547,2307743309&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (28, '你要的可乐 1L', 5, '挺好喝的呀，快来尝尝', 10.80, 8.20, 2.10, 25, 45, '瓶', 48, 457, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3170823253,1510253617&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (29, '新鲜美年达 1L', 5, '挺好喝的呀，快来尝尝', 8.80, 7.80, 2.80, 25, 544, '瓶', 21, 457, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3418335242,645934848&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (30, '你我的怡宝 555 mL', 5, '挺好喝的呀，快来尝尝', 4.80, 3.20, 1.10, 54, 14, '瓶', 14, 48, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1406567481,651660891&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (31, '珠江啤酒 555mL', 5, '挺好喝的呀，快来尝尝', 9.80, 6.40, 1.50, 45, 456, '瓶', 421, 247, 'https://f11.baidu.com/it/u=3543147830,704933717&fm=72');
INSERT INTO `skyx_goods` VALUES (32, '东北水饺', 6, '未雨绸缪，我能做到', 10.80, 7.20, 2.10, 541, 145, '袋', 145, 418, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2242613409,1909404000&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (33, '新品豆沙包', 6, '未雨绸缪，我能做到', 10.80, 8.40, 1.70, 58, 445, '袋', 121, 547, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3894170747,806551878&fm=15&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (34, '桂花糕', 6, '未雨绸缪，我能做到', 12.70, 6.20, 2.10, 511, 185, '袋', 455, 480, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3914902503,3574854459&fm=26&gp=0.jpg');
INSERT INTO `skyx_goods` VALUES (35, '葱香手抓饼', 6, '未雨绸缪，我能做到', 13.50, 6.90, 1.20, 245, 145, '袋', 51, 684, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3199372921,2580690926&fm=26&gp=0.jpg');

-- ----------------------------
-- Table structure for skyx_users
-- ----------------------------
DROP TABLE IF EXISTS `skyx_users`;
CREATE TABLE `skyx_users`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userAccount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账户',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电子邮箱',
  `createTime` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户创建账号的时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skyx_users
-- ----------------------------
INSERT INTO `skyx_users` VALUES (1, 'nihao', '80499104d7c21bd832cf3638c8f97913', NULL, NULL, '1567568852082');
INSERT INTO `skyx_users` VALUES (2, 'nihao', '80499104d7c21bd832cf3638c8f97913', NULL, NULL, '1567575388051');
INSERT INTO `skyx_users` VALUES (3, 'nihao1', '80499104d7c21bd832cf3638c8f97913', NULL, NULL, '1567578002184');
INSERT INTO `skyx_users` VALUES (4, 'nihao11', '80499104d7c21bd832cf3638c8f97913', NULL, NULL, '1567578067591');

SET FOREIGN_KEY_CHECKS = 1;
