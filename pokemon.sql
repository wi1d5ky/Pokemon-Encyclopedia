CREATE TABLE Skill(
SID INT NOT NULL AUTO_INCREMENT,
SName VARCHAR(45),
SType VARCHAR(45) NOT NULL check (Type in
('普','火','水','草','雷','冰','超','岩','地','飛','格','蟲','毒','鬼',
'龍','惡','鋼')),
SPowerPoint INT check (PowerPoint >= 1),
SBasePower INT,
SAccuracy FLOAT,
SEffect VARCHAR(255),
SSpeedPriority INT,
PRIMARY KEY (SID));



CREATE TABLE Ability(
AID INT NOT NULL AUTO_INCREMENT,
AName VARCHAR(45),
AEffect VARCHAR(255),
PRIMARY KEY (AID));



CREATE TABLE Region(
RID INT NOT NULL AUTO_INCREMENT,
RName VARCHAR(45),
RType VARCHAR(45),
PRIMARY KEY (RID));



CREATE TABLE Item(
IID INT NOT NULL AUTO_INCREMENT,
IName VARCHAR(45),
IPercentage FLOAT,
PRIMARY KEY (IID));



CREATE TABLE Pokemon(
PID INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(45),
GenderRatio FLOAT,
Type_1 VARCHAR(45) NOT NULL check (Type_1 in
('普','火','水','草','雷','冰','超','岩','地','飛','格','蟲','毒','鬼',
'龍','惡','鋼')),
Type_2 VARCHAR(45) check (Type_2 in
('普','火','水','草','雷','冰','超','岩','地','飛','格','蟲','毒','鬼',
'龍','惡','鋼')),
HP INT,
ATK INT,
DEF INT,
SATK INT,SDEF INT,
SPD INT,
AID INT,
IID INT,
PRIMARY KEY (PID),
FOREIGN KEY (AID) REFERENCES Ability(AID) ON DELETE set
null,
FOREIGN KEY (IID) REFERENCES Item(IID) ON DELETE set null);



CREATE TABLE Learn(
LID INT NOT NULL AUTO_INCREMENT,
PID INT NOT NULL,
SID INT NOT NULL,
LAtLevel INT,
PRIMARY KEY (LID, PID, SID),
FOREIGN KEY (PID) REFERENCES Pokemon(PID) ON DELETE cascade,
FOREIGN KEY (SID) REFERENCES Skill(SID) ON DELETE cascade);



CREATE TABLE Locations(
LoID INT NOT NULL AUTO_INCREMENT,
PID INT NOT NULL,
RID INT NOT NULL,
Time VARCHAR(45) NOT NULL check (Time in ('早','午','晚')),
LoSeason VARCHAR(45) check (Season in ('春','夏','秋','冬')),
LoProbability FLOAT,
PRIMARY KEY (LoID, PID, RID),
FOREIGN KEY (PID) REFERENCES Pokemon(PID) ON DELETE cascade,
FOREIGN KEY (RID) REFERENCES Region(RID) ON DELETE cascade);


INSERT INTO Pokemon
VALUES (1,'妙蛙種子',0.5,'草','毒',45,65,49,65,49,45,01,0);

INSERT INTO Pokemon
VALUES (2,'妙蛙草',0.5,'草','毒',60,62,63,80,80,60,01,0);

INSERT INTO Pokemon
VALUES (3,'妙蛙花',0.5,'草','毒',80,82,83,100,100,80,01,0);

INSERT INTO Pokemon
VALUES (4,'小火龍',0.5,'火','null',39,52,43,60,50,65,02,0);

INSERT INTO Pokemon
VALUES (5,'火恐龍',0.5,'火','null',58,64,58,80,65,80,02,0);

INSERT INTO Pokemon
VALUES (6,'噴火龍',0.5,'火','飛',78,84,78,109,85,100,02,0);

INSERT INTO Pokemon
VALUES (7,'傑尼龜',0.5,'水','null',44,48,65,50,64,43,03,0);

INSERT INTO Pokemon
VALUES (8,'卡咪龜',0.5,'水','null',59,63,80,65,80,58,03,0);

INSERT INTO Pokemon
VALUES (9,'水箭龜',0.5,'水','null',79,83,100,85,105,78,03,0);

INSERT INTO Pokemon
VALUES (10,'綠毛蟲',0.5,'蟲','null',45,30,35,20,20,45,04,0);

INSERT INTO Pokemon
VALUES (11,'鐵甲蛹',0.5,'蟲','null',50,20,55,25,25,30,05,0);

INSERT INTO Pokemon
VALUES (12,'巴大蝴',0.5,'蟲','飛',60,45,50,80,80,70,06,01);

INSERT INTO Pokemon
VALUES (13,'獨角蟲',0.5,'蟲','毒',40,35,30,20,20,50,04,0);

INSERT INTO Pokemon
VALUES (14,'鐵殼昆',0.5,'蟲','毒',45,25,50,25,25,35,05,0);

INSERT INTO Pokemon
VALUES (15,'大針蜂',0.5,'蟲','毒',65,80,40,45,80,75,07,02);

INSERT INTO Pokemon
VALUES (16,'波波',0.5,'普','飛',40,45,40,35,35,56,08,0);

INSERT INTO Pokemon
VALUES (17,'比比鳥',0.5,'普','飛',63,60,55,50,50,71,08,0);

INSERT INTO Pokemon
VALUES (18,'比雕',0.5,'普','飛',83,80,75,70,70,91,08,0);

INSERT INTO Pokemon
VALUES (19,'小拉達',0.5,'普','null',30,56,35,25,35,72,09,0);

INSERT INTO Pokemon
VALUES (20,'拉達',0.5,'普','null',55,81,60,50,70,97,09,03);

INSERT INTO Pokemon
VALUES (21,'烈雀',0.5,'普','飛',40,60,30,31,31,70,08,0);

INSERT INTO Pokemon
VALUES (22,'大嘴雀',0.5,'普','飛',65,90,65,61,61,100,08,04);

INSERT INTO Pokemon
VALUES (23,'阿柏蛇',0.5,'毒','null',35,60,44,40,54,55,10,0);

INSERT INTO Pokemon
VALUES (24,'阿柏怪',0.5,'毒','null',60,85,69,65,79,80,10,02);

INSERT INTO Pokemon
VALUES (25,'皮卡丘',0.5,'雷','null',35,55,30,50,40,90,11,0);

INSERT INTO Pokemon
VALUES (26,'雷丘',0.5,'雷','null',60,90,55,90,80,100,11,0);

INSERT INTO Pokemon
VALUES (27,'穿山鼠',0.5,'地','null',50,75,85,20,30,40,12,0);

INSERT INTO Pokemon
VALUES (28,'穿山王',0.5,'地','null',75,100,110,45,55,65,12,0);

INSERT INTO Pokemon
VALUES (29,'尼多蘭',0.0,'毒','null',55,47,52,40,40,41,13,0);

INSERT INTO Pokemon
VALUES (30,'尼多娜',0.0,'毒','null',70,62,67,55,55,56,13,0);

INSERT INTO Pokemon
VALUES (31,'尼多后',0.0,'毒','地',90,82,87,75,85,76,13,0);

INSERT INTO Pokemon
VALUES (32,'尼多朗',1.0,'毒','null',46,57,40,40,40,50,13,0);

INSERT INTO Pokemon
VALUES (33,'尼多力諾',1.0,'毒','null',61,72,57,55,55,65,13,0);

INSERT INTO Pokemon
VALUES (34,'尼多王',1.0,'毒','地',81,92,77,85,75,85,13,0);

INSERT INTO Pokemon
VALUES (35,'皮皮',0.3,'普','null',70,45,48,60,65,35,14,0);

INSERT INTO Pokemon
VALUES (36,'皮可西',0.3,'普','null',95,70,73,85,90,60,14,05);

INSERT INTO Pokemon
VALUES (37,'六尾',0.3,'火','null',38,41,40,50,65,65,15,06);

INSERT INTO Pokemon
VALUES (38,'九尾',0.3,'火','null',73,76,75,81,100,100,15,06);

INSERT INTO Pokemon
VALUES (39,'胖丁',0.3,'普','null',115,45,20,45,25,20,14,07);

INSERT INTO Pokemon
VALUES (40,'胖可丁',0.3,'普','null',140,70,45,75,50,45,14,07);

INSERT INTO Pokemon
VALUES (41,'超音蝠',0.5,'毒','飛',40,45,35,30,40,55,16,0);

INSERT INTO Pokemon
VALUES (42,'大嘴蝠',0.5,'毒','飛',75,80,70,65,75,90,16,0);

INSERT INTO Pokemon
VALUES (43,'走路草',0.5,'草','毒',45,50,55,75,65,30,17,0);

INSERT INTO Pokemon
VALUES (44,'臭臭花',0.5,'草','毒',60,65,70,85,75,40,17,0);

INSERT INTO Pokemon
VALUES (45,'霸王花',0.5,'草','毒',75,80,85,100,90,50,17,0);

INSERT INTO Pokemon
VALUES (46,'派拉斯',0.5,'蟲','草',35,70,55,45,55,25,18,08);

INSERT INTO Pokemon
VALUES (47,'派拉斯特',0.5,'蟲','草',60,95,80,60,80,30,18,08);

INSERT INTO Pokemon
VALUES (48,'毛球',0.5,'蟲','毒',60,55,50,40,55,45,06,0);

INSERT INTO Pokemon
VALUES (49,'末入蛾',0.5,'蟲','毒',70,65,60,90,75,90,04,01);

INSERT INTO Pokemon
VALUES (50,'地鼠',0.5,'地','null',10,55,25,35,45,95,19,0);

