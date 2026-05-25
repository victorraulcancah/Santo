-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.65-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema santodomingo
--

CREATE DATABASE IF NOT EXISTS santodomingo;
USE santodomingo;

--
-- Temporary table structure for view `view_balance`
--
DROP TABLE IF EXISTS `view_balance`;
DROP VIEW IF EXISTS `view_balance`;
CREATE TABLE `view_balance` (
  `producto` varchar(245),
  `comprobante_dia` varchar(64),
  `comprobante_fecha` varchar(50),
  `comprobante_tipo` varchar(2),
  `comprobante_serie` varchar(50),
  `comprobante_numero` varchar(50),
  `filler1` varchar(3),
  `venta_operacion` varchar(6),
  `venta_destino` varchar(7),
  `venta_empresa` varchar(245),
  `filler2` varchar(4),
  `entradas_cantidad` varchar(50),
  `entradas_costo_unitario` varchar(10),
  `entradas_costo_total` varchar(53),
  `filler3` varchar(5),
  `salidas_cantidad` varchar(6),
  `salidas_costo_unitario` varchar(10),
  `salidas_costo_total` varchar(22),
  `-------` varchar(7),
  `final_cantidad` double(13,2),
  `final_costo_unitario` double(11,5),
  `final_costo_total` double,
  `filler5` varchar(9),
  `id_empresa` int(11),
  `sucursal` int(11),
  `estado` char(1),
  `almacen` int(11),
  `id_producto` int(11)
);

--
-- Temporary table structure for view `view_compras_balance`
--
DROP TABLE IF EXISTS `view_compras_balance`;
DROP VIEW IF EXISTS `view_compras_balance`;
CREATE TABLE `view_compras_balance` (
  `producto` varchar(245),
  `comprobante_dia` varchar(64),
  `comprobante_fecha` varchar(50),
  `comprobante_tipo` varchar(2),
  `comprobante_serie` varchar(50),
  `comprobante_numero` varchar(50),
  `---` varchar(3),
  `kardex_operacion` varchar(6),
  `kardex_destino` varchar(7),
  `kardex_empresa` varchar(200),
  `----` varchar(4),
  `entradas_cantidad` varchar(50),
  `entradas_costo_unitario` double(10,3),
  `entradas_costo_total` double,
  `-----` varchar(5),
  `salidas_cantidad` char(0),
  `salidas_costo_unitario` char(0),
  `salidas_costo_total` char(0),
  `-------` varchar(7),
  `final_cantidad` int(11),
  `final_costo_unitario` double(10,4),
  `final_costo_total` double,
  `---------` varchar(9),
  `id_empresa` int(11),
  `sucursal` int(11),
  `estado` char(1),
  `almacen` int(11),
  `id_producto` int(11)
);

--
-- Temporary table structure for view `view_cotizaciones`
--
DROP TABLE IF EXISTS `view_cotizaciones`;
DROP VIEW IF EXISTS `view_cotizaciones`;
CREATE TABLE `view_cotizaciones` (
  `cotizacion_id` int(11),
  `numero` int(11),
  `fecha` date,
  `moneda` int(11),
  `cm_tc` varchar(100),
  `id_tido` int(11),
  `documento` varchar(259),
  `datos` varchar(245),
  `total` double(10,2),
  `estado` char(1),
  `vendedor` varchar(200),
  `usuario` int(11)
);

--
-- Temporary table structure for view `view_productos_1`
--
DROP TABLE IF EXISTS `view_productos_1`;
DROP VIEW IF EXISTS `view_productos_1`;
CREATE TABLE `view_productos_1` (
  `id_producto` int(11),
  `cod_barra` varchar(100),
  `descripcion` varchar(245),
  `precio` double(10,4),
  `costo` double(10,4),
  `cantidad` int(11),
  `iscbp` int(2),
  `id_empresa` int(11),
  `sucursal` int(11),
  `ultima_salida` date,
  `codsunat` varchar(20),
  `usar_barra` char(1),
  `precio_mayor` double(10,4),
  `precio_menor` double(10,4),
  `razon_social` varchar(250),
  `ruc` varchar(11),
  `estado` char(1),
  `almacen` int(11),
  `precio2` double(10,4),
  `precio3` double(10,4),
  `precio4` double(10,4),
  `precio_unidad` double(10,4),
  `codigo` varchar(20),
  `serie_producto` varchar(100),
  `categoria` varchar(150)
);

--
-- Temporary table structure for view `view_productos_2`
--
DROP TABLE IF EXISTS `view_productos_2`;
DROP VIEW IF EXISTS `view_productos_2`;
CREATE TABLE `view_productos_2` (
  `id_producto` int(11),
  `cod_barra` varchar(100),
  `descripcion` varchar(245),
  `precio` double(10,4),
  `costo` double(10,4),
  `cantidad` int(11),
  `iscbp` int(2),
  `id_empresa` int(11),
  `sucursal` int(11),
  `ultima_salida` date,
  `codsunat` varchar(20),
  `usar_barra` char(1),
  `precio_mayor` double(10,4),
  `precio_menor` double(10,4),
  `razon_social` varchar(250),
  `ruc` varchar(11),
  `estado` char(1),
  `almacen` int(11),
  `precio2` double(10,4),
  `precio3` double(10,4),
  `precio4` double(10,4),
  `precio_unidad` double(10,4),
  `codigo` varchar(20),
  `serie_producto` varchar(100)
);

--
-- Temporary table structure for view `view_ventas`
--
DROP TABLE IF EXISTS `view_ventas`;
DROP VIEW IF EXISTS `view_ventas`;
CREATE TABLE `view_ventas` (
  `cod_v` int(11),
  `sn_v` varchar(24),
  `datos_cl` varchar(259),
  `subtotal` varchar(17),
  `igv_v` varchar(26),
  `doc_ventae` varchar(25),
  `id_venta` varchar(58),
  `fecha_emision` date,
  `abreviatura` varchar(3),
  `apli_igv` char(1),
  `igv` double(10,2),
  `id_tido` int(11),
  `serie` varchar(4),
  `numero` int(5),
  `documento` varchar(11),
  `datos` varchar(245),
  `total` varchar(13),
  `estado` char(1),
  `enviado_sunat` char(1),
  `nombre_xml` varchar(45)
);

--
-- Temporary table structure for view `view_ventas_balance`
--
DROP TABLE IF EXISTS `view_ventas_balance`;
DROP VIEW IF EXISTS `view_ventas_balance`;
CREATE TABLE `view_ventas_balance` (
  `producto` varchar(245),
  `comprobante_dia` varchar(64),
  `comprobante_fecha` date,
  `comprobante_tipo` varchar(2),
  `comprobante_serie` varchar(4),
  `comprobante_numero` int(5),
  `---` varchar(3),
  `venta_operacion` varchar(6),
  `venta_destino` char(0),
  `venta_empresa` varchar(245),
  `----` varchar(4),
  `entradas_cantidad` char(0),
  `entradas_costo_unitario` char(0),
  `entradas_costo_total` char(0),
  `-----` varchar(5),
  `salidas_cantidad` double(6,2),
  `salidas_costo_unitario` double(10,5),
  `salidas_costo_total` double(22,5),
  `-------` varchar(7),
  `final_cantidad` double(6,2),
  `final_costo_unitario` double(10,5),
  `final_costo_total` double(22,5),
  `---------` varchar(9),
  `id_empresa` int(11),
  `sucursal` int(11),
  `estado` char(1),
  `almacen` int(11),
  `id_producto` int(11),
  `aaa` char(1)
);

--
-- Definition of table `almacenes`
--

DROP TABLE IF EXISTS `almacenes`;
CREATE TABLE `almacenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `almacenes`
--

/*!40000 ALTER TABLE `almacenes` DISABLE KEYS */;
INSERT INTO `almacenes` (`id`,`name`) VALUES 
 (1,'Almacen 1'),
 (2,'Tienda 1');
/*!40000 ALTER TABLE `almacenes` ENABLE KEYS */;


--
-- Definition of table `caja_chica`
--

DROP TABLE IF EXISTS `caja_chica`;
CREATE TABLE `caja_chica` (
  `caja_chica_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_caja_empresa` int(11) DEFAULT NULL,
  `hora` varchar(50) DEFAULT NULL,
  `detalle` varchar(220) DEFAULT NULL,
  `tipo` char(1) DEFAULT 'f',
  `entrada` double(15,2) DEFAULT NULL,
  `salida` double(15,2) DEFAULT NULL,
  `metodo` char(1) DEFAULT NULL COMMENT '1 = EFECTIVO 2 =TARJETAS 3 =TRANSFERENCIAS',
  PRIMARY KEY (`caja_chica_id`),
  KEY `id_caja_empresa` (`id_caja_empresa`),
  CONSTRAINT `caja_chica_ibfk_1` FOREIGN KEY (`id_caja_empresa`) REFERENCES `caja_empresa` (`caja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caja_chica`
--

/*!40000 ALTER TABLE `caja_chica` DISABLE KEYS */;
INSERT INTO `caja_chica` (`caja_chica_id`,`id_caja_empresa`,`hora`,`detalle`,`tipo`,`entrada`,`salida`,`metodo`) VALUES 
 (1,1,'04:57 PM','Apertura de caja','a',2000.00,0.00,NULL),
 (122,48,'12:05 AM','Apertura de caja','a',200.00,0.00,NULL),
 (123,49,'01:05 PM','Apertura de caja','a',0.00,0.00,NULL);
/*!40000 ALTER TABLE `caja_chica` ENABLE KEYS */;


--
-- Definition of table `caja_empresa`
--

DROP TABLE IF EXISTS `caja_empresa`;
CREATE TABLE `caja_empresa` (
  `caja_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `detalle` varchar(200) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `entrada` varchar(200) DEFAULT NULL,
  `salida` varchar(200) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`caja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caja_empresa`
--

/*!40000 ALTER TABLE `caja_empresa` DISABLE KEYS */;
INSERT INTO `caja_empresa` (`caja_id`,`id_empresa`,`sucursal`,`detalle`,`fecha`,`entrada`,`salida`,`estado`) VALUES 
 (1,12,1,'CAJA FUNERARIA','2022-07-01','2300','405','0'),
 (48,12,1,'100','2025-03-26','','','1'),
 (49,12,1,'03 02 26','2026-02-03','','','1');
/*!40000 ALTER TABLE `caja_empresa` ENABLE KEYS */;


--
-- Definition of table `cliente_venta`
--

DROP TABLE IF EXISTS `cliente_venta`;
CREATE TABLE `cliente_venta` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cliente_venta`
--

/*!40000 ALTER TABLE `cliente_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_venta` ENABLE KEYS */;


--
-- Definition of table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `datos` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion2` varchar(220) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono2` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `ultima_venta` date DEFAULT NULL,
  `total_venta` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_clientes_empresas_idx` (`id_empresa`),
  CONSTRAINT `fk_clientes_empresas` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11701 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id_cliente`,`documento`,`datos`,`direccion`,`direccion2`,`telefono`,`telefono2`,`email`,`id_empresa`,`ultima_venta`,`total_venta`) VALUES 
 (2313,'15565803953','FLAMES CASANOVA LUIS EDUARDO','JR. GENERAL CORDOVA 1987 LINCE',NULL,'923512409                          ','','',12,'2025-02-21',NULL),
 (11682,'42799312','MANUEL HIPOLITO AGUADO SIERRA','','',NULL,NULL,NULL,12,'2026-03-01',NULL),
 (11683,'10427993120','AGUADO SIERRA MANUEL HIPOLITO','-','','','','',12,'2026-02-25',50.00),
 (11684,'42869048','HECTOR ODON MAYTA SIERRA','Santa Adela ','Nuevo Imperial ',NULL,NULL,NULL,12,'2026-03-01',NULL),
 (11685,'45497593','MARILYN EVELYN SANCHEZ SILVA','Santa Adela','',NULL,NULL,NULL,12,NULL,NULL),
 (11686,'SDVN576','VICENTE LEVANO MILTON','SAN VICENTE','','','','',12,'2026-03-01',110.00),
 (11687,'45707143','ERMIS ANDRES ACENCIO SIERRA','LAS LOMAS DE PALAO SANTA CLARA- LIMA','',NULL,NULL,NULL,12,'2026-03-26',NULL),
 (11688,'45707174','YANET MARILU CHERO PRADO','LAS LOMAS DE PALAO SANTA CLARA - LIMA','',NULL,NULL,NULL,12,NULL,NULL),
 (11689,'42959669','IVAN ROBINZON MENDOZA CARRION','EL DECIERTO , FRENTE DEL GRIFO ','',NULL,NULL,NULL,12,'2026-03-26',NULL),
 (11690,'48206248','MARVIN YAHIR CARHUAS HURTADO','urb. SINDICATO DE CHOFEREZ MZ D LT 03','',NULL,NULL,NULL,12,NULL,NULL),
 (11691,'15349905','GABRIELA EDUARDINA SILVA ZAMBRANO','fundo santa adela ','',NULL,NULL,NULL,12,NULL,NULL),
 (11692,'15352704','MOISES SANCHEZ GARCIA','','',NULL,NULL,NULL,12,NULL,NULL),
 (11693,'45169327','REGINA EDITH GERONIMO ONCEBAY','CHILCAL  PASAJE MIRAFLOREDE','SAN VICENTE',NULL,NULL,NULL,12,'2026-05-24',NULL),
 (11694,'40277628','MAICOL MARTIN BAZAN GUZMAN','Av. 28 Julio 287 - San Vicente','',NULL,NULL,NULL,12,'2026-05-24',NULL),
 (11695,'73830696','CARLOS PEDRO ENRIQUE HUANDO NOEL','AA.HH Josefina Ramos Mz.z1 lt.16 - Imperial','',NULL,NULL,NULL,12,NULL,NULL),
 (11696,'41465258','JUAN CARLOS IMAN QUISPE','Miraflores - San VIcente','',NULL,NULL,NULL,12,NULL,NULL),
 (11697,'15346832','CLAUDIO PABLO JARA MURGA','Rest. Doña Delia - Caltopa Alta','',NULL,NULL,NULL,12,NULL,NULL),
 (11698,'41174126','NORA OLIVOS SOLORZANO','zuñiga','',NULL,NULL,NULL,12,NULL,NULL),
 (11699,'44990748','San Jeronimo S/N - Yauyos','','',NULL,NULL,NULL,12,NULL,NULL),
 (11700,'16290094','AGUSTIN JULIAN GUTIERREZ HUAMAN','San Jerónimo - Yauyos','',NULL,NULL,NULL,12,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


--
-- Definition of table `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_tido` int(11) DEFAULT NULL,
  `id_tipo_pago` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `fecha_emision` varchar(50) DEFAULT NULL,
  `fecha_vencimiento` varchar(50) DEFAULT NULL,
  `dias_pagos` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `serie` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `moneda` char(1) DEFAULT NULL,
  `sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_tipo_pago` (`id_tipo_pago`),
  KEY `id_tido` (`id_tido`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`tipo_pago_id`),
  CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`),
  CONSTRAINT `compras_ibfk_4` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`proveedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `compras`
--

/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;


--
-- Definition of table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
CREATE TABLE `cotizaciones` (
  `cotizacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `id_tido` int(11) NOT NULL,
  `id_tipo_pago` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `dias_pagos` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(220) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` double(10,2) DEFAULT NULL,
  `estado` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `usar_precio` int(11) DEFAULT NULL,
  `moneda` int(11) DEFAULT '1',
  `cm_tc` varchar(100) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`cotizacion_id`),
  KEY `id_tido` (`id_tido`),
  KEY `id_tipo_pago` (`id_tipo_pago`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`),
  CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`tipo_pago_id`),
  CONSTRAINT `cotizaciones_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8917 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cotizaciones`
--

/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
INSERT INTO `cotizaciones` (`cotizacion_id`,`numero`,`id_tido`,`id_tipo_pago`,`fecha`,`dias_pagos`,`direccion`,`id_cliente`,`total`,`estado`,`id_empresa`,`sucursal`,`usar_precio`,`moneda`,`cm_tc`,`id_usuario`) VALUES 
 (8890,1,1,1,'2026-02-25','','1',11682,30.00,'1',12,1,5,1,'',40),
 (8891,2,1,1,'2026-03-01','','1',11684,30.00,'2',12,1,5,1,'',41),
 (8892,3,1,1,'2026-03-01','','1',11684,30.00,'2',12,1,5,1,'',41),
 (8893,4,1,1,'2026-03-01','','1',11682,240.00,'1',12,1,5,1,'',40),
 (8894,5,1,1,'2026-03-01','','1',11684,110.00,'1',12,1,5,1,'',41),
 (8895,6,1,1,'2026-03-01','','1',11685,110.00,'0',12,1,5,1,'',41),
 (8896,7,1,1,'2026-03-21','','1',11687,10000.00,'2',12,1,5,1,'',44),
 (8897,8,1,1,'2026-03-26','','1',11688,100.00,'2',12,1,5,1,'',44),
 (8898,9,1,1,'2026-03-25','','1',11687,100.00,'2',12,1,5,1,'',44),
 (8899,10,1,1,'2026-03-26','','1',11687,100.00,'1',12,1,5,1,'',44),
 (8900,11,1,1,'2026-03-26','','1',11689,110.00,'1',12,1,5,1,'',44),
 (8901,12,1,1,'2026-03-26','','1',11690,440.00,'0',12,1,5,1,'',44),
 (8902,13,1,1,'2026-03-26','','1',11690,440.00,'2',12,1,5,1,'',44),
 (8903,14,1,1,'2026-03-26','','1',11690,330.00,'0',12,1,5,1,'',44),
 (8904,15,1,1,'2026-03-26','','1',11690,220.00,'0',12,1,5,1,'',44),
 (8905,16,1,1,'2026-04-10','','1',11691,240.00,'2',12,1,5,1,'',42),
 (8906,17,1,1,'2026-04-10','','1',11692,600.00,'2',12,1,5,1,'',42),
 (8907,18,1,1,'2026-05-24','','1',11693,110.00,'1',12,1,1,1,'',45),
 (8908,19,1,1,'2026-05-24','','1',11694,110.00,'1',12,1,1,1,'',45),
 (8909,20,1,1,'2026-05-24','','1',11695,110.00,'0',12,1,5,1,'',45),
 (8910,21,1,1,'2026-05-24','','1',11696,360.00,'0',12,1,1,1,'',45),
 (8911,22,1,1,'2026-05-24','','1',11697,110.00,'0',12,1,5,1,'',45),
 (8912,23,1,1,'2026-05-24','','1',11698,120.00,'0',12,1,5,1,'',45),
 (8913,24,1,1,'2026-05-24','','1',11699,240.00,'2',12,1,1,1,'',45),
 (8914,25,1,1,'2026-05-24','','1',11699,240.00,'0',12,1,5,1,'',45),
 (8915,26,1,1,'2026-05-24','','1',11700,110.00,'0',12,1,5,1,'',45),
 (8916,27,1,1,'2026-05-24','','1',11693,110.00,'2',12,1,5,1,'',45);
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;


--
-- Definition of table `cuotas_cotizacion`
--

DROP TABLE IF EXISTS `cuotas_cotizacion`;
CREATE TABLE `cuotas_cotizacion` (
  `cuota_coti_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_coti` int(11) DEFAULT NULL,
  `monto` double(10,3) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` char(1) DEFAULT '0',
  PRIMARY KEY (`cuota_coti_id`),
  KEY `id_coti` (`id_coti`),
  CONSTRAINT `cuotas_cotizacion_ibfk_1` FOREIGN KEY (`id_coti`) REFERENCES `cotizaciones` (`cotizacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuotas_cotizacion`
--

/*!40000 ALTER TABLE `cuotas_cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuotas_cotizacion` ENABLE KEYS */;


--
-- Definition of table `dias_compras`
--

DROP TABLE IF EXISTS `dias_compras`;
CREATE TABLE `dias_compras` (
  `dias_compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) DEFAULT NULL,
  `monto` double(10,3) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`dias_compra_id`),
  KEY `id_compra` (`id_compra`),
  CONSTRAINT `dias_compras_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dias_compras`
--

/*!40000 ALTER TABLE `dias_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `dias_compras` ENABLE KEYS */;


--
-- Definition of table `dias_ventas`
--

