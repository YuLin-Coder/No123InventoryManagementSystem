/*
MySQL Data Transfer
Source Host: localhost
Source Database: mystock
Target Host: localhost
Target Database: mystock
Date: 2011-03-07 02:53:56
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bsd
-- ----------------------------
DROP TABLE IF EXISTS `bsd`;
CREATE TABLE `bsd` (
  `djid` varchar(14) NOT NULL,
  `riqi` date NOT NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `userid` (`userid`),
  CONSTRAINT `bsd_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报损单';

-- ----------------------------
-- Table structure for bsdsp
-- ----------------------------
DROP TABLE IF EXISTS `bsdsp`;
CREATE TABLE `bsdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `F_Bsdsp_Bsd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `bsdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`),
  CONSTRAINT `F_Bsdsp_Bsd` FOREIGN KEY (`djid`) REFERENCES `bsd` (`djid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报损单商品';

-- ----------------------------
-- Table structure for byd
-- ----------------------------
DROP TABLE IF EXISTS `byd`;
CREATE TABLE `byd` (
  `djid` varchar(14) NOT NULL,
  `riqi` date NOT NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `userid` (`userid`),
  CONSTRAINT `byd_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报溢单';

-- ----------------------------
-- Table structure for bydsp
-- ----------------------------
DROP TABLE IF EXISTS `bydsp`;
CREATE TABLE `bydsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `FK_Bydsp_Byd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `bydsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`),
  CONSTRAINT `FK_Bydsp_Byd` FOREIGN KEY (`djid`) REFERENCES `byd` (`djid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报溢单商品';

-- ----------------------------
-- Table structure for ckd
-- ----------------------------
DROP TABLE IF EXISTS `ckd`;
CREATE TABLE `ckd` (
  `djid` varchar(14) NOT NULL,
  `khid` int(11) default NULL COMMENT '供应商id',
  `khname` varchar(50) default NULL,
  `riqi` date NOT NULL,
  `yfje` double default NULL,
  `sfje` double default NULL,
  `cbje` double default NULL,
  `jystate` varchar(2) default NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `FK_Ckd_Kh` (`khid`),
  KEY `FK_Ckd_Users` (`userid`),
  CONSTRAINT `FK_Ckd_Kh` FOREIGN KEY (`khid`) REFERENCES `kh` (`khid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Ckd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售出库';

-- ----------------------------
-- Table structure for ckdsp
-- ----------------------------
DROP TABLE IF EXISTS `ckdsp`;
CREATE TABLE `ckdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `lbid` int(11) default NULL,
  `lbname` varchar(20) default NULL,
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `FK_Ckdsp_Ckd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `ckdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`),
  CONSTRAINT `FK_Ckdsp_Ckd` FOREIGN KEY (`djid`) REFERENCES `ckd` (`djid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售单商品';

-- ----------------------------
-- Table structure for gys
-- ----------------------------
DROP TABLE IF EXISTS `gys`;
CREATE TABLE `gys` (
  `gysid` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `lxren` varchar(30) default NULL COMMENT '联系人',
  `lxtel` varchar(30) default NULL COMMENT '联系电话',
  `address` varchar(50) default NULL COMMENT '地址',
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`gysid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Table structure for jhd
-- ----------------------------
DROP TABLE IF EXISTS `jhd`;
CREATE TABLE `jhd` (
  `djid` varchar(14) NOT NULL,
  `gysid` int(11) default NULL,
  `gysname` varchar(50) default NULL,
  `riqi` date NOT NULL,
  `yfje` double default NULL,
  `sfje` double default NULL,
  `jystate` varchar(2) default NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `FK_Jhd_Gys` (`gysid`),
  KEY `FK_Jhd_Users` (`userid`),
  CONSTRAINT `FK_Jhd_Gys` FOREIGN KEY (`gysid`) REFERENCES `gys` (`gysid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Jhd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进货单';

-- ----------------------------
-- Table structure for jhdsp
-- ----------------------------
DROP TABLE IF EXISTS `jhdsp`;
CREATE TABLE `jhdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `lbid` int(11) default NULL,
  `lbname` varchar(20) default NULL,
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `Fk_JhdSp_Jhd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `jhdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`),
  CONSTRAINT `Fk_JhdSp_Jhd` FOREIGN KEY (`djid`) REFERENCES `jhd` (`djid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进货单商品';

-- ----------------------------
-- Table structure for kh
-- ----------------------------
DROP TABLE IF EXISTS `kh`;
CREATE TABLE `kh` (
  `khid` int(11) NOT NULL auto_increment,
  `khname` varchar(50) NOT NULL,
  `lxren` varchar(30) default NULL COMMENT '联系人',
  `lxtel` varchar(30) default NULL COMMENT '联系电话',
  `address` varchar(50) default NULL COMMENT '地址',
  `bz` varchar(200) default NULL,
  PRIMARY KEY  (`khid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuid` int(11) NOT NULL,
  `menuname` varchar(20) NOT NULL,
  `pid` int(11) default NULL,
  `menuurl` varchar(100) default NULL,
  `menutype` int(11) NOT NULL,
  `ordernum` int(11) default NULL,
  `icon` varchar(20) default NULL,
  PRIMARY KEY  (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单目录';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL auto_increment,
  `rolename` varchar(20) NOT NULL,
  `bz` varchar(100) default NULL,
  PRIMARY KEY  (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu` (
  `roleid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  PRIMARY KEY  (`roleid`,`menuid`),
  KEY `menuid` (`menuid`),
  CONSTRAINT `rolemenu_ibfk_3` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`) ON DELETE CASCADE,
  CONSTRAINT `rolemenu_ibfk_4` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单';

-- ----------------------------
-- Table structure for spdw
-- ----------------------------
DROP TABLE IF EXISTS `spdw`;
CREATE TABLE `spdw` (
  `dwid` int(11) NOT NULL auto_increment COMMENT 'id',
  `dwname` varchar(20) NOT NULL,
  PRIMARY KEY  (`dwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货物单位';

-- ----------------------------
-- Table structure for splb
-- ----------------------------
DROP TABLE IF EXISTS `splb`;
CREATE TABLE `splb` (
  `lbid` int(11) NOT NULL auto_increment,
  `lbname` varchar(20) default NULL COMMENT '类别名称',
  `pid` int(11) default NULL COMMENT '父类别id',
  PRIMARY KEY  (`lbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类别';

-- ----------------------------
-- Table structure for spxx
-- ----------------------------
DROP TABLE IF EXISTS `spxx`;
CREATE TABLE `spxx` (
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) NOT NULL COMMENT '货物名称',
  `xinghao` varchar(20) default NULL COMMENT '型号',
  `lbid` int(11) NOT NULL COMMENT '类别id',
  `lbname` varchar(20) NOT NULL,
  `dw` varchar(10) default NULL COMMENT '单位',
  `jhprice` double default '0',
  `chprice` double default '0',
  `scjj` double default '0',
  `kcsl` int(11) default '0',
  `kczj` double default '0',
  `minnum` int(11) default '0',
  `csname` varchar(50) default NULL,
  `state` varchar(1) default '0',
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`spid`),
  KEY `FK_Spxx_Splb` (`lbid`),
  CONSTRAINT `FK_Spxx_Splb` FOREIGN KEY (`lbid`) REFERENCES `splb` (`lbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Table structure for thd
-- ----------------------------
DROP TABLE IF EXISTS `thd`;
CREATE TABLE `thd` (
  `djid` varchar(14) NOT NULL,
  `gysid` int(11) default NULL,
  `gysname` varchar(50) default NULL,
  `riqi` date NOT NULL,
  `yfje` double default NULL COMMENT '应付金额',
  `sfje` double default NULL COMMENT '实付金额',
  `jystate` varchar(2) default NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `FK_Thd_Gys` (`gysid`),
  KEY `FK_Thd_Users` (`userid`),
  CONSTRAINT `FK_Thd_Gys` FOREIGN KEY (`gysid`) REFERENCES `gys` (`gysid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Thd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品退库';

-- ----------------------------
-- Table structure for thdsp
-- ----------------------------
DROP TABLE IF EXISTS `thdsp`;
CREATE TABLE `thdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `lbid` int(11) default NULL,
  `lbname` varchar(20) default NULL,
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `FK_Thdsp_Thd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `thdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`),
  CONSTRAINT `FK_Thdsp_Thd` FOREIGN KEY (`djid`) REFERENCES `thd` (`djid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货单商品';

-- ----------------------------
-- Table structure for tkd
-- ----------------------------
DROP TABLE IF EXISTS `tkd`;
CREATE TABLE `tkd` (
  `djid` varchar(14) NOT NULL,
  `khid` int(11) default NULL COMMENT '供应商id',
  `khname` varchar(50) default NULL,
  `riqi` date NOT NULL,
  `yfje` double default NULL,
  `sfje` double default NULL,
  `cbje` double default NULL,
  `jystate` varchar(2) default NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `FK_Tkd_Kh` (`khid`),
  KEY `FK_Tkd_Users` (`userid`),
  CONSTRAINT `FK_Tkd_Kh` FOREIGN KEY (`khid`) REFERENCES `kh` (`khid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Tkd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户退货';

-- ----------------------------
-- Table structure for tkdsp
-- ----------------------------
DROP TABLE IF EXISTS `tkdsp`;
CREATE TABLE `tkdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `lbid` int(11) default NULL,
  `lbname` varchar(20) default NULL,
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `djid` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `tkdsp_ibfk_5` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`),
  CONSTRAINT `tkdsp_ibfk_4` FOREIGN KEY (`djid`) REFERENCES `tkd` (`djid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户退货商品';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL auto_increment,
  `logincode` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `roleid` int(11) default NULL,
  `state` int(11) NOT NULL,
  `bz` varchar(100) default NULL,
  PRIMARY KEY  (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- View structure for vusermenu
-- ----------------------------
DROP VIEW IF EXISTS `vusermenu`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vusermenu` AS select distinct sql_no_cache `a`.`userid` AS `userid`,`a`.`logincode` AS `logincode`,`a`.`username` AS `username`,`d`.`menuid` AS `menuid`,`d`.`menuname` AS `menuname`,`d`.`pid` AS `pid`,`d`.`menuurl` AS `menuurl`,`d`.`menutype` AS `menutype`,`d`.`ordernum` AS `ordernum`,`d`.`icon` AS `icon` from ((`users` `a` join `rolemenu` `c`) join `menu` `d`) where ((`a`.`roleid` = `c`.`roleid`) and (`c`.`menuid` = `d`.`menuid`)) order by `d`.`ordernum`;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `menu` VALUES ('0', '系统菜单', '-1', null, '1', '0', 'menu-plugin');
INSERT INTO `menu` VALUES ('10', '进货管理', '0', null, '1', '1', 'menu-1');
INSERT INTO `menu` VALUES ('20', '销售管理', '0', null, '1', '2', 'menu-2');
INSERT INTO `menu` VALUES ('30', '库存管理', '0', null, '1', '3', 'menu-3');
INSERT INTO `menu` VALUES ('40', '统计报表', '0', null, '1', '4', 'menu-4');
INSERT INTO `menu` VALUES ('50', '基础资料', '0', null, '1', '5', 'menu-5');
INSERT INTO `menu` VALUES ('60', '系统管理', '0', null, '1', '6', 'menu-6');
INSERT INTO `menu` VALUES ('1010', '进货入库', '10', '../jinhuo/jinhuo.jsp', '0', '1', 'menu-11');
INSERT INTO `menu` VALUES ('1020', '退货出库', '10', '../jinhuo/tuihuo.jsp', '0', '2', 'menu-12');
INSERT INTO `menu` VALUES ('1030', '进货单据查询', '10', '../jinhuo/jinsearch.jsp', '0', '3', 'menu-13');
INSERT INTO `menu` VALUES ('1040', '退货单据查询', '10', '../jinhuo/mingxi.jsp', '0', '4', 'menu-14');
INSERT INTO `menu` VALUES ('1050', '当前库存查询', '10', '../kucun/kcsearch.jsp', '0', '5', 'menu-15');
INSERT INTO `menu` VALUES ('2010', '销售出库', '20', '../chushou/chuku.jsp', '0', '1', 'menu-21');
INSERT INTO `menu` VALUES ('2020', '客户退货', '20', '../chushou/tuiku.jsp', '0', '2', 'menu-22');
INSERT INTO `menu` VALUES ('2030', '销售单据查询', '20', '../chushou/chusearch.jsp', '0', '3', 'menu-23');
INSERT INTO `menu` VALUES ('2040', '客户退货查询', '20', '../chushou/mingxi.jsp', '0', '4', 'menu-24');
INSERT INTO `menu` VALUES ('2050', '当前库存查询', '20', '../kucun/kcsearch.jsp', '0', '5', 'menu-25');
INSERT INTO `menu` VALUES ('3010', '商品报损', '30', '../kucun/baosun.jsp', '0', '1', 'menu-31');
INSERT INTO `menu` VALUES ('3020', '商品报溢', '30', '../kucun/baoyi.jsp', '0', '2', 'menu-32');
INSERT INTO `menu` VALUES ('3030', '库存报警', '30', '../kucun/baojing.jsp', '0', '3', 'menu-33');
INSERT INTO `menu` VALUES ('3040', '报损报溢查询', '30', '../kucun/biansearch.jsp', '0', '4', 'menu-34');
INSERT INTO `menu` VALUES ('3050', '当前库存查询', '30', '../kucun/kcsearch.jsp', '0', '5', 'menu-35');
INSERT INTO `menu` VALUES ('4010', '供应商统计', '40', '../tongji/gystj.jsp', '0', '1', 'menu-41');
INSERT INTO `menu` VALUES ('4020', '客户统计', '40', '../tongji/khtj.jsp', '0', '2', 'menu-42');
INSERT INTO `menu` VALUES ('4030', '商品采购统计', '40', '../tongji/spcgtj.jsp', '0', '3', 'menu-43');
INSERT INTO `menu` VALUES ('4040', '商品销售统计', '40', '../tongji/spxstj.jsp', '0', '4', 'menu-44');
INSERT INTO `menu` VALUES ('4050', '按日统计分析', '40', '../tongji/tjfxri.jsp', '0', '5', 'menu-45');
INSERT INTO `menu` VALUES ('4060', '按月统计分析', '40', '../tongji/tjfxyue.jsp', '0', '6', 'menu-46');
INSERT INTO `menu` VALUES ('5010', '供应商管理', '50', '../ziliao/gys.jsp', '0', '1', 'menu-51');
INSERT INTO `menu` VALUES ('5020', '客户管理', '50', '../ziliao/kh.jsp', '0', '2', 'menu-52');
INSERT INTO `menu` VALUES ('5030', '商品管理', '50', '../ziliao/spxx.jsp', '0', '3', 'menu-53');
INSERT INTO `menu` VALUES ('5040', '期初库存', '50', '../ziliao/kc.jsp', '0', '4', 'menu-54');
INSERT INTO `menu` VALUES ('6010', '角色管理', '60', '../power/role.jsp', '0', '1', 'menu-61');
INSERT INTO `menu` VALUES ('6020', '用户管理', '60', '../power/user.jsp', '0', '2', 'menu-62');
INSERT INTO `menu` VALUES ('6030', '数据库管理', '60', '../power/beifen.jsp', '3', '3', 'menu-63');
INSERT INTO `role` VALUES ('1', '管理员', '系统管理');
INSERT INTO `rolemenu` VALUES ('1', '10');
INSERT INTO `rolemenu` VALUES ('1', '20');
INSERT INTO `rolemenu` VALUES ('1', '30');
INSERT INTO `rolemenu` VALUES ('1', '40');
INSERT INTO `rolemenu` VALUES ('1', '50');
INSERT INTO `rolemenu` VALUES ('1', '60');
INSERT INTO `rolemenu` VALUES ('1', '1010');
INSERT INTO `rolemenu` VALUES ('1', '1020');
INSERT INTO `rolemenu` VALUES ('1', '1030');
INSERT INTO `rolemenu` VALUES ('1', '1040');
INSERT INTO `rolemenu` VALUES ('1', '1050');
INSERT INTO `rolemenu` VALUES ('1', '2010');
INSERT INTO `rolemenu` VALUES ('1', '2020');
INSERT INTO `rolemenu` VALUES ('1', '2030');
INSERT INTO `rolemenu` VALUES ('1', '2040');
INSERT INTO `rolemenu` VALUES ('1', '2050');
INSERT INTO `rolemenu` VALUES ('1', '3010');
INSERT INTO `rolemenu` VALUES ('1', '3020');
INSERT INTO `rolemenu` VALUES ('1', '3030');
INSERT INTO `rolemenu` VALUES ('1', '3040');
INSERT INTO `rolemenu` VALUES ('1', '3050');
INSERT INTO `rolemenu` VALUES ('1', '4010');
INSERT INTO `rolemenu` VALUES ('1', '4020');
INSERT INTO `rolemenu` VALUES ('1', '4030');
INSERT INTO `rolemenu` VALUES ('1', '4040');
INSERT INTO `rolemenu` VALUES ('1', '4050');
INSERT INTO `rolemenu` VALUES ('1', '4060');
INSERT INTO `rolemenu` VALUES ('1', '5010');
INSERT INTO `rolemenu` VALUES ('1', '5020');
INSERT INTO `rolemenu` VALUES ('1', '5030');
INSERT INTO `rolemenu` VALUES ('1', '5040');
INSERT INTO `rolemenu` VALUES ('1', '6010');
INSERT INTO `rolemenu` VALUES ('1', '6020');
INSERT INTO `rolemenu` VALUES ('1', '6030');
INSERT INTO `spdw` VALUES ('1', '个');
INSERT INTO `spdw` VALUES ('2', '袋');
INSERT INTO `spdw` VALUES ('3', '盒');
INSERT INTO `spdw` VALUES ('4', '相');
INSERT INTO `users` VALUES ('1', 'admin', 'admin', '管理员', '1', '0', '系统管理员');

-- ----------------------------
-- Trigger structure for ckdsp_setspxx
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `ckdsp_setspxx` BEFORE DELETE ON `ckdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl+old.sl,kczj=kcsl*jhprice where spid=old.spid;
END;;
DELIMITER ;

-- ----------------------------
-- Trigger structure for jhdsp_setspxx
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `jhdsp_setspxx` BEFORE DELETE ON `jhdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl-old.sl,kczj=kcsl*jhprice where spid=old.spid;
END;;
DELIMITER ;

-- ----------------------------
-- Trigger structure for thdsp_setspxx
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `thdsp_setspxx` BEFORE DELETE ON `thdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl+old.sl,kczj=kcsl*jhprice where spid=old.spid;
END;;
DELIMITER ;

-- ----------------------------
-- Trigger structure for tkdsp_setspxx
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `tkdsp_setspxx` BEFORE DELETE ON `tkdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl-old.sl,kczj=kcsl*jhprice where spid=old.spid;
END;;
DELIMITER ;