INSERT INTO Pokemon
VALUES (51,'三地鼠',0.5,'地','null',35,80,50,50,70,120,19,0);

INSERT INTO Pokemon
VALUES (52,'喵喵',0.5,'普','null',40,45,35,40,40,90,20,09);

INSERT INTO Pokemon
VALUES (53,'貓老大',0.5,'普','null',65,70,60,65,65,115,21,0);

INSERT INTO Pokemon
VALUES (54,'可達鴨',0.5,'水','null',50,52,48,65,50,55,22,0);

INSERT INTO Pokemon
VALUES (55,'哥達鴨',0.5,'水','null',80,82,78,95,80,85,22,0);

INSERT INTO Pokemon
VALUES (56,'猴怪',0.5,'格','null',40,80,35,35,45,70,23,0);

INSERT INTO Pokemon
VALUES (57,'火爆猴',0.5,'格','null',65,105,60,60,70,95,23,0);

INSERT INTO Pokemon
VALUES (58,'卡蒂狗',0.8,'火','null',55,70,45,70,50,60,10,06);

INSERT INTO Pokemon
VALUES (59,'風速狗',0.8,'火','null',90,110,80,100,80,95,10,06);

INSERT INTO Pokemon
VALUES (60,'蚊香蝌蚪',0.5,'水','null',40,50,40,40,40,90,22,0);

INSERT INTO Pokemon
VALUES (61,'蚊香蛙',0.5,'水','null',65,65,65,50,50,90,22,0);

INSERT INTO Pokemon
VALUES (62,'快泳蛙',0.5,'水','格',90,85,95,70,90,70,22,0);

INSERT INTO Pokemon
VALUES (63,'凱西',0.8,'超','null',25,20,15,105,55,90,24,10);

INSERT INTO Pokemon
VALUES (64,'勇吉拉',0.8,'超','null',40,35,30,120,70,105,24,10);

INSERT INTO Pokemon
VALUES (65,'胡地',0.8,'超','null',55,50,45,135,85,120,24,10);

INSERT INTO Pokemon
VALUES (66,'腕力',0.8,'格','null',70,80,50,35,35,35,9,0);

INSERT INTO Pokemon
VALUES (67,'豪力',0.8,'格','null',80,100,70,50,60,45,9,11);

INSERT INTO Pokemon
VALUES (68,'怪力',0.8,'格','null',90,130,80,65,85,55,9,11);

INSERT INTO Pokemon
VALUES (69,'喇叭芽',0.5,'草','毒',50,75,35,70,30,40,17,0);

INSERT INTO Pokemon
VALUES (70,'口呆花',0.5,'草','毒',65,90,50,85,45,55,17,0);

INSERT INTO Pokemon
VALUES (71,'大食花',0.5,'草','毒',80,105,65,100,60,70,17,0);

INSERT INTO Pokemon
VALUES (72,'瑪瑙水母',0.5,'水','毒',40,40,35,50,100,70,25,0);

INSERT INTO Pokemon
VALUES (73,'毒刺水母',0.5,'水','毒',80,70,65,80,120,100,25,0);

INSERT INTO Pokemon
VALUES (74,'小拳石',0.5,'岩','地',40,80,100,30,30,20,26,0);

INSERT INTO Pokemon
VALUES (75,'隆隆石',0.5,'岩','地',55,95,115,45,45,35,26,12);

INSERT INTO Pokemon
VALUES (76,'隆隆岩',0.5,'岩','地',80,110,130,55,65,45,26,12);

INSERT INTO Pokemon
VALUES (77,'小火馬',0.5,'火','null',50,85,55,65,65,90,27,0);

INSERT INTO Pokemon
VALUES (78,'烈焰馬',0.5,'火','null',65,100,70,80,80,105,27,0);

INSERT INTO Pokemon
VALUES (79,'呆呆獸',0.5,'水','超',90,65,65,40,40,15,28,0);

INSERT INTO Pokemon
VALUES (80,'呆河馬',0.5,'水','超',95,75,110,100,80,30,28,0);

INSERT INTO Pokemon
VALUES (81,'小磁怪',2.0,'雷','鋼',25,35,70,95,55,45,29,0);

INSERT INTO Pokemon
VALUES (82,'三合一磁怪',2.0,'雷','鋼',50,60,95,120,70,70,29,13);

INSERT INTO Pokemon
VALUES (83,'大蔥鴨',0.5,'普','飛',52,65,55,58,62,60,08,14);

INSERT INTO Pokemon
VALUES (84,'嘟嘟',0.5,'普','飛',35,85,45,35,35,75,27,0);

INSERT INTO Pokemon
VALUES (85,'嘟嘟利',0.5,'普','飛',60,110,70,60,60,100,27,0);

INSERT INTO Pokemon
VALUES (86,'小海獅',0.5,'水','null',65,45,55,45,70,45,30,15);

INSERT INTO Pokemon
VALUES (87,'白海獅',0.5,'水','冰',90,70,80,70,75,70,30,15);

INSERT INTO Pokemon
VALUES (88,'臭泥',0.5,'毒','null',80,80,50,40,50,25,31,0);

INSERT INTO Pokemon
VALUES (89,'臭臭泥',0.5,'毒','null',105,105,75,65,100,50,31,0);

INSERT INTO Pokemon
VALUES (90,'大舌貝',0.5,'水','null',30,65,100,45,25,40,32,16);

INSERT INTO Pokemon
VALUES (91,'鐵甲貝',0.5,'水','冰',50,95,180,85,45,70,32,16);

INSERT INTO Pokemon
VALUES (92,'鬼斯',0.5,'鬼','毒',30,35,30,100,35,80,33,0);

INSERT INTO Pokemon
VALUES (93,'鬼斯通',0.5,'鬼','毒',45,50,45,115,55,95,33,17);

INSERT INTO Pokemon
VALUES (94,'耿鬼',0.5,'鬼','毒',60,65,60,130,75,110,33,17);

INSERT INTO Pokemon
VALUES (95,'大岩蛇',0.5,'岩','地',35,45,160,30,45,70,26,12);

INSERT INTO Pokemon
VALUES (96,'素利普',0.5,'超','null',60,48,45,43,90,42,34,0);

INSERT INTO Pokemon
VALUES (97,'素利拍',0.5,'超','null',85,73,70,73,115,67,34,0);

INSERT INTO Pokemon
VALUES (98,'大鉗蟹',0.5,'水','null',30,105,90,25,25,50,35,0);

INSERT INTO Pokemon
VALUES (99,'巨鉗蟹',0.5,'水','null',55,130,115,50,50,75,35,0);

INSERT INTO Pokemon
VALUES (100,'雷電球',2.0,'雷','null',40,30,50,55,55,100,11,0);

INSERT INTO Pokemon
VALUES (101,'頑皮彈',2.0,'雷','null',60,50,70,80,80,140,11,0);

INSERT INTO Pokemon
VALUES (102,'蛋蛋',0.5,'草','超',60,40,80,60,45,40,17,0);

INSERT INTO Pokemon
VALUES (103,'椰蛋樹',0.5,'草','超',95,95,85,125,65,55,17,0);

INSERT INTO Pokemon
VALUES (104,'可拉可拉',0.5,'地','null',50,50,95,40,50,35,26,18);

INSERT INTO Pokemon
VALUES (105,'嗄拉嗄拉',0.5,'地','null',60,80,110,50,80,45,26,18);

INSERT INTO Pokemon
VALUES (106,'沙瓦郎',1.0,'格','null',50,120,53,35,110,87,21,0);

INSERT INTO Pokemon
VALUES (107,'艾比郎',1.0,'格','null',50,105,79,35,110,76,8,0);

INSERT INTO Pokemon
VALUES (108,'大舌頭',0.5,'普','null',90,55,75,60,75,30,28,0);

INSERT INTO Pokemon
VALUES (109,'瓦斯彈',0.5,'毒','null',40,65,95,60,45,35,33,0);

INSERT INTO Pokemon
VALUES (110,'雙彈瓦斯',0.5,'毒','null',65,90,120,85,70,60,33,0);

INSERT INTO Pokemon
VALUES (111,'鐵甲犀牛',0.5,'地','岩',80,85,95,30,30,25,26,0);

INSERT INTO Pokemon
VALUES (112,'鐵甲暴龍',0.5,'地','岩',105,130,120,45,45,40,26,0);

INSERT INTO Pokemon
VALUES (113,'吉利蛋',0.0,'普','null',250,5,5,35,105,50,36,0);

INSERT INTO Pokemon
VALUES (114,'蔓藤怪',0.5,'草','null',65,55,115,100,40,60,17,0);

INSERT INTO Pokemon
VALUES (115,'袋龍',0.0,'普','null',105,95,80,40,80,90,37,0);

INSERT INTO Pokemon
VALUES (116,'墨海馬',0.5,'水','null',30,40,70,70,25,60,38,0);

INSERT INTO Pokemon
VALUES (117,'海刺龍',0.5,'水','null',55,65,95,95,45,85,13,0);

INSERT INTO Pokemon
VALUES (118,'角金魚',0.5,'水','null',45,64,60,35,50,63,38,0);

INSERT INTO Pokemon
VALUES (119,'金魚王',0.5,'水','null',80,92,65,65,80,65,38,0);

INSERT INTO Pokemon
VALUES (120,'海星星',2.0,'水','null',30,45,55,70,55,85,36,19);

INSERT INTO Pokemon
VALUES (121,'寶石海星',2.0,'水','超',60,75,85,100,85,115,36,19);

INSERT INTO Pokemon
VALUES (122,'吸盤魔偶',0.5,'超','null',40,45,65,100,120,90,39,0);

INSERT INTO Pokemon
VALUES (123,'飛天螳螂',0.5,'蟲','飛',70,110,80,55,80,105,7,0);

