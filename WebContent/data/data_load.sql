-- MySQL dump 10.10
--
-- Host: localhost    Database: mystock
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

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
-- Table structure for table `bsd`
--

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

--
-- Dumping data for table `bsd`
--


/*!40000 ALTER TABLE `bsd` DISABLE KEYS */;
LOCK TABLES `bsd` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bsd` ENABLE KEYS */;

--
-- Table structure for table `bsdsp`
--

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

--
-- Dumping data for table `bsdsp`
--


/*!40000 ALTER TABLE `bsdsp` DISABLE KEYS */;
LOCK TABLES `bsdsp` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bsdsp` ENABLE KEYS */;

--
-- Table structure for table `byd`
--

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

--
-- Dumping data for table `byd`
--


/*!40000 ALTER TABLE `byd` DISABLE KEYS */;
LOCK TABLES `byd` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `byd` ENABLE KEYS */;

--
-- Table structure for table `bydsp`
--

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

--
-- Dumping data for table `bydsp`
--


/*!40000 ALTER TABLE `bydsp` DISABLE KEYS */;
LOCK TABLES `bydsp` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bydsp` ENABLE KEYS */;

--
-- Table structure for table `ckd`
--

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

--
-- Dumping data for table `ckd`
--


/*!40000 ALTER TABLE `ckd` DISABLE KEYS */;
LOCK TABLES `ckd` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ckd` ENABLE KEYS */;

--
-- Table structure for table `ckdsp`
--

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

--
-- Dumping data for table `ckdsp`
--


/*!40000 ALTER TABLE `ckdsp` DISABLE KEYS */;
LOCK TABLES `ckdsp` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ckdsp` ENABLE KEYS */;

/*!50003 SET @OLD_SQL_MODE=@@SQL_MODE*/;
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ckdsp_setspxx` BEFORE DELETE ON `ckdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl+old.sl,kczj=kcsl*jhprice where spid=old.spid;
END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

--
-- Table structure for table `gys`
--

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

--
-- Dumping data for table `gys`
--


/*!40000 ALTER TABLE `gys` DISABLE KEYS */;
LOCK TABLES `gys` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gys` ENABLE KEYS */;

--
-- Table structure for table `jhd`
--

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

--
-- Dumping data for table `jhd`
--


/*!40000 ALTER TABLE `jhd` DISABLE KEYS */;
LOCK TABLES `jhd` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jhd` ENABLE KEYS */;

--
-- Table structure for table `jhdsp`
--

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

--
-- Dumping data for table `jhdsp`
--


/*!40000 ALTER TABLE `jhdsp` DISABLE KEYS */;
LOCK TABLES `jhdsp` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jhdsp` ENABLE KEYS */;

