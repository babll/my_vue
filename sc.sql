SET NAMES UTF8;
DROP DATABASE IF EXISTS sc;
CREATE DATABASE sc CHARSET=UTF8;
USE sc;
CREATE TABLE sc_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);
CREATE TABLE sc_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32)
);
CREATE TABLE sc_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  did INT,
  pic VARCHAR(128),
  title VARCHAR(128),
  price INT,
  evaluate INT,
  store VARCHAR(128)
);
CREATE TABLE sc_list(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,
  did INT,
  pic VARCHAR(128),
  title VARCHAR(128),
  price INT,
  evaluate INT,
  store VARCHAR(128)
);
CREATE TABLE sc_particulars(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(128),
  title VARCHAR(128),
  price INT,
  discounts VARCHAR(256)
);
CREATE TABLE sc_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,
  pic VARCHAR(128),
  lname VARCHAR(255),
  price DECIMAL(10,2),
  count INT,
  uid INT
);

INSERT INTO sc_family VALUES
(1,'手机'),
(2,'电脑'),
(3,'零食'),
(4,'衣服');

INSERT INTO sc_user VALUES
(1,'tom','123456'),
(2,'jerry','123456');

INSERT INTO sc_index_product VALUES
(1,1,'images/sl-1.jpg','vivo Z6 双模5G全网通 44W超快闪充 骁龙765G 5000mAh大电池 全场景四摄手机 6GB+128GB 星际银',2298,2545,'vivo官方旗舰店'),
(2,2,'images/sl-2.jpg','Apple iPhone XS Max (A2104) 256GB 金色 移动联通电信4G手机 双卡双待 ',7199,9999,'Apple产品官方旗舰店'),
(3,3,'images/sl-3.jpg','联想(Lenovo)小新Pro13.3英寸全面屏超轻薄笔记本电脑(标压锐龙R5-3550H 16G 512G 2.5K QHD 100%sRGB)银',4999,6659,'联想自营旗舰店'),
(4,4,'images/sl-4.jpg','戴尔DELL游匣G3 15.6英寸英特尔酷睿i5游戏笔记本电脑(i5-9300H 8G 512G GTX1650 4G 72色域 2年整机上门)',5399,7239,'戴尔自营官方旗店'),
(5,5,'images/sl-5.jpg','良品铺子 猪肉脯自然片靖江猪肉干肉铺肉类零食休闲网红小吃100g',29,9999,'良品铺子自营旗店'),
(6,6,'images/sl-6.jpg','三只松鼠_巨型零食大礼包30包坚果薯片辣条年货礼包情人节生日礼物送女友猪饲料小吃猪肉 混合口味',188,9999,'三只松鼠旗舰店'),
(7,7,'images/sl-7.jpg','G2000男装商务休闲西服男外套 正装修身男士西装礼服西服上衣男00010021 黑色/99 46/165（46码等同于45码）',999,1463,'G2000官方旗舰店'),
(8,8,'images/sl-8.jpg','原创汉服袄裙女中国风齐胸襦裙广袖古装超仙气飘逸古风学生加绒连衣裙秀禾服演出服女成人加厚版冬上衣 银杏-     绣花-齐腰【三件套-大袖衫 XL】',1188,999,'佳昭旗舰店');