INSERT INTO Pokemon
VALUES (124,'迷唇姊',0.0,'冰','超',65,50,35,115,95,95,28,0);

INSERT INTO Pokemon
VALUES (125,'電擊獸',0.8,'雷','null',65,83,57,95,85,105,11,0);

INSERT INTO Pokemon
VALUES (126,'鴨嘴火龍',0.8,'火','null',65,95,57,100,85,93,40,0);

INSERT INTO Pokemon
VALUES (127,'大甲',0.5,'蟲','null',65,125,100,55,70,85,41,0);

INSERT INTO Pokemon
VALUES (128,'肯泰羅',1.0,'普','null',75,100,95,40,70,110,10,0);

INSERT INTO Pokemon
VALUES (129,'鯉魚王',0.5,'水','null',20,10,55,15,20,80,38,0);

INSERT INTO Pokemon
VALUES (130,'暴鯉龍',0.5,'水','飛',95,125,79,60,100,81,10,0);

INSERT INTO Pokemon
VALUES (131,'乘龍',0.5,'水','冰',130,85,80,85,95,60,32,0);

INSERT INTO Pokemon
VALUES (132,'百變怪',2.0,'普','null',48,48,48,48,48,48,21,0);

INSERT INTO Pokemon
VALUES (133,'伊布',0.9,'普','null',55,55,50,45,65,55,27,0);

INSERT INTO Pokemon
VALUES (134,'水精靈',0.9,'水','null',130,65,60,110,95,65,42,0);

INSERT INTO Pokemon
VALUES (135,'雷精靈',0.9,'雷','null',65,65,60,110,95,130,43,0);

INSERT INTO Pokemon
VALUES (136,'火精靈',0.9,'火','null',65,130,60,95,110,65,15,0);

INSERT INTO Pokemon
VALUES (137,'３Ｄ龍',2.0,'普','null',65,60,70,85,75,40,44,0);

INSERT INTO Pokemon
VALUES (138,'菊石獸',0.9,'水','岩',35,40,100,90,55,35,38,0);

INSERT INTO Pokemon
VALUES (139,'多刺菊石獸',0.9,'水','岩',70,60,125,115,70,55,38,0);

INSERT INTO Pokemon
VALUES (140,'化石盔',0.9,'岩','水',30,80,90,55,45,55,38,0);

INSERT INTO Pokemon
VALUES (141,'鐮刀盔',0.9,'岩','水',60,115,105,65,70,80,38,0);

INSERT INTO Pokemon
VALUES (142,'化石翼龍',0.9,'岩','飛',80,105,65,60,75,130,45,0);

INSERT INTO Pokemon
VALUES (143,'卡比獸',0.9,'普','null',160,110,65,65,110,30,30,20);

INSERT INTO Pokemon
VALUES (144,'急凍鳥',2.0,'冰','飛',90,85,100,95,125,85,45,0);

INSERT INTO Pokemon
VALUES (145,'閃電鳥',2.0,'雷','飛',90,90,85,125,90,100,45,0);

INSERT INTO Pokemon
VALUES (146,'火焰鳥',2.0,'火','飛',90,100,90,125,85,90,45,0);

INSERT INTO Pokemon
VALUES (147,'迷你龍',0.5,'龍','null',41,64,45,50,50,50,5,0);

INSERT INTO Pokemon
VALUES (148,'哈克龍',0.5,'龍','null',61,84,65,70,70,70,5,21);

INSERT INTO Pokemon
VALUES (149,'快龍',0.5,'龍','飛',91,134,95,100,100,80,16,21);

INSERT INTO Pokemon
VALUES (150,'超夢',2.0,'超','null',106,110,90,154,90,130,45,0);

INSERT INTO Pokemon
VALUES (151,'夢幻',2.0,'超','null',100,100,100,100,100,100,24,0);




INSERT INTO Item
VALUES (0,'沒有',1);

INSERT INTO Item
VALUES (1,'銀色的粉',0.05);

INSERT INTO Item
VALUES (2,'毒針',0.05);

INSERT INTO Item
VALUES (3,'黃金果',0.05);

INSERT INTO Item
VALUES (4,'尖銳鳥嘴',0.05);

INSERT INTO Item
VALUES (5,'月之石',0.05);

INSERT INTO Item
VALUES (6,'燃燒果',0.5);

INSERT INTO Item
VALUES (7,'樹果',0.5);

INSERT INTO Item
VALUES (8,'磨菇',0.5);

INSERT INTO Item
VALUES (9,'金色珠',0.05);

INSERT INTO Item
VALUES (10,'彎曲的湯匙',0.05);

INSERT INTO Item
VALUES (11,'專注腰帶',0.05);

INSERT INTO Item
VALUES (12,'堅硬的石頭',0.05);

INSERT INTO Item
VALUES (13,'磁鐵',0.05);

INSERT INTO Item
VALUES (14,'蔥',0.05);

INSERT INTO Item
VALUES (15,'冰凍果',0.05);

INSERT INTO Item
VALUES (16,'珍珠',0.5);

INSERT INTO Item
VALUES (17,'詛咒符咒',0.05);

INSERT INTO Item
VALUES (18,'骨頭',0.05);

INSERT INTO Item
VALUES (19,'星之碎片',0.05);

INSERT INTO Item
VALUES (20,'睡眠果',1);

INSERT INTO Item
VALUES (21,'龍之牙',0.05);





INSERT INTO Ability
VALUES (1,'翠綠','HP低於1/3時，草系招式威力*1.5');

INSERT INTO Ability
VALUES (2,'猛火','HP低於1/3時，火系招式威力*1.5');

INSERT INTO Ability
VALUES (3,'激流','HP低於1/3時，水系招式威力*1.5');

INSERT INTO Ability
VALUES (4,'鱗粉','不受被攻擊的追加效果影響');

INSERT INTO Ability
VALUES (5,'脫皮','每回合有30%機會回復異常狀態');

INSERT INTO Ability
VALUES (6,'複眼','命中*1.3，增加遇到帶有道具的野生精靈機會率');

INSERT INTO Ability
VALUES (7,'蟲之預感','HP低於1/3時，蟲系招式威力*1.5');

INSERT INTO Ability
VALUES (8,'銳利目光','不會被別人下降命中');

INSERT INTO Ability
VALUES (9,'根性','異常狀態時，攻擊*1.5');

INSERT INTO Ability
VALUES (10,'威嚇','出場時，令對手場上的精靈攻擊下降一個等級');

INSERT INTO Ability
VALUES (11,'靜電','受到近身招式攻擊時，有30%機會令攻擊者麻痺');

INSERT INTO Ability
VALUES (12,'沙遁','風沙時，不受風沙所傷，別人攻擊自己時命中*0.8');

INSERT INTO Ability
VALUES (13,'毒刺','受到近身招式攻擊時，有30%機會令攻擊者中毒');

INSERT INTO Ability
VALUES (14,'誘人身體','受到近身招式攻擊時，有30%機會令攻擊者迷惑');

INSERT INTO Ability
VALUES (15,'耐火','受到火系招式攻擊時，不受傷害及使用火系招式威力*1.5');

INSERT INTO Ability
VALUES (16,'精神力','不會膽怯');

INSERT INTO Ability
VALUES (17,'葉綠素','天晴時，速度*2');

INSERT INTO Ability
VALUES (18,'苞子','受到近身招式攻擊時，有10%機會令攻擊者麻痺、中毒或睡眠');

INSERT INTO Ability
VALUES (19,'咬腳','令對手場上的精靈不能逃走，但飛行系及浮游特性精靈除外');

INSERT INTO Ability
VALUES (20,'拾荒','戰鬥後有10%機會裝備著道具');

INSERT INTO Ability
VALUES (21,'柔軟','不會被麻痺');

INSERT INTO Ability
VALUES (22,'潮濕','令在場的精靈無法自爆');

INSERT INTO Ability
VALUES (23,'鬥志','不會睡眠');

INSERT INTO Ability
VALUES (24,'同步','受到招式影響而中毒、麻痺、燒傷時，會傳染給攻擊者');

INSERT INTO Ability
VALUES (25,'清晰身體','不會被別人下降能力');

INSERT INTO Ability
VALUES (26,'石頭','攻擊命中時自己亦承受部份傷害的招式，不用承受反作用傷害');

INSERT INTO Ability
VALUES (27,'逃足','必定能從野生戰鬥中逃走');

INSERT INTO Ability
VALUES (28,'遲鈍','不會被迷惑');

INSERT INTO Ability
VALUES (29,'磁力','令對手場上的鋼系精靈不能逃走');

INSERT INTO Ability
VALUES (30,'厚脂肪','受到的火、冰系招式的威力減半');

INSERT INTO Ability
VALUES (31,'惡臭','是第一隻手持精靈時，遇到野生精靈機會率*1/2');

INSERT INTO Ability
VALUES (32,'貝殼盔甲','不會被命中要害');

INSERT INTO Ability
VALUES (33,'浮游','不會被地面系招式擊中');

INSERT INTO Ability
VALUES (34,'不眠','不會睡眠');

INSERT INTO Ability
VALUES (35,'怪力鉗','不會被別人下降攻擊');

INSERT INTO Ability
VALUES (36,'自然回復','換人時，自動回復異常狀態');

INSERT INTO Ability
VALUES (37,'早起','睡眠狀態維持時間減半');

INSERT INTO Ability
VALUES (38,'濕滑','下雨時，速度*2');

INSERT INTO Ability
VALUES (39,'防音','不受聲音招式影響');

INSERT INTO Ability
VALUES (40,'炎之身體','受到近身招式攻擊時，有30%機會令攻擊者燒傷');

INSERT INTO Ability
VALUES (41,'怪力鉗','不會被別人下降攻擊');

