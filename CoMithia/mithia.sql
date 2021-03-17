/*
Navicat MySQL Data Transfer

Source Server         : Mithia-Prod
Source Server Version : 50529
Source Host           : comithia.com:3306
Source Database       : mithia

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-04-17 00:18:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `AccountRegistry`
-- ----------------------------
DROP TABLE IF EXISTS `AccountRegistry`;
CREATE TABLE `AccountRegistry` (
  `ArgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ArgActId` int(10) unsigned NOT NULL DEFAULT '0',
  `ArgIdentifier` varchar(45) NOT NULL DEFAULT '',
  `ArgValue` int(10) unsigned NOT NULL DEFAULT '0',
  `ArgPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ArgId`),
  KEY `Account` (`ArgActId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of AccountRegistry
-- ----------------------------

-- ----------------------------
-- Table structure for `AdminPassword`
-- ----------------------------
DROP TABLE IF EXISTS `AdminPassword`;
CREATE TABLE `AdminPassword` (
  `AdmId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AdmActId` int(10) unsigned NOT NULL DEFAULT '0',
  `AdmPassword` varchar(255) NOT NULL DEFAULT '',
  `AdmTimer` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AdmId`),
  KEY `AdmActId` (`AdmActId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of AdminPassword
-- ----------------------------

-- ----------------------------
-- Table structure for `Aethers`
-- ----------------------------
DROP TABLE IF EXISTS `Aethers`;
CREATE TABLE `Aethers` (
  `AthId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AthChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `AthSplId` int(10) unsigned NOT NULL DEFAULT '0',
  `AthDuration` int(10) unsigned NOT NULL DEFAULT '0',
  `AthAether` int(10) unsigned NOT NULL DEFAULT '0',
  `AthPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AthId`),
  KEY `AthSplId` (`AthSplId`),
  KEY `AthChaId` (`AthChaId`)
) ENGINE=InnoDB AUTO_INCREMENT=275344 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Aethers
-- ----------------------------

-- ----------------------------
-- Table structure for `AfkLogs`
-- ----------------------------
DROP TABLE IF EXISTS `AfkLogs`;
CREATE TABLE `AfkLogs` (
  `AfkId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AfkDate` datetime DEFAULT NULL,
  `AfkChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `AfkMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `AfkX` int(10) unsigned NOT NULL DEFAULT '0',
  `AfkY` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AfkId`),
  KEY `AfkMapId` (`AfkMapId`),
  KEY `AfkChaId` (`AfkChaId`)
) ENGINE=InnoDB AUTO_INCREMENT=6385 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of AfkLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `ArmorClassification`
-- ----------------------------
DROP TABLE IF EXISTS `ArmorClassification`;
CREATE TABLE `ArmorClassification` (
  `ArcId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ArcName` varchar(64) NOT NULL DEFAULT '',
  `ArcLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `ArcLookColor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ArcId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ArmorClassification
-- ----------------------------

-- ----------------------------
-- Table structure for `ArmorType`
-- ----------------------------
DROP TABLE IF EXISTS `ArmorType`;
CREATE TABLE `ArmorType` (
  `ArtId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ArtName` varchar(64) NOT NULL DEFAULT '',
  `ArtMark` int(10) unsigned NOT NULL DEFAULT '0',
  `ArtLook` int(10) unsigned NOT NULL DEFAULT '0',
  `ArtClass` int(10) unsigned NOT NULL DEFAULT '0',
  `ArtSex` int(10) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`ArtId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ArmorType
-- ----------------------------

-- ----------------------------
-- Table structure for `Authorize`
-- ----------------------------
DROP TABLE IF EXISTS `Authorize`;
CREATE TABLE `Authorize` (
  `AutId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `AutChaId` int(11) unsigned NOT NULL DEFAULT '0',
  `AutChaName` varchar(16) NOT NULL DEFAULT '',
  `AutIP` int(11) unsigned NOT NULL DEFAULT '0',
  `AutTimer` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AutId`),
  KEY `AutChaName` (`AutChaName`),
  KEY `AutChaId` (`AutChaId`)
) ENGINE=InnoDB AUTO_INCREMENT=926 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Authorize
-- ----------------------------

-- ----------------------------
-- Table structure for `Banks`
-- ----------------------------
DROP TABLE IF EXISTS `Banks`;
CREATE TABLE `Banks` (
  `BnkId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `BnkChaId` int(11) unsigned NOT NULL DEFAULT '0',
  `BnkItmId` int(11) unsigned NOT NULL DEFAULT '0',
  `BnkAmount` int(11) unsigned NOT NULL DEFAULT '0',
  `BnkChaIdOwner` int(11) unsigned NOT NULL DEFAULT '0',
  `BnkEngrave` varchar(64) NOT NULL DEFAULT '0',
  `BnkTimer` int(11) unsigned NOT NULL DEFAULT '0',
  `BnkPosition` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`BnkId`),
  KEY `BnkChaId` (`BnkChaId`),
  KEY `BnkItmId` (`BnkItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=10407 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Banks
-- ----------------------------

-- ----------------------------
-- Table structure for `BoardNames`
-- ----------------------------
DROP TABLE IF EXISTS `BoardNames`;
CREATE TABLE `BoardNames` (
  `BnmId` int(10) unsigned NOT NULL DEFAULT '0',
  `BnmIdentifier` varchar(64) NOT NULL DEFAULT '',
  `BnmDescription` varchar(64) NOT NULL DEFAULT '',
  `BnmLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `BnmGMLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `BnmPthId` int(10) unsigned NOT NULL DEFAULT '0',
  `BnmClnId` int(10) unsigned NOT NULL DEFAULT '0',
  `BnmScripted` int(10) unsigned NOT NULL DEFAULT '0',
  `BnmSortOrder` int(10) unsigned NOT NULL DEFAULT '256',
  PRIMARY KEY (`BnmId`),
  KEY `BnmClnId` (`BnmClnId`),
  KEY `BnmPthId` (`BnmPthId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of BoardNames
-- ----------------------------

-- ----------------------------
-- Table structure for `Boards`
-- ----------------------------
DROP TABLE IF EXISTS `Boards`;
CREATE TABLE `Boards` (
  `BrdId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BrdBnmId` int(10) unsigned NOT NULL DEFAULT '0',
  `BrdChaName` varchar(16) NOT NULL DEFAULT '',
  `BrdBtlId` int(10) unsigned NOT NULL DEFAULT '0',
  `BrdHighlighted` int(11) NOT NULL DEFAULT '0',
  `BrdMonth` int(10) unsigned NOT NULL DEFAULT '0',
  `BrdDay` int(10) unsigned NOT NULL DEFAULT '0',
  `BrdTopic` varchar(255) NOT NULL DEFAULT '',
  `BrdPost` text NOT NULL,
  `BrdPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`BrdId`),
  KEY `BrdBnmId` (`BrdBnmId`),
  KEY `BrdChaName` (`BrdChaName`),
  KEY `BrdBtlId` (`BrdBtlId`)
) ENGINE=InnoDB AUTO_INCREMENT=3263 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Boards
-- ----------------------------

-- ----------------------------
-- Table structure for `BoardTitles`
-- ----------------------------
DROP TABLE IF EXISTS `BoardTitles`;
CREATE TABLE `BoardTitles` (
  `BtlId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BtlDescription` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`BtlId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of BoardTitles
-- ----------------------------

-- ----------------------------
-- Table structure for `BreakLogs`
-- ----------------------------
DROP TABLE IF EXISTS `BreakLogs`;
CREATE TABLE `BreakLogs` (
  `BrkId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BrkDate` datetime DEFAULT NULL,
  `BrkChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `BrkMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `BrkX` int(10) unsigned NOT NULL DEFAULT '0',
  `BrkY` int(10) unsigned NOT NULL DEFAULT '0',
  `BrkItmId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`BrkId`),
  KEY `BrkChaId` (`BrkChaId`),
  KEY `BrkMapId` (`BrkMapId`),
  KEY `BrkItmId` (`BrkItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of BreakLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `BuyLogs`
-- ----------------------------
DROP TABLE IF EXISTS `BuyLogs`;
CREATE TABLE `BuyLogs` (
  `BuyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BuyDate` datetime DEFAULT NULL,
  `BuyChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyX` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyY` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyAmount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`BuyId`),
  KEY `BuyChaId` (`BuyChaId`),
  KEY `BuyMapId` (`BuyMapId`),
  KEY `BuyItmId` (`BuyItmId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of BuyLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Character`
-- ----------------------------
DROP TABLE IF EXISTS `Character`;
CREATE TABLE `Character` (
  `ChaId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ChaName` varchar(16) NOT NULL DEFAULT '',
  `ChaPassword` varchar(32) NOT NULL DEFAULT '',
  `ChaBanned` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaClnId` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaClanTitle` varchar(32) NOT NULL DEFAULT '',
  `ChaTitle` varchar(32) NOT NULL DEFAULT '',
  `ChaLevel` int(10) unsigned NOT NULL DEFAULT '1',
  `ChaPthId` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaMark` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaTier` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaTotem` int(10) unsigned NOT NULL DEFAULT '4',
  `ChaKarma` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaCurrentVita` int(10) unsigned NOT NULL DEFAULT '100',
  `ChaMaximumVita` int(10) unsigned NOT NULL DEFAULT '100',
  `ChaCurrentMana` int(10) unsigned NOT NULL DEFAULT '50',
  `ChaMaximumMana` int(10) unsigned NOT NULL DEFAULT '50',
  `ChaExperience` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaGold` int(10) unsigned NOT NULL DEFAULT '100',
  `ChaSex` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaNation` int(10) unsigned NOT NULL DEFAULT '5',
  `ChaFace` int(10) unsigned NOT NULL DEFAULT '200',
  `ChaFaceColor` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaHair` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaHairColor` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaSkinColor` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaArmorColor` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaX` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaY` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaSide` int(10) unsigned NOT NULL DEFAULT '2',
  `ChaState` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaOnline` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaChaIdSpouse` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaClanChat` int(10) unsigned NOT NULL DEFAULT '1',
  `ChaPathChat` int(10) unsigned NOT NULL DEFAULT '1',
  `ChaActId` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaSettings` int(10) unsigned NOT NULL DEFAULT '12605',
  `ChaGMLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaF1Name` varchar(16) NOT NULL DEFAULT '',
  `ChaDisguise` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaDisguiseColor` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaPK` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaKilledBy` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaKillsPK` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaPKDuration` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaMuted` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaHeroes` int(10) unsigned NOT NULL DEFAULT '1',
  `ChaMaximumInventory` int(10) unsigned NOT NULL DEFAULT '27',
  `ChaMaximumBankSlots` int(10) unsigned NOT NULL DEFAULT '15',
  `ChaBankGold` int(10) unsigned NOT NULL DEFAULT '0',
  `ChaExperienceSold` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChaId`),
  KEY `ChaActId` (`ChaActId`),
  KEY `ChaName` (`ChaName`),
  KEY `ChaClnId` (`ChaClnId`),
  KEY `ChaPthId` (`ChaPthId`),
  KEY `ChaMapId` (`ChaMapId`)
) ENGINE=InnoDB AUTO_INCREMENT=1895 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Character
-- ----------------------------

-- ----------------------------
-- Table structure for `CharacterDeathDropLogs`
-- ----------------------------
DROP TABLE IF EXISTS `CharacterDeathDropLogs`;
CREATE TABLE `CharacterDeathDropLogs` (
  `CddId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CddDate` datetime DEFAULT NULL,
  `CddChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `CddMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `CddX` int(10) unsigned NOT NULL DEFAULT '0',
  `CddY` int(10) unsigned NOT NULL DEFAULT '0',
  `CddItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `CddAmount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CddId`),
  KEY `CddChaId` (`CddChaId`),
  KEY `CddMapId` (`CddMapId`),
  KEY `CddItmId` (`CddItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=3258 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of CharacterDeathDropLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `ClanBanks`
-- ----------------------------
DROP TABLE IF EXISTS `ClanBanks`;
CREATE TABLE `ClanBanks` (
  `CbkId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CbkClnId` int(10) unsigned NOT NULL DEFAULT '0',
  `CbkItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `CbkAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `CbkPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CbkId`),
  KEY `CbkClnId` (`CbkClnId`),
  KEY `CbkItmId` (`CbkItmId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ClanBanks
-- ----------------------------

-- ----------------------------
-- Table structure for `ClanLogs`
-- ----------------------------
DROP TABLE IF EXISTS `ClanLogs`;
CREATE TABLE `ClanLogs` (
  `ClgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ClgDate` datetime DEFAULT NULL,
  `ClgChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `ClgClnId` int(10) unsigned NOT NULL DEFAULT '0',
  `ClgMessage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ClgId`),
  KEY `ClgChaId` (`ClgChaId`),
  KEY `ClgClnId` (`ClgClnId`)
) ENGINE=InnoDB AUTO_INCREMENT=1564 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ClanLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Clans`
-- ----------------------------
DROP TABLE IF EXISTS `Clans`;
CREATE TABLE `Clans` (
  `ClnId` int(10) unsigned NOT NULL,
  `ClnName` varchar(64) NOT NULL DEFAULT '',
  `ClnBankSlots` int(10) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`ClnId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Clans
-- ----------------------------

-- ----------------------------
-- Table structure for `DropLogs`
-- ----------------------------
DROP TABLE IF EXISTS `DropLogs`;
CREATE TABLE `DropLogs` (
  `DrpId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DrpDate` datetime DEFAULT NULL,
  `DrpChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `DrpMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `DrpX` int(10) unsigned NOT NULL DEFAULT '0',
  `DrpY` int(10) unsigned NOT NULL DEFAULT '0',
  `DrpItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `DrpAmount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DrpId`),
  KEY `DrpChaId` (`DrpChaId`),
  KEY `DrpMapId` (`DrpMapId`),
  KEY `DrpItmId` (`DrpItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=5951 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of DropLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Enchantments`
-- ----------------------------
DROP TABLE IF EXISTS `Enchantments`;
CREATE TABLE `Enchantments` (
  `EncId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EncName` varchar(64) NOT NULL DEFAULT '',
  `EncMark` int(10) unsigned NOT NULL DEFAULT '0',
  `EncClass` int(10) unsigned NOT NULL DEFAULT '0',
  `EncVita` int(10) unsigned NOT NULL DEFAULT '0',
  `EncMana` int(10) unsigned NOT NULL DEFAULT '0',
  `EncMight` int(10) unsigned NOT NULL DEFAULT '0',
  `EncGrace` int(10) unsigned NOT NULL DEFAULT '0',
  `EncWill` int(10) unsigned NOT NULL DEFAULT '0',
  `EncWisdom` int(10) unsigned NOT NULL DEFAULT '0',
  `EncCon` int(10) unsigned NOT NULL DEFAULT '0',
  `EncProtection` int(10) unsigned NOT NULL DEFAULT '0',
  `EncArmor` int(10) unsigned NOT NULL DEFAULT '0',
  `EncHit` int(10) unsigned NOT NULL DEFAULT '0',
  `EncDam` int(10) unsigned NOT NULL DEFAULT '0',
  `EncMinimumDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `EncMaximumDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `EncApplyto` int(10) unsigned NOT NULL DEFAULT '31' COMMENT '0 = applies to all equip\n1 = armor\n2 = weap\n4 = helm\n8 = gloves\n16 = subaccess',
  PRIMARY KEY (`EncId`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Enchantments
-- ----------------------------

-- ----------------------------
-- Table structure for `EquipLogs`
-- ----------------------------
DROP TABLE IF EXISTS `EquipLogs`;
CREATE TABLE `EquipLogs` (
  `ElgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ElgDate` datetime DEFAULT NULL,
  `ElgChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `ElgMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `ElgX` int(10) unsigned NOT NULL DEFAULT '0',
  `ElgY` int(10) unsigned NOT NULL DEFAULT '0',
  `ElgItmId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ElgId`),
  KEY `ElgChaId` (`ElgChaId`),
  KEY `ElgMapId` (`ElgMapId`),
  KEY `ElgItmId` (`ElgItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=2510 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of EquipLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Equipment`
-- ----------------------------
DROP TABLE IF EXISTS `Equipment`;
CREATE TABLE `Equipment` (
  `EqpId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EqpChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `EqpItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `EqpDurability` int(10) unsigned NOT NULL DEFAULT '0',
  `EqpChaIdOwner` int(10) unsigned NOT NULL DEFAULT '0',
  `EqpEngrave` varchar(64) NOT NULL DEFAULT '',
  `EqpTimer` int(10) unsigned NOT NULL DEFAULT '0',
  `EqpSlot` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`EqpId`),
  KEY `EqpChaId` (`EqpChaId`),
  KEY `EqpItmId` (`EqpItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=19708 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Equipment
-- ----------------------------

-- ----------------------------
-- Table structure for `ExchangeLogs`
-- ----------------------------
DROP TABLE IF EXISTS `ExchangeLogs`;
CREATE TABLE `ExchangeLogs` (
  `ExgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ExgDate` datetime DEFAULT NULL,
  `ExgChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `ExgMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `ExgX` int(10) unsigned NOT NULL DEFAULT '0',
  `ExgY` int(10) unsigned NOT NULL DEFAULT '0',
  `ExgTarget` int(10) unsigned NOT NULL DEFAULT '0',
  `ExgMapIdTarget` int(10) unsigned NOT NULL DEFAULT '0',
  `ExgXTarget` int(10) unsigned NOT NULL DEFAULT '0',
  `ExgYTarget` int(10) unsigned NOT NULL DEFAULT '0',
  `ExgItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `ExgAmount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ExgId`),
  KEY `ExgChaId` (`ExgChaId`),
  KEY `ExgMapId` (`ExgMapId`),
  KEY `ExgItmId` (`ExgItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ExchangeLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Friends`
-- ----------------------------
DROP TABLE IF EXISTS `Friends`;
CREATE TABLE `Friends` (
  `FndId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FndChaId` int(10) unsigned NOT NULL,
  `FndChaName1` varchar(16) NOT NULL DEFAULT '',
  `FndChaName2` varchar(16) NOT NULL DEFAULT '',
  `FndChaName3` varchar(16) NOT NULL DEFAULT '',
  `FndChaName4` varchar(16) NOT NULL DEFAULT '',
  `FndChaName5` varchar(16) NOT NULL DEFAULT '',
  `FndChaName6` varchar(16) NOT NULL DEFAULT '',
  `FndChaName7` varchar(16) NOT NULL DEFAULT '',
  `FndChaName8` varchar(16) NOT NULL DEFAULT '',
  `FndChaName9` varchar(16) NOT NULL DEFAULT '',
  `FndChaName10` varchar(16) NOT NULL DEFAULT '',
  `FndChaName11` varchar(16) NOT NULL DEFAULT '',
  `FndChaName12` varchar(16) NOT NULL DEFAULT '',
  `FndChaName13` varchar(16) NOT NULL DEFAULT '',
  `FndChaName14` varchar(16) NOT NULL DEFAULT '',
  `FndChaName15` varchar(16) NOT NULL DEFAULT '',
  `FndChaName16` varchar(16) NOT NULL DEFAULT '',
  `FndChaName17` varchar(16) NOT NULL DEFAULT '',
  `FndChaName18` varchar(16) NOT NULL DEFAULT '',
  `FndChaName19` varchar(16) NOT NULL DEFAULT '',
  `FndChaName20` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`FndId`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Friends
-- ----------------------------

-- ----------------------------
-- Table structure for `GameRegistry`
-- ----------------------------
DROP TABLE IF EXISTS `GameRegistry`;
CREATE TABLE `GameRegistry` (
  `GrgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GrgIdentifier` varchar(45) NOT NULL DEFAULT '',
  `GrgValue` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`GrgId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of GameRegistry
-- ----------------------------

-- ----------------------------
-- Table structure for `HandLogs`
-- ----------------------------
DROP TABLE IF EXISTS `HandLogs`;
CREATE TABLE `HandLogs` (
  `HndId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `HndDate` datetime DEFAULT NULL,
  `HndChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `HndMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `HndX` int(10) unsigned NOT NULL DEFAULT '0',
  `HndY` int(10) unsigned NOT NULL DEFAULT '0',
  `HndItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `HndAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `HndTarget` int(10) unsigned NOT NULL DEFAULT '0',
  `HndMapIdTarget` int(10) unsigned NOT NULL DEFAULT '0',
  `HndXTarget` int(10) unsigned NOT NULL DEFAULT '0',
  `HndYTarget` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`HndId`),
  KEY `HndChaId` (`HndChaId`),
  KEY `HndMapId` (`HndMapId`),
  KEY `HndItmId` (`HndItmId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of HandLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Inventory`
-- ----------------------------
DROP TABLE IF EXISTS `Inventory`;
CREATE TABLE `Inventory` (
  `InvId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `InvChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `InvItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `InvAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `InvDurability` int(10) unsigned NOT NULL DEFAULT '0',
  `InvChaIdOwner` int(10) unsigned NOT NULL DEFAULT '0',
  `InvEngrave` varchar(64) NOT NULL DEFAULT '',
  `InvTimer` int(10) unsigned NOT NULL DEFAULT '0',
  `InvPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`InvId`),
  KEY `InvChaId` (`InvChaId`),
  KEY `InvItmId` (`InvItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=481676 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Inventory
-- ----------------------------

-- ----------------------------
-- Table structure for `Items`
-- ----------------------------
DROP TABLE IF EXISTS `Items`;
CREATE TABLE `Items` (
  `ItmId` int(10) unsigned NOT NULL,
  `ItmPthId` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmIdentifier` varchar(64) NOT NULL DEFAULT '',
  `ItmDescription` varchar(64) NOT NULL DEFAULT '',
  `ItmType` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmBuyPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmSellPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMaximumAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmSex` int(10) unsigned NOT NULL DEFAULT '2',
  `ItmLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmLook` int(10) NOT NULL DEFAULT '0',
  `ItmLookColor` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmIcon` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmIconColor` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmSound` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmDurability` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMight` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmGrace` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmWill` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmWisdom` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmCon` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmProtection` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmArmor` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmHit` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmDam` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmAttackSpeed` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMinimumDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMaximumDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmVita` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMana` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmVitaRequired` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmManaRequired` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmText` varchar(64) NOT NULL DEFAULT '',
  `ItmBuyText` varchar(64) NOT NULL DEFAULT '',
  `ItmExchangeable` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmDepositable` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmDroppable` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmThrown` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmUniqueAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmIndestructible` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmEvent` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmTimer` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMark` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmChaIdDiscoverer` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ItmId`),
  KEY `ItmPthId` (`ItmPthId`),
  KEY `ItmChaId` (`ItmChaIdDiscoverer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Items
-- ----------------------------

-- ----------------------------
-- Table structure for `Items_Test`
-- ----------------------------
DROP TABLE IF EXISTS `Items_Test`;
CREATE TABLE `Items_Test` (
  `ItmId` int(10) unsigned NOT NULL,
  `ItmPthId` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmIdentifier` varchar(64) NOT NULL DEFAULT '',
  `ItmDescription` varchar(64) NOT NULL DEFAULT '',
  `ItmType` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmBuyPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmSellPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMaximumAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmSex` int(10) unsigned NOT NULL DEFAULT '2',
  `ItmLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmLook` int(10) NOT NULL DEFAULT '0',
  `ItmLookColor` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmIcon` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmIconColor` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmSound` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmDurability` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMight` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmGrace` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmWill` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmWisdom` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmCon` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmProtection` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmArmor` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmHit` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmDam` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmAttackSpeed` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMinimumDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMaximumDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmVita` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMana` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmVitaRequired` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmManaRequired` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmText` varchar(64) NOT NULL DEFAULT '',
  `ItmBuyText` varchar(64) NOT NULL DEFAULT '',
  `ItmExchangeable` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmDepositable` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmDroppable` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmThrown` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmUniqueAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmIndestructible` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmEvent` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmTimer` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmMark` int(10) unsigned NOT NULL DEFAULT '0',
  `ItmChaIdDiscoverer` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ItmId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Items_Test
-- ----------------------------

-- ----------------------------
-- Table structure for `KillLogs`
-- ----------------------------
DROP TABLE IF EXISTS `KillLogs`;
CREATE TABLE `KillLogs` (
  `KlgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `KlgChaId` int(10) unsigned NOT NULL,
  `KlgMobId` int(10) unsigned NOT NULL,
  `KlgAmount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`KlgId`),
  KEY `KlgChaId` (`KlgChaId`) USING BTREE,
  KEY `KlgMobId` (`KlgMobId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2626 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of KillLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Kills`
-- ----------------------------
DROP TABLE IF EXISTS `Kills`;
CREATE TABLE `Kills` (
  `KilId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `KilChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `KilMobId` int(10) unsigned NOT NULL DEFAULT '0',
  `KilAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `KilPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`KilId`),
  KEY `KilChaId` (`KilChaId`),
  KEY `KilMobId` (`KilMobId`)
) ENGINE=InnoDB AUTO_INCREMENT=67547 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Kills
-- ----------------------------

-- ----------------------------
-- Table structure for `Legends`
-- ----------------------------
DROP TABLE IF EXISTS `Legends`;
CREATE TABLE `Legends` (
  `LegId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LegChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `LegIdentifier` varchar(32) NOT NULL DEFAULT '',
  `LegDescription` varchar(255) NOT NULL DEFAULT '',
  `LegIcon` int(10) unsigned NOT NULL DEFAULT '0',
  `LegColor` int(10) unsigned NOT NULL DEFAULT '0',
  `LegPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`LegId`),
  KEY `LegChaId` (`LegChaId`)
) ENGINE=InnoDB AUTO_INCREMENT=11003 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Legends
-- ----------------------------

-- ----------------------------
-- Table structure for `LoginLogs`
-- ----------------------------
DROP TABLE IF EXISTS `LoginLogs`;
CREATE TABLE `LoginLogs` (
  `LgnId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LgnDate` datetime DEFAULT NULL,
  `LgnChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `LgnIP` varchar(15) NOT NULL DEFAULT '',
  `LgnActId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`LgnId`),
  KEY `LgnActId` (`LgnChaId`)
) ENGINE=InnoDB AUTO_INCREMENT=2497 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of LoginLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Mail`
-- ----------------------------
DROP TABLE IF EXISTS `Mail`;
CREATE TABLE `Mail` (
  `MalId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `MalChaName` varchar(16) NOT NULL DEFAULT '',
  `MalChaNameDestination` varchar(16) NOT NULL DEFAULT '',
  `MalSubject` varchar(52) NOT NULL DEFAULT '',
  `MalBody` varchar(4000) NOT NULL DEFAULT '',
  `MalPosition` int(11) unsigned NOT NULL DEFAULT '0',
  `MalMonth` int(11) unsigned NOT NULL DEFAULT '0',
  `MalDay` int(11) unsigned NOT NULL DEFAULT '0',
  `MalDeleted` int(11) unsigned NOT NULL DEFAULT '0',
  `MalNew` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MalId`),
  KEY `MalChaName` (`MalChaName`),
  KEY `MalChaNameDestination` (`MalChaNameDestination`)
) ENGINE=InnoDB AUTO_INCREMENT=5524 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Mail
-- ----------------------------

-- ----------------------------
-- Table structure for `MapRegistry`
-- ----------------------------
DROP TABLE IF EXISTS `MapRegistry`;
CREATE TABLE `MapRegistry` (
  `MrgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MrgMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `MrgIdentifier` varchar(45) NOT NULL DEFAULT '',
  `MrgValue` int(10) unsigned NOT NULL DEFAULT '0',
  `MrgPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MrgId`),
  KEY `MrgMapId` (`MrgMapId`)
) ENGINE=InnoDB AUTO_INCREMENT=47373 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of MapRegistry
-- ----------------------------

-- ----------------------------
-- Table structure for `Maps`
-- ----------------------------
DROP TABLE IF EXISTS `Maps`;
CREATE TABLE `Maps` (
  `MapId` int(10) unsigned NOT NULL,
  `MapName` varchar(64) NOT NULL DEFAULT '',
  `MapBGM` int(10) unsigned NOT NULL,
  `MapPvP` int(10) unsigned NOT NULL DEFAULT '0',
  `MapSpells` int(10) unsigned NOT NULL DEFAULT '1',
  `MapLight` int(10) unsigned NOT NULL,
  `MapWeather` int(10) unsigned NOT NULL DEFAULT '0',
  `MapSweepTime` int(10) unsigned NOT NULL DEFAULT '7200000',
  `MapChat` int(10) unsigned NOT NULL DEFAULT '0',
  `MapGhosts` int(10) unsigned NOT NULL DEFAULT '0',
  `MapRegion` int(10) unsigned NOT NULL DEFAULT '0',
  `MapIndoor` int(10) unsigned NOT NULL DEFAULT '0',
  `MapWarpout` int(10) unsigned NOT NULL DEFAULT '0',
  `MapBind` int(10) unsigned NOT NULL DEFAULT '0',
  `MapFile` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`MapId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Maps
-- ----------------------------

-- ----------------------------
-- Table structure for `MobDeathDropLogs`
-- ----------------------------
DROP TABLE IF EXISTS `MobDeathDropLogs`;
CREATE TABLE `MobDeathDropLogs` (
  `MddId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MddDate` datetime DEFAULT NULL,
  `MddMobId` int(10) unsigned NOT NULL DEFAULT '0',
  `MddMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `MddX` int(10) unsigned NOT NULL DEFAULT '0',
  `MddY` int(10) unsigned NOT NULL DEFAULT '0',
  `MddItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `MddAmount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MddId`),
  KEY `MddMobId` (`MddMobId`),
  KEY `MddMapId` (`MddMapId`),
  KEY `MddItmId` (`MddItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=31231 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of MobDeathDropLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `MobEquipment`
-- ----------------------------
DROP TABLE IF EXISTS `MobEquipment`;
CREATE TABLE `MobEquipment` (
  `MeqId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MeqMobId` int(10) unsigned NOT NULL DEFAULT '0',
  `MeqLook` int(10) unsigned NOT NULL DEFAULT '0',
  `MeqColor` int(10) unsigned NOT NULL DEFAULT '0',
  `MeqSlot` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MeqId`),
  KEY `MeqMobId` (`MeqMobId`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of MobEquipment
-- ----------------------------

-- ----------------------------
-- Table structure for `Mobs`
-- ----------------------------
DROP TABLE IF EXISTS `Mobs`;
CREATE TABLE `Mobs` (
  `MobId` int(10) unsigned NOT NULL,
  `MobIdentifier` varchar(45) NOT NULL DEFAULT '',
  `MobDescription` varchar(45) NOT NULL DEFAULT '',
  `MobBehavior` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAI` int(10) unsigned NOT NULL DEFAULT '0',
  `MobIsChar` int(10) unsigned NOT NULL DEFAULT '0',
  `MobIsNpc` int(10) unsigned NOT NULL DEFAULT '0',
  `MobLook` int(10) unsigned NOT NULL DEFAULT '0',
  `MobLookColor` int(10) unsigned NOT NULL DEFAULT '0',
  `MobVita` int(10) unsigned NOT NULL DEFAULT '0',
  `MobMana` int(10) unsigned NOT NULL DEFAULT '0',
  `MobExperience` int(10) unsigned NOT NULL DEFAULT '0',
  `MobHit` int(10) unsigned NOT NULL DEFAULT '0',
  `MobDam` int(10) unsigned NOT NULL DEFAULT '0',
  `MobLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `MobMark` int(10) unsigned NOT NULL DEFAULT '0',
  `MobMinimumDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `MobMaximumDamage` int(10) unsigned NOT NULL DEFAULT '0',
  `MobMoveTime` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAttackTime` int(10) unsigned NOT NULL DEFAULT '0',
  `MobSpawnTime` int(10) unsigned NOT NULL DEFAULT '0',
  `MobMight` int(10) unsigned NOT NULL DEFAULT '0',
  `MobGrace` int(10) unsigned NOT NULL DEFAULT '0',
  `MobWill` int(10) unsigned NOT NULL DEFAULT '0',
  `MobWisdom` int(10) unsigned NOT NULL DEFAULT '0',
  `MobCon` int(10) unsigned NOT NULL DEFAULT '0',
  `MobProtection` int(10) unsigned NOT NULL DEFAULT '0',
  `MobArmor` int(10) unsigned NOT NULL DEFAULT '0',
  `MobSound` int(10) unsigned NOT NULL DEFAULT '0',
  `MobItmId1` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAmount1` int(10) unsigned NOT NULL DEFAULT '0',
  `MobRate1` int(10) unsigned NOT NULL DEFAULT '0',
  `MobItmId2` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAmount2` int(10) unsigned NOT NULL DEFAULT '0',
  `MobRate2` int(10) unsigned NOT NULL DEFAULT '0',
  `MobItmId3` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAmount3` int(10) unsigned NOT NULL DEFAULT '0',
  `MobRate3` int(10) unsigned NOT NULL DEFAULT '0',
  `MobItmId4` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAmount4` int(10) unsigned NOT NULL DEFAULT '0',
  `MobRate4` int(10) unsigned NOT NULL DEFAULT '0',
  `MobItmId5` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAmount5` int(10) unsigned NOT NULL DEFAULT '0',
  `MobRate5` int(10) unsigned NOT NULL DEFAULT '0',
  `MobItmId6` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAmount6` int(10) unsigned NOT NULL DEFAULT '0',
  `MobRate6` int(10) unsigned NOT NULL DEFAULT '0',
  `MobItmId7` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAmount7` int(10) unsigned NOT NULL DEFAULT '0',
  `MobRate7` int(10) unsigned NOT NULL DEFAULT '0',
  `MobItmId8` int(10) unsigned NOT NULL DEFAULT '0',
  `MobAmount8` int(10) unsigned NOT NULL DEFAULT '0',
  `MobRate8` int(10) unsigned NOT NULL DEFAULT '0',
  `MobReturnDistance` int(10) unsigned NOT NULL DEFAULT '0',
  `MobSex` int(10) unsigned NOT NULL DEFAULT '0',
  `MobFace` int(10) unsigned NOT NULL DEFAULT '0',
  `MobFaceColor` int(10) unsigned NOT NULL DEFAULT '0',
  `MobHair` int(10) unsigned NOT NULL DEFAULT '0',
  `MobHairColor` int(10) unsigned NOT NULL DEFAULT '0',
  `MobSkinColor` int(10) unsigned NOT NULL DEFAULT '0',
  `MobState` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MobId`),
  KEY `MobItmId1` (`MobItmId1`),
  KEY `MobItmId2` (`MobItmId2`),
  KEY `MobItmId3` (`MobItmId3`),
  KEY `MobItmId4` (`MobItmId4`),
  KEY `MobItmId5` (`MobItmId5`),
  KEY `MobItmId6` (`MobItmId6`),
  KEY `MobItmId7` (`MobItmId7`),
  KEY `MobItmId8` (`MobItmId8`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Mobs
-- ----------------------------

-- ----------------------------
-- Table structure for `NPCDeathDropLogs`
-- ----------------------------
DROP TABLE IF EXISTS `NPCDeathDropLogs`;
CREATE TABLE `NPCDeathDropLogs` (
  `NddId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NddDate` datetime DEFAULT NULL,
  `NddNpcId` int(10) unsigned NOT NULL DEFAULT '0',
  `NddMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `NddX` int(10) unsigned NOT NULL DEFAULT '0',
  `NddY` int(10) unsigned NOT NULL DEFAULT '0',
  `NddItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `NddAmount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`NddId`),
  KEY `NddNpcId` (`NddNpcId`),
  KEY `NddMapId` (`NddMapId`),
  KEY `NddItmId` (`NddItmId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of NPCDeathDropLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `NPCEquipment`
-- ----------------------------
DROP TABLE IF EXISTS `NPCEquipment`;
CREATE TABLE `NPCEquipment` (
  `NeqId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NeqNpcId` int(10) unsigned NOT NULL DEFAULT '0',
  `NeqLook` int(10) unsigned NOT NULL DEFAULT '0',
  `NeqColor` int(10) unsigned NOT NULL DEFAULT '0',
  `NeqSlot` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`NeqId`),
  KEY `NeqNpcId` (`NeqNpcId`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of NPCEquipment
-- ----------------------------

-- ----------------------------
-- Table structure for `NPCRegistry`
-- ----------------------------
DROP TABLE IF EXISTS `NPCRegistry`;
CREATE TABLE `NPCRegistry` (
  `NrgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NrgChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `NrgIdentifier` varchar(45) NOT NULL DEFAULT '',
  `NrgValue` int(10) unsigned NOT NULL DEFAULT '0',
  `NrgPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`NrgId`),
  KEY `NrgChaId` (`NrgChaId`)
) ENGINE=InnoDB AUTO_INCREMENT=6670 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of NPCRegistry
-- ----------------------------

-- ----------------------------
-- Table structure for `NPCs`
-- ----------------------------
DROP TABLE IF EXISTS `NPCs`;
CREATE TABLE `NPCs` (
  `NpcId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NpcIdentifier` varchar(64) NOT NULL DEFAULT '',
  `NpcDescription` varchar(64) NOT NULL DEFAULT '',
  `NpcType` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcX` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcY` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcTimer` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcLook` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcLookColor` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcSex` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcSide` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcState` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcFace` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcFaceColor` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcHair` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcHairColor` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcSkinColor` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcIsChar` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`NpcId`),
  KEY `NpcMapId` (`NpcMapId`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of NPCs
-- ----------------------------

-- ----------------------------
-- Table structure for `Paper`
-- ----------------------------
DROP TABLE IF EXISTS `Paper`;
CREATE TABLE `Paper` (
  `PapId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PapInvId` int(10) unsigned NOT NULL DEFAULT '0',
  `PapText` text NOT NULL,
  `PapWidth` int(10) unsigned NOT NULL DEFAULT '0',
  `PapHeight` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`PapId`),
  KEY `PapInvId` (`PapInvId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Paper
-- ----------------------------

-- ----------------------------
-- Table structure for `Parcels`
-- ----------------------------
DROP TABLE IF EXISTS `Parcels`;
CREATE TABLE `Parcels` (
  `ParId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ParSender` int(10) unsigned NOT NULL DEFAULT '0',
  `ParChaIdDestination` int(10) unsigned NOT NULL DEFAULT '0',
  `ParItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `ParAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `ParChaIdOwner` int(10) unsigned NOT NULL DEFAULT '0',
  `ParEngrave` varchar(32) NOT NULL DEFAULT '',
  `ParNpc` int(10) unsigned NOT NULL DEFAULT '0',
  `ParPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ParId`),
  KEY `ParChaIdDestination` (`ParChaIdDestination`),
  KEY `ParItmId` (`ParItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=1466 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Parcels
-- ----------------------------

-- ----------------------------
-- Table structure for `PathLogs`
-- ----------------------------
DROP TABLE IF EXISTS `PathLogs`;
CREATE TABLE `PathLogs` (
  `PlgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PlgDate` datetime DEFAULT NULL,
  `PlgChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `PlgPthId` int(10) unsigned NOT NULL DEFAULT '0',
  `PlgMessage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`PlgId`),
  KEY `PlgChaId` (`PlgChaId`),
  KEY `PlgPthId` (`PlgPthId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of PathLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Paths`
-- ----------------------------
DROP TABLE IF EXISTS `Paths`;
CREATE TABLE `Paths` (
  `PthId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PthType` int(10) unsigned NOT NULL DEFAULT '0',
  `PthChat` int(10) unsigned NOT NULL DEFAULT '0',
  `PthIcon` int(10) unsigned NOT NULL DEFAULT '0',
  `PthMark0` varchar(32) NOT NULL DEFAULT '',
  `PthMark1` varchar(32) NOT NULL DEFAULT '',
  `PthMark2` varchar(32) NOT NULL DEFAULT '',
  `PthMark3` varchar(32) NOT NULL DEFAULT '',
  `PthMark4` varchar(32) NOT NULL DEFAULT '',
  `PthMark5` varchar(32) NOT NULL DEFAULT '',
  `PthMark6` varchar(32) NOT NULL DEFAULT '',
  `PthMark7` varchar(32) NOT NULL DEFAULT '',
  `PthMark8` varchar(32) NOT NULL DEFAULT '',
  `PthMark9` varchar(32) NOT NULL DEFAULT '',
  `PthMark10` varchar(32) NOT NULL DEFAULT '',
  `PthMark11` varchar(32) NOT NULL DEFAULT '',
  `PthMark12` varchar(32) NOT NULL DEFAULT '',
  `PthMark13` varchar(32) NOT NULL DEFAULT '',
  `PthMark14` varchar(32) NOT NULL DEFAULT '',
  `PthMark15` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`PthId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Paths
-- ----------------------------

-- ----------------------------
-- Table structure for `PickupLogs`
-- ----------------------------
DROP TABLE IF EXISTS `PickupLogs`;
CREATE TABLE `PickupLogs` (
  `PicId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PicDate` datetime DEFAULT NULL,
  `PicChaId` int(10) unsigned NOT NULL,
  `PicMapId` int(10) unsigned NOT NULL,
  `PicX` int(10) unsigned NOT NULL,
  `PicY` int(10) unsigned NOT NULL,
  `PicItmId` int(10) unsigned NOT NULL,
  `PicAmount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`PicId`),
  KEY `PicChaId` (`PicChaId`),
  KEY `PicMapId` (`PicMapId`),
  KEY `PicItmId` (`PicItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=166107 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of PickupLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `QuestRegistry`
-- ----------------------------
DROP TABLE IF EXISTS `QuestRegistry`;
CREATE TABLE `QuestRegistry` (
  `QrgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `QrgChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `QrgIdentifier` varchar(45) NOT NULL DEFAULT '',
  `QrgValue` int(10) unsigned NOT NULL DEFAULT '0',
  `QrgPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`QrgId`),
  KEY `QrgChaId` (`QrgChaId`)
) ENGINE=InnoDB AUTO_INCREMENT=24750 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of QuestRegistry
-- ----------------------------

-- ----------------------------
-- Table structure for `ReceiveParcelLogs`
-- ----------------------------
DROP TABLE IF EXISTS `ReceiveParcelLogs`;
CREATE TABLE `ReceiveParcelLogs` (
  `RpcId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RpcDate` datetime DEFAULT NULL,
  `RpcChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `RpcMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `RpcX` int(10) unsigned NOT NULL DEFAULT '0',
  `RpcY` int(10) unsigned NOT NULL DEFAULT '0',
  `RpcItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `RpcAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `RpcSender` int(10) unsigned NOT NULL DEFAULT '0',
  `RpcNpc` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`RpcId`),
  KEY `RpcChaId` (`RpcChaId`),
  KEY `RpcMapId` (`RpcMapId`),
  KEY `RpcItmId` (`RpcItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ReceiveParcelLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Recipes`
-- ----------------------------
DROP TABLE IF EXISTS `Recipes`;
CREATE TABLE `Recipes` (
  `RecId` int(11) NOT NULL DEFAULT '0',
  `RecIdentifier` varchar(64) NOT NULL DEFAULT '',
  `RecDescription` varchar(64) NOT NULL DEFAULT '',
  `RecCritIdentifier` varchar(64) NOT NULL DEFAULT '',
  `RecCritDescription` varchar(64) NOT NULL DEFAULT '',
  `RecCraftTime` int(10) unsigned NOT NULL DEFAULT '0',
  `RecSuccessRate` int(10) unsigned NOT NULL DEFAULT '0',
  `RecSkillAdvance` int(10) unsigned NOT NULL DEFAULT '0',
  `RecCritRate` int(10) unsigned NOT NULL DEFAULT '0',
  `RecBonus` int(10) unsigned NOT NULL DEFAULT '0',
  `RecSkillRequired` int(10) unsigned NOT NULL DEFAULT '0',
  `RecTokensRequired` int(11) NOT NULL DEFAULT '0',
  `RecMaterial1` int(11) NOT NULL DEFAULT '0',
  `RecAmount1` int(11) NOT NULL DEFAULT '0',
  `RecMaterial2` int(11) NOT NULL DEFAULT '0',
  `RecAmount2` int(11) NOT NULL DEFAULT '0',
  `RecMaterial3` int(11) NOT NULL DEFAULT '0',
  `RecAmount3` int(11) NOT NULL DEFAULT '0',
  `RecMaterial4` int(11) NOT NULL DEFAULT '0',
  `RecAmount4` int(11) NOT NULL DEFAULT '0',
  `RecMaterial5` int(11) NOT NULL DEFAULT '0',
  `RecAmount5` int(11) NOT NULL DEFAULT '0',
  `RecSuperiorMaterial1` int(11) NOT NULL DEFAULT '0',
  `RecSuperiorAmount1` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RecId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Recipes
-- ----------------------------

-- ----------------------------
-- Table structure for `Registry`
-- ----------------------------
DROP TABLE IF EXISTS `Registry`;
CREATE TABLE `Registry` (
  `RegId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RegChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `RegIdentifier` varchar(45) NOT NULL DEFAULT '',
  `RegValue` int(10) unsigned NOT NULL DEFAULT '0',
  `RegPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`RegId`),
  KEY `RegChaId` (`RegChaId`)
) ENGINE=InnoDB AUTO_INCREMENT=157845 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Registry
-- ----------------------------

-- ----------------------------
-- Table structure for `SayLogs`
-- ----------------------------
DROP TABLE IF EXISTS `SayLogs`;
CREATE TABLE `SayLogs` (
  `SayId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SayDate` datetime DEFAULT NULL,
  `SayChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `SayType` varchar(255) NOT NULL DEFAULT '',
  `SayMessage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`SayId`),
  KEY `SayChaId` (`SayChaId`)
) ENGINE=InnoDB AUTO_INCREMENT=64593 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of SayLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `SellLogs`
-- ----------------------------
DROP TABLE IF EXISTS `SellLogs`;
CREATE TABLE `SellLogs` (
  `SelId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SelDate` datetime DEFAULT NULL,
  `SelChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `SelMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `SelX` int(10) unsigned NOT NULL DEFAULT '0',
  `SelY` int(10) unsigned NOT NULL DEFAULT '0',
  `SelItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `SelPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `SelAmount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SelId`),
  KEY `SelChaId` (`SelChaId`),
  KEY `SelMapId` (`SelMapId`),
  KEY `SelItmId` (`SelItmId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of SellLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `SendParcelLogs`
-- ----------------------------
DROP TABLE IF EXISTS `SendParcelLogs`;
CREATE TABLE `SendParcelLogs` (
  `SpcId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpcDate` datetime DEFAULT NULL,
  `SpcSender` int(10) unsigned NOT NULL DEFAULT '0',
  `SpcMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpcX` int(10) unsigned NOT NULL DEFAULT '0',
  `SpcY` int(10) unsigned NOT NULL DEFAULT '0',
  `SpcItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpcAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `SpcChaIdDestination` int(10) unsigned NOT NULL DEFAULT '0',
  `SpcNpc` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpcId`),
  KEY `SpcChaId` (`SpcChaIdDestination`),
  KEY `SpcMapId` (`SpcMapId`),
  KEY `SpcItmId` (`SpcItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of SendParcelLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Spawns`
-- ----------------------------
DROP TABLE IF EXISTS `Spawns`;
CREATE TABLE `Spawns` (
  `SpnId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpnMobId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpnMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpnX` int(10) unsigned NOT NULL DEFAULT '0',
  `SpnY` int(10) unsigned NOT NULL DEFAULT '0',
  `SpnLastDeath` int(10) unsigned NOT NULL DEFAULT '0',
  `SpnStartTime` int(10) unsigned NOT NULL DEFAULT '25',
  `SpnEndTime` int(10) unsigned NOT NULL DEFAULT '25',
  `SpnMobIdReplace` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpnId`),
  KEY `SpnMobId` (`SpnMobId`),
  KEY `SpnMapId` (`SpnMapId`)
) ENGINE=InnoDB AUTO_INCREMENT=1710 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Spawns
-- ----------------------------

-- ----------------------------
-- Table structure for `SpellBook`
-- ----------------------------
DROP TABLE IF EXISTS `SpellBook`;
CREATE TABLE `SpellBook` (
  `SbkId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SbkChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `SbkSplId` int(10) unsigned NOT NULL DEFAULT '0',
  `SbkPosition` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SbkId`),
  KEY `SbkChaId` (`SbkChaId`),
  KEY `SbkSplId` (`SbkSplId`)
) ENGINE=InnoDB AUTO_INCREMENT=25357 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of SpellBook
-- ----------------------------

-- ----------------------------
-- Table structure for `SpellCasts`
-- ----------------------------
DROP TABLE IF EXISTS `SpellCasts`;
CREATE TABLE `SpellCasts` (
  `SctId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SctChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `SctSplId` int(10) unsigned NOT NULL DEFAULT '0',
  `SctValue` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SctId`),
  KEY `SctChaId` (`SctChaId`),
  KEY `SctSplId` (`SctSplId`)
) ENGINE=InnoDB AUTO_INCREMENT=23397 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of SpellCasts
-- ----------------------------

-- ----------------------------
-- Table structure for `SpellLogs`
-- ----------------------------
DROP TABLE IF EXISTS `SpellLogs`;
CREATE TABLE `SpellLogs` (
  `SlgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SlgDate` datetime DEFAULT NULL,
  `SlgChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `SlgSplId` int(10) unsigned NOT NULL DEFAULT '0',
  `SlgType` varchar(255) NOT NULL DEFAULT '0',
  `SlgMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `SlgX` int(10) unsigned NOT NULL DEFAULT '0',
  `SlgY` int(10) unsigned NOT NULL DEFAULT '0',
  `SlgText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SlgId`),
  KEY `SlgChaId` (`SlgChaId`),
  KEY `SlgSplId` (`SlgSplId`),
  KEY `SlgMapId` (`SlgMapId`)
) ENGINE=InnoDB AUTO_INCREMENT=1284192 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of SpellLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Spells`
-- ----------------------------
DROP TABLE IF EXISTS `Spells`;
CREATE TABLE `Spells` (
  `SplId` int(10) unsigned NOT NULL,
  `SplIdentifier` varchar(32) NOT NULL DEFAULT '',
  `SplDescription` varchar(32) NOT NULL DEFAULT '',
  `SplType` int(10) unsigned NOT NULL DEFAULT '0',
  `SplPthId` int(10) unsigned NOT NULL DEFAULT '0',
  `SplQuestion` varchar(64) NOT NULL DEFAULT 'NO',
  `SplDispel` int(10) unsigned NOT NULL DEFAULT '0',
  `SplAether` int(10) unsigned NOT NULL DEFAULT '0',
  `SplMute` int(10) unsigned NOT NULL DEFAULT '0',
  `SplActive` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`SplId`),
  KEY `SplPthId` (`SplPthId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Spells
-- ----------------------------

-- ----------------------------
-- Table structure for `ThrowLogs`
-- ----------------------------
DROP TABLE IF EXISTS `ThrowLogs`;
CREATE TABLE `ThrowLogs` (
  `ThwId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ThwDate` datetime DEFAULT NULL,
  `ThwChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `ThwMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `ThwX` int(10) unsigned NOT NULL DEFAULT '0',
  `ThwY` int(10) unsigned NOT NULL DEFAULT '0',
  `ThwItmId` int(10) unsigned NOT NULL DEFAULT '0',
  `ThwMapIdDestination` int(10) unsigned NOT NULL DEFAULT '0',
  `ThwXDestination` int(10) unsigned NOT NULL DEFAULT '0',
  `ThwYDestination` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ThwId`),
  KEY `ThwChaId` (`ThwChaId`),
  KEY `ThwMapId` (`ThwMapId`),
  KEY `ThwItmId` (`ThwItmId`),
  KEY `ThwMapIdDestination` (`ThwMapIdDestination`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ThrowLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `Time`
-- ----------------------------
DROP TABLE IF EXISTS `Time`;
CREATE TABLE `Time` (
  `TimId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TimHour` int(10) unsigned NOT NULL DEFAULT '0',
  `TimDay` int(10) unsigned NOT NULL DEFAULT '0',
  `TimSeason` int(10) unsigned NOT NULL DEFAULT '0',
  `TimYear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`TimId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Time
-- ----------------------------

-- ----------------------------
-- Table structure for `UnAfkLogs`
-- ----------------------------
DROP TABLE IF EXISTS `UnAfkLogs`;
CREATE TABLE `UnAfkLogs` (
  `UfkId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UfkDate` datetime DEFAULT NULL,
  `UfkChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `UfkMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `UfkX` int(10) unsigned NOT NULL DEFAULT '0',
  `UfkY` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UfkId`),
  KEY `UfkChaId` (`UfkChaId`),
  KEY `UfkMapId` (`UfkMapId`)
) ENGINE=InnoDB AUTO_INCREMENT=2199 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of UnAfkLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `UnequipLogs`
-- ----------------------------
DROP TABLE IF EXISTS `UnequipLogs`;
CREATE TABLE `UnequipLogs` (
  `UlgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UlgDate` datetime DEFAULT NULL,
  `UlgChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `UlgMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `UlgX` int(10) unsigned NOT NULL DEFAULT '0',
  `UlgY` int(10) unsigned NOT NULL DEFAULT '0',
  `UlgItmId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UlgId`),
  KEY `UlgChaId` (`UlgChaId`),
  KEY `UlgMapId` (`UlgMapId`),
  KEY `UlgItmId` (`UlgItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=2419 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of UnequipLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `UpTime`
-- ----------------------------
DROP TABLE IF EXISTS `UpTime`;
CREATE TABLE `UpTime` (
  `UtmId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UtmValue` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UtmId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of UpTime
-- ----------------------------

-- ----------------------------
-- Table structure for `UseLogs`
-- ----------------------------
DROP TABLE IF EXISTS `UseLogs`;
CREATE TABLE `UseLogs` (
  `UseId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UseDate` datetime DEFAULT NULL,
  `UseChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `UseMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `UseX` int(10) unsigned NOT NULL DEFAULT '0',
  `UseY` int(10) unsigned NOT NULL DEFAULT '0',
  `UseItmId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UseId`),
  KEY `UseChaId` (`UseChaId`),
  KEY `UseMapId` (`UseMapId`),
  KEY `UseItmId` (`UseItmId`)
) ENGINE=InnoDB AUTO_INCREMENT=9550 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of UseLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `WarpLogs`
-- ----------------------------
DROP TABLE IF EXISTS `WarpLogs`;
CREATE TABLE `WarpLogs` (
  `WrpId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WrpDate` datetime DEFAULT NULL,
  `WrpChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `WrpMapId` int(10) unsigned NOT NULL DEFAULT '0',
  `WrpX` int(10) unsigned NOT NULL DEFAULT '0',
  `WrpY` int(10) unsigned NOT NULL DEFAULT '0',
  `WrpMapIdDestination` int(10) unsigned NOT NULL DEFAULT '0',
  `WrpXDestination` int(10) unsigned NOT NULL DEFAULT '0',
  `WrpYDestination` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`WrpId`),
  KEY `WrpChaId` (`WrpChaId`),
  KEY `WrpMapId` (`WrpMapId`),
  KEY `WrpMapIdDestination` (`WrpMapIdDestination`)
) ENGINE=InnoDB AUTO_INCREMENT=32243 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of WarpLogs
-- ----------------------------

-- ----------------------------
-- Table structure for `WhisperLogs`
-- ----------------------------
DROP TABLE IF EXISTS `WhisperLogs`;
CREATE TABLE `WhisperLogs` (
  `WspId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WspDate` datetime DEFAULT NULL,
  `WspChaId` int(10) unsigned NOT NULL DEFAULT '0',
  `WspChaIdDestination` int(10) unsigned NOT NULL DEFAULT '0',
  `WspMessage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`WspId`),
  KEY `WspChaId` (`WspChaId`),
  KEY `WspChaIdDestination` (`WspChaIdDestination`)
) ENGINE=InnoDB AUTO_INCREMENT=15053 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of WhisperLogs
-- ----------------------------
DROP TRIGGER IF EXISTS `DateTimeNow`;
DELIMITER ;;
CREATE TRIGGER `DateTimeNow` BEFORE INSERT ON `AfkLogs` FOR EACH ROW SET NEW.AfkDate = IFNULL(NEW.AfkDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BrkDate`;
DELIMITER ;;
CREATE TRIGGER `BrkDate` BEFORE INSERT ON `BreakLogs` FOR EACH ROW SET NEW.BrkDate = IFNULL(NEW.BrkDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BuyDate`;
DELIMITER ;;
CREATE TRIGGER `BuyDate` BEFORE INSERT ON `BuyLogs` FOR EACH ROW SET NEW.BuyDate = IFNULL(NEW.BuyDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `CddDate`;
DELIMITER ;;
CREATE TRIGGER `CddDate` BEFORE INSERT ON `CharacterDeathDropLogs` FOR EACH ROW SET NEW.CddDate = IFNULL(NEW.CddDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ClgDate`;
DELIMITER ;;
CREATE TRIGGER `ClgDate` BEFORE INSERT ON `ClanLogs` FOR EACH ROW SET NEW.ClgDate = IFNULL(NEW.ClgDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `DrpDate`;
DELIMITER ;;
CREATE TRIGGER `DrpDate` BEFORE INSERT ON `DropLogs` FOR EACH ROW SET NEW.DrpDate = IFNULL(NEW.DrpDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ElgDate`;
DELIMITER ;;
CREATE TRIGGER `ElgDate` BEFORE INSERT ON `EquipLogs` FOR EACH ROW SET NEW.ElgDate = IFNULL(NEW.ElgDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ExgDate`;
DELIMITER ;;
CREATE TRIGGER `ExgDate` BEFORE INSERT ON `ExchangeLogs` FOR EACH ROW SET NEW.ExgDate = IFNULL(NEW.ExgDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `HndDate`;
DELIMITER ;;
CREATE TRIGGER `HndDate` BEFORE INSERT ON `HandLogs` FOR EACH ROW SET NEW.HndDate = IFNULL(NEW.HndDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `LgnDate`;
DELIMITER ;;
CREATE TRIGGER `LgnDate` BEFORE INSERT ON `LoginLogs` FOR EACH ROW SET NEW.LgnDate = IFNULL(NEW.LgnDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `MddDate`;
DELIMITER ;;
CREATE TRIGGER `MddDate` BEFORE INSERT ON `MobDeathDropLogs` FOR EACH ROW SET NEW.MddDate = IFNULL(NEW.MddDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `NddDate`;
DELIMITER ;;
CREATE TRIGGER `NddDate` BEFORE INSERT ON `NPCDeathDropLogs` FOR EACH ROW SET NEW.NddDate = IFNULL(NEW.NddDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `PlgDate`;
DELIMITER ;;
CREATE TRIGGER `PlgDate` BEFORE INSERT ON `PathLogs` FOR EACH ROW SET NEW.PlgDate = IFNULL(NEW.PlgDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `PicDate`;
DELIMITER ;;
CREATE TRIGGER `PicDate` BEFORE INSERT ON `PickupLogs` FOR EACH ROW SET NEW.PicDate = IFNULL(NEW.PicDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `RpcDate`;
DELIMITER ;;
CREATE TRIGGER `RpcDate` BEFORE INSERT ON `ReceiveParcelLogs` FOR EACH ROW SET NEW.RpcDate = IFNULL(NEW.RpcDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `SayDate`;
DELIMITER ;;
CREATE TRIGGER `SayDate` BEFORE INSERT ON `SayLogs` FOR EACH ROW SET NEW.SayDate = IFNULL(NEW.SayDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `SelDate`;
DELIMITER ;;
CREATE TRIGGER `SelDate` BEFORE INSERT ON `SellLogs` FOR EACH ROW SET NEW.SelDate = IFNULL(NEW.SelDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `SpcDate`;
DELIMITER ;;
CREATE TRIGGER `SpcDate` BEFORE INSERT ON `SendParcelLogs` FOR EACH ROW SET NEW.SpcDate = IFNULL(NEW.SpcDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `SlgDate`;
DELIMITER ;;
CREATE TRIGGER `SlgDate` BEFORE INSERT ON `SpellLogs` FOR EACH ROW SET NEW.SlgDate = IFNULL(NEW.SlgDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ThwDate`;
DELIMITER ;;
CREATE TRIGGER `ThwDate` BEFORE INSERT ON `ThrowLogs` FOR EACH ROW SET NEW.ThwDate = IFNULL(NEW.ThwDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `UfkDate`;
DELIMITER ;;
CREATE TRIGGER `UfkDate` BEFORE INSERT ON `UnAfkLogs` FOR EACH ROW SET NEW.UfkDate = IFNULL(NEW.UfkDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `UlgDate`;
DELIMITER ;;
CREATE TRIGGER `UlgDate` BEFORE INSERT ON `UnequipLogs` FOR EACH ROW SET NEW.UlgDate = IFNULL(NEW.UlgDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `UseDate`;
DELIMITER ;;
CREATE TRIGGER `UseDate` BEFORE INSERT ON `UseLogs` FOR EACH ROW SET NEW.UseDate = IFNULL(NEW.UseDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `WrpDate`;
DELIMITER ;;
CREATE TRIGGER `WrpDate` BEFORE INSERT ON `WarpLogs` FOR EACH ROW SET NEW.WrpDate = IFNULL(NEW.WrpDate, NOW())
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `WspDate`;
DELIMITER ;;
CREATE TRIGGER `WspDate` BEFORE INSERT ON `WhisperLogs` FOR EACH ROW SET NEW.WspDate = IFNULL(NEW.WspDate, NOW())
;;
DELIMITER ;