DROP TABLE IF EXISTS `dias_ventas`;
CREATE TABLE `dias_ventas` (
  `dias_venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) DEFAULT NULL,
  `monto` double(10,3) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` char(1) DEFAULT '0',
  PRIMARY KEY (`dias_venta_id`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `dias_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dias_ventas`
--

/*!40000 ALTER TABLE `dias_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dias_ventas` ENABLE KEYS */;


--
-- Definition of table `documentos_empresas`
--

DROP TABLE IF EXISTS `documentos_empresas`;
CREATE TABLE `documentos_empresas` (
  `id_empresa` int(11) NOT NULL,
  `id_tido` int(11) NOT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `serie` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero` int(6) DEFAULT NULL,
  KEY `fk_empresas_has_documentos_sunat_documentos_sunat1_idx` (`id_tido`),
  KEY `fk_empresas_has_documentos_sunat_empresas1_idx` (`id_empresa`),
  CONSTRAINT `fk_empresas_has_documentos_sunat_documentos_sunat1` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresas_has_documentos_sunat_empresas1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `documentos_empresas`
--

/*!40000 ALTER TABLE `documentos_empresas` DISABLE KEYS */;
INSERT INTO `documentos_empresas` (`id_empresa`,`id_tido`,`sucursal`,`serie`,`numero`) VALUES 
 (12,1,1,'B001',7),
 (12,2,1,'F001',2),
 (12,3,1,'F001',1),
 (12,4,1,'F001',1),
 (12,6,1,'NV01',9),
 (12,11,1,'T001',1);
/*!40000 ALTER TABLE `documentos_empresas` ENABLE KEYS */;


--
-- Definition of table `documentos_sunat`
--

DROP TABLE IF EXISTS `documentos_sunat`;
CREATE TABLE `documentos_sunat` (
  `id_tido` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cod_sunat` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `abreviatura` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_tido`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `documentos_sunat`
--

/*!40000 ALTER TABLE `documentos_sunat` DISABLE KEYS */;
INSERT INTO `documentos_sunat` (`id_tido`,`nombre`,`cod_sunat`,`abreviatura`) VALUES 
 (1,'BOLETA DE VENTA','03','BT'),
 (2,'FACTURA','01','FT'),
 (3,'NOTA DE CREDITO','07','NC'),
 (4,'NOTA DE DEBITO','08','ND'),
 (5,'NOTA DE RECEPCION','09','GR'),
 (6,'NOTA DE VENTA','00','NV'),
 (7,'NOTA DE SEPARACION','00','NS'),
 (8,'NOTA DE TRASLADO','00','NT'),
 (9,'NOTA DE INVENTARIO','00','NIV'),
 (10,'NOTA DE INGRESO','00','NIG'),
 (11,'GUIA DE REMISION','09','GR'),
 (12,'NOTA DE COMPRA','00',NULL);
/*!40000 ALTER TABLE `documentos_sunat` ENABLE KEYS */;


--
-- Definition of table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `razon_social` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comercial` varchar(245) COLLATE utf8_spanish_ci NOT NULL,
  `cod_sucursal` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `user_sol` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clave_sol` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `logo` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ubigeo` varchar(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `distrito` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provincia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_impresion` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `igv` double(10,2) DEFAULT '0.18',
  `propaganda` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono2` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono3` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `empresas`
--

/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` (`id_empresa`,`ruc`,`razon_social`,`comercial`,`cod_sucursal`,`direccion`,`email`,`telefono`,`estado`,`password`,`user_sol`,`clave_sol`,`logo`,`ubigeo`,`distrito`,`provincia`,`departamento`,`tipo_impresion`,`modo`,`igv`,`propaganda`,`telefono2`,`telefono3`) VALUES 
 (12,'10428690481','HECTOR ODON MAYTA SIERRA','VIÑA SANTO DOMINGO',NULL,'MZ S/N FDO SANTA ADELA, NUEVO IMPERIAL - CAÑETE','ventas@viñasantodomingo.com','930570018','1',NULL,'ALIDLEO2','ALIDleo2','nUmdN40McVy2i1IZUthiXjhcyOSra7IEmu3sDwf3ZBcixKbYwQjxwR4KpF09xyaWsSxUWAtSQH4AXhc0.png','040111','NUEVO IMPERIAL','CAÑETE','LIMA',NULL,'beta',0.18,'',NULL,NULL);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;


--
-- Definition of table `guia_detalles`
--

DROP TABLE IF EXISTS `guia_detalles`;
CREATE TABLE `guia_detalles` (
  `guia_detalle_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_guia` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `detalles` varchar(200) DEFAULT NULL,
  `unidad` varchar(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double(20,5) DEFAULT NULL,
  PRIMARY KEY (`guia_detalle_id`),
  KEY `id_guia` (`id_guia`),
  CONSTRAINT `guia_detalles_ibfk_1` FOREIGN KEY (`id_guia`) REFERENCES `guia_remision` (`id_guia_remision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guia_detalles`
--

/*!40000 ALTER TABLE `guia_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `guia_detalles` ENABLE KEYS */;


--
-- Definition of table `guia_remision`
--

DROP TABLE IF EXISTS `guia_remision`;
CREATE TABLE `guia_remision` (
  `id_guia_remision` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `fecha_emision` date DEFAULT NULL,
  `dir_llegada` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ubigeo` varchar(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_transporte` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ruc_transporte` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `razon_transporte` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `vehiculo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chofer_brevete` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `enviado_sunat` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hash` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_xml` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serie` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero` int(7) DEFAULT NULL,
  `peso` double(8,2) DEFAULT NULL,
  `nro_bultos` int(4) DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(2) DEFAULT NULL,
  `sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_guia_remision`),
  KEY `fk_guia_remision_ventas1_idx` (`id_venta`),
  CONSTRAINT `fk_guia_remision_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `guia_remision`
--

/*!40000 ALTER TABLE `guia_remision` DISABLE KEYS */;
/*!40000 ALTER TABLE `guia_remision` ENABLE KEYS */;


--
-- Definition of trigger `ti_guia_remision`
--

DROP TRIGGER /*!50030 IF EXISTS */ `ti_guia_remision`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `ti_guia_remision` AFTER INSERT ON `guia_remision` FOR EACH ROW BEGIN
DECLARE idtido_ INT;
DECLARE idempresa_ INT;
DECLARE sucursal_ INT;
SET idtido_ = 11;
SET idempresa_ = new.id_empresa;
SET sucursal_ = new.sucursal;
UPDATE documentos_empresas AS de
SET de.numero = de.numero + 1
WHERE de.id_empresa = idempresa_ AND de.id_tido = idtido_ AND de.sucursal=sucursal_;
END $$

DELIMITER ;

--
-- Definition of table `guia_sunat`
--

DROP TABLE IF EXISTS `guia_sunat`;
CREATE TABLE `guia_sunat` (
  `id_guia` int(11) NOT NULL,
  `hash` varchar(200) DEFAULT NULL,
  `nombre_xml` varchar(200) DEFAULT NULL,
  `qr_data` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`id_guia`),
  CONSTRAINT `guia_sunat_ibfk_1` FOREIGN KEY (`id_guia`) REFERENCES `guia_remision` (`id_guia_remision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guia_sunat`
--

/*!40000 ALTER TABLE `guia_sunat` DISABLE KEYS */;
/*!40000 ALTER TABLE `guia_sunat` ENABLE KEYS */;


--
-- Definition of table `ingreso_egreso`
--

DROP TABLE IF EXISTS `ingreso_egreso`;
CREATE TABLE `ingreso_egreso` (
  `intercambio_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `almacen_ingreso` int(11) DEFAULT NULL,
  `almacen_egreso` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `estado` char(1) DEFAULT '2' COMMENT '2 = solo ingreso',
  PRIMARY KEY (`intercambio_id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  KEY `fk_ingreso_almacen` (`almacen_ingreso`),
  KEY `fk_egreso_almacen` (`almacen_egreso`),
  CONSTRAINT `fk_egreso_almacen` FOREIGN KEY (`almacen_egreso`) REFERENCES `almacenes` (`id`),
  CONSTRAINT `fk_ingreso_almacen` FOREIGN KEY (`almacen_ingreso`) REFERENCES `almacenes` (`id`),
  CONSTRAINT `ingreso_egreso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `ingreso_egreso_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingreso_egreso`
--

/*!40000 ALTER TABLE `ingreso_egreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso_egreso` ENABLE KEYS */;


--
-- Definition of table `mes`
--

DROP TABLE IF EXISTS `mes`;
CREATE TABLE `mes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mes`
--

/*!40000 ALTER TABLE `mes` DISABLE KEYS */;
INSERT INTO `mes` (`id`,`nombre`) VALUES 
 (1,'Ene'),
 (2,'Feb'),
 (3,'Mar'),
 (4,'Abr'),
 (5,'May'),
 (6,'Jun'),
 (7,'Jul'),
 (8,'Ago'),
 (9,'Set'),
 (10,'Oct'),
 (11,'Nov'),
 (12,'Dic');
/*!40000 ALTER TABLE `mes` ENABLE KEYS */;


--
-- Definition of table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `metodo_pago`
--

/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` (`id_metodo_pago`,`nombre`,`estado`) VALUES 
 (1,'TRANSFERENCIA BANCO BCP','1'),
 (2,'TRANSFERENCIA BANCO NACION','1'),
 (3,'TRANSFERENCIA BANCO INTERBANK','1'),
 (4,'TRANSFERENCIA BANCO BBVA','1'),
 (5,'YAPE','1'),
 (6,'PLIN','1'),
 (7,'TARJETA DE CREDITO VISA','0'),
 (8,'TARJETA DE CREDITO MASTERCARD','0'),
 (9,'TARJETA DE CREDITO DINNERS CLUB','0'),
 (10,'POS ','1'),
 (11,'TRANSFERENCIA BANCO SCOTIABANK','1'),
 (12,'EFECTIVO','1');
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;


--
-- Definition of table `motivo_documento`
--

DROP TABLE IF EXISTS `motivo_documento`;
CREATE TABLE `motivo_documento` (
  `id_motivo` int(11) NOT NULL,
  `codigo` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_tido` int(11) NOT NULL,
  PRIMARY KEY (`id_motivo`),
  KEY `fk_motivo_documento_documentos_sunat1_idx` (`id_tido`),
  CONSTRAINT `fk_motivo_documento_documentos_sunat1` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `motivo_documento`
--

/*!40000 ALTER TABLE `motivo_documento` DISABLE KEYS */;
INSERT INTO `motivo_documento` (`id_motivo`,`codigo`,`nombre`,`id_tido`) VALUES 
 (1,'01','Anulación de la operacion',3),
 (2,'02','Anulación por error en el RUC',3),
 (3,'03','Corrección por error en la descripción',3),
 (4,'10','Otros Conceptos',3),
 (5,'01','Intereses por mora',4),
 (6,'02','Aumento en el valor',4),
 (7,'03','Penalidades/ otros conceptos',4);
/*!40000 ALTER TABLE `motivo_documento` ENABLE KEYS */;


--
-- Definition of table `notas_electronicas`
--

DROP TABLE IF EXISTS `notas_electronicas`;
CREATE TABLE `notas_electronicas` (
  `nota_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `tido` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `motivo` int(11) DEFAULT NULL,
  `monto` double(15,2) DEFAULT NULL,
  `productos` longtext,
  `estado_sunat` char(1) DEFAULT '0',
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`nota_id`),
  KEY `tido` (`tido`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `notas_electronicas_ibfk_1` FOREIGN KEY (`tido`) REFERENCES `documentos_sunat` (`id_tido`),
  CONSTRAINT `notas_electronicas_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notas_electronicas`
--

/*!40000 ALTER TABLE `notas_electronicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_electronicas` ENABLE KEYS */;


--
-- Definition of trigger `ti_notas_e`
--

DROP TRIGGER /*!50030 IF EXISTS */ `ti_notas_e`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `ti_notas_e` AFTER INSERT ON `notas_electronicas` FOR EACH ROW BEGIN
  DECLARE idtido_ INT ;
  DECLARE idempresa_ INT ;
  DECLARE sucursal_ INT;
  
  
  SET idtido_ = new.tido ;
  SET idempresa_ = new.id_empresa ;
  SET sucursal_ = new.sucursal;
  
  UPDATE 
    documentos_empresas AS de 
  SET
    de.numero = de.numero + 1 
  WHERE de.id_empresa = idempresa_ 
    AND de.id_tido = idtido_ AND de.sucursal=sucursal_;
  
END $$

DELIMITER ;

--
-- Definition of table `notas_electronicas_sunat`
--

DROP TABLE IF EXISTS `notas_electronicas_sunat`;
CREATE TABLE `notas_electronicas_sunat` (
  `id_notas_electronicas` int(11) NOT NULL,
  `hash` varchar(200) DEFAULT NULL,
  `nombre_xml` varchar(200) DEFAULT NULL,
  `qr_data` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`id_notas_electronicas`),
  CONSTRAINT `notas_electronicas_sunat_ibfk_1` FOREIGN KEY (`id_notas_electronicas`) REFERENCES `notas_electronicas` (`nota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notas_electronicas_sunat`
--

/*!40000 ALTER TABLE `notas_electronicas_sunat` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_electronicas_sunat` ENABLE KEYS */;


--
-- Definition of table `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `cod_barra` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serie_producto` varchar(100) COLLATE utf8_spanish_ci DEFAULT '',
  `descripcion` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` double(10,4) DEFAULT NULL,
  `costo` double(10,4) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `iscbp` int(2) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `ultima_salida` date NOT NULL,
  `codsunat` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usar_barra` char(1) COLLATE utf8_spanish_ci DEFAULT '0',
  `precio_mayor` double(10,4) DEFAULT NULL,
  `precio_menor` double(10,4) DEFAULT NULL,
  `razon_social` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ruc` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT '1',
  `almacen` int(11) DEFAULT NULL,
  `precio2` double(10,4) DEFAULT '0.0000',
  `precio3` double(10,4) DEFAULT '0.0000',
  `precio4` double(10,4) DEFAULT '0.0000',
  `precio_unidad` double(10,4) DEFAULT '0.0000',
  `codigo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `prod_cod` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'CODIGO DE PRODUCTO API',
  `marca` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'MARCA PARA API',
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_empresas1_idx` (`id_empresa`),
  KEY `fk_productos_almacen` (`almacen`),
  CONSTRAINT `fk_productos_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacenes` (`id`),
  CONSTRAINT `fk_productos_empresas1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41375 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id_producto`,`cod_barra`,`serie_producto`,`descripcion`,`precio`,`costo`,`cantidad`,`iscbp`,`id_empresa`,`sucursal`,`ultima_salida`,`codsunat`,`usar_barra`,`precio_mayor`,`precio_menor`,`razon_social`,`ruc`,`estado`,`almacen`,`precio2`,`precio3`,`precio4`,`precio_unidad`,`codigo`,`fecha_ingreso`,`prod_cod`,`marca`) VALUES 
 (41297,NULL,'123','prueba',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'prueba','2026-02-21 12:44:15','0001',''),
 (41298,NULL,'132','prueba 2',13.0000,13.0000,13,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,13.0000,'prueba 2','2026-02-21 12:49:10','0001',''),
 (41299,NULL,'132','prueba 2',13.0000,13.0000,13,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,13.0000,'prueba 2','2026-02-21 12:52:19','0001',''),
 (41300,NULL,'132','prueba 2',13.0000,13.0000,13,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,13.0000,'prueba 2','2026-02-21 12:52:35','0001',''),
 (41301,NULL,'123','prueba 3',31.0000,31.0000,31,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,31.0000,'prueba 3','2026-02-21 12:55:16','0001',''),
 (41302,NULL,'123','prueba 3',31.0000,31.0000,31,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,31.0000,'prueba 3','2026-02-21 12:55:56','0001',''),
 (41303,NULL,'qdqdeqw','prueba 44',123.0000,123.0000,13,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,123.0000,'prueba 44','2026-02-21 12:56:18','0001',''),
 (41304,NULL,'12','dqwdwq',1.0000,1.0000,1,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,1.0000,'dqwdwq','2026-02-21 12:57:05','0001',''),
 (41305,NULL,'asdsadas','dasdasds',1223.0000,3213.0000,123123,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,1223.0000,'dasdasds','2026-02-21 12:58:28','0001',''),
 (41306,NULL,'123','dwqdqw',0.0000,0.0000,0,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,0.0000,'dwqdqw','2026-02-21 12:59:18','-1',''),
 (41307,NULL,'12','sdasdas',0.0000,0.0000,0,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,0.0000,'sdasdas','2026-02-21 13:00:10','-1',''),
 (41308,NULL,'12','sdasdas',0.0000,0.0000,0,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,0.0000,'sdasdas','2026-02-21 13:00:26','-1',''),
 (41309,NULL,'dasdas','dsadsad',0.0000,0.0000,0,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,0.0000,'dsadsad','2026-02-21 13:03:05','-1',''),
 (41310,NULL,'asdsa','sdasdsa',0.0000,0.0000,0,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,0.0000,'sdasdsa','2026-02-21 13:39:03','-1',''),
 (41311,NULL,'asdas','dasdas',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dasdas','2026-02-21 13:43:48','0001',''),
 (41312,NULL,'asdasd','dasdsa',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dasdsa','2026-02-21 13:47:19','0001',''),
 (41313,NULL,'sadasd','sadsadsad',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'sadsadsad','2026-02-21 13:52:27','0001',''),
 (41314,NULL,'1sda','dsadsad',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dsadsad','2026-02-21 13:58:45','0001',''),
 (41315,NULL,'dasdsa','dsadas',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dsadas','2026-02-21 14:00:09','0001',''),
 (41316,NULL,'dasd','dasdas',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dasdas','2026-02-21 14:02:16','0001',''),
 (41317,NULL,'asdad','adasda',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'adasda','2026-02-21 14:05:40','0001',''),
 (41318,NULL,'dqwdqw','dqwdqw',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dqwdqw','2026-02-21 14:08:11','0001',''),
 (41319,NULL,'asdsad','dasdsad',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dasdsad','2026-02-21 14:09:31','0001',''),
 (41320,NULL,'sadasd','dasddsad',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dasddsad','2026-02-21 14:10:23','0001',''),
 (41321,NULL,'dasdas','dasdas',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dasdas','2026-02-21 14:11:15','0001',''),
 (41322,NULL,'sadas','asdsa',11.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,11.0000,'asdsa','2026-02-21 14:12:19','0001',''),
 (41323,NULL,'sdad','ddasd',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'ddasd','2026-02-21 14:14:44','0001',''),
 (41324,NULL,'assadas','adasd',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'adasd','2026-02-21 14:15:43','0008',''),
 (41325,NULL,'dasdas','asdsad',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'asdsad','2026-02-21 14:16:54','0008',''),
 (41326,NULL,'dsadas','asdsa',121.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,121.0000,'asdsa','2026-02-21 14:17:58','0009',''),
 (41327,NULL,'saddasda','adsad',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'adsad','2026-02-21 14:21:16','0009',''),
 (41328,NULL,'adsad','adsadas',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'adsadas','2026-02-21 14:23:51','0021',''),
 (41329,NULL,'123','vino tinto',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'vino tinto','2026-02-21 14:26:08','0021',''),
 (41330,NULL,'123','vino',123.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,123.0000,'vino','2026-02-21 14:28:48','0021',''),
 (41331,NULL,'123','vino',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'vino','2026-02-21 14:31:51','0021',''),
 (41332,NULL,'12','prueba',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'prueba','2026-02-21 14:38:31','0001',''),
 (41333,NULL,'123','vino',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'vino','2026-02-21 14:41:54','0001',''),
 (41334,NULL,'ewq','qewqewq',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'qewqewq','2026-02-21 14:46:19','0001',''),
 (41335,NULL,'sada','sadsad',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'sadsad','2026-02-21 14:47:43','0001',''),
 (41336,NULL,'sadas','sdasd',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'sdasd','2026-02-21 14:48:51','0001',''),
 (41337,NULL,'sadas','asdsaqd',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'asdsaqd','2026-02-21 14:53:39','0001',''),
 (41338,NULL,'123','prueba',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'prueba','2026-02-21 14:56:45','0001',''),
 (41339,NULL,'12','ssss',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'ssss','2026-02-21 14:58:55','0001',''),
 (41340,NULL,'123','ssss',123.0000,123.0000,123,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,123.0000,'ssss','2026-02-21 15:01:11','Error sopprod: Cannot add or update a child row: a',''),
 (41341,NULL,'123','sdad',113.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,113.0000,'sdad','2026-02-21 15:02:23','Error sopprod: Cannot add or update a child row: a',''),
 (41342,NULL,'123','dasdsadasd',123.0000,123.0000,123,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,123.0000,'dasdsadasd','2026-02-21 15:06:02','Error sopprod: Cannot add or update a child row: a',''),
 (41343,NULL,'ewqewq','weqwe',123.0000,123.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,123.0000,'weqwe','2026-02-21 15:07:13','Tablas maestras vacías',''),
 (41344,NULL,'123','sdasd',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'sdasd','2026-02-21 15:08:55','Error sopprod: Cannot add or update a child row: a',''),
 (41345,NULL,'12','dsdassd',12.0000,12.0000,2,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'dsdassd','2026-02-21 15:10:21','Error',''),
 (41346,NULL,'wqeqw','dwqdqw',123.0000,123.0000,123,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,123.0000,'dwqdqw','2026-02-21 15:11:52','Error',''),
 (41347,NULL,'123','wewqe',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'wewqe','2026-02-21 15:15:10','0009',''),
 (41348,NULL,'123','vino tinto',12.0000,12.0000,12,0,12,1,'1000-01-01','1','0',0.0000,0.0000,'LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.','20100190797','0',1,0.0000,0.0000,0.0000,12.0000,'vino tinto','2026-02-21 15:16:39','0001',''),
 (41349,'','003','BORGOÑA NEGRO 750ml - 11% Vol.',50.0000,5.8300,12,0,12,1,'1000-01-01','2','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,12.0000,'BORGOÑA NEGRO 750ml ','2026-02-21 15:43:42','0002',''),
 (41350,'','003','BORGOÑA BLANCA 750ml - 11% vol.',30.0000,5.8300,16,0,12,1,'1000-01-01','2','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,12.0000,'BORGOÑA BLANCA 750ml','2026-02-21 18:39:09','0003',''),
 (41351,'','0004','BORGOÑA ROSÉ',50.0000,5.8300,30,0,12,1,'1000-01-01','2','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,12.0000,'BORGOÑA ROSÉ','2026-02-22 09:29:01','0004',''),
 (41352,'','0005','DSANGRE QUEBRANTA 750ml - 11% vol.',50.0000,11.0000,30,0,12,1,'1000-01-01','2','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,20.0000,'DSANGRE QUEBRANTA 75','2026-02-22 09:30:59','0005',''),
 (41353,'','0090','PISCO ACHOLADO',35.0000,12.0000,50,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','0',1,0.0000,0.0000,0.0000,20.0000,'PISCO ACHOLADO','2026-02-25 10:31:18','0006',''),
 (41354,'','001','CAJA DE VINO BORGOÑA BLANCA',110.0000,70.0000,255,0,12,1,'1000-01-01','4','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','0',1,0.0000,0.0000,0.0000,110.0000,'CAJA DE VINO BORGOÑA','2026-03-01 09:00:07','0007',''),
 (41355,NULL,'01CVBB','CAJA DE VINO BLANCO',120.0000,70.0000,151,0,12,1,'1000-01-01','4','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,120.0000,'CAJA DE VINO BLANCO','2026-03-15 20:08:29','0008',''),
 (41356,NULL,'01CGR','CAJA DE VINO GRAN ROSE ',120.0000,70.0000,92,0,12,1,'1000-01-01','4','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,120.0000,'CAJA DE VINO GRAN RO','2026-03-15 20:09:58','0009',''),
 (41357,NULL,'01CVBT','CAJA DE VINO BORGOÑA TINTO',120.0000,70.0000,26,0,12,1,'1000-01-01','4','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,120.0000,'CAJA DE VINO BORGOÑA','2026-03-15 20:12:14','0010',''),
 (41358,NULL,'03CMM','CAJA MACERADO DE MARACUYA',240.0000,120.0000,2,0,12,1,'1000-01-01','0','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','0',1,0.0000,0.0000,0.0000,240.0000,'CAJA MACERADO DE MAR','2026-05-24 07:44:24','0011',''),
 (41359,NULL,'03CMM','CAJA MACERADO DE MARACUYA',240.0000,120.0000,2,0,12,1,'1000-01-01','0','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','0',1,0.0000,0.0000,0.0000,240.0000,'CAJA MACERADO DE MAR','2026-05-24 07:44:25','0012',''),
 (41360,NULL,'03CMP','CAJA MACERADO DE PIÑA',240.0000,120.0000,2,0,12,1,'1000-01-01','5','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,240.0000,'CAJA MACERADO DE PIÑ','2026-05-24 07:46:58','0013',''),
 (41361,NULL,'03CMM','CAJA MACERADO DE MARACUYA',240.0000,120.0000,2,0,12,1,'1000-01-01','5','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,240.0000,'CAJA MACERADO DE MAR','2026-05-24 07:48:56','0014',''),
 (41362,NULL,'03MMB','MACERADO DE MARACUYA BOTELLA 500ml',25.0000,10.0000,12,0,12,1,'1000-01-01','5','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,25.0000,'MACERADO DE MARACUYA','2026-05-24 07:51:29','0015',''),
 (41363,NULL,'03MPB','MACERADO DE PIÑA BOTELLA 500ml',25.0000,10.0000,12,0,12,1,'1000-01-01','5','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,25.0000,'MACERADO DE PIÑA BOT','2026-05-24 07:52:38','0016',''),
 (41364,NULL,'02CPA','CAJA PISCO ACHOLADO (Quebranta-Italia)',200.0000,144.0000,2,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','0',1,0.0000,0.0000,0.0000,200.0000,'CAJA PISCO ACHOLADO ','2026-05-24 07:58:34','0017',''),
 (41365,NULL,'02CPA','CAJA PISCO ACHOLADO (Quebranta-Italia)',200.0000,144.0000,2,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,200.0000,'CAJA PISCO ACHOLADO ','2026-05-24 07:58:35','0018',''),
 (41366,NULL,'02CPQ','CAJA PISCO QUEBRANTA ',200.0000,144.0000,2,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,200.0000,'CAJA PISCO QUEBRANTA','2026-05-24 07:59:55','0019',''),
 (41367,NULL,'02CPI','CAJA PISCO ITALIA',200.0000,144.0000,2,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,200.0000,'CAJA PISCO ITALIA','2026-05-24 08:01:23','0020',''),
 (41368,NULL,'02CPT','CAJA PISCO TORONTEL',220.0000,156.0000,2,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,220.0000,'CAJA PISCO TORONTEL','2026-05-24 08:03:35','0021',''),
 (41369,NULL,'02PIB','PISCO ITALIA BOTELLA 500ml',25.0000,10.0000,12,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,25.0000,'PISCO ITALIA BOTELLA','2026-05-24 08:07:29','0022',''),
 (41370,NULL,'02PAB','PISCO ACHOLADO BOTERLLA500ml',25.0000,10.0000,12,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','0',1,0.0000,0.0000,0.0000,25.0000,'PISCO ACHOLADO BOTER','2026-05-24 08:08:48','0023',''),
 (41371,NULL,'02PAB','PISCO ACHOLADO BOTELLA500ml',25.0000,10.0000,12,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,25.0000,'PISCO ACHOLADO BOTEL','2026-05-24 08:11:19','0024',''),
 (41372,NULL,'02PQB','PISCO QUEBRANTA BOTELLA500ml',25.0000,10.0000,12,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,25.0000,'PISCO QUEBRANTA BOTE','2026-05-24 08:12:24','0025',''),
 (41373,NULL,'02PTB','PISCO TORONTEL BOTELLA 500ml',30.0000,13.0000,12,0,12,1,'1000-01-01','3','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,30.0000,'PISCO TORONTEL BOTEL','2026-05-24 08:24:22','0026',''),
 (41374,NULL,'01CVDS','CAJA VINO D SANGRE',150.0000,110.0000,10,0,12,1,'1000-01-01','4','0',0.0000,0.0000,'MAYTA SIERRA HECTOR ODON','10428690481','1',1,0.0000,0.0000,0.0000,150.0000,'CAJA VINO D SANGRE','2026-05-24 08:31:15','0027','');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;


--
-- Definition of table `productos_categorias`
--

DROP TABLE IF EXISTS `productos_categorias`;
CREATE TABLE `productos_categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `resp_api` int(11) DEFAULT '1' COMMENT 'ID RESP API',
  PRIMARY KEY (`id_categoria`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `productos_categorias`
--

/*!40000 ALTER TABLE `productos_categorias` DISABLE KEYS */;
INSERT INTO `productos_categorias` (`id_categoria`,`codigo`,`nombre`,`estado`,`resp_api`) VALUES 
 (1,'','VINO TINTO','1',0),
 (2,'2','BORGOÑA','1',2),
 (3,'3','PISCO','1',3),
 (4,'4','CAJAS DE VINO ','1',4),
 (5,'5','MACERADOS','1',5);
/*!40000 ALTER TABLE `productos_categorias` ENABLE KEYS */;


--
-- Definition of table `productos_compras`
--

DROP TABLE IF EXISTS `productos_compras`;
CREATE TABLE `productos_compras` (
  `id_producto_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `cantidad` varchar(50) DEFAULT NULL,
  `precio` double(10,3) DEFAULT NULL,
  `costo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_producto_venta`),
  KEY `id_producto` (`id_producto`),
  KEY `id_compra` (`id_compra`),
  CONSTRAINT `productos_compras_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `productos_compras_ibfk_2` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos_compras`
--

/*!40000 ALTER TABLE `productos_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_compras` ENABLE KEYS */;


--
-- Definition of table `productos_cotis`
--

DROP TABLE IF EXISTS `productos_cotis`;
CREATE TABLE `productos_cotis` (
  `id_producto` int(11) NOT NULL,
  `id_coti` int(11) NOT NULL,
  `cantidad` double(6,2) DEFAULT NULL,
  `precio` double(10,5) DEFAULT NULL,
  `costo` double(10,5) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_producto`,`id_coti`),
  KEY `id_coti` (`id_coti`),
  CONSTRAINT `productos_cotis_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `productos_cotis_ibfk_3` FOREIGN KEY (`id_coti`) REFERENCES `cotizaciones` (`cotizacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos_cotis`
--

/*!40000 ALTER TABLE `productos_cotis` DISABLE KEYS */;
INSERT INTO `productos_cotis` (`id_producto`,`id_coti`,`cantidad`,`precio`,`costo`,`serie`) VALUES 
 (41350,8890,1.00,30.00000,50.00000,''),
 (41350,8891,1.00,30.00000,50.00000,''),
 (41350,8892,1.00,30.00000,50.00000,''),
 (41354,8893,4.00,60.00000,70.00000,''),
 (41354,8894,1.00,110.00000,70.00000,'01VBB'),
 (41354,8895,1.00,110.00000,70.00000,''),
 (41355,8896,1.00,10000.00000,70.00000,'01VBB'),
 (41355,8897,1.00,100.00000,70.00000,'01VBB'),
 (41355,8898,1.00,100.00000,70.00000,'01VBB'),
 (41355,8899,1.00,100.00000,70.00000,''),
 (41355,8900,1.00,110.00000,70.00000,''),
 (41355,8901,4.00,110.00000,70.00000,'01VBB'),
 (41355,8902,4.00,110.00000,70.00000,'01VBB'),
 (41355,8905,2.00,120.00000,70.00000,'240'),
 (41355,8907,1.00,110.00000,70.00000,'01CVB'),
 (41355,8908,1.00,110.00000,70.00000,'01cvb '),
 (41355,8909,1.00,110.00000,70.00000,'01cvb'),
 (41355,8911,1.00,110.00000,70.00000,'01CVB'),
 (41355,8915,1.00,110.00000,70.00000,'02CVB'),
 (41355,8916,1.00,110.00000,70.00000,'01CVB'),
 (41356,8903,3.00,110.00000,70.00000,'01VGR'),
 (41356,8906,5.00,120.00000,70.00000,''),
 (41357,8904,2.00,110.00000,70.00000,'01VBT'),
 (41361,8913,1.00,240.00000,120.00000,'CMM'),
 (41362,8910,3.00,20.00000,10.00000,'03MMB'),
 (41362,8912,3.00,20.00000,10.00000,'03MMB'),
 (41362,8914,7.00,20.00000,10.00000,'03MMB'),
 (41363,8910,3.00,20.00000,10.00000,'03MPB'),
 (41363,8912,3.00,20.00000,10.00000,'03MPB'),
 (41363,8914,5.00,20.00000,10.00000,'03MPB'),
 (41369,8910,3.00,20.00000,10.00000,'02PIB'),
 (41371,8910,6.00,20.00000,10.00000,'02PAB'),
 (41372,8910,3.00,20.00000,10.00000,'02PQB');
/*!40000 ALTER TABLE `productos_cotis` ENABLE KEYS */;


--
-- Definition of table `productos_marcas`
--

DROP TABLE IF EXISTS `productos_marcas`;
CREATE TABLE `productos_marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `resp_api` int(11) DEFAULT '1' COMMENT 'ID RESP API',
  PRIMARY KEY (`id_marca`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `productos_marcas`
--

/*!40000 ALTER TABLE `productos_marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_marcas` ENABLE KEYS */;


--
-- Definition of table `productos_serie`
--

DROP TABLE IF EXISTS `productos_serie`;
CREATE TABLE `productos_serie` (
  `id_serie` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `serie_producto` varchar(100) COLLATE utf8_spanish_ci DEFAULT '',
  `id_compra` int(11) NOT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT '1' COMMENT '1 ACTIVO, 0 USADO',
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cod_extra1` varchar(100) COLLATE utf8_spanish_ci DEFAULT '0',
  `cod_extra2` varchar(100) COLLATE utf8_spanish_ci DEFAULT '0',
  `cod_extra3` varchar(100) COLLATE utf8_spanish_ci DEFAULT '0',
  PRIMARY KEY (`id_serie`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `productos_serie`
--

/*!40000 ALTER TABLE `productos_serie` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_serie` ENABLE KEYS */;


--
-- Definition of table `productos_testing`
--

DROP TABLE IF EXISTS `productos_testing`;
CREATE TABLE `productos_testing` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `cod_barra` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` double(10,4) DEFAULT NULL,
  `costo` double(10,4) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `iscbp` int(2) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `ultima_salida` date NOT NULL,
  `codsunat` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usar_barra` char(1) COLLATE utf8_spanish_ci DEFAULT '0',
  `precio_mayor` double(10,4) DEFAULT NULL,
  `precio_menor` double(10,4) DEFAULT NULL,
  `razon_social` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ruc` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT '1',
  `almacen` int(11) DEFAULT NULL,
  `precio2` double(10,4) DEFAULT '0.0000',
  `precio3` double(10,4) DEFAULT '0.0000',
  `precio4` double(10,4) DEFAULT '0.0000',
  `precio_unidad` double(10,4) DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_producto`) USING BTREE,
  KEY `fk_productos_testing_almacen` (`almacen`),
  CONSTRAINT `fk_productos_testing_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacenes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `productos_testing`
--

/*!40000 ALTER TABLE `productos_testing` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_testing` ENABLE KEYS */;


--
-- Definition of table `productos_testing_testing`
--

DROP TABLE IF EXISTS `productos_testing_testing`;
CREATE TABLE `productos_testing_testing` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `cod_barra` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` double(10,4) DEFAULT NULL,
  `costo` double(10,4) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `iscbp` int(2) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `ultima_salida` date NOT NULL,
  `codsunat` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usar_barra` char(1) COLLATE utf8_spanish_ci DEFAULT '0',
  `precio_mayor` double(10,4) DEFAULT NULL,
  `precio_menor` double(10,4) DEFAULT NULL,
  `razon_social` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ruc` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT '1',
  `almacen` int(11) DEFAULT NULL,
  `precio2` double(10,4) DEFAULT '0.0000',
  `precio3` double(10,4) DEFAULT '0.0000',
  `precio4` double(10,4) DEFAULT '0.0000',
  `precio_unidad` double(10,4) DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_producto`) USING BTREE,
  KEY `fk_productos_testing_testing_almacen` (`almacen`),
  CONSTRAINT `fk_productos_testing_testing_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacenes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `productos_testing_testing`
--

/*!40000 ALTER TABLE `productos_testing_testing` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_testing_testing` ENABLE KEYS */;


--
-- Definition of table `productos_ventas`
--

DROP TABLE IF EXISTS `productos_ventas`;
CREATE TABLE `productos_ventas` (
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` double(6,2) DEFAULT NULL,
  `precio` double(10,5) DEFAULT NULL,
  `costo` double(10,5) DEFAULT NULL,
  `precio_usado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serie` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  KEY `fk_productos_has_ventas_ventas1_idx` (`id_venta`),
  KEY `fk_productos_has_ventas_productos1_idx` (`id_producto`),
  CONSTRAINT `fk_productos_has_ventas_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_ventas_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `productos_ventas`
--

/*!40000 ALTER TABLE `productos_ventas` DISABLE KEYS */;
INSERT INTO `productos_ventas` (`id_producto`,`id_venta`,`cantidad`,`precio`,`costo`,`precio_usado`,`serie`) VALUES 
 (41350,17255,1.00,30.00000,50.00000,'5',''),
 (41350,17256,1.00,30.00000,50.00000,'1','003'),
 (41350,17258,1.00,30.00000,50.00000,'5',''),
 (41350,17259,1.00,30.00000,50.00000,'5',''),
 (41350,17260,1.00,30.00000,50.00000,'5',''),
 (41354,17261,4.00,60.00000,70.00000,'5',''),
 (41354,17262,1.00,110.00000,70.00000,'5','01VBB'),
 (41354,17263,1.00,110.00000,70.00000,'5','01VBB'),
 (41354,17264,1.00,110.00000,70.00000,'1','01VBB'),
 (41355,17265,1.00,110.00000,70.00000,'5',''),
 (41355,17266,1.00,100.00000,70.00000,'5',''),
 (41355,17267,1.00,110.00000,70.00000,'1','01CVB'),
 (41355,17268,1.00,110.00000,70.00000,'1','01cvb '),
 (41355,17269,1.00,110.00000,70.00000,'1','01cvb ');
/*!40000 ALTER TABLE `productos_ventas` ENABLE KEYS */;


--
-- Definition of table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(11) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT '',
  `email` varchar(150) DEFAULT '',
  `id_empresa` int(11) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `ubigeo` varchar(100) DEFAULT NULL,
  `fecha_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` int(11) DEFAULT '1',
  PRIMARY KEY (`proveedor_id`),
  UNIQUE KEY `ruc` (`ruc`)
) ENGINE=InnoDB AUTO_INCREMENT=4494 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proveedores`
--

/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` (`proveedor_id`,`ruc`,`razon_social`,`direccion`,`telefono`,`email`,`id_empresa`,`departamento`,`provincia`,`distrito`,`ubigeo`,`fecha_create`,`estado`) VALUES 
 (4466,'10427993120','AGUADO SIERRA MANUEL HIPOLITO',NULL,'','',12,NULL,NULL,NULL,NULL,'2026-02-21 10:18:12',1),
 (4472,'20100190797','LECHE GLORIA SOCIEDAD ANONIMA - GLORIA S.A.',NULL,'','',12,NULL,NULL,NULL,NULL,'2026-02-21 12:14:31',1),
 (4473,'10428690481','MAYTA SIERRA HECTOR ODON',NULL,'','',12,NULL,NULL,NULL,NULL,'2026-03-01 09:00:07',1);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;


--
-- Definition of table `resumen_diario`
--

DROP TABLE IF EXISTS `resumen_diario`;
CREATE TABLE `resumen_diario` (
  `id_resumen_diario` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `ticket` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad_items` int(4) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL COMMENT '1 para resumen\n2 para comunicacion de baja',
  PRIMARY KEY (`id_resumen_diario`),
  KEY `fk_resumen_diario_empresas1_idx` (`id_empresa`),
  CONSTRAINT `fk_resumen_diario_empresas1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `resumen_diario`
--

/*!40000 ALTER TABLE `resumen_diario` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumen_diario` ENABLE KEYS */;


--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`rol_id`,`nombre`) VALUES 
 (1,'ADMIN'),
 (2,'USUARIO');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `distrito` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `ubigeo` varchar(50) DEFAULT NULL,
  `cod_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `empresa_id` (`empresa_id`),
  CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sucursales`
--

/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;


--
-- Definition of table `tamsporte_persona`
--

DROP TABLE IF EXISTS `tamsporte_persona`;
CREATE TABLE `tamsporte_persona` (
  `tampo_id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(100) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tampo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tamsporte_persona`
--

/*!40000 ALTER TABLE `tamsporte_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `tamsporte_persona` ENABLE KEYS */;


--
-- Definition of table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago` (
  `tipo_pago_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tipo_pago_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_pago`
--

/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` (`tipo_pago_id`,`nombre`) VALUES 
 (1,'Contado'),
 (2,'Credito');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;


--
-- Definition of table `ubigeo_inei`
--

DROP TABLE IF EXISTS `ubigeo_inei`;
CREATE TABLE `ubigeo_inei` (
  `id_ubigeo` int(4) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(2) NOT NULL,
  `provincia` varchar(2) NOT NULL,
  `distrito` varchar(2) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ubigeo`)
) ENGINE=InnoDB AUTO_INCREMENT=2077 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ubigeo_inei`
--

/*!40000 ALTER TABLE `ubigeo_inei` DISABLE KEYS */;
INSERT INTO `ubigeo_inei` (`id_ubigeo`,`departamento`,`provincia`,`distrito`,`nombre`) VALUES 
 (1,'01','00','00','AMAZONAS'),
 (2,'01','01','00','CHACHAPOYAS'),
 (3,'01','01','01','CHACHAPOYAS'),
 (4,'01','01','02','ASUNCION'),
 (5,'01','01','03','BALSAS'),
 (6,'01','01','04','CHETO'),
 (7,'01','01','05','CHILIQUIN'),
 (8,'01','01','06','CHUQUIBAMBA'),
 (9,'01','01','07','GRANADA'),
 (10,'01','01','08','HUANCAS'),
 (11,'01','01','09','LA JALCA'),
 (12,'01','01','10','LEIMEBAMBA'),
 (13,'01','01','11','LEVANTO'),
 (14,'01','01','12','MAGDALENA'),
 (15,'01','01','13','MARISCAL CASTILLA'),
 (16,'01','01','14','MOLINOPAMPA'),
 (17,'01','01','15','MONTEVIDEO'),
 (18,'01','01','16','OLLEROS'),
 (19,'01','01','17','QUINJALCA'),
 (20,'01','01','18','SAN FRANCISCO DE DAGUAS'),
 (21,'01','01','19','SAN ISIDRO DE MAINO'),
 (22,'01','01','20','SOLOCO'),
 (23,'01','01','21','SONCHE'),
 (24,'01','02','00','BAGUA'),
 (25,'01','02','01','BAGUA'),
 (26,'01','02','02','ARAMANGO'),
 (27,'01','02','03','COPALLIN'),
 (28,'01','02','04','EL PARCO'),
 (29,'01','02','05','IMAZA'),
 (30,'01','02','06','LA PECA'),
 (31,'01','03','00','BONGARA'),
 (32,'01','03','01','JUMBILLA'),
 (33,'01','03','02','CHISQUILLA'),
 (34,'01','03','03','CHURUJA'),
 (35,'01','03','04','COROSHA'),
 (36,'01','03','05','CUISPES'),
 (37,'01','03','06','FLORIDA'),
 (38,'01','03','07','JAZÁN'),
 (39,'01','03','08','RECTA'),
 (40,'01','03','09','SAN CARLOS'),
 (41,'01','03','10','SHIPASBAMBA'),
 (42,'01','03','11','VALERA'),
 (43,'01','03','12','YAMBRASBAMBA'),
 (44,'01','04','00','CONDORCANQUI'),
 (45,'01','04','01','NIEVA'),
 (46,'01','04','02','EL CENEPA'),
 (47,'01','04','03','RIO SANTIAGO'),
 (48,'01','05','00','LUYA'),
 (49,'01','05','01','LAMUD'),
 (50,'01','05','02','CAMPORREDONDO'),
 (51,'01','05','03','COCABAMBA'),
 (52,'01','05','04','COLCAMAR'),
 (53,'01','05','05','CONILA'),
 (54,'01','05','06','INGUILPATA'),
 (55,'01','05','07','LONGUITA'),
 (56,'01','05','08','LONYA CHICO'),
 (57,'01','05','09','LUYA'),
 (58,'01','05','10','LUYA VIEJO'),
 (59,'01','05','11','MARIA'),
 (60,'01','05','12','OCALLI'),
 (61,'01','05','13','OCUMAL'),
 (62,'01','05','14','PISUQUIA'),
 (63,'01','05','15','PROVIDENCIA'),
 (64,'01','05','16','SAN CRISTOBAL'),
 (65,'01','05','17','SAN FRANCISCO DEL YESO'),
 (66,'01','05','18','SAN JERONIMO'),
 (67,'01','05','19','SAN JUAN DE LOPECANCHA'),
 (68,'01','05','20','SANTA CATALINA'),
 (69,'01','05','21','SANTO TOMAS'),
 (70,'01','05','22','TINGO'),
 (71,'01','05','23','TRITA'),
 (72,'01','06','00','RODRIGUEZ DE MENDOZA'),
 (73,'01','06','01','SAN NICOLAS'),
 (74,'01','06','02','CHIRIMOTO'),
 (75,'01','06','03','COCHAMAL'),
 (76,'01','06','04','HUAMBO'),
 (77,'01','06','05','LIMABAMBA'),
 (78,'01','06','06','LONGAR'),
 (79,'01','06','07','MARISCAL BENAVIDES'),
 (80,'01','06','08','MILPUC'),
 (81,'01','06','09','OMIA'),
 (82,'01','06','10','SANTA ROSA'),
 (83,'01','06','11','TOTORA'),
 (84,'01','06','12','VISTA ALEGRE'),
 (85,'01','07','00','UTCUBAMBA'),
 (86,'01','07','01','BAGUA GRANDE'),
 (87,'01','07','02','CAJARURO'),
 (88,'01','07','03','CUMBA'),
 (89,'01','07','04','EL MILAGRO'),
 (90,'01','07','05','JAMALCA'),
 (91,'01','07','06','LONYA GRANDE'),
 (92,'01','07','07','YAMON'),
 (93,'02','00','00','ANCASH'),
 (94,'02','01','00','HUARAZ'),
 (95,'02','01','01','HUARAZ'),
 (96,'02','01','02','COCHABAMBA'),
 (97,'02','01','03','COLCABAMBA'),
 (98,'02','01','04','HUANCHAY'),
 (99,'02','01','05','INDEPENDENCIA'),
 (100,'02','01','06','JANGAS'),
 (101,'02','01','07','LA LIBERTAD'),
 (102,'02','01','08','OLLEROS'),
 (103,'02','01','09','PAMPAS'),
 (104,'02','01','10','PARIACOTO'),
 (105,'02','01','11','PIRA'),
 (106,'02','01','12','TARICA'),
 (107,'02','02','00','AIJA'),
 (108,'02','02','01','AIJA'),
 (109,'02','02','02','CORIS'),
 (110,'02','02','03','HUACLLAN'),
 (111,'02','02','04','LA MERCED'),
 (112,'02','02','05','SUCCHA'),
 (113,'02','03','00','ANTONIO RAYMONDI'),
 (114,'02','03','01','LLAMELLIN'),
 (115,'02','03','02','ACZO'),
 (116,'02','03','03','CHACCHO'),
 (117,'02','03','04','CHINGAS'),
 (118,'02','03','05','MIRGAS'),
 (119,'02','03','06','SAN JUAN DE RONTOY'),
 (120,'02','04','00','ASUNCION'),
 (121,'02','04','01','CHACAS'),
 (122,'02','04','02','ACOCHACA'),
 (123,'02','05','00','BOLOGNESI'),
 (124,'02','05','01','CHIQUIAN'),
 (125,'02','05','02','ABELARDO PARDO LEZAMETA'),
 (126,'02','05','03','ANTONIO RAYMONDI'),
 (127,'02','05','04','AQUIA'),
 (128,'02','05','05','CAJACAY'),
 (129,'02','05','06','CANIS'),
 (130,'02','05','07','COLQUIOC'),
 (131,'02','05','08','HUALLANCA'),
 (132,'02','05','09','HUASTA'),
 (133,'02','05','10','HUAYLLACAYAN'),
 (134,'02','05','11','LA PRIMAVERA'),
 (135,'02','05','12','MANGAS'),
 (136,'02','05','13','PACLLON'),
 (137,'02','05','14','SAN MIGUEL DE CORPANQUI'),
 (138,'02','05','15','TICLLOS'),
 (139,'02','06','00','CARHUAZ'),
 (140,'02','06','01','CARHUAZ'),
 (141,'02','06','02','ACOPAMPA'),
 (142,'02','06','03','AMASHCA'),
 (143,'02','06','04','ANTA'),
 (144,'02','06','05','ATAQUERO'),
 (145,'02','06','06','MARCARA'),
 (146,'02','06','07','PARIAHUANCA'),
 (147,'02','06','08','SAN MIGUEL DE ACO'),
 (148,'02','06','09','SHILLA'),
 (149,'02','06','10','TINCO'),
 (150,'02','06','11','YUNGAR'),
 (151,'02','07','00','CARLOS FERMIN FITZCARRALD'),
 (152,'02','07','01','SAN LUIS'),
 (153,'02','07','02','SAN NICOLAS'),
 (154,'02','07','03','YAUYA'),
 (155,'02','08','00','CASMA'),
 (156,'02','08','01','CASMA'),
 (157,'02','08','02','BUENA VISTA ALTA'),
 (158,'02','08','03','COMANDANTE NOEL'),
 (159,'02','08','04','YAUTAN'),
 (160,'02','09','00','CORONGO'),
 (161,'02','09','01','CORONGO'),
 (162,'02','09','02','ACO'),
 (163,'02','09','03','BAMBAS'),
 (164,'02','09','04','CUSCA'),
 (165,'02','09','05','LA PAMPA'),
 (166,'02','09','06','YANAC'),
 (167,'02','09','07','YUPAN'),
 (168,'02','10','00','HUARI'),
 (169,'02','10','01','HUARI'),
 (170,'02','10','02','ANRA'),
 (171,'02','10','03','CAJAY'),
 (172,'02','10','04','CHAVIN DE HUANTAR'),
 (173,'02','10','05','HUACACHI'),
 (174,'02','10','06','HUACCHIS'),
 (175,'02','10','07','HUACHIS'),
 (176,'02','10','08','HUANTAR'),
 (177,'02','10','09','MASIN'),
 (178,'02','10','10','PAUCAS'),
 (179,'02','10','11','PONTO'),
 (180,'02','10','12','RAHUAPAMPA'),
 (181,'02','10','13','RAPAYAN'),
 (182,'02','10','14','SAN MARCOS'),
 (183,'02','10','15','SAN PEDRO DE CHANA'),
 (184,'02','10','16','UCO'),
 (185,'02','11','00','HUARMEY'),
 (186,'02','11','01','HUARMEY'),
 (187,'02','11','02','COCHAPETI'),
 (188,'02','11','03','CULEBRAS'),
 (189,'02','11','04','HUAYAN'),
 (190,'02','11','05','MALVAS'),
 (191,'02','12','00','HUAYLAS'),
 (192,'02','12','01','CARAZ'),
 (193,'02','12','02','HUALLANCA'),
 (194,'02','12','03','HUATA'),
 (195,'02','12','04','HUAYLAS'),
 (196,'02','12','05','MATO'),
 (197,'02','12','06','PAMPAROMAS'),
 (198,'02','12','07','PUEBLO LIBRE'),
 (199,'02','12','08','SANTA CRUZ'),
 (200,'02','12','09','SANTO TORIBIO'),
 (201,'02','12','10','YURACMARCA'),
 (202,'02','13','00','MARISCAL LUZURIAGA'),
 (203,'02','13','01','PISCOBAMBA'),
 (204,'02','13','02','CASCA'),
 (205,'02','13','03','ELEAZAR GUZMAN BARRON'),
 (206,'02','13','04','FIDEL OLIVAS ESCUDERO'),
 (207,'02','13','05','LLAMA'),
 (208,'02','13','06','LLUMPA'),
 (209,'02','13','07','LUCMA'),
 (210,'02','13','08','MUSGA'),
 (211,'02','14','00','OCROS'),
 (212,'02','14','01','OCROS'),
 (213,'02','14','02','ACAS'),
 (214,'02','14','03','CAJAMARQUILLA'),
 (215,'02','14','04','CARHUAPAMPA'),
 (216,'02','14','05','COCHAS'),
 (217,'02','14','06','CONGAS'),
 (218,'02','14','07','LLIPA'),
 (219,'02','14','08','SAN CRISTOBAL DE RAJAN'),
 (220,'02','14','09','SAN PEDRO'),
 (221,'02','14','10','SANTIAGO DE CHILCAS'),
 (222,'02','15','00','PALLASCA'),
 (223,'02','15','01','CABANA'),
 (224,'02','15','02','BOLOGNESI'),
 (225,'02','15','03','CONCHUCOS'),
 (226,'02','15','04','HUACASCHUQUE'),
 (227,'02','15','05','HUANDOVAL'),
 (228,'02','15','06','LACABAMBA'),
 (229,'02','15','07','LLAPO'),
 (230,'02','15','08','PALLASCA'),
 (231,'02','15','09','PAMPAS'),
 (232,'02','15','10','SANTA ROSA'),
 (233,'02','15','11','TAUCA'),
 (234,'02','16','00','POMABAMBA'),
 (235,'02','16','01','POMABAMBA'),
 (236,'02','16','02','HUAYLLAN'),
 (237,'02','16','03','PAROBAMBA'),
 (238,'02','16','04','QUINUABAMBA'),
 (239,'02','17','00','RECUAY'),
 (240,'02','17','01','RECUAY'),
 (241,'02','17','02','CATAC'),
 (242,'02','17','03','COTAPARACO'),
 (243,'02','17','04','HUAYLLAPAMPA'),
 (244,'02','17','05','LLACLLIN'),
 (245,'02','17','06','MARCA'),
 (246,'02','17','07','PAMPAS CHICO'),
 (247,'02','17','08','PARARIN'),
 (248,'02','17','09','TAPACOCHA'),
 (249,'02','17','10','TICAPAMPA'),
 (250,'02','18','00','SANTA'),
 (251,'02','18','01','CHIMBOTE'),
 (252,'02','18','02','CACERES DEL PERU'),
 (253,'02','18','03','COISHCO'),
 (254,'02','18','04','MACATE'),
 (255,'02','18','05','MORO'),
 (256,'02','18','06','NEPEÑA'),
 (257,'02','18','07','SAMANCO'),
 (258,'02','18','08','SANTA'),
 (259,'02','18','09','NUEVO CHIMBOTE'),
 (260,'02','19','00','SIHUAS'),
 (261,'02','19','01','SIHUAS'),
 (262,'02','19','02','ACOBAMBA'),
 (263,'02','19','03','ALFONSO UGARTE'),
 (264,'02','19','04','CASHAPAMPA'),
 (265,'02','19','05','CHINGALPO'),
 (266,'02','19','06','HUAYLLABAMBA'),
 (267,'02','19','07','QUICHES'),
 (268,'02','19','08','RAGASH'),
 (269,'02','19','09','SAN JUAN'),
 (270,'02','19','10','SICSIBAMBA'),
 (271,'02','20','00','YUNGAY'),
 (272,'02','20','01','YUNGAY'),
 (273,'02','20','02','CASCAPARA'),
 (274,'02','20','03','MANCOS'),
 (275,'02','20','04','MATACOTO'),
 (276,'02','20','05','QUILLO'),
 (277,'02','20','06','RANRAHIRCA'),
 (278,'02','20','07','SHUPLUY'),
 (279,'02','20','08','YANAMA'),
 (280,'03','00','00','APURIMAC'),
 (281,'03','01','00','ABANCAY'),
 (282,'03','01','01','ABANCAY'),
 (283,'03','01','02','CHACOCHE'),
 (284,'03','01','03','CIRCA'),
 (285,'03','01','04','CURAHUASI'),
 (286,'03','01','05','HUANIPACA'),
 (287,'03','01','06','LAMBRAMA'),
 (288,'03','01','07','PICHIRHUA'),
 (289,'03','01','08','SAN PEDRO DE CACHORA'),
 (290,'03','01','09','TAMBURCO'),
 (291,'03','02','00','ANDAHUAYLAS'),
 (292,'03','02','01','ANDAHUAYLAS'),
 (293,'03','02','02','ANDARAPA'),
 (294,'03','02','03','CHIARA'),
 (295,'03','02','04','HUANCARAMA'),
 (296,'03','02','05','HUANCARAY'),
 (297,'03','02','06','HUAYANA'),
 (298,'03','02','07','KISHUARA'),
 (299,'03','02','08','PACOBAMBA'),
 (300,'03','02','09','PACUCHA'),
 (301,'03','02','10','PAMPACHIRI'),
 (302,'03','02','11','POMACOCHA'),
 (303,'03','02','12','SAN ANTONIO DE CACHI'),
 (304,'03','02','13','SAN JERONIMO'),
 (305,'03','02','14','SAN MIGUEL DE CHACCRAMPA'),
 (306,'03','02','15','SANTA MARIA DE CHICMO'),
 (307,'03','02','16','TALAVERA'),
 (308,'03','02','17','TUMAY HUARACA'),
 (309,'03','02','18','TURPO'),
 (310,'03','02','19','KAQUIABAMBA'),
 (311,'03','03','00','ANTABAMBA'),
 (312,'03','03','01','ANTABAMBA'),
 (313,'03','03','02','EL ORO'),
 (314,'03','03','03','HUAQUIRCA'),
 (315,'03','03','04','JUAN ESPINOZA MEDRANO'),
 (316,'03','03','05','OROPESA'),
 (317,'03','03','06','PACHACONAS'),
 (318,'03','03','07','SABAINO'),
 (319,'03','04','00','AYMARAES'),
 (320,'03','04','01','CHALHUANCA'),
 (321,'03','04','02','CAPAYA'),
 (322,'03','04','03','CARAYBAMBA'),
 (323,'03','04','04','CHAPIMARCA'),
 (324,'03','04','05','COLCABAMBA'),
 (325,'03','04','06','COTARUSE'),
 (326,'03','04','07','HUAYLLO'),
 (327,'03','04','08','JUSTO APU SAHUARAURA'),
 (328,'03','04','09','LUCRE'),
 (329,'03','04','10','POCOHUANCA'),
 (330,'03','04','11','SAN JUAN DE CHACÑA'),
 (331,'03','04','12','SAÑAYCA'),
 (332,'03','04','13','SORAYA'),
 (333,'03','04','14','TAPAIRIHUA'),
 (334,'03','04','15','TINTAY'),
 (335,'03','04','16','TORAYA'),
 (336,'03','04','17','YANACA'),
 (337,'03','05','00','COTABAMBAS'),
 (338,'03','05','01','TAMBOBAMBA'),
 (339,'03','05','02','COTABAMBAS'),
 (340,'03','05','03','COYLLURQUI'),
 (341,'03','05','04','HAQUIRA'),
 (342,'03','05','05','MARA'),
 (343,'03','05','06','CHALLHUAHUACHO'),
 (344,'03','06','00','CHINCHEROS'),
 (345,'03','06','01','CHINCHEROS'),
 (346,'03','06','02','ANCO-HUALLO'),
 (347,'03','06','03','COCHARCAS'),
 (348,'03','06','04','HUACCANA'),
 (349,'03','06','05','OCOBAMBA'),
 (350,'03','06','06','ONGOY'),
 (351,'03','06','07','URANMARCA'),
 (352,'03','06','08','RANRACANCHA'),
 (353,'03','07','00','GRAU'),
 (354,'03','07','01','CHUQUIBAMBILLA'),
 (355,'03','07','02','CURPAHUASI'),
 (356,'03','07','03','GAMARRA'),
 (357,'03','07','04','HUAYLLATI'),
 (358,'03','07','05','MAMARA'),
 (359,'03','07','06','MICAELA BASTIDAS'),
 (360,'03','07','07','PATAYPAMPA'),
 (361,'03','07','08','PROGRESO'),
 (362,'03','07','09','SAN ANTONIO'),
 (363,'03','07','10','SANTA ROSA'),
 (364,'03','07','11','TURPAY'),
 (365,'03','07','12','VILCABAMBA'),
 (366,'03','07','13','VIRUNDO'),
 (367,'03','07','14','CURASCO'),
 (368,'04','00','00','AREQUIPA'),
 (369,'04','01','00','AREQUIPA'),
 (370,'04','01','01','AREQUIPA'),
 (371,'04','01','02','ALTO SELVA ALEGRE'),
 (372,'04','01','03','CAYMA'),
 (373,'04','01','04','CERRO COLORADO'),
 (374,'04','01','05','CHARACATO'),
 (375,'04','01','06','CHIGUATA'),
 (376,'04','01','07','JACOBO HUNTER'),
 (377,'04','01','08','LA JOYA'),
 (378,'04','01','09','MARIANO MELGAR'),
 (379,'04','01','10','MIRAFLORES'),
 (380,'04','01','11','MOLLEBAYA'),
 (381,'04','01','12','PAUCARPATA'),
 (382,'04','01','13','POCSI'),
 (383,'04','01','14','POLOBAYA'),
 (384,'04','01','15','QUEQUEÑA'),
 (385,'04','01','16','SABANDIA'),
 (386,'04','01','17','SACHACA'),
 (387,'04','01','18','SAN JUAN DE SIGUAS'),
 (388,'04','01','19','SAN JUAN DE TARUCANI'),
 (389,'04','01','20','SANTA ISABEL DE SIGUAS'),
 (390,'04','01','21','SANTA RITA DE SIGUAS'),
 (391,'04','01','22','SOCABAYA'),
 (392,'04','01','23','TIABAYA'),
 (393,'04','01','24','UCHUMAYO'),
 (394,'04','01','25','VITOR'),
 (395,'04','01','26','YANAHUARA'),
 (396,'04','01','27','YARABAMBA'),
 (397,'04','01','28','YURA'),
 (398,'04','01','29','JOSE LUIS BUSTAMANTE Y RIVERO'),
 (399,'04','02','00','CAMANA'),
 (400,'04','02','01','CAMANA'),
 (401,'04','02','02','JOSE MARIA QUIMPER'),
 (402,'04','02','03','MARIANO NICOLAS VALCARCEL'),
 (403,'04','02','04','MARISCAL CACERES'),
 (404,'04','02','05','NICOLAS DE PIEROLA'),
 (405,'04','02','06','OCOÑA'),
 (406,'04','02','07','QUILCA'),
 (407,'04','02','08','SAMUEL PASTOR'),
 (408,'04','03','00','CARAVELI'),
 (409,'04','03','01','CARAVELI'),
 (410,'04','03','02','ACARI'),
 (411,'04','03','03','ATICO'),
 (412,'04','03','04','ATIQUIPA'),
 (413,'04','03','05','BELLA UNION'),
 (414,'04','03','06','CAHUACHO'),
 (415,'04','03','07','CHALA'),
 (416,'04','03','08','CHAPARRA'),
 (417,'04','03','09','HUANUHUANU'),
 (418,'04','03','10','JAQUI'),
 (419,'04','03','11','LOMAS'),
 (420,'04','03','12','QUICACHA'),
 (421,'04','03','13','YAUCA'),
 (422,'04','04','00','CASTILLA'),
 (423,'04','04','01','APLAO'),
 (424,'04','04','02','ANDAGUA'),
 (425,'04','04','03','AYO'),
 (426,'04','04','04','CHACHAS'),
 (427,'04','04','05','CHILCAYMARCA'),
 (428,'04','04','06','CHOCO'),
 (429,'04','04','07','HUANCARQUI'),
 (430,'04','04','08','MACHAGUAY'),
 (431,'04','04','09','ORCOPAMPA'),
 (432,'04','04','10','PAMPACOLCA'),
 (433,'04','04','11','TIPAN'),
 (434,'04','04','12','UÑON'),
 (435,'04','04','13','URACA'),
 (436,'04','04','14','VIRACO'),
 (437,'04','05','00','CAYLLOMA'),
 (438,'04','05','01','CHIVAY'),
 (439,'04','05','02','ACHOMA'),
 (440,'04','05','03','CABANACONDE'),
 (441,'04','05','04','CALLALLI'),
 (442,'04','05','05','CAYLLOMA'),
 (443,'04','05','06','COPORAQUE'),
 (444,'04','05','07','HUAMBO'),
 (445,'04','05','08','HUANCA'),
 (446,'04','05','09','ICHUPAMPA'),
 (447,'04','05','10','LARI'),
 (448,'04','05','11','LLUTA'),
 (449,'04','05','12','MACA'),
 (450,'04','05','13','MADRIGAL'),
 (451,'04','05','14','SAN ANTONIO DE CHUCA'),
 (452,'04','05','15','SIBAYO'),
 (453,'04','05','16','TAPAY'),
 (454,'04','05','17','TISCO'),
 (455,'04','05','18','TUTI'),
 (456,'04','05','19','YANQUE'),
 (457,'04','05','20','MAJES'),
 (458,'04','06','00','CONDESUYOS'),
 (459,'04','06','01','CHUQUIBAMBA'),
 (460,'04','06','02','ANDARAY'),
 (461,'04','06','03','CAYARANI'),
 (462,'04','06','04','CHICHAS'),
 (463,'04','06','05','IRAY'),
 (464,'04','06','06','RIO GRANDE'),
 (465,'04','06','07','SALAMANCA'),
 (466,'04','06','08','YANAQUIHUA'),
 (467,'04','07','00','ISLAY'),
 (468,'04','07','01','MOLLENDO'),
 (469,'04','07','02','COCACHACRA'),
 (470,'04','07','03','DEAN VALDIVIA'),
 (471,'04','07','04','ISLAY'),
 (472,'04','07','05','MEJIA'),
 (473,'04','07','06','PUNTA DE BOMBON'),
 (474,'04','08','00','LA UNION'),
 (475,'04','08','01','COTAHUASI'),
 (476,'04','08','02','ALCA'),
 (477,'04','08','03','CHARCANA'),
 (478,'04','08','04','HUAYNACOTAS'),
 (479,'04','08','05','PAMPAMARCA'),
 (480,'04','08','06','PUYCA'),
 (481,'04','08','07','QUECHUALLA'),
 (482,'04','08','08','SAYLA'),
 (483,'04','08','09','TAURIA'),
 (484,'04','08','10','TOMEPAMPA'),
 (485,'04','08','11','TORO'),
 (486,'05','00','00','AYACUCHO'),
 (487,'05','01','00','HUAMANGA'),
 (488,'05','01','01','AYACUCHO'),
 (489,'05','01','02','ACOCRO'),
 (490,'05','01','03','ACOS VINCHOS'),
 (491,'05','01','04','CARMEN ALTO'),
 (492,'05','01','05','CHIARA'),
 (493,'05','01','06','OCROS'),
 (494,'05','01','07','PACAYCASA'),
 (495,'05','01','08','QUINUA'),
 (496,'05','01','09','SAN JOSE DE TICLLAS'),
 (497,'05','01','10','SAN JUAN BAUTISTA'),
 (498,'05','01','11','SANTIAGO DE PISCHA'),
 (499,'05','01','12','SOCOS'),
 (500,'05','01','13','TAMBILLO'),
 (501,'05','01','14','VINCHOS'),
 (502,'05','01','15','JESÚS NAZARENO'),
 (503,'05','01','16','ANDRÉS AVELINO CÁCERES DORREGAY'),
 (504,'05','02','00','CANGALLO'),
 (505,'05','02','01','CANGALLO'),
 (506,'05','02','02','CHUSCHI'),
 (507,'05','02','03','LOS MOROCHUCOS'),
 (508,'05','02','04','MARIA PARADO DE BELLIDO'),
 (509,'05','02','05','PARAS'),
 (510,'05','02','06','TOTOS'),
 (511,'05','03','00','HUANCA SANCOS'),
 (512,'05','03','01','SANCOS'),
 (513,'05','03','02','CARAPO'),
 (514,'05','03','03','SACSAMARCA'),
 (515,'05','03','04','SANTIAGO DE LUCANAMARCA'),
 (516,'05','04','00','HUANTA'),
 (517,'05','04','01','HUANTA'),
 (518,'05','04','02','AYAHUANCO'),
 (519,'05','04','03','HUAMANGUILLA'),
 (520,'05','04','04','IGUAIN'),
 (521,'05','04','05','LURICOCHA'),
 (522,'05','04','06','SANTILLANA'),
 (523,'05','04','07','SIVIA'),
 (524,'05','04','08','LLOCHEGUA'),
 (525,'05','04','09','CANAYRE'),
 (526,'05','04','10','UCHURACCAY'),
 (527,'05','04','11','PUCACOLPA'),
 (528,'05','05','00','LA MAR'),
 (529,'05','05','01','SAN MIGUEL'),
 (530,'05','05','02','ANCO'),
 (531,'05','05','03','AYNA'),
 (532,'05','05','04','CHILCAS'),
 (533,'05','05','05','CHUNGUI'),
 (534,'05','05','06','LUIS CARRANZA'),
 (535,'05','05','07','SANTA ROSA'),
 (536,'05','05','08','TAMBO'),
 (537,'05','05','09','SAMUGARI'),
 (538,'05','05','10','ANCHIHUAY'),
 (539,'05','06','00','LUCANAS'),
 (540,'05','06','01','PUQUIO'),
 (541,'05','06','02','AUCARA'),
 (542,'05','06','03','CABANA'),
 (543,'05','06','04','CARMEN SALCEDO'),
 (544,'05','06','05','CHAVIÑA'),
 (545,'05','06','06','CHIPAO'),
 (546,'05','06','07','HUAC-HUAS'),
 (547,'05','06','08','LARAMATE'),
 (548,'05','06','09','LEONCIO PRADO'),
 (549,'05','06','10','LLAUTA'),
 (550,'05','06','11','LUCANAS'),
 (551,'05','06','12','OCAÑA'),
 (552,'05','06','13','OTOCA'),
 (553,'05','06','14','SAISA'),
 (554,'05','06','15','SAN CRISTOBAL'),
 (555,'05','06','16','SAN JUAN'),
 (556,'05','06','17','SAN PEDRO'),
 (557,'05','06','18','SAN PEDRO DE PALCO'),
 (558,'05','06','19','SANCOS'),
 (559,'05','06','20','SANTA ANA DE HUAYCAHUACHO'),
 (560,'05','06','21','SANTA LUCIA'),
 (561,'05','07','00','PARINACOCHAS'),
 (562,'05','07','01','CORACORA'),
 (563,'05','07','02','CHUMPI'),
 (564,'05','07','03','CORONEL CASTAÑEDA'),
 (565,'05','07','04','PACAPAUSA'),
 (566,'05','07','05','PULLO'),
 (567,'05','07','06','PUYUSCA'),
 (568,'05','07','07','SAN FRANCISCO DE RAVACAYCO'),
 (569,'05','07','08','UPAHUACHO'),
 (570,'05','08','00','PAUCAR DEL SARA SARA'),
 (571,'05','08','01','PAUSA'),
 (572,'05','08','02','COLTA'),
 (573,'05','08','03','CORCULLA'),
 (574,'05','08','04','LAMPA'),
 (575,'05','08','05','MARCABAMBA'),
 (576,'05','08','06','OYOLO'),
 (577,'05','08','07','PARARCA'),
 (578,'05','08','08','SAN JAVIER DE ALPABAMBA'),
 (579,'05','08','09','SAN JOSE DE USHUA'),
 (580,'05','08','10','SARA SARA'),
 (581,'05','09','00','SUCRE'),
 (582,'05','09','01','QUEROBAMBA'),
 (583,'05','09','02','BELEN'),
 (584,'05','09','03','CHALCOS'),
 (585,'05','09','04','CHILCAYOC'),
 (586,'05','09','05','HUACAÑA'),
 (587,'05','09','06','MORCOLLA'),
 (588,'05','09','07','PAICO'),
 (589,'05','09','08','SAN PEDRO DE LARCAY'),
 (590,'05','09','09','SAN SALVADOR DE QUIJE'),
 (591,'05','09','10','SANTIAGO DE PAUCARAY'),
 (592,'05','09','11','SORAS'),
 (593,'05','10','00','VICTOR FAJARDO'),
 (594,'05','10','01','HUANCAPI'),
 (595,'05','10','02','ALCAMENCA'),
 (596,'05','10','03','APONGO'),
 (597,'05','10','04','ASQUIPATA'),
 (598,'05','10','05','CANARIA'),
 (599,'05','10','06','CAYARA'),
 (600,'05','10','07','COLCA'),
 (601,'05','10','08','HUAMANQUIQUIA'),
 (602,'05','10','09','HUANCARAYLLA'),
 (603,'05','10','10','HUAYA'),
 (604,'05','10','11','SARHUA'),
 (605,'05','10','12','VILCANCHOS'),
 (606,'05','11','00','VILCAS HUAMAN'),
 (607,'05','11','01','VILCAS HUAMAN'),
 (608,'05','11','02','ACCOMARCA'),
 (609,'05','11','03','CARHUANCA'),
 (610,'05','11','04','CONCEPCION'),
 (611,'05','11','05','HUAMBALPA'),
 (612,'05','11','06','INDEPENDENCIA'),
 (613,'05','11','07','SAURAMA'),
 (614,'05','11','08','VISCHONGO'),
 (615,'06','00','00','CAJAMARCA'),
 (616,'06','01','00','CAJAMARCA'),
 (617,'06','01','01','CAJAMARCA'),
 (618,'06','01','02','ASUNCION'),
 (619,'06','01','03','CHETILLA'),
 (620,'06','01','04','COSPAN'),
 (621,'06','01','05','ENCAÑADA'),
 (622,'06','01','06','JESUS'),
 (623,'06','01','07','LLACANORA'),
 (624,'06','01','08','LOS BAÑOS DEL INCA'),
 (625,'06','01','09','MAGDALENA'),
 (626,'06','01','10','MATARA'),
 (627,'06','01','11','NAMORA'),
 (628,'06','01','12','SAN JUAN'),
 (629,'06','02','00','CAJABAMBA'),
 (630,'06','02','01','CAJABAMBA'),
 (631,'06','02','02','CACHACHI'),
 (632,'06','02','03','CONDEBAMBA'),
 (633,'06','02','04','SITACOCHA'),
 (634,'06','03','00','CELENDIN'),
 (635,'06','03','01','CELENDIN'),
 (636,'06','03','02','CHUMUCH'),
 (637,'06','03','03','CORTEGANA'),
 (638,'06','03','04','HUASMIN'),
 (639,'06','03','05','JORGE CHAVEZ'),
 (640,'06','03','06','JOSE GALVEZ'),
 (641,'06','03','07','MIGUEL IGLESIAS'),
 (642,'06','03','08','OXAMARCA'),
 (643,'06','03','09','SOROCHUCO'),
 (644,'06','03','10','SUCRE'),
 (645,'06','03','11','UTCO'),
 (646,'06','03','12','LA LIBERTAD DE PALLAN'),
 (647,'06','04','00','CHOTA'),
 (648,'06','04','01','CHOTA'),
 (649,'06','04','02','ANGUIA'),
 (650,'06','04','03','CHADIN'),
 (651,'06','04','04','CHIGUIRIP'),
 (652,'06','04','05','CHIMBAN'),
 (653,'06','04','06','CHOROPAMPA'),
 (654,'06','04','07','COCHABAMBA'),
 (655,'06','04','08','CONCHAN'),
 (656,'06','04','09','HUAMBOS'),
 (657,'06','04','10','LAJAS'),
 (658,'06','04','11','LLAMA'),
 (659,'06','04','12','MIRACOSTA'),
 (660,'06','04','13','PACCHA'),
 (661,'06','04','14','PION'),
 (662,'06','04','15','QUEROCOTO'),
 (663,'06','04','16','SAN JUAN DE LICUPIS'),
 (664,'06','04','17','TACABAMBA'),
 (665,'06','04','18','TOCMOCHE'),
 (666,'06','04','19','CHALAMARCA'),
 (667,'06','05','00','CONTUMAZA'),
 (668,'06','05','01','CONTUMAZA'),
 (669,'06','05','02','CHILETE'),
 (670,'06','05','03','CUPISNIQUE'),
 (671,'06','05','04','GUZMANGO'),
 (672,'06','05','05','SAN BENITO'),
 (673,'06','05','06','SANTA CRUZ DE TOLED'),
 (674,'06','05','07','TANTARICA'),
 (675,'06','05','08','YONAN'),
 (676,'06','06','00','CUTERVO'),
 (677,'06','06','01','CUTERVO'),
 (678,'06','06','02','CALLAYUC'),
 (679,'06','06','03','CHOROS'),
 (680,'06','06','04','CUJILLO'),
 (681,'06','06','05','LA RAMADA'),
 (682,'06','06','06','PIMPINGOS'),
 (683,'06','06','07','QUEROCOTILLO'),
 (684,'06','06','08','SAN ANDRES DE CUTERVO'),
 (685,'06','06','09','SAN JUAN DE CUTERVO'),
 (686,'06','06','10','SAN LUIS DE LUCMA'),
 (687,'06','06','11','SANTA CRUZ'),
 (688,'06','06','12','SANTO DOMINGO DE LA CAPILLA'),
 (689,'06','06','13','SANTO TOMAS'),
 (690,'06','06','14','SOCOTA'),
 (691,'06','06','15','TORIBIO CASANOVA'),
 (692,'06','07','00','HUALGAYOC'),
 (693,'06','07','01','BAMBAMARCA'),
 (694,'06','07','02','CHUGUR'),
 (695,'06','07','03','HUALGAYOC'),
 (696,'06','08','00','JAEN'),
 (697,'06','08','01','JAEN'),
 (698,'06','08','02','BELLAVISTA'),
 (699,'06','08','03','CHONTALI'),
 (700,'06','08','04','COLASAY'),
 (701,'06','08','05','HUABAL'),
 (702,'06','08','06','LAS PIRIAS'),
 (703,'06','08','07','POMAHUACA'),
 (704,'06','08','08','PUCARA'),
 (705,'06','08','09','SALLIQUE'),
 (706,'06','08','10','SAN FELIPE'),
 (707,'06','08','11','SAN JOSE DEL ALTO'),
 (708,'06','08','12','SANTA ROSA'),
 (709,'06','09','00','SAN IGNACIO'),
 (710,'06','09','01','SAN IGNACIO'),
 (711,'06','09','02','CHIRINOS'),
 (712,'06','09','03','HUARANGO'),
 (713,'06','09','04','LA COIPA'),
 (714,'06','09','05','NAMBALLE'),
 (715,'06','09','06','SAN JOSE DE LOURDES'),
 (716,'06','09','07','TABACONAS'),
 (717,'06','10','00','SAN MARCOS'),
 (718,'06','10','01','PEDRO GALVEZ'),
 (719,'06','10','02','CHANCAY'),
 (720,'06','10','03','EDUARDO VILLANUEVA'),
 (721,'06','10','04','GREGORIO PITA'),
 (722,'06','10','05','ICHOCAN'),
 (723,'06','10','06','JOSE MANUEL QUIROZ'),
 (724,'06','10','07','JOSE SABOGAL'),
 (725,'06','11','00','SAN MIGUEL'),
 (726,'06','11','01','SAN MIGUEL'),
 (727,'06','11','02','BOLIVAR'),
 (728,'06','11','03','CALQUIS'),
 (729,'06','11','04','CATILLUC'),
 (730,'06','11','05','EL PRADO'),
 (731,'06','11','06','LA FLORIDA'),
 (732,'06','11','07','LLAPA'),
 (733,'06','11','08','NANCHOC'),
 (734,'06','11','09','NIEPOS'),
 (735,'06','11','10','SAN GREGORIO'),
 (736,'06','11','11','SAN SILVESTRE DE COCHAN'),
 (737,'06','11','12','TONGOD'),
 (738,'06','11','13','UNION AGUA BLANCA'),
 (739,'06','12','00','SAN PABLO'),
 (740,'06','12','01','SAN PABLO'),
 (741,'06','12','02','SAN BERNARDINO'),
 (742,'06','12','03','SAN LUIS'),
 (743,'06','12','04','TUMBADEN'),
 (744,'06','13','00','SANTA CRUZ'),
 (745,'06','13','01','SANTA CRUZ'),
 (746,'06','13','02','ANDABAMBA'),
 (747,'06','13','03','CATACHE'),
 (748,'06','13','04','CHANCAYBAÑOS'),
 (749,'06','13','05','LA ESPERANZA'),
 (750,'06','13','06','NINABAMBA'),
 (751,'06','13','07','PULAN'),
 (752,'06','13','08','SAUCEPAMPA'),
 (753,'06','13','09','SEXI'),
 (754,'06','13','10','UTICYACU'),
 (755,'06','13','11','YAUYUCAN'),
 (756,'07','00','00','CALLAO'),
 (757,'07','01','00','PROV. CONST. DEL CALLAO'),
 (758,'07','01','01','CALLAO'),
 (759,'07','01','02','BELLAVISTA'),
 (760,'07','01','03','CARMEN DE LA LEGUA REYNOSO'),
 (761,'07','01','04','LA PERLA'),
 (762,'07','01','05','LA PUNTA'),
 (763,'07','01','06','VENTANILLA'),
 (764,'07','01','07','MI PERÚ'),
 (765,'08','00','00','CUSCO'),
 (766,'08','01','00','CUSCO'),
 (767,'08','01','01','CUSCO'),
 (768,'08','01','02','CCORCA'),
 (769,'08','01','03','POROY'),
 (770,'08','01','04','SAN JERONIMO'),
 (771,'08','01','05','SAN SEBASTIAN'),
 (772,'08','01','06','SANTIAGO'),
 (773,'08','01','07','SAYLLA'),
 (774,'08','01','08','WANCHAQ'),
 (775,'08','02','00','ACOMAYO'),
 (776,'08','02','01','ACOMAYO'),
 (777,'08','02','02','ACOPIA'),
 (778,'08','02','03','ACOS'),
 (779,'08','02','04','MOSOC LLACTA'),
 (780,'08','02','05','POMACANCHI'),
 (781,'08','02','06','RONDOCAN'),
 (782,'08','02','07','SANGARARA'),
 (783,'08','03','00','ANTA'),
 (784,'08','03','01','ANTA'),
 (785,'08','03','02','ANCAHUASI'),
 (786,'08','03','03','CACHIMAYO'),
 (787,'08','03','04','CHINCHAYPUJIO'),
 (788,'08','03','05','HUAROCONDO'),
 (789,'08','03','06','LIMATAMBO'),
 (790,'08','03','07','MOLLEPATA'),
 (791,'08','03','08','PUCYURA'),
 (792,'08','03','09','ZURITE'),
 (793,'08','04','00','CALCA'),
 (794,'08','04','01','CALCA'),
 (795,'08','04','02','COYA'),
 (796,'08','04','03','LAMAY'),
 (797,'08','04','04','LARES'),
 (798,'08','04','05','PISAC'),
 (799,'08','04','06','SAN SALVADOR'),
 (800,'08','04','07','TARAY'),
 (801,'08','04','08','YANATILE'),
 (802,'08','05','00','CANAS'),
 (803,'08','05','01','YANAOCA'),
 (804,'08','05','02','CHECCA'),
 (805,'08','05','03','KUNTURKANKI'),
 (806,'08','05','04','LANGUI'),
 (807,'08','05','05','LAYO'),
 (808,'08','05','06','PAMPAMARCA'),
 (809,'08','05','07','QUEHUE'),
 (810,'08','05','08','TUPAC AMARU'),
 (811,'08','06','00','CANCHIS'),
 (812,'08','06','01','SICUANI'),
 (813,'08','06','02','CHECACUPE'),
 (814,'08','06','03','COMBAPATA'),
 (815,'08','06','04','MARANGANI'),
 (816,'08','06','05','PITUMARCA'),
 (817,'08','06','06','SAN PABLO'),
 (818,'08','06','07','SAN PEDRO'),
 (819,'08','06','08','TINTA'),
 (820,'08','07','00','CHUMBIVILCAS'),
 (821,'08','07','01','SANTO TOMAS'),
 (822,'08','07','02','CAPACMARCA'),
 (823,'08','07','03','CHAMACA'),
 (824,'08','07','04','COLQUEMARCA'),
 (825,'08','07','05','LIVITACA'),
 (826,'08','07','06','LLUSCO'),
 (827,'08','07','07','QUIÑOTA'),
 (828,'08','07','08','VELILLE'),
 (829,'08','08','00','ESPINAR'),
 (830,'08','08','01','ESPINAR'),
 (831,'08','08','02','CONDOROMA'),
 (832,'08','08','03','COPORAQUE'),
 (833,'08','08','04','OCORURO'),
 (834,'08','08','05','PALLPATA'),
 (835,'08','08','06','PICHIGUA'),
 (836,'08','08','07','SUYCKUTAMBO'),
 (837,'08','08','08','ALTO PICHIGUA'),
 (838,'08','09','00','LA CONVENCION'),
 (839,'08','09','01','SANTA ANA'),
 (840,'08','09','02','ECHARATE'),
 (841,'08','09','03','HUAYOPATA'),
 (842,'08','09','04','MARANURA'),
 (843,'08','09','05','OCOBAMBA'),
 (844,'08','09','06','QUELLOUNO'),
 (845,'08','09','07','KIMBIRI'),
 (846,'08','09','08','SANTA TERESA'),
 (847,'08','09','09','VILCABAMBA'),
 (848,'08','09','10','PICHARI'),
 (849,'08','09','11','INKAWASI'),
 (850,'08','09','12','VILLA VIRGEN'),
 (851,'08','10','00','PARURO'),
 (852,'08','10','01','PARURO'),
 (853,'08','10','02','ACCHA'),
 (854,'08','10','03','CCAPI'),
 (855,'08','10','04','COLCHA'),
 (856,'08','10','05','HUANOQUITE'),
 (857,'08','10','06','OMACHA'),
 (858,'08','10','07','PACCARITAMBO'),
 (859,'08','10','08','PILLPINTO'),
 (860,'08','10','09','YAURISQUE'),
 (861,'08','11','00','PAUCARTAMBO'),
 (862,'08','11','01','PAUCARTAMBO'),
 (863,'08','11','02','CAICAY'),
 (864,'08','11','03','CHALLABAMBA'),
 (865,'08','11','04','COLQUEPATA'),
 (866,'08','11','05','HUANCARANI'),
 (867,'08','11','06','KOSÑIPATA'),
 (868,'08','12','00','QUISPICANCHI'),
 (869,'08','12','01','URCOS'),
 (870,'08','12','02','ANDAHUAYLILLAS'),
 (871,'08','12','03','CAMANTI'),
 (872,'08','12','04','CCARHUAYO'),
 (873,'08','12','05','CCATCA'),
 (874,'08','12','06','CUSIPATA'),
 (875,'08','12','07','HUARO'),
 (876,'08','12','08','LUCRE'),
 (877,'08','12','09','MARCAPATA'),
 (878,'08','12','10','OCONGATE'),
 (879,'08','12','11','OROPESA'),
 (880,'08','12','12','QUIQUIJANA'),
 (881,'08','13','00','URUBAMBA'),
 (882,'08','13','01','URUBAMBA'),
 (883,'08','13','02','CHINCHERO'),
 (884,'08','13','03','HUAYLLABAMBA'),
 (885,'08','13','04','MACHUPICCHU'),
 (886,'08','13','05','MARAS'),
 (887,'08','13','06','OLLANTAYTAMBO'),
 (888,'08','13','07','YUCAY'),
 (889,'09','00','00','HUANCAVELICA'),
 (890,'09','01','00','HUANCAVELICA'),
 (891,'09','01','01','HUANCAVELICA'),
 (892,'09','01','02','ACOBAMBILLA'),
 (893,'09','01','03','ACORIA'),
 (894,'09','01','04','CONAYCA'),
 (895,'09','01','05','CUENCA'),
 (896,'09','01','06','HUACHOCOLPA'),
 (897,'09','01','07','HUAYLLAHUARA'),
 (898,'09','01','08','IZCUCHACA'),
 (899,'09','01','09','LARIA'),
 (900,'09','01','10','MANTA'),
 (901,'09','01','11','MARISCAL CACERES'),
 (902,'09','01','12','MOYA'),
 (903,'09','01','13','NUEVO OCCORO'),
 (904,'09','01','14','PALCA'),
 (905,'09','01','15','PILCHACA'),
 (906,'09','01','16','VILCA'),
 (907,'09','01','17','YAULI'),
 (908,'09','01','18','ASCENSIÓN'),
 (909,'09','01','19','HUANDO'),
 (910,'09','02','00','ACOBAMBA'),
 (911,'09','02','01','ACOBAMBA'),
 (912,'09','02','02','ANDABAMBA'),
 (913,'09','02','03','ANTA'),
 (914,'09','02','04','CAJA'),
 (915,'09','02','05','MARCAS'),
 (916,'09','02','06','PAUCARA'),
 (917,'09','02','07','POMACOCHA'),
 (918,'09','02','08','ROSARIO'),
 (919,'09','03','00','ANGARAES'),
 (920,'09','03','01','LIRCAY'),
 (921,'09','03','02','ANCHONGA'),
 (922,'09','03','03','CALLANMARCA'),
 (923,'09','03','04','CCOCHACCASA'),
 (924,'09','03','05','CHINCHO'),
 (925,'09','03','06','CONGALLA'),
 (926,'09','03','07','HUANCA-HUANCA'),
 (927,'09','03','08','HUAYLLAY GRANDE'),
 (928,'09','03','09','JULCAMARCA'),
 (929,'09','03','10','SAN ANTONIO DE ANTAPARCO'),
 (930,'09','03','11','SANTO TOMAS DE PATA'),
 (931,'09','03','12','SECCLLA'),
 (932,'09','04','00','CASTROVIRREYNA'),
 (933,'09','04','01','CASTROVIRREYNA'),
 (934,'09','04','02','ARMA'),
 (935,'09','04','03','AURAHUA'),
 (936,'09','04','04','CAPILLAS'),
 (937,'09','04','05','CHUPAMARCA'),
 (938,'09','04','06','COCAS'),
 (939,'09','04','07','HUACHOS'),
 (940,'09','04','08','HUAMATAMBO'),
 (941,'09','04','09','MOLLEPAMPA'),
 (942,'09','04','10','SAN JUAN'),
 (943,'09','04','11','SANTA ANA'),
 (944,'09','04','12','TANTARA'),
 (945,'09','04','13','TICRAPO'),
 (946,'09','05','00','CHURCAMPA'),
 (947,'09','05','01','CHURCAMPA'),
 (948,'09','05','02','ANCO'),
 (949,'09','05','03','CHINCHIHUASI'),
 (950,'09','05','04','EL CARMEN'),
 (951,'09','05','05','LA MERCED'),
 (952,'09','05','06','LOCROJA'),
 (953,'09','05','07','PAUCARBAMBA'),
 (954,'09','05','08','SAN MIGUEL DE MAYOCC'),
 (955,'09','05','09','SAN PEDRO DE CORIS'),
 (956,'09','05','10','PACHAMARCA'),
 (957,'09','05','11','COSME'),
 (958,'09','06','00','HUAYTARA'),
 (959,'09','06','01','HUAYTARA'),
 (960,'09','06','02','AYAVI'),
 (961,'09','06','03','CORDOVA'),
 (962,'09','06','04','HUAYACUNDO ARMA'),
 (963,'09','06','05','LARAMARCA'),
 (964,'09','06','06','OCOYO'),
 (965,'09','06','07','PILPICHACA'),
 (966,'09','06','08','QUERCO'),
 (967,'09','06','09','QUITO-ARMA'),
 (968,'09','06','10','SAN ANTONIO DE CUSICANCHA'),
 (969,'09','06','11','SAN FRANCISCO DE SANGAYAICO'),
 (970,'09','06','12','SAN ISIDRO'),
 (971,'09','06','13','SANTIAGO DE CHOCORVOS'),
 (972,'09','06','14','SANTIAGO DE QUIRAHUARA'),
 (973,'09','06','15','SANTO DOMINGO DE CAPILLAS'),
 (974,'09','06','16','TAMBO'),
 (975,'09','07','00','TAYACAJA'),
 (976,'09','07','01','PAMPAS'),
 (977,'09','07','02','ACOSTAMBO'),
 (978,'09','07','03','ACRAQUIA'),
 (979,'09','07','04','AHUAYCHA'),
 (980,'09','07','05','COLCABAMBA'),
 (981,'09','07','06','DANIEL HERNANDEZ'),
 (982,'09','07','07','HUACHOCOLPA'),
 (983,'09','07','09','HUARIBAMBA'),
 (984,'09','07','10','ÑAHUIMPUQUIO'),
 (985,'09','07','11','PAZOS'),
 (986,'09','07','13','QUISHUAR'),
 (987,'09','07','14','SALCABAMBA'),
 (988,'09','07','15','SALCAHUASI'),
 (989,'09','07','16','SAN MARCOS DE ROCCHAC'),
 (990,'09','07','17','SURCUBAMBA'),
 (991,'09','07','18','TINTAY PUNCU'),
 (992,'10','00','00','HUANUCO'),
 (993,'10','01','00','HUANUCO'),
 (994,'10','01','01','HUANUCO'),
 (995,'10','01','02','AMARILIS'),
 (996,'10','01','03','CHINCHAO'),
 (997,'10','01','04','CHURUBAMBA'),
 (998,'10','01','05','MARGOS'),
 (999,'10','01','06','QUISQUI'),
 (1000,'10','01','07','SAN FRANCISCO DE CAYRAN'),
 (1001,'10','01','08','SAN PEDRO DE CHAULAN'),
 (1002,'10','01','09','SANTA MARIA DEL VALLE'),
 (1003,'10','01','10','YARUMAYO'),
 (1004,'10','01','11','PILLCO MARCA'),
 (1005,'10','01','12','YACUS'),
 (1006,'10','02','00','AMBO'),
 (1007,'10','02','01','AMBO'),
 (1008,'10','02','02','CAYNA'),
 (1009,'10','02','03','COLPAS'),
 (1010,'10','02','04','CONCHAMARCA'),
 (1011,'10','02','05','HUACAR'),
 (1012,'10','02','06','SAN FRANCISCO'),
 (1013,'10','02','07','SAN RAFAEL'),
 (1014,'10','02','08','TOMAY KICHWA'),
 (1015,'10','03','00','DOS DE MAYO'),
 (1016,'10','03','01','LA UNION'),
 (1017,'10','03','07','CHUQUIS'),
 (1018,'10','03','11','MARIAS'),
 (1019,'10','03','13','PACHAS'),
 (1020,'10','03','16','QUIVILLA'),
 (1021,'10','03','17','RIPAN'),
 (1022,'10','03','21','SHUNQUI'),
 (1023,'10','03','22','SILLAPATA'),
 (1024,'10','03','23','YANAS'),
 (1025,'10','04','00','HUACAYBAMBA'),
 (1026,'10','04','01','HUACAYBAMBA'),
 (1027,'10','04','02','CANCHABAMBA'),
 (1028,'10','04','03','COCHABAMBA'),
 (1029,'10','04','04','PINRA'),
 (1030,'10','05','00','HUAMALIES'),
 (1031,'10','05','01','LLATA'),
 (1032,'10','05','02','ARANCAY'),
 (1033,'10','05','03','CHAVIN DE PARIARCA'),
 (1034,'10','05','04','JACAS GRANDE'),
 (1035,'10','05','05','JIRCAN'),
 (1036,'10','05','06','MIRAFLORES'),
 (1037,'10','05','07','MONZON'),
 (1038,'10','05','08','PUNCHAO'),
 (1039,'10','05','09','PUÑOS'),
 (1040,'10','05','10','SINGA'),
 (1041,'10','05','11','TANTAMAYO'),
 (1042,'10','06','00','LEONCIO PRADO'),
 (1043,'10','06','01','RUPA-RUPA'),
 (1044,'10','06','02','DANIEL ALOMIAS ROBLES'),
 (1045,'10','06','03','HERMILIO VALDIZAN'),
 (1046,'10','06','04','JOSE CRESPO Y CASTILLO'),
 (1047,'10','06','05','LUYANDO'),
 (1048,'10','06','06','MARIANO DAMASO BERAUN'),
 (1049,'10','07','00','MARAÑON'),
 (1050,'10','07','01','HUACRACHUCO'),
 (1051,'10','07','02','CHOLON'),
 (1052,'10','07','03','SAN BUENAVENTURA'),
 (1053,'10','08','00','PACHITEA'),
 (1054,'10','08','01','PANAO'),
 (1055,'10','08','02','CHAGLLA'),
 (1056,'10','08','03','MOLINO'),
 (1057,'10','08','04','UMARI'),
 (1058,'10','09','00','PUERTO INCA'),
 (1059,'10','09','01','PUERTO INCA'),
 (1060,'10','09','02','CODO DEL POZUZO'),
 (1061,'10','09','03','HONORIA'),
 (1062,'10','09','04','TOURNAVISTA'),
 (1063,'10','09','05','YUYAPICHIS'),
 (1064,'10','10','00','LAURICOCHA'),
 (1065,'10','10','01','JESUS'),
 (1066,'10','10','02','BAÑOS'),
 (1067,'10','10','03','JIVIA'),
 (1068,'10','10','04','QUEROPALCA'),
 (1069,'10','10','05','RONDOS'),
 (1070,'10','10','06','SAN FRANCISCO DE ASIS'),
 (1071,'10','10','07','SAN MIGUEL DE CAURI'),
 (1072,'10','11','00','YAROWILCA'),
 (1073,'10','11','01','CHAVINILLO'),
 (1074,'10','11','02','CAHUAC'),
 (1075,'10','11','03','CHACABAMBA'),
 (1076,'10','11','04','CHUPAN'),
 (1077,'10','11','05','JACAS CHICO'),
 (1078,'10','11','06','OBAS'),
 (1079,'10','11','07','PAMPAMARCA'),
 (1080,'10','11','08','CHORAS'),
 (1081,'11','00','00','ICA'),
 (1082,'11','01','00','ICA'),
 (1083,'11','01','01','ICA'),
 (1084,'11','01','02','LA TINGUIÑA'),
 (1085,'11','01','03','LOS AQUIJES'),
 (1086,'11','01','04','OCUCAJE'),
 (1087,'11','01','05','PACHACUTEC'),
 (1088,'11','01','06','PARCONA'),
 (1089,'11','01','07','PUEBLO NUEVO'),
 (1090,'11','01','08','SALAS'),
 (1091,'11','01','09','SAN JOSE DE LOS MOLINOS'),
 (1092,'11','01','10','SAN JUAN BAUTISTA'),
 (1093,'11','01','11','SANTIAGO'),
 (1094,'11','01','12','SUBTANJALLA'),
 (1095,'11','01','13','TATE'),
 (1096,'11','01','14','YAUCA DEL ROSARIO'),
 (1097,'11','02','00','CHINCHA'),
 (1098,'11','02','01','CHINCHA ALTA'),
 (1099,'11','02','02','ALTO LARAN'),
 (1100,'11','02','03','CHAVIN'),
 (1101,'11','02','04','CHINCHA BAJA'),
 (1102,'11','02','05','EL CARMEN'),
 (1103,'11','02','06','GROCIO PRADO'),
 (1104,'11','02','07','PUEBLO NUEVO'),
 (1105,'11','02','08','SAN JUAN DE YANAC'),
 (1106,'11','02','09','SAN PEDRO DE HUACARPANA'),
 (1107,'11','02','10','SUNAMPE'),
 (1108,'11','02','11','TAMBO DE MORA'),
 (1109,'11','03','00','NAZCA'),
 (1110,'11','03','01','NAZCA'),
 (1111,'11','03','02','CHANGUILLO'),
 (1112,'11','03','03','EL INGENIO'),
 (1113,'11','03','04','MARCONA'),
 (1114,'11','03','05','VISTA ALEGRE'),
 (1115,'11','04','00','PALPA'),
 (1116,'11','04','01','PALPA'),
 (1117,'11','04','02','LLIPATA'),
 (1118,'11','04','03','RIO GRANDE'),
 (1119,'11','04','04','SANTA CRUZ'),
 (1120,'11','04','05','TIBILLO'),
 (1121,'11','05','00','PISCO'),
 (1122,'11','05','01','PISCO'),
 (1123,'11','05','02','HUANCANO'),
 (1124,'11','05','03','HUMAY'),
 (1125,'11','05','04','INDEPENDENCIA'),
 (1126,'11','05','05','PARACAS'),
 (1127,'11','05','06','SAN ANDRES'),
 (1128,'11','05','07','SAN CLEMENTE'),
 (1129,'11','05','08','TUPAC AMARU INCA'),
 (1130,'12','00','00','JUNIN'),
 (1131,'12','01','00','HUANCAYO'),
 (1132,'12','01','01','HUANCAYO'),
 (1133,'12','01','04','CARHUACALLANGA'),
 (1134,'12','01','05','CHACAPAMPA'),
 (1135,'12','01','06','CHICCHE'),
 (1136,'12','01','07','CHILCA'),
 (1137,'12','01','08','CHONGOS ALTO'),
 (1138,'12','01','11','CHUPURO'),
 (1139,'12','01','12','COLCA'),
 (1140,'12','01','13','CULLHUAS'),
 (1141,'12','01','14','EL TAMBO'),
 (1142,'12','01','16','HUACRAPUQUIO'),
 (1143,'12','01','17','HUALHUAS'),
 (1144,'12','01','19','HUANCAN'),
 (1145,'12','01','20','HUASICANCHA'),
 (1146,'12','01','21','HUAYUCACHI'),
 (1147,'12','01','22','INGENIO'),
 (1148,'12','01','24','PARIAHUANCA'),
 (1149,'12','01','25','PILCOMAYO'),
 (1150,'12','01','26','PUCARA'),
 (1151,'12','01','27','QUICHUAY'),
 (1152,'12','01','28','QUILCAS'),
 (1153,'12','01','29','SAN AGUSTIN'),
 (1154,'12','01','30','SAN JERONIMO DE TUNAN'),
 (1155,'12','01','32','SAÑO'),
 (1156,'12','01','33','SAPALLANGA'),
 (1157,'12','01','34','SICAYA'),
 (1158,'12','01','35','SANTO DOMINGO DE ACOBAMBA'),
 (1159,'12','01','36','VIQUES'),
 (1160,'12','02','00','CONCEPCION'),
 (1161,'12','02','01','CONCEPCION'),
 (1162,'12','02','02','ACO'),
 (1163,'12','02','03','ANDAMARCA'),
 (1164,'12','02','04','CHAMBARA'),
 (1165,'12','02','05','COCHAS'),
 (1166,'12','02','06','COMAS'),
 (1167,'12','02','07','HEROINAS TOLEDO'),
 (1168,'12','02','08','MANZANARES'),
 (1169,'12','02','09','MARISCAL CASTILLA'),
 (1170,'12','02','10','MATAHUASI'),
 (1171,'12','02','11','MITO'),
 (1172,'12','02','12','NUEVE DE JULIO'),
 (1173,'12','02','13','ORCOTUNA'),
 (1174,'12','02','14','SAN JOSE DE QUERO'),
 (1175,'12','02','15','SANTA ROSA DE OCOPA'),
 (1176,'12','03','00','CHANCHAMAYO'),
 (1177,'12','03','01','CHANCHAMAYO'),
 (1178,'12','03','02','PERENE'),
 (1179,'12','03','03','PICHANAQUI'),
 (1180,'12','03','04','SAN LUIS DE SHUARO'),
 (1181,'12','03','05','SAN RAMON'),
 (1182,'12','03','06','VITOC'),
 (1183,'12','04','00','JAUJA'),
 (1184,'12','04','01','JAUJA'),
 (1185,'12','04','02','ACOLLA'),
 (1186,'12','04','03','APATA'),
 (1187,'12','04','04','ATAURA'),
 (1188,'12','04','05','CANCHAYLLO'),
 (1189,'12','04','06','CURICACA'),
 (1190,'12','04','07','EL MANTARO'),
 (1191,'12','04','08','HUAMALI'),
 (1192,'12','04','09','HUARIPAMPA'),
 (1193,'12','04','10','HUERTAS'),
 (1194,'12','04','11','JANJAILLO'),
 (1195,'12','04','12','JULCAN'),
 (1196,'12','04','13','LEONOR ORDOÑEZ'),
 (1197,'12','04','14','LLOCLLAPAMPA'),
 (1198,'12','04','15','MARCO'),
 (1199,'12','04','16','MASMA'),
 (1200,'12','04','17','MASMA CHICCHE'),
 (1201,'12','04','18','MOLINOS'),
 (1202,'12','04','19','MONOBAMBA'),
 (1203,'12','04','20','MUQUI'),
 (1204,'12','04','21','MUQUIYAUYO'),
 (1205,'12','04','22','PACA'),
 (1206,'12','04','23','PACCHA'),
 (1207,'12','04','24','PANCAN'),
 (1208,'12','04','25','PARCO'),
 (1209,'12','04','26','POMACANCHA'),
 (1210,'12','04','27','RICRAN'),
 (1211,'12','04','28','SAN LORENZO'),
 (1212,'12','04','29','SAN PEDRO DE CHUNAN'),
 (1213,'12','04','30','SAUSA'),
 (1214,'12','04','31','SINCOS'),
 (1215,'12','04','32','TUNAN MARCA'),
 (1216,'12','04','33','YAULI'),
 (1217,'12','04','34','YAUYOS'),
 (1218,'12','05','00','JUNIN'),
 (1219,'12','05','01','JUNIN'),
 (1220,'12','05','02','CARHUAMAYO'),
 (1221,'12','05','03','ONDORES'),
 (1222,'12','05','04','ULCUMAYO'),
 (1223,'12','06','00','SATIPO'),
 (1224,'12','06','01','SATIPO'),
 (1225,'12','06','02','COVIRIALI'),
 (1226,'12','06','03','LLAYLLA'),
 (1227,'12','06','04','MAZAMARI'),
 (1228,'12','06','05','PAMPA HERMOSA'),
 (1229,'12','06','06','PANGOA'),
 (1230,'12','06','07','RIO NEGRO'),
 (1231,'12','06','08','RIO TAMBO'),
 (1232,'12','06','99','MAZAMARI-PANGOA'),
 (1233,'12','07','00','TARMA'),
 (1234,'12','07','01','TARMA'),
 (1235,'12','07','02','ACOBAMBA'),
 (1236,'12','07','03','HUARICOLCA'),
 (1237,'12','07','04','HUASAHUASI'),
 (1238,'12','07','05','LA UNION'),
 (1239,'12','07','06','PALCA'),
 (1240,'12','07','07','PALCAMAYO'),
 (1241,'12','07','08','SAN PEDRO DE CAJAS'),
 (1242,'12','07','09','TAPO'),
 (1243,'12','08','00','YAULI'),
 (1244,'12','08','01','LA OROYA'),
 (1245,'12','08','02','CHACAPALPA'),
 (1246,'12','08','03','HUAY-HUAY'),
 (1247,'12','08','04','MARCAPOMACOCHA'),
 (1248,'12','08','05','MOROCOCHA'),
 (1249,'12','08','06','PACCHA'),
 (1250,'12','08','07','SANTA BARBARA DE CARHUACAYAN'),
 (1251,'12','08','08','SANTA ROSA DE SACCO'),
 (1252,'12','08','09','SUITUCANCHA'),
 (1253,'12','08','10','YAULI'),
 (1254,'12','09','00','CHUPACA'),
 (1255,'12','09','01','CHUPACA'),
 (1256,'12','09','02','AHUAC'),
 (1257,'12','09','03','CHONGOS BAJO'),
 (1258,'12','09','04','HUACHAC'),
 (1259,'12','09','05','HUAMANCACA CHICO'),
 (1260,'12','09','06','SAN JUAN DE ISCOS'),
 (1261,'12','09','07','SAN JUAN DE JARPA'),
 (1262,'12','09','08','3 DE DICIEMBRE'),
 (1263,'12','09','09','YANACANCHA'),
 (1264,'13','00','00','LA LIBERTAD'),
 (1265,'13','01','00','TRUJILLO'),
 (1266,'13','01','01','TRUJILLO'),
 (1267,'13','01','02','EL PORVENIR'),
 (1268,'13','01','03','FLORENCIA DE MORA'),
 (1269,'13','01','04','HUANCHACO'),
 (1270,'13','01','05','LA ESPERANZA'),
 (1271,'13','01','06','LAREDO'),
 (1272,'13','01','07','MOCHE'),
 (1273,'13','01','08','POROTO'),
 (1274,'13','01','09','SALAVERRY'),
 (1275,'13','01','10','SIMBAL'),
 (1276,'13','01','11','VICTOR LARCO HERRERA'),
 (1277,'13','02','00','ASCOPE'),
 (1278,'13','02','01','ASCOPE'),
 (1279,'13','02','02','CHICAMA'),
 (1280,'13','02','03','CHOCOPE'),
 (1281,'13','02','04','MAGDALENA DE CAO'),
 (1282,'13','02','05','PAIJAN'),
 (1283,'13','02','06','RAZURI'),
 (1284,'13','02','07','SANTIAGO DE CAO'),
 (1285,'13','02','08','CASA GRANDE'),
 (1286,'13','03','00','BOLIVAR'),
 (1287,'13','03','01','BOLIVAR'),
 (1288,'13','03','02','BAMBAMARCA'),
 (1289,'13','03','03','CONDORMARCA'),
 (1290,'13','03','04','LONGOTEA'),
 (1291,'13','03','05','UCHUMARCA'),
 (1292,'13','03','06','UCUNCHA'),
 (1293,'13','04','00','CHEPEN'),
 (1294,'13','04','01','CHEPEN'),
 (1295,'13','04','02','PACANGA'),
 (1296,'13','04','03','PUEBLO NUEVO'),
 (1297,'13','05','00','JULCAN'),
 (1298,'13','05','01','JULCAN'),
 (1299,'13','05','02','CALAMARCA'),
 (1300,'13','05','03','CARABAMBA'),
 (1301,'13','05','04','HUASO'),
 (1302,'13','06','00','OTUZCO'),
 (1303,'13','06','01','OTUZCO'),
 (1304,'13','06','02','AGALLPAMPA'),
 (1305,'13','06','04','CHARAT'),
 (1306,'13','06','05','HUARANCHAL'),
 (1307,'13','06','06','LA CUESTA'),
 (1308,'13','06','08','MACHE'),
 (1309,'13','06','10','PARANDAY'),
 (1310,'13','06','11','SALPO'),
 (1311,'13','06','13','SINSICAP'),
 (1312,'13','06','14','USQUIL'),
 (1313,'13','07','00','PACASMAYO'),
 (1314,'13','07','01','SAN PEDRO DE LLOC'),
 (1315,'13','07','02','GUADALUPE'),
 (1316,'13','07','03','JEQUETEPEQUE'),
 (1317,'13','07','04','PACASMAYO'),
 (1318,'13','07','05','SAN JOSE'),
 (1319,'13','08','00','PATAZ'),
 (1320,'13','08','01','TAYABAMBA'),
 (1321,'13','08','02','BULDIBUYO'),
 (1322,'13','08','03','CHILLIA'),
 (1323,'13','08','04','HUANCASPATA'),
 (1324,'13','08','05','HUAYLILLAS'),
 (1325,'13','08','06','HUAYO'),
 (1326,'13','08','07','ONGON'),
 (1327,'13','08','08','PARCOY'),
 (1328,'13','08','09','PATAZ'),
 (1329,'13','08','10','PIAS'),
 (1330,'13','08','11','SANTIAGO DE CHALLAS'),
 (1331,'13','08','12','TAURIJA'),
 (1332,'13','08','13','URPAY'),
 (1333,'13','09','00','SANCHEZ CARRION'),
 (1334,'13','09','01','HUAMACHUCO'),
 (1335,'13','09','02','CHUGAY'),
 (1336,'13','09','03','COCHORCO'),
 (1337,'13','09','04','CURGOS'),
 (1338,'13','09','05','MARCABAL'),
 (1339,'13','09','06','SANAGORAN'),
 (1340,'13','09','07','SARIN'),
 (1341,'13','09','08','SARTIMBAMBA'),
 (1342,'13','10','00','SANTIAGO DE CHUCO'),
 (1343,'13','10','01','SANTIAGO DE CHUCO'),
 (1344,'13','10','02','ANGASMARCA'),
 (1345,'13','10','03','CACHICADAN'),
 (1346,'13','10','04','MOLLEBAMBA'),
 (1347,'13','10','05','MOLLEPATA'),
 (1348,'13','10','06','QUIRUVILCA'),
 (1349,'13','10','07','SANTA CRUZ DE CHUCA'),
 (1350,'13','10','08','SITABAMBA'),
 (1351,'13','11','00','GRAN CHIMU'),
 (1352,'13','11','01','CASCAS'),
 (1353,'13','11','02','LUCMA'),
 (1354,'13','11','03','MARMOT'),
 (1355,'13','11','04','SAYAPULLO'),
 (1356,'13','12','00','VIRU'),
 (1357,'13','12','01','VIRU'),
 (1358,'13','12','02','CHAO'),
 (1359,'13','12','03','GUADALUPITO'),
 (1360,'14','00','00','LAMBAYEQUE'),
 (1361,'14','01','00','CHICLAYO'),
 (1362,'14','01','01','CHICLAYO'),
 (1363,'14','01','02','CHONGOYAPE'),
 (1364,'14','01','03','ETEN'),
 (1365,'14','01','04','ETEN PUERTO'),
 (1366,'14','01','05','JOSE LEONARDO ORTIZ'),
 (1367,'14','01','06','LA VICTORIA'),
 (1368,'14','01','07','LAGUNAS'),
 (1369,'14','01','08','MONSEFU'),
 (1370,'14','01','09','NUEVA ARICA'),
 (1371,'14','01','10','OYOTUN'),
 (1372,'14','01','11','PICSI'),
 (1373,'14','01','12','PIMENTEL'),
 (1374,'14','01','13','REQUE'),
 (1375,'14','01','14','SANTA ROSA'),
 (1376,'14','01','15','SAÑA'),
 (1377,'14','01','16','CAYALTÍ'),
 (1378,'14','01','17','PATAPO'),
 (1379,'14','01','18','POMALCA'),
 (1380,'14','01','19','PUCALÁ'),
 (1381,'14','01','20','TUMÁN'),
 (1382,'14','02','00','FERREÑAFE'),
 (1383,'14','02','01','FERREÑAFE'),
 (1384,'14','02','02','CAÑARIS'),
 (1385,'14','02','03','INCAHUASI'),
 (1386,'14','02','04','MANUEL ANTONIO MESONES MURO'),
 (1387,'14','02','05','PITIPO'),
 (1388,'14','02','06','PUEBLO NUEVO'),
 (1389,'14','03','00','LAMBAYEQUE'),
 (1390,'14','03','01','LAMBAYEQUE'),
 (1391,'14','03','02','CHOCHOPE'),
 (1392,'14','03','03','ILLIMO'),
 (1393,'14','03','04','JAYANCA'),
 (1394,'14','03','05','MOCHUMI'),
 (1395,'14','03','06','MORROPE'),
 (1396,'14','03','07','MOTUPE'),
 (1397,'14','03','08','OLMOS'),
 (1398,'14','03','09','PACORA'),
 (1399,'14','03','10','SALAS'),
 (1400,'14','03','11','SAN JOSE'),
 (1401,'14','03','12','TUCUME'),
 (1402,'15','00','00','LIMA'),
 (1403,'15','01','00','LIMA'),
 (1404,'15','01','01','LIMA'),
 (1405,'15','01','02','ANCON'),
 (1406,'15','01','03','ATE'),
 (1407,'15','01','04','BARRANCO'),
 (1408,'15','01','05','BREÑA'),
 (1409,'15','01','06','CARABAYLLO'),
 (1410,'15','01','07','CHACLACAYO'),
 (1411,'15','01','08','CHORRILLOS'),
 (1412,'15','01','09','CIENEGUILLA'),
 (1413,'15','01','10','COMAS'),
 (1414,'15','01','11','EL AGUSTINO'),
 (1415,'15','01','12','INDEPENDENCIA'),
 (1416,'15','01','13','JESUS MARIA'),
 (1417,'15','01','14','LA MOLINA'),
 (1418,'15','01','15','LA VICTORIA'),
 (1419,'15','01','16','LINCE'),
 (1420,'15','01','17','LOS OLIVOS'),
 (1421,'15','01','18','LURIGANCHO'),
 (1422,'15','01','19','LURIN'),
 (1423,'15','01','20','MAGDALENA DEL MAR'),
 (1424,'15','01','21','PUEBLO LIBRE (MAGDALENA VIEJA)'),
 (1425,'15','01','22','MIRAFLORES'),
 (1426,'15','01','23','PACHACAMAC'),
 (1427,'15','01','24','PUCUSANA'),
 (1428,'15','01','25','PUENTE PIEDRA'),
 (1429,'15','01','26','PUNTA HERMOSA'),
 (1430,'15','01','27','PUNTA NEGRA'),
 (1431,'15','01','28','RIMAC'),
 (1432,'15','01','29','SAN BARTOLO'),
 (1433,'15','01','30','SAN BORJA'),
 (1434,'15','01','31','SAN ISIDRO'),
 (1435,'15','01','32','SAN JUAN DE LURIGANCHO'),
 (1436,'15','01','33','SAN JUAN DE MIRAFLORES'),
 (1437,'15','01','34','SAN LUIS'),
 (1438,'15','01','35','SAN MARTIN DE PORRES'),
 (1439,'15','01','36','SAN MIGUEL'),
 (1440,'15','01','37','SANTA ANITA'),
 (1441,'15','01','38','SANTA MARIA DEL MAR'),
 (1442,'15','01','39','SANTA ROSA'),
 (1443,'15','01','40','SANTIAGO DE SURCO'),
 (1444,'15','01','41','SURQUILLO'),
 (1445,'15','01','42','VILLA EL SALVADOR'),
 (1446,'15','01','43','VILLA MARIA DEL TRIUNFO'),
 (1447,'15','02','00','BARRANCA'),
 (1448,'15','02','01','BARRANCA'),
 (1449,'15','02','02','PARAMONGA'),
 (1450,'15','02','03','PATIVILCA'),
 (1451,'15','02','04','SUPE'),
 (1452,'15','02','05','SUPE PUERTO'),
 (1453,'15','03','00','CAJATAMBO'),
 (1454,'15','03','01','CAJATAMBO'),
 (1455,'15','03','02','COPA'),
 (1456,'15','03','03','GORGOR'),
 (1457,'15','03','04','HUANCAPON'),
 (1458,'15','03','05','MANAS'),
 (1459,'15','04','00','CANTA'),
 (1460,'15','04','01','CANTA'),
 (1461,'15','04','02','ARAHUAY'),
 (1462,'15','04','03','HUAMANTANGA'),
 (1463,'15','04','04','HUAROS'),
 (1464,'15','04','05','LACHAQUI'),
 (1465,'15','04','06','SAN BUENAVENTURA'),
 (1466,'15','04','07','SANTA ROSA DE QUIVES'),
 (1467,'15','05','00','CAÑETE'),
 (1468,'15','05','01','SAN VICENTE DE CAÑETE'),
 (1469,'15','05','02','ASIA'),
 (1470,'15','05','03','CALANGO'),
 (1471,'15','05','04','CERRO AZUL'),
 (1472,'15','05','05','CHILCA'),
 (1473,'15','05','06','COAYLLO'),
 (1474,'15','05','07','IMPERIAL'),
 (1475,'15','05','08','LUNAHUANA'),
 (1476,'15','05','09','MALA'),
 (1477,'15','05','10','NUEVO IMPERIAL'),
 (1478,'15','05','11','PACARAN'),
 (1479,'15','05','12','QUILMANA'),
 (1480,'15','05','13','SAN ANTONIO'),
 (1481,'15','05','14','SAN LUIS'),
 (1482,'15','05','15','SANTA CRUZ DE FLORES'),
 (1483,'15','05','16','ZUÑIGA'),
 (1484,'15','06','00','HUARAL'),
 (1485,'15','06','01','HUARAL'),
 (1486,'15','06','02','ATAVILLOS ALTO'),
 (1487,'15','06','03','ATAVILLOS BAJO'),
 (1488,'15','06','04','AUCALLAMA'),
 (1489,'15','06','05','CHANCAY'),
 (1490,'15','06','06','IHUARI'),
 (1491,'15','06','07','LAMPIAN'),
 (1492,'15','06','08','PACARAOS'),
 (1493,'15','06','09','SAN MIGUEL DE ACOS'),
 (1494,'15','06','10','SANTA CRUZ DE ANDAMARCA'),
 (1495,'15','06','11','SUMBILCA'),
 (1496,'15','06','12','VEINTISIETE DE NOVIEMBRE'),
 (1497,'15','07','00','HUAROCHIRI'),
 (1498,'15','07','01','MATUCANA'),
 (1499,'15','07','02','ANTIOQUIA'),
 (1500,'15','07','03','CALLAHUANCA'),
 (1501,'15','07','04','CARAMPOMA'),
 (1502,'15','07','05','CHICLA'),
 (1503,'15','07','06','CUENCA'),
 (1504,'15','07','07','HUACHUPAMPA'),
 (1505,'15','07','08','HUANZA'),
 (1506,'15','07','09','HUAROCHIRI'),
 (1507,'15','07','10','LAHUAYTAMBO'),
 (1508,'15','07','11','LANGA'),
 (1509,'15','07','12','LARAOS'),
 (1510,'15','07','13','MARIATANA'),
 (1511,'15','07','14','RICARDO PALMA'),
 (1512,'15','07','15','SAN ANDRES DE TUPICOCHA'),
 (1513,'15','07','16','SAN ANTONIO'),
 (1514,'15','07','17','SAN BARTOLOME'),
 (1515,'15','07','18','SAN DAMIAN'),
 (1516,'15','07','19','SAN JUAN DE IRIS'),
 (1517,'15','07','20','SAN JUAN DE TANTARANCHE'),
 (1518,'15','07','21','SAN LORENZO DE QUINTI'),
 (1519,'15','07','22','SAN MATEO'),
 (1520,'15','07','23','SAN MATEO DE OTAO'),
 (1521,'15','07','24','SAN PEDRO DE CASTA'),
 (1522,'15','07','25','SAN PEDRO DE HUANCAYRE'),
 (1523,'15','07','26','SANGALLAYA'),
 (1524,'15','07','27','SANTA CRUZ DE COCACHACRA'),
 (1525,'15','07','28','SANTA EULALIA'),
 (1526,'15','07','29','SANTIAGO DE ANCHUCAYA'),
 (1527,'15','07','30','SANTIAGO DE TUNA'),
 (1528,'15','07','31','SANTO DOMINGO DE LOS OLLEROS'),
 (1529,'15','07','32','SURCO'),
 (1530,'15','08','00','HUAURA'),
 (1531,'15','08','01','HUACHO'),
 (1532,'15','08','02','AMBAR'),
 (1533,'15','08','03','CALETA DE CARQUIN'),
 (1534,'15','08','04','CHECRAS'),
 (1535,'15','08','05','HUALMAY'),
 (1536,'15','08','06','HUAURA'),
 (1537,'15','08','07','LEONCIO PRADO'),
 (1538,'15','08','08','PACCHO'),
 (1539,'15','08','09','SANTA LEONOR'),
 (1540,'15','08','10','SANTA MARIA'),
 (1541,'15','08','11','SAYAN'),
 (1542,'15','08','12','VEGUETA'),
 (1543,'15','09','00','OYON'),
 (1544,'15','09','01','OYON'),
 (1545,'15','09','02','ANDAJES'),
 (1546,'15','09','03','CAUJUL'),
 (1547,'15','09','04','COCHAMARCA'),
 (1548,'15','09','05','NAVAN'),
 (1549,'15','09','06','PACHANGARA'),
 (1550,'15','10','00','YAUYOS'),
 (1551,'15','10','01','YAUYOS'),
 (1552,'15','10','02','ALIS'),
 (1553,'15','10','03','AYAUCA'),
 (1554,'15','10','04','AYAVIRI'),
 (1555,'15','10','05','AZANGARO'),
 (1556,'15','10','06','CACRA'),
 (1557,'15','10','07','CARANIA'),
 (1558,'15','10','08','CATAHUASI'),
 (1559,'15','10','09','CHOCOS'),
 (1560,'15','10','10','COCHAS'),
 (1561,'15','10','11','COLONIA'),
 (1562,'15','10','12','HONGOS'),
 (1563,'15','10','13','HUAMPARA'),
 (1564,'15','10','14','HUANCAYA'),
 (1565,'15','10','15','HUANGASCAR'),
 (1566,'15','10','16','HUANTAN'),
 (1567,'15','10','17','HUAÑEC'),
 (1568,'15','10','18','LARAOS'),
 (1569,'15','10','19','LINCHA'),
 (1570,'15','10','20','MADEAN'),
 (1571,'15','10','21','MIRAFLORES'),
 (1572,'15','10','22','OMAS'),
 (1573,'15','10','23','PUTINZA'),
 (1574,'15','10','24','QUINCHES'),
 (1575,'15','10','25','QUINOCAY'),
 (1576,'15','10','26','SAN JOAQUIN'),
 (1577,'15','10','27','SAN PEDRO DE PILAS'),
 (1578,'15','10','28','TANTA'),
 (1579,'15','10','29','TAURIPAMPA'),
 (1580,'15','10','30','TOMAS'),
 (1581,'15','10','31','TUPE'),
 (1582,'15','10','32','VIÑAC'),
 (1583,'15','10','33','VITIS'),
 (1584,'16','00','00','LORETO'),
 (1585,'16','01','00','MAYNAS'),
 (1586,'16','01','01','IQUITOS'),
 (1587,'16','01','02','ALTO NANAY'),
 (1588,'16','01','03','FERNANDO LORES'),
 (1589,'16','01','04','INDIANA'),
 (1590,'16','01','05','LAS AMAZONAS'),
 (1591,'16','01','06','MAZAN'),
 (1592,'16','01','07','NAPO'),
 (1593,'16','01','08','PUNCHANA'),
 (1594,'16','01','09','PUTUMAYO'),
 (1595,'16','01','10','TORRES CAUSANA'),
 (1596,'16','01','12','BELÉN'),
 (1597,'16','01','13','SAN JUAN BAUTISTA'),
 (1598,'16','01','14','TENIENTE MANUEL CLAVERO'),
 (1599,'16','02','00','ALTO AMAZONAS'),
 (1600,'16','02','01','YURIMAGUAS'),
 (1601,'16','02','02','BALSAPUERTO'),
 (1602,'16','02','05','JEBEROS'),
 (1603,'16','02','06','LAGUNAS'),
 (1604,'16','02','10','SANTA CRUZ'),
 (1605,'16','02','11','TENIENTE CESAR LOPEZ ROJAS'),
 (1606,'16','03','00','LORETO'),
 (1607,'16','03','01','NAUTA'),
 (1608,'16','03','02','PARINARI'),
 (1609,'16','03','03','TIGRE'),
 (1610,'16','03','04','TROMPETEROS'),
 (1611,'16','03','05','URARINAS'),
 (1612,'16','04','00','MARISCAL RAMON CASTILLA'),
 (1613,'16','04','01','RAMON CASTILLA'),
 (1614,'16','04','02','PEBAS'),
 (1615,'16','04','03','YAVARI'),
 (1616,'16','04','04','SAN PABLO'),
 (1617,'16','05','00','REQUENA'),
 (1618,'16','05','01','REQUENA'),
 (1619,'16','05','02','ALTO TAPICHE'),
 (1620,'16','05','03','CAPELO'),
 (1621,'16','05','04','EMILIO SAN MARTIN'),
 (1622,'16','05','05','MAQUIA'),
 (1623,'16','05','06','PUINAHUA'),
 (1624,'16','05','07','SAQUENA'),
 (1625,'16','05','08','SOPLIN'),
 (1626,'16','05','09','TAPICHE'),
 (1627,'16','05','10','JENARO HERRERA'),
 (1628,'16','05','11','YAQUERANA'),
 (1629,'16','06','00','UCAYALI'),
 (1630,'16','06','01','CONTAMANA'),
 (1631,'16','06','02','INAHUAYA'),
 (1632,'16','06','03','PADRE MARQUEZ'),
 (1633,'16','06','04','PAMPA HERMOSA'),
 (1634,'16','06','05','SARAYACU'),
 (1635,'16','06','06','VARGAS GUERRA'),
 (1636,'16','07','00','DATEM DEL MARAÑÓN'),
 (1637,'16','07','01','BARRANCA'),
 (1638,'16','07','02','CAHUAPANAS'),
 (1639,'16','07','03','MANSERICHE'),
 (1640,'16','07','04','MORONA'),
 (1641,'16','07','05','PASTAZA'),
 (1642,'16','07','06','ANDOAS'),
 (1643,'16','08','00','PUTUMAYO'),
 (1644,'16','08','01','PUTUMAYO'),
 (1645,'16','08','02','ROSA PANDURO'),
 (1646,'16','08','03','TENIENTE MANUEL CLAVERO'),
 (1647,'16','08','04','YAGUAS'),
 (1648,'17','00','00','MADRE DE DIOS'),
 (1649,'17','01','00','TAMBOPATA'),
 (1650,'17','01','01','TAMBOPATA'),
 (1651,'17','01','02','INAMBARI'),
 (1652,'17','01','03','LAS PIEDRAS'),
 (1653,'17','01','04','LABERINTO'),
 (1654,'17','02','00','MANU'),
 (1655,'17','02','01','MANU'),
 (1656,'17','02','02','FITZCARRALD'),
 (1657,'17','02','03','MADRE DE DIOS'),
 (1658,'17','02','04','HUEPETUHE'),
 (1659,'17','03','00','TAHUAMANU'),
 (1660,'17','03','01','IÑAPARI'),
 (1661,'17','03','02','IBERIA'),
 (1662,'17','03','03','TAHUAMANU'),
 (1663,'18','00','00','MOQUEGUA'),
 (1664,'18','01','00','MARISCAL NIETO'),
 (1665,'18','01','01','MOQUEGUA'),
 (1666,'18','01','02','CARUMAS'),
 (1667,'18','01','03','CUCHUMBAYA'),
 (1668,'18','01','04','SAMEGUA'),
 (1669,'18','01','05','SAN CRISTOBAL'),
 (1670,'18','01','06','TORATA'),
 (1671,'18','02','00','GENERAL SANCHEZ CERRO'),
 (1672,'18','02','01','OMATE'),
 (1673,'18','02','02','CHOJATA'),
 (1674,'18','02','03','COALAQUE'),
 (1675,'18','02','04','ICHUÑA'),
 (1676,'18','02','05','LA CAPILLA'),
 (1677,'18','02','06','LLOQUE'),
 (1678,'18','02','07','MATALAQUE'),
 (1679,'18','02','08','PUQUINA'),
 (1680,'18','02','09','QUINISTAQUILLAS'),
 (1681,'18','02','10','UBINAS'),
 (1682,'18','02','11','YUNGA'),
 (1683,'18','03','00','ILO'),
 (1684,'18','03','01','ILO'),
 (1685,'18','03','02','EL ALGARROBAL'),
 (1686,'18','03','03','PACOCHA'),
 (1687,'19','00','00','PASCO'),
 (1688,'19','01','00','PASCO'),
 (1689,'19','01','01','CHAUPIMARCA'),
 (1690,'19','01','02','HUACHON'),
 (1691,'19','01','03','HUARIACA'),
 (1692,'19','01','04','HUAYLLAY'),
 (1693,'19','01','05','NINACACA'),
 (1694,'19','01','06','PALLANCHACRA'),
 (1695,'19','01','07','PAUCARTAMBO'),
 (1696,'19','01','08','SAN FCO. DE ASÍS DE YARUSYACÁN'),
 (1697,'19','01','09','SIMON BOLIVAR'),
 (1698,'19','01','10','TICLACAYAN'),
 (1699,'19','01','11','TINYAHUARCO'),
 (1700,'19','01','12','VICCO'),
 (1701,'19','01','13','YANACANCHA'),
 (1702,'19','02','00','DANIEL ALCIDES CARRION'),
 (1703,'19','02','01','YANAHUANCA'),
 (1704,'19','02','02','CHACAYAN'),
 (1705,'19','02','03','GOYLLARISQUIZGA'),
 (1706,'19','02','04','PAUCAR'),
 (1707,'19','02','05','SAN PEDRO DE PILLAO'),
 (1708,'19','02','06','SANTA ANA DE TUSI'),
 (1709,'19','02','07','TAPUC'),
 (1710,'19','02','08','VILCABAMBA'),
 (1711,'19','03','00','OXAPAMPA'),
 (1712,'19','03','01','OXAPAMPA'),
 (1713,'19','03','02','CHONTABAMBA'),
 (1714,'19','03','03','HUANCABAMBA'),
 (1715,'19','03','04','PALCAZU'),
 (1716,'19','03','05','POZUZO'),
 (1717,'19','03','06','PUERTO BERMUDEZ'),
 (1718,'19','03','07','VILLA RICA'),
 (1719,'19','03','08','CONSTITUCION'),
 (1720,'20','00','00','PIURA'),
 (1721,'20','01','00','PIURA'),
 (1722,'20','01','01','PIURA'),
 (1723,'20','01','04','CASTILLA'),
 (1724,'20','01','05','CATACAOS'),
 (1725,'20','01','07','CURA MORI'),
 (1726,'20','01','08','EL TALLAN'),
 (1727,'20','01','09','LA ARENA'),
 (1728,'20','01','10','LA UNION'),
 (1729,'20','01','11','LAS LOMAS'),
 (1730,'20','01','14','TAMBO GRANDE'),
 (1731,'20','01','15','VEINTISÉIS DE OCTUBRE'),
 (1732,'20','02','00','AYABACA'),
 (1733,'20','02','01','AYABACA'),
 (1734,'20','02','02','FRIAS'),
 (1735,'20','02','03','JILILI'),
 (1736,'20','02','04','LAGUNAS'),
 (1737,'20','02','05','MONTERO'),
 (1738,'20','02','06','PACAIPAMPA'),
 (1739,'20','02','07','PAIMAS'),
 (1740,'20','02','08','SAPILLICA'),
 (1741,'20','02','09','SICCHEZ'),
 (1742,'20','02','10','SUYO'),
 (1743,'20','03','00','HUANCABAMBA'),
 (1744,'20','03','01','HUANCABAMBA'),
 (1745,'20','03','02','CANCHAQUE'),
 (1746,'20','03','03','EL CARMEN DE LA FRONTERA'),
 (1747,'20','03','04','HUARMACA'),
 (1748,'20','03','05','LALAQUIZ'),
 (1749,'20','03','06','SAN MIGUEL DE EL FAIQUE'),
 (1750,'20','03','07','SONDOR'),
 (1751,'20','03','08','SONDORILLO'),
 (1752,'20','04','00','MORROPON'),
 (1753,'20','04','01','CHULUCANAS'),
 (1754,'20','04','02','BUENOS AIRES'),
 (1755,'20','04','03','CHALACO'),
 (1756,'20','04','04','LA MATANZA'),
 (1757,'20','04','05','MORROPON'),
 (1758,'20','04','06','SALITRAL'),
 (1759,'20','04','07','SAN JUAN DE BIGOTE'),
 (1760,'20','04','08','SANTA CATALINA DE MOSSA'),
 (1761,'20','04','09','SANTO DOMINGO'),
 (1762,'20','04','10','YAMANGO'),
 (1763,'20','05','00','PAITA'),
 (1764,'20','05','01','PAITA'),
 (1765,'20','05','02','AMOTAPE'),
 (1766,'20','05','03','ARENAL'),
 (1767,'20','05','04','COLAN'),
 (1768,'20','05','05','LA HUACA'),
 (1769,'20','05','06','TAMARINDO'),
 (1770,'20','05','07','VICHAYAL'),
 (1771,'20','06','00','SULLANA'),
 (1772,'20','06','01','SULLANA'),
 (1773,'20','06','02','BELLAVISTA'),
 (1774,'20','06','03','IGNACIO ESCUDERO'),
 (1775,'20','06','04','LANCONES'),
 (1776,'20','06','05','MARCAVELICA'),
 (1777,'20','06','06','MIGUEL CHECA'),
 (1778,'20','06','07','QUERECOTILLO'),
 (1779,'20','06','08','SALITRAL'),
 (1780,'20','07','00','TALARA'),
 (1781,'20','07','01','PARIÑAS'),
 (1782,'20','07','02','EL ALTO'),
 (1783,'20','07','03','LA BREA'),
 (1784,'20','07','04','LOBITOS'),
 (1785,'20','07','05','LOS ORGANOS'),
 (1786,'20','07','06','MANCORA'),
 (1787,'20','08','00','SECHURA'),
 (1788,'20','08','01','SECHURA'),
 (1789,'20','08','02','BELLAVISTA DE LA UNION'),
 (1790,'20','08','03','BERNAL'),
 (1791,'20','08','04','CRISTO NOS VALGA'),
 (1792,'20','08','05','VICE'),
 (1793,'20','08','06','RINCONADA LLICUAR'),
 (1794,'21','00','00','PUNO'),
 (1795,'21','01','00','PUNO'),
 (1796,'21','01','01','PUNO'),
 (1797,'21','01','02','ACORA');
INSERT INTO `ubigeo_inei` (`id_ubigeo`,`departamento`,`provincia`,`distrito`,`nombre`) VALUES 
 (1798,'21','01','03','AMANTANI'),
 (1799,'21','01','04','ATUNCOLLA'),
 (1800,'21','01','05','CAPACHICA'),
 (1801,'21','01','06','CHUCUITO'),
 (1802,'21','01','07','COATA'),
 (1803,'21','01','08','HUATA'),
 (1804,'21','01','09','MAÑAZO'),
 (1805,'21','01','10','PAUCARCOLLA'),
 (1806,'21','01','11','PICHACANI'),
 (1807,'21','01','12','PLATERIA'),
 (1808,'21','01','13','SAN ANTONIO'),
 (1809,'21','01','14','TIQUILLACA'),
 (1810,'21','01','15','VILQUE'),
 (1811,'21','02','00','AZANGARO'),
 (1812,'21','02','01','AZANGARO'),
 (1813,'21','02','02','ACHAYA'),
 (1814,'21','02','03','ARAPA'),
 (1815,'21','02','04','ASILLO'),
 (1816,'21','02','05','CAMINACA'),
 (1817,'21','02','06','CHUPA'),
 (1818,'21','02','07','JOSE DOMINGO CHOQUEHUANCA'),
 (1819,'21','02','08','MUÑANI'),
 (1820,'21','02','09','POTONI'),
 (1821,'21','02','10','SAMAN'),
 (1822,'21','02','11','SAN ANTON'),
 (1823,'21','02','12','SAN JOSE'),
 (1824,'21','02','13','SAN JUAN DE SALINAS'),
 (1825,'21','02','14','SANTIAGO DE PUPUJA'),
 (1826,'21','02','15','TIRAPATA'),
 (1827,'21','03','00','CARABAYA'),
 (1828,'21','03','01','MACUSANI'),
 (1829,'21','03','02','AJOYANI'),
 (1830,'21','03','03','AYAPATA'),
 (1831,'21','03','04','COASA'),
 (1832,'21','03','05','CORANI'),
 (1833,'21','03','06','CRUCERO'),
 (1834,'21','03','07','ITUATA'),
 (1835,'21','03','08','OLLACHEA'),
 (1836,'21','03','09','SAN GABAN'),
 (1837,'21','03','10','USICAYOS'),
 (1838,'21','04','00','CHUCUITO'),
 (1839,'21','04','01','JULI'),
 (1840,'21','04','02','DESAGUADERO'),
 (1841,'21','04','03','HUACULLANI'),
 (1842,'21','04','04','KELLUYO'),
 (1843,'21','04','05','PISACOMA'),
 (1844,'21','04','06','POMATA'),
 (1845,'21','04','07','ZEPITA'),
 (1846,'21','05','00','EL COLLAO'),
 (1847,'21','05','01','ILAVE'),
 (1848,'21','05','02','CAPASO'),
 (1849,'21','05','03','PILCUYO'),
 (1850,'21','05','04','SANTA ROSA'),
 (1851,'21','05','05','CONDURIRI'),
 (1852,'21','06','00','HUANCANE'),
 (1853,'21','06','01','HUANCANE'),
 (1854,'21','06','02','COJATA'),
 (1855,'21','06','03','HUATASANI'),
 (1856,'21','06','04','INCHUPALLA'),
 (1857,'21','06','05','PUSI'),
 (1858,'21','06','06','ROSASPATA'),
 (1859,'21','06','07','TARACO'),
 (1860,'21','06','08','VILQUE CHICO'),
 (1861,'21','07','00','LAMPA'),
 (1862,'21','07','01','LAMPA'),
 (1863,'21','07','02','CABANILLA'),
 (1864,'21','07','03','CALAPUJA'),
 (1865,'21','07','04','NICASIO'),
 (1866,'21','07','05','OCUVIRI'),
 (1867,'21','07','06','PALCA'),
 (1868,'21','07','07','PARATIA'),
 (1869,'21','07','08','PUCARA'),
 (1870,'21','07','09','SANTA LUCIA'),
 (1871,'21','07','10','VILAVILA'),
 (1872,'21','08','00','MELGAR'),
 (1873,'21','08','01','AYAVIRI'),
 (1874,'21','08','02','ANTAUTA'),
 (1875,'21','08','03','CUPI'),
 (1876,'21','08','04','LLALLI'),
 (1877,'21','08','05','MACARI'),
 (1878,'21','08','06','NUÑOA'),
 (1879,'21','08','07','ORURILLO'),
 (1880,'21','08','08','SANTA ROSA'),
 (1881,'21','08','09','UMACHIRI'),
 (1882,'21','09','00','MOHO'),
 (1883,'21','09','01','MOHO'),
 (1884,'21','09','02','CONIMA'),
 (1885,'21','09','03','HUAYRAPATA'),
 (1886,'21','09','04','TILALI'),
 (1887,'21','10','00','SAN ANTONIO DE PUTINA'),
 (1888,'21','10','01','PUTINA'),
 (1889,'21','10','02','ANANEA'),
 (1890,'21','10','03','PEDRO VILCA APAZA'),
 (1891,'21','10','04','QUILCAPUNCU'),
 (1892,'21','10','05','SINA'),
 (1893,'21','11','00','SAN ROMAN'),
 (1894,'21','11','01','JULIACA'),
 (1895,'21','11','02','CABANA'),
 (1896,'21','11','03','CABANILLAS'),
 (1897,'21','11','04','CARACOTO'),
 (1898,'21','12','00','SANDIA'),
 (1899,'21','12','01','SANDIA'),
 (1900,'21','12','02','CUYOCUYO'),
 (1901,'21','12','03','LIMBANI'),
 (1902,'21','12','04','PATAMBUCO'),
 (1903,'21','12','05','PHARA'),
 (1904,'21','12','06','QUIACA'),
 (1905,'21','12','07','SAN JUAN DEL ORO'),
 (1906,'21','12','08','YANAHUAYA'),
 (1907,'21','12','09','ALTO INAMBARI'),
 (1908,'21','12','10','SAN PEDRO DE PUTINA PUNCO'),
 (1909,'21','13','00','YUNGUYO'),
 (1910,'21','13','01','YUNGUYO'),
 (1911,'21','13','02','ANAPIA'),
 (1912,'21','13','03','COPANI'),
 (1913,'21','13','04','CUTURAPI'),
 (1914,'21','13','05','OLLARAYA'),
 (1915,'21','13','06','TINICACHI'),
 (1916,'21','13','07','UNICACHI'),
 (1917,'22','00','00','SAN MARTIN'),
 (1918,'22','01','00','MOYOBAMBA'),
 (1919,'22','01','01','MOYOBAMBA'),
 (1920,'22','01','02','CALZADA'),
 (1921,'22','01','03','HABANA'),
 (1922,'22','01','04','JEPELACIO'),
 (1923,'22','01','05','SORITOR'),
 (1924,'22','01','06','YANTALO'),
 (1925,'22','02','00','BELLAVISTA'),
 (1926,'22','02','01','BELLAVISTA'),
 (1927,'22','02','02','ALTO BIAVO'),
 (1928,'22','02','03','BAJO BIAVO'),
 (1929,'22','02','04','HUALLAGA'),
 (1930,'22','02','05','SAN PABLO'),
 (1931,'22','02','06','SAN RAFAEL'),
 (1932,'22','03','00','EL DORADO'),
 (1933,'22','03','01','SAN JOSE DE SISA'),
 (1934,'22','03','02','AGUA BLANCA'),
 (1935,'22','03','03','SAN MARTIN'),
 (1936,'22','03','04','SANTA ROSA'),
 (1937,'22','03','05','SHATOJA'),
 (1938,'22','04','00','HUALLAGA'),
 (1939,'22','04','01','SAPOSOA'),
 (1940,'22','04','02','ALTO SAPOSOA'),
 (1941,'22','04','03','EL ESLABON'),
 (1942,'22','04','04','PISCOYACU'),
 (1943,'22','04','05','SACANCHE'),
 (1944,'22','04','06','TINGO DE SAPOSOA'),
 (1945,'22','05','00','LAMAS'),
 (1946,'22','05','01','LAMAS'),
 (1947,'22','05','02','ALONSO DE ALVARADO'),
 (1948,'22','05','03','BARRANQUITA'),
 (1949,'22','05','04','CAYNARACHI'),
 (1950,'22','05','05','CUÑUMBUQUI'),
 (1951,'22','05','06','PINTO RECODO'),
 (1952,'22','05','07','RUMISAPA'),
 (1953,'22','05','08','SAN ROQUE DE CUMBAZA'),
 (1954,'22','05','09','SHANAO'),
 (1955,'22','05','10','TABALOSOS'),
 (1956,'22','05','11','ZAPATERO'),
 (1957,'22','06','00','MARISCAL CACERES'),
 (1958,'22','06','01','JUANJUI'),
 (1959,'22','06','02','CAMPANILLA'),
 (1960,'22','06','03','HUICUNGO'),
 (1961,'22','06','04','PACHIZA'),
 (1962,'22','06','05','PAJARILLO'),
 (1963,'22','07','00','PICOTA'),
 (1964,'22','07','01','PICOTA'),
 (1965,'22','07','02','BUENOS AIRES'),
 (1966,'22','07','03','CASPISAPA'),
 (1967,'22','07','04','PILLUANA'),
 (1968,'22','07','05','PUCACACA'),
 (1969,'22','07','06','SAN CRISTOBAL'),
 (1970,'22','07','07','SAN HILARION'),
 (1971,'22','07','08','SHAMBOYACU'),
 (1972,'22','07','09','TINGO DE PONASA'),
 (1973,'22','07','10','TRES UNIDOS'),
 (1974,'22','08','00','RIOJA'),
 (1975,'22','08','01','RIOJA'),
 (1976,'22','08','02','AWAJUN'),
 (1977,'22','08','03','ELIAS SOPLIN VARGAS'),
 (1978,'22','08','04','NUEVA CAJAMARCA'),
 (1979,'22','08','05','PARDO MIGUEL'),
 (1980,'22','08','06','POSIC'),
 (1981,'22','08','07','SAN FERNANDO'),
 (1982,'22','08','08','YORONGOS'),
 (1983,'22','08','09','YURACYACU'),
 (1984,'22','09','00','SAN MARTIN'),
 (1985,'22','09','01','TARAPOTO'),
 (1986,'22','09','02','ALBERTO LEVEAU'),
 (1987,'22','09','03','CACATACHI'),
 (1988,'22','09','04','CHAZUTA'),
 (1989,'22','09','05','CHIPURANA'),
 (1990,'22','09','06','EL PORVENIR'),
 (1991,'22','09','07','HUIMBAYOC'),
 (1992,'22','09','08','JUAN GUERRA'),
 (1993,'22','09','09','LA BANDA DE SHILCAYO'),
 (1994,'22','09','10','MORALES'),
 (1995,'22','09','11','PAPAPLAYA'),
 (1996,'22','09','12','SAN ANTONIO'),
 (1997,'22','09','13','SAUCE'),
 (1998,'22','09','14','SHAPAJA'),
 (1999,'22','10','00','TOCACHE'),
 (2000,'22','10','01','TOCACHE'),
 (2001,'22','10','02','NUEVO PROGRESO'),
 (2002,'22','10','03','POLVORA'),
 (2003,'22','10','04','SHUNTE'),
 (2004,'22','10','05','UCHIZA'),
 (2005,'23','00','00','TACNA'),
 (2006,'23','01','00','TACNA'),
 (2007,'23','01','01','TACNA'),
 (2008,'23','01','02','ALTO DE LA ALIANZA'),
 (2009,'23','01','03','CALANA'),
 (2010,'23','01','04','CIUDAD NUEVA'),
 (2011,'23','01','05','INCLAN'),
 (2012,'23','01','06','PACHIA'),
 (2013,'23','01','07','PALCA'),
 (2014,'23','01','08','POCOLLAY'),
 (2015,'23','01','09','SAMA'),
 (2016,'23','01','10','CORONEL GREGORIO ALBARRACÍN L'),
 (2017,'23','02','00','CANDARAVE'),
 (2018,'23','02','01','CANDARAVE'),
 (2019,'23','02','02','CAIRANI'),
 (2020,'23','02','03','CAMILACA'),
 (2021,'23','02','04','CURIBAYA'),
 (2022,'23','02','05','HUANUARA'),
 (2023,'23','02','06','QUILAHUANI'),
 (2024,'23','03','00','JORGE BASADRE'),
 (2025,'23','03','01','LOCUMBA'),
 (2026,'23','03','02','ILABAYA'),
 (2027,'23','03','03','ITE'),
 (2028,'23','04','00','TARATA'),
 (2029,'23','04','01','TARATA'),
 (2030,'23','04','02','CHUCATAMANI'),
 (2031,'23','04','03','ESTIQUE'),
 (2032,'23','04','04','ESTIQUE-PAMPA'),
 (2033,'23','04','05','SITAJARA'),
 (2034,'23','04','06','SUSAPAYA'),
 (2035,'23','04','07','TARUCACHI'),
 (2036,'23','04','08','TICACO'),
 (2037,'24','00','00','TUMBES'),
 (2038,'24','01','00','TUMBES'),
 (2039,'24','01','01','TUMBES'),
 (2040,'24','01','02','CORRALES'),
 (2041,'24','01','03','LA CRUZ'),
 (2042,'24','01','04','PAMPAS DE HOSPITAL'),
 (2043,'24','01','05','SAN JACINTO'),
 (2044,'24','01','06','SAN JUAN DE LA VIRGEN'),
 (2045,'24','02','00','CONTRALMIRANTE VILLAR'),
 (2046,'24','02','01','ZORRITOS'),
 (2047,'24','02','02','CASITAS'),
 (2048,'24','02','03','CANOAS DE PUNTA SAL'),
 (2049,'24','03','00','ZARUMILLA'),
 (2050,'24','03','01','ZARUMILLA'),
 (2051,'24','03','02','AGUAS VERDES'),
 (2052,'24','03','03','MATAPALO'),
 (2053,'24','03','04','PAPAYAL'),
 (2054,'25','00','00','UCAYALI'),
 (2055,'25','01','00','CORONEL PORTILLO'),
 (2056,'25','01','01','CALLARIA'),
 (2057,'25','01','02','CAMPOVERDE'),
 (2058,'25','01','03','IPARIA'),
 (2059,'25','01','04','MASISEA'),
 (2060,'25','01','05','YARINACOCHA'),
 (2061,'25','01','06','NUEVA REQUENA'),
 (2062,'25','01','07','MANANTAY'),
 (2063,'25','02','00','ATALAYA'),
 (2064,'25','02','01','RAYMONDI'),
 (2065,'25','02','02','SEPAHUA'),
 (2066,'25','02','03','TAHUANIA'),
 (2067,'25','02','04','YURUA'),
 (2068,'25','03','00','PADRE ABAD'),
 (2069,'25','03','01','PADRE ABAD'),
 (2070,'25','03','02','IRAZOLA'),
 (2071,'25','03','03','CURIMANA'),
 (2072,'25','04','00','PURUS'),
 (2073,'25','04','01','PURUS'),
 (2074,'99','00','00','EXTRANJERO'),
 (2075,'99','99','00','EXTRANJERO'),
 (2076,'99','99','99','EXTRANJERO');
/*!40000 ALTER TABLE `ubigeo_inei` ENABLE KEYS */;


--
-- Definition of table `untitled_table_52`
--

DROP TABLE IF EXISTS `untitled_table_52`;
CREATE TABLE `untitled_table_52` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `untitled_table_52`
--

/*!40000 ALTER TABLE `untitled_table_52` DISABLE KEYS */;
/*!40000 ALTER TABLE `untitled_table_52` ENABLE KEYS */;


--
-- Definition of table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `num_doc` varchar(20) DEFAULT '',
  `usuario` varchar(200) DEFAULT NULL,
  `clave` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT '',
  `nombres_apellidos` varchar(300) DEFAULT '',
  `nombres` varchar(200) DEFAULT '',
  `apellidos` varchar(200) DEFAULT '',
  `direccion` varchar(300) DEFAULT '',
  `rubro` varchar(100) DEFAULT NULL,
  `sucursal` int(11) DEFAULT '1',
  `telefono` varchar(100) DEFAULT '',
  `token_reset` varchar(130) DEFAULT NULL,
  `mensaje` varchar(220) DEFAULT NULL,
  `fecha_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` int(11) DEFAULT '1',
  PRIMARY KEY (`usuario_id`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`usuario_id`,`id_empresa`,`id_rol`,`num_doc`,`usuario`,`clave`,`email`,`nombres_apellidos`,`nombres`,`apellidos`,`direccion`,`rubro`,`sucursal`,`telefono`,`token_reset`,`mensaje`,`fecha_create`,`estado`) VALUES 
 (40,12,1,'10428690481','admin','7e9ecf43c568bfb20130688e3b4db5e7dde2d691','','','','','',NULL,1,'',NULL,NULL,NULL,1),
 (42,12,2,'45497593','Marilyn','fa09ea507e55c1ecb71d7b7ca7de56bea5f81ce6','','','MARILYN EVELYN','SANCHEZ SILVA','Fundo Santa Adela - Nuevo Imperial - Cañete - Lima - Peru',NULL,1,'930906013',NULL,NULL,'2026-03-01 10:48:29',1),
 (44,12,2,'42869048','HOMS','a720b6769df0bd9cea46117b9b826f6a3eb7f0f2','hectormayta@gmail.com','','HECTOR ODON','MAYTA SIERRA','FUNDO SANTA ADELA S/N NUEVO IMPERIAL',NULL,1,'930570018',NULL,NULL,'2026-03-17 10:56:12',1),
 (45,12,2,'74236299','MRAS','5806d2fd2dd44048d62d596de456bd6f35b51547','','','MONTTY ROMARIO','ARONES SANCHEZ','IMPERIAL',NULL,1,'906539395',NULL,NULL,'2026-05-20 07:17:10',1),
 (46,12,2,'46630324','JMSS','94f95dff17a4c223ebef4f1d1fa0a1658dd22f1f','','','JORGE MOISES','SANCHEZ SILVA','Fundo Santa Adela - Nuevo Imperial - Cañete - Lima - Peru',NULL,1,'926317522',NULL,NULL,'2026-05-20 07:27:19',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


--
-- Definition of table `venta_anexo`
--

DROP TABLE IF EXISTS `venta_anexo`;
CREATE TABLE `venta_anexo` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(245) NOT NULL,
  PRIMARY KEY (`idventa`)
) ENGINE=MyISAM AUTO_INCREMENT=2245 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venta_anexo`
--

/*!40000 ALTER TABLE `venta_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_anexo` ENABLE KEYS */;


--
-- Definition of table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_tido` int(11) NOT NULL,
  `id_tipo_pago` int(11) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `dias_pagos` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(220) COLLATE utf8_spanish_ci NOT NULL,
  `serie` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero` int(5) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` double(10,2) DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `enviado_sunat` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `apli_igv` char(1) COLLATE utf8_spanish_ci DEFAULT '1',
  `observacion` varchar(220) COLLATE utf8_spanish_ci DEFAULT NULL,
  `igv` double(10,2) DEFAULT '0.18',
  `medoto_pago_id` int(11) DEFAULT NULL,
  `pagado` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `is_segun_pago` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `medoto_pago2_id` int(11) DEFAULT NULL,
  `pagado2` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `moneda` int(10) DEFAULT '1',
  `cm_tc` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_ventas_documentos_sunat1_idx` (`id_tido`),
  KEY `fk_ventas_clientes1_idx` (`id_cliente`),
  KEY `fk_ventas_empresas1_idx` (`id_empresa`),
  KEY `id_tipo_pago` (`id_tipo_pago`),
  KEY `medoto_pago_id` (`medoto_pago_id`),
  CONSTRAINT `fk_ventas_documentos_sunat1` FOREIGN KEY (`id_tido`) REFERENCES `documentos_sunat` (`id_tido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_empresas1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`tipo_pago_id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`medoto_pago_id`) REFERENCES `metodo_pago` (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=17270 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ventas`
--

/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`id_venta`,`id_tido`,`id_tipo_pago`,`fecha_emision`,`fecha_vencimiento`,`dias_pagos`,`direccion`,`serie`,`numero`,`id_cliente`,`total`,`estado`,`enviado_sunat`,`id_empresa`,`sucursal`,`apli_igv`,`observacion`,`igv`,`medoto_pago_id`,`pagado`,`is_segun_pago`,`medoto_pago2_id`,`pagado2`,`moneda`,`cm_tc`) VALUES 
 (17255,1,1,'2026-02-25','2026-02-25','','-','B001',1,11682,30.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17256,6,1,'2026-02-25','2026-02-25','','-','NV01',1,11682,30.00,'2','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17258,1,1,'2026-02-25','2026-02-25','','-','B001',2,11682,30.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17259,1,1,'2026-02-25','2026-02-25','','-','B001',3,11682,30.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17260,1,1,'2026-02-25','2026-02-25','','-','B001',4,11682,30.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17261,6,1,'2026-03-01','2026-03-01','','-','NV01',2,11682,240.00,'2','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17262,1,1,'2026-03-01','2026-03-01','','Santa Adela ','B001',5,11684,110.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17263,6,1,'2026-03-01','2026-03-01','','Santa Adela ','NV01',3,11684,110.00,'2','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17264,6,1,'2026-03-01','2026-03-01','','San Vicente','NV01',4,11686,110.00,'2','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17265,6,1,'2026-03-26','2026-03-26','','EL DECIERTO , FRENTE DEL GRIFO ','NV01',5,11689,110.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17266,6,1,'2026-03-26','2026-03-26','','LAS LOMAS DE PALAO SANTA CLARA- LIMA','NV01',6,11687,100.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17267,1,1,'2026-05-24','2026-05-24','','CHILCAL  PASAJE MIRAFLOREDE','B001',6,11693,110.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17268,6,1,'2026-05-24','2026-05-24','','Av. 28 Julio 287 - San Vicente','NV01',7,11694,110.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,''),
 (17269,6,1,'2026-05-24','2026-05-24','','Av. 28 Julio 287 - San Vicente','NV01',8,11694,110.00,'1','0',12,1,'1','',0.18,12,'','1',12,'',1,'');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;


--
-- Definition of trigger `ti_ventas`
--

DROP TRIGGER /*!50030 IF EXISTS */ `ti_ventas`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `ti_ventas` AFTER INSERT ON `ventas` FOR EACH ROW BEGIN
DECLARE idtido_ INT;
DECLARE idempresa_ INT;
DECLARE idcliente_ INT;
DECLARE total_ FLOAT;
DECLARE fecha_ DATE;
DECLARE sucursal_ INT;
SET idtido_ = new.id_tido;
SET idempresa_ = new.id_empresa;
SET idcliente_ = new.id_cliente;
SET fecha_ = new.fecha_emision;
SET total_ = new.total;
SET sucursal_ = new.sucursal;
UPDATE documentos_empresas AS de 
SET de.numero = de.numero + 1 
WHERE de.id_empresa = idempresa_ AND de.id_tido = idtido_ AND sucursal = sucursal_;
UPDATE clientes AS c 
SET c.ultima_venta = fecha_, c.total_venta = c.total_venta + total_
WHERE c.id_cliente = idcliente_;
END $$

DELIMITER ;

--
-- Definition of table `ventas_anuladas`
--

DROP TABLE IF EXISTS `ventas_anuladas`;
CREATE TABLE `ventas_anuladas` (
  `id_venta` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `motivo` varchar(245) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  CONSTRAINT `fk_ventas_anuladas_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ventas_anuladas`
--

/*!40000 ALTER TABLE `ventas_anuladas` DISABLE KEYS */;
INSERT INTO `ventas_anuladas` (`id_venta`,`fecha`,`motivo`) VALUES 
 (17256,'2026-03-15','-'),
 (17261,'2026-03-15','-'),
 (17263,'2026-03-15','-'),
 (17264,'2026-03-15','-');
/*!40000 ALTER TABLE `ventas_anuladas` ENABLE KEYS */;


--
-- Definition of table `ventas_referencias`
--

DROP TABLE IF EXISTS `ventas_referencias`;
CREATE TABLE `ventas_referencias` (
  `id_venta` int(11) NOT NULL,
  `id_referencia` int(11) NOT NULL,
  `id_motivo` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_ventas_referencias_ventas2_idx` (`id_referencia`),
  KEY `fk_ventas_referencias_motivo_documento1_idx` (`id_motivo`),
  CONSTRAINT `fk_ventas_referencias_motivo_documento1` FOREIGN KEY (`id_motivo`) REFERENCES `motivo_documento` (`id_motivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_referencias_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_referencias_ventas2` FOREIGN KEY (`id_referencia`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ventas_referencias`
--

/*!40000 ALTER TABLE `ventas_referencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_referencias` ENABLE KEYS */;


--
-- Definition of table `ventas_servicios`
--

DROP TABLE IF EXISTS `ventas_servicios`;
CREATE TABLE `ventas_servicios` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `descripcion` varchar(245) NOT NULL,
  `monto` double(8,2) NOT NULL,
  `cantidad` double(9,2) NOT NULL,
  `codsunat` varchar(20) NOT NULL,
  PRIMARY KEY (`id_venta`,`id_item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ventas_servicios`
--

/*!40000 ALTER TABLE `ventas_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_servicios` ENABLE KEYS */;


--
-- Definition of table `ventas_sunat`
--

DROP TABLE IF EXISTS `ventas_sunat`;
CREATE TABLE `ventas_sunat` (
  `id_venta` int(11) NOT NULL,
  `hash` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_xml` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `qr_data` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  CONSTRAINT `fk_ventas_sunat_ventas1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ventas_sunat`
--

/*!40000 ALTER TABLE `ventas_sunat` DISABLE KEYS */;
INSERT INTO `ventas_sunat` (`id_venta`,`hash`,`nombre_xml`,`qr_data`) VALUES 
 (17256,'-','-','-'),
 (17261,'-','-','-'),
 (17263,'-','-','-'),
 (17264,'-','-','-'),
 (17265,'-','-','-'),
 (17266,'-','-','-'),
 (17268,'-','-','-'),
 (17269,'-','-','-');
/*!40000 ALTER TABLE `ventas_sunat` ENABLE KEYS */;


--
-- Definition of procedure `CargarProductos`
--

DROP PROCEDURE IF EXISTS `CargarProductos`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`200.8.17.82` PROCEDURE `CargarProductos`()
BEGIN
	DECLARE pstock, busca,codmarca, filtrar INT;
	DECLARE catid,subtid,codpro, marcacod, ncarat VARCHAR(10);
	DECLARE producto, pmarca VARCHAR(250);
	DECLARE pprecio, pcosto DECIMAL(14,2);
	DECLARE done INT DEFAULT FALSE;
	DECLARE id_record CURSOR FOR SELECT cat_id, sub_cat, TRIM(nombre) AS product,TRIM(marca) AS mmarca, cod_pro, preciopro, stock, precio_oferta FROM zz_producto;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	   OPEN id_record;
		id_loop:LOOP 
		FETCH id_record INTO catid, subtid, producto, pmarca, codpro, pprecio, pstock, pcosto;
		SELECT COUNT(marca_id) INTO  busca FROM marcra_productos WHERE nombre_marca = pmarca;
		
		IF (busca  = 0) THEN 
			SELECT cod_marca INTO codmarca FROM marcra_productos ORDER BY cod_marca DESC LIMIT 1;
			SET codmarca = codmarca + 1;
			INSERT INTO marcra_productos VALUES (0,pmarca,codmarca,0);
			END IF;
		
		SELECT COUNT(prod_id) INTO  filtrar FROM producto WHERE nombre = producto;	
		IF(filtrar =0) THEN 
		SELECT cod_marca INTO  marcacod FROM marcra_productos WHERE nombre_marca = pmarca;
		
		INSERT INTO producto VALUES (0,catid,subtid,producto,'','','',marcacod,codpro,'','',pprecio,pstock,'',1,0,'',1);
		
		SELECT LENGTH(subtid) INTO ncarat;
		IF(ncarat = 1) THEN SET ncarat = CONCAT('00',ncarat); END IF;
		IF(ncarat = 2) THEN SET ncarat = CONCAT('0',ncarat); END IF;
		
		INSERT INTO sopprod VALUES (codpro,'01','000','001','','','',producto,'001','UND','1',pcosto,pstock,'0000-00-00',0,'','0000-00-00',1,1,1,'',0,0,3,'','','','','','','','','','','','','','','',0,0,0,0,0,0,'',0,NOW(),0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,'');
		
	
		
		INSERT INTO precios VALUES (codpro,1,1,0,'0000-00-00',pprecio,pprecio,pprecio,pprecio,0,0,pcosto,0,0,0,0,0,0,0,0,0);
		
		
		
		
		
		END IF;		
		
		IF done THEN LEAVE id_loop; END IF;
		END LOOP id_loop;
		CLOSE id_record;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `view_balance`
--

DROP TABLE IF EXISTS `view_balance`;
DROP VIEW IF EXISTS `view_balance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_balance` AS select `e`.`descripcion` AS `producto`,date_format(`a`.`fecha_emision`,'%W') AS `comprobante_dia`,`a`.`fecha_emision` AS `comprobante_fecha`,`b`.`cod_sunat` AS `comprobante_tipo`,`a`.`serie` AS `comprobante_serie`,`a`.`numero` AS `comprobante_numero`,'---' AS `filler1`,'salida' AS `venta_operacion`,'' AS `venta_destino`,`c`.`datos` AS `venta_empresa`,'----' AS `filler2`,'' AS `entradas_cantidad`,'' AS `entradas_costo_unitario`,'' AS `entradas_costo_total`,'-----' AS `filler3`,`d`.`cantidad` AS `salidas_cantidad`,`d`.`costo` AS `salidas_costo_unitario`,(`d`.`cantidad` * `d`.`costo`) AS `salidas_costo_total`,'-------' AS `-------`,`d`.`cantidad` AS `final_cantidad`,`d`.`precio` AS `final_costo_unitario`,(`d`.`cantidad` * `d`.`precio`) AS `final_costo_total`,'---------' AS `filler5`,`e`.`id_empresa` AS `id_empresa`,`e`.`sucursal` AS `sucursal`,`e`.`estado` AS `estado`,`e`.`almacen` AS `almacen`,`e`.`id_producto` AS `id_producto` from ((((`ventas` `a` left join `documentos_sunat` `b` on((`b`.`id_tido` = `a`.`id_tido`))) left join `clientes` `c` on((`c`.`id_cliente` = `a`.`id_cliente`))) left join `productos_ventas` `d` on((`d`.`id_venta` = `a`.`id_venta`))) left join `productos` `e` on((`e`.`id_producto` = `d`.`id_producto`))) where (`d`.`id_venta` is not null) union select `b`.`descripcion` AS `producto`,date_format(`c`.`fecha_emision`,'%W') AS `comprobante_dia`,`c`.`fecha_emision` AS `comprobante_fecha`,`d`.`cod_sunat` AS `comprobante_tipo`,`c`.`serie` AS `comprobante_serie`,`c`.`numero` AS `comprobante_numero`,'---' AS `filler1`,'compra' AS `kardex_operacion`,'almacen' AS `kardex_destino`,`e`.`razon_social` AS `kardex_empresa`,'----' AS `filler2`,`a`.`cantidad` AS `entradas_cantidad`,`a`.`precio` AS `entradas_costo_unitario`,(`a`.`cantidad` * `a`.`precio`) AS `entradas_costo_total`,'-----' AS `filler3`,'' AS `salidas_cantidad`,'' AS `salidas_costo_unitario`,'' AS `salidas_costo_total`,'-------' AS `filler4`,`b`.`cantidad` AS `final_cantidad`,`b`.`precio_unidad` AS `final_costo_unitario`,(`a`.`cantidad` * `b`.`precio_unidad`) AS `final_costo_total`,'---------' AS `filler5`,`b`.`id_empresa` AS `id_empresa`,`b`.`sucursal` AS `sucursal`,`b`.`estado` AS `estado`,`b`.`almacen` AS `almacen`,`b`.`id_producto` AS `id_producto` from ((((`productos_compras` `a` left join `productos` `b` on((`b`.`id_producto` = `a`.`id_producto`))) left join `compras` `c` on((`c`.`id_compra` = `a`.`id_compra`))) left join `documentos_sunat` `d` on((`d`.`id_tido` = `c`.`id_tido`))) left join `proveedores` `e` on((`e`.`proveedor_id` = `c`.`id_proveedor`)));

--
-- Definition of view `view_compras_balance`
--

DROP TABLE IF EXISTS `view_compras_balance`;
DROP VIEW IF EXISTS `view_compras_balance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_compras_balance` AS select `b`.`descripcion` AS `producto`,date_format(`c`.`fecha_emision`,'%W') AS `comprobante_dia`,`c`.`fecha_emision` AS `comprobante_fecha`,`d`.`cod_sunat` AS `comprobante_tipo`,`c`.`serie` AS `comprobante_serie`,`c`.`numero` AS `comprobante_numero`,'---' AS `---`,'compra' AS `kardex_operacion`,'almacen' AS `kardex_destino`,`e`.`razon_social` AS `kardex_empresa`,'----' AS `----`,`a`.`cantidad` AS `entradas_cantidad`,`a`.`precio` AS `entradas_costo_unitario`,(`a`.`cantidad` * `a`.`precio`) AS `entradas_costo_total`,'-----' AS `-----`,'' AS `salidas_cantidad`,'' AS `salidas_costo_unitario`,'' AS `salidas_costo_total`,'-------' AS `-------`,`b`.`cantidad` AS `final_cantidad`,`b`.`precio_unidad` AS `final_costo_unitario`,(`a`.`cantidad` * `b`.`precio_unidad`) AS `final_costo_total`,'---------' AS `---------`,`b`.`id_empresa` AS `id_empresa`,`b`.`sucursal` AS `sucursal`,`b`.`estado` AS `estado`,`b`.`almacen` AS `almacen`,`b`.`id_producto` AS `id_producto` from ((((`productos_compras` `a` left join `productos` `b` on((`b`.`id_producto` = `a`.`id_producto`))) left join `compras` `c` on((`c`.`id_compra` = `a`.`id_compra`))) left join `documentos_sunat` `d` on((`d`.`id_tido` = `c`.`id_tido`))) left join `proveedores` `e` on((`e`.`proveedor_id` = `c`.`id_proveedor`)));

--
-- Definition of view `view_cotizaciones`
--

DROP TABLE IF EXISTS `view_cotizaciones`;
DROP VIEW IF EXISTS `view_cotizaciones`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`179.6.100.213` SQL SECURITY DEFINER VIEW `view_cotizaciones` AS (select `v`.`cotizacion_id` AS `cotizacion_id`,`v`.`numero` AS `numero`,`v`.`fecha` AS `fecha`,`v`.`moneda` AS `moneda`,`v`.`cm_tc` AS `cm_tc`,`v`.`id_tido` AS `id_tido`,concat(`c`.`documento`,' | ',`c`.`datos`) AS `documento`,`c`.`datos` AS `datos`,`v`.`total` AS `total`,`v`.`estado` AS `estado`,`u`.`usuario` AS `vendedor`,`v`.`id_usuario` AS `usuario` from (((`cotizaciones` `v` left join `documentos_sunat` `ds` on((`v`.`id_tido` = `ds`.`id_tido`))) left join `clientes` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) left join `usuarios` `u` on((`u`.`usuario_id` = `v`.`id_usuario`))) where ((`v`.`id_empresa` = '12') and (`v`.`sucursal` = '1') and (`v`.`estado` <> '2')) order by `v`.`fecha` desc);

--
-- Definition of view `view_productos_1`
--

DROP TABLE IF EXISTS `view_productos_1`;
DROP VIEW IF EXISTS `view_productos_1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`179.6.100.179` SQL SECURITY DEFINER VIEW `view_productos_1` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`cod_barra` AS `cod_barra`,`productos`.`descripcion` AS `descripcion`,`productos`.`precio` AS `precio`,`productos`.`costo` AS `costo`,`productos`.`cantidad` AS `cantidad`,`productos`.`iscbp` AS `iscbp`,`productos`.`id_empresa` AS `id_empresa`,`productos`.`sucursal` AS `sucursal`,`productos`.`ultima_salida` AS `ultima_salida`,`productos`.`codsunat` AS `codsunat`,`productos`.`usar_barra` AS `usar_barra`,`productos`.`precio_mayor` AS `precio_mayor`,`productos`.`precio_menor` AS `precio_menor`,`productos`.`razon_social` AS `razon_social`,`productos`.`ruc` AS `ruc`,`productos`.`estado` AS `estado`,`productos`.`almacen` AS `almacen`,`productos`.`precio2` AS `precio2`,`productos`.`precio3` AS `precio3`,`productos`.`precio4` AS `precio4`,`productos`.`precio_unidad` AS `precio_unidad`,`productos`.`codigo` AS `codigo`,`productos`.`serie_producto` AS `serie_producto`,`productos_categorias`.`nombre` AS `categoria` from (`productos` left join `productos_categorias` on((`productos`.`codsunat` = `productos_categorias`.`id_categoria`))) where ((`productos`.`id_empresa` = 12) and (`productos`.`sucursal` = '1') and (`productos`.`estado` = '1') and (`productos`.`almacen` = '1')) order by `productos`.`id_producto` desc;

--
-- Definition of view `view_productos_2`
--

DROP TABLE IF EXISTS `view_productos_2`;
DROP VIEW IF EXISTS `view_productos_2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`179.6.100.179` SQL SECURITY DEFINER VIEW `view_productos_2` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`cod_barra` AS `cod_barra`,`productos`.`descripcion` AS `descripcion`,`productos`.`precio` AS `precio`,`productos`.`costo` AS `costo`,`productos`.`cantidad` AS `cantidad`,`productos`.`iscbp` AS `iscbp`,`productos`.`id_empresa` AS `id_empresa`,`productos`.`sucursal` AS `sucursal`,`productos`.`ultima_salida` AS `ultima_salida`,`productos`.`codsunat` AS `codsunat`,`productos`.`usar_barra` AS `usar_barra`,`productos`.`precio_mayor` AS `precio_mayor`,`productos`.`precio_menor` AS `precio_menor`,`productos`.`razon_social` AS `razon_social`,`productos`.`ruc` AS `ruc`,`productos`.`estado` AS `estado`,`productos`.`almacen` AS `almacen`,`productos`.`precio2` AS `precio2`,`productos`.`precio3` AS `precio3`,`productos`.`precio4` AS `precio4`,`productos`.`precio_unidad` AS `precio_unidad`,`productos`.`codigo` AS `codigo`,`productos`.`serie_producto` AS `serie_producto` from `productos` where ((`productos`.`id_empresa` = 12) and (`productos`.`sucursal` = '1') and (`productos`.`estado` = '1') and (`productos`.`almacen` = '2')) order by `productos`.`id_producto` desc;

--
-- Definition of view `view_ventas`
--

DROP TABLE IF EXISTS `view_ventas`;
DROP VIEW IF EXISTS `view_ventas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`179.6.100.213` SQL SECURITY DEFINER VIEW `view_ventas` AS select `v`.`id_venta` AS `cod_v`,concat(`ds`.`abreviatura`,' | ',`v`.`serie`,' - ',`v`.`numero`) AS `sn_v`,concat(`c`.`documento`,' | ',`c`.`datos`) AS `datos_cl`,concat(if((`v`.`moneda` = 1),'S/ ','$ '),if((`v`.`apli_igv` = '1'),(`v`.`total` / (`v`.`igv` + 1)),`v`.`total`)) AS `subtotal`,concat(if((`v`.`moneda` = 1),'S/ ','$ '),if((`v`.`apli_igv` = '1'),((`v`.`total` / (`v`.`igv` + 1)) * `v`.`igv`),0)) AS `igv_v`,concat(`v`.`enviado_sunat`,'-',`v`.`id_tido`,'-',`v`.`id_venta`) AS `doc_ventae`,concat(`v`.`id_venta`,'--',`vs`.`nombre_xml`) AS `id_venta`,`v`.`fecha_emision` AS `fecha_emision`,`ds`.`abreviatura` AS `abreviatura`,`v`.`apli_igv` AS `apli_igv`,`v`.`igv` AS `igv`,`v`.`id_tido` AS `id_tido`,`v`.`serie` AS `serie`,`v`.`numero` AS `numero`,`c`.`documento` AS `documento`,`c`.`datos` AS `datos`,concat(if((`v`.`moneda` = 1),'S/ ','$ '),`v`.`total`) AS `total`,`v`.`estado` AS `estado`,`v`.`enviado_sunat` AS `enviado_sunat`,`vs`.`nombre_xml` AS `nombre_xml` from (((`ventas` `v` left join `documentos_sunat` `ds` on((`v`.`id_tido` = `ds`.`id_tido`))) left join `clientes` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) left join `ventas_sunat` `vs` on((`v`.`id_venta` = `vs`.`id_venta`))) where ((`v`.`id_empresa` = '12') and (`v`.`sucursal` = '1') and (`v`.`id_tido` <> 1)) order by `v`.`fecha_emision`,`v`.`numero`;

--
-- Definition of view `view_ventas_balance`
--

DROP TABLE IF EXISTS `view_ventas_balance`;
DROP VIEW IF EXISTS `view_ventas_balance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ventas_balance` AS select `e`.`descripcion` AS `producto`,date_format(`a`.`fecha_emision`,'%W') AS `comprobante_dia`,`a`.`fecha_emision` AS `comprobante_fecha`,`b`.`cod_sunat` AS `comprobante_tipo`,`a`.`serie` AS `comprobante_serie`,`a`.`numero` AS `comprobante_numero`,'---' AS `---`,'salida' AS `venta_operacion`,'' AS `venta_destino`,`c`.`datos` AS `venta_empresa`,'----' AS `----`,'' AS `entradas_cantidad`,'' AS `entradas_costo_unitario`,'' AS `entradas_costo_total`,'-----' AS `-----`,`d`.`cantidad` AS `salidas_cantidad`,`d`.`costo` AS `salidas_costo_unitario`,(`d`.`cantidad` * `d`.`costo`) AS `salidas_costo_total`,'-------' AS `-------`,`d`.`cantidad` AS `final_cantidad`,`d`.`precio` AS `final_costo_unitario`,(`d`.`cantidad` * `d`.`precio`) AS `final_costo_total`,'---------' AS `---------`,`e`.`id_empresa` AS `id_empresa`,`e`.`sucursal` AS `sucursal`,`e`.`estado` AS `estado`,`e`.`almacen` AS `almacen`,`e`.`id_producto` AS `id_producto`,`a`.`estado` AS `aaa` from ((((`ventas` `a` left join `documentos_sunat` `b` on((`b`.`id_tido` = `a`.`id_tido`))) left join `clientes` `c` on((`c`.`id_cliente` = `a`.`id_cliente`))) left join `productos_ventas` `d` on((`d`.`id_venta` = `a`.`id_venta`))) left join `productos` `e` on((`e`.`id_producto` = `d`.`id_producto`))) where (`d`.`id_venta` is not null);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