INSERT INTO Ability
VALUES (42,'儲水','被水系招式攻擊時，不受傷害及回復最大HP的1/4');

INSERT INTO Ability
VALUES (43,'充電','被雷系招式攻擊時，不受傷害及回復最大HP的1/4');

INSERT INTO Ability
VALUES (44,'追蹤','出場時，複製對手場上其中一個精靈的特性');

INSERT INTO Ability
VALUES (45,'壓力','受到攻擊的招式，消耗多1點PP');





INSERT INTO Region
VALUES (1,'1號道路','道路');

INSERT INTO Region
VALUES (2,'2號道路','道路');

INSERT INTO Region
VALUES (3,'3號道路','道路');

INSERT INTO Region
VALUES (4,'4號道路','道路');

INSERT INTO Region
VALUES (5,'5號道路','道路');

INSERT INTO Region
VALUES (6,'6號道路','道路');

INSERT INTO Region
VALUES (7,'7號道路','道路');

INSERT INTO Region
VALUES (8,'8號道路','道路');

INSERT INTO Region
VALUES (9,'9號道路','道路');

INSERT INTO Region
VALUES (10,'10號道路','道路');

INSERT INTO Region
VALUES (11,'11號道路','道路');

INSERT INTO Region
VALUES (12,'12號道路','道路');

INSERT INTO Region
VALUES (13,'13號道路','道路');

INSERT INTO Region
VALUES (14,'14號道路','道路');

INSERT INTO Region
VALUES (15,'15號道路','道路');

INSERT INTO Region
VALUES (16,'16號道路','道路');

INSERT INTO Region
VALUES (17,'17號道路','道路');

INSERT INTO Region
VALUES (18,'18號道路','道路');

INSERT INTO Region
VALUES (19,'19號水道','水道');

INSERT INTO Region
VALUES (20,'20號水道','水道');

INSERT INTO Region
VALUES (21,'21號水道','水道');

INSERT INTO Region
VALUES (22,'22號道路','道路');

INSERT INTO Region
VALUES (23,'23號道路','道路');

INSERT INTO Region
VALUES (24,'24號道路','道路');

INSERT INTO Region
VALUES (25,'25號道路','道路');

INSERT INTO Region
VALUES (26,'常磐森林','森林');

INSERT INTO Region
VALUES (27,'地鼠洞','山洞');

INSERT INTO Region
VALUES (28,'月見山','山洞');

INSERT INTO Region
VALUES (29,'華藍洞','山洞');

INSERT INTO Region
VALUES (30,'岩山隧道','山洞');

INSERT INTO Region
VALUES (31,'神奇寶貝塔','塔');

INSERT INTO Region
VALUES (32,'野生原野區','道路');






INSERT INTO Locations
VALUES (1,16,1,0.70,1);

INSERT INTO Locations
VALUES (2,19,1,0.30,1);

INSERT INTO Locations
VALUES (3,16,2,0.30,1);

INSERT INTO Locations
VALUES (4,19,2,0.40,1);

INSERT INTO Locations
VALUES (5,29,2,0.15,1);

INSERT INTO Locations
VALUES (6,32,2,0.15,1);

INSERT INTO Locations
VALUES (7,21,3,0.55,1);

INSERT INTO Locations
VALUES (8,19,3,0.15,1);

INSERT INTO Locations
VALUES (9,27,3,0.15,1);

INSERT INTO Locations
VALUES (10,56,3,0.15,1);

INSERT INTO Locations
VALUES (11,21,4,0.55,1);

INSERT INTO Locations
VALUES (12,19,4,0.15,1);

INSERT INTO Locations
VALUES (13,27,4,0.15,1);

INSERT INTO Locations
VALUES (14,56,4,0.15,1);

INSERT INTO Locations
VALUES (15,16,5,0.45,1);

INSERT INTO Locations
VALUES (16,19,5,0.25,1);

INSERT INTO Locations
VALUES (17,63,5,0.15,1);

INSERT INTO Locations
VALUES (18,39,5,0.10,1);

INSERT INTO Locations
VALUES (19,17,5,0.05,1);

INSERT INTO Locations
VALUES (20,16,6,0.45,1);

INSERT INTO Locations
VALUES (21,19,6,0.25,1);

INSERT INTO Locations
VALUES (22,63,6,0.15,1);

INSERT INTO Locations
VALUES (23,39,6,0.10,1);

INSERT INTO Locations
VALUES (24,17,6,0.05,1);

INSERT INTO Locations
VALUES (25,54,6,0.95,2);

INSERT INTO Locations
VALUES (26,55,6,0.05,2);

INSERT INTO Locations
VALUES (27,129,6,1.00,3);

INSERT INTO Locations
VALUES (28,60,6,0.50,4);

INSERT INTO Locations
VALUES (29,118,6,0.50,4);

INSERT INTO Locations
VALUES (30,118,6,1.00,5);

INSERT INTO Locations
VALUES (31,16,7,0.40,1);

INSERT INTO Locations
VALUES (32,63,7,0.25,1);

INSERT INTO Locations
VALUES (33,19,7,0.15,1);

INSERT INTO Locations
VALUES (34,17,7,0.10,1);

INSERT INTO Locations
VALUES (35,39,7,0.10,1);

INSERT INTO Locations
VALUES (36,16,8,0.40,1);

INSERT INTO Locations
VALUES (37,63,8,0.20,1);

INSERT INTO Locations
VALUES (38,19,8,0.15,1);

INSERT INTO Locations
VALUES (39,17,8,0.10,1);

INSERT INTO Locations
VALUES (40,39,8,0.10,1);

INSERT INTO Locations
VALUES (41,64,8,0.05,1);

INSERT INTO Locations
VALUES (42,32,9,0.35,1);

INSERT INTO Locations
VALUES (43,29,9,0.35,1);

INSERT INTO Locations
VALUES (44,19,9,0.15,1);

INSERT INTO Locations
VALUES (45,21,9,0.10,1);

INSERT INTO Locations
VALUES (46,33,9,0.05,1);

INSERT INTO Locations
VALUES (47,30,9,0.05,1);

INSERT INTO Locations
VALUES (48,20,9,0.04,1);

INSERT INTO Locations
VALUES (49,22,9,0.01,1);

INSERT INTO Locations
VALUES (50,100,10,0.45,1);

INSERT INTO Locations
VALUES (51,21,10,0.30,1);

INSERT INTO Locations
VALUES (52,23,10,0.25,1);

INSERT INTO Locations
VALUES (53,129,10,1.00,3);

INSERT INTO Locations
VALUES (54,60,10,0.50,4);

INSERT INTO Locations
VALUES (55,118,10,0.50,4);

INSERT INTO Locations
VALUES (56,98,10,0.70,5);

INSERT INTO Locations
VALUES (57,116,10,0.20,5);

INSERT INTO Locations
VALUES (58,99,10,0.10,5);

INSERT INTO Locations
VALUES (59,16,11,0.40,1);

INSERT INTO Locations
VALUES (60,19,11,0.25,1);

INSERT INTO Locations
VALUES (61,96,11,0.24,1);

INSERT INTO Locations
VALUES (62,17,11,0.10,1);

INSERT INTO Locations
VALUES (63,20,11,0.01,1);

INSERT INTO Locations
VALUES (64,43,12,0.35,1);

INSERT INTO Locations
VALUES (65,69,12,0.25,1);

INSERT INTO Locations
VALUES (66,16,12,0.15,1);

INSERT INTO Locations
VALUES (67,17,12,0.10,1);

INSERT INTO Locations
VALUES (68,44,12,0.05,1);

INSERT INTO Locations
VALUES (69,70,12,0.05,1);

INSERT INTO Locations
VALUES (70,83,12,0.05,1);

INSERT INTO Locations
VALUES (71,79,12,0.95,2);

INSERT INTO Locations
VALUES (72,80,12,0.05,2);

INSERT INTO Locations
VALUES (73,129,12,1.00,3);

INSERT INTO Locations
VALUES (74,60,12,0.50,4);

INSERT INTO Locations
VALUES (75,118,12,0.50,4);

INSERT INTO Locations
VALUES (76,116,12,0.70,5);

INSERT INTO Locations
VALUES (77,117,12,0.30,5);

INSERT INTO Locations
VALUES (78,43,13,0.35,1);

INSERT INTO Locations
VALUES (79,69,13,0.25,1);

INSERT INTO Locations
VALUES (80,17,13,0.15,1);

INSERT INTO Locations
VALUES (81,16,13,0.10,1);

INSERT INTO Locations
VALUES (82,44,13,0.05,1);

INSERT INTO Locations
VALUES (83,70,13,0.05,1);

INSERT INTO Locations
VALUES (84,83,13,0.05,1);

INSERT INTO Locations
VALUES (85,79,13,0.95,2);

INSERT INTO Locations
VALUES (86,80,13,0.05,2);

INSERT INTO Locations
VALUES (87,129,13,1.00,3);

INSERT INTO Locations
VALUES (88,60,13,0.50,4);

INSERT INTO Locations
VALUES (89,118,13,0.50,4);

INSERT INTO Locations
VALUES (90,116,13,0.70,5);

INSERT INTO Locations
VALUES (91,72,13,0.20,5);

INSERT INTO Locations
VALUES (92,117,13,0.10,5);

INSERT INTO Locations
VALUES (93,43,14,0.35,1);

INSERT INTO Locations
VALUES (94,69,14,0.25,1);

INSERT INTO Locations
VALUES (95,48,14,0.19,1);

INSERT INTO Locations
VALUES (96,17,14,0.10,1);

INSERT INTO Locations
VALUES (97,44,14,0.05,1);

INSERT INTO Locations
VALUES (98,70,14,0.05,1);