INSERT INTO sc_list VALUES
(1,1,1,'images/sl-1.jpg','vivo Z6 双模5G全网通 44W超快闪充 骁龙765G 5000mAh大电池 全场景四摄手机 6GB+128GB 星际银',2298,2545,'vivo官方旗舰店'),
(2,1,2,'images/sl-2.jpg','Apple iPhone XS Max (A2104) 256GB 金色 移动联通电信4G手机 双卡双待 ',7199,9999,'Apple产品官方旗舰店'),
(3,1,9,'images/sl-9.jpg','小米10 双模5G  骁龙865  1亿像素8K电影相机  对称式立体声 8GB+256GB 钛银黑 拍照智能新品游戏手机 ',4299,9999,'小米自营旗舰店'),
(4,1,10,'images/sl-10.jpg','华为 HUAWEI Mate 30 Pro 5G 麒麟990 OLED环幕屏双4000万徕卡电影四摄8GB+256GB亮黑色5G全网通游戏手机 ',6399,9999,'华为自营官方旗舰店'),
(5,1,11,'images/sl-11.jpg','Apple iPhone 11 Pro Max (A2220) 256GB 暗夜绿色  移动联通电信4G手机 双卡双待 ',10899,9999,'Apple产品自营旗舰店'),
(6,1,12,'images/sl-12.jpg','小米CC9 Pro 1亿像素 五摄四闪 10倍混合光学变焦 5260mAh 屏下指纹 魔法绿镜 8GB+128GB 游戏智能拍照手机 ',2799,9999,'小米自营旗舰店'),
(7,2,3,'images/sl-3.jpg','联想(Lenovo)小新Pro13.3英寸全面屏超轻薄笔记本电脑(标压锐龙R5-3550H 16G 512G 2.5K QHD 100%sRGB)银',4999,6659,'联想自营旗舰店'),
(8,2,4,'images/sl-4.jpg','戴尔DELL游匣G3 15.6英寸英特尔酷睿i5游戏笔记本电脑(i5-9300H 8G 512G GTX1650 4G 72色域 2年整机上门)',5399,7239,'戴尔自营官方旗店'),
(9,2,13,'images/sl-13.jpg','宏碁(Acer)暗影骑士4 15.6英寸 高色域屏 游戏本 宏基笔记本电脑 (I5-9300H标压 8G 512GPCIe固态硬盘 GTX1650显卡 4G独显 窄边框 背光键盘 电竞吃鸡利器)',5499,9999,'宏碁自营旗舰店'),
(10,2,14,'images/sl-14.jpg','华硕(ASUS) 飞行堡垒7 九代英特尔酷睿i5 120Hz高速屏游戏笔记本电脑(i5-9300H 8G 512SSD GTX1650)金属电竞',6099,9999,'华硕自营官方旗舰店'),
(11,2,15,'images/sl-15.jpg','惠普（HP）光影精灵5Plus 15.6英寸窄边框大屏暗夜精灵高端电竞游戏笔记本电脑手提 i5-9300H GTX1050 60hz 8G内存 512G高速固态 旗舰款 ',5469,9999,'惠普易企营专卖店'),
(12,2,16,'images/sl-16.jpg','华硕(ASUS) 飞行堡垒7 15.6英寸游戏笔记本电脑(标压锐龙7-3750H 16G 512GSSD RTX2060 6G 电竞120Hz)火陨',7199,9999,'华硕自营官方旗舰店'),
(13,3,5,'images/sl-5.jpg','良品铺子 猪肉脯自然片靖江猪肉干肉铺肉类零食休闲网红小吃100g',29,9999,'良品铺子自营旗店'),
(14,3,6,'images/sl-6.jpg','三只松鼠_巨型零食大礼包30包坚果薯片辣条年货礼包情人节生日礼物送女友猪饲料小吃猪肉 混合口味',188,9999,'三只松鼠旗舰店'),
(15,3,17,'images/sl-17.jpg','士力架 花生夹心巧克力（全家桶）礼物送女友 休闲零食员工福利 糖果460g （新旧包装随机发放）',32,9999,'德芙自营旗舰店'),
(16,3,18,'images/sl-18.jpg','良品铺子手撕面包2.1斤早餐小面包饼干蛋糕孕妇休闲零食办公室糕点点心整箱装礼盒1050g ',32,9999,'良品铺子自营旗舰店'),
(17,3,19,'images/sl-19.jpg','奥利奥（Oreo）巧克力味夹心饼干 早餐蛋糕糕点休闲零食家庭装 宅家囤货必备349g',13,9999,'亿滋自营官方旗舰店'),
(18,3,20,'images/sl-20.jpg','三只松鼠奶油味夏威夷果 坚果炒货孕妇坚果每日坚果干果零食160g/袋',44,9999,'三只松鼠自营旗舰店'),
(19,4,7,'images/sl-7.jpg','G2000男装商务休闲西服男外套 正装修身男士西装礼服西服上衣男00010021 黑色/99 46/165（46码等同于45码）',999,1463,'G2000官方旗舰店'),
(20,4,8,'images/sl-8.jpg','原创汉服袄裙女中国风齐胸襦裙广袖古装超仙气飘逸古风学生加绒连衣裙秀禾服演出服女成人加厚版冬上衣 银杏-     绣花-齐腰【三件套-大袖衫 XL】',1188,999,'佳昭旗舰店'),
(21,4,21,'images/sl-21.jpg','传统汉服女古装绣花红色马面裙改良明制秋冬装芙蓉月琵琶袖交领袄裙 芙蓉月 上袄+马面裙 ',118,999,'e街服饰旗舰店'),
(22,4,22,'images/sl-22.jpg','汉服女学生古装仙女裙齐胸襦裙古装汉服夏装日常改良古风清新淡雅唐装 -玉兔',159,999,'阿宅小布服饰专营店'),
(23,4,23,'images/sl-23.jpg',' 纪诗哲轻奢品牌汉服女2020春新款女装凤来朝汉服女彩色凤凰织金仙鹤暗纹明制披风大气中国风 仅披风一件-预售 XS ',2688,99,'纪诗哲女装旗舰店'),
(24,4,24,'images/sl-24.jpg',' 汉服女广袖流仙裙中国风超仙飘逸古风古装汉服秋冬套装 画皮六米摆 ',855,99,'锦诚服装专营店');


