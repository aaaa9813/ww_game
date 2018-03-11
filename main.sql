-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: main
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Black_market`
--

DROP TABLE IF EXISTS `Black_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Black_market` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `black_name` varchar(10) DEFAULT NULL COMMENT '道具名字',
  `Black_desc` varchar(45) DEFAULT NULL COMMENT '描述',
  `arts_res` varchar(20) DEFAULT NULL COMMENT '美术资源',
  `Stack` int(11) DEFAULT NULL COMMENT '最大对叠数量',
  `effect_id` varchar(45) DEFAULT NULL COMMENT '效果id',
  `effect_Para` varchar(45) DEFAULT NULL COMMENT '效果参数',
  `time_Para` varchar(45) DEFAULT NULL COMMENT '时间参数',
  `Weight` int(4) DEFAULT NULL COMMENT '权重',
  `min` int(1) DEFAULT NULL COMMENT '波动最小值',
  `max` int(1) DEFAULT NULL COMMENT '波动最大值',
  `P_money` int(3) DEFAULT NULL,
  `R_money` int(3) DEFAULT NULL,
  `price` int(5) DEFAULT NULL COMMENT '军团贡献值',
  `flag` int(1) DEFAULT NULL COMMENT '次数刷新道具标记  0表示大众道具    1特殊道具',
  `is_army_goods` tinyint(1) DEFAULT NULL COMMENT '是否是军团黑市商品 1是  0不是  2是每日登录奖励的商品',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TankTechtree_Conf`
--