INSERT INTO Locations
VALUES (99,49,14,0.01,1);

INSERT INTO Locations
VALUES (100,43,15,0.35,1);

INSERT INTO Locations
VALUES (101,69,15,0.25,1);

INSERT INTO Locations
VALUES (102,48,15,0.19,1);

INSERT INTO Locations
VALUES (103,17,15,0.10,1);

INSERT INTO Locations
VALUES (104,70,15,0.05,1);

INSERT INTO Locations
VALUES (105,44,15,0.05,1);

INSERT INTO Locations
VALUES (106,49,15,0.01,1);

INSERT INTO Locations
VALUES (107,84,16,0.35,1);

INSERT INTO Locations
VALUES (108,21,16,0.30,1);

INSERT INTO Locations
VALUES (109,19,16,0.25,1);

INSERT INTO Locations
VALUES (110,20,16,0.05,1);

INSERT INTO Locations
VALUES (111,22,16,0.05,1);

INSERT INTO Locations
VALUES (112,84,17,0.55,1);

INSERT INTO Locations
VALUES (113,77,17,0.24,1);

INSERT INTO Locations
VALUES (114,22,17,0.20,1);

INSERT INTO Locations
VALUES (115,85,17,0.01,1);

INSERT INTO Locations
VALUES (116,129,17,1.00,3);

INSERT INTO Locations
VALUES (117,60,17,0.50,4);

INSERT INTO Locations
VALUES (118,118,17,0.50,4);

INSERT INTO Locations
VALUES (119,72,17,0.70,5);

INSERT INTO Locations
VALUES (120,90,17,0.30,5);

INSERT INTO Locations
VALUES (121,84,18,0.35,1);

INSERT INTO Locations
VALUES (122,21,18,0.30,1);

INSERT INTO Locations
VALUES (123,19,18,0.25,1);

INSERT INTO Locations
VALUES (124,20,18,0.05,1);

INSERT INTO Locations
VALUES (125,22,18,0.05,1);

INSERT INTO Locations
VALUES (126,129,18,1.00,3);

INSERT INTO Locations
VALUES (127,60,18,0.50,4);

INSERT INTO Locations
VALUES (128,118,18,0.50,4);

INSERT INTO Locations
VALUES (129,90,18,0.60,5);

INSERT INTO Locations
VALUES (130,72,18,0.40,5);

INSERT INTO Locations
VALUES (131,72,19,1.00,2);

INSERT INTO Locations
VALUES (132,129,19,1.00,3);

INSERT INTO Locations
VALUES (133,60,19,0.50,4);

INSERT INTO Locations
VALUES (134,118,19,0.50,4);

INSERT INTO Locations
VALUES (135,72,19,0.60,5);

INSERT INTO Locations
VALUES (136,120,19,0.30,5);

INSERT INTO Locations
VALUES (137,93,19,0.10,5);

INSERT INTO Locations
VALUES (138,72,20,1.00,2);

INSERT INTO Locations
VALUES (139,129,20,1.00,3);

INSERT INTO Locations
VALUES (140,60,20,0.50,4);

INSERT INTO Locations
VALUES (141,118,20,0.50,4);

INSERT INTO Locations
VALUES (142,72,20,0.40,5);

INSERT INTO Locations
VALUES (143,73,20,0.40,5);

INSERT INTO Locations
VALUES (144,120,20,0.20,5);

INSERT INTO Locations
VALUES (145,16,21,0.60,1);

INSERT INTO Locations
VALUES (146,19,21,0.25,1);

INSERT INTO Locations
VALUES (147,17,21,0.10,1);

INSERT INTO Locations
VALUES (148,20,21,0.05,1);

INSERT INTO Locations
VALUES (149,72,21,1.00,2);

INSERT INTO Locations
VALUES (150,129,21,1.00,3);

INSERT INTO Locations
VALUES (151,60,21,0.50,4);

INSERT INTO Locations
VALUES (152,118,21,0.50,4);

INSERT INTO Locations
VALUES (153,72,21,0.60,5);

INSERT INTO Locations
VALUES (154,120,21,0.30,5);

INSERT INTO Locations
VALUES (155,73,21,0.10,5);

INSERT INTO Locations
VALUES (156,32,22,0.35,1);

INSERT INTO Locations
VALUES (157,29,22,0.35,1);

INSERT INTO Locations
VALUES (158,56,22,0.20,1);

INSERT INTO Locations
VALUES (159,19,22,0.10,1);

INSERT INTO Locations
VALUES (160,21,22,0.10,1);

INSERT INTO Locations
VALUES (161,129,22,1.00,3);

INSERT INTO Locations
VALUES (162,60,22,0.50,4);

INSERT INTO Locations
VALUES (163,118,22,0.50,4);

INSERT INTO Locations
VALUES (164,60,22,0.90,5);

INSERT INTO Locations
VALUES (165,61,22,0.10,5);

INSERT INTO Locations
VALUES (166,33,23,0.35,1);

INSERT INTO Locations
VALUES (167,30,23,0.25,1);

INSERT INTO Locations
VALUES (168,56,23,0.20,1);

INSERT INTO Locations
VALUES (169,22,23,0.15,1);

INSERT INTO Locations
VALUES (170,57,23,0.05,1);

INSERT INTO Locations
VALUES (171,129,23,1.00,3);

INSERT INTO Locations
VALUES (172,60,23,0.50,4);

INSERT INTO Locations
VALUES (173,118,23,0.50,4);

INSERT INTO Locations
VALUES (174,60,23,0.70,5);

INSERT INTO Locations
VALUES (175,61,23,0.30,5);

INSERT INTO Locations
VALUES (176,43,24,0.35,1);

INSERT INTO Locations
VALUES (177,16,24,0.29,1);

INSERT INTO Locations
VALUES (178,69,24,0.25,1);

INSERT INTO Locations
VALUES (179,48,24,0.10,1);

INSERT INTO Locations
VALUES (180,17,24,0.01,1);

INSERT INTO Locations
VALUES (181,129,24,1.00,3);

INSERT INTO Locations
VALUES (182,60,24,0.50,4);

INSERT INTO Locations
VALUES (183,118,24,0.50,4);

INSERT INTO Locations
VALUES (184,118,24,0.70,5);

INSERT INTO Locations
VALUES (185,119,24,0.30,5);

INSERT INTO Locations
VALUES (186,43,25,0.35,1);

INSERT INTO Locations
VALUES (187,16,25,0.29,1);

INSERT INTO Locations
VALUES (188,69,25,0.25,1);

INSERT INTO Locations
VALUES (189,48,25,0.10,1);

INSERT INTO Locations
VALUES (190,17,25,0.01,1);

INSERT INTO Locations
VALUES (191,129,25,1.00,3);

INSERT INTO Locations
VALUES (192,60,25,0.50,4);

INSERT INTO Locations
VALUES (193,118,25,0.50,4);

INSERT INTO Locations
VALUES (194,98,25,0.70,5);

INSERT INTO Locations
VALUES (195,99,25,0.30,5);

INSERT INTO Locations
VALUES (196,10,26,0.55,1);

INSERT INTO Locations
VALUES (197,16,26,0.24,1);

INSERT INTO Locations
VALUES (198,11,26,0.20,1);

INSERT INTO Locations
VALUES (199,17,26,0.01,1);

INSERT INTO Locations
VALUES (200,50,27,0.95,1);

INSERT INTO Locations
VALUES (201,51,27,0.05,1);

INSERT INTO Locations
VALUES (202,41,28,0.60,1);

INSERT INTO Locations
VALUES (203,74,28,0.15,1);

INSERT INTO Locations
VALUES (204,46,28,0.15,1);

INSERT INTO Locations
VALUES (205,35,28,0.10,1);

INSERT INTO Locations
VALUES (206,42,29,0.40,1);

INSERT INTO Locations
VALUES (207,75,29,0.15,1);

INSERT INTO Locations
VALUES (208,132,29,0.10,1);

INSERT INTO Locations
VALUES (209,28,29,0.10,1);

INSERT INTO Locations
VALUES (210,111,29,0.10,1);

INSERT INTO Locations
VALUES (211,112,29,0.05,1);

INSERT INTO Locations
VALUES (212,44,29,0.05,1);

INSERT INTO Locations
VALUES (213,70,29,0.05,1);

INSERT INTO Locations
VALUES (214,150,29,1.00,1);

INSERT INTO Locations
VALUES (215,41,30,0.45,1);

INSERT INTO Locations
VALUES (216,74,30,0.25,1);

INSERT INTO Locations
VALUES (217,66,30,0.20,1);

INSERT INTO Locations
VALUES (218,95,30,0.10,1);

INSERT INTO Locations
VALUES (219,92,31,0.75,1);

INSERT INTO Locations
VALUES (220,93,31,0.15,1);

INSERT INTO Locations
VALUES (221,104,31,0.10,1);

INSERT INTO Locations
VALUES (222,32,32,0.25,1);

INSERT INTO Locations
VALUES (223,102,32,0.20,1);

INSERT INTO Locations
VALUES (224,29,32,0.15,1);

INSERT INTO Locations
VALUES (225,33,32,0.10,1);

INSERT INTO Locations
VALUES (226,104,32,0.10,1);

INSERT INTO Locations
VALUES (227,128,32,0.10,1);

INSERT INTO Locations
VALUES (228,105,32,0.05,1);

INSERT INTO Locations
VALUES (229,127,32,0.04,1);

INSERT INTO Locations
VALUES (230,114,32,0.01,1);

INSERT INTO Locations
VALUES (231,129,32,1.00,3);

INSERT INTO Locations
VALUES (232,60,32,0.50,4);

INSERT INTO Locations
VALUES (233,118,32,0.50,4);