INSERT INTO sc_particulars VALUES
(1,'images/md-1.jpg','vivo Z6 双模5G全网通 44W超快闪充 骁龙765G 5000mAh大电池 全场景四摄手机 6GB+128GB 星际银',2298,'满2298元减100元'),
(2,'images/md-2.jpg','Apple iPhone XS Max (A2104) 256GB 金色 移动联通电信4G手机 双卡双待 ',7199,'满5000元减500元'),
(3,'images/md-3.jpg','联想(Lenovo)小新Pro13.3英寸全面屏超轻薄笔记本电脑(标压锐龙R5-3550H 16G 512G 2.5K QHD 100%sRGB)银',4999,'购买1件可优惠换购热销商品'),
(4,'images/md-4.jpg','戴尔DELL游匣G3 15.6英寸英特尔酷睿i5游戏笔记本电脑(i5-9300H 8G 512G GTX1650 4G 72色域 2年整机上门) ',5399,'购买1件可优惠换购热销商品'),
(5,'images/md-5.jpg','良品铺子 猪肉脯自然片靖江猪肉干肉铺肉类零食休闲网红小吃100g',29,'满199元减120元，满299元减180元'),
(6,'images/md-6.jpg','三只松鼠_巨型零食大礼包30包坚果薯片辣条年货礼包情人节生日礼物送女友猪饲料小吃猪肉 混合口味',188,'满180元减20元'),
(7,'images/md-7.jpg','G2000男装商务休闲西服男外套 正装修身男士西装礼服西服上衣男00010021 黑色/99 46/165（46码等同于45码）',999,'满300享9折'),
(8,'images/md-8.jpg','原创汉服袄裙女中国风齐胸襦裙广袖古装超仙气飘逸古风学生加绒连衣裙秀禾服演出服女成人加厚版冬上衣 银杏-     绣花-齐腰【三件套-大袖衫 XL】',1188,'满300享9折'),
(9,'images/md-9.jpg','小米10 双模5G  骁龙865  1亿像素8K电影相机  对称式立体声 8GB+256GB 钛银黑 拍照智能新品游戏手机',4299,'满4000元减100元'),
(10,'images/md-10.jpg','华为 HUAWEI Mate 30 Pro 5G 麒麟990 OLED环幕屏双4000万徕卡电影四摄8GB+256GB亮黑色5G全网通游戏手机',6399,'购买1件可优惠换购热销商品'),
(11,'images/md-11.jpg','Apple iPhone 11 Pro Max (A2220) 256GB 暗夜绿色  移动联通电信4G手机 双卡双待',10899,'满9000元减700元'),
(12,'images/md-12.jpg','小米CC9 Pro 1亿像素 五摄四闪 10倍混合光学变焦 5260mAh 屏下指纹 魔法绿镜 8GB+128GB 游戏智能拍照手机',2799,'购买1件可优惠换购热销商品'),
(13,'images/md-13.jpg','宏碁(Acer)暗影骑士4 15.6英寸 高色域屏 游戏本 宏基笔记本电脑 (I5-9300H标压 8G 512GPCIe固态硬盘 GTX1650显卡 4G独显 窄边框 背光键盘 电竞吃鸡利器)',5499,'购买1件可优惠换购热销商品'),
(14,'images/md-14.jpg','华硕(ASUS) 飞行堡垒7 九代英特尔酷睿i5 120Hz高速屏游戏笔记本电脑(i5-9300H 8G 512SSD GTX1650)金属电竞',6099,'购买1件可优惠换购热销商品'),
(15,'images/md-15.jpg','惠普（HP）光影精灵5Plus 15.6英寸窄边框大屏暗夜精灵高端电竞游戏笔记本电脑手提 i5-9300H GTX1050 60hz 8G内存 512G高速固态 旗舰款',5469,'满1000元减50元'),
(16,'images/md-16.jpg','华硕(ASUS) 飞行堡垒7 15.6英寸游戏笔记本电脑(标压锐龙7-3750H 16G 512GSSD RTX2060 6G 电竞120Hz)火陨',7199,'购买1件可优惠换购热销商品'),
(17,'images/md-17.jpg','士力架 花生夹心巧克力（全家桶）礼物送女友 休闲零食员工福利 糖果460g （新旧包装随机发放）',32,'购买1件可优惠换购热销商品'),
(18,'images/md-18.jpg','良品铺子手撕面包2.1斤早餐小面包饼干蛋糕孕妇休闲零食办公室糕点点心整箱装礼盒1050g',32,'满29元减3元'),
(19,'images/md-19.jpg','奥利奥（Oreo）巧克力味夹心饼干 早餐蛋糕糕点休闲零食家庭装 宅家囤货必备349g',13,'购买1件可优惠换购热销商品'),
(20,'images/md-20.jpg','三只松鼠奶油味夏威夷果 坚果炒货孕妇坚果每日坚果干果零食160g/袋',44,'满300元减200元'),
(21,'images/md-21.jpg','传统汉服女古装绣花红色马面裙改良明制秋冬装芙蓉月琵琶袖交领袄裙 芙蓉月 上袄+马面裙',118,'购买1件可优惠换购热销商品'),
(22,'images/md-22.jpg','汉服女学生古装仙女裙齐胸襦裙古装汉服夏装日常改良古风清新淡雅唐装 -玉兔',159,'购买1件可优惠换购热销商品'),
(23,'images/md-23.jpg','纪诗哲轻奢品牌汉服女2020春新款女装凤来朝汉服女彩色凤凰织金仙鹤暗纹明制披风大气中国风 仅披风一件-预售 XS',2688,'买300享9折'),
(24,'images/md-24.jpg','汉服女广袖流仙裙中国风超仙飘逸古风古装汉服秋冬套装 画皮六米摆',855,'买300享9折');