DROP TABLE IF EXISTS `TankTechtree_Conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TankTechtree_Conf` (
  `id` int(11) NOT NULL,
  `tankId` int(11) DEFAULT NULL,
  `posX` int(11) DEFAULT NULL,
  `posY` int(11) DEFAULT NULL,
  `needMoney` int(11) DEFAULT NULL,
  `fullLevelRMoney` int(11) DEFAULT NULL,
  `nextTank1Id` int(11) DEFAULT NULL,
  `nextTank2Id` int(11) DEFAULT NULL,
  `nextTank3Id` int(11) DEFAULT NULL,
  `engineId` int(11) DEFAULT NULL,
  `engineCanUpNum` int(11) DEFAULT NULL,
  `muzzleId` int(11) DEFAULT NULL,
  `muzzleCanUpNum` int(11) DEFAULT NULL,
  `armorId` int(11) DEFAULT NULL,
  `armorCanUpNum` int(11) DEFAULT NULL,
  `vehicleId` int(11) DEFAULT NULL,
  `vehicleCanUpNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TankUnitItem`
--

DROP TABLE IF EXISTS `TankUnitItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TankUnitItem` (
  `id` int(11) NOT NULL,
  `unitName` text NOT NULL,
  `resourceName` text NOT NULL,
  `starLevel` int(11) NOT NULL,
  `unitType` int(11) NOT NULL,
  `nextUpToId` int(11) DEFAULT NULL,
  `upgradeMoney` int(11) DEFAULT NULL,
  `effProp1Type` int(11) DEFAULT NULL,
  `effProp1Value` int(11) DEFAULT NULL,
  `effProp2Type` int(11) DEFAULT NULL,
  `effProp2Value` int(11) DEFAULT NULL,
  `effProp3Type` int(11) DEFAULT NULL,
  `effProp3Value` int(11) DEFAULT NULL,
  `itemtype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TankUnitItem_0506`
--

DROP TABLE IF EXISTS `TankUnitItem_0506`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TankUnitItem_0506` (
  `id` int(11) NOT NULL,
  `unitName` text NOT NULL,
  `resourceName` text NOT NULL,
  `starLevel` int(11) NOT NULL,
  `unitType` int(11) NOT NULL,
  `nextUpToId` int(11) DEFAULT NULL,
  `upgradeMoney` int(11) DEFAULT NULL,
  `effProp1Type` int(11) DEFAULT NULL,
  `effProp1Value` int(11) DEFAULT NULL,
  `effProp2Type` int(11) DEFAULT NULL,
  `effProp2Value` int(11) DEFAULT NULL,
  `effProp3Type` int(11) DEFAULT NULL,
  `effProp3Value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tank_Develop_List`
--

DROP TABLE IF EXISTS `Tank_Develop_List`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tank_Develop_List` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tankid` int(11) NOT NULL COMMENT 'itemtype中的tankid',
  `open` tinyint(1) NOT NULL COMMENT '是否开启该项研发',
  `fid` int(11) NOT NULL COMMENT '父节点ID',
  `exp` int(11) NOT NULL COMMENT '需要经验值',
  `P_money` int(11) NOT NULL COMMENT '需要金币数量',
  `R_money` int(11) NOT NULL COMMENT '需要钻石数量',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WorldConfig`
--

DROP TABLE IF EXISTS `WorldConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorldConfig` (
  `ID` int(11) NOT NULL,
  `Basephase` int(11) DEFAULT NULL COMMENT '基础改造段位',
  `Basecost` int(11) DEFAULT NULL COMMENT '改造基础费用',
  `Phasetime` int(11) DEFAULT NULL COMMENT '段位倍率',
  `RDdivisor` int(11) DEFAULT NULL COMMENT '研发等级比率',
  `Hthptime` int(11) DEFAULT NULL COMMENT '重战车HP费用倍率',
  `Htatktime` int(11) DEFAULT NULL COMMENT '重战车攻击费用倍率',
  `Htdeftime` int(11) DEFAULT NULL COMMENT '重战车防御费用倍率',
  `Htspdtime` int(11) DEFAULT NULL COMMENT '重战车移动速度费用倍率',
  `Lthptime` int(11) DEFAULT NULL COMMENT '轻战车HP费用倍率',
  `Ltatktime` int(11) DEFAULT NULL COMMENT '轻战车攻击费用倍率',
  `Ltdeftime` int(11) DEFAULT NULL COMMENT '轻战车防御费用倍率',
  `Ltspdtime` int(11) DEFAULT NULL COMMENT '轻战车移动速度费率',
  `Mahptime` int(11) DEFAULT NULL COMMENT '自动炮HP费用倍率',
  `Maatktime` int(11) DEFAULT NULL COMMENT '自动炮攻击费用倍率',
  `Madeftime` int(11) DEFAULT NULL COMMENT '自动炮防御费用倍率',
  `Maspdtime` int(11) DEFAULT NULL COMMENT '自动炮移动速度费用倍率',
  `Wiresu` int(11) DEFAULT NULL COMMENT '胜利常数(0-1000)需要除1000\n',
  `Loresu` int(11) DEFAULT NULL COMMENT '失败常数(0-1000)需要除1000\n',
  `Kafall` int(11) DEFAULT NULL COMMENT '击坠常数',
  `KaDPS` int(11) DEFAULT NULL COMMENT '伤害常数(0-1000)需要除1000',
  `Cosoexp` int(11) DEFAULT NULL COMMENT '个人经验系数 (0-1000)需要除1000',
  `CotaExp` int(11) DEFAULT NULL COMMENT '战车经验系数(0-1000)需要除1000',
  `powermoney` int(11) DEFAULT NULL COMMENT '恢复体力所需钻石 ',
  `bsflushtime` int(11) DEFAULT NULL COMMENT 'blackshop黑市刷新时间间隔',
  `lockpricebase` int(11) DEFAULT NULL COMMENT '锁定价格基数',
  `flushpricebase` int(11) DEFAULT NULL COMMENT '刷新价格基数\n',
  `flush_count` int(11) DEFAULT NULL COMMENT '道具刷新出现特殊道具的次数',
  `army_bsflushtime` int(11) DEFAULT NULL COMMENT '军团黑市刷新时间',
  `login_level_award` varchar(250) DEFAULT NULL COMMENT '每日登录奖励 按玩家级别进行反馈 ',
  `powernum` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `achieve`
--

DROP TABLE IF EXISTS `achieve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achieve` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL COMMENT '成就名称',
  `achieve_desp` varchar(255) NOT NULL COMMENT '成就信息',
  `title_name` char(20) DEFAULT NULL COMMENT '头衔名称',
  `buff_type` int(11) DEFAULT NULL COMMENT 'buff类型',
  `buff_value` int(11) DEFAULT NULL COMMENT 'buff值',
  `achievement_points` int(11) DEFAULT NULL COMMENT '对应的成就点',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=552 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `act_list_cfg`
--

DROP TABLE IF EXISTS `act_list_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_list_cfg` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '活动名称',
  `actnotes` varchar(255) NOT NULL COMMENT '活动描述',
  `roomid` int(11) NOT NULL COMMENT '房间名（不用为0）',
  `jumpmsg` varchar(255) NOT NULL COMMENT '跳转',
  `uid` int(11) NOT NULL COMMENT '目标id',
  `gamemode` int(11) NOT NULL,
  `award_id` int(11) DEFAULT NULL,
  `minlevel` int(11) NOT NULL COMMENT '需要的最小等级',
  `maxlevel` int(11) NOT NULL COMMENT '需要的最大等级',
  `acttype` int(11) NOT NULL COMMENT '活动类型0,正常,１每日',
  `aimdesc` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activetopay`
--

DROP TABLE IF EXISTS `activetopay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activetopay` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `recordtime` datetime NOT NULL COMMENT '统计时间',
  `down` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'other' COMMENT '用户来源',
  `dayactive` int(10) NOT NULL DEFAULT '0' COMMENT '日活跃人数',
  `weekactive` int(10) NOT NULL DEFAULT '0' COMMENT '周活跃人数',
  `monthactive` int(10) NOT NULL DEFAULT '0' COMMENT '月活跃人数',
  `daypay` int(10) NOT NULL DEFAULT '0' COMMENT '日付费人数',
  `weekpay` int(10) NOT NULL DEFAULT '0' COMMENT '周付费人数',
  `monthpay` int(10) NOT NULL DEFAULT '0' COMMENT '月付费人数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordtime` (`recordtime`,`down`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=latin1 COMMENT='付费转化率信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activeuser`
--

DROP TABLE IF EXISTS `activeuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activeuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `recordtime` datetime NOT NULL COMMENT '统计时间',
  `down` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'other' COMMENT '用户来源',
  `dayactive` int(10) NOT NULL DEFAULT '0' COMMENT '日活跃人数',
  `weekactive` int(10) NOT NULL DEFAULT '0' COMMENT '周活跃人数',
  `monthactive` int(10) NOT NULL DEFAULT '0' COMMENT '月活跃人数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordtime` (`recordtime`,`down`)
) ENGINE=MyISAM AUTO_INCREMENT=278 DEFAULT CHARSET=latin1 COMMENT='活跃人数信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `Reward_id` int(11) DEFAULT NULL COMMENT '奖励ＩＤ,可重复',
  `Type` int(11) NOT NULL DEFAULT '0' COMMENT '奖励类型，１:经验，２:P Money, 3:R Money, 4:item',
  `Item_id` int(11) DEFAULT NULL COMMENT '类型为４时有效，表示道具ＩＤ',
  `Describe` int(11) DEFAULT NULL COMMENT '描述',
  `Count` int(11) DEFAULT NULL COMMENT '奖励数量',
  `Hold_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `against`
--

DROP TABLE IF EXISTS `against`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `against` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `down` varchar(20) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userId` varchar(50) NOT NULL,
  `against` int(11) NOT NULL,
  `madeTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `againstTheStatistics`
--

DROP TABLE IF EXISTS `againstTheStatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `againstTheStatistics` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `down` varchar(50) NOT NULL,
  `againstPeopleNum` int(11) DEFAULT NULL,
  `againstInningsNum` int(11) DEFAULT NULL,
  `madeTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ai_condition`
--

DROP TABLE IF EXISTS `ai_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ai_condition` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` text,
  `Group` int(11) DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Odds` int(11) DEFAULT NULL,
  `AI_time` int(11) DEFAULT NULL,
  `Condition` int(11) DEFAULT NULL,
  `Condition_parameter` int(11) DEFAULT NULL,
  `Event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ai_event`
--

DROP TABLE IF EXISTS `ai_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ai_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `instruction` int(11) DEFAULT NULL,
  `instruction_parameter` int(11) DEFAULT NULL,
  `event` int(11) DEFAULT NULL,
  `event_parameter` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ai_info_cfg`
--

DROP TABLE IF EXISTS `ai_info_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ai_info_cfg` (
  `ID` int(11) NOT NULL,
  `ai_name` varchar(45) DEFAULT NULL COMMENT 'ai名称',
  `ai_coating` int(11) DEFAULT '1' COMMENT 'ai涂装',
  `ai_tankid` int(11) DEFAULT '1' COMMENT 'AI坦克ID',
  `ai_national` int(11) DEFAULT '1' COMMENT 'AI国籍(1, 中国; 2, 俄国; 3, 美国; 4, 德国; 5, 法国; 6, 意大利; 7, 日本)\n',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='AI信息配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ai_info_cfg_copy`
--

DROP TABLE IF EXISTS `ai_info_cfg_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ai_info_cfg_copy` (
  `ID` int(11) NOT NULL,
  `ai_name` varchar(45) DEFAULT NULL COMMENT 'ai名称',
  `ai_coating` int(11) DEFAULT '1' COMMENT 'ai涂装',
  `ai_tankid` int(11) DEFAULT '1' COMMENT 'AI坦克ID',
  `ai_national` int(11) DEFAULT '1' COMMENT 'AI国籍(1, 中国; 2, 俄国; 3, 美国; 4, 德国; 5, 法国; 6, 意大利; 7, 日本)\n',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='AI信息配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ai_npc`
--

DROP TABLE IF EXISTS `ai_npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ai_npc` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `map_id` varchar(255) DEFAULT NULL COMMENT '地图ID',
  `ai_grade` varchar(255) DEFAULT NULL COMMENT '难度等级',
  `number` varchar(255) DEFAULT NULL COMMENT 'AI数量',
  `ai_1_id` varchar(255) DEFAULT NULL,
  `ai_1_number` varchar(255) DEFAULT NULL,
  `ai_2_id` varchar(255) DEFAULT NULL,
  `ai_2_number` varchar(255) DEFAULT NULL,
  `ai_3_id` varchar(255) DEFAULT NULL,
  `ai_3_number` varchar(255) DEFAULT NULL,
  `ai_4_id` varchar(255) DEFAULT NULL,
  `ai_4_number` varchar(255) DEFAULT NULL,
  `ai_5_id` varchar(255) DEFAULT NULL,
  `ai_5_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `army_achievement`
--

DROP TABLE IF EXISTS `army_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `army_achievement` (
  `ID` bigint(20) NOT NULL,
  `achieveID` varchar(45) DEFAULT NULL,
  `achieveName` varchar(45) DEFAULT NULL,
  `logoId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `army_base`
--

DROP TABLE IF EXISTS `army_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `army_base` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `army_level` int(5) DEFAULT NULL COMMENT '军团当前等级',
  `min` int(11) DEFAULT NULL COMMENT '军团升级所需经验',
  `army_money` int(5) DEFAULT NULL COMMENT '升级军团等级，消耗的军团的贡献值',
  `army_max` int(11) DEFAULT NULL COMMENT '军团等级上限',
  `army_gold` int(11) DEFAULT NULL COMMENT '每人每日军团捐献上限',
  `people_count` int(11) DEFAULT NULL COMMENT '军团人数上线',
  `army_technology_max` int(11) DEFAULT NULL COMMENT '当前等级军团科技上限',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `army_group`
--

DROP TABLE IF EXISTS `army_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `army_group` (
  `ID` int(11) NOT NULL,
  `armylog` varchar(45) DEFAULT NULL COMMENT '军团log',
  `armyname` varchar(45) DEFAULT NULL COMMENT '军团名字',
  `armypublic` varchar(200) DEFAULT NULL COMMENT '军团公告',
  `armylevel` int(2) DEFAULT NULL COMMENT '军团等级',
  `army_exe` int(11) DEFAULT NULL COMMENT '军团经验  和军团贡献获得途径一样 ',
  `armyintegral` int(8) DEFAULT NULL COMMENT '贡献',
  `armymoney` int(10) DEFAULT NULL COMMENT '储备',
  `honour` varchar(45) DEFAULT NULL COMMENT '荣誉榜',
  `structure` int(5) DEFAULT NULL COMMENT '装甲结构(装甲防御)',
  `streng` int(5) DEFAULT NULL COMMENT '炮塔强化(炮塔转速)',
  `material` int(5) DEFAULT NULL COMMENT '材质研究',
  `track` int(5) DEFAULT NULL COMMENT '履带结构',
  `cartridge` int(5) DEFAULT NULL COMMENT '弹药开发(输出伤害)',
  `cooler` int(5) DEFAULT NULL COMMENT '机械制冷(移动速度)',
  `skill` varchar(45) DEFAULT NULL COMMENT '技能',
  `armyleader` int(3) DEFAULT NULL COMMENT '军团长',
  `armydeputy` varchar(200) NOT NULL COMMENT '副军团长ID（有上限3个）   类似于 607003|610001',
  `president` varchar(200) NOT NULL COMMENT '官员ID（无上线）   类似于 607003|610001',
  `army_apply` varchar(2000) DEFAULT NULL COMMENT '申请加入成员   类似 623001:1399950799|645001:1400132279    第一个为uid：申请时间',
  `membernum` int(11) DEFAULT NULL COMMENT '成员人数',
  `member` varchar(2000) NOT NULL COMMENT '军团成员ID',
  `armyscore` int(11) NOT NULL DEFAULT '0' COMMENT '赛季排行榜依据   类似于 597033|604015|607003|610001|645001  uid分割',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `armyname_UNIQUE` (`armyname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `army_installation_level`
--

DROP TABLE IF EXISTS `army_installation_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `army_installation_level` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `armyId` int(11) NOT NULL COMMENT '军团ID',
  `type` int(11) NOT NULL COMMENT '科技类型',
  `endtime` int(11) NOT NULL COMMENT '科技升级结束时间',
  `endlevel` int(11) NOT NULL COMMENT '升级后的等级',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=836042 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `army_level_popu`
--

DROP TABLE IF EXISTS `army_level_popu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `army_level_popu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(5) DEFAULT NULL,
  `upLevelNeedExp` int(11) DEFAULT NULL,
  `legionMaxNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `army_shop`
--

DROP TABLE IF EXISTS `army_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `army_shop` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `imgName` varchar(10) DEFAULT NULL,
  `needControburte` varchar(10) DEFAULT NULL,
  `needMoney` varchar(10) DEFAULT NULL,
  `describe` varchar(45) DEFAULT NULL,
  `proptyDesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `army_skill`
--

DROP TABLE IF EXISTS `army_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `army_skill` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(10) DEFAULT NULL COMMENT '技能名称',
  `skill_desc` varchar(45) DEFAULT NULL COMMENT '技能简介',
  `skill_money` int(10) DEFAULT NULL COMMENT '研究费用',
  `structure` int(10) DEFAULT NULL COMMENT '军团装甲结构',
  `streng` int(10) DEFAULT NULL COMMENT '军团炮塔强化',
  `material` int(10) DEFAULT NULL COMMENT '军团材质研究',
  `track` int(10) DEFAULT NULL COMMENT '军团履带结构',
  `cartridge` int(10) DEFAULT NULL COMMENT '军团弹药开发',
  `cooler` int(10) DEFAULT NULL COMMENT '军团机械制冷',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arppuinfo`
--

DROP TABLE IF EXISTS `arppuinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arppuinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `recordtime` datetime NOT NULL COMMENT '统计时间',
  `down` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'other' COMMENT '用户来源',
  `daypay` float NOT NULL DEFAULT '0' COMMENT '日arppu',
  `weekpay` float NOT NULL DEFAULT '0' COMMENT '周arppu',
  `monthpay` float NOT NULL DEFAULT '0' COMMENT '月arppu',
  `daynum` int(10) NOT NULL COMMENT '日付费人数',
  `weeknum` int(10) NOT NULL COMMENT '周付费人数',
  `monthnum` int(10) NOT NULL COMMENT '月付费人数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordtime` (`recordtime`,`down`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COMMENT='arppu信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arupinfo`
--

DROP TABLE IF EXISTS `arupinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arupinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `recordtime` datetime NOT NULL COMMENT '统计时间',
  `down` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'other' COMMENT '用户来源',
  `dayarup` float NOT NULL DEFAULT '0' COMMENT '日arup',
  `weekarup` float NOT NULL DEFAULT '0' COMMENT '周arup',
  `montharup` float NOT NULL DEFAULT '0' COMMENT '月arup',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordtime` (`recordtime`,`down`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=latin1 COMMENT='arup信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aura`
--

DROP TABLE IF EXISTS `aura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aura` (
  `ID` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `param1` int(11) NOT NULL,
  `param2` int(11) NOT NULL,
  `param3` int(11) NOT NULL,
  `param4` int(11) NOT NULL,
  `param5` int(11) NOT NULL,
  `param6` int(11) NOT NULL,
  `param7` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_version`
--

DROP TABLE IF EXISTS `b_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `describe` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `enforce` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `click_getaward`
--

DROP TABLE IF EXISTS `click_getaward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `click_getaward` (
  `ID` int(1) NOT NULL AUTO_INCREMENT,
  `uid` int(1) DEFAULT NULL,
  `award_type` varchar(20) DEFAULT NULL COMMENT '奖励类型（login:登陆类 task:任务类 等）',
  `award_minx` varchar(100) DEFAULT NULL COMMENT '奖励明细',
  `award_desc` varchar(100) DEFAULT NULL COMMENT '奖励描述',
  `time` int(1) DEFAULT NULL COMMENT '获得奖励时间',
  `is_receive` tinyint(1) DEFAULT NULL COMMENT '是否领取0没有领取1已领取',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=60780 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coating_cost`
--

DROP TABLE IF EXISTS `coating_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coating_cost` (
  `ID` int(11) NOT NULL,
  `coating_ID` int(11) NOT NULL COMMENT '涂装ID',
  `P_money` int(11) NOT NULL COMMENT '金币消耗',
  `R_money` int(11) NOT NULL COMMENT '钻石消耗',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `ID` int(11) DEFAULT NULL,
  `ap_max` int(11) DEFAULT NULL,
  `ep_max` int(11) DEFAULT NULL,
  `moving_speed_max` int(11) DEFAULT NULL,
  `accuracy_min` int(11) DEFAULT NULL,
  `accuracy_max` int(11) DEFAULT NULL,
  `attack` int(11) DEFAULT NULL,
  `shooting` float DEFAULT NULL,
  `crit_chance` int(11) DEFAULT NULL,
  `crit_attack_max` int(11) DEFAULT NULL,
  `crit_attack_min` int(11) DEFAULT NULL,
  `defense` int(11) DEFAULT NULL,
  `bomber` float DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `up_angle` int(11) DEFAULT NULL,
  `down_angle` int(11) DEFAULT NULL,
  `about_angle` int(11) DEFAULT NULL,
  `resurrection_time` int(11) DEFAULT NULL,
  `bullet_speed` int(11) DEFAULT NULL,
  `acc_maxpower` int(11) DEFAULT NULL,
  `rotate_maxpower` int(11) DEFAULT NULL,
  `visual_field` int(11) DEFAULT NULL,
  `self_explore` int(11) DEFAULT NULL,
  `invincible` int(11) DEFAULT NULL,
  `light_strike` int(11) DEFAULT NULL,
  `tank_weight` int(11) DEFAULT NULL,
  `tank_size` int(11) DEFAULT NULL,
  `precision` double DEFAULT NULL,
  `disturbance` float DEFAULT NULL,
  `acc_max_force` int(11) DEFAULT NULL,
  `rotate_max_force` int(11) DEFAULT NULL,
  `acc_max_speed` int(11) DEFAULT NULL,
  `fire_frequency` float DEFAULT '0',
  `acc_energy_max` float DEFAULT NULL,
  `acc_energy_add` float DEFAULT NULL,
  `acc_energy_reduce` float DEFAULT NULL,
  `acc_energy_cold_time` float DEFAULT NULL,
  `rotate_turret_speed` float DEFAULT NULL,
  `drift_time` float DEFAULT NULL,
  `drift_force` float DEFAULT NULL,
  `frozen` int(11) DEFAULT NULL,
  `magnet_blind` int(11) DEFAULT NULL,
  `break_armor` int(11) DEFAULT NULL,
  `glue` int(11) DEFAULT NULL,
  `damp` int(11) DEFAULT NULL,
  `iron_sand` int(11) DEFAULT NULL,
  `shield_continue_time` float DEFAULT NULL,
  `shield_cold_time` float DEFAULT NULL,
  `shield_attack_up` float DEFAULT NULL,
  `shield_shoot_time_up` float DEFAULT NULL,
  `shield_move_speed_up` float DEFAULT NULL,
  `shield_protect_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fighting_mode`
--

DROP TABLE IF EXISTS `fighting_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fighting_mode` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(20) DEFAULT NULL,
  `Describe` varchar(255) DEFAULT NULL,
  `Patten` int(11) DEFAULT NULL,
  `Resources` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gifts` (
  `ID` int(11) NOT NULL COMMENT '道具礼包配置表（张晓龙需求）',
  `name` varchar(45) DEFAULT NULL COMMENT '礼包名字',
  `dess` varchar(200) DEFAULT NULL COMMENT '礼包描述',
  `get_id` varchar(200) DEFAULT NULL COMMENT '道具1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guoqi`
--

DROP TABLE IF EXISTS `guoqi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guoqi` (
  `id` int(11) NOT NULL,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idfeed`
--

DROP TABLE IF EXISTS `idfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idfeed` (
  `feed` bigint(20) NOT NULL DEFAULT '40000' COMMENT 'id种子',
  PRIMARY KEY (`feed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='全局id生成种子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ignoreuser`
--

DROP TABLE IF EXISTS `ignoreuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ignoreuser` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `guid` int(11) NOT NULL COMMENT '玩家id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='忽略统计的玩家';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `information_client`
--

DROP TABLE IF EXISTS `information_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information_client` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) DEFAULT NULL COMMENT '用户uid',
  `award` varchar(200) DEFAULT NULL COMMENT '奖励或者其他相关信息',
  `type` varchar(45) DEFAULT NULL COMMENT '消息类型  level 等级升级类 等',
  `import` varchar(45) DEFAULT NULL COMMENT '关键字 比如升级到8级  就记录这个8',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1394 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingame_item`
--

DROP TABLE IF EXISTS `ingame_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingame_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `r_money` float DEFAULT NULL,
  `p_money` float DEFAULT NULL,
  `sign` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intead_coat`
--

DROP TABLE IF EXISTS `intead_coat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intead_coat` (
  `ID` int(11) NOT NULL,
  `coating_type` int(11) DEFAULT NULL COMMENT '涂装类型',
  `coating_name` varchar(45) DEFAULT NULL COMMENT '涂装名称',
  `coating_result` varchar(45) DEFAULT NULL COMMENT '涂装效果',
  `coating_intro` varchar(45) DEFAULT NULL COMMENT '涂装介绍',
  `addition_type` int(11) DEFAULT NULL COMMENT '属性类型',
  `addition_sum` int(11) DEFAULT NULL COMMENT '属性参数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intensify`
--

DROP TABLE IF EXISTS `intensify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intensify` (
  `ID` int(11) NOT NULL COMMENT '主键自增',
  `tankname` varchar(50) DEFAULT '' COMMENT '坦克名',
  `hplevel` int(11) DEFAULT NULL COMMENT '血量等级',
  `hpup` double DEFAULT NULL COMMENT '每级血量增量',
  `speedlevel` int(11) DEFAULT NULL COMMENT '速度等级',
  `speedup` double DEFAULT NULL COMMENT '速度增量',
  `deflevel` int(11) DEFAULT NULL COMMENT '防御等级',
  `defup` double DEFAULT NULL COMMENT '防御增量',
  `attacklevel` int(11) DEFAULT NULL COMMENT '攻击等级',
  `attackup` double DEFAULT NULL COMMENT '攻击增量',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intensify_0506`
--

DROP TABLE IF EXISTS `intensify_0506`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intensify_0506` (
  `id` int(11) NOT NULL COMMENT '主键自增',
  `itemtype` int(11) DEFAULT NULL COMMENT '对应itemtypeID',
  `star_type` int(11) DEFAULT NULL COMMENT '强化类型：1代表强化防御护甲、2代表强化填装速度、3代表强化攻击力、4代表强化暴击概率、5代表强化移动速度、6代表强化血量提升',
  `star_level` int(11) DEFAULT NULL COMMENT '强化等级',
  `value` double DEFAULT NULL COMMENT '强化数值',
  `p_money` int(11) DEFAULT NULL COMMENT '金币',
  `r_money` int(11) DEFAULT NULL COMMENT '钻石',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intensify_full_award`
--

DROP TABLE IF EXISTS `intensify_full_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intensify_full_award` (
  `ID` int(11) NOT NULL,
  `tankID` int(11) DEFAULT NULL,
  `award_type1` int(11) DEFAULT NULL,
  `award_num1` int(11) DEFAULT NULL,
  `award_type2` int(11) DEFAULT NULL,
  `award_num2` int(11) DEFAULT NULL,
  `award_type3` int(11) DEFAULT NULL,
  `award_num3` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intensify_rebate`
--

DROP TABLE IF EXISTS `intensify_rebate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intensify_rebate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `intensify_num` int(11) DEFAULT NULL,
  `money_rebate` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `introduction`
--

DROP TABLE IF EXISTS `introduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `introduction` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `from_id` varchar(50) DEFAULT NULL,
  `controls_id` varchar(50) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemType_group`
--

DROP TABLE IF EXISTS `itemType_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemType_group` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Itemnum` int(11) DEFAULT NULL,
  `ItemID1` int(11) DEFAULT NULL,
  `ItemID2` int(11) DEFAULT NULL,
  `ItemID3` int(11) DEFAULT NULL,
  `ItemID4` int(11) DEFAULT NULL,
  `ItemID5` int(11) DEFAULT NULL,
  `ItemID6` int(11) DEFAULT NULL,
  `ItemID7` int(11) DEFAULT NULL,
  `ItemID8` int(11) DEFAULT NULL,
  `ItemID9` int(11) DEFAULT NULL,
  `ItemID10` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemtype`
--

DROP TABLE IF EXISTS `itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemtype` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` text,
  `main_type` int(11) DEFAULT NULL,
  `type_tank` int(11) DEFAULT NULL,
  `countryType` int(11) DEFAULT NULL,
  `name_rendering` text,
  `configuration` text,
  `describe` text,
  `Req_level` int(11) DEFAULT NULL,
  `tank_level` int(11) DEFAULT NULL,
  `ap_max` float DEFAULT NULL,
  `ep_max` float DEFAULT NULL,
  `moving_speed_max` float DEFAULT NULL,
  `accuracy_min` float DEFAULT NULL,
  `accuracy_max` float DEFAULT NULL,
  `attack` float DEFAULT NULL,
  `shooting` float DEFAULT NULL,
  `crit_chance` float DEFAULT NULL,
  `crit_attack_max` float DEFAULT NULL,
  `crit_attack_min` float DEFAULT NULL,
  `defense` float DEFAULT NULL,
  `bomber` float DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `number` float DEFAULT NULL,
  `time` float DEFAULT NULL,
  `up_angle` float DEFAULT NULL,
  `down_angle` float DEFAULT NULL,
  `about_angle` float DEFAULT NULL,
  `resurrection_time` float DEFAULT NULL,
  `bullet_speed` float DEFAULT NULL,
  `acc_maxpower` float DEFAULT NULL,
  `rotate_maxpower` float DEFAULT NULL,
  `visual_field` float DEFAULT NULL,
  `self_explore` float DEFAULT NULL,
  `invincible` float DEFAULT NULL,
  `light_strike` float DEFAULT NULL,
  `tank_weight` float DEFAULT NULL,
  `tank_size` float DEFAULT NULL,
  `precision` float DEFAULT NULL,
  `disturbance` float DEFAULT NULL,
  `acc_max_force` float DEFAULT NULL,
  `rotate_max_force` float DEFAULT NULL,
  `acc_max_speed` float DEFAULT NULL,
  `fire_frequency` float DEFAULT NULL,
  `acc_energy_max` float DEFAULT NULL,
  `acc_energy_add` float DEFAULT NULL,
  `acc_energy_reduce` float DEFAULT NULL,
  `acc_energy_cold_time` float DEFAULT NULL,
  `rotate_turret_speed` float DEFAULT NULL,
  `drift_time` float DEFAULT NULL,
  `drift_force` float DEFAULT NULL,
  `frozen` float DEFAULT NULL,
  `magnet_blind` float DEFAULT NULL,
  `break_armor` float DEFAULT NULL,
  `glue` float DEFAULT NULL,
  `damp` float DEFAULT NULL,
  `iron_sand` float DEFAULT NULL,
  `shield_continue_time` float DEFAULT NULL,
  `shield_cold_time` float DEFAULT NULL,
  `shield_attack_up` float DEFAULT NULL,
  `shield_shoot_time_up` float DEFAULT NULL,
  `shield_move_speed_up` float DEFAULT NULL,
  `shield_protect_type` float DEFAULT NULL,
  `on_rush_cold_time` float DEFAULT NULL,
  `on_rush_force` float DEFAULT NULL,
  `turnspeed` float DEFAULT NULL,
  `accelerationrate` float DEFAULT NULL,
  `HPGrowthRate` float DEFAULT NULL,
  `attackGrowthRate` float DEFAULT NULL,
  `defenseGrowthRate` float DEFAULT NULL,
  `speedGrowthRate` float DEFAULT NULL,
  `costType` int(11) DEFAULT NULL,
  `shooting_type` int(11) DEFAULT NULL,
  `sub_type` int(11) DEFAULT NULL,
  `overlay_num` int(11) DEFAULT NULL,
  `max_fix` int(11) DEFAULT NULL,
  `item_max_count` int(11) DEFAULT NULL,
  `item_cooltime` int(11) DEFAULT NULL,
  `continue_time` int(11) DEFAULT NULL,
  `proficiency_max` int(11) DEFAULT NULL,
  `legion_type` int(11) DEFAULT NULL,
  `legion_level` int(11) DEFAULT NULL,
  `legion_num` int(11) DEFAULT NULL,
  `disturbance_rotate_speed` int(11) DEFAULT NULL,
  `hit_shake_duration` int(11) DEFAULT NULL,
  `hit_shake_amplitude` int(11) DEFAULT NULL,
  `fire_shake_duration` int(11) DEFAULT NULL,
  `fire_shake_amplitude` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `max_wuxun` int(11) NOT NULL,
  `tank_repair_fee` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemtype_0506`
--

DROP TABLE IF EXISTS `itemtype_0506`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemtype_0506` (
  `ID` int(11) NOT NULL,
  `Main_type` int(11) DEFAULT NULL COMMENT '坦克填1 炮管填2 护甲填3 道具填4',
  `Name` varchar(255) DEFAULT NULL COMMENT '坦克名称',
  `Sub_type` int(11) DEFAULT NULL,
  `Type_tank` int(11) DEFAULT NULL COMMENT '坦克类型：1重型 2远程 3突击',
  `Describe` text COMMENT '说明、描述',
  `Tank_equipment_id` int(11) DEFAULT NULL COMMENT '对应equipment表属性ID',
  `Configuration` text COMMENT '程序填写对应的配置文件',
  `Name_rendering` text COMMENT '坦克的序号',
  `overlay_num` int(11) DEFAULT NULL COMMENT '叠加上限，例：填1表示不能叠加',
  `max_fix` int(11) DEFAULT NULL COMMENT '暂时无意义',
  `item_max_count` int(11) DEFAULT NULL COMMENT '拥有上限',
  `item_cooltime` int(11) DEFAULT NULL COMMENT '冷却时间：秒',
  `Req_level` int(11) DEFAULT NULL COMMENT '需要玩家等级',
  `tank_level` int(11) DEFAULT NULL COMMENT '需要坦克等级',
  `continue_time` int(11) DEFAULT NULL COMMENT '道具使用后持续时间：秒',
  `proficiency_max` int(11) DEFAULT NULL COMMENT '熟练度最大值',
  `shooting_type` int(11) DEFAULT NULL COMMENT '射击类型：1直射  2曲射',
  `itemscore` int(11) DEFAULT NULL COMMENT '坦克分数(匹配房间使用)',
  `itemlevelbonus` int(11) DEFAULT NULL COMMENT '坦克等级加成系数(匹配房间使用,范围0-1000),需要除1000',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemtype_20140612`
--

DROP TABLE IF EXISTS `itemtype_20140612`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemtype_20140612` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL COMMENT '道具名字',
  `main_type` int(11) NOT NULL COMMENT '  //表示道具类型：坦克1，装备2，盔甲3，道具4',
  `type_tank` int(11) NOT NULL COMMENT '//针对坦克，炮管，装甲道具代表（重型 远程 突击），针对消耗道具代表（弹药箱，加血，增益，减益）',
  `countryType` int(11) NOT NULL COMMENT ' // 国籍',
  `name_rendering` text COMMENT '坦克的序号',
  `configuration` text COMMENT '程序填写对应的配置文件',
  `describe` text COMMENT '//对该物品特性的描述',
  `Req_level` int(11) NOT NULL DEFAULT '1' COMMENT '//要求使用的玩家等级 或者解锁坦克需要的经验值',
  `tank_level` int(11) NOT NULL DEFAULT '1' COMMENT '//装备该物品所需的tank等级',
  `ap_max` int(11) DEFAULT '0' COMMENT '生命值',
  `ep_max` int(11) DEFAULT '0' COMMENT '电力值',
  `moving_speed_max` float DEFAULT '0' COMMENT '最大移动速度：米／秒',
  `accuracy_min` float DEFAULT '0' COMMENT '最小准度',
  `accuracy_max` float DEFAULT '0' COMMENT '最大准度',
  `attack` float DEFAULT '0' COMMENT '攻击力',
  `shooting` float DEFAULT '0' COMMENT '设计间隔时间：秒',
  `crit_chance` float DEFAULT '0' COMMENT '暴击概率',
  `crit_attack_max` float DEFAULT '0' COMMENT '暴击伤害',
  `crit_attack_min` float DEFAULT '0' COMMENT '暴击伤害',
  `defense` float DEFAULT '0' COMMENT '防御力',
  `bomber` float DEFAULT '0' COMMENT '爆炸范围：米',
  `distance` float DEFAULT '0' COMMENT '射程：米',
  `number` float DEFAULT '0' COMMENT '携弹数量：发',
  `time` float DEFAULT '0' COMMENT '瞄准锁定时间：秒',
  `up_angle` float DEFAULT '0' COMMENT '仰角',
  `down_angle` float DEFAULT '0' COMMENT '俯视',
  `about_angle` float DEFAULT '0' COMMENT '左右旋转角度',
  `resurrection_time` float DEFAULT '0' COMMENT '复活时间',
  `bullet_speed` float DEFAULT '0' COMMENT '子弹速度',
  `acc_maxpower` float DEFAULT '0' COMMENT '前进功率',
  `rotate_maxpower` float DEFAULT '0' COMMENT '转向功率',
  `visual_field` float DEFAULT '0' COMMENT '可视距离',
  `self_explore` float DEFAULT '0' COMMENT '自爆',
  `invincible` float DEFAULT '0' COMMENT ' //无敌',
  `light_strike` float DEFAULT '0' COMMENT '雷击',
  `tank_weight` float DEFAULT '0' COMMENT '重量',
  `tank_size` float DEFAULT '0' COMMENT '坦克大小',
  `precision` float DEFAULT '0' COMMENT '精度',
  `disturbance` float DEFAULT '0' COMMENT '扰动',
  `acc_max_force` float DEFAULT '0' COMMENT ' //加速力',
  `rotate_max_force` float DEFAULT '0' COMMENT '//加速时旋转力',
  `acc_max_speed` float DEFAULT '0' COMMENT ' //加速最大速度',
  `fire_frequency` float DEFAULT '0' COMMENT '//突击坦克开火频率',
  `acc_energy_max` float DEFAULT '0' COMMENT '//最大加速能量',
  `acc_energy_add` float DEFAULT '0' COMMENT 'boost恢复',
  `acc_energy_reduce` float DEFAULT '0' COMMENT 'boost消耗',
  `acc_energy_cold_time` float DEFAULT '0' COMMENT 'boost冷却时间',
  `rotate_turret_speed` float DEFAULT '0' COMMENT '炮塔转向速度',
  `drift_time` float DEFAULT '0' COMMENT '//漂移时间',
  `drift_force` float DEFAULT '0' COMMENT '//漂移力',
  `frozen` float DEFAULT '0' COMMENT '//冰冻弹',
  `magnet_blind` float DEFAULT '0' COMMENT '脉冲弹',
  `break_armor` float DEFAULT '0' COMMENT '脆变弹',
  `glue` float DEFAULT '0' COMMENT '   //胶水弹',
  `damp` float DEFAULT '0' COMMENT ' //潮湿弹',
  `iron_sand` float DEFAULT '0' COMMENT '激光弹',
  `shield_continue_time` float DEFAULT '0' COMMENT '//开启护盾持续时间',
  `shield_cold_time` float DEFAULT '0' COMMENT ' //护盾功能使用的冷却时间',
  `shield_attack_up` float DEFAULT '0' COMMENT '护盾攻击加成',
  `shield_shoot_time_up` float DEFAULT '0' COMMENT '//开启护盾对应填弹增强',
  `shield_move_speed_up` float DEFAULT '0' COMMENT '  //速度增强',
  `shield_protect_type` float DEFAULT '0' COMMENT ' //护盾方位',
  `on_rush_cold_time` float DEFAULT '0' COMMENT '冲撞冷却时间',
  `on_rush_force` float DEFAULT '0' COMMENT ' //冲撞力',
  `turnspeed` float DEFAULT '0' COMMENT '// 坦克车转动速度',
  `accelerationrate` float DEFAULT '0' COMMENT '// 加速度速率',
  `HPGrowthRate` float DEFAULT '0' COMMENT '  // 每单位增加血量数',
  `attackGrowthRate` float DEFAULT '0' COMMENT '// 每单位增加攻击数',
  `defenseGrowthRate` float DEFAULT '0' COMMENT '// 每单位增加防御数',
  `speedGrowthRate` float DEFAULT '0' COMMENT ' // 每单位增加速度数',
  `costType` int(11) DEFAULT NULL COMMENT '// 0为非人民币车，1为人民币车，2为新类型',
  `shooting_type` int(11) DEFAULT NULL COMMENT '射击类型：1直射  2曲射',
  `sub_type` int(11) DEFAULT NULL,
  `overlay_num` int(11) DEFAULT NULL COMMENT '叠加上限，例：填1表示不能叠加',
  `max_fix` int(11) DEFAULT NULL COMMENT '暂时无意义',
  `item_max_count` int(11) DEFAULT NULL COMMENT '拥有上限',
  `item_cooltime` int(11) DEFAULT NULL COMMENT ' //cd冷却时间',
  `continue_time` int(11) DEFAULT NULL,
  `proficiency_max` int(11) DEFAULT NULL COMMENT '  //最大熟练度',
  `max_wuxun` int(11) NOT NULL COMMENT 'tank最大武勋数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keepuser`
--

DROP TABLE IF EXISTS `keepuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keepuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `recordtime` datetime NOT NULL COMMENT '统计时间',
  `down` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'other' COMMENT '用户来源',
  `daykeep` int(10) NOT NULL DEFAULT '0' COMMENT '日存留人数',
  `weekkeep` int(10) NOT NULL DEFAULT '0' COMMENT '周存留人数',
  `monthkeep` int(10) NOT NULL DEFAULT '0' COMMENT '月存留人数',
  `daykeep2` int(10) NOT NULL DEFAULT '0' COMMENT '日登陆存留',
  `weekkeep2` int(10) NOT NULL DEFAULT '0' COMMENT '周登陆存留',
  `monthkeep2` int(10) NOT NULL DEFAULT '0' COMMENT '月登陆存留',
  `threeday` int(10) NOT NULL DEFAULT '0',
  `sevenday` int(10) NOT NULL DEFAULT '0',
  `fourteenday` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordtime` (`recordtime`,`down`)
) ENGINE=MyISAM AUTO_INCREMENT=403 DEFAULT CHARSET=latin1 COMMENT='存留人数信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `legion_badge`
--

DROP TABLE IF EXISTS `legion_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legion_badge` (
  `id` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL COMMENT '徽章等级即所需军团等级',
  `badge_name` text COMMENT '徽章名称',
  `badge_description` text COMMENT '徽章描述',
  `unlock_type` int(11) DEFAULT NULL COMMENT '解锁类型：1:等级解锁；2:等级+贡献值解锁',
  `gain_type` int(11) DEFAULT NULL COMMENT '增益类型1：攻击2：防御3：移动速度4：炮塔转速5：血量提升',
  `gain_value` int(11) DEFAULT NULL COMMENT '增益数值，数值类型为百分比\n',
  `contribution_points` int(11) DEFAULT NULL COMMENT '消耗贡献点数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `legionscience`
--

DROP TABLE IF EXISTS `legionscience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legionscience` (
  `ID` int(11) NOT NULL,
  `science_type` int(11) DEFAULT NULL,
  `science_level` int(11) DEFAULT NULL,
  `need_contribute` int(11) DEFAULT NULL,
  `need_time` int(11) DEFAULT NULL,
  `need_armylevel` int(11) NOT NULL COMMENT '需求军团等级',
  `quick_finish_scale` int(11) DEFAULT NULL,
  `description_left` text,
  `description_right` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `level_id` varchar(255) NOT NULL COMMENT '玩家等级',
  `consolo_exe_min` varchar(255) DEFAULT NULL COMMENT '单人最低经验',
  `consolo_exe_max` varchar(255) DEFAULT NULL COMMENT '单人最高经验',
  `consolo_p_money_min` varchar(255) DEFAULT NULL COMMENT '单人最低金币',
  `consolo_p_money_max` varchar(255) DEFAULT NULL COMMENT '单人最高金币',
  `online_exe_min` varchar(255) DEFAULT NULL COMMENT '多人最低经验',
  `online_exe_max` varchar(255) DEFAULT NULL COMMENT '多人最高经验',
  `online_p_money_min` varchar(255) DEFAULT NULL COMMENT '多人最低金币',
  `online_p_money_max` varchar(255) DEFAULT NULL COMMENT '多人最高金币',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `levelxp`
--

DROP TABLE IF EXISTS `levelxp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levelxp` (
  `id` int(11) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `exe` int(11) DEFAULT NULL,
  `resources` varchar(255) DEFAULT NULL,
  `p_money_max` int(11) DEFAULT NULL,
  `award_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_buy`
--

DROP TABLE IF EXISTS `log_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL COMMENT '购买道具id',
  `amount` int(11) NOT NULL COMMENT '购买数量',
  `type` varchar(20) NOT NULL COMMENT '消费类型',
  `num` bigint(20) NOT NULL COMMENT '消费金额',
  `time` datetime NOT NULL COMMENT '消费时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='购买日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_game`
--

DROP TABLE IF EXISTS `log_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '玩家id',
  `score` int(11) NOT NULL COMMENT '得分',
  `killnum` int(11) NOT NULL COMMENT '歼敌数',
  `victory` int(11) NOT NULL COMMENT '是否胜利，1：胜利',
  `mvp` int(11) NOT NULL COMMENT '是否mvp，1：是',
  `stime` datetime NOT NULL COMMENT '开始时间',
  `etime` datetime NOT NULL COMMENT '结束时间',
  `tanktype` int(1) DEFAULT NULL COMMENT '坦克类型',
  `gamemap` varchar(10) DEFAULT NULL COMMENT '地图',
  PRIMARY KEY (`id`),
  KEY `idx_game_uid` (`uid`),
  KEY `idx_game_stime` (`stime`)
) ENGINE=MyISAM AUTO_INCREMENT=7274 DEFAULT CHARSET=utf8 COMMENT='游戏日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_login`
--

DROP TABLE IF EXISTS `log_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '玩家标识（玩家id）',
  `ip` varchar(50) NOT NULL COMMENT '登录ip',
  `uuid` varchar(50) NOT NULL COMMENT 'ios uuid',
  `mac` varchar(20) NOT NULL COMMENT '登录mac',
  `device` varchar(50) NOT NULL,
  `lang` varchar(50) NOT NULL,
  `os` varchar(50) NOT NULL,
  `hardware` varchar(50) NOT NULL,
  `down` varchar(50) NOT NULL,
  `gv` varchar(50) NOT NULL,
  `vt` varchar(50) NOT NULL,
  `status` int(11) NOT NULL COMMENT '登录的身份',
  `adswitch` int(11) NOT NULL COMMENT '本次登录广告是否关闭',
  `in_time` datetime NOT NULL COMMENT '登录时间',
  `out_time` datetime NOT NULL COMMENT '退出时间',
  PRIMARY KEY (`id`),
  KEY `idx_login_uid` (`uid`),
  KEY `idx_login_device` (`device`),
  KEY `idx_login_intime` (`in_time`),
  KEY `idx_login_outtime` (`out_time`),
  KEY `idx_login_mac` (`mac`),
  KEY `idx_login_unit` (`uid`,`device`)
) ENGINE=MyISAM AUTO_INCREMENT=126269 DEFAULT CHARSET=utf8 COMMENT='玩家登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_promotionAward`
--

DROP TABLE IF EXISTS `log_promotionAward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_promotionAward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appId` varchar(30) DEFAULT NULL COMMENT '自己应用ID',
  `popAppId` varchar(30) DEFAULT NULL COMMENT '被推广的应用ID',
  `popAppName` varchar(30) DEFAULT NULL COMMENT '被推广的应用名称',
  `uin` varchar(30) DEFAULT NULL COMMENT '获得奖励的用户的 91 帐号 Id',
  `goodsId` varchar(30) DEFAULT NULL COMMENT '奖励物品ID',
  `goodsName` varchar(30) DEFAULT NULL COMMENT '奖励物品名称',
  `awardCount` varchar(30) DEFAULT NULL COMMENT '奖励物品数量',
  `activeTime` datetime DEFAULT NULL COMMENT '用户成功激活时间',
  `platform` varchar(30) DEFAULT NULL COMMENT '平台',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='推广奖励日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_props`
--

DROP TABLE IF EXISTS `log_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `itemid` int(11) NOT NULL COMMENT '道具id',
  `num` int(11) NOT NULL COMMENT '道具数量',
  `comment` varchar(30) NOT NULL COMMENT '描述',
  `time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8829 DEFAULT CHARSET=utf8 COMMENT='道具日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_recharge`
--

DROP TABLE IF EXISTS `log_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_recharge` (
  `transaction_id` bigint(20) NOT NULL COMMENT '订单号',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `unique_identifier` varchar(100) NOT NULL,
  `gv` varchar(20) NOT NULL COMMENT '游戏版本号',
  `item_id` varchar(20) NOT NULL COMMENT '产品数字ID',
  `quantity` int(11) NOT NULL COMMENT '购买数量',
  `product_id` varchar(100) NOT NULL COMMENT '购买产品ID',
  `money_type` int(11) NOT NULL COMMENT '货币类型，1为美元，2为人民币',
  `money` float(8,2) NOT NULL COMMENT '货币数量',
  `pmoney` bigint(20) NOT NULL COMMENT '获得的P币',
  `rmoney` bigint(20) NOT NULL COMMENT '获得的R币',
  `original_transaction_id` varchar(60) NOT NULL,
  `original_purchase_date_pst` varchar(50) NOT NULL,
  `bvrs` varchar(30) NOT NULL,
  `purchase_date` varchar(50) NOT NULL,
  `purchase_date_ms` bigint(20) NOT NULL,
  `purchase_date_pst` varchar(50) NOT NULL,
  `original_purchase_date` varchar(50) NOT NULL,
  `original_purchase_date_ms` bigint(20) NOT NULL,
  `bid` varchar(50) NOT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `idx_recharge_uid` (`uid`),
  KEY `idx_recharge_gv` (`gv`),
  KEY `idx_recharge_pid` (`product_id`),
  KEY `idx_recharge_date` (`purchase_date_ms`),
  KEY `idx_recharge_ctime` (`ctime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_recharge_360`
--

DROP TABLE IF EXISTS `log_recharge_360`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_recharge_360` (
  `order_id` varchar(45) NOT NULL COMMENT '定单号\n',
  `product_id` varchar(45) DEFAULT NULL COMMENT '所购商品ＩＤ\n',
  `amount` int(11) DEFAULT NULL COMMENT '价格，　单位（分）',
  `app_uid` int(11) DEFAULT NULL,
  `money_type` varchar(45) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `pmoney` int(11) DEFAULT NULL,
  `rmoney` int(11) DEFAULT NULL,
  `ctime` timestamp NULL DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `gv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='order_id, product_id, amount, app_uid, gv, uid, money_type, ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_recharge_91`
--

DROP TABLE IF EXISTS `log_recharge_91`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_recharge_91` (
  `transaction_id` varchar(100) NOT NULL COMMENT '流水号',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `unique_identifier` varchar(100) NOT NULL COMMENT '订单号',
  `gv` varchar(20) NOT NULL COMMENT '游戏版本号',
  `quantity` int(11) NOT NULL COMMENT '购买数量',
  `product_id` varchar(100) NOT NULL COMMENT '购买产品ID',
  `money_type` int(11) NOT NULL COMMENT '货币类型，1为美元，2为人民币',
  `money` float(8,2) NOT NULL COMMENT '货币数量',
  `pmoney` bigint(20) NOT NULL COMMENT '获得的P币',
  `rmoney` bigint(20) NOT NULL COMMENT '获得的R币',
  `paystatus` int(11) NOT NULL COMMENT '充值状态',
  `order_ctime` datetime NOT NULL COMMENT '订单生成时间',
  `bid` varchar(50) NOT NULL COMMENT '应用标识',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日志记录时间',
  PRIMARY KEY (`transaction_id`),
  KEY `idx_recharge_uid` (`uid`),
  KEY `idx_recharge_gv` (`gv`),
  KEY `idx_recharge_pid` (`product_id`),
  KEY `idx_recharge_ctime` (`ctime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_recharge_all`
--

DROP TABLE IF EXISTS `log_recharge_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_recharge_all` (
  `order_id` varchar(45) NOT NULL COMMENT '定单号\n',
  `product_id` varchar(45) DEFAULT NULL COMMENT '所购商品ＩＤ\n',
  `amount` int(11) DEFAULT NULL COMMENT '价格，　单位（分）',
  `app_uid` int(11) DEFAULT NULL,
  `money_type` varchar(45) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `pmoney` int(11) DEFAULT NULL,
  `rmoney` int(11) DEFAULT NULL,
  `ctime` timestamp NULL DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `gv` varchar(45) DEFAULT NULL,
  `recharge_type` int(1) DEFAULT NULL COMMENT '对应recharge表中的type',
  `type2_extra_rmoney` int(11) DEFAULT NULL COMMENT '当type为2   附加值金额',
  `type3_extra_num` int(5) DEFAULT NULL COMMENT '当type为3时，附赠道具的数量',
  `type3_extra_vipshopid` int(10) DEFAULT NULL COMMENT 'type为3时，vipshop中的id',
  `type4_extra_itemtypeid` int(10) DEFAULT NULL COMMENT 'type为4时，对应itemtype表中的id',
  `log_error` varchar(45) DEFAULT NULL COMMENT '错误只可能针对 本身没有装备，还要一键强化操作  导致错误，此种情况recharge_type值为0',
  `platform` varchar(45) DEFAULT NULL COMMENT '平台标识',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='order_id, product_id, amount, app_uid, gv, uid, money_type, ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_recharge_uc`
--

DROP TABLE IF EXISTS `log_recharge_uc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_recharge_uc` (
  `order_id` varchar(45) NOT NULL COMMENT '定单号\n',
  `product_id` varchar(45) DEFAULT NULL COMMENT '所购商品ＩＤ\n',
  `amount` int(11) DEFAULT NULL COMMENT '价格，　单位（分）',
  `app_uid` int(11) DEFAULT NULL,
  `money_type` varchar(45) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `pmoney` int(11) DEFAULT NULL,
  `rmoney` int(11) DEFAULT NULL,
  `ctime` timestamp NULL DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `gv` varchar(45) DEFAULT NULL,
  `recharge_type` int(1) DEFAULT NULL COMMENT '对应recharge表中的type',
  `type2_extra_rmoney` int(11) DEFAULT NULL COMMENT '当type为2   附加值金额',
  `type3_extra_num` int(5) DEFAULT NULL COMMENT '当type为3时，附赠道具的数量',
  `type3_extra_vipshopid` int(10) DEFAULT NULL COMMENT 'type为3时，vipshop中的id',
  `type4_extra_itemtypeid` int(10) DEFAULT NULL COMMENT 'type为4时，对应itemtype表中的id',
  `log_error` varchar(45) DEFAULT NULL COMMENT '错误只可能针对 本身没有装备，还要一键强化操作  导致错误，此种情况recharge_type值为0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='order_id, product_id, amount, app_uid, gv, uid, money_type, ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_role_alt`
--

DROP TABLE IF EXISTS `log_role_alt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_role_alt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户标识',
  `comment` varchar(255) NOT NULL COMMENT '变更原因',
  `type` varchar(30) NOT NULL COMMENT '变更类型',
  `cur_value` int(11) NOT NULL COMMENT '当前值',
  `alt_value` int(11) NOT NULL COMMENT '增量',
  `cur_lv` int(11) NOT NULL COMMENT '当前等级',
  `cur_uexp` int(11) NOT NULL COMMENT '当前升级所需经验',
  `alt_time` datetime NOT NULL COMMENT '变更时间',
  PRIMARY KEY (`id`),
  KEY `idx_rolealt_uid` (`uid`),
  KEY `idx_rolealt_comment` (`comment`),
  KEY `idx_rolealt_type` (`type`),
  KEY `idx_rolealt_value` (`alt_value`),
  KEY `idx_rolealt_time` (`alt_time`)
) ENGINE=MyISAM AUTO_INCREMENT=752688 DEFAULT CHARSET=utf8 COMMENT='玩家角色数据变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_activity`
--

DROP TABLE IF EXISTS `login_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_activity` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `Days` int(11) DEFAULT NULL,
  `Activity_id` int(11) DEFAULT NULL,
  `Describe` varchar(100) DEFAULT NULL,
  `Flatform` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`Flatform`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loginlog`
--

DROP TABLE IF EXISTS `loginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `guid` bigint(11) NOT NULL COMMENT '玩家id',
  `down` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'other' COMMENT '用户来源',
  `logintime` datetime NOT NULL COMMENT '登陆时间',
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`),
  KEY `down` (`down`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM AUTO_INCREMENT=301648 DEFAULT CHARSET=latin1 COMMENT='登陆日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loginlog1`
--

DROP TABLE IF EXISTS `loginlog1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginlog1` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `guid` bigint(11) NOT NULL COMMENT '玩家id',
  `down` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'other' COMMENT '用户来源',
  `logintime` datetime NOT NULL COMMENT '登陆时间',
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`),
  KEY `down` (`down`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM AUTO_INCREMENT=13273 DEFAULT CHARSET=latin1 COMMENT='登陆日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `military_rank`
--

DROP TABLE IF EXISTS `military_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `military_rank` (
  `id` int(11) NOT NULL,
  `level_condition` int(11) NOT NULL COMMENT '等级需求',
  `military_rank` varchar(255) DEFAULT NULL COMMENT '军衔',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `money_exchange`
--

DROP TABLE IF EXISTS `money_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `money_exchange` (
  `id` int(11) NOT NULL,
  `r_money` int(11) DEFAULT NULL,
  `p_money` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `platform_award` int(11) DEFAULT NULL,
  `platform` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `net_event`
--

DROP TABLE IF EXISTS `net_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `net_event` (
  `Event_id` int(11) NOT NULL DEFAULT '0',
  `Event_data1` varchar(255) DEFAULT NULL,
  `Event_data2` varchar(255) DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Success` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offline`
--

DROP TABLE IF EXISTS `offline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Time` int(11) NOT NULL DEFAULT '0',
  `Number` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `particle`
--

DROP TABLE IF EXISTS `particle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `particle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` int(11) DEFAULT NULL,
  `Particle` int(11) DEFAULT NULL,
  `Itemttype` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_tickling`
--

DROP TABLE IF EXISTS `player_tickling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_tickling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT NULL COMMENT '0 建议 1 bug  2 其他',
  `contents` varchar(200) DEFAULT NULL COMMENT '具体内容',
  `time` int(11) DEFAULT NULL COMMENT '发布时间',
  `play_uid` int(10) DEFAULT NULL COMMENT '玩家uid',
  `game_name` int(1) DEFAULT NULL COMMENT '对象游戏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rank_period_award`
--

DROP TABLE IF EXISTS `rank_period_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank_period_award` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `rank_period` varchar(45) DEFAULT NULL COMMENT '排行榜的结算日期',
  `uplayer_uid` int(10) DEFAULT NULL COMMENT '当前玩家',
  `position` int(2) DEFAULT NULL COMMENT '名次',
  `interval` varchar(10) DEFAULT NULL COMMENT '所属区间',
  `exe` int(11) DEFAULT NULL COMMENT '获得经验',
  `R_money` int(11) DEFAULT NULL,
  `P_money` int(11) DEFAULT NULL,
  `flag` int(1) DEFAULT NULL COMMENT '1=>个人排行  2=》军团排行  3=>个人生涯排行  4=>军团生涯排行',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1556 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ranking_list`
--

DROP TABLE IF EXISTS `ranking_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranking_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL COMMENT '对应u_player表中所需要添加排行榜中的字段',
  `base_con` varchar(200) DEFAULT NULL COMMENT '入榜基础条件',
  `type_table` varchar(45) DEFAULT NULL COMMENT '具体数据在哪个表上  表名字',
  `redis_table` varchar(45) DEFAULT NULL COMMENT '缓存的主键名',
  `finish_time` tinyint(1) DEFAULT NULL COMMENT '结算时间 7表示一周的周一结算    15表示一个月的1号结算',
  `apply` int(11) DEFAULT NULL COMMENT 'apply=0，则表示排行榜不显示；\napply=1，则表示排行榜显示\napply=2，当前前台使用的排行榜',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ranklist`
--

DROP TABLE IF EXISTS `ranklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL COMMENT '奖励类型',
  `interval` varchar(45) DEFAULT NULL COMMENT '排名区间',
  `award` varchar(100) DEFAULT NULL COMMENT '按要求更改格式  name：num,name:num',
  `award_scribe` varchar(255) NOT NULL COMMENT '客户端奖励内容显示',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ranklist_bak`
--

DROP TABLE IF EXISTS `ranklist_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranklist_bak` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL COMMENT '奖励类型',
  `interval` varchar(45) DEFAULT NULL COMMENT '排名区间',
  `award` varchar(100) DEFAULT NULL COMMENT '按要求更改格式  name：num,name:num',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recharge`
--

DROP TABLE IF EXISTS `recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recharge` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` int(11) DEFAULT NULL COMMENT '2:赠送额外游戏币；3：赠送道具,4：一键强化',
  `Money` int(11) DEFAULT NULL COMMENT '金额',
  `Money_type` int(11) DEFAULT NULL COMMENT '货币类型',
  `P_money` int(11) DEFAULT NULL COMMENT '金币',
  `R_money` int(11) DEFAULT NULL COMMENT '钻石',
  `Extra` int(11) DEFAULT NULL COMMENT '额外获赠比率, 如果type==3则是表示多少个道具',
  `Itemtype` int(11) DEFAULT NULL COMMENT '对应itemtype表中的id',
  `Product_id` varchar(255) DEFAULT NULL COMMENT '商品ID',
  `Product_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `Platform` varchar(50) DEFAULT NULL COMMENT '平台',
  `Product_describe` varchar(255) DEFAULT NULL COMMENT '描述信息',
  `proup_ids` varchar(100) DEFAULT NULL COMMENT '是否赠送其他商品 ',
  `ImgName` varchar(255) NOT NULL COMMENT '图片名称',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5008 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '奖励类型,1:仅一次；2:一天仅一次；3:一周仅一次',
  `item_id` int(11) DEFAULT NULL,
  `p_money` int(11) DEFAULT NULL,
  `r_money` int(11) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL COMMENT '奖励说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server_opt_record`
--

DROP TABLE IF EXISTS `server_opt_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_opt_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `opt` int(11) NOT NULL,
  `optivalue` int(11) NOT NULL,
  `optcvalue` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1792085 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signawardinfo`
--

DROP TABLE IF EXISTS `signawardinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signawardinfo` (
  `ID` int(11) NOT NULL COMMENT '这个ID就是用户的uid',
  `get_ids` varchar(1000) DEFAULT NULL COMMENT '本周期获得礼包id',
  `time` varchar(100) DEFAULT NULL COMMENT '下一期需要刷新的时间点',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tankItemInfo`
--

DROP TABLE IF EXISTS `tankItemInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tankItemInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tankName` varchar(45) NOT NULL COMMENT '坦克名称',
  `mainType` int(11) NOT NULL COMMENT '坦克类别：0为非人民币车，1为人民币车',
  `type` int(11) NOT NULL COMMENT '坦克类型：1为重型，2为远程，3为突击',
  `countryType` int(11) NOT NULL COMMENT '坦克所属国家系别，如美系，俄系等',
  `imgName` varchar(45) DEFAULT NULL COMMENT '图标名字',
  `meshName` varchar(45) DEFAULT NULL COMMENT '材质名称',
  `turretId` int(11) NOT NULL COMMENT '初始装备的炮管ID，对应turretItemInfo中的id索引',
  `describe` varchar(45) DEFAULT NULL COMMENT '坦克描述',
  `requestLevel` int(11) NOT NULL DEFAULT '1' COMMENT '解锁等级，大于等级即解锁',
  `tankLevel` int(11) NOT NULL DEFAULT '1' COMMENT '坦克等级',
  `initHP` int(11) NOT NULL COMMENT '基础血量',
  `HPGrowthRate` int(11) NOT NULL COMMENT '每单位增加血量数',
  `initAttack` int(11) NOT NULL COMMENT '初始攻击力',
  `attackGrowthRate` int(11) NOT NULL COMMENT '每单位增加的攻击数',
  `initDefense` int(11) NOT NULL COMMENT '初始防御力',
  `defenseGrowthRate` int(11) NOT NULL COMMENT '每单位增加的防御数',
  `initSpeed` int(11) NOT NULL COMMENT '初始速度',
  `speedGrowthRate` int(11) NOT NULL COMMENT '每单位增加的速度数',
  `viewRange` int(11) NOT NULL COMMENT '视角距离，即锁定距离',
  `maxSpeed` int(11) NOT NULL COMMENT '最大速度',
  `accelerationRate` int(11) NOT NULL COMMENT '加速度速率',
  `turnSpeed` int(11) NOT NULL COMMENT '坦克转弯速度',
  `boostNum` int(11) NOT NULL COMMENT '技能值总量',
  `boostDownRate` varchar(45) NOT NULL COMMENT '技能值下降速度',
  `boostRestoreRate` int(11) NOT NULL COMMENT '技能值恢复速度',
  `property1` int(11) DEFAULT NULL COMMENT '对于重型，远程和突击代表意义不同，重型：1为撞击技能消耗值，2为突进给的力，3为冷却时间',
  `property2` int(11) DEFAULT NULL COMMENT '远程：1为炮击模式类型，2为炮击模式索敌距离，3为炮击模式收速加速，4为炮击模式展开时间',
  `property3` int(11) DEFAULT NULL COMMENT '突击：1为飘逸施加的力，2为旋回消耗的boost速度，3为冷却时间',
  `property4` int(11) DEFAULT NULL,
  `max_wuxun` int(11) DEFAULT NULL COMMENT '每辆坦克获得最大武勋星数  本字段只对非金币坦克生效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tank_exe_wuxun`
--

DROP TABLE IF EXISTS `tank_exe_wuxun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tank_exe_wuxun` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tank_type` tinyint(1) DEFAULT NULL COMMENT '坦克类型 3突击     1 重坦   ',
  `n_level` tinyint(1) DEFAULT NULL COMMENT '坦克级别',
  `base_tanklevel_1` int(1) DEFAULT NULL COMMENT '对应u_tank中的tangklevel字段 一级车',
  `rate_tanklevel_1` varchar(45) DEFAULT NULL,
  `max_wuxun_1` int(1) DEFAULT NULL COMMENT '战斗中获得的武勋星上线',
  `max_tankexe_1` int(1) DEFAULT NULL COMMENT '达到武勋星上线是 所获得的经验',
  `base_tanklevel_2` int(1) DEFAULT NULL,
  `rate_tanklevel_2` varchar(45) DEFAULT NULL,
  `max_wuxun_2` int(11) DEFAULT NULL,
  `max_tankexe_2` int(11) DEFAULT NULL,
  `base_tanklevel_3` int(1) DEFAULT NULL,
  `rate_tanklevel_3` varchar(45) DEFAULT NULL,
  `max_wuxun_3` int(11) DEFAULT NULL,
  `max_tankexe_3` int(11) DEFAULT NULL,
  `base_tanklevel_4` int(1) DEFAULT NULL,
  `rate_tanklevel_4` varchar(45) DEFAULT NULL,
  `max_wuxun_4` int(11) DEFAULT NULL,
  `max_tankexe_4` int(11) DEFAULT NULL,
  `base_tanklevel_5` int(1) DEFAULT NULL,
  `rate_tanklevel_5` varchar(45) DEFAULT NULL,
  `max_wuxun_5` int(11) DEFAULT NULL,
  `max_tankexe_5` int(11) DEFAULT NULL,
  `base_tanklevel_6` int(1) DEFAULT NULL,
  `rate_tanklevel_6` varchar(45) DEFAULT NULL,
  `max_wuxun_6` int(11) DEFAULT NULL,
  `max_tankexe_6` int(11) DEFAULT NULL,
  `base_tanklevel_7` int(1) DEFAULT NULL,
  `rate_tanklevel_7` varchar(45) DEFAULT NULL,
  `max_wuxun_7` int(11) DEFAULT NULL,
  `max_tankexe_7` int(11) DEFAULT NULL,
  `base_tanklevel_8` int(1) DEFAULT NULL,
  `rate_tanklevel_8` varchar(45) DEFAULT NULL,
  `max_wuxun_8` int(11) DEFAULT NULL,
  `max_tankexe_8` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tank_march_muzzle`
--

DROP TABLE IF EXISTS `tank_march_muzzle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tank_march_muzzle` (
  `id` varchar(255) DEFAULT NULL,
  `tank_id` varchar(255) DEFAULT NULL,
  `muzzle_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tank_march_muzzle_0506`
--

DROP TABLE IF EXISTS `tank_march_muzzle_0506`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tank_march_muzzle_0506` (
  `id` varchar(255) DEFAULT NULL,
  `tank_id` varchar(255) DEFAULT NULL,
  `muzzle_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tank_scene_initpos`
--

DROP TABLE IF EXISTS `tank_scene_initpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tank_scene_initpos` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `mapid` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `y` varchar(255) DEFAULT NULL,
  `z` varchar(255) DEFAULT NULL,
  `w` varchar(255) DEFAULT NULL,
  `camp` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tank_scene_type`
--

DROP TABLE IF EXISTS `tank_scene_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tank_scene_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) DEFAULT NULL COMMENT '地图名',
  `File` varchar(20) DEFAULT NULL COMMENT '文件名',
  `Use` int(11) DEFAULT NULL COMMENT '是否被使用 1是 0否',
  `Max_num` int(11) DEFAULT NULL COMMENT '地图最大坦克数量',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tankmodifiedmerge`
--

DROP TABLE IF EXISTS `tankmodifiedmerge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tankmodifiedmerge` (
  `TankID` int(11) NOT NULL AUTO_INCREMENT,
  `TurretID` int(11) NOT NULL,
  `TurretPNG` varchar(255) DEFAULT NULL,
  `TurretposX` float DEFAULT NULL,
  `TurretposY` float DEFAULT NULL,
  `TurretposZ` float DEFAULT NULL,
  PRIMARY KEY (`TankID`,`TurretID`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tankuplevel_cfg`
--

DROP TABLE IF EXISTS `tankuplevel_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tankuplevel_cfg` (
  `ID` int(11) NOT NULL,
  `tank_level` int(11) DEFAULT NULL COMMENT '等级',
  `tank_needexp` int(11) DEFAULT NULL COMMENT '所需经验',
  `tank_countexp` int(11) DEFAULT NULL COMMENT '累积经验(总经验)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='坦克升级所需经验配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_conf`
--

DROP TABLE IF EXISTS `task_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_conf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(10) DEFAULT NULL COMMENT '任务名字',
  `task_type` int(1) DEFAULT NULL COMMENT '任务类型   1=》每日   2=》固定',
  `task_desc` varchar(45) DEFAULT NULL COMMENT '任务描述',
  `task_target` varchar(45) DEFAULT NULL COMMENT '任务目标',
  `go_to` varchar(45) DEFAULT NULL COMMENT '客户端跳转任务表示   1 战斗场景     2段位升级   3 消费武勋星',
  `award_p_money` int(10) DEFAULT NULL COMMENT '奖励类型 1=》道具  2=》p_money  3=>R_money',
  `award_Exe` int(10) DEFAULT NULL,
  `award_poupsid` varchar(45) DEFAULT NULL,
  `is_task_level` int(1) DEFAULT NULL COMMENT '是否是关于等级的任务（根据玩家的等级 完成任务的条件和奖励都不相同的任务） 1是 0否\n',
  `is_count` tinyint(1) DEFAULT NULL COMMENT '完成任务是否累计 1不累计  0累计',
  `is_stairs` tinyint(1) DEFAULT NULL COMMENT '是否是连续任务   是1 否0   8表示有8个小任务 最后一个是8',
  `stairs_space` tinyint(1) DEFAULT NULL COMMENT '连续任务的之间的步长 挑战任务1和2 是1   挑战任务3是3',
  `base_con` varchar(45) DEFAULT NULL COMMENT '任务基础条件',
  `target_con` varchar(45) DEFAULT NULL COMMENT '任务达成条件',
  `improve_con` varchar(60) DEFAULT NULL COMMENT '完善条件  {"1-15":4,"16-30":5,"31-45":6,"46-60":7,"61-70":8}  1-15级“target_con（kill）”个人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tgtrigger`
--

DROP TABLE IF EXISTS `tgtrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgtrigger` (
  `ID` varchar(255) NOT NULL,
  `Map_ID` varchar(255) DEFAULT NULL COMMENT '对应地图ID',
  `CD_time` varchar(255) DEFAULT NULL COMMENT '道具/物品CD时间',
  `Mappoint_x` varchar(255) DEFAULT NULL COMMENT '地图坐标点x轴',
  `Mappoint_y` varchar(255) DEFAULT NULL COMMENT '地图坐标点y轴',
  `Mappoint_z` varchar(255) DEFAULT NULL COMMENT '地图坐标点z轴',
  `Trigger_camp` varchar(255) DEFAULT NULL COMMENT '触发器对应阵营，1红，2绿',
  `Trigger_scope` varchar(255) DEFAULT NULL COMMENT '触发器对应范围:米',
  `Trigger_resource` varchar(255) DEFAULT NULL COMMENT '触发器资源，资源名',
  `Trigger_mainType` varchar(255) DEFAULT NULL COMMENT '1攻击类触发器  2战场道具  3普通道具4移动触发器5补给  6增益 7损益 8全体 ',
  `Trigger_type1` varchar(255) DEFAULT NULL COMMENT '程序使用与Trigger_MainType对应的分支',
  `Trigger_type2` varchar(255) DEFAULT NULL COMMENT '程序使用与Trigger_MainType对应的分支',
  `Trigger_type3` varchar(255) DEFAULT NULL COMMENT '程序使用与Trigger_MainType对应的分支',
  `Trigger_itemid` varchar(255) DEFAULT NULL COMMENT '对应itemtype的id',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt`
--

DROP TABLE IF EXISTS `tt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt` (
  `id` int(11) NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_achievement_cfg`
--

DROP TABLE IF EXISTS `u_achievement_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_achievement_cfg` (
  `ID` int(11) NOT NULL,
  `achievement_name` varchar(45) DEFAULT '' COMMENT '成就名称',
  `achieve_time_type` int(11) DEFAULT NULL COMMENT '获得成就次数 1可以重复获得 2 不可以',
  `achievement_needtype` int(11) DEFAULT '0' COMMENT '成就类型 1, 累计输出伤害; 2, 累计击杀; 3, 累计受到伤害; 4, VIP身份, 5, 拥有道具(具体道体见achievement_needid), 6,使用坦克击杀(具体坦克类型见achievement_needid),',
  `achievement_needid` int(11) DEFAULT '0' COMMENT '表示道具ID或其它ID,类型等 ,由achievement_needtype决定',
  `achievement_neednum` int(11) DEFAULT '0' COMMENT '需要的相应的数量,根据achievement_type决定\n',
  `achievement_awardid` int(11) DEFAULT '0' COMMENT '奖励类型：',
  `achievement_awardnum` int(11) DEFAULT '0' COMMENT '根据不同, 具有不同含义,如果奖励类型是道具,则此字段表示道具ID',
  `is_percent` tinyint(4) DEFAULT NULL COMMENT '是否有完成进度标识  0没有  1有',
  `finish_type` tinyint(1) DEFAULT NULL COMMENT '判断成就完成场景  1战斗结束之后  \n                          2坦克获得之后   \n                         3 强化坦克之后（强化满级）\n                         4 解锁坦克之后\n                         5个人经验增加  \n                         6例外情况c++判断之后传值  \n                         7非以上几种情况',
  `finish_flag` tinyint(1) DEFAULT NULL COMMENT '条件标识\n // 11    累计战斗场次达到*场\n// 12    累计击杀坦克数*\n// 15   累计获得胜利场次*',
  `is_count` tinyint(1) DEFAULT NULL COMMENT '是否统计完成次数  1统计  0不统计',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关卡成就';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_achievement_list`
--

DROP TABLE IF EXISTS `u_achievement_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_achievement_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `achievement_id` int(11) DEFAULT NULL COMMENT '成就ID\n',
  `achievement_num` int(11) DEFAULT NULL COMMENT '当前完成度',
  `achievement_achieve` int(11) DEFAULT '0' COMMENT '当前成就是否完成 1完成 0未完成',
  `achievement_neednum` varchar(45) DEFAULT NULL COMMENT '完成成就需要的相应的数量  如果为1就是不需要百分百进度来返回',
  `is_percent` varchar(45) DEFAULT NULL COMMENT '是否有完成进度标识  0没有  1有',
  `is_count` int(11) DEFAULT NULL COMMENT '是否统计完成次数  1统计  0不统计',
  `count` int(11) DEFAULT NULL COMMENT '完成次数总和',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=278366 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_arena_list`
--

DROP TABLE IF EXISTS `u_arena_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_arena_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2906 DEFAULT CHARSET=utf8 COMMENT='竞技场排行表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_army_group`
--

DROP TABLE IF EXISTS `u_army_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_army_group` (
  `ID` int(11) NOT NULL COMMENT '玩家ID',
  `armyId` int(11) NOT NULL COMMENT '玩家所在军团id',
  `R_money` int(11) NOT NULL DEFAULT '0' COMMENT '玩家贡献金钱数',
  `P_money` int(11) DEFAULT NULL,
  `moneydate` int(11) DEFAULT NULL COMMENT '贡献时间',
  `sharing` int(11) NOT NULL DEFAULT '0' COMMENT '当前贡献度',
  `armyposition` int(11) NOT NULL COMMENT '军团内职位',
  `army_apply` varchar(2000) DEFAULT NULL COMMENT '申请加入的军团列表',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家军团信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_army_item`
--

DROP TABLE IF EXISTS `u_army_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_army_item` (
  `ID` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '玩家ID',
  `itemid` int(11) NOT NULL COMMENT '道具ID',
  `num` int(11) NOT NULL COMMENT '道具数量',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_black_marker`
--

DROP TABLE IF EXISTS `u_black_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_black_marker` (
  `ID` int(11) NOT NULL,
  `uid` varchar(45) DEFAULT NULL,
  `black_marker_id` varchar(200) DEFAULT NULL COMMENT '道具id',
  `lock_id` varchar(200) DEFAULT NULL,
  `lock_id_price` varchar(200) DEFAULT NULL COMMENT '锁定时的价格',
  `buy_list` varchar(200) NOT NULL COMMENT '购买的物品列表',
  `time` int(11) DEFAULT NULL COMMENT '刷出的时间',
  `count` int(1) DEFAULT NULL COMMENT '刷新道具计数器',
  `is_army_black` tinyint(1) DEFAULT NULL COMMENT '是否是军团黑市刷出的道具 1是  0不是',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_bonus`
--

DROP TABLE IF EXISTS `u_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_bonus` (
  `ID` int(11) NOT NULL COMMENT '玩家ID',
  `exp` int(11) NOT NULL COMMENT '经验加成方式：0为不加成，1为按时间加成，2为按场次加成',
  `exp_times` int(11) NOT NULL COMMENT '经验加成倍数',
  `exp_deadline` int(11) NOT NULL COMMENT '经验加成剩余',
  `money` int(11) NOT NULL COMMENT '金钱加成方式：0为不加成，1为按时间加成，2为按场次加成',
  `money_times` int(11) NOT NULL COMMENT '金钱加成倍数',
  `money_deadline` int(11) NOT NULL COMMENT '金钱加成剩余',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_exchange`
--

DROP TABLE IF EXISTS `u_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_exchange` (
  `ID` int(11) NOT NULL COMMENT 'id',
  `type` int(11) DEFAULT NULL COMMENT '类型 ，1 钻石换金币, 2 钻石换经验',
  `extra` int(11) DEFAULT NULL COMMENT '赠送， 5表示送5%',
  `r_money` int(11) DEFAULT NULL,
  `p_money` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='钻石兑换金币';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_force_queue`
--

DROP TABLE IF EXISTS `u_force_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_force_queue` (
  `ID` int(11) NOT NULL,
  `defense_level` int(11) DEFAULT '0' COMMENT '防御等级\n',
  `attack_level` int(11) DEFAULT '0' COMMENT '攻击等级',
  `movespeed_level` int(11) DEFAULT '0' COMMENT '移动速度等级',
  `ap_level` int(11) DEFAULT '0' COMMENT '血量等级',
  `finish_time` int(11) DEFAULT NULL COMMENT '完成时间',
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='强化队列';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_fraction`
--

DROP TABLE IF EXISTS `u_fraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_fraction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Win` int(11) NOT NULL,
  `Blue_all` int(11) NOT NULL,
  `Red_all` int(11) NOT NULL,
  `Number_play` int(11) NOT NULL,
  `Blue_1` int(11) NOT NULL,
  `Blue_2` int(11) NOT NULL,
  `Blue_3` int(11) NOT NULL,
  `Blue_4` int(11) NOT NULL,
  `Blue_5` int(11) NOT NULL,
  `Blue_6` int(11) NOT NULL,
  `Red_1` int(11) NOT NULL,
  `Red_2` int(11) NOT NULL,
  `Red_3` int(11) NOT NULL,
  `Red_4` int(11) NOT NULL,
  `Red_5` int(11) NOT NULL,
  `Red_6` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_friend_relation`
--

DROP TABLE IF EXISTS `u_friend_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_friend_relation` (
  `ID` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `friendid` int(11) NOT NULL DEFAULT '0',
  `friendname` varchar(45) DEFAULT NULL,
  `relation` int(11) DEFAULT '1' COMMENT '关系，1，好友，2，黑名单',
  `online` int(11) DEFAULT '0',
  `gameid` int(11) DEFAULT '-1',
  `roomid` int(11) DEFAULT '-1',
  `hostid` int(11) DEFAULT '-1',
  PRIMARY KEY (`uid`,`friendid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_ingame`
--

DROP TABLE IF EXISTS `u_ingame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_ingame` (
  `ID` int(11) NOT NULL,
  `AP_max` int(11) NOT NULL,
  `AP_now` int(11) NOT NULL,
  `EP_max` int(11) NOT NULL,
  `EP_now` int(11) NOT NULL,
  `Moving_speed_max` int(11) NOT NULL,
  `Accuracy_min` int(11) NOT NULL,
  `Accuracy_max` int(11) NOT NULL,
  `Attack` int(11) NOT NULL,
  `Shooting` int(11) NOT NULL,
  `Crit_chance` int(11) NOT NULL,
  `Crit_attack` int(11) NOT NULL,
  `Defense` int(11) NOT NULL,
  `Bomber` int(11) NOT NULL,
  `Distance` int(11) NOT NULL,
  `Number` int(11) NOT NULL,
  `Time` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_item`
--

DROP TABLE IF EXISTS `u_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Item_type` int(11) DEFAULT NULL,
  `Keeper_id` int(11) DEFAULT NULL,
  `Player_id` int(11) DEFAULT NULL COMMENT '玩家ID',
  `item_endtime` bigint(20) NOT NULL DEFAULT '0' COMMENT '到期时间秒',
  `item_packet` int(11) NOT NULL DEFAULT '0' COMMENT '背包编号0.表示仓库,1.表示1号背包,2.表示2号背包',
  `item_count` int(11) DEFAULT '0' COMMENT '物品数量',
  `item_time_type` int(11) DEFAULT '0' COMMENT '使用类型1.按时间类型使用2.按次数类型使用',
  `item_skilled` int(11) DEFAULT '0' COMMENT '熟练度',
  `attack_level` int(11) DEFAULT '0' COMMENT '攻击力等级',
  `defense_level` int(11) DEFAULT '0' COMMENT '防御护甲等级',
  `movespeed_level` int(11) DEFAULT '0' COMMENT '移动速度等级',
  `loadbulletspeed_level` int(11) DEFAULT '0' COMMENT '装填速度等级',
  `ap_level` int(11) DEFAULT '0' COMMENT '血量提升等级',
  `crit_level` int(11) DEFAULT '0' COMMENT '暴击概率等级',
  `tank_up_level` int(11) DEFAULT '0' COMMENT '当前坦克等级',
  `wuXun_num` int(11) DEFAULT '0' COMMENT '武勋获得数',
  `wuXun_used_num` int(11) DEFAULT '0' COMMENT '已使用武勋数',
  `item_exp` int(11) DEFAULT '0' COMMENT '物品经验(这里特指坦克)',
  `nowcoating` int(11) DEFAULT '0' COMMENT '当前普通涂装ID',
  `specialcoating` int(11) DEFAULT '0' COMMENT '特殊喷涂ID',
  `coatingIdList` varchar(45) DEFAULT '0' COMMENT 'tank拥有的涂装ID',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1793390 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_item_uplevel_cfg`
--

DROP TABLE IF EXISTS `u_item_uplevel_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_item_uplevel_cfg` (
  `ID` int(11) NOT NULL,
  `itemid` int(11) DEFAULT '0' COMMENT '要升级的道具ID',
  `uplevelid` int(11) DEFAULT '0' COMMENT '升级后的道具ID\n',
  `cost_pm` int(11) DEFAULT '0' COMMENT '花费金币',
  `cost_rm` int(11) DEFAULT '0' COMMENT '花费钻石',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_palyer`
--

DROP TABLE IF EXISTS `u_palyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_palyer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sub_id` varchar(30) DEFAULT NULL COMMENT '平台用户标识（如91平台用户：91_8546789;apple平台用户：apple_8546789等）',
  `Name` varchar(20) DEFAULT NULL,
  `Level` int(11) DEFAULT NULL,
  `R_money` int(11) DEFAULT '0',
  `P_money` int(11) DEFAULT '2012',
  `Exe` int(11) DEFAULT NULL,
  `Account_id` int(11) DEFAULT NULL,
  `Account` varchar(20) DEFAULT NULL,
  `Password` varchar(35) DEFAULT NULL,
  `Customertoken` varchar(35) DEFAULT NULL COMMENT '游客标识',
  `Status` int(11) DEFAULT '0' COMMENT '身份标记，0：游客;1:普通用户等等',
  `Succeed` int(11) DEFAULT NULL,
  `Kill` int(11) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  `Victory` int(11) DEFAULT NULL,
  `Mvp` int(11) DEFAULT NULL,
  `Devicetoken` varchar(64) DEFAULT NULL COMMENT 'app ios推送的设备token',
  `Uuid` varchar(50) DEFAULT NULL COMMENT 'ios uuid，设备唯一标识',
  `Device` varchar(50) DEFAULT NULL COMMENT 'iphone3G,iphone4 etc.',
  `Mac` varchar(50) DEFAULT NULL COMMENT 'mac地址',
  `Lang` varchar(50) DEFAULT NULL COMMENT '语言',
  `Os` varchar(50) DEFAULT NULL COMMENT '系统及版本',
  `Hardware` varchar(50) DEFAULT NULL COMMENT '硬件信息GPU等',
  `Down` varchar(50) DEFAULT NULL COMMENT '下载渠道，客户端增加相应的配置信息，以区分发布给不同平台的版本',
  `Gv` varchar(50) DEFAULT NULL COMMENT '游戏版本号',
  `Vt` varchar(50) DEFAULT NULL COMMENT '版本发布区域，如日本，国内，国外',
  `Jailbreak` int(11) DEFAULT NULL COMMENT '是否越狱版本',
  `Loginip` varchar(50) DEFAULT NULL COMMENT '最后登录ip',
  `Logintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `Adswitch` int(11) DEFAULT '1' COMMENT '广告开关',
  `Cip_user` varchar(50) DEFAULT NULL COMMENT '用户创建ip',
  `Cip_cus` varchar(50) DEFAULT NULL COMMENT '创建游客的ip',
  `Ctime_user` datetime DEFAULT NULL COMMENT '用户创建时间',
  `Ctime_cus` datetime DEFAULT NULL COMMENT '游客创建时间',
  `Update_flag` varchar(50) DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `logindays` int(11) DEFAULT '0' COMMENT '连续登录天数',
  `loginawardflag` int(11) NOT NULL DEFAULT '0' COMMENT '奖励领取标记，０未领取，１已领取',
  `Count_battle` int(11) NOT NULL DEFAULT '0' COMMENT '总的战斗次数',
  `Count_kill` int(11) NOT NULL DEFAULT '0' COMMENT '总的歼敌数',
  `Count_win` int(11) NOT NULL DEFAULT '0' COMMENT '总的胜利次数',
  `Count_lose` int(11) DEFAULT NULL COMMENT '总失败数\n',
  `Count_death` int(11) DEFAULT NULL COMMENT '总的死亡数\n',
  `Count_series_kill` int(11) DEFAULT NULL COMMENT '最大连杀\n',
  `achievement` int(11) NOT NULL DEFAULT '0' COMMENT '成就点数',
  `title_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '称号，（对应二进制位，每位一个称号，共64个）',
  `u_image` int(11) DEFAULT '0' COMMENT '头像\n',
  `u_sex` int(11) DEFAULT '0' COMMENT '性别\n',
  `u_loginnum` int(11) DEFAULT '0' COMMENT '登录次数\n',
  `u_disconnectnum` int(11) DEFAULT '0' COMMENT '断线次数\n',
  `u_countdeadnum` int(11) DEFAULT '0' COMMENT '总的死亡数',
  `u_firenum` int(11) DEFAULT '0' COMMENT '开火次数',
  `u_hitnum` int(11) DEFAULT '0' COMMENT '命中数\n',
  `u_hurtnum` int(11) DEFAULT '0' COMMENT '总伤害数\n',
  `u_CreateFlag` int(11) DEFAULT '0',
  `u_archievement_id` bigint(20) unsigned DEFAULT '0' COMMENT '成就，（对应二进制位，每位一个称号，共64个）',
  `u_sel_title` int(11) DEFAULT '0' COMMENT '当前选择的称号ID',
  `u_online` int(11) DEFAULT '0' COMMENT '是否在线，0不在线，1在线，用户连入roomserver时为1，断开时为0',
  `Count_attack` int(11) DEFAULT '0' COMMENT '总伤害\n',
  `Count_gametime` int(11) unsigned DEFAULT '0' COMMENT '总的游戏时间\n',
  `Count_draw` int(11) DEFAULT '0' COMMENT '平局次数\n',
  `Count_kill_leader` int(11) DEFAULT '0' COMMENT '杀死首领\n',
  `Count_capture` int(11) DEFAULT '0' COMMENT '占领次数',
  `Count_banner` int(11) DEFAULT '0' COMMENT '夺旗次数',
  `gameid` int(11) DEFAULT '-1',
  `roomid` int(11) DEFAULT '-1',
  `hostid` int(11) DEFAULT '-1',
  `serverid` int(11) DEFAULT '-1',
  `user_title` varchar(45) DEFAULT NULL COMMENT '头衔',
  `userscore` int(11) NOT NULL DEFAULT '0' COMMENT '赛季排行榜依据',
  `nationid` int(11) DEFAULT NULL COMMENT '国籍ID\n',
  `nationality` varchar(45) DEFAULT NULL COMMENT '国籍',
  `nationflag` int(11) NOT NULL COMMENT '国旗',
  `emblem` int(11) NOT NULL COMMENT '徽章',
  `junxian` int(11) NOT NULL COMMENT '军衔',
  `Epaulet` int(11) NOT NULL COMMENT '肩章',
  `normal_vip` int(11) DEFAULT NULL COMMENT 'VIP身份\n',
  `vip_deadline` int(11) NOT NULL DEFAULT '0' COMMENT 'vip截止时间',
  `u_unlimited_power` int(11) NOT NULL DEFAULT '0' COMMENT '是否无限体力：1是，0不是',
  `u_unlimited_power_time` int(11) NOT NULL DEFAULT '0' COMMENT '无限精力上限到期时间',
  `u_max_power` int(11) DEFAULT '0' COMMENT '最大体力',
  `u_cur_power` int(11) DEFAULT '0' COMMENT '当前体力\n',
  `u_time_power` int(11) DEFAULT NULL COMMENT '上次更新体力时间',
  `public_wuxun` varchar(45) DEFAULT NULL COMMENT '当前玩家的公共武勋星数之和',
  `relive_half` int(11) NOT NULL COMMENT '是否复活减半',
  `relive_half_time` int(11) NOT NULL COMMENT '复活减半到期时间',
  `user_guide` varchar(45) DEFAULT NULL COMMENT '新手引导  包含17个引导模块 有客户端传递服务器负责记录',
  `PROPERTY_ap_max` varchar(45) DEFAULT NULL,
  `PROPERTY_moving_speed_max` varchar(45) DEFAULT NULL,
  `PROPERTY_attack` varchar(45) DEFAULT NULL,
  `PROPERTY_shooting` varchar(45) DEFAULT NULL,
  `PROPERTY_crit_chance` varchar(45) DEFAULT NULL,
  `PROPERTY_defense` varchar(45) DEFAULT NULL,
  `PROPERTY_precision` varchar(45) DEFAULT NULL,
  `PROPERTY_disturbance` varchar(45) DEFAULT NULL,
  `PROPERTY_visual_field` varchar(45) DEFAULT NULL,
  `PROPERTY_crit_attack_max` varchar(45) DEFAULT NULL,
  `PROPERTY_crit_attack_min` varchar(45) DEFAULT NULL,
  `PROPERTY_bomber` varchar(45) DEFAULT NULL,
  `PROPERTY_distance` varchar(45) DEFAULT NULL,
  `PROPERTY_number` varchar(45) DEFAULT NULL,
  `PROPERTY_time` varchar(45) DEFAULT NULL,
  `PROPERTY_about_angle` varchar(45) DEFAULT NULL,
  `PROPERTY_rotate_turret_speed` varchar(45) DEFAULT NULL,
  `PROPERTY_disturbance_rotate_speed` varchar(45) DEFAULT NULL,
  `PROPERTY_fire_frequency` varchar(45) DEFAULT NULL,
  `PROPERTY_turnspeed` varchar(45) DEFAULT NULL,
  `PROPERTY_ricochet_rate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1504003 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_player_activity`
--

DROP TABLE IF EXISTS `u_player_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_player_activity` (
  `ID` int(11) NOT NULL COMMENT '关联玩家ID',
  `Level` int(11) DEFAULT NULL COMMENT '玩家活动期间等级',
  `R_money` float(11,0) DEFAULT NULL COMMENT '玩家活动期间拥有R币',
  `P_money` float(11,0) DEFAULT NULL COMMENT '玩家活动期间拥有P币',
  `Exe` int(11) DEFAULT NULL COMMENT '玩家活动期间获得经验',
  `Kill` int(11) DEFAULT NULL COMMENT '玩家活动期间杀人数',
  `Score` int(11) DEFAULT NULL COMMENT '玩家活动期间得分',
  `Victory` int(11) DEFAULT NULL COMMENT '玩家活动期间胜利次数',
  `Mvp` int(11) DEFAULT NULL COMMENT '玩家活动期间获得MVP次数',
  `Time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `End_Time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `State` int(11) DEFAULT NULL COMMENT '标记位',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_player_task`
--

DROP TABLE IF EXISTS `u_player_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_player_task` (
  `ID` int(11) NOT NULL,
  `Uid` int(11) DEFAULT NULL,
  `Game_map` int(11) DEFAULT '0' COMMENT '游戏地图',
  `Game_mode` int(11) DEFAULT '0' COMMENT '游戏模式',
  `Tank_type` int(11) DEFAULT '0' COMMENT '坦克类型 ',
  `Kill` int(11) DEFAULT '0' COMMENT '击杀数\n',
  `Death` int(11) DEFAULT '0' COMMENT '死亡数',
  `Series_kill` int(11) DEFAULT '0' COMMENT '连杀数',
  `Win` int(11) DEFAULT '0' COMMENT '胜利数',
  `Lose` int(11) DEFAULT '0' COMMENT '失败数',
  `Battle` int(11) DEFAULT '0' COMMENT '战斗数',
  `tanklevel` tinyint(1) DEFAULT NULL COMMENT '本场战斗的坦克等级',
  `p_money` int(1) DEFAULT NULL COMMENT '本场获得的金币',
  `player_exe` varchar(45) DEFAULT NULL COMMENT '本场获得的个人经验'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='玩家任务数据统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_player_task_item_use`
--

DROP TABLE IF EXISTS `u_player_task_item_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_player_task_item_use` (
  `ID` int(11) NOT NULL,
  `use_num` int(11) DEFAULT '0' COMMENT '使用次数',
  `count_use_num` int(11) DEFAULT '0' COMMENT '总使用次数',
  `uid` int(11) DEFAULT NULL,
  `item_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='道具使用次数统计\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_playreward`
--

DROP TABLE IF EXISTS `u_playreward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_playreward` (
  `reward_id` int(11) NOT NULL COMMENT '奖励id，对应reward表中id',
  `play_id` int(11) NOT NULL DEFAULT '0' COMMENT '玩家id标识',
  `award_time` datetime DEFAULT NULL COMMENT '奖励获取时间',
  PRIMARY KEY (`reward_id`,`play_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_season_Kill`
--

DROP TABLE IF EXISTS `u_season_Kill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_season_Kill` (
  `ID` int(11) NOT NULL COMMENT 'uid',
  `season_7` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_season_Level`
--

DROP TABLE IF EXISTS `u_season_Level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_season_Level` (
  `ID` int(11) NOT NULL COMMENT 'uid',
  `season_7` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_season_Mvp`
--

DROP TABLE IF EXISTS `u_season_Mvp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_season_Mvp` (
  `ID` int(11) NOT NULL COMMENT 'uid',
  `season_7` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_season_P_money`
--

DROP TABLE IF EXISTS `u_season_P_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_season_P_money` (
  `ID` int(11) NOT NULL COMMENT 'uid',
  `season_7` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_season_R_money`
--

DROP TABLE IF EXISTS `u_season_R_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_season_R_money` (
  `ID` int(11) NOT NULL COMMENT 'uid',
  `season_7` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_season_Victory`
--

DROP TABLE IF EXISTS `u_season_Victory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_season_Victory` (
  `ID` int(11) NOT NULL COMMENT 'uid',
  `season_7` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_season_data`
--

DROP TABLE IF EXISTS `u_season_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_season_data` (
  `ID` int(11) NOT NULL COMMENT 'uid',
  `season_7` int(11) DEFAULT NULL COMMENT '7天赛季 经验记录    日后可扩展',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_tank`
--

DROP TABLE IF EXISTS `u_tank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_tank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT '0' COMMENT '玩家ID\n',
  `tankid` int(11) DEFAULT '0' COMMENT 'Item_type 中的ID',
  `keeperId` int(11) DEFAULT '0' COMMENT '当前使用坦克',
  `tanktype` int(11) DEFAULT '0' COMMENT '类型 1 重型  2 远程  3突击',
  `tanklevel` int(11) DEFAULT '0' COMMENT '坦克自身资质(别动这个字段)这个值是个固定的值',
  `n_level` varchar(45) DEFAULT NULL COMMENT '新增字段 描述坦克的等级 这个值是跟随坦克经验不停增长的一个值',
  `tankexp` int(11) DEFAULT '0' COMMENT '经验',
  `attacklevel` int(11) DEFAULT '0' COMMENT '攻击等级',
  `defenselevel` int(11) DEFAULT '0' COMMENT '防御等级',
  `speedlevel` int(11) DEFAULT '0' COMMENT '速度等级',
  `aplevel` int(11) DEFAULT '0' COMMENT '血量等级',
  `tankcoat1` int(11) DEFAULT '0' COMMENT '涂装1,普通色',
  `tankcoat2` int(11) DEFAULT '0' COMMENT '涂装2,特殊色',
  `tankcoatlist` varchar(45) DEFAULT '0' COMMENT '涂装列表',
  `tank_wuxun` int(11) DEFAULT '0' COMMENT '当前武勋数',
  `tank_use_wuxun` int(11) DEFAULT '0' COMMENT '已使用武勋数',
  `max_wuxun` int(11) DEFAULT NULL COMMENT '每辆坦克获得最大武勋星数(封顶值)  本字段只对非金币坦克生效',
  `tank_status` int(11) DEFAULT '0' COMMENT 'tank状态0未解锁,1已解锁,2已拥有',
  `tank_win_num` int(11) DEFAULT '0' COMMENT '胜利次数, 暂时用于首胜判断.',
  `tank_money_type` int(11) DEFAULT '0' COMMENT '1,金币车(其实是只能使用钻石购买的车)（公共武勋星的）;  0, 普通车（不是\n公共武勋星的）',
  `tank_exp_coefficient` int(11) DEFAULT '0' COMMENT '经验加成系数,程序使用时,基数乘以这个系数然后除1000',
  `tank_money_coefficient` int(11) DEFAULT '0' COMMENT '金币加成系数,程序使用时,基数乘以这个系数然后除1000',
  `tank_repair_fee` int(11) DEFAULT NULL COMMENT '坦克修理费用',
  `tank_match_score` int(11) DEFAULT '0' COMMENT '坦克匹配基础分数',
  `tank_match_bonus` int(11) DEFAULT '0' COMMENT '坦克自动匹配加成系数(范围1-1000),需除1000.',
  `engineId` int(11) DEFAULT NULL COMMENT '对应u_tankUnits表中的ID',
  `muzzleId` int(11) DEFAULT NULL,
  `armorId` int(11) DEFAULT NULL,
  `vehicleId` int(11) DEFAULT NULL COMMENT '对应u_tankUnits表中的ID',
  `date_due` varchar(45) DEFAULT NULL COMMENT '坦克使用的到期时间（存还剩余的到期时间） 主要是针对登录奖励是可能奖励的>坦克而言 默认是一个无线大的值',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1156992 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_tank0506`
--

DROP TABLE IF EXISTS `u_tank0506`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_tank0506` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT '0' COMMENT '玩家ID\n',
  `tankid` int(11) DEFAULT '0' COMMENT 'Item_type 中的ID',
  `keeperId` int(11) DEFAULT '0' COMMENT '当前使用坦克',
  `tanktype` int(11) DEFAULT '0' COMMENT '类型 1 重型  2 远程  3突击',
  `tankexp` int(11) DEFAULT '0' COMMENT '经验',
  `tanklevel` int(11) DEFAULT '0' COMMENT '坦克自身等级',
  `attacklevel` int(11) DEFAULT '0' COMMENT '攻击等级',
  `defenselevel` int(11) DEFAULT '0' COMMENT '防御等级',
  `speedlevel` int(11) DEFAULT '0' COMMENT '速度等级',
  `aplevel` int(11) DEFAULT '0' COMMENT '血量等级',
  `tankcoat1` int(11) DEFAULT '0' COMMENT '涂装1,普通色',
  `tankcoat2` int(11) DEFAULT '0' COMMENT '涂装2,特殊色',
  `tankcoatlist` varchar(45) DEFAULT '0' COMMENT '涂装列表',
  `tank_wuxun` int(11) DEFAULT '0' COMMENT '当前武勋数',
  `tank_use_wuxun` int(11) DEFAULT '0' COMMENT '已使用武勋数',
  `max_wuxun` int(11) DEFAULT NULL COMMENT '每辆坦克获得最大武勋星数(封顶值)  本字段只对非金币坦克生效',
  `tank_status` int(11) DEFAULT '0' COMMENT 'tank状态0未解锁,1已解锁,2已拥有',
  `tank_win_num` int(11) DEFAULT '0' COMMENT '胜利次数, 暂时用于首胜判断.',
  `tank_money_type` int(11) DEFAULT '0' COMMENT '1,金币车(其实是只能使用钻石购买的车)（公共武勋星的）;  0, 普通车（不是公共武勋星的）',
  `tank_exp_coefficient` int(11) DEFAULT '0' COMMENT '经验加成系数,程序使用时,基数乘以这个系数然后除1000',
  `tank_money_coefficient` int(11) DEFAULT '0' COMMENT '金币加成系数,程序使用时,基数乘以这个系数然后除1000',
  `tank_repair_fee` int(11) DEFAULT '0' COMMENT '坦克修理费用\n',
  `tank_match_score` int(11) DEFAULT '0' COMMENT '坦克匹配基础分数',
  `tank_match_bonus` int(11) DEFAULT '0' COMMENT '坦克自动匹配加成系数(范围1-1000),需除1000.',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=651035 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_tankUnits`
--

DROP TABLE IF EXISTS `u_tankUnits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_tankUnits` (
  `id` int(11) NOT NULL,
  `playerId` int(11) DEFAULT '0',
  `unitId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_task`
--

DROP TABLE IF EXISTS `u_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_task` (
  `ID` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '玩家ＩＤ',
  `task_id` int(11) NOT NULL COMMENT 'u_task_cfg表中的ＩＤ',
  `task_num` int(11) NOT NULL COMMENT '单日完成次数',
  `task_time` bigint(20) NOT NULL COMMENT '接任务时间',
  `task_end` int(11) NOT NULL COMMENT '任务完成，１，完成，0未完成。',
  `is_cash` tinyint(1) DEFAULT NULL COMMENT '任务完成后是否兑奖的标志 0未兑  1已兑',
  `task_name` varchar(45) DEFAULT NULL,
  `task_type` int(1) DEFAULT NULL,
  `task_desc` varchar(45) DEFAULT NULL,
  `task_target` varchar(45) DEFAULT NULL,
  `go_to` varchar(45) DEFAULT NULL,
  `award_p_money` int(10) DEFAULT NULL,
  `award_Exe` int(10) DEFAULT NULL,
  `award_poupsid` varchar(100) DEFAULT NULL,
  `is_task_level` int(1) DEFAULT NULL,
  `is_count` tinyint(1) DEFAULT NULL,
  `is_stairs` tinyint(1) DEFAULT NULL COMMENT '是否是连续任务   是1 否0   8表示有8个小任务 最后一个是8',
  `stairs_space` tinyint(1) DEFAULT NULL COMMENT '连续任务的之间的步长 挑战任务1和2 是1   挑战任务3是3',
  `base_con` varchar(45) DEFAULT NULL,
  `target_con` varchar(45) DEFAULT NULL,
  `improve_con` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_task_aim`
--

DROP TABLE IF EXISTS `u_task_aim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_task_aim` (
  `ID` int(11) NOT NULL COMMENT '主键ID',
  `Game_mode` int(11) DEFAULT '0' COMMENT '游戏模式0组队、1单人、2夺旗、3首领、4占领、99无所谓',
  `Game_map` int(11) DEFAULT '0' COMMENT '游戏地图',
  `Kill` int(11) DEFAULT '0' COMMENT '击杀数',
  `Death` int(11) DEFAULT '0' COMMENT '死亡数',
  `Series_kill` int(11) DEFAULT '0' COMMENT '连杀数',
  `Win` int(11) DEFAULT '0' COMMENT '胜利数',
  `Lose` int(11) DEFAULT '0' COMMENT '失败数',
  `Battle` int(11) DEFAULT '0' COMMENT '战斗次数',
  `Tank_type` int(11) DEFAULT '0' COMMENT '坦克类型，1重型2远程3突击',
  `Props_id` int(11) DEFAULT '0' COMMENT '需要的道具id，对应item_type表里的ID',
  `Props_num` int(11) DEFAULT '0' COMMENT '需要的道具数量',
  `Use_number` int(11) DEFAULT '0' COMMENT '需要使用道具的使用次数',
  `Level` int(11) DEFAULT '0' COMMENT '需要达到的等级',
  `Count_kill` int(11) DEFAULT '0' COMMENT '总计击杀数',
  `Count_death` int(11) DEFAULT '0' COMMENT '总死亡数',
  `Count_Series_kill` int(11) DEFAULT '0' COMMENT '总连杀数',
  `Count_win` int(11) DEFAULT '0' COMMENT '总胜利次数',
  `Count_lose` int(11) DEFAULT '0' COMMENT '总失败次数',
  `Count_battle` int(11) DEFAULT '0' COMMENT '总战斗次数',
  `Time_limit` bigint(20) DEFAULT '0' COMMENT '时间限制:秒',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_task_aim_bak`
--

DROP TABLE IF EXISTS `u_task_aim_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_task_aim_bak` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `person_battle` int(11) NOT NULL DEFAULT '0' COMMENT '个人模式战斗次数',
  `team_battle` int(11) NOT NULL DEFAULT '0' COMMENT '组队模式',
  `flag_battle` int(11) NOT NULL DEFAULT '0' COMMENT '夺旗模式',
  `person_kill` int(11) NOT NULL DEFAULT '0' COMMENT '个人模式歼敌次数',
  `team_kill` int(11) NOT NULL DEFAULT '0' COMMENT '组队模式',
  `flag_kill` int(11) NOT NULL DEFAULT '0' COMMENT '夺旗模式',
  `props_id` int(11) NOT NULL DEFAULT '0' COMMENT '需要的道具ＩＤ(itemtype id)',
  `props_num` int(11) NOT NULL DEFAULT '0' COMMENT '道具数量',
  `count_battle` int(11) NOT NULL DEFAULT '0' COMMENT '总的战斗次数',
  `count_kill` int(11) NOT NULL DEFAULT '0' COMMENT '总的歼敌数',
  `team_win` int(11) NOT NULL DEFAULT '0' COMMENT '组队模式胜利次数',
  `person_win` int(11) NOT NULL DEFAULT '0' COMMENT '个人模式胜利次数',
  `flag_win` int(11) NOT NULL DEFAULT '0' COMMENT '夺旗模式胜利次数',
  `count_win` int(11) NOT NULL DEFAULT '0' COMMENT '总胜利次数',
  `time_limit` int(11) NOT NULL DEFAULT '0' COMMENT '完成该任务所限制的时间，单位为秒，-1为不限制',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_task_award`
--

DROP TABLE IF EXISTS `u_task_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_task_award` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `award_p_money` int(11) DEFAULT NULL COMMENT 'PB',
  `award_Exp` int(11) DEFAULT NULL COMMENT 'RB',
  `iid` int(11) DEFAULT NULL COMMENT '对应u_task表中improve_con字段的值',
  `title_id` int(11) DEFAULT NULL COMMENT '对应task_conf中的任务id',
  `propid` varchar(100) DEFAULT NULL COMMENT '道具列表',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_task_cfg`
--

DROP TABLE IF EXISTS `u_task_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_task_cfg` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `task_type` int(11) NOT NULL DEFAULT '0' COMMENT '任务类型',
  `task_name` varchar(20) NOT NULL COMMENT '任务名称',
  `allow_ignore` int(11) NOT NULL DEFAULT '0' COMMENT '可以跳过,1,是，０，否',
  `pre_taskid` int(11) NOT NULL DEFAULT '0' COMMENT '前置任务ＩＤ',
  `allow_level` int(11) NOT NULL DEFAULT '0' COMMENT '开始等级',
  `suggest_level` int(11) NOT NULL DEFAULT '0' COMMENT '建议等级',
  `allow_num` int(11) NOT NULL DEFAULT '0' COMMENT '每天可完成次数',
  `props_num` int(11) NOT NULL DEFAULT '0' COMMENT '领取任务需要的道具数量',
  `props_id` int(11) NOT NULL DEFAULT '0' COMMENT '需要的道具列表',
  `task_desp` varchar(50) NOT NULL COMMENT '任务描述',
  `task_summary` varchar(30) NOT NULL COMMENT '任务简介',
  `task_aim` int(11) NOT NULL DEFAULT '0' COMMENT '任务达成条件',
  `task_award` int(11) NOT NULL DEFAULT '0' COMMENT '任务奖励',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=343438 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_top10`
--

DROP TABLE IF EXISTS `u_top10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_top10` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `list_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_ver`
--

DROP TABLE IF EXISTS `u_ver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_ver` (
  `ID` varchar(255) NOT NULL,
  `Server_ver` varchar(255) DEFAULT NULL,
  `Resource` varchar(255) DEFAULT NULL,
  `Update` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_version1`
--

DROP TABLE IF EXISTS `u_version1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_version1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curVersion` varchar(50) DEFAULT NULL,
  `vIntroduce` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_wash_point`
--

DROP TABLE IF EXISTS `u_wash_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_wash_point` (
  `ID` int(11) NOT NULL COMMENT '用户uid',
  `last_PROPERTY_ap_max` varchar(45) DEFAULT NULL,
  `last_PROPERTY_moving_speed_max` varchar(45) DEFAULT NULL,
  `last_PROPERTY_attack` varchar(45) DEFAULT NULL,
  `last_PROPERTY_shooting` varchar(45) DEFAULT NULL,
  `last_PROPERTY_crit_chance` varchar(45) DEFAULT NULL,
  `last_PROPERTY_defense` varchar(45) DEFAULT NULL,
  `last_PROPERTY_precision` varchar(45) DEFAULT NULL,
  `last_PROPERTY_disturbance` varchar(45) DEFAULT NULL,
  `last_PROPERTY_visual_field` varchar(45) DEFAULT NULL,
  `last_PROPERTY_crit_attack_max` varchar(45) DEFAULT NULL,
  `last_PROPERTY_crit_attack_min` varchar(45) DEFAULT NULL,
  `last_PROPERTY_bomber` varchar(45) DEFAULT NULL,
  `last_PROPERTY_distance` varchar(45) DEFAULT NULL,
  `last_PROPERTY_number` varchar(45) DEFAULT NULL,
  `last_PROPERTY_time` varchar(45) DEFAULT NULL,
  `last_PROPERTY_about_angle` varchar(45) DEFAULT NULL,
  `last_PROPERTY_rotate_turret_speed` varchar(45) DEFAULT NULL,
  `last_PROPERTY_disturbance_rotate_speed` varchar(45) DEFAULT NULL,
  `last_PROPERTY_fire_frequency` varchar(45) DEFAULT NULL,
  `last_PROPERTY_turnspeed` varchar(45) DEFAULT NULL,
  `last_PROPERTY_ricochet_rate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uplevel_activity`
--

DROP TABLE IF EXISTS `uplevel_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uplevel_activity` (
  `ID` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `describe` varchar(255) NOT NULL DEFAULT '0',
  `platform` varchar(50) NOT NULL DEFAULT 'itunes',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_game_list`
--

DROP TABLE IF EXISTS `user_game_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_game_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `serverid` int(11) DEFAULT NULL,
  `gamename` char(50) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1626298 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='类似user_room_list,所有游戏列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_proxy_list`
--

DROP TABLE IF EXISTS `user_proxy_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_proxy_list` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='user_proxy_list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_room_list`
--

DROP TABLE IF EXISTS `user_room_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_room_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `roomid` int(11) DEFAULT NULL,
  `roomname` varchar(100) DEFAULT NULL,
  `user_num` int(11) DEFAULT NULL,
  `max_user_num` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `cond1` int(11) DEFAULT NULL,
  `cond2` int(11) DEFAULT NULL,
  `cond3` int(11) DEFAULT NULL,
  `cond4` int(11) DEFAULT NULL,
  `cond5` int(11) DEFAULT NULL,
  `serverid` int(11) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1626299 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_service_list`
--

DROP TABLE IF EXISTS `user_service_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_service_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `serverid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1626297 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vipshop`
--

DROP TABLE IF EXISTS `vipshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vipshop` (
  `ID` int(11) unsigned NOT NULL COMMENT '自增主键id',
  `Item` int(11) DEFAULT NULL COMMENT '填写itemtype表里对应的id',
  `Type` int(11) DEFAULT NULL COMMENT '销售类型：坦克无折扣填1 炮管无折扣填2 有折扣都填3\n(该字段已放弃, 折扣对应的功能直接修改Discount值 当discount为100时表示不打折,其它表示折扣,如80表示打8折,120表示价格提升%20)',
  `Discount` int(11) DEFAULT NULL COMMENT '折扣率  当discount为100时表示不打折,其它表示折扣,如80表示打8折,120表示价格提升%20',
  `P_money` int(11) DEFAULT '0' COMMENT '金币',
  `R_money` int(11) DEFAULT '0' COMMENT '钻石',
  `item_limittime` int(11) DEFAULT '0' COMMENT '使用时间,有效期:秒',
  `grounding_type` int(11) DEFAULT '1' COMMENT '是否上架 0.不上架 1.上架',
  `item_type` int(11) DEFAULT '1' COMMENT '使用类型1.按时间类型使用2.按次数类型使用',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vipshop_0506`
--

DROP TABLE IF EXISTS `vipshop_0506`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vipshop_0506` (
  `ID` int(11) unsigned NOT NULL COMMENT '自增主键id',
  `Item` int(11) DEFAULT NULL COMMENT '填写itemtype表里对应的id',
  `Type` int(11) DEFAULT NULL COMMENT '销售类型：坦克无折扣填1 炮管无折扣填2 有折扣都填3\n(该字段已放弃, 折扣对应的功能直接修改Discount值 当discount为100时表示不打折,其它表示折扣,如80表示打8折,120表示价格提升%20)',
  `Discount` int(11) DEFAULT NULL COMMENT '折扣率  当discount为100时表示不打折,其它表示折扣,如80表示打8折,120表示价格提升%20',
  `P_money` int(11) DEFAULT '0' COMMENT '金币',
  `R_money` int(11) DEFAULT '0' COMMENT '钻石',
  `item_limittime` int(11) DEFAULT '0' COMMENT '使用时间,有效期:秒',
  `grounding_type` int(11) DEFAULT '1' COMMENT '是否上架 0.不上架 1.上架',
  `item_type` int(11) DEFAULT '1' COMMENT '使用类型1.按时间类型使用2.按次数类型使用',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wash_point`
--

DROP TABLE IF EXISTS `wash_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wash_point` (
  `ID` int(1) NOT NULL,
  `flush_R_money` varchar(1000) DEFAULT NULL COMMENT '啥新的价格',
  `level_rate` varchar(1000) DEFAULT NULL COMMENT '对应人物等级等级的一个基数',
  `vip_rate` varchar(200) DEFAULT NULL COMMENT '对应Vip等级的一个基数',
  `PROPERTY_ap_max` varchar(30) DEFAULT NULL COMMENT '血量',
  `PROPERTY_moving_speed_max` varchar(30) DEFAULT NULL COMMENT '移动速度',
  `PROPERTY_attack` varchar(30) DEFAULT NULL COMMENT '攻击',
  `PROPERTY_shooting` varchar(30) DEFAULT NULL COMMENT '装填时间',
  `PROPERTY_crit_chance` varchar(30) DEFAULT NULL COMMENT '暴击率',
  `PROPERTY_defense` varchar(30) DEFAULT NULL COMMENT '防御',
  `PROPERTY_precision` varchar(30) DEFAULT NULL COMMENT '精度',
  `PROPERTY_disturbance` varchar(30) DEFAULT NULL COMMENT '扰动',
  `PROPERTY_visual_field` varchar(30) DEFAULT NULL COMMENT '可视距离',
  `PROPERTY_crit_attack_max` varchar(30) DEFAULT NULL COMMENT '最大暴击加成',
  `PROPERTY_crit_attack_min` varchar(30) DEFAULT NULL COMMENT '最小暴击加成',
  `PROPERTY_bomber` varchar(30) DEFAULT NULL COMMENT '爆炸范围',
  `PROPERTY_distance` varchar(30) DEFAULT NULL COMMENT '锁定距离',
  `PROPERTY_number` varchar(30) DEFAULT NULL COMMENT '子弹数',
  `PROPERTY_time` varchar(30) DEFAULT NULL,
  `PROPERTY_about_angle` varchar(30) DEFAULT NULL COMMENT '瞄准左右范围角',
  `PROPERTY_rotate_turret_speed` varchar(30) DEFAULT NULL COMMENT '炮塔转速',
  `PROPERTY_disturbance_rotate_speed` varchar(30) DEFAULT NULL COMMENT '炮塔扰动转速(瞄准)',
  `PROPERTY_fire_frequency` varchar(30) DEFAULT NULL COMMENT '转弯速度',
  `PROPERTY_turnspeed` varchar(30) DEFAULT NULL COMMENT '转弯速度',
  `PROPERTY_ricochet_rate` varchar(30) DEFAULT NULL COMMENT '跳弹率',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-11 10:45:52