INSERT INTO Locations
VALUES (234,129,32,0.90,5);

INSERT INTO Locations
VALUES (235,147,32,0.10,5);






INSERT INTO Skill
VALUES (1,'撞擊','普',35,35,0.95,'一般攻擊',0);

INSERT INTO Skill
VALUES (2,'鳴叫','普',40,null,1,'令對象攻擊下降一個等級',0);

INSERT INTO Skill
VALUES (3,'寄生樹種子','草',10,null,0.9,'每回合吸取對象最大HP的1/8',0);

INSERT INTO Skill
VALUES (4,'籐鞭','草',10,35,1,'一般攻擊',0);

INSERT INTO Skill
VALUES (5,'毒之粉末','毒',35,null,0.75,'令對象中毒',0);

INSERT INTO Skill
VALUES (6,'催眠粉末','草',15,null,0.75,'令對象睡眠',0);

INSERT INTO Skill
VALUES (7,'葉子飛刀','草',25,55,0.95,'容易擊中對象要害',0);

INSERT INTO Skill
VALUES (8,'香氣','普',20,null,1,'令對象迴避下降一個等級／[冒險]吸引野生精靈',0);

INSERT INTO Skill
VALUES (9,'成長','普',40,null,null,'自己特攻提升一個等級',0);

INSERT INTO Skill
VALUES (10,'光合作用','草',5,null,null,'自己回復最大HP的1/2',0);

INSERT INTO Skill
VALUES (11,'陽光烈焰','草',10,120,1,'一回合準備，次回合攻擊',0);

INSERT INTO Skill
VALUES (12,'搔','普',35,40,1,'一般攻擊',0);

INSERT INTO Skill
VALUES (13,'火苗','火',25,40,1,'10%令對象燃燒',0);

INSERT INTO Skill
VALUES (14,'煙幕','普',20,null,1,'令對象命中下降一個等級',0);

INSERT INTO Skill
VALUES (15,'憤怒','普',20,20,1,'如果受到攻擊，連續使用威力倍增',0);

INSERT INTO Skill
VALUES (16,'怒目而視','普',10,null,0.9,'令對象速度下降兩個等級',0);

INSERT INTO Skill
VALUES (17,'火焰噴射','火',15,95,1,'10%令對象燃燒',0);

INSERT INTO Skill
VALUES (18,'揮砍','普',20,70,1,'容易擊中對象要害',0);

INSERT INTO Skill
VALUES (19,'龍之怒','龍',10,null,1,'給予對象40點的傷害',0);

INSERT INTO Skill
VALUES (20,'火焰漩渦','火',15,15,70,'3~6回合令對象減最大HP的1/16，期間對象不能逃走',0);

INSERT INTO Skill
VALUES (21,'雙翼拍擊','飛',35,60,1,'一般攻擊',0);

INSERT INTO Skill
VALUES (22,'揮舞尾巴','普',30,null,1,'令對象防禦下降一個等級',0);

INSERT INTO Skill
VALUES (23,'泡沫','水',30,20,1,'10%令對象速度下降一個等級',0);

INSERT INTO Skill
VALUES (24,'縮頭','水',40,null,null,'自己防禦提升一個等級',0);

INSERT INTO Skill
VALUES (25,'噴水','水',25,40,1,'一般攻擊',0);

INSERT INTO Skill
VALUES (26,'咬噬','惡',25,60,1,'30%令對象膽怯',0);

INSERT INTO Skill
VALUES (27,'高速旋轉','普',40,20,1,'解除自己受到的綑縛狀態',0);

INSERT INTO Skill
VALUES (28,'保護','普',10,null,null,'可抵擋任何攻擊，但連續使用成功率會下降',3);

INSERT INTO Skill
VALUES (29,'祈雨','水',5,null,null,'5回合內下雨，其間水系招式威力*1.5、火系招式威力*0.5',0);

INSERT INTO Skill
VALUES (30,'火箭頭槌','普',15,100,1,'自己防禦提升一個等級；一回合準備，次回合攻擊',0);

INSERT INTO Skill
VALUES (31,'水柱巨砲','水',5,120,0.8,'一般攻擊',0);

INSERT INTO Skill
VALUES (32,'吐絲','蟲',40,null,0.95,'令對象速度下降一個等級',0);

INSERT INTO Skill
VALUES (33,'僵硬','普',30,null,null,'自己防禦提升一個等級',0);

INSERT INTO Skill
VALUES (34,'念力','超',25,50,1,'10%令對象混亂',0);

INSERT INTO Skill
VALUES (35,'麻痺粉末','草',30,null,0.75,'令對象麻痺',0);

INSERT INTO Skill
VALUES (36,'超音波','普',20,null,0.55,'令對象混亂',0);

INSERT INTO Skill
VALUES (37,'旋風','普',20,null,1,'強制結束與野生精靈的戰鬥',-6);

INSERT INTO Skill
VALUES (38,'翻風','飛',35,40,1,'一般攻擊',0);

INSERT INTO Skill
VALUES (39,'幻象光線','超',20,65,1,'10%令對象混亂',0);

INSERT INTO Skill
VALUES (40,'神秘護符','普',25,null,null,'5回合內不會因別人而得到異常狀態',0);

INSERT INTO Skill
VALUES (41,'銀色之風','蟲',5,60,1,'10%令自己所有能力提升一個等級',0);

INSERT INTO Skill
VALUES (42,'毒針','毒',35,15,1,'30%令對象中毒',0);

INSERT INTO Skill
VALUES (43,'亂針','普',20,15,0.85,'一回合作出2~5次攻擊',0);

INSERT INTO Skill
VALUES (44,'集中力量','普',30,null,null,'使用後攻擊容易擊中對象要害；重複使用無效果',0);

INSERT INTO Skill
VALUES (45,'雙針','蟲',20,25,1,'連續2次攻擊；20%令對象中毒',0);

INSERT INTO Skill
VALUES (46,'追擊','惡',20,40,1,'如果對象交替精靈，在交替前攻擊，給予準備換走精靈2倍傷害',0);

INSERT INTO Skill
VALUES (47,'飛彈針','蟲',20,14,85,'一回合作出2~5次攻擊',0);

INSERT INTO Skill
VALUES (48,'高速移動','超',30,null,null,'自己速度提升兩個等級',0);

INSERT INTO Skill
VALUES (49,'魯莽','普',5,null,1,'對象餘下HP高於自己時，令對象餘下HP等於自己餘下HP的數值',0);

INSERT INTO Skill
VALUES (50,'風沙撥擊','地',15,null,1,'令對象命中下降一個等級',0);

INSERT INTO Skill
VALUES (51,'電光石火','普',30,40,1,'先制攻擊',1);

INSERT INTO Skill
VALUES (52,'雙翼拍擊','飛',35,60,1,'一般攻擊',0);

INSERT INTO Skill
VALUES (53,'羽毛舞','飛',15,null,1,'令對象攻擊下降兩個等級',0);

INSERT INTO Skill
VALUES (54,'鸚鵡學舌','飛',20,null,null,'使用最後受到攻擊的招式',0);

INSERT INTO Skill
VALUES (55,'必殺門牙','普',15,80,0.9,'10%令對象膽怯',0);

INSERT INTO Skill
VALUES (56,'憤怒門牙','普',10,null,0.9,'對象現時HP/2',0);

INSERT INTO Skill
VALUES (57,'啄','飛',35,35,1,'一般攻擊',0);

INSERT INTO Skill
VALUES (58,'瞪眼','普',30,null,1,'令對象防禦下降一個等級',0);

INSERT INTO Skill
VALUES (59,'飛燕疾擊','飛',20,60,null,'一定能擊中對象(對象躲藏不計)',0);

INSERT INTO Skill
VALUES (60,'鑽啄','飛',20,80,1,'一般攻擊',0);

INSERT INTO Skill
VALUES (61,'捲起','普',20,15,0.85,'3~6回合令對象減最大HP的1/16，期間對象不能逃走',0);

INSERT INTO Skill
VALUES (62,'大蛇瞪眼','普',30,null,0.75,'令對象麻痺',0);

INSERT INTO Skill
VALUES (63,'噪音','普',40,null,0.85,'令對象防禦下降兩個等級',0);

INSERT INTO Skill
VALUES (64,'溶解毒液','毒',30,40,1,'10%令對象防禦下降一個等級',0);

INSERT INTO Skill
VALUES (65,'吸氣','普',10,null,null,'儲氣，最多儲三次',0);

INSERT INTO Skill
VALUES (66,'狼吞虎嚥','普',10,null,null,'視吸氣次數回復自己HP',0);

INSERT INTO Skill
VALUES (67,'嘔吐','普',10,100,1,'傷害*吸氣次數',0);

INSERT INTO Skill
VALUES (68,'黑霧','冰',30,null,null,'雙方取消所有能力等級',0);

INSERT INTO Skill
VALUES (69,'電擊','雷',30,40,1,'10%令對象麻痺',0);

INSERT INTO Skill
VALUES (70,'電磁波','雷',20,null,1,'令對象麻痺',0);

INSERT INTO Skill
VALUES (71,'影子分身','普',15,null,null,'自己迴避提升一個等級',0);

INSERT INTO Skill
VALUES (72,'叩擊','普',20,85,0.75,'一般攻擊',0);

INSERT INTO Skill
VALUES (73,'十萬伏特','雷',15,95,1,'10%令對象麻痺',0);

INSERT INTO Skill
VALUES (74,'轟天雷','雷',10,120,0.7,'30%令對象麻痺',0);

INSERT INTO Skill
VALUES (75,'光牆','超',30,null,null,'5回合內我方受到特殊攻擊時傷害*1/2',0);

INSERT INTO Skill
VALUES (76,'變圓','普',40,null,null,'自己防禦提升一個等級',0);