/*!50003 SET @OLD_SQL_MODE=@@SQL_MODE*/;
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `jhdsp_setspxx` BEFORE DELETE ON `jhdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl-old.sl,kczj=kcsl*jhprice where spid=old.spid;
END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

--
-- Table structure for table `kh`
--

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

--
-- Dumping data for table `kh`
--


/*!40000 ALTER TABLE `kh` DISABLE KEYS */;
LOCK TABLES `kh` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `kh` ENABLE KEYS */;

--
-- Table structure for table `menu`
--

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

--
-- Dumping data for table `menu`
--


/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
LOCK TABLES `menu` WRITE;
INSERT INTO `menu` VALUES (0,'系统菜单',-1,NULL,1,0,'menu-plugin'),(10,'进货管理',0,NULL,1,1,'menu-1'),(20,'销售管理',0,NULL,1,2,'menu-2'),(30,'库存管理',0,NULL,1,3,'menu-3'),(40,'统计报表',0,NULL,1,4,'menu-4'),(50,'基础资料',0,NULL,1,5,'menu-5'),(60,'系统管理',0,NULL,1,6,'menu-6'),(1010,'进货入库',10,'../jinhuo/jinhuo.jsp',0,1,'menu-11'),(1020,'退货出库',10,'../jinhuo/tuihuo.jsp',0,2,'menu-12'),(1030,'进货单据查询',10,'../jinhuo/jinsearch.jsp',0,3,'menu-13'),(1040,'退货单据查询',10,'../jinhuo/mingxi.jsp',0,4,'menu-14'),(1050,'当前库存查询',10,'../kucun/kcsearch.jsp',0,5,'menu-15'),(2010,'销售出库',20,'../chushou/chuku.jsp',0,1,'menu-21'),(2020,'客户退货',20,'../chushou/tuiku.jsp',0,2,'menu-22'),(2030,'销售单据查询',20,'../chushou/chusearch.jsp',0,3,'menu-23'),(2040,'客户退货查询',20,'../chushou/mingxi.jsp',0,4,'menu-24'),(2050,'当前库存查询',20,'../kucun/kcsearch.jsp',0,5,'menu-25'),(3010,'商品报损',30,'../kucun/baosun.jsp',0,1,'menu-31'),(3020,'商品报溢',30,'../kucun/baoyi.jsp',0,2,'menu-32'),(3030,'库存报警',30,'../kucun/baojing.jsp',0,3,'menu-33'),(3040,'报损报溢查询',30,'../kucun/biansearch.jsp',0,4,'menu-34'),(3050,'当前库存查询',30,'../kucun/kcsearch.jsp',0,5,'menu-35'),(4010,'供应商统计',40,'../tongji/gystj.jsp',0,1,'menu-41'),(4020,'客户统计',40,'../tongji/khtj.jsp',0,2,'menu-42'),(4030,'商品采购统计',40,'../tongji/spcgtj.jsp',0,3,'menu-43'),(4040,'商品销售统计',40,'../tongji/spxstj.jsp',0,4,'menu-44'),(4050,'按日统计分析',40,'../tongji/tjfxri.jsp',0,5,'menu-45'),(4060,'按月统计分析',40,'../tongji/tjfxyue.jsp',0,6,'menu-46'),(5010,'供应商管理',50,'../ziliao/gys.jsp',0,1,'menu-51'),(5020,'客户管理',50,'../ziliao/kh.jsp',0,2,'menu-52'),(5030,'商品管理',50,'../ziliao/spxx.jsp',0,3,'menu-53'),(5040,'期初库存',50,'../ziliao/kc.jsp',0,4,'menu-54'),(6010,'角色管理',60,'../power/role.jsp',0,1,'menu-61'),(6020,'用户管理',60,'../power/user.jsp',0,2,'menu-62'),(6030,'数据库管理',60,'../power/beifen.jsp',3,3,'menu-63');
UNLOCK TABLES;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL auto_increment,
  `rolename` varchar(20) NOT NULL,
  `bz` varchar(100) default NULL,
  PRIMARY KEY  (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- Dumping data for table `role`
--


/*!40000 ALTER TABLE `role` DISABLE KEYS */;
LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'管理员','系统管理');
UNLOCK TABLES;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

--
-- Table structure for table `rolemenu`
--

DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu` (
  `roleid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  PRIMARY KEY  (`roleid`,`menuid`),
  KEY `menuid` (`menuid`),
  CONSTRAINT `rolemenu_ibfk_3` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`) ON DELETE CASCADE,
  CONSTRAINT `rolemenu_ibfk_4` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单';

--
-- Dumping data for table `rolemenu`
--


/*!40000 ALTER TABLE `rolemenu` DISABLE KEYS */;
LOCK TABLES `rolemenu` WRITE;
INSERT INTO `rolemenu` VALUES (1,10),(1,20),(1,30),(1,40),(1,50),(1,60),(1,1010),(1,1020),(1,1030),(1,1040),(1,1050),(1,2010),(1,2020),(1,2030),(1,2040),(1,2050),(1,3010),(1,3020),(1,3030),(1,3040),(1,3050),(1,4010),(1,4020),(1,4030),(1,4040),(1,4050),(1,4060),(1,5010),(1,5020),(1,5030),(1,5040),(1,6010),(1,6020),(1,6030);
UNLOCK TABLES;
/*!40000 ALTER TABLE `rolemenu` ENABLE KEYS */;

--
-- Table structure for table `spdw`
--

