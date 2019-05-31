/*
 Navicat MySQL Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : gp

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 29/05/2019 13:57:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `ausername` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `apassword` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `astatus` int(11) NOT NULL COMMENT '用户权限',
  `anick_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `is_normal` int(11) NULL DEFAULT 1 COMMENT '用户账号是否正常，1表示正常，0表示异常',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'admin', '111111', 1, '王大大', 1);
INSERT INTO `account` VALUES (3, 'wangwei', '111111', 0, '王伟', 1);

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书编号',
  `b_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书籍名称',
  `b_type` int(11) NOT NULL COMMENT '图书类型',
  `b_creater` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书作者',
  `b_price` double NOT NULL COMMENT '图书价格',
  `b_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书描述',
  `b_number` int(11) NOT NULL COMMENT '图书数量',
  `b_img_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书图片路径',
  `b_ststus` int(11) NULL DEFAULT 0 COMMENT '1删除 0不删除',
  `jinhuo` double NULL DEFAULT NULL COMMENT '进货价',
  `zhekou` double NULL DEFAULT NULL COMMENT '折扣率',
  `number` int(11) NULL DEFAULT NULL,
  `totalJinhuo` double NULL DEFAULT NULL COMMENT '进货价',
  PRIMARY KEY (`b_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '京东套装3册', 13, '山姆·麦克布雷尼', 108.5, '三个精美绝伦的故事，告诉爱是什么。', 100, '/download/images/th017b61c3e3a660d97f.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (2, '当动物有钱了', 13, '乌瑞克·莫切乌利西', 35.5, '教会孩子如何看待财富，获得幸福', 100, '/download/images/th025b20bde9Nef1532b6.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (3, '爷爷一定有办法', 13, ' 菲比·吉尔曼 ', 39.5, '信谊绘本世界精选图画书', 100, '/download/images/th035a8f759bN805ef834.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (4, '在教室说错了没关系', 13, ' 莳田晋至', 28.5, '《在教室说错了没关系》是一部由青岛出版社出版发行的儿童教育图书。', 100, '/download/images/th0458ae94c8Na6573a30.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (5, '大卫不可以绘本', 13, ' 大卫·香农', 90.5, '启发童书馆出品', 100, '/download/images/th05592bf167N2421e7ac.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (6, '画给孩子的中国传统节日', 29, '洋洋兔', 28.5, '延续文化根脉，送给孩子的美丽中国“节”！随书附赠音频讲解，国家一级播音员黄昆琨用声音演绎传统文化！', 100, '/download/images/2901.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (7, '我们的身体', 29, '帕斯卡尔·艾德兰', 123.5, '从孩子的视角出发，图文结合，翻开每一页都会有惊奇感，就跟探险一样，无意间，关于我们自己身上的各种秘密就揭开啦，是每个幼儿初步认知自己和自己身体的理想选择。', 100, '/download/images/2902.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (8, '动物百科', 29, ' 王伟 ', 32.5, '好玩的动物世界 通俗易懂的知识点 越看越上瘾', 100, '/download/images/2903.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (9, 'DK恐龙知识大百科 [6-14岁]', 29, ' 英国DK公司 ', 28.5, '逼真3D形象再现2.5亿年隐秘恐龙传奇，这是一部“恐龙简史”', 100, '/download/images/2904.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (10, '乐乐趣 看里面第二辑', 29, ' 荣信文化', 227.5, '乐乐趣科普翻翻书：获英国“地理学会”银奖，英国儿童科学教育类图书销量榜图书；国家新闻总署向全国儿童推荐科普读物系列', 100, '/download/images/2905.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (11, '行为习惯教养绘本', 30, '[比] 让娜·阿什比 著，心喜阅童书 编，[比] 让娜·阿什比 绘，谢逢蓓 译', 88.5, '通过一正一反的对比情景，告诉孩子“这么做更好”，让孩子在亲子共读的氛围中，培养良好的行为习惯，同时也让家长通过这套书轻松教养孩子。', 100, '/download/images/3001.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (12, '幼儿睡前故事绘本', 30, '罗自国 ', 95.5, '综合国内外家喻户晓的经典童话故事，精美彩图、内容丰富、文字浅显易懂，是陪伴孩子成长的必备童书。', 100, '/download/images/3002.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (13, '乐乐趣偷偷看里面系列第一辑', 30, ' 安娜·米尔波恩、奥尔加·杰米多娃 ', 39.5, '该系列引进自英国usborne出版社，是看里面系列的新产品。洞洞+翻翻书的形式趣味十足，动物、自然的主题十分贴近生活，色彩鲜艳、充满美感，语言朗朗上口。', 100, '/download/images/3003.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (14, '邦臣小红花', 30, ' 北京小红花图书工作室', 50.5, '本书收集了孩子在生活学习中所经常接触的场景和事物，通过巧妙的构思，将贴纸游戏与启蒙认知相结合。', 100, '/download/images/3004.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (15, '乐乐趣偷偷看里面第二辑', 30, ' 安娜.米尔波恩', 172.5, '未来出版社出版', 100, '/download/images/3005.png', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (16, '米小圈脑筋急转弯', 31, '北猫', 50.5, '（出其不意、捧腹大笑、领略语言的奇妙乐趣，拓展逻辑思维，漫画角色来自风靡小学校园的《米小圈上学记》）', 100, '/download/images/3201.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (17, '新生婴儿套餐4盒', 31, '海润阳光', 95.5, '中国优生优育协会眼防专业委员会联合研发,育婴童高端论坛、孕妇课堂等母婴机构指定用品。绿色印刷 安全环保', 100, '/download/images/3102.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (18, '儿童教具', 31, ' 多丽丝·菲舍尔 ', 160.5, '5本主题书，160个早教游戏。', 100, '/download/images/3103.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (19, '全新升级版启蒙篇共2册', 31, ' 上海巨童文化', 34.5, '轻松有趣的贴纸游戏与早教益智游戏结合，既能够增加游戏的趣味性，又能在游戏中锻炼小朋友的计算计数能力和语言能力。', 100, '/download/images/3104.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (20, '企鹅萌萌 AR专注力迷宫训练书', 31, ' 上海仙剑文化传媒股份有限公司', 35.5, 'AR版,逻辑思维注意力书,3-6岁儿童大迷宫,全脑智力开发,幼儿益智游戏书籍', 100, '/download/images/3105.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (21, '英国幼儿字母小词典', 32, '当·米歇尔 著，海豚传媒 编', 120.5, '低年龄段的小宝宝可以用手摸一摸字母的形状，还可以用小手抠抠字母中间的小洞洞。', 100, '/download/images/3201.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (22, '培生幼儿启蒙英语', 32, 'Pearson（培生）', 220.5, 'Level A立足幼儿年龄特点和符合幼儿认知规律，每册图书以日常生活中常用的英语单词和句型为主，简短易读，易学易会', 100, '/download/images/3202.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (23, '培生幼儿英语·阅读街', 32, ' 美国培生教育出版集团', 230.5, '源自美国培生教育集团斯考特·福斯曼综合阅读英语分级课程教材，美国多州幼儿园广泛采用，全套72本2张CD', 100, '/download/images/3203.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (24, '兰登书屋经典启蒙读本', 32, ' 莳田晋至', 260.5, '“兰登双语经典”是从中精选出既生动有趣，又富含生活小哲理的绘本故事，其中包括《你是我的妈妈么》和《狗狗向前冲》。这两本书在美国国家教育协会和美国图书馆推荐的“美国儿童必读100本童书”中名列前茅。', 100, '/download/images/3204.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (25, '英语单词大书', 32, ' [英] 梅丽·麦金农 著，凯特·欣德利 绘', 72.5, '画风可爱，超有“孩子缘”，自用送礼两相宜。 享誉全球的英国童书出版社Usborne 出品！25个主题、100个情景互动、1000个常用单词，轻松拓展英语词汇量。', 100, '/download/images/3205.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (26, '时间的礼物', 40, '弗雷德里克·巴克曼', 30, '青年演员、蓝盈莹推荐《时间的礼物》“如果你想读点什么，但只有很短的时间，可以看看这本书。如果你感觉自己已经好久没有被温柔的打动了，可以翻开这本书。', 100, '/download/images/0e6154200c5028f4wx01.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (27, '海上的明信片', 40, '维多利亚.希斯洛普', 58.5, '一本浪漫的《S.》，一段裹挟着浪漫与冒险的奇遇', 100, '/download/images/5c063b25Nb39cb48dwx02.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (28, '冷雨', 40, '郭沛文', 33, '近30万人口碑相传：翻开就停不下来！豆瓣阅读8.6高分，年度悬疑力作，社会派推理黑马！为了突破成人世界的法则，每个少年都曾用尽一生。《无证之罪》紫金陈《十九年间谋杀小叙》那多《暗黑者》周浩晖力荐', 100, '/download/images/d2730119337d848bwx03.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (29, '深渊游戏I·洗神髓', 40, '水千丞', 35, '水千丞跨越想象力的新起点，爱奇艺文学一等奖作品，全文未删减。一部逆境求生的勇气之书', 100, '/download/images/5bf770dcN4c8e020cwx04.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (30, '漫长的告别', 40, '雷蒙德·钱德勒', 57.5, '村上曾亲自翻译《漫长的告别》，掀起阅读狂潮！美国文学黄金时代四大杰作之一！全新译本，全新插图，生动还原硬汉派文字精髓，附赠资深书迷手册！读客熊猫君出品', 100, '/download/images/5bea3dceN10e51b04wx05.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (31, '天长地久：给美君的信', 41, '龙应台', 32.5, '参加读书会，书友们各自有着不一样的生活不一样的故事不一样的理解，你说我说大家说，倾听交流，丰富了我对这本书的理解和感悟。', 100, '/download/images/wsb015b552ba9N513b50f4.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (32, '龙应台“人生三书”（套装全3册）', 41, '龙应台，安德烈 ', 65.5, '插图新版《目送》《亲爱的安德烈》《孩子你慢慢来》一堂人生课的三本畅销作业', 100, '/download/images/wsb02561f5e07N2e2bec88.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (33, '朗读者II（套装1-3辑）', 41, '董卿', 151.5, '朗读依旧，初心不改，《朗读者II》全新回归，·中央广播电视总台文化类节目《朗读者II》同名图书，共分三辑。', 100, '/download/images/wsb033c80c39d1cfc0f63.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (34, '高兴死了！！！', 41, '珍妮·罗森', 50.5, '《高兴死了！！！》是一位抑郁症患者的快乐宣言，在美国鼓励了数百万人，盘踞《纽约时报》畅销书榜近半年。', 100, '/download/images/wsb045aaf2c27Ne541d77e.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (35, '林徽因：不慌不忙的坚强', 41, '赵一 ', 20.5, '温柔要有，但不是妥协，我们要在安静中，选择不慌不忙的坚强。', 100, '/download/images/wsb055a45b0a7Ned0a673d.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (36, '三毛传：你松开手，我便落入茫茫宇宙', 42, '程碧', 29.5, '畅销书作家程碧全面还原了三毛的一生，讲了别人没讲过没讲透的那个三毛。', 100, '/download/images/wz01f30c7b858db989d7.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (37, '曼巴精神：科比自传（精装）', 42, '科比·布莱恩特 ', 30.5, '科比惟一官方认证传记，中、英文版全球同步上市。写科比的书浩如烟海，但正确解读“曼巴精神”，直面科比内心世界的书，只有这一本。科比是一生偶像，“曼巴精神”是一生信仰。', 100, '/download/images/wz02ddcf47f8b711357e.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (38, '金庸全传：一代武侠宗师的传奇人生', 42, '席圣文', 32.5, '一代武侠宗师的人生传奇,赤手空拳闯香江，一支妙笔写春秋,飞雪连天射白鹿，笑书神侠倚碧鸳。', 100, '/download/images/wz0358be5c22N590df679.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (39, '马小松的视界', 42, '梅丸', 34.5, '方文山、胡歌、温兆伦、叶一茜、何洁、付辛博倾情推荐', 100, '/download/images/wz042a8d9926c9239274.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (40, '成吉思汗与今日世界之形成', 42, '杰克.威泽弗德 ', 19.5, '《纽约时报》畅销书 连续13年稳居亚洲历史人物传记首位.在全球视野中探寻古老部落首领与现代世界的历史关联,以人类学的眼光和说故事的独特方式重新诠释蒙元时代.', 100, '/download/images/wz05b860e759faefee90.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (41, '梦的化石：今敏全短篇', 43, '今敏', 31.5, '动画大师今敏漫画故事集，412页大容量，亲绘封面，原版复刻，挚爱典藏，更是《红辣椒》等经典动画的原点', 99, '/download/images/wd015bbffe0cN476194ed.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (42, '非人哉.4', 43, '一汪空气 ', 36.5, '同名动画剧集腾讯视频热播，超萌超火爆连载国漫《非人哉》第四弹爆笑来袭。白茶、幽·灵、使徒子诚意推荐！京东专享日历卡片+精美大海报', 78, '/download/images/wd025be3d937Ndb33df91.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (43, '回答不了', 43, '果麦文化 出品；匡扶', 50.5, '感动千万读者，横扫国内各大榜单，年度不可错过的漫画集，果麦文化 出品', 100, '/download/images/wd03.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (44, '只想一个人喝酒', 43, '梅丸', 59.5, '作者亲绘漫画签名本限量随机发售。签绘漫画位于扉页背后，作者亲往印刷厂绘制200张关于“酒”的漫画，每一本都是不同的创意，每一本都是独特的收藏本！', 100, '/download/images/wd0423684d7737dcb4cf.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (45, '我的生活不可能那么坏', 43, '果麦文化 出品；（日）河尻圭吾 ', 36.5, '拥挤的地铁、令人困倦的会议、难以抉择的午饭、午后的白日梦，很抱歉，生而为人不得不面对这样的人生。没关系，明天就是周末了，欢迎来到Keigo君的脑洞世界。果麦文化 出品', 79, '/download/images/wd055ae08efdN7d51ac23.jpg', 0, 99, 0.9, 100, 9900);
INSERT INTO `books` VALUES (46, '东野圭吾：白夜行', 44, '东野圭吾', 30.5, '与《嫌疑人X的献身》《恶意》《解忧杂货店》并称为东野圭吾四大杰作，中文版销量超450万册。', 96, '/download/images/wx01598946baN4821811a.jpg', 0, 99, 0.6, 96, 9900);

-- ----------------------------
-- Table structure for buy_books
-- ----------------------------
DROP TABLE IF EXISTS `buy_books`;
CREATE TABLE `buy_books`  (
  `bbId` int(11) NOT NULL AUTO_INCREMENT,
  `bborder` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buser` int(11) NULL DEFAULT NULL,
  `bookId` int(11) NULL DEFAULT NULL,
  `bstatus` int(11) NULL DEFAULT NULL,
  `bbnumber` int(11) NULL DEFAULT 1,
  `is_pay` int(11) NULL DEFAULT 1,
  `binfo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `totial` double NULL DEFAULT NULL COMMENT '购买总价格',
  PRIMARY KEY (`bbId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buy_books
-- ----------------------------
INSERT INTO `buy_books` VALUES (1, '1555494216635', 3, 46, 3, 10, 1, '很好看', 274.5);
INSERT INTO `buy_books` VALUES (2, '1555496014167', 3, 39, 3, 10, 1, '真的很好看', 310.5);
INSERT INTO `buy_books` VALUES (3, '1555740501483', 3, 45, 3, 10, 1, '大叔大婶多', 328.5);
INSERT INTO `buy_books` VALUES (5, '1557398554099', 3, 42, 3, 10, 1, NULL, 328.5);
INSERT INTO `buy_books` VALUES (9, '1557399469940', 3, 42, 3, 10, 1, NULL, 328.5);
INSERT INTO `buy_books` VALUES (10, '1557399584786', 3, 45, 3, 10, 1, '很好看', 328.5);
INSERT INTO `buy_books` VALUES (11, '1558332212545', 3, 41, 3, 1, 1, '哈哈', 28.35);
INSERT INTO `buy_books` VALUES (12, '1558340452627', 3, 46, 0, 1, 1, NULL, 27.45);
INSERT INTO `buy_books` VALUES (13, '1558340725173', 3, 46, 0, 1, 1, NULL, 27.45);
INSERT INTO `buy_books` VALUES (14, '1558340794474', 3, 46, 0, 1, 1, NULL, 27.45);
INSERT INTO `buy_books` VALUES (15, '1558340873424', 3, 46, 0, 1, 1, NULL, 27.45);
INSERT INTO `buy_books` VALUES (16, '1558417166449', 3, 45, 0, 1, 1, NULL, 32.85);

-- ----------------------------
-- Table structure for car_books
-- ----------------------------
DROP TABLE IF EXISTS `car_books`;
CREATE TABLE `car_books`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booksid` int(11) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `c_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类标题',
  `c_pid` int(11) NULL DEFAULT NULL COMMENT '子分类编号',
  `c_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES (1, 'root', NULL, '图书总分类');
INSERT INTO `catalog` VALUES (3, '童书', 1, '童书作品');
INSERT INTO `catalog` VALUES (13, '绘本', 3, '绘本作品');
INSERT INTO `catalog` VALUES (29, '科普科学', 3, '科普科学作品');
INSERT INTO `catalog` VALUES (30, '幼儿启蒙', 3, '幼儿启蒙作品');
INSERT INTO `catalog` VALUES (31, '智力开发', 3, '智力开发作品');
INSERT INTO `catalog` VALUES (32, '少儿英语', 3, '少儿英语作品');
INSERT INTO `catalog` VALUES (39, '文学', 1, '文学作品');
INSERT INTO `catalog` VALUES (40, '散文', 39, '散文作品');
INSERT INTO `catalog` VALUES (41, '随笔', 39, '随笔');
INSERT INTO `catalog` VALUES (42, '传记', 39, '传记作品');
INSERT INTO `catalog` VALUES (43, '动漫', 39, '动漫作品');
INSERT INTO `catalog` VALUES (44, '悬疑推理', 39, '悬疑推理作品');

-- ----------------------------
-- Table structure for collection_book
-- ----------------------------
DROP TABLE IF EXISTS `collection_book`;
CREATE TABLE `collection_book`  (
  `cbid` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cbid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection_book
-- ----------------------------
INSERT INTO `collection_book` VALUES (3, 42, 3);
INSERT INTO `collection_book` VALUES (4, 45, 3);

SET FOREIGN_KEY_CHECKS = 1;