INSERT INTO Skill
VALUES (77,'超速星','普',20,60,null,'一定能擊中對象(對象躲藏不計)',0);

INSERT INTO Skill
VALUES (78,'亂搔','普',15,18,0.8,'一回合作出2~5次攻擊',0);

INSERT INTO Skill
VALUES (79,'風沙漩渦','地',15,15,0.7,'3~6回合令對象減最大HP的1/16，期間對象不能逃走',0);

INSERT INTO Skill
VALUES (80,'暴風沙','岩',10,null,null,'5回合內風沙，雙方精靈每回合減去最大HP的1/16',0);

INSERT INTO Skill
VALUES (81,'連環踢','格',30,30,1,'一回合內作出2次攻擊',1);

INSERT INTO Skill
VALUES (82,'幫助','普',20,null,1,'2v2對戰，令隊友這回合的攻擊傷害*1.5',5);

INSERT INTO Skill
VALUES (83,'煽動','惡',15,null,1,'令對象特攻提升一個等級，但會混亂',0);

INSERT INTO Skill
VALUES (84,'狂咬','惡',15,80,1,'20%令對象特防下降一個等級',0);

INSERT INTO Skill
VALUES (85,'千斤鼎','普',15,85,1,'30%令對象麻痺',0);

INSERT INTO Skill
VALUES (86,'角擊','普',25,65,1,'一般攻擊',0);

INSERT INTO Skill
VALUES (87,'獨角鑽','普',5,null,0.3,'對象即進入瀕死狀態(對象Lv比自己高則無效)',0);

INSERT INTO Skill
VALUES (88,'橫衝直撞','普',20,90,1,'2~3回合連續攻擊，之後自己會混亂(攻擊失誤不計)',0);


INSERT INTO Learn
VALUES (1,1,1,0);

INSERT INTO Learn
VALUES (2,1,2,4);

INSERT INTO Learn
VALUES (3,1,3,7);

INSERT INTO Learn
VALUES (4,1,4,10);

INSERT INTO Learn
VALUES (5,1,5,15);

INSERT INTO Learn
VALUES (6,1,6,15);

INSERT INTO Learn
VALUES (7,1,7,20);

INSERT INTO Learn
VALUES (8,1,8,25);

INSERT INTO Learn
VALUES (9,1,9,32);

INSERT INTO Learn
VALUES (10,1,10,39);

INSERT INTO Learn
VALUES (11,1,11,46);

INSERT INTO Learn
VALUES (12,2,1,0);

INSERT INTO Learn
VALUES (13,2,2,4);

INSERT INTO Learn
VALUES (14,2,3,7);

INSERT INTO Learn
VALUES (15,2,4,10);

INSERT INTO Learn
VALUES (16,2,5,15);

INSERT INTO Learn
VALUES (17,2,6,15);

INSERT INTO Learn
VALUES (18,2,7,22);

INSERT INTO Learn
VALUES (19,2,8,29);

INSERT INTO Learn
VALUES (20,2,9,38);

INSERT INTO Learn
VALUES (21,2,10,47);

INSERT INTO Learn
VALUES (22,2,11,56);

INSERT INTO Learn
VALUES (23,3,1,0);

INSERT INTO Learn
VALUES (24,3,2,4);

INSERT INTO Learn
VALUES (25,3,3,7);

INSERT INTO Learn
VALUES (26,3,4,10);

INSERT INTO Learn
VALUES (27,3,5,15);

INSERT INTO Learn
VALUES (28,3,6,15);

INSERT INTO Learn
VALUES (29,3,7,22);

INSERT INTO Learn
VALUES (30,3,8,29);

INSERT INTO Learn
VALUES (31,3,9,41);

INSERT INTO Learn
VALUES (32,3,10,53);

INSERT INTO Learn
VALUES (33,3,11,65);

INSERT INTO Learn
VALUES (34,4,12,0);

INSERT INTO Learn
VALUES (35,4,2,0);

INSERT INTO Learn
VALUES (36,4,13,7);

INSERT INTO Learn
VALUES (37,4,14,13);

INSERT INTO Learn
VALUES (38,4,15,19);

INSERT INTO Learn
VALUES (39,4,16,25);

INSERT INTO Learn
VALUES (40,4,17,31);

INSERT INTO Learn
VALUES (41,4,18,37);

INSERT INTO Learn
VALUES (42,4,19,43);

INSERT INTO Learn
VALUES (43,4,20,49);

INSERT INTO Learn
VALUES (44,5,12,0);

INSERT INTO Learn
VALUES (45,5,2,0);

INSERT INTO Learn
VALUES (46,5,13,7);

INSERT INTO Learn
VALUES (47,5,14,13);

INSERT INTO Learn
VALUES (48,5,15,20);

INSERT INTO Learn
VALUES (49,5,16,27);

INSERT INTO Learn
VALUES (50,5,17,34);

INSERT INTO Learn
VALUES (51,5,18,41);

INSERT INTO Learn
VALUES (52,5,19,48);

INSERT INTO Learn
VALUES (53,5,20,55);

INSERT INTO Learn
VALUES (54,6,12,0);

INSERT INTO Learn
VALUES (55,6,2,0);

INSERT INTO Learn
VALUES (56,6,13,7);

INSERT INTO Learn
VALUES (57,6,14,13);

INSERT INTO Learn
VALUES (58,6,15,20);

INSERT INTO Learn
VALUES (59,6,16,27);

INSERT INTO Learn
VALUES (60,6,17,34);

INSERT INTO Learn
VALUES (61,6,21,36);

INSERT INTO Learn
VALUES (62,6,18,44);

INSERT INTO Learn
VALUES (63,6,19,54);

INSERT INTO Learn
VALUES (64,6,20,64);

INSERT INTO Learn
VALUES (65,7,1,0);

INSERT INTO Learn
VALUES (66,7,22,4);

INSERT INTO Learn
VALUES (67,7,23,7);

INSERT INTO Learn
VALUES (68,7,24,10);

INSERT INTO Learn
VALUES (69,7,25,13);

INSERT INTO Learn
VALUES (70,7,26,18);

INSERT INTO Learn
VALUES (71,7,27,23);

INSERT INTO Learn
VALUES (72,7,28,28);

INSERT INTO Learn
VALUES (73,7,29,33);

INSERT INTO Learn
VALUES (74,7,30,40);

INSERT INTO Learn
VALUES (75,7,31,47);

INSERT INTO Learn
VALUES (76,8,1,0);

INSERT INTO Learn
VALUES (77,8,22,4);

INSERT INTO Learn
VALUES (78,8,23,7);

INSERT INTO Learn
VALUES (79,8,24,10);

INSERT INTO Learn
VALUES (80,8,25,13);

INSERT INTO Learn
VALUES (81,8,26,19);

INSERT INTO Learn
VALUES (82,8,27,25);

INSERT INTO Learn
VALUES (83,8,28,31);

INSERT INTO Learn
VALUES (84,8,29,37);

INSERT INTO Learn
VALUES (85,8,30,45);

INSERT INTO Learn
VALUES (86,8,31,53);

INSERT INTO Learn
VALUES (87,9,1,0);

INSERT INTO Learn
VALUES (88,9,22,4);

INSERT INTO Learn
VALUES (89,9,23,7);

INSERT INTO Learn
VALUES (90,9,24,10);

INSERT INTO Learn
VALUES (91,9,25,13);

INSERT INTO Learn
VALUES (92,9,26,19);

INSERT INTO Learn
VALUES (93,9,27,25);

INSERT INTO Learn
VALUES (94,9,28,31);

INSERT INTO Learn
VALUES (95,9,29,42);

INSERT INTO Learn
VALUES (96,9,30,55);

INSERT INTO Learn
VALUES (97,9,31,68);

INSERT INTO Learn
VALUES (98,10,1,0);

INSERT INTO Learn
VALUES (99,10,32,0);

INSERT INTO Learn
VALUES (100,11,33,7);

INSERT INTO Learn
VALUES (101,12,34,10);

INSERT INTO Learn
VALUES (102,12,5,13);

INSERT INTO Learn
VALUES (103,12,35,14);

INSERT INTO Learn
VALUES (104,12,6,15);

INSERT INTO Learn
VALUES (105,12,36,18);

INSERT INTO Learn
VALUES (106,12,37,23);

INSERT INTO Learn
VALUES (107,12,38,28);

INSERT INTO Learn
VALUES (108,12,39,34);

INSERT INTO Learn
VALUES (109,12,40,40);

INSERT INTO Learn
VALUES (110,12,41,47);

INSERT INTO Learn
VALUES (111,13,42,0);

INSERT INTO Learn
VALUES (112,13,32,0);

INSERT INTO Learn
VALUES (113,14,33,7);

INSERT INTO Learn
VALUES (114,15,43,10);

INSERT INTO Learn
VALUES (115,15,44,15);

INSERT INTO Learn
VALUES (116,15,45,20);

INSERT INTO Learn
VALUES (117,15,15,25);

INSERT INTO Learn
VALUES (118,15,46,30);

INSERT INTO Learn
VALUES (119,15,47,35);

INSERT INTO Learn
VALUES (120,15,48,40);

INSERT INTO Learn
VALUES (121,15,49,45);

INSERT INTO Learn
VALUES (122,16,1,0);

INSERT INTO Learn
VALUES (123,16,50,5);

INSERT INTO Learn
VALUES (124,16,38,9);

INSERT INTO Learn
VALUES (125,16,51,13);

INSERT INTO Learn
VALUES (126,16,37,19);

INSERT INTO Learn
VALUES (127,16,52,25);

INSERT INTO Learn
VALUES (128,16,53,31);

INSERT INTO Learn
VALUES (129,16,48,39);