DROP TABLE IF EXISTS `spdw`;
CREATE TABLE `spdw` (
  `dwid` int(11) NOT NULL auto_increment COMMENT 'id',
  `dwname` varchar(20) NOT NULL,
  PRIMARY KEY  (`dwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货物单位';

--
-- Dumping data for table `spdw`
--


/*!40000 ALTER TABLE `spdw` DISABLE KEYS */;
LOCK TABLES `spdw` WRITE;
INSERT INTO `spdw` VALUES (1,'个'),(2,'袋'),(3,'盒'),(4,'相');
UNLOCK TABLES;
/*!40000 ALTER TABLE `spdw` ENABLE KEYS */;

--
-- Table structure for table `splb`
--

DROP TABLE IF EXISTS `splb`;
CREATE TABLE `splb` (
  `lbid` int(11) NOT NULL auto_increment,
  `lbname` varchar(20) default NULL COMMENT '类别名称',
  `pid` int(11) default NULL COMMENT '父类别id',
  PRIMARY KEY  (`lbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类别';

--
-- Dumping data for table `splb`
--


/*!40000 ALTER TABLE `splb` DISABLE KEYS */;
LOCK TABLES `splb` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `splb` ENABLE KEYS */;

--
-- Table structure for table `spxx`
--

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

--
-- Dumping data for table `spxx`
--


/*!40000 ALTER TABLE `spxx` DISABLE KEYS */;
LOCK TABLES `spxx` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `spxx` ENABLE KEYS */;

--
-- Table structure for table `thd`
--

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

--
-- Dumping data for table `thd`
--


/*!40000 ALTER TABLE `thd` DISABLE KEYS */;
LOCK TABLES `thd` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `thd` ENABLE KEYS */;

--
-- Table structure for table `thdsp`
--

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

--
-- Dumping data for table `thdsp`
--


/*!40000 ALTER TABLE `thdsp` DISABLE KEYS */;
LOCK TABLES `thdsp` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `thdsp` ENABLE KEYS */;

/*!50003 SET @OLD_SQL_MODE=@@SQL_MODE*/;
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `thdsp_setspxx` BEFORE DELETE ON `thdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl+old.sl,kczj=kcsl*jhprice where spid=old.spid;
END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

--
-- Table structure for table `tkd`
--

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

--
-- Dumping data for table `tkd`
--


/*!40000 ALTER TABLE `tkd` DISABLE KEYS */;
LOCK TABLES `tkd` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `tkd` ENABLE KEYS */;

--
-- Table structure for table `tkdsp`
--

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

--
-- Dumping data for table `tkdsp`
--


/*!40000 ALTER TABLE `tkdsp` DISABLE KEYS */;
LOCK TABLES `tkdsp` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `tkdsp` ENABLE KEYS */;

/*!50003 SET @OLD_SQL_MODE=@@SQL_MODE*/;
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `tkdsp_setspxx` BEFORE DELETE ON `tkdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl-old.sl,kczj=kcsl*jhprice where spid=old.spid;
END */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

--
-- Table structure for table `users`
--

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

--
-- Dumping data for table `users`
--


/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'admin','admin','管理员',1,0,'系统管理员');
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Table structure for table `vusermenu`
--

DROP TABLE IF EXISTS `vusermenu`;
/*!50001 DROP VIEW IF EXISTS `vusermenu`*/;
/*!50001 DROP TABLE IF EXISTS `vusermenu`*/;
/*!50001 CREATE TABLE `vusermenu` (
  `userid` int(11),
  `logincode` varchar(20),
  `username` varchar(20),
  `menuid` int(11),
  `menuname` varchar(20),
  `pid` int(11),
  `menuurl` varchar(100),
  `menutype` int(11),
  `ordernum` int(11),
  `icon` varchar(20)
) */;

--
-- View structure for view `vusermenu`
--

/*!50001 DROP TABLE IF EXISTS `vusermenu`*/;
/*!50001 DROP VIEW IF EXISTS `vusermenu`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vusermenu` AS select distinct sql_no_cache `a`.`userid` AS `userid`,`a`.`logincode` AS `logincode`,`a`.`username` AS `username`,`d`.`menuid` AS `menuid`,`d`.`menuname` AS `menuname`,`d`.`pid` AS `pid`,`d`.`menuurl` AS `menuurl`,`d`.`menutype` AS `menutype`,`d`.`ordernum` AS `ordernum`,`d`.`icon` AS `icon` from ((`users` `a` join `rolemenu` `c`) join `menu` `d`) where ((`a`.`roleid` = `c`.`roleid`) and (`c`.`menuid` = `d`.`menuid`)) order by `d`.`ordernum` */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