INSERT INTO Learn
VALUES (130,16,54,47);

INSERT INTO Learn
VALUES (131,17,1,0);

INSERT INTO Learn
VALUES (132,17,50,5);

INSERT INTO Learn
VALUES (133,17,38,9);

INSERT INTO Learn
VALUES (134,17,51,13);

INSERT INTO Learn
VALUES (135,17,37,20);

INSERT INTO Learn
VALUES (136,17,52,27);

INSERT INTO Learn
VALUES (137,17,53,34);

INSERT INTO Learn
VALUES (138,17,48,43);

INSERT INTO Learn
VALUES (139,17,54,52);

INSERT INTO Learn
VALUES (140,18,1,0);

INSERT INTO Learn
VALUES (141,18,50,5);

INSERT INTO Learn
VALUES (142,18,38,9);

INSERT INTO Learn
VALUES (143,18,51,13);

INSERT INTO Learn
VALUES (144,18,37,20);

INSERT INTO Learn
VALUES (145,18,52,27);

INSERT INTO Learn
VALUES (146,18,53,34);

INSERT INTO Learn
VALUES (147,18,48,48);

INSERT INTO Learn
VALUES (148,18,52,62);

INSERT INTO Learn
VALUES (149,19,1,0);

INSERT INTO Learn
VALUES (150,19,22,0);

INSERT INTO Learn
VALUES (151,19,51,7);

INSERT INTO Learn
VALUES (152,19,55,13);

INSERT INTO Learn
VALUES (153,19,44,20);

INSERT INTO Learn
VALUES (154,19,46,27);

INSERT INTO Learn
VALUES (155,19,56,34);

INSERT INTO Learn
VALUES (156,19,49,41);

INSERT INTO Learn
VALUES (157,20,1,0);

INSERT INTO Learn
VALUES (158,20,22,0);

INSERT INTO Learn
VALUES (159,20,51,7);

INSERT INTO Learn
VALUES (160,20,55,13);

INSERT INTO Learn
VALUES (161,20,44,20);

INSERT INTO Learn
VALUES (162,20,46,30);

INSERT INTO Learn
VALUES (163,20,56,40);

INSERT INTO Learn
VALUES (164,20,49,50);

INSERT INTO Learn
VALUES (165,21,57,0);

INSERT INTO Learn
VALUES (166,21,2,0);

INSERT INTO Learn
VALUES (167,21,58,7);

INSERT INTO Learn
VALUES (168,21,43,13);

INSERT INTO Learn
VALUES (169,21,46,19);

INSERT INTO Learn
VALUES (170,21,59,25);

INSERT INTO Learn
VALUES (171,21,54,31);

INSERT INTO Learn
VALUES (172,21,60,37);

INSERT INTO Learn
VALUES (173,21,48,43);

INSERT INTO Learn
VALUES (174,22,57,0);

INSERT INTO Learn
VALUES (175,22,2,0);

INSERT INTO Learn
VALUES (176,22,58,7);

INSERT INTO Learn
VALUES (177,22,43,13);

INSERT INTO Learn
VALUES (178,22,46,26);

INSERT INTO Learn
VALUES (179,22,54,32);

INSERT INTO Learn
VALUES (180,22,60,40);

INSERT INTO Learn
VALUES (181,22,48,47);

INSERT INTO Learn
VALUES (182,23,61,0);

INSERT INTO Learn
VALUES (183,23,58,0);

INSERT INTO Learn
VALUES (184,23,42,8);

INSERT INTO Learn
VALUES (185,23,26,13);

INSERT INTO Learn
VALUES (186,23,62,20);

INSERT INTO Learn
VALUES (187,23,63,25);

INSERT INTO Learn
VALUES (188,23,64,32);

INSERT INTO Learn
VALUES (189,23,65,37);

INSERT INTO Learn
VALUES (190,23,66,37);

INSERT INTO Learn
VALUES (191,23,67,37);

INSERT INTO Learn
VALUES (192,23,68,44);

INSERT INTO Learn
VALUES (193,24,61,0);

INSERT INTO Learn
VALUES (194,24,58,0);

INSERT INTO Learn
VALUES (195,24,42,8);

INSERT INTO Learn
VALUES (196,24,26,13);

INSERT INTO Learn
VALUES (197,24,62,20);

INSERT INTO Learn
VALUES (198,24,63,28);

INSERT INTO Learn
VALUES (199,24,64,38);

INSERT INTO Learn
VALUES (200,24,65,46);

INSERT INTO Learn
VALUES (201,24,66,46);

INSERT INTO Learn
VALUES (202,24,67,46);

INSERT INTO Learn
VALUES (203,24,68,56);

INSERT INTO Learn
VALUES (204,25,69,0);

INSERT INTO Learn
VALUES (205,25,2,0);

INSERT INTO Learn
VALUES (206,25,22,6);

INSERT INTO Learn
VALUES (207,25,70,8);

INSERT INTO Learn
VALUES (208,25,51,11);

INSERT INTO Learn
VALUES (209,25,71,15);

INSERT INTO Learn
VALUES (210,25,72,20);

INSERT INTO Learn
VALUES (211,25,73,26);

INSERT INTO Learn
VALUES (212,25,48,33);

INSERT INTO Learn
VALUES (213,25,74,41);

INSERT INTO Learn
VALUES (214,25,75,50);

INSERT INTO Learn
VALUES (215,26,69,0);

INSERT INTO Learn
VALUES (216,26,22,0);

INSERT INTO Learn
VALUES (217,26,51,0);

INSERT INTO Learn
VALUES (218,26,73,0);

INSERT INTO Learn
VALUES (219,27,12,0);

INSERT INTO Learn
VALUES (220,27,76,6);

INSERT INTO Learn
VALUES (221,27,50,11);

INSERT INTO Learn
VALUES (222,27,42,17);

INSERT INTO Learn
VALUES (223,27,18,23);

INSERT INTO Learn
VALUES (224,27,77,30);

INSERT INTO Learn
VALUES (225,27,78,37);

INSERT INTO Learn
VALUES (226,27,79,45);

INSERT INTO Learn
VALUES (227,27,80,53);

INSERT INTO Learn
VALUES (228,28,12,0);

INSERT INTO Learn
VALUES (229,28,76,6);

INSERT INTO Learn
VALUES (230,28,50,11);

INSERT INTO Learn
VALUES (231,28,42,17);

INSERT INTO Learn
VALUES (232,28,18,24);

INSERT INTO Learn
VALUES (233,28,77,33);

INSERT INTO Learn
VALUES (234,28,78,42);

INSERT INTO Learn
VALUES (235,28,79,52);

INSERT INTO Learn
VALUES (236,28,80,62);

INSERT INTO Learn
VALUES (237,29,2,0);

INSERT INTO Learn
VALUES (238,29,12,0);

INSERT INTO Learn
VALUES (239,29,22,8);

INSERT INTO Learn
VALUES (240,29,81,12);

INSERT INTO Learn
VALUES (241,29,42,17);

INSERT INTO Learn
VALUES (242,29,26,20);

INSERT INTO Learn
VALUES (243,29,82,23);

INSERT INTO Learn
VALUES (244,29,78,30);

INSERT INTO Learn
VALUES (245,29,83,38);

INSERT INTO Learn
VALUES (246,29,84,47);

INSERT INTO Learn
VALUES (247,30,2,0);

INSERT INTO Learn
VALUES (248,30,12,0);

INSERT INTO Learn
VALUES (249,30,22,8);

INSERT INTO Learn
VALUES (250,30,81,12);

INSERT INTO Learn
VALUES (251,30,42,18);

INSERT INTO Learn
VALUES (252,30,26,22);

INSERT INTO Learn
VALUES (253,30,82,26);

INSERT INTO Learn
VALUES (254,30,78,34);

INSERT INTO Learn
VALUES (255,30,83,43);

INSERT INTO Learn
VALUES (256,30,84,53);

INSERT INTO Learn
VALUES (257,31,12,0);

INSERT INTO Learn
VALUES (258,31,22,0);

INSERT INTO Learn
VALUES (259,31,81,0);

INSERT INTO Learn
VALUES (260,31,42,0);

INSERT INTO Learn
VALUES (261,31,85,23);

INSERT INTO Learn
VALUES (262,32,58,0);

INSERT INTO Learn
VALUES (263,32,57,0);

INSERT INTO Learn
VALUES (264,32,44,8);

INSERT INTO Learn
VALUES (265,32,81,12);

INSERT INTO Learn
VALUES (266,32,42,17);

INSERT INTO Learn
VALUES (267,32,86,20);

INSERT INTO Learn
VALUES (268,32,82,23);

INSERT INTO Learn
VALUES (269,32,43,30);

INSERT INTO Learn
VALUES (270,32,83,38);

INSERT INTO Learn
VALUES (271,32,87,47);

INSERT INTO Learn
VALUES (272,33,58,0);

INSERT INTO Learn
VALUES (273,33,57,0);

INSERT INTO Learn
VALUES (274,33,44,8);

INSERT INTO Learn
VALUES (275,33,81,12);

INSERT INTO Learn
VALUES (276,33,42,18);

INSERT INTO Learn
VALUES (277,33,86,22);

INSERT INTO Learn
VALUES (278,33,82,26);

INSERT INTO Learn
VALUES (279,33,43,34);

INSERT INTO Learn
VALUES (280,33,83,43);

INSERT INTO Learn
VALUES (281,33,87,53);

INSERT INTO Learn
VALUES (282,34,57,0);

INSERT INTO Learn
VALUES (283,34,44,0);

INSERT INTO Learn
VALUES (284,34,81,0);

INSERT INTO Learn
VALUES (285,34,42,0);

INSERT INTO Learn
VALUES (286,34,88,23);

