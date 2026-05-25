-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.29-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema compuvision
--

CREATE DATABASE IF NOT EXISTS compuvision;
USE compuvision;

--
-- Temporary table structure for view `view_lista_productos`
--
DROP TABLE IF EXISTS `view_lista_productos`;
DROP VIEW IF EXISTS `view_lista_productos`;
CREATE TABLE `view_lista_productos` (
  `prod_id` int(11),
  `categoria` char(20),
  `sub_cat` int(11),
  `sub_catOTRO` char(20),
  `nombre` text,
  `content1` varchar(200),
  `content2` varchar(200),
  `content3` varchar(200),
  `marca` char(5),
  `prod_cod` varchar(200),
  `descripcion` text,
  `caracteristicas` text,
  `precio_prod` double(10,2),
  `stock_prod` int(11),
  `tipo_pro` char(1),
  `estado` char(1),
  `garantia` varchar(200),
  `precio_oferta` double(10,2),
  `nombre_cate` varchar(100),
  `etiqueta` varchar(200)
);

--
-- Definition of table `ajuscos`
--

DROP TABLE IF EXISTS `ajuscos`;
CREATE TABLE `ajuscos` (
  `cod_docu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento de Transaccion',
  `numtrans` char(11) NOT NULL DEFAULT '' COMMENT 'Nro de Transaccion',
  `fecha` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Transaccion',
  `cod_trans` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Transportista',
  `cod_condi` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Condicion',
  `suc_salida` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal de Salida',
  `alma_salida` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen de Salida',
  `id_salida` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal de Salida SYS(2015) VFP',
  `suc_ingreso` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal Ingreso',
  `alma_ingreso` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen Ingreso',
  `id_ingreso` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal de Ingreso SYS(2015) VFP',
  PRIMARY KEY (`suc_salida`,`cod_docu`,`numtrans`) USING BTREE,
  KEY `fecha` (`fecha`) USING BTREE,
  KEY `id_ingreso` (`id_ingreso`) USING BTREE,
  KEY `id_salida` (`id_salida`) USING BTREE,
  KEY `cod_trans` (`cod_trans`) USING BTREE,
  KEY `cod_condi` (`cod_condi`) USING BTREE,
  CONSTRAINT `FK_AJUSCOS_ESTADO` FOREIGN KEY (`cod_condi`) REFERENCES `estado` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_AJUSCOS_MOVIMIEN_INGRESOS` FOREIGN KEY (`id_ingreso`) REFERENCES `movimien` (`mov_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_AJUSCOS_MOVIMIEN_SALIDAS` FOREIGN KEY (`id_salida`) REFERENCES `movimien` (`mov_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_AJUSCOS_TRANSPTE` FOREIGN KEY (`cod_trans`) REFERENCES `transpte` (`codtrans`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ajuscos`
--

/*!40000 ALTER TABLE `ajuscos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajuscos` ENABLE KEYS */;


--
-- Definition of table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen` (
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `cod_alma` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `des_alma` varchar(40) NOT NULL DEFAULT '' COMMENT 'Descripcion de Almacen',
  `telefono` varchar(25) NOT NULL DEFAULT '' COMMENT 'Telefono(S)',
  `ubigeo` varchar(15) NOT NULL COMMENT 'ID de Ubigeo',
  `direccion` varchar(150) NOT NULL COMMENT 'Direccion',
  `v_tipo` varchar(6) NOT NULL DEFAULT '' COMMENT 'Via Tipo',
  `v_nombre` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Nombre',
  `v_numero` varchar(10) NOT NULL DEFAULT '' COMMENT 'Via Numero',
  `v_interior` varchar(10) NOT NULL DEFAULT '' COMMENT 'Via Interior',
  `v_zona` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Zona',
  `v_distrito` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Distrito',
  `v_provincia` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Provincia',
  `v_depart` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Departamento',
  `series_ts` varchar(100) NOT NULL DEFAULT '' COMMENT 'Nro de Series Permitidas',
  `cod_sunat` char(7) NOT NULL DEFAULT '' COMMENT 'ID Sunat Establecimiento',
  `vta_exonera` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Ventas Exoneradas',
  PRIMARY KEY (`cod_alma`) USING BTREE,
  KEY `cod_suc` (`cod_suc`) USING BTREE,
  KEY `nom_alma` (`des_alma`) USING BTREE,
  CONSTRAINT `FK_ALMACEN_SUCURSAL` FOREIGN KEY (`cod_suc`) REFERENCES `sucursal` (`cod_suc`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `almacen`
--

/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` (`cod_suc`,`cod_alma`,`des_alma`,`telefono`,`ubigeo`,`direccion`,`v_tipo`,`v_nombre`,`v_numero`,`v_interior`,`v_zona`,`v_distrito`,`v_provincia`,`v_depart`,`series_ts`,`cod_sunat`,`vta_exonera`) VALUES 
 ('1','109','ALMACEN GENERAL','','','','','','','','','','','','','',0x00);
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;


--
-- Definition of table `aplica`
--

DROP TABLE IF EXISTS `aplica`;
CREATE TABLE `aplica` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `id_parent` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal ( Documento Padre )',
  `tipo` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo ( Documento Padre )',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal ( Documento Padre )',
  `cod_docu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento ( Documento Padre )',
  `num_docu` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento ( Documento Padre )',
  `cod_auxi` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Cliente o Proveedor ( Documento Padre )',
  `id_child` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal ( Referencia )',
  `tipo_pedido` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo ( Referencia )',
  `suc_pedido` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal ( Referencia )',
  `id_pedido` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento ( Referencia )',
  `cod_pedido` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento ( Referencia )',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `id_child` (`id_child`) USING BTREE,
  KEY `id_parent` (`id_parent`) USING BTREE,
  KEY `aplica` (`id_parent`,`id_child`) USING BTREE,
  CONSTRAINT `FK_APLICA_MOVIMIEN` FOREIGN KEY (`id_parent`) REFERENCES `movimien` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `aplica`
--

/*!40000 ALTER TABLE `aplica` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplica` ENABLE KEYS */;


--
-- Definition of table `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `codarea` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Area',
  `desarea` varchar(20) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  PRIMARY KEY (`codarea`) USING BTREE,
  KEY `desarea` (`desarea`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `areas`
--

/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;


--
-- Definition of table `audita`
--

DROP TABLE IF EXISTS `audita`;
CREATE TABLE `audita` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Unico SYS(2015) VFP',
  `usuario` char(6) DEFAULT '' COMMENT 'ID de Usuario',
  `terminal` char(25) DEFAULT '' COMMENT 'Descripcion de Terminal',
  `fecha_hora` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'Fecha y Hora del Terminal',
  `accion` varchar(100) DEFAULT '' COMMENT 'Accion realizada',
  `fecha_hora_server` timestamp NULL DEFAULT current_timestamp() COMMENT 'Fecha hora del Servidor',
  PRIMARY KEY (`unico`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `audita`
--

/*!40000 ALTER TABLE `audita` DISABLE KEYS */;
/*!40000 ALTER TABLE `audita` ENABLE KEYS */;


--
-- Definition of table `auxiliar`
--

DROP TABLE IF EXISTS `auxiliar`;
CREATE TABLE `auxiliar` (
  `tip_auxi` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo de Auxiliar',
  `cod_auxi` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Auxiiar',
  `nom_auxi` varchar(150) NOT NULL DEFAULT '' COMMENT 'Nombre o Razon Social',
  `nom_contac` varchar(50) NOT NULL DEFAULT '' COMMENT 'Nombre de Contacto',
  `car_contac` varchar(35) NOT NULL DEFAULT '' COMMENT 'Cargo de Contacto',
  `dir_auxi` varchar(150) NOT NULL DEFAULT '' COMMENT 'Direccion Principal',
  `dir_entre` varchar(150) NOT NULL DEFAULT '' COMMENT 'Direccion Secundaria',
  `tel_auxi` varchar(50) NOT NULL DEFAULT '' COMMENT 'Telefono(S)',
  `fax_auxi` varchar(50) NOT NULL DEFAULT '' COMMENT 'Fax(S)',
  `doc_tipo` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Auxiliar segun SUNAT',
  `ruc_auxi` varchar(11) NOT NULL DEFAULT '' COMMENT 'Nro de RUC',
  `doc_auxi` varchar(20) NOT NULL DEFAULT '' COMMENT 'Nro de Documento',
  `est_auxi` char(10) NOT NULL DEFAULT '' COMMENT 'Estado Civil',
  `hijos_auxi` decimal(2,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Hijos',
  `sexo_auxi` char(1) NOT NULL DEFAULT '' COMMENT 'Sexo',
  `fnac_auxi` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Nacimiento',
  `cod_di` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento de Identidad',
  `cre_moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Limite de Credito',
  `max_credi` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Importe Maximo de Limite de Credito',
  `util_credi` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Importe Utilizado de Limite de Credito',
  `fec_credi` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Limite de Credito',
  `nom_aval` varchar(50) NOT NULL DEFAULT '' COMMENT 'Nombre o Razon social de Aval',
  `ruc_aval` varchar(11) NOT NULL DEFAULT '' COMMENT 'Nro de RUC de Aval',
  `dir_aval` varchar(85) NOT NULL DEFAULT '' COMMENT 'Direccion de Aval',
  `tel_aval` varchar(35) NOT NULL DEFAULT '' COMMENT 'Telefono de Aval',
  `fax_aval` varchar(50) NOT NULL DEFAULT '' COMMENT 'Fax de Aval',
  `doc_aval` varchar(10) NOT NULL DEFAULT '' COMMENT 'Nro Documento de Aval',
  `cod_zona` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Zona',
  `tip_clasi` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Clasificacion',
  `cta1` char(15) NOT NULL DEFAULT '' COMMENT 'Cta FA/BV Soles',
  `cta2` char(15) NOT NULL DEFAULT '' COMMENT 'Cta FA/BV Dolares',
  `codvend` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Vendedor',
  `condicion` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Condicion',
  `aux_qcont` char(6) NOT NULL DEFAULT '' COMMENT 'ID en S@ftcont - Contabilidad',
  `website` varchar(200) NOT NULL DEFAULT '' COMMENT 'Web Site',
  `email` varchar(200) NOT NULL DEFAULT '' COMMENT 'Email',
  `visita` char(10) NOT NULL DEFAULT '' COMMENT 'Dias de Visita',
  `notas` varchar(250) NOT NULL DEFAULT '' COMMENT 'Observaciones',
  `notas2` varchar(250) NOT NULL DEFAULT '' COMMENT 'Observaciones 2',
  `v_tipo` varchar(6) NOT NULL DEFAULT '' COMMENT 'Via Tipo',
  `v_nombre` varchar(30) NOT NULL DEFAULT '' COMMENT 'Via Nombre',
  `v_numero` varchar(10) NOT NULL DEFAULT '' COMMENT 'Via Numero',
  `v_interior` varchar(10) NOT NULL DEFAULT '' COMMENT 'Via Interior',
  `v_zona` varchar(15) NOT NULL DEFAULT '' COMMENT 'Via Zona',
  `v_distrito` varchar(15) NOT NULL DEFAULT '' COMMENT 'Via Distrito',
  `v_provincia` varchar(15) NOT NULL DEFAULT '' COMMENT 'Via Provincia',
  `v_depart` varchar(15) NOT NULL DEFAULT '' COMMENT 'Via Departamento',
  `cta3` char(15) NOT NULL DEFAULT '' COMMENT 'Cta LETRAS Soles',
  `cta4` char(15) NOT NULL DEFAULT '' COMMENT 'Cta LETRAS Dolares',
  `fec_llama` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Proxima llamada',
  `asunto` varchar(250) NOT NULL DEFAULT '' COMMENT 'Asunto pendiente de llamada',
  `flg_percep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag si Auxiliar es Agente de Percepcion',
  `flg_reten` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag si Auxiliar es Agente de Retencion',
  `por_reten` decimal(5,0) NOT NULL DEFAULT 0 COMMENT 'Porcentaje de Retencion',
  `flg_baja` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Baja',
  `fec_baja` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Baja',
  `dias_cred` decimal(5,0) NOT NULL DEFAULT 0 COMMENT 'Dias maximo de Credito',
  `tipo_auxi` decimal(1,0) NOT NULL DEFAULT 1 COMMENT 'Tipo de Auxiliar',
  `ult_edicion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y Hora de ultima edicion',
  `ptosbonus` decimal(5,0) NOT NULL DEFAULT 0 COMMENT 'Record de Ptos. Bonus',
  `canje_bonus` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha del ultimo canje',
  `id_pais` varchar(10) NOT NULL DEFAULT '' COMMENT 'Id de Pais',
  `cta_detrac` varchar(30) NOT NULL DEFAULT '' COMMENT 'Cta detraccion',
  PRIMARY KEY (`cod_auxi`) USING BTREE,
  KEY `cod_di` (`cod_di`) USING BTREE,
  KEY `dir_auxi` (`dir_auxi`) USING BTREE,
  KEY `fec_llama` (`fec_llama`) USING BTREE,
  KEY `nom_auxi` (`nom_auxi`) USING BTREE,
  KEY `num_di` (`doc_auxi`) USING BTREE,
  KEY `num_ruc` (`ruc_auxi`) USING BTREE,
  KEY `tip_clasi` (`tip_clasi`) USING BTREE,
  KEY `tel_auxi` (`tel_auxi`) USING BTREE,
  KEY `cod_zona` (`cod_zona`) USING BTREE,
  CONSTRAINT `FK_AUXILIAR_IDENTIDAD` FOREIGN KEY (`cod_di`) REFERENCES `identida` (`cod_di`) ON UPDATE CASCADE,
  CONSTRAINT `FK_AUXILIAR_TIPCLASI` FOREIGN KEY (`tip_clasi`) REFERENCES `tipclasi` (`tip_clasi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_AUXILIAR_ZONAS` FOREIGN KEY (`cod_zona`) REFERENCES `zonas` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `auxiliar`
--

/*!40000 ALTER TABLE `auxiliar` DISABLE KEYS */;
/*!40000 ALTER TABLE `auxiliar` ENABLE KEYS */;


--
-- Definition of table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE `bancos` (
  `codigo` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Banco',
  `descrip` varchar(30) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `dim` char(6) NOT NULL DEFAULT '' COMMENT 'Diminutivo',
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `descrip` (`descrip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `bancos`
--

/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` (`codigo`,`descrip`,`dim`) VALUES 
 ('01','CENTRAL RESERVA DEL PERU',''),
 ('02','DE CREDITO DEL PERU',''),
 ('03','INTERNACIONAL DEL PERU',''),
 ('05','INTERBANK',''),
 ('07','CITIBANK DEL PERU S.A.',''),
 ('08','STANDARD CHARTERED',''),
 ('09','SCOTIABANK PERU',''),
 ('11','CONTINENTAL',''),
 ('12','DE LIMA',''),
 ('16','MERCANTIL',''),
 ('18','NACION',''),
 ('22','SANTANDER CENTRAL HISPANO',''),
 ('23','DE COMERCIO',''),
 ('25','REPUBLICA',''),
 ('26','NBK BANK',''),
 ('29','BANCOSUR',''),
 ('35','FINANCIERO DEL PERU',''),
 ('37','DEL PROGRESO',''),
 ('38','INTERAMERICANO FINANZAS',''),
 ('39','BANEX',''),
 ('40','NUEVO MUNDO',''),
 ('41','SUDAMERICANO',''),
 ('42','DEL LIBERTADOR',''),
 ('43','DEL TRABAJO',''),
 ('44','SOLVENTA',''),
 ('45','SERBANCO SA.',''),
 ('46','BANK OF BOSTON',''),
 ('47','ORION',''),
 ('48','DEL PAIS',''),
 ('49','MI BANCO',''),
 ('50','BNP PARIBAS',''),
 ('53','HSBC BANK PERU S.A.',''),
 ('99','OTROS','');
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;


--
-- Definition of table `bancos_detalles`
--

DROP TABLE IF EXISTS `bancos_detalles`;
CREATE TABLE `bancos_detalles` (
  `id_det` int(11) NOT NULL AUTO_INCREMENT,
  `det_soles` varchar(50) DEFAULT NULL,
  `det_dolares` varchar(50) DEFAULT 'INTERNA',
  `det_banco` char(150) DEFAULT '00',
  `det_logo` text DEFAULT NULL,
  PRIMARY KEY (`id_det`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bancos_detalles`
--

/*!40000 ALTER TABLE `bancos_detalles` DISABLE KEYS */;
INSERT INTO `bancos_detalles` (`id_det`,`det_soles`,`det_dolares`,`det_banco`,`det_logo`) VALUES 
 (1,'20005405834019','00220010540583401947','BCP',NULL),
 (3,'12313131313','123123131','InterBank',NULL);
/*!40000 ALTER TABLE `bancos_detalles` ENABLE KEYS */;


--
-- Definition of table `canjecta`
--

DROP TABLE IF EXISTS `canjecta`;
CREATE TABLE `canjecta` (
  `id_canje` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `tipo` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Canje',
  `numcanje` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Canje',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `cod_auxi` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Auxiliar',
  `fec_opera` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Canje',
  `cod_resp` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Responsable',
  `cod_condi` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Condicion',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Moneda',
  `tcambio` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Tipo de Cambio',
  `id_doc` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal de Documento FA/BV',
  `cod_doc` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `num_doc` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento',
  `mone_doc` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Documento',
  `saldo_doc` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Saldo de Documento',
  PRIMARY KEY (`id_canje`) USING BTREE,
  KEY `id_doc` (`id_doc`) USING BTREE,
  KEY `numcanje` (`tipo`,`numcanje`) USING BTREE,
  KEY `cod_auxi` (`cod_auxi`) USING BTREE,
  KEY `cod_condi` (`cod_condi`) USING BTREE,
  KEY `cod_suc` (`cod_suc`) USING BTREE,
  KEY `cod_resp` (`cod_resp`) USING BTREE,
  CONSTRAINT `FK_CANJECTA_AUXILIAR` FOREIGN KEY (`cod_auxi`) REFERENCES `auxiliar` (`cod_auxi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CANJECTA_ESTADO` FOREIGN KEY (`cod_condi`) REFERENCES `estado` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CANJECTA_MOVIMIEN` FOREIGN KEY (`id_doc`) REFERENCES `movimien` (`mov_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CANJECTA_SUCURSAL` FOREIGN KEY (`cod_suc`) REFERENCES `sucursal` (`cod_suc`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CANJECTA_VENDEDOR` FOREIGN KEY (`cod_resp`) REFERENCES `vendedor` (`codvend`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `canjecta`
--

/*!40000 ALTER TABLE `canjecta` DISABLE KEYS */;
/*!40000 ALTER TABLE `canjecta` ENABLE KEYS */;


--
-- Definition of table `canjes`
--

DROP TABLE IF EXISTS `canjes`;
CREATE TABLE `canjes` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `id_parent` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal ( Documento Padre )',
  `tipo` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo ( Documento Padre )',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal ( Documento Padre )',
  `cod_docu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento ( Documento Padre )',
  `num_docu` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento ( Documento Padre )',
  `cod_auxi` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Cliente o Proveedor ( Documento Padre )',
  `id_child` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal ( Referencia )',
  `tipo_pedido` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo ( Referencia )',
  `suc_pedido` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal ( Referencia )',
  `id_pedido` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento ( Referencia )',
  `cod_pedido` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento ( Referencia )',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `id_child` (`id_child`) USING BTREE,
  KEY `id_parent` (`id_parent`) USING BTREE,
  KEY `canjes` (`id_parent`,`id_child`) USING BTREE,
  CONSTRAINT `FK_CANJES_MOVIMIEN` FOREIGN KEY (`id_parent`) REFERENCES `movimien` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `canjes`
--

/*!40000 ALTER TABLE `canjes` DISABLE KEYS */;
/*!40000 ALTER TABLE `canjes` ENABLE KEYS */;


--
-- Definition of table `carrito_compra`
--

DROP TABLE IF EXISTS `carrito_compra`;
CREATE TABLE `carrito_compra` (
  `carrito_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`carrito_id`) USING BTREE,
  KEY `usuario_id` (`usuario_id`) USING BTREE,
  KEY `prod_id` (`prod_id`) USING BTREE,
  CONSTRAINT `carrito_compra_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `carrito_compra`
--

/*!40000 ALTER TABLE `carrito_compra` DISABLE KEYS */;
INSERT INTO `carrito_compra` (`carrito_id`,`usuario_id`,`prod_id`,`cantidad`) VALUES 
 (1,1,5025,1);
/*!40000 ALTER TABLE `carrito_compra` ENABLE KEYS */;


--
-- Definition of table `clasi`
--

DROP TABLE IF EXISTS `clasi`;
CREATE TABLE `clasi` (
  `cod_clasi` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Bien o Servicio',
  `nom_clasi` varchar(130) NOT NULL DEFAULT '' COMMENT 'Descripcion del Bien o Servicio',
  PRIMARY KEY (`cod_clasi`,`nom_clasi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `clasi`
--

/*!40000 ALTER TABLE `clasi` DISABLE KEYS */;
INSERT INTO `clasi` (`cod_clasi`,`nom_clasi`) VALUES 
 ('1','MERCADERIA, MATERIA PRIMA, SUMINISTRO, ENVASES Y EMBALAJES'),
 ('2','ACTIVO FIJO'),
 ('3','OTROS ACTIVOS NO CONSIDERADOS EN LOS NUMERALES 1 Y 2'),
 ('4','GASTOS DE EDUCACION, RECREACION, SALUD, CULTURALES. REPRESENTACION, CAPACITACION, DE VIAJE, MANTENIMIENTO DE VEHICULO y DE PREMIOS'),
 ('5','OTROS GASTOS NO INCLUIDOS EN EL NUMERAL 4');
/*!40000 ALTER TABLE `clasi` ENABLE KEYS */;


--
-- Definition of table `comision`
--

DROP TABLE IF EXISTS `comision`;
CREATE TABLE `comision` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal - SYS(2015) VFP',
  `codvend` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Vendedor',
  `codigo` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto-Categoria-Subcategoria',
  `descrip` varchar(150) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `comitotal` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Comision Total',
  `comi1` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '% de Comision 1',
  `comi2` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '% de Comision 2',
  `comi3` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '% de Comision 3',
  PRIMARY KEY (`mov_id`) USING BTREE,
  KEY `codigo` (`codigo`) USING BTREE,
  KEY `comision` (`codvend`,`codigo`) USING BTREE,
  KEY `codvend` (`codvend`) USING BTREE,
  CONSTRAINT `FK_COMISION_VENDEDOR` FOREIGN KEY (`codvend`) REFERENCES `vendedor` (`codvend`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `comision`
--

/*!40000 ALTER TABLE `comision` DISABLE KEYS */;
INSERT INTO `comision` (`mov_id`,`codvend`,`codigo`,`descrip`,`comitotal`,`comi1`,`comi2`,`comi3`) VALUES 
 ('_6840IFF1C','000001','C005','TARJETA DE VIDEO','0.00','0.00','0.00','0.00');
/*!40000 ALTER TABLE `comision` ENABLE KEYS */;


--
-- Definition of table `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `nun_doc` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `notas` longtext DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `usuario_cambio_estado` int(11) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `distrito_id` int(11) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `tipo_pago` int(11) DEFAULT NULL,
  `tipo_envio` int(11) DEFAULT NULL,
  `distrito_opcional` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `detalle_pago` longtext DEFAULT NULL,
  `moneda_id` int(11) DEFAULT NULL,
  `costo_envio` double(6,2) DEFAULT NULL,
  `costo_flete` int(11) DEFAULT NULL,
  PRIMARY KEY (`compra_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `compras`
--

/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;


--
-- Definition of table `compras_detalles`
--

DROP TABLE IF EXISTS `compras_detalles`;
CREATE TABLE `compras_detalles` (
  `compra_detalle_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double(10,2) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`compra_detalle_id`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE,
  KEY `id_compra` (`id_compra`) USING BTREE,
  CONSTRAINT `compras_detalles_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`prod_id`),
  CONSTRAINT `compras_detalles_ibfk_2` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`compra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `compras_detalles`
--

/*!40000 ALTER TABLE `compras_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_detalles` ENABLE KEYS */;


--
-- Definition of table `costos`
--

DROP TABLE IF EXISTS `costos`;
CREATE TABLE `costos` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `costo1` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 1',
  `costo2` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 2',
  `costo3` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 3',
  `costo4` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 4',
  `costo5` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 5',
  `costo6` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 6',
  `costo7` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 7',
  `costo8` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 8',
  `costo9` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 9',
  `costo10` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 10',
  `costo11` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 11',
  `costo12` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 12',
  `costo13` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 13',
  `costo14` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 14',
  `costo15` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 15',
  `costo16` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 16',
  `costo17` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 17',
  `costo18` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 18',
  `costo19` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 19',
  `costo20` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional 20',
  `costo_doc1` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 1',
  `costo_doc2` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 2',
  `costo_doc3` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 3',
  `costo_doc4` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 4',
  `costo_doc5` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 5',
  `costo_doc6` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 6',
  `costo_doc7` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 7',
  `costo_doc8` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 8',
  `costo_doc9` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 9',
  `costo_doc10` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 10',
  `costo_doc11` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 11',
  `costo_doc12` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 12',
  `costo_doc13` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 13',
  `costo_doc14` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 14',
  `costo_doc15` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 15',
  `costo_doc16` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 16',
  `costo_doc17` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 17',
  `costo_doc18` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 18',
  `costo_doc19` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 19',
  `costo_doc20` varchar(15) NOT NULL DEFAULT '' COMMENT 'Documento de Costo 20',
  PRIMARY KEY (`mov_id`) USING BTREE,
  CONSTRAINT `FK_COSTOS_MOVIMIEN` FOREIGN KEY (`mov_id`) REFERENCES `movimien` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `costos`
--

/*!40000 ALTER TABLE `costos` DISABLE KEYS */;
/*!40000 ALTER TABLE `costos` ENABLE KEYS */;


--
-- Definition of table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
CREATE TABLE `cotizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie_cotizacion` varchar(100) DEFAULT '',
  `idusuario` int(11) DEFAULT NULL,
  `dni_ruc` varchar(20) DEFAULT '',
  `nombres` varchar(300) DEFAULT '',
  `direccion` varchar(300) DEFAULT '',
  `telefono` varchar(20) DEFAULT '',
  `telefono2` varchar(20) DEFAULT '',
  `email` varchar(30) DEFAULT '',
  `moneda` varchar(5) DEFAULT 'SOL',
  `idadmin` int(11) DEFAULT NULL,
  `notas` longtext DEFAULT NULL,
  `estado_cotizacion` int(11) DEFAULT 0,
  `total_items` int(11) DEFAULT 0,
  `tipo_cambio` float DEFAULT 0,
  `aplica_igv` int(11) DEFAULT 0,
  `-------------` varchar(20) DEFAULT '-------------',
  `total_comisiones` float DEFAULT 0,
  `total_comisiones_extra` float DEFAULT 0,
  `total_comisiones_ganancia` float DEFAULT 0,
  `total_pagar` float DEFAULT 0,
  `total_pagar_usd` float DEFAULT 0,
  `igv` float DEFAULT 0,
  `suma_pedido_soles` float DEFAULT 0,
  `suma_pedido_usd` float DEFAULT 0,
  `------------` varchar(20) DEFAULT '-------------',
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `cotizaciones`
--

/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;


--
-- Definition of table `cotizaciones_documento`
--

DROP TABLE IF EXISTS `cotizaciones_documento`;
CREATE TABLE `cotizaciones_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefijo` varchar(10) DEFAULT '',
  `serie` varchar(20) DEFAULT '',
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `cotizaciones_documento`
--

/*!40000 ALTER TABLE `cotizaciones_documento` DISABLE KEYS */;
INSERT INTO `cotizaciones_documento` (`id`,`prefijo`,`serie`,`estado`) VALUES 
 (2,'SUBACOM','0000077',1);
/*!40000 ALTER TABLE `cotizaciones_documento` ENABLE KEYS */;


--
-- Definition of table `cotizaciones_ganancia`
--

DROP TABLE IF EXISTS `cotizaciones_ganancia`;
CREATE TABLE `cotizaciones_ganancia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) DEFAULT NULL,
  `dni_ruc` varchar(20) DEFAULT '',
  `nombres` varchar(300) DEFAULT '',
  `direccion` varchar(300) DEFAULT '',
  `telefono` varchar(20) DEFAULT '',
  `telefono2` varchar(20) DEFAULT '',
  `moneda` varchar(5) DEFAULT 'SOL',
  `idadmin` int(11) DEFAULT NULL,
  `notas` longtext DEFAULT NULL,
  `estado_cotizacion` int(11) DEFAULT 0,
  `tags` varchar(500) DEFAULT '',
  `total_items` int(11) DEFAULT 0,
  `aplica_igv` int(11) DEFAULT 0,
  `subtotal` float DEFAULT 0,
  `igv` float DEFAULT 0,
  `total` float DEFAULT 0,
  `usd_subtotal` float DEFAULT 0,
  `usd_igv` float DEFAULT 0,
  `usd_total` float DEFAULT 0,
  `-------` varchar(10) DEFAULT '-------',
  `comision` float DEFAULT 0.2,
  `--------` varchar(10) DEFAULT '--------',
  `comision_subtotal` float DEFAULT 0,
  `comision_igv` float DEFAULT 0,
  `comision_total` float DEFAULT 0,
  `comision_usd_subtotal` float DEFAULT 0,
  `comision_usd_igv` float DEFAULT 0,
  `comision_usd_total` float DEFAULT 0,
  `---------` varchar(10) DEFAULT '---------',
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `cotizaciones_ganancia`
--

/*!40000 ALTER TABLE `cotizaciones_ganancia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizaciones_ganancia` ENABLE KEYS */;


--
-- Definition of table `cotizaciones_items`
--

DROP TABLE IF EXISTS `cotizaciones_items`;
CREATE TABLE `cotizaciones_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcotizacion` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `mi_comision` float DEFAULT 0,
  `mi_comision_extra` float DEFAULT 0,
  `mi_ganancia` float DEFAULT 0,
  `comicion` float DEFAULT 0,
  `produc_precio` float DEFAULT 0,
  `produc_total_venta` float DEFAULT 0,
  `igv` float DEFAULT 0,
  `otro_produc_precio` float DEFAULT 0,
  `otro_produc_total_venta` float DEFAULT 0,
  `fecha_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idproducto` (`idproducto`),
  KEY `cotizaciones_items_ibfk_1` (`idcotizacion`),
  CONSTRAINT `cotizaciones_items_ibfk_1` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizaciones` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cotizaciones_items_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `cotizaciones_items`
--

/*!40000 ALTER TABLE `cotizaciones_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizaciones_items` ENABLE KEYS */;


--
-- Definition of table `cpe_bajas`
--

DROP TABLE IF EXISTS `cpe_bajas`;
CREATE TABLE `cpe_bajas` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal - SYS(2015)',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `tip_baja` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo de Baja',
  `num_baja` char(20) NOT NULL DEFAULT '' COMMENT 'Nro de Comunicacion de baja',
  `fec_baja` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de comunicacion de baja',
  `fec_docu` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Emision de documentos',
  `items` decimal(8,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Docs.',
  `flg_sunat_acep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flg de Aceptado de la SUNAT',
  `cod_sunat` varchar(20) NOT NULL DEFAULT '' COMMENT 'Codigo de error sunat',
  `descrip_sunat` varchar(200) NOT NULL DEFAULT '' COMMENT 'Descripcion de error sunat',
  `nroticket` varchar(50) NOT NULL DEFAULT '' COMMENT 'Ticket SUNAT',
  `hashcpe` varchar(50) NOT NULL DEFAULT '' COMMENT 'Hash SUNAT',
  `flg_sunat_anul` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Anulado Sunat',
  `otros1` varchar(200) NOT NULL DEFAULT '' COMMENT 'Otros Datos 1',
  `otros2` varchar(200) NOT NULL DEFAULT '' COMMENT 'Otros Datos 2',
  `flg_descarga_web` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Indica descargo de docs. de la web',
  PRIMARY KEY (`mov_id`) USING BTREE,
  UNIQUE KEY `cod_suc` (`cod_suc`,`num_baja`) USING BTREE,
  KEY `fec_baja` (`fec_baja`) USING BTREE,
  KEY `flg_descarga_web` (`flg_descarga_web`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cpe_bajas`
--

/*!40000 ALTER TABLE `cpe_bajas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpe_bajas` ENABLE KEYS */;


--
-- Definition of table `cpe_resumen_boletas`
--

DROP TABLE IF EXISTS `cpe_resumen_boletas`;
CREATE TABLE `cpe_resumen_boletas` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal - SYS(2015)',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `tip_resumen` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo de Resumen',
  `num_resumen` char(20) NOT NULL DEFAULT '' COMMENT 'Nro de Resumen diario',
  `fec_resumen` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Resumen diario',
  `fec_docu` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Emision de documentos',
  `items` decimal(8,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Docs.',
  `flg_sunat_acep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flg de Aceptado de la SUNAT',
  `cod_sunat` varchar(20) NOT NULL DEFAULT '' COMMENT 'Codigo de error sunat',
  `descrip_sunat` varchar(200) NOT NULL DEFAULT '' COMMENT 'Descripcion de error sunat',
  `nroticket` varchar(50) NOT NULL DEFAULT '' COMMENT 'Ticket SUNAT',
  `hashcpe` varchar(50) NOT NULL DEFAULT '' COMMENT 'Hash SUNAT',
  `flg_sunat_anul` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Anulado Sunat',
  `otros1` varchar(200) NOT NULL DEFAULT '' COMMENT 'Otros Datos 1',
  `otros2` varchar(200) NOT NULL DEFAULT '' COMMENT 'Otros Datos 2',
  `flg_descarga_web` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Indica descargo de docs. de la web',
  PRIMARY KEY (`mov_id`) USING BTREE,
  UNIQUE KEY `cod_suc` (`cod_suc`,`num_resumen`) USING BTREE,
  KEY `fec_resumen` (`fec_resumen`) USING BTREE,
  KEY `flg_descarga_web` (`flg_descarga_web`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cpe_resumen_boletas`
--

/*!40000 ALTER TABLE `cpe_resumen_boletas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpe_resumen_boletas` ENABLE KEYS */;


--
-- Definition of table `cpe_resumen_impresos`
--

DROP TABLE IF EXISTS `cpe_resumen_impresos`;
CREATE TABLE `cpe_resumen_impresos` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal - SYS(2015)',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `num_resumen` char(20) NOT NULL DEFAULT '' COMMENT 'Nro de Resumen impreso',
  `fec_resumen` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Resumen impreso',
  `items` decimal(8,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Docs.',
  `flg_sunat_acep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flg de Aceptado de la SUNAT',
  `cod_sunat` varchar(20) NOT NULL DEFAULT '' COMMENT 'Codigo de error sunat',
  `descrip_sunat` varchar(200) NOT NULL DEFAULT '' COMMENT 'Descripcion de error sunat',
  `nroticket` varchar(50) NOT NULL DEFAULT '' COMMENT 'Ticket SUNAT',
  `hashcpe` varchar(50) NOT NULL DEFAULT '' COMMENT 'Hash SUNAT',
  `flg_sunat_anul` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Anulado Sunat',
  PRIMARY KEY (`mov_id`) USING BTREE,
  UNIQUE KEY `cod_suc` (`cod_suc`,`num_resumen`) USING BTREE,
  KEY `fec_resumen` (`fec_resumen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cpe_resumen_impresos`
--

/*!40000 ALTER TABLE `cpe_resumen_impresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpe_resumen_impresos` ENABLE KEYS */;


--
-- Definition of table `ctrlndoc`
--

DROP TABLE IF EXISTS `ctrlndoc`;
CREATE TABLE `ctrlndoc` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `codapl` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Aplicacion',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `code` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `serie` char(4) NOT NULL DEFAULT '' COMMENT 'Nro de Serie',
  `numero` char(7) NOT NULL DEFAULT '' COMMENT 'Nro de Documento',
  `users` char(3) NOT NULL DEFAULT '' COMMENT 'Valor no Usado',
  `movcajag` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Caja General',
  `numcanje` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Canje',
  `movbcos` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Bancos',
  `suc_caja` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `fec_caja` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Caja Chica',
  `kardex` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `cod_alma` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `ser_prod` char(25) NOT NULL DEFAULT '' COMMENT 'Nro de Serie de Producto',
  `datos_cred` char(28) NOT NULL DEFAULT '' COMMENT 'Autorizacion de Limite de Credito',
  `monto_cred` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Importe extralimitado de Credito',
  `auto_cred` char(7) NOT NULL DEFAULT '' COMMENT 'Flag de Autorizado y Id de Personal que autoriza',
  `suc_bonus` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `fec_bonus` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de canjes bonus',
  `coduser` char(30) NOT NULL DEFAULT '' COMMENT 'Id de usuario + Pc desde donde se conecta',
  `fechahora` timestamp NULL DEFAULT current_timestamp() COMMENT 'Fecha y Hora de Bloqueo',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `ctrlndoc` (`codapl`,`cod_suc`,`code`,`serie`,`numero`) USING BTREE,
  KEY `movbcos` (`movbcos`) USING BTREE,
  KEY `movcaja` (`suc_caja`,`fec_caja`) USING BTREE,
  KEY `numcanje` (`codapl`,`numcanje`) USING BTREE,
  KEY `kardex` (`kardex`) USING BTREE,
  KEY `prodserie` (`cod_alma`,`cod_prod`,`ser_prod`) USING BTREE,
  KEY `datos_cred` (`datos_cred`) USING BTREE,
  KEY `suc_bonus` (`suc_bonus`,`fec_bonus`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ctrlndoc`
--

/*!40000 ALTER TABLE `ctrlndoc` DISABLE KEYS */;
INSERT INTO `ctrlndoc` (`unico`,`codapl`,`cod_suc`,`code`,`serie`,`numero`,`users`,`movcajag`,`numcanje`,`movbcos`,`suc_caja`,`fec_caja`,`kardex`,`cod_alma`,`cod_prod`,`ser_prod`,`datos_cred`,`monto_cred`,`auto_cred`,`suc_bonus`,`fec_bonus`,`coduser`,`fechahora`) VALUES 
 ('_6TX0LR3KG','2','1','PW','E001','0020229','','0000-00-00','','','','0000-00-00','','','','','','0.00','','','0000-00-00','000012/MARLON/XXXXXXXXXXXXXXXX','2024-02-14 11:08:59');
/*!40000 ALTER TABLE `ctrlndoc` ENABLE KEYS */;


--
-- Definition of table `ctrocost`
--

DROP TABLE IF EXISTS `ctrocost`;
CREATE TABLE `ctrocost` (
  `area` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Area',
  `subarea` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Sub-Area',
  `baja` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Baja',
  PRIMARY KEY (`area`,`subarea`) USING BTREE,
  KEY `area` (`area`) USING BTREE,
  KEY `subarea` (`subarea`) USING BTREE,
  CONSTRAINT `FK_CTROCOST_AREAS` FOREIGN KEY (`area`) REFERENCES `areas` (`codarea`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CTROCOST_SUBAREAS` FOREIGN KEY (`subarea`) REFERENCES `subareas` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ctrocost`
--

/*!40000 ALTER TABLE `ctrocost` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctrocost` ENABLE KEYS */;


--
-- Definition of table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE `cuentas` (
  `codigo` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Cuenta Bancaria',
  `suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `banco` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Banco',
  `cuenta` char(20) NOT NULL DEFAULT '' COMMENT 'Nro de Cuenta Bancaria',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Cuenta',
  `titular` char(30) NOT NULL DEFAULT '' COMMENT 'Nombres del Titular',
  `fono` varchar(20) NOT NULL DEFAULT '' COMMENT 'Fono',
  `correo` varchar(100) NOT NULL DEFAULT '' COMMENT 'Correo',
  `cta1` char(15) NOT NULL DEFAULT '' COMMENT 'Cta. Contable',
  `flg_cese` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que Indica Baja de Cuenta',
  `fechacese` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Baja',
  `flg_detrac` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Cta de detraccion',
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `banco` (`banco`) USING BTREE,
  KEY `suc` (`suc`) USING BTREE,
  CONSTRAINT `FK_CUENTAS_BANCOS` FOREIGN KEY (`banco`) REFERENCES `bancos` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_CUENTAS_SUCURSAL` FOREIGN KEY (`suc`) REFERENCES `sucursal` (`cod_suc`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cuentas`
--

/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;


--
-- Definition of table `delivery_pasos`
--

DROP TABLE IF EXISTS `delivery_pasos`;
CREATE TABLE `delivery_pasos` (
  `id_paso` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_paso` varchar(255) DEFAULT NULL,
  `num_paso` char(3) DEFAULT '1',
  `tipo` char(1) DEFAULT 'I',
  PRIMARY KEY (`id_paso`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `delivery_pasos`
--

/*!40000 ALTER TABLE `delivery_pasos` DISABLE KEYS */;
INSERT INTO `delivery_pasos` (`id_paso`,`detalle_paso`,`num_paso`,`tipo`) VALUES 
 (1,'Realiza tu compra a traves de nuestro sitio web.','1','E'),
 (2,'Una vez realizado tu pago, te enviaremos la factura o boleta con los detalles de su compra.','2','E'),
 (3,'El vendedor debera coordinar con el cliente los datos necesarios para el envio. (Destinon, Agencia de transporte, horarios)','3','E'),
 (4,'VINASANTODOMINGO, se compromete a embalar sus productos, con las medidas de seguridad necesarias, para que no tenga ningun problema.','4','E'),
 (5,'Por ultimo, llevaremos sus compras a la agencia de su preferencia y el vendedor le enviara su numero de guia.','5','E'),
 (43,'Realiza tu compra a traves de nuestro sitio web.','1','I'),
 (44,'Una vez realizado tu pago, te enviaremos la factura o boleta con los detalles de su compra.','2','I'),
 (45,'El vendedor debera coordinar con el cliente los datos necesarios para el envio.','3','I'),
 (46,'VINASANTODOMINGO, se compromete a embalar sus productos, con las medidas de seguridad necesarias, para que no tenga ningun problema.','4','I'),
 (47,'Por ultimo, llevaremos su paquete a la direccion registrada.','5','I');
/*!40000 ALTER TABLE `delivery_pasos` ENABLE KEYS */;


--
-- Definition of table `detauxi`
--

DROP TABLE IF EXISTS `detauxi`;
CREATE TABLE `detauxi` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `cod_auxi` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Auxiliar',
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `nom_prod` varchar(150) NOT NULL DEFAULT '' COMMENT 'Descripcion de Producto',
  `nom_anexo` varchar(150) NOT NULL DEFAULT '' COMMENT 'Descripcion de Producto Anexo',
  `tip_moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Producto',
  `nom_unid` char(10) NOT NULL DEFAULT '' COMMENT 'Unidad de Producto',
  `precio_venta` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio de Venta Unit.',
  `precio_venta2` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio de Venta Unit. 2',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `cod_prod` (`cod_prod`) USING BTREE,
  KEY `cod_auxi` (`cod_auxi`) USING BTREE,
  KEY `auxiprod` (`cod_auxi`,`cod_prod`) USING BTREE,
  CONSTRAINT `FK_DETAUXI_AUXILIAR` FOREIGN KEY (`cod_auxi`) REFERENCES `auxiliar` (`cod_auxi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DETAUXI_SOPPROD` FOREIGN KEY (`cod_prod`) REFERENCES `sopprod` (`cod_prod`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `detauxi`
--

/*!40000 ALTER TABLE `detauxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `detauxi` ENABLE KEYS */;


--
-- Definition of table `detlope`
--

DROP TABLE IF EXISTS `detlope`;
CREATE TABLE `detlope` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `codapl` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Aplicacion 1=Compras 2=Ventas',
  `cod_doc` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `tip_detalle` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tpo 1=Condiciones 2=Referencias',
  `det_id` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Condicion o Referencia',
  `deuda` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si genera Deuda',
  `tipo_accion` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de accion en Referencia ABONO/CARGO',
  `anulado` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag para anular doc(S)',
  `flg_percep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de control de de Percepcion',
  `flg_limite` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag para saber si afecta el Limite de credito',
  `cod_sunat` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Sunat',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `det_id` (`det_id`) USING BTREE,
  KEY `tipdoc` (`codapl`,`cod_doc`) USING BTREE,
  CONSTRAINT `FK_DETLOPE_TABLOPE` FOREIGN KEY (`codapl`, `cod_doc`) REFERENCES `tablope` (`codapl`, `codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `detlope`
--

/*!40000 ALTER TABLE `detlope` DISABLE KEYS */;
/*!40000 ALTER TABLE `detlope` ENABLE KEYS */;


--
-- Definition of table `detmodel`
--

DROP TABLE IF EXISTS `detmodel`;
CREATE TABLE `detmodel` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `codigo` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Modelo',
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `des_prod` varchar(150) NOT NULL DEFAULT '' COMMENT 'Descripcion de Producto',
  `can_prod` decimal(15,5) NOT NULL DEFAULT 0.00000 COMMENT 'Cantidad de Producto',
  `nom_unid` char(10) NOT NULL DEFAULT '' COMMENT 'Unidad de Producto',
  `precio_costo` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio de Costo Unit.',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `cod_prod` (`cod_prod`) USING BTREE,
  KEY `codigo` (`codigo`) USING BTREE,
  KEY `model` (`codigo`,`cod_prod`) USING BTREE,
  CONSTRAINT `FK_DETMODEL_SOPPROD` FOREIGN KEY (`cod_prod`) REFERENCES `sopprod` (`cod_prod`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DETMODEL_TABMODEL` FOREIGN KEY (`codigo`) REFERENCES `tabmodel` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `detmodel`
--

/*!40000 ALTER TABLE `detmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `detmodel` ENABLE KEYS */;


--
-- Definition of table `detmov`
--

DROP TABLE IF EXISTS `detmov`;
CREATE TABLE `detmov` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID de Tabla Movimien',
  `tipo` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Aplicacion 1=Compras 2=Ventas 3=Letras',
  `cod_docu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `num_docu` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento',
  `fec_pedi` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Salida o Entrada al Almacen',
  `cod_auxi` char(10) NOT NULL DEFAULT '' COMMENT 'Descripcion de la Unidad',
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `nom_prod` varchar(150) NOT NULL DEFAULT '' COMMENT 'Descripcion del Producto',
  `can_pedi` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Cantidad de Ingreso/Salida',
  `sal_pedi` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Cantidad de Seguimiento de entrega',
  `can_devo` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Numeracion de Item',
  `pre_prod` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio Unitario',
  `dscto_condi` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Descuento x Condicion',
  `dscto_categ` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Descuento x Categoria',
  `pre_neto` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio Neto',
  `igv_inclu` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si esta Incluido los Imptos.',
  `cod_igv` char(2) NOT NULL DEFAULT '' COMMENT 'ID Afectacion del IGV',
  `impto1` decimal(6,2) NOT NULL DEFAULT 0.00 COMMENT 'Porcentaje % de Impuesto 1',
  `impto2` decimal(6,2) NOT NULL DEFAULT 0.00 COMMENT 'Porcentaje % de Impuesto 2',
  `imp_item` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Importe total del Item',
  `pre_gratis` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio ref. Gratis',
  `descargo` char(1) NOT NULL DEFAULT '' COMMENT 'Indicador de Descarga en Almacen',
  `trecord` char(1) NOT NULL DEFAULT '' COMMENT 'Indicador de Seguimiento',
  `cod_model` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Modelos',
  `flg_serie` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si maneja Series',
  `series` char(1) NOT NULL DEFAULT '' COMMENT 'Indicador de control de series',
  `entrega` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si el producto se entrego',
  `notas` varchar(15) NOT NULL DEFAULT '' COMMENT 'Notas de Detalle',
  `flg_percep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica  si controla Percepcion',
  `por_percep` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Porcentaje % de la Percepcion',
  `mon_percep` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto de la Percepcion',
  `ok_stk` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Producto sin Stock',
  `ok_serie` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Producto sin Serie',
  `lStock` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Producto sin Stock y Aceptado',
  `no_calc` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que no se va a recalcular',
  `promo` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que es Promocion y no recalcula',
  `seriesprod` text NOT NULL COMMENT 'Nro de Series para Impresion',
  `pre_anexa` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio Costo Anexado',
  `dsctocompra` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Porcentaje de Dscto. Compra',
  `cod_prov` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Proveedor para proformas',
  `costo_unit` decimal(15,6) NOT NULL DEFAULT 0.000000 COMMENT 'Costo Unitario para proformas',
  `peso` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Peso total del producto',
  `gasto1` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Gasto 1 para proformas',
  `gasto2` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Gasto 2 para proformas',
  `flg_detrac` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Detracciones',
  `por_detrac` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Porct de Detraccion',
  `cod_detrac` varchar(3) NOT NULL DEFAULT '' COMMENT 'ID de Detraccion',
  `mon_detrac` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Monto Base de detraccion',
  `tipoprecio` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo de Precio que usa',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `cod_model` (`cod_model`) USING BTREE,
  KEY `mov_id` (`mov_id`) USING BTREE,
  KEY `cod_prod` (`cod_prod`) USING BTREE,
  KEY `id_prod` (`mov_id`,`cod_prod`) USING BTREE,
  CONSTRAINT `FK_DETMOV_MOVIMIEN` FOREIGN KEY (`mov_id`) REFERENCES `movimien` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DETMOV_SOPPROD` FOREIGN KEY (`cod_prod`) REFERENCES `sopprod` (`cod_prod`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `detmov`
--

/*!40000 ALTER TABLE `detmov` DISABLE KEYS */;
/*!40000 ALTER TABLE `detmov` ENABLE KEYS */;


--
-- Definition of table `detprodcomi`
--

DROP TABLE IF EXISTS `detprodcomi`;
CREATE TABLE `detprodcomi` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `can_ini` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Cantidad Inicial',
  `can_fin` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Cantidad Final',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda',
  `importe` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio Unitario',
  `tipo` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Modulo 1=Precio   2=Porcentaje',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `cod_prod` (`cod_prod`) USING BTREE,
  CONSTRAINT `FK_DETPRODCOMI_SOPPROD` FOREIGN KEY (`cod_prod`) REFERENCES `sopprod` (`cod_prod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `detprodcomi`
--

/*!40000 ALTER TABLE `detprodcomi` DISABLE KEYS */;
/*!40000 ALTER TABLE `detprodcomi` ENABLE KEYS */;


--
-- Definition of table `dirauxi`
--

DROP TABLE IF EXISTS `dirauxi`;
CREATE TABLE `dirauxi` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal - SYS(2015)',
  `cod_auxi` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Auxiliar',
  `ubigeo` varchar(15) NOT NULL COMMENT 'ID de Ubigeo',
  `dllegada` varchar(150) NOT NULL DEFAULT '' COMMENT 'Direccion',
  `v_tipo` varchar(6) NOT NULL DEFAULT '' COMMENT 'Via Tipo',
  `v_nombre` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Nombre',
  `v_numero` varchar(10) NOT NULL DEFAULT '' COMMENT 'Via Numero',
  `v_interior` varchar(10) NOT NULL DEFAULT '' COMMENT 'Via Interior',
  `v_zona` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Zona',
  `v_distrito` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Distrito',
  `v_provincia` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Provincia',
  `v_depart` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Departamento',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `cod_auxi` (`cod_auxi`) USING BTREE,
  CONSTRAINT `FK_DIRAUXI_AUXILIAR` FOREIGN KEY (`cod_auxi`) REFERENCES `auxiliar` (`cod_auxi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `dirauxi`
--

/*!40000 ALTER TABLE `dirauxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `dirauxi` ENABLE KEYS */;


--
-- Definition of table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
CREATE TABLE `direcciones` (
  `direc_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `nombre_apellido` varchar(220) DEFAULT NULL,
  `diereccion` varchar(220) DEFAULT NULL,
  `depar_cod` varchar(2) DEFAULT NULL,
  `prov_cod` varchar(2) DEFAULT NULL,
  `distr_cod` varchar(2) DEFAULT NULL,
  `postal` varchar(2) DEFAULT NULL,
  `numDoc` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`direc_id`) USING BTREE,
  KEY `usuario_id` (`usuario_id`) USING BTREE,
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuariosBK` (`use_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `direcciones`
--

/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;


--
-- Definition of table `dirmov`
--

DROP TABLE IF EXISTS `dirmov`;
CREATE TABLE `dirmov` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `id_auxiliar` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal de cada direccion de cliente',
  `ubigeo` varchar(15) NOT NULL COMMENT 'ID de Ubigeo',
  `dllegada` varchar(150) NOT NULL DEFAULT '' COMMENT 'Direccion de Llegada',
  `v_tipo` varchar(6) NOT NULL DEFAULT '' COMMENT 'Via Tipo',
  `v_nombre` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Nombre',
  `v_numero` varchar(10) NOT NULL DEFAULT '' COMMENT 'Via Numero',
  `v_interior` varchar(10) NOT NULL DEFAULT '' COMMENT 'Via Interior',
  `v_zona` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Zona',
  `v_distrito` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Distrito',
  `v_provincia` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Provincia',
  `v_depart` varchar(50) NOT NULL DEFAULT '' COMMENT 'Via Departamento',
  `dpartida` varchar(150) NOT NULL DEFAULT '' COMMENT 'Direccion de Partida',
  PRIMARY KEY (`mov_id`) USING BTREE,
  UNIQUE KEY `mov_id` (`mov_id`) USING BTREE,
  CONSTRAINT `FK_DIRMOV_MOVIMIEN` FOREIGN KEY (`mov_id`) REFERENCES `movimien` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `dirmov`
--

/*!40000 ALTER TABLE `dirmov` DISABLE KEYS */;
/*!40000 ALTER TABLE `dirmov` ENABLE KEYS */;


--
-- Definition of table `dsctos`
--

DROP TABLE IF EXISTS `dsctos`;
CREATE TABLE `dsctos` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `tipo` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo de Descuento',
  `cod_sub1` char(3) DEFAULT NULL COMMENT 'ID de Categoria',
  `cod_prod` char(6) DEFAULT NULL COMMENT 'ID de Producto',
  `condicion` char(2) DEFAULT NULL COMMENT 'ID de Condicion',
  `dscto` decimal(7,3) NOT NULL DEFAULT 0.000 COMMENT 'Porcentaje',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `condicion` (`condicion`) USING BTREE,
  KEY `sub1_cond` (`cod_sub1`,`condicion`) USING BTREE,
  KEY `cod_sub1` (`cod_sub1`) USING BTREE,
  KEY `prod_cond` (`cod_prod`,`condicion`) USING BTREE,
  KEY `cod_prod` (`cod_prod`) USING BTREE,
  CONSTRAINT `FK_DSCTOS_ESTADO` FOREIGN KEY (`condicion`) REFERENCES `estado` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DSCTOS_SOPPROD` FOREIGN KEY (`cod_prod`) REFERENCES `sopprod` (`cod_prod`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DSCTOS_SOPSUB1` FOREIGN KEY (`cod_sub1`) REFERENCES `sopsub1` (`cod_sub1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `dsctos`
--

/*!40000 ALTER TABLE `dsctos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsctos` ENABLE KEYS */;


--
-- Definition of table `especificaciones`
--

DROP TABLE IF EXISTS `especificaciones`;
CREATE TABLE `especificaciones` (
  `id_espe` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `dato` varchar(100) DEFAULT NULL,
  `esatdo` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_espe`) USING BTREE,
  KEY `prod_id` (`prod_id`) USING BTREE,
  CONSTRAINT `especificaciones_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `especificaciones`
--

/*!40000 ALTER TABLE `especificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `especificaciones` ENABLE KEYS */;


--
-- Definition of table `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `codigo` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Condicion',
  `descrip` varchar(30) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `dias` decimal(3,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Dias de Vencimiento',
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `descrip` (`descrip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `estado`
--

/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`codigo`,`descrip`,`dias`) VALUES 
 ('01','CREDITO 30 DIAS','30'),
 ('03','CREDITO 60 DIAS','60'),
 ('04','CONTADO','0'),
 ('05','REGULARIZACION','0'),
 ('06','CREDITO 15 DIAS','15'),
 ('07','ERROR DE CLIENTE','0'),
 ('08','GARANTIA','0'),
 ('09','ERROR DE IMPRESION','0'),
 ('10','ERROR DE VENDEDOR','0'),
 ('11','TRANSFERENCIA ENTRE TIENDAS','0'),
 ('12','DEVOLUCION','0'),
 ('13','PRESTAMO','0'),
 ('14','CREDITO','0'),
 ('15','INVENTARIO INICIAL','0'),
 ('16','INVENTARIO PERIODICO','0'),
 ('17','VENTA','0'),
 ('18','COMPRA','0'),
 ('19','SERVICIO','0'),
 ('20','CREDITO 07 DIAS','7'),
 ('21','DIFERENCIA DE PRECIOS','99'),
 ('22','ADELANTOS','0'),
 ('23','CREDITO 45 DIAS','45'),
 ('24','CREDITO 90 DIAS','90'),
 ('25','CREDITO 20 DIAS','20'),
 ('26','LETRAS 15 DIAS','15'),
 ('27','LETRAS 30 DIAS','30'),
 ('28','LETRAS 45 DIAS','45'),
 ('29','LETRAS 60 DIAS','60'),
 ('30','LETRAS 75 DIAS','75'),
 ('31','CHQ DIFERIDO 07 DIAS','7'),
 ('32','CHQ DIFERIDO 10 DIAS','10'),
 ('33','CHQ DIFERIDO 25 DIAS','25'),
 ('34','CHQ DIFERIDO 30 DIAS','30'),
 ('35','CHQ DIFERIDO 60 DIAS','60'),
 ('36','CHQ DIFERIDO 15 DIAS','15'),
 ('37','LETRAS 90 DIAS','90'),
 ('38','LETRAS VARIAS','0'),
 ('39','PAGOS TOTALES','0'),
 ('40','TRANSF. DE FONDOS - BANCARIA','0'),
 ('41','DEPOSITO','0'),
 ('42','TARJETA DE CREDITO','0'),
 ('43','CHEQUE','0'),
 ('44','VENDIDO','0'),
 ('45','FACTURADO','0'),
 ('46','PREST GARANTIA','0'),
 ('47','DEVOL GARANTIA','0'),
 ('48','PROV SALIDA','0'),
 ('49','PROV DEVOLUCION','0'),
 ('50','DESCUENTO WEB','0'),
 ('51','CERRADO','0'),
 ('52','DEVOLUCION DE EFECTIVO','0');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;


--
-- Definition of table `estados_virtual`
--

DROP TABLE IF EXISTS `estados_virtual`;
CREATE TABLE `estados_virtual` (
  `estado_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`estado_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `estados_virtual`
--

/*!40000 ALTER TABLE `estados_virtual` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados_virtual` ENABLE KEYS */;


--
-- Definition of table `grupo_categorias`
--

DROP TABLE IF EXISTS `grupo_categorias`;
CREATE TABLE `grupo_categorias` (
  `grupo_id` int(11) NOT NULL AUTO_INCREMENT,
  `icono` varchar(100) DEFAULT NULL,
  `nombre_grupo` varchar(50) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `desplegable` char(1) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`grupo_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `grupo_categorias`
--

/*!40000 ALTER TABLE `grupo_categorias` DISABLE KEYS */;
INSERT INTO `grupo_categorias` (`grupo_id`,`icono`,`nombre_grupo`,`imagen`,`desplegable`,`estado`) VALUES 
 (1,'','PROCESADORES','','1','1'),
 (3,'','MEMORIA RAM','','0','1'),
 (4,'','DISCO/ALMACENAMIENTO','','1','1'),
 (5,'','FUENTE','','1','1'),
 (6,NULL,'PLACA MADRE',NULL,'1','1'),
 (7,NULL,'TARJETA DE VIDEO',NULL,'1','1'),
 (8,NULL,'MONITOR',NULL,'1','1'),
 (9,NULL,'TECLADO',NULL,'1','1'),
 (10,NULL,'COOLER/ REFRIGERACION LIQUIDA',NULL,'1','1'),
 (11,NULL,'PARLANTE',NULL,'1','1'),
 (12,NULL,'MOUSE',NULL,'1','1'),
 (13,NULL,'ESTABILIZADOR',NULL,'1','1'),
 (14,NULL,'OTROS',NULL,'1','1'),
 (15,NULL,'LAPTOP',NULL,'1','1');
/*!40000 ALTER TABLE `grupo_categorias` ENABLE KEYS */;


--
-- Definition of table `grupo_seleccion`
--

DROP TABLE IF EXISTS `grupo_seleccion`;
CREATE TABLE `grupo_seleccion` (
  `id_seleccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) DEFAULT NULL,
  `nombre_cate` varchar(100) DEFAULT NULL,
  `codi_categoria` char(20) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `icono` varchar(200) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_seleccion`) USING BTREE,
  UNIQUE KEY `codi_categoria` (`codi_categoria`) USING BTREE,
  KEY `id_grupo` (`id_grupo`) USING BTREE,
  CONSTRAINT `grupo_seleccion_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo_categorias` (`grupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `grupo_seleccion`
--

/*!40000 ALTER TABLE `grupo_seleccion` DISABLE KEYS */;
INSERT INTO `grupo_seleccion` (`id_seleccion`,`id_grupo`,`nombre_cate`,`codi_categoria`,`imagen`,`orden`,`icono`,`estado`) VALUES 
 (49,NULL,'BORGONA','002','0neGZhLtLojZJwgU4slTUuksYB0xW53NiYU85grGKRfTDCo7vQRFA1yZ3oNQjGdHeyGZUxgfECzIEdG0.png',2,'vino.png','1'),
 (50,NULL,'PISCO','003','0neGZhLtLojZJwgU4slTUuksYB0xW53NiYU85grGKRfTDCo7vQRFA1yZ3oNQjGdHeyGZUxgfECzIEdG0.png',3,'vino.png','1'),
 (51,NULL,'VINO TINTO','004','0neGZhLtLojZJwgU4slTUuksYB0xW53NiYU85grGKRfTDCo7vQRFA1yZ3oNQjGdHeyGZUxgfECzIEdG0.png',4,'vino.png','1');
/*!40000 ALTER TABLE `grupo_seleccion` ENABLE KEYS */;


--
-- Definition of table `identida`
--

DROP TABLE IF EXISTS `identida`;
CREATE TABLE `identida` (
  `cod_di` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `nom_di` varchar(50) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `num_di` decimal(2,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Digitos',
  PRIMARY KEY (`cod_di`) USING BTREE,
  UNIQUE KEY `cod_di` (`cod_di`) USING BTREE,
  KEY `nom_di` (`nom_di`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `identida`
--

/*!40000 ALTER TABLE `identida` DISABLE KEYS */;
INSERT INTO `identida` (`cod_di`,`nom_di`,`num_di`) VALUES 
 ('00','DOC.TRIB.NO.DOM.SIN.RUC','11'),
 ('01','D.N.I.','8'),
 ('04','CARNET DE EXTRANJERIA','11'),
 ('06','R.U.C.','11'),
 ('07','PASAPORTE','11');
/*!40000 ALTER TABLE `identida` ENABLE KEYS */;


--
-- Definition of table `interes`
--

DROP TABLE IF EXISTS `interes`;
CREATE TABLE `interes` (
  `factor` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Nro de Dias de Morosidad',
  `porcent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Porcentaje de Mora',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de la Mora',
  `tcambio` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'Tipo de Cambio - No Usado',
  `gastos` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Gastos Financieros de Mora',
  `impto` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si se adiciona Impuestos',
  PRIMARY KEY (`moneda`,`factor`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `interes`
--

/*!40000 ALTER TABLE `interes` DISABLE KEYS */;
INSERT INTO `interes` (`factor`,`porcent`,`moneda`,`tcambio`,`gastos`,`impto`) VALUES 
 ('50.00','0.20','1','0.000','0.0000',0x00),
 ('60.00','0.30','1','0.000','0.0000',0x00),
 ('70.00','0.35','1','0.000','0.0000',0x00),
 ('80.00','0.40','1','0.000','0.0000',0x00),
 ('90.00','0.45','1','0.000','0.0000',0x00),
 ('100.00','0.50','1','0.000','0.0000',0x00);
/*!40000 ALTER TABLE `interes` ENABLE KEYS */;


--
-- Definition of table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
CREATE TABLE `kardex` (
  `unicodet` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal Tabla Detmov',
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID de Tabla Movimien',
  `cod_alma` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `doc` char(1) NOT NULL DEFAULT '' COMMENT 'Acccion I=Ingreso S=Salida',
  `codapl` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Aplicacion 1=Compras 2=Ventas',
  `cod_docu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `num_docu` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento',
  `cltprov` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Cliente o Proveedor',
  `fecha` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Movimiento',
  `codigo` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `cantid` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Cantidad de Producto',
  `saldo` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Saldo de Stock a la Fecha o Movimiento',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de la Operacion',
  `tcambio` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Tipo de Cambio de la Operacion',
  `preunit` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio Unitario de la Operacion',
  `preprom` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Precio Promedio',
  `preinver` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Precio Promedio Invertido',
  `alma_des` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen destino en caso sea una Transferencia',
  `no_calc` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que no se va a recalcular',
  `promo` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que es Promocion y no recalcula',
  `preultimo` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Ultimo Costo',
  `auto_recno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Numero de Registro',
  PRIMARY KEY (`unicodet`) USING BTREE,
  UNIQUE KEY `auto_recno` (`auto_recno`) USING BTREE,
  KEY `mov_id` (`mov_id`) USING BTREE,
  KEY `cltprov` (`cltprov`) USING BTREE,
  KEY `codigo` (`codigo`) USING BTREE,
  KEY `kardex` (`cod_alma`,`codigo`,`fecha`,`doc`) USING BTREE,
  KEY `feckar` (`cod_alma`,`fecha`) USING BTREE,
  CONSTRAINT `FK_KARDEX_AUXILIAR` FOREIGN KEY (`cltprov`) REFERENCES `auxiliar` (`cod_auxi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_KARDEX_MOVIMIEN` FOREIGN KEY (`mov_id`) REFERENCES `movimien` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_KARDEX_SOPPROD` FOREIGN KEY (`codigo`) REFERENCES `sopprod` (`cod_prod`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=443065 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT COMMENT='InnoDB free: 6144 kB; (`cltprov`) REFER `gestion/auxiliar`(`';

--
-- Dumping data for table `kardex`
--

/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;


--
-- Definition of table `libro_reclamacion`
--

DROP TABLE IF EXISTS `libro_reclamacion`;
CREATE TABLE `libro_reclamacion` (
  `lib_id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_code` varchar(30) DEFAULT NULL COMMENT 'NUMERO DE RECIBO',
  `lib_date` date DEFAULT NULL COMMENT 'FECHA EMISION',
  `lib_negocio` varchar(150) DEFAULT NULL COMMENT 'NEGOCIO',
  `lib_tienda` varchar(150) DEFAULT NULL COMMENT 'TIENDA',
  `lib_cliente` varchar(200) DEFAULT NULL COMMENT 'CLIENTE',
  `lib_domicilio` varchar(200) DEFAULT NULL COMMENT 'DOMICILIO',
  `lib_DNI` varchar(25) DEFAULT NULL COMMENT 'DNI / CE',
  `lib_telecli` varchar(25) DEFAULT NULL COMMENT 'TELEFONO DEL CLIENTE',
  `lib_emailcli` varchar(150) DEFAULT NULL COMMENT 'EMAIL CLIENTE',
  `lib_menor` varchar(2) DEFAULT NULL COMMENT 'MENOR DE EDAD',
  `lib_apoderado` varchar(200) DEFAULT NULL COMMENT 'APODERADO',
  `lib_domiapo` varchar(200) DEFAULT NULL COMMENT 'DOMICILIO APODERADO',
  `lib_DNIapo` varchar(25) DEFAULT NULL COMMENT 'DNI / CE APORDERADO',
  `lib_teleapo` varchar(25) DEFAULT NULL COMMENT 'TELEFONO DEL CLIENTE APODERADO',
  `lib_emailapo` varchar(150) DEFAULT NULL COMMENT 'EMAIL CLIENTE APODERADO',
  `lib_tiposer` varchar(15) DEFAULT NULL COMMENT 'SERVICIO / PRODUCTO',
  `lib_serdesc` text DEFAULT NULL COMMENT 'DESCRIPCION',
  `lib_montorec` decimal(14,2) NOT NULL,
  `lib_tiporec` varchar(15) DEFAULT NULL COMMENT 'RECLAMO / QUEJA',
  `lib_detalle` text DEFAULT NULL COMMENT 'DETALLES',
  `lib_pedido` text DEFAULT NULL COMMENT 'PEDIDO',
  `lib_fecres` date DEFAULT NULL COMMENT 'FECHA RESPUESTA',
  `lib_respuesta` text DEFAULT NULL COMMENT 'RESPUESTA',
  PRIMARY KEY (`lib_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1304 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `libro_reclamacion`
--

/*!40000 ALTER TABLE `libro_reclamacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro_reclamacion` ENABLE KEYS */;


--
-- Definition of table `marcra_productos`
--

DROP TABLE IF EXISTS `marcra_productos`;
CREATE TABLE `marcra_productos` (
  `marca_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(100) DEFAULT NULL,
  `cod_marca` char(5) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`marca_id`) USING BTREE,
  UNIQUE KEY `cod_marca` (`cod_marca`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `marcra_productos`
--

/*!40000 ALTER TABLE `marcra_productos` DISABLE KEYS */;
INSERT INTO `marcra_productos` (`marca_id`,`nombre_marca`,`cod_marca`,`imagen`,`estado`) VALUES 
 (15,'SANTODOMINGO','002','D3sueUqS9XUkTQAZM02FapQ9XUnetja1vEeMI0JFPPwuMLeFWkPl44RJM8jWvOLgov3YFOTZLveFIXOP.png',1),
 (347,'null','3',NULL,0);
/*!40000 ALTER TABLE `marcra_productos` ENABLE KEYS */;


--
-- Definition of table `movbcos`
--

DROP TABLE IF EXISTS `movbcos`;
CREATE TABLE `movbcos` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `cod_cta` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Cuenta de Banco',
  `inddocu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento de Banco',
  `numdocu` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento',
  `fechadoc` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Transaccion',
  `fecaja` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Emision de Caja',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Moneda',
  `ie` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo de accion A=Abono C=Cargo',
  `importe` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Importe',
  `observar` varchar(100) NOT NULL DEFAULT '' COMMENT 'Observaciones',
  `cltprov` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Cliente/Proveedor',
  `saldo` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Saldo de Cuenta de Banco',
  `concilia` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Conciliacion',
  `cajag` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que es de Caja general',
  `ctacte` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que es de Ctas. Ctes.',
  `acaja` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que general movimiento en Caja',
  `decartera` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que es de Cartera',
  `devuelto` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que ha sido Protestado / Anticipo Cerrado',
  `cajach` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que es de Caja Chica',
  `progch` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que es de Programacion Pagos',
  `cod_user` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Usuario que realiza la transaccion',
  `registro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Fecha-Hora que se realiza la transaccion',
  `ndocs` decimal(3,0) NOT NULL DEFAULT 0 COMMENT 'Indica el Nro de Documentos que ha Cancelado',
  `id_origen` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal del Mov. Origen',
  `concepto` varchar(50) NOT NULL DEFAULT '' COMMENT 'Concepto de ABONO-CARGO',
  `auto_recno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Nro de Registro',
  PRIMARY KEY (`mov_id`) USING BTREE,
  UNIQUE KEY `auto_recno` (`auto_recno`) USING BTREE,
  KEY `auxiliar` (`cltprov`) USING BTREE,
  KEY `cod_cta` (`cod_cta`) USING BTREE,
  KEY `fechadoc` (`fechadoc`) USING BTREE,
  KEY `movbcos` (`cod_cta`,`fechadoc`,`inddocu`,`numdocu`) USING BTREE,
  CONSTRAINT `FK_MOVBCOS_CUENTAS` FOREIGN KEY (`cod_cta`) REFERENCES `cuentas` (`codigo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=725 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `movbcos`
--

/*!40000 ALTER TABLE `movbcos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movbcos` ENABLE KEYS */;


--
-- Definition of table `movcaja`
--

DROP TABLE IF EXISTS `movcaja`;
CREATE TABLE `movcaja` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal - SYS(2015) VFP',
  `suc` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `fecpago` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Movimiento',
  `ie` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo de Movimiento',
  `indpago` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `docpago` char(11) NOT NULL DEFAULT '' COMMENT 'Nro de Documento',
  `cltpedido` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Auxiliar',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Moneda',
  `tcambio` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'Tipo de Cambio',
  `importe` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Importe de Ingreso/ Egreso',
  `observar` char(50) NOT NULL DEFAULT '' COMMENT 'Observaciones',
  `fechvcto` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Vencimiento',
  `codbanco` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Banco',
  PRIMARY KEY (`mov_id`) USING BTREE,
  KEY `cajach` (`suc`,`fecpago`) USING BTREE,
  KEY `codauxi` (`cltpedido`) USING BTREE,
  KEY `suc` (`suc`) USING BTREE,
  KEY `numero` (`suc`,`indpago`,`docpago`) USING BTREE,
  CONSTRAINT `FK_MOVCAJA_ALMACEN` FOREIGN KEY (`suc`) REFERENCES `almacen` (`cod_alma`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `movcaja`
--

/*!40000 ALTER TABLE `movcaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `movcaja` ENABLE KEYS */;


--
-- Definition of table `movcajag`
--

DROP TABLE IF EXISTS `movcajag`;
CREATE TABLE `movcajag` (
  `principal` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID de Tabla Movimien si es Automatico',
  `tipo` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Aplicacion 1=Compras 2=Ventas 3=Letras',
  `suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `cod_docu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento FA/BV/NC',
  `num_docu` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento FA/BV/NC',
  `id_doc` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal Documento FA/BV/NC',
  `ie` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo de Movimiento I=Ingreso Egreso A=Abono C=Cargo',
  `indpago` char(2) NOT NULL DEFAULT '' COMMENT 'Tipo de Comprobante de Pago',
  `docpago` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Comprobante de Pago',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Comprobante de Pago',
  `fecpago` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Comprobante de Pago',
  `tcambio` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'Tipo de Cambio de Comprobante de Pago',
  `importe` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Importe de Comprobante de Pago',
  `observar` varchar(100) NOT NULL DEFAULT '' COMMENT 'Detalle de Comprobante de Pago',
  `fechvcto` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Vencimiento de Comprobante de Pago',
  `centrocos` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Centro de Costos',
  `cltpedido` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Cliente o Proveedor',
  `codbco` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Cuenta de Banco',
  `indbco` char(1) NOT NULL DEFAULT '' COMMENT 'Accion ejecutada en el Banco',
  `est_cart` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Estado Actual de Cheque en cartera',
  `ing_cart` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Ingreso de Cheque en cartera',
  `sal_cart` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Salida de Cheque en cartera',
  `clteprov` char(1) NOT NULL DEFAULT '' COMMENT 'Indica el tipo de Accion I-E en el caso de LETRAS',
  `switch` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal del Cheque en Cartera Origen',
  `audit` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha-Hora de Registro',
  `coduser` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Usuario de Sistema',
  `origen` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Importacion',
  `comi` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'Porcentaje de Comision',
  `resaltado` char(1) NOT NULL DEFAULT '' COMMENT 'Valor de Control de Colores',
  `indrefer` char(2) NOT NULL DEFAULT '' COMMENT 'Documento de Referencia',
  `docrefer` char(10) NOT NULL DEFAULT '' COMMENT 'Numero de Documento de Referencia',
  `de_prgchq` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que Indica que es un Movimiento de Programaci~Af^A^3n',
  `de_caja` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que Indica que es un Movimiento de Caja',
  `de_banco` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que Indica que es un Movimiento de Bancos',
  `pendiente` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag para Limites de Credito',
  PRIMARY KEY (`principal`) USING BTREE,
  KEY `id_doc` (`id_doc`) USING BTREE,
  KEY `mov_id` (`mov_id`) USING BTREE,
  KEY `switch` (`switch`) USING BTREE,
  KEY `cltpedido` (`cltpedido`) USING BTREE,
  KEY `fecpago` (`fecpago`) USING BTREE,
  KEY `codbco` (`codbco`) USING BTREE,
  KEY `numero` (`suc`,`indpago`,`docpago`) USING BTREE,
  CONSTRAINT `FK_MOVCAJAG_AUXILIAR` FOREIGN KEY (`cltpedido`) REFERENCES `auxiliar` (`cod_auxi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MOVCAJAG_MOVIMIEN` FOREIGN KEY (`id_doc`) REFERENCES `movimien` (`mov_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `movcajag`
--

/*!40000 ALTER TABLE `movcajag` DISABLE KEYS */;
/*!40000 ALTER TABLE `movcajag` ENABLE KEYS */;


--
-- Definition of table `movcheques`
--

DROP TABLE IF EXISTS `movcheques`;
CREATE TABLE `movcheques` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal - SYS(2015) VFP',
  `cod_cta` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Cuenta de Banco',
  `inddocu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Tipo de Pago',
  `numdocu` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Pago',
  `fecha` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Voucher',
  `fechadoc` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha en Vencimiento',
  `fecaja` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Emision',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Documento',
  `importe` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Importe de Movimiento',
  `observar` varchar(100) NOT NULL DEFAULT '' COMMENT 'Observaciones',
  `cltprov` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Proveedor',
  `abanco` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Envio a Banco',
  `ndocs` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Docs Cancelados',
  `anulado` bit(1) NOT NULL COMMENT 'Flag de anulado',
  PRIMARY KEY (`mov_id`) USING BTREE,
  KEY `cod_cta` (`cod_cta`) USING BTREE,
  KEY `cltprov` (`cltprov`) USING BTREE,
  KEY `chequera` (`cod_cta`,`inddocu`,`numdocu`) USING BTREE,
  KEY `fechadoc` (`fechadoc`) USING BTREE,
  KEY `fecaja` (`fecaja`) USING BTREE,
  CONSTRAINT `FK_MOVCHEQUES_AUXILIAR` FOREIGN KEY (`cltprov`) REFERENCES `auxiliar` (`cod_auxi`),
  CONSTRAINT `FK_MOVCHEQUES_CUENTAS` FOREIGN KEY (`cod_cta`) REFERENCES `cuentas` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `movcheques`
--

/*!40000 ALTER TABLE `movcheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `movcheques` ENABLE KEYS */;


--
-- Definition of table `movimien`
--

DROP TABLE IF EXISTS `movimien`;
CREATE TABLE `movimien` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `tipo` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Aplicacion 1=Compras 2=Ventas',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `cod_alma` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `cod_docu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `num_docu` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Documento',
  `fec_docu` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Emision',
  `fec_entre` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Entrega',
  `fec_vcto` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Vencimiento',
  `flg_sitpedido` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que Indica si es de Seguimiento',
  `cod_pedi` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Referencia',
  `num_pedi` char(11) NOT NULL DEFAULT '' COMMENT 'Numero de Referencia',
  `cod_auxi` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Cliente o Proveedor',
  `cod_trans` char(5) NOT NULL DEFAULT '00000' COMMENT 'ID de Transportista',
  `cod_vend` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Vendedor',
  `tip_mone` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Doc. 1=Soles 2=Dolares',
  `impto1` decimal(6,2) NOT NULL DEFAULT 0.00 COMMENT 'Porct. % Impuesto 1',
  `impto2` decimal(6,2) NOT NULL DEFAULT 0.00 COMMENT 'Porct. % Impuesto 2',
  `mon_bruto` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto Neto',
  `mon_impto1` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto de Impuestos 1',
  `mon_impto2` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto de Impuestos 2',
  `mon_gravado` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto de Gravado',
  `mon_inafec` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto de Inafectos',
  `mon_exonera` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto de Exonerado',
  `mon_gratis` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto de Gratutito',
  `mon_total` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto Total',
  `sal_docu` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Saldo de Documento',
  `tot_cargo` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Total Cargos',
  `tot_percep` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Total Percepcion',
  `tip_codicion` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Condicion',
  `txt_observa` varchar(250) NOT NULL DEFAULT '' COMMENT 'Notas de Documento',
  `flg_kardex` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si actualizo Kardex',
  `flg_anulado` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si esta Anulado',
  `flg_referen` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si esta Referenciado',
  `flg_percep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si hace percepcion',
  `cod_user` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Usuario de sistema',
  `programa` char(1) NOT NULL DEFAULT '' COMMENT 'Valor sin Uso',
  `txt_nota` varchar(100) NOT NULL DEFAULT '' COMMENT 'Notas de Documento',
  `tip_cambio` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'Tipo de Cambio',
  `tdflags` char(12) NOT NULL DEFAULT '' COMMENT 'Flags de Configuraciones',
  `numlet` varchar(150) NOT NULL DEFAULT '' COMMENT 'Importe Total en Letras',
  `impdcto` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Importe del Descuento',
  `impanticipos` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Importe de Anticipos',
  `registro` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha Hora de creacion',
  `tipo_canje` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Canje Letras',
  `numcanje` varchar(11) NOT NULL DEFAULT '' COMMENT 'Numero de Canje de Letras',
  `cobrobco` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flags que Indica si la Letra esta en Banco',
  `ctabco` char(3) NOT NULL DEFAULT '' COMMENT 'Cuenta de Banco donde se encuentra el Doc.',
  `flg_qcont` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que se ha Contabilizado / Anticipo cerrado',
  `fec_anul` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Anulado del Doc.',
  `audit` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Valor de Auditoria',
  `origen` char(1) NOT NULL DEFAULT '' COMMENT 'Valor en caso sea de Importacion',
  `tip_cont` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Tipo de Contrato',
  `tip_fact` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Tipo de Facturacion',
  `contrato` varchar(13) NOT NULL DEFAULT '' COMMENT 'ID y Numero de Contrato',
  `idcontrato` varchar(10) NOT NULL DEFAULT '' COMMENT 'ID Prinicpal del Contrato',
  `canje_fact` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que esta canjeado x una Factura',
  `aceptado` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Aprobacion',
  `reg_conta` decimal(10,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Registro Contable',
  `mov_pago` varchar(10) NOT NULL DEFAULT '' COMMENT 'ID Prog de Pago / Estado de Letra',
  `ndocu1` varchar(25) NOT NULL DEFAULT '' COMMENT 'Documento 1',
  `ndocu2` varchar(25) NOT NULL DEFAULT '' COMMENT 'Documento 2',
  `ndocu3` varchar(25) NOT NULL DEFAULT '' COMMENT 'Documento 3',
  `flg_logis` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Stock Pedido y en Transito',
  `cod_recep` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Receptor',
  `flg_aprueba` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Transf. Aprobada',
  `fec_aprueba` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Fecha de Aprobacion de Transf.',
  `flg_limite` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag para saber si afecta el Limite de credito',
  `fecpago` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Cancelacion',
  `imp_comi` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Importe de Comision',
  `ptosbonus` decimal(5,0) NOT NULL DEFAULT 0 COMMENT 'Ptos. ganados por documento',
  `canjepedtran` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que el documento canjeo el Stock Comprometido',
  `cod_clasi` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Bien y/o Servicio',
  `doc_elec` varchar(2) NOT NULL DEFAULT '' COMMENT 'ID doc.Elect. SUNAT',
  `cod_nota` varchar(2) NOT NULL DEFAULT '' COMMENT 'ID de tipo de NC-ND',
  `hashcpe` varchar(50) NOT NULL DEFAULT '' COMMENT 'Hash Sunat CPE',
  `flg_sunat_acep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Aceptado en Sunat',
  `flg_sunat_anul` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Anulado en Sunat',
  `flg_sunat_mail` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Email enviado',
  `flg_sunat_webs` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Publicado Web custodia',
  `flg_sunat_cpe` varchar(1) NOT NULL DEFAULT '' COMMENT 'Estado de CPE: 1=BoletaNotas para Resumen 2=BoletaNotas para Bajas 2=FacturaNotas para Bajas',
  `flg_sunat_whatsapp` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Enviado por whatsapp',
  `mov_id_baja` varchar(10) NOT NULL DEFAULT '' COMMENT 'ID Comunicacion de baja',
  `mov_id_resu_bv` varchar(10) NOT NULL DEFAULT '' COMMENT 'ID Resumen diario BV',
  `mov_id_resu_ci` varchar(10) NOT NULL DEFAULT '' COMMENT 'ID Resumen comprobante impreso',
  `nroticket` varchar(50) NOT NULL DEFAULT '' COMMENT 'Nro de Ticket SUNAT',
  `flg_guia_traslado` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Documento Guia Traslado',
  `flg_anticipo_doc` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Anticipo Recibido',
  `flg_anticipo_reg` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Anticipo Regularizacion',
  `doc_anticipo_id` varchar(10) NOT NULL DEFAULT '' COMMENT 'MovID de doc. de anticipo',
  `flg_emi_itinerante` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Emisor Itinerante BOLETA',
  `placa` varchar(10) NOT NULL DEFAULT '' COMMENT 'Nro de Placa',
  PRIMARY KEY (`mov_id`) USING BTREE,
  KEY `cod_vende` (`cod_vend`) USING BTREE,
  KEY `mov_pago` (`mov_pago`) USING BTREE,
  KEY `movdoc` (`tipo`,`cod_docu`) USING BTREE,
  KEY `movimien` (`tipo`,`cod_suc`,`cod_docu`,`num_docu`) USING BTREE,
  KEY `numcanje` (`tipo_canje`,`numcanje`) USING BTREE,
  KEY `cod_auxi` (`cod_auxi`) USING BTREE,
  KEY `tip_codicion` (`tip_codicion`) USING BTREE,
  KEY `fec_docu` (`fec_docu`) USING BTREE,
  KEY `cod_trans` (`cod_trans`) USING BTREE,
  KEY `cod_alma` (`cod_alma`) USING BTREE,
  KEY `cod_suc` (`cod_suc`) USING BTREE,
  KEY `cod_recep` (`cod_recep`) USING BTREE,
  KEY `mov_id_resu_ci` (`mov_id_resu_ci`) USING BTREE,
  KEY `mov_id_baja` (`mov_id_baja`) USING BTREE,
  KEY `mov_id_resu_bv` (`mov_id_resu_bv`) USING BTREE,
  KEY `cpe_bajas` (`tipo`,`cod_suc`,`doc_elec`,`mov_id_baja`,`flg_sunat_acep`,`flg_sunat_anul`,`flg_anulado`) USING BTREE,
  KEY `cpe_resumen` (`tipo`,`cod_suc`,`doc_elec`,`mov_id_resu_bv`,`flg_sunat_acep`,`flg_sunat_anul`,`flg_anulado`) USING BTREE,
  KEY `cpe_altas` (`tipo`,`cod_suc`,`doc_elec`,`flg_sunat_acep`,`fec_docu`,`cod_alma`,`cod_docu`) USING BTREE,
  KEY `flg_sunat_cpe` (`flg_sunat_cpe`) USING BTREE,
  CONSTRAINT `FK_MOVIMIEN_AUXILIAR` FOREIGN KEY (`cod_auxi`) REFERENCES `auxiliar` (`cod_auxi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MOVIMIEN_ESTADO` FOREIGN KEY (`tip_codicion`) REFERENCES `estado` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MOVIMIEN_SUCURSAL` FOREIGN KEY (`cod_suc`) REFERENCES `sucursal` (`cod_suc`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MOVIMIEN_TABLOPE` FOREIGN KEY (`tipo`, `cod_docu`) REFERENCES `tablope` (`codapl`, `codigo`),
  CONSTRAINT `FK_MOVIMIEN_TRANSPTE` FOREIGN KEY (`cod_trans`) REFERENCES `transpte` (`codtrans`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MOVIMIEN_VENDEDOR` FOREIGN KEY (`cod_vend`) REFERENCES `vendedor` (`codvend`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `movimien`
--

/*!40000 ALTER TABLE `movimien` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimien` ENABLE KEYS */;


--
-- Definition of table `movpagos`
--

DROP TABLE IF EXISTS `movpagos`;
CREATE TABLE `movpagos` (
  `principal` char(10) NOT NULL,
  `mov_id` char(10) NOT NULL,
  `ie` char(1) NOT NULL,
  `suc` char(1) NOT NULL,
  `alma` char(3) NOT NULL,
  `tipo` decimal(1,0) unsigned NOT NULL,
  `cod_docu` char(2) NOT NULL,
  `num_docu` char(10) NOT NULL,
  `id_doc` char(10) NOT NULL,
  `indpago` char(2) NOT NULL,
  `docpago` char(10) NOT NULL,
  `moneda` decimal(1,0) unsigned NOT NULL,
  `fechvcto` date NOT NULL,
  `importe` decimal(15,2) NOT NULL,
  `observar` char(100) NOT NULL,
  `codbco` char(3) NOT NULL,
  `indbco` char(3) NOT NULL,
  `audit` char(50) NOT NULL,
  `coduser` char(6) NOT NULL,
  `tcambio` decimal(10,3) NOT NULL,
  `estado` decimal(1,0) NOT NULL,
  `cltpedido` char(6) NOT NULL,
  PRIMARY KEY (`principal`) USING BTREE,
  UNIQUE KEY `principal` (`principal`) USING BTREE,
  KEY `chequera` (`suc`,`indpago`,`docpago`) USING BTREE,
  KEY `cltpedido` (`cltpedido`) USING BTREE,
  KEY `codbco` (`codbco`) USING BTREE,
  KEY `fechvcto` (`fechvcto`) USING BTREE,
  KEY `id_doc` (`id_doc`) USING BTREE,
  KEY `mov_id` (`mov_id`) USING BTREE,
  KEY `numero` (`indpago`,`docpago`) USING BTREE,
  KEY `pagos` (`ie`,`alma`,`fechvcto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `movpagos`
--

/*!40000 ALTER TABLE `movpagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movpagos` ENABLE KEYS */;


--
-- Definition of table `movptosbonus`
--

DROP TABLE IF EXISTS `movptosbonus`;
CREATE TABLE `movptosbonus` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal - SYS(2015) VFP',
  `suc` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `fecpago` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Canje',
  `ie` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo de Movimiento',
  `docpago` char(10) NOT NULL DEFAULT '' COMMENT 'Nro de Canje',
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `cltpedido` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Auxiliar',
  `ptosbonus` decimal(5,0) NOT NULL DEFAULT 0 COMMENT 'Ptos. Bonus canjeados',
  `tcambio` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'Tipo de Cambio',
  `importe` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Importe de Abono',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Moneda',
  `observar` char(50) NOT NULL DEFAULT '' COMMENT 'Observaciones',
  `audit` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha-Hora de Registro',
  `coduser` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Usuario de Sistema',
  PRIMARY KEY (`mov_id`) USING BTREE,
  KEY `canje` (`suc`,`fecpago`) USING BTREE,
  KEY `cod_alma` (`suc`) USING BTREE,
  KEY `cod_auxi` (`cltpedido`) USING BTREE,
  KEY `cod_prod` (`cod_prod`) USING BTREE,
  KEY `numero` (`suc`,`docpago`) USING BTREE,
  CONSTRAINT `FK_MOVCANJES_ALMACEN` FOREIGN KEY (`suc`) REFERENCES `almacen` (`cod_alma`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MOVCANJES_AUXILIAR` FOREIGN KEY (`cltpedido`) REFERENCES `auxiliar` (`cod_auxi`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MOVCANJES_SOPPROD` FOREIGN KEY (`cod_prod`) REFERENCES `sopprod` (`cod_prod`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `movptosbonus`
--

/*!40000 ALTER TABLE `movptosbonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `movptosbonus` ENABLE KEYS */;


--
-- Definition of table `nuevo_imgreso`
--

DROP TABLE IF EXISTS `nuevo_imgreso`;
CREATE TABLE `nuevo_imgreso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  `nuevo` char(1) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `prod_id` (`prod_id`) USING BTREE,
  CONSTRAINT `nuevo_imgreso_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `nuevo_imgreso`
--

/*!40000 ALTER TABLE `nuevo_imgreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuevo_imgreso` ENABLE KEYS */;


--
-- Definition of table `numdoc`
--

DROP TABLE IF EXISTS `numdoc`;
CREATE TABLE `numdoc` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `cod_apl` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Aplicacion 1=Compras 2=Ventas 3=CtasCtes',
  `cod_docu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `fecha` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Permiso',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `serie` decimal(4,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Serie Solicitada',
  `del` decimal(10,0) NOT NULL DEFAULT 0 COMMENT 'Numero Inicial',
  `al` decimal(10,0) NOT NULL DEFAULT 0 COMMENT 'Numero Final',
  `num_auto` char(15) NOT NULL DEFAULT '' COMMENT 'Nro de Autorizacion SUNAT',
  `ruc_print` char(11) NOT NULL DEFAULT '' COMMENT 'Nro de RUC de la Imprenta',
  `vence` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Vencimiento',
  `dias` decimal(3,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Dias de Aviso x Vencer',
  `estado` char(1) NOT NULL DEFAULT '' COMMENT 'Estado A=Alta B=Baja E=Espera',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `chequera` (`cod_apl`,`cod_suc`,`cod_docu`,`estado`) USING BTREE,
  KEY `docnum` (`cod_apl`,`cod_docu`) USING BTREE,
  KEY `fecha` (`fecha`) USING BTREE,
  KEY `verifica` (`cod_apl`,`cod_suc`,`cod_docu`,`serie`) USING BTREE,
  KEY `cod_suc` (`cod_suc`) USING BTREE,
  CONSTRAINT `FK_NUMDOC_SUCURSAL` FOREIGN KEY (`cod_suc`) REFERENCES `sucursal` (`cod_suc`) ON UPDATE CASCADE,
  CONSTRAINT `FK_NUMDOC_TABLOPE` FOREIGN KEY (`cod_apl`, `cod_docu`) REFERENCES `tablope` (`codapl`, `codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `numdoc`
--

/*!40000 ALTER TABLE `numdoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `numdoc` ENABLE KEYS */;


--
-- Definition of table `numero`
--

DROP TABLE IF EXISTS `numero`;
CREATE TABLE `numero` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `cod_vend` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Vendedor',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `cod_docu` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `serie` char(4) NOT NULL DEFAULT '' COMMENT 'Nro de Serie x Defecto',
  `numero` char(7) NOT NULL DEFAULT '' COMMENT 'Numero Inicial - No Usado',
  `final` char(7) NOT NULL DEFAULT '' COMMENT 'Numero Final - No Usado',
  `ok` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si se puede modificar la Serie',
  PRIMARY KEY (`unico`) USING BTREE,
  KEY `cod_suc` (`cod_suc`) USING BTREE,
  KEY `cod_vend` (`cod_vend`) USING BTREE,
  CONSTRAINT `FK_NUMERO_SUCURSAL` FOREIGN KEY (`cod_suc`) REFERENCES `sucursal` (`cod_suc`) ON UPDATE CASCADE,
  CONSTRAINT `FK_NUMERO_VENDEDOR` FOREIGN KEY (`cod_vend`) REFERENCES `vendedor` (`codvend`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `numero`
--

/*!40000 ALTER TABLE `numero` DISABLE KEYS */;
/*!40000 ALTER TABLE `numero` ENABLE KEYS */;


--
-- Definition of table `ofertas_productos`
--

DROP TABLE IF EXISTS `ofertas_productos`;
CREATE TABLE `ofertas_productos` (
  `id_ofer` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `precio_oferta` double(8,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `cantidad_stock` int(11) DEFAULT NULL,
  `fecha_termino` date DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_ofer`) USING BTREE,
  KEY `producto_id` (`producto_id`) USING BTREE,
  CONSTRAINT `ofertas_productos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ofertas_productos`
--

/*!40000 ALTER TABLE `ofertas_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofertas_productos` ENABLE KEYS */;


--
-- Definition of table `opiniones`
--

DROP TABLE IF EXISTS `opiniones`;
CREATE TABLE `opiniones` (
  `opinion_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `estrellas` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `comentario` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`opinion_id`) USING BTREE,
  KEY `usuario_id` (`usuario_id`) USING BTREE,
  KEY `prod_id` (`prod_id`) USING BTREE,
  CONSTRAINT `opiniones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuariosBK` (`use_id`),
  CONSTRAINT `opiniones_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `opiniones`
--

/*!40000 ALTER TABLE `opiniones` DISABLE KEYS */;
/*!40000 ALTER TABLE `opiniones` ENABLE KEYS */;


--
-- Definition of table `orden_compra`
--

DROP TABLE IF EXISTS `orden_compra`;
CREATE TABLE `orden_compra` (
  `orden_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `total` double(10,2) DEFAULT NULL,
  `tc` double(10,4) DEFAULT NULL,
  `moneda` char(1) DEFAULT NULL,
  PRIMARY KEY (`orden_id`) USING BTREE,
  KEY `usuario_id` (`usuario_id`) USING BTREE,
  KEY `estatus` (`estatus`) USING BTREE,
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuariosBK` (`use_id`),
  CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`estatus`) REFERENCES `estados_virtual` (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `orden_compra`
--

/*!40000 ALTER TABLE `orden_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra` ENABLE KEYS */;


--
-- Definition of table `orden_compra_detalle`
--

DROP TABLE IF EXISTS `orden_compra_detalle`;
CREATE TABLE `orden_compra_detalle` (
  `orden_deta_id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double(10,2) DEFAULT NULL,
  `moneda` int(11) DEFAULT NULL,
  PRIMARY KEY (`orden_deta_id`) USING BTREE,
  KEY `orden_id` (`orden_id`) USING BTREE,
  CONSTRAINT `orden_compra_detalle_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `orden_compra` (`orden_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `orden_compra_detalle`
--

/*!40000 ALTER TABLE `orden_compra_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra_detalle` ENABLE KEYS */;


--
-- Definition of table `paramete`
--

DROP TABLE IF EXISTS `paramete`;
CREATE TABLE `paramete` (
  `key_unico` char(15) NOT NULL DEFAULT '' COMMENT 'ID de Configuracion',
  `cfg1` varchar(250) NOT NULL DEFAULT '' COMMENT 'Datos 1 de Configuracion',
  `cfg2` varchar(250) NOT NULL DEFAULT '' COMMENT 'Datos 2 de Configuracion',
  `cfgesp` text NOT NULL COMMENT 'Datos 3 de Configuracion',
  `color1_l` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Letra 1',
  `color1_f` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Fondo 1',
  `color2_l` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Letra 2',
  `color2_f` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Fondo 2',
  `color3_l` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Letra 3',
  `color3_f` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Fondo 3',
  `color4_l` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Letra 4',
  `color4_f` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Fondo 4',
  `color5_l` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Letra 5',
  `color5_f` decimal(15,0) NOT NULL DEFAULT 0 COMMENT 'Color de Auditoria Fondo 5',
  `cfg3` varchar(250) NOT NULL DEFAULT '' COMMENT 'Datos 3 de Configuracion',
  `cfg4` text NOT NULL COMMENT 'Datos 4 de Configuracion',
  `tipclasi` varchar(100) NOT NULL DEFAULT '' COMMENT 'Codigos de Tipos de Proveedor que no afectan Costos',
  PRIMARY KEY (`key_unico`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `paramete`
--

/*!40000 ALTER TABLE `paramete` DISABLE KEYS */;
/*!40000 ALTER TABLE `paramete` ENABLE KEYS */;


--
-- Definition of table `pedido_detalles`
--

DROP TABLE IF EXISTS `pedido_detalles`;
CREATE TABLE `pedido_detalles` (
  `pedido_detalle_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double(10,2) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`pedido_detalle_id`) USING BTREE,
  KEY `id_pedido` (`id_pedido`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE,
  CONSTRAINT `pedido_detalles_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`pedido_id`),
  CONSTRAINT `pedido_detalles_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pedido_detalles`
--

/*!40000 ALTER TABLE `pedido_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_detalles` ENABLE KEYS */;


--
-- Definition of table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `nun_doc` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `notas` longtext DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `archivo` varchar(225) DEFAULT NULL,
  `usuario_cambio_estado` int(11) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `distrito_id` int(11) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `tipo_pago` int(11) DEFAULT NULL,
  `tipo_envio` int(11) DEFAULT NULL,
  `distrito_opcional` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pedido_id`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5019 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;


--
-- Definition of table `precios`
--

DROP TABLE IF EXISTS `precios`;
CREATE TABLE `precios` (
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `en_lista` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si esta en Lista',
  `lsupendido` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si esta suspendido',
  `fecha_susp` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de suspension',
  `precio_venta` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio 1',
  `precio_mayor` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio 2',
  `precio_tres` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio 3',
  `precio_cuatro` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio 4',
  `precio_cinco` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio 5',
  `precio_seis` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Precio 6',
  `precio_costo` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Precio Costo Moneda Producto',
  `precio_inver` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Precio Costo Moneda Invertida',
  `precio_refer` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Precio Referencia',
  `porct_1` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Porct % precio venta',
  `porct_2` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Porct % precio mayor',
  `porct_3` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Porct % precio tres',
  `porct_4` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Porct % precio cuatro',
  `porct_5` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Porct % precio cinco',
  `porct_6` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Porct % precio seis',
  `costo_ultimo` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Costo Ultimo',
  PRIMARY KEY (`cod_suc`,`cod_prod`) USING BTREE,
  KEY `cod_suc` (`cod_suc`) USING BTREE,
  KEY `cod_prod` (`cod_prod`) USING BTREE,
  CONSTRAINT `FK_PRECIOS_SOPPROD` FOREIGN KEY (`cod_prod`) REFERENCES `sopprod` (`cod_prod`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRECIOS_SUCURSAL` FOREIGN KEY (`cod_suc`) REFERENCES `sucursal` (`cod_suc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `precios`
--

/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
INSERT INTO `precios` (`cod_prod`,`cod_suc`,`en_lista`,`lsupendido`,`fecha_susp`,`precio_venta`,`precio_mayor`,`precio_tres`,`precio_cuatro`,`precio_cinco`,`precio_seis`,`precio_costo`,`precio_inver`,`precio_refer`,`porct_1`,`porct_2`,`porct_3`,`porct_4`,`porct_5`,`porct_6`,`costo_ultimo`) VALUES 
 ('0001','1',0x01,0x00,'0000-00-00','12.0000','12.0000','12.0000','12.0000','0.0000','0.0000','12.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0002','1',0x01,0x00,'0000-00-00','12.0000','50.0000','50.0000','50.0000','0.0000','0.0000','5.830','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0003','1',0x01,0x00,'0000-00-00','12.0000','30.0000','30.0000','30.0000','0.0000','0.0000','5.830','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0004','1',0x01,0x00,'0000-00-00','12.0000','50.0000','50.0000','50.0000','0.0000','0.0000','5.830','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0005','1',0x01,0x00,'0000-00-00','20.0000','50.0000','50.0000','50.0000','0.0000','0.0000','11.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0006','1',0x01,0x00,'0000-00-00','20.0000','35.0000','35.0000','35.0000','0.0000','0.0000','12.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0007','1',0x01,0x00,'0000-00-00','110.0000','110.0000','110.0000','110.0000','0.0000','0.0000','70.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0008','1',0x01,0x00,'0000-00-00','120.0000','120.0000','120.0000','120.0000','0.0000','0.0000','70.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0009','1',0x01,0x00,'0000-00-00','120.0000','120.0000','120.0000','120.0000','0.0000','0.0000','70.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0010','1',0x01,0x00,'0000-00-00','120.0000','120.0000','120.0000','120.0000','0.0000','0.0000','70.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0011','1',0x01,0x00,'0000-00-00','240.0000','240.0000','240.0000','240.0000','0.0000','0.0000','120.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0012','1',0x01,0x00,'0000-00-00','240.0000','240.0000','240.0000','240.0000','0.0000','0.0000','120.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0013','1',0x01,0x00,'0000-00-00','240.0000','240.0000','240.0000','240.0000','0.0000','0.0000','120.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0014','1',0x01,0x00,'0000-00-00','240.0000','240.0000','240.0000','240.0000','0.0000','0.0000','120.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0015','1',0x01,0x00,'0000-00-00','25.0000','25.0000','25.0000','25.0000','0.0000','0.0000','10.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0016','1',0x01,0x00,'0000-00-00','25.0000','25.0000','25.0000','25.0000','0.0000','0.0000','10.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0017','1',0x01,0x00,'0000-00-00','200.0000','200.0000','200.0000','200.0000','0.0000','0.0000','144.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0018','1',0x01,0x00,'0000-00-00','200.0000','200.0000','200.0000','200.0000','0.0000','0.0000','144.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0019','1',0x01,0x00,'0000-00-00','200.0000','200.0000','200.0000','200.0000','0.0000','0.0000','144.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0020','1',0x01,0x00,'0000-00-00','200.0000','200.0000','200.0000','200.0000','0.0000','0.0000','144.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0021','1',0x01,0x00,'0000-00-00','220.0000','220.0000','220.0000','220.0000','0.0000','0.0000','156.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0022','1',0x01,0x00,'0000-00-00','25.0000','25.0000','25.0000','25.0000','0.0000','0.0000','10.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0023','1',0x01,0x00,'0000-00-00','25.0000','25.0000','25.0000','25.0000','0.0000','0.0000','10.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0024','1',0x01,0x00,'0000-00-00','25.0000','25.0000','25.0000','25.0000','0.0000','0.0000','10.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0025','1',0x01,0x00,'0000-00-00','25.0000','25.0000','25.0000','25.0000','0.0000','0.0000','10.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0026','1',0x01,0x00,'0000-00-00','30.0000','30.0000','30.0000','30.0000','0.0000','0.0000','13.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000'),
 ('0027','1',0x01,0x00,'0000-00-00','150.0000','150.0000','150.0000','150.0000','0.0000','0.0000','110.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000','0.000');
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;


--
-- Definition of table `prnform`
--

DROP TABLE IF EXISTS `prnform`;
CREATE TABLE `prnform` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Unico SYS(2015) VFP',
  `codapl` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Aplicacion 1=Compra 2=Venta 3=CtaCte',
  `prnform` char(8) NOT NULL DEFAULT '' COMMENT 'Nombre Fisico de Formato de Impresion',
  `descrip` varchar(25) NOT NULL DEFAULT '' COMMENT 'Descripcion del Formato',
  `hoja` char(25) NOT NULL DEFAULT '' COMMENT 'Nombre de la Hoja Personalizada',
  `ancho` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Ancho de la Hoja Personalizada',
  `alto` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Alto de la Hoja Personalizada',
  PRIMARY KEY (`unico`) USING BTREE,
  UNIQUE KEY `Formato` (`codapl`,`prnform`) USING BTREE,
  KEY `codapl` (`codapl`) USING BTREE,
  KEY `descrip` (`descrip`) USING BTREE,
  KEY `prnform` (`prnform`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `prnform`
--

/*!40000 ALTER TABLE `prnform` DISABLE KEYS */;
INSERT INTO `prnform` (`unico`,`codapl`,`prnform`,`descrip`,`hoja`,`ancho`,`alto`) VALUES 
 ('_2DB0P554M','1','VIEWGEN','DOCUMENTO EN GENERAL','','0.00','0.00'),
 ('_2DB0P554N','2','VIEWGEN','DOCUMENTO EN GENERAL','','0.00','0.00'),
 ('_2DB0P554O','3','VIEWGEN','DOCUMENTO EN GENERAL','','0.00','0.00'),
 ('_2DB0P556S','2','PRNFACT','FACTURA DE VENTA','SOFT_FACTURA','21.49','31.00'),
 ('_2DB0P558F','2','PRNBOLE','BOLETA DE VENTA','SOFT_BOLETA','22.00','22.90'),
 ('_2DB0P559U','2','PRNGUIA','GUIA DE REMISION','','0.00','0.00'),
 ('_2DB0P55DY','2','PRNNTCRE','NOTA DE CREDITO','SOFT_NC','21.59','16.60'),
 ('_2DB0P55FH','2','PRNNTDEB','NOTA DE DEBITO','SOFT_ND','21.59','16.60'),
 ('_2DB0P55MJ','3','PRNVOUCH','VOUCHER','SOFT_VOUCHER','21.59','14.85'),
 ('_2DB0P55QV','2','PRNPROF','PROFORMA DE VENTA','','0.00','0.00'),
 ('_2DB0P55Z1','2','PRNBOLEE','BOLETA ELECTRONICO COMPU','','0.00','0.00'),
 ('_2DB0P55Z2','2','PRNFACTE','FACTURA ELECTRONICO COMPU','','0.00','0.00'),
 ('_2DB0P55Z3','2','PRNNCREE','N.CRED. ELECTRONICO COMPU','','0.00','0.00'),
 ('_2DB0P55Z4','2','PRNNDEBE','N.DEB. ELECTRONICO COMPU','','0.00','0.00'),
 ('_2FI0L92SD','3','PRNLETRA','LETRA DE CAMBIO','SOFT_LETRA','21.59','10.00'),
 ('_2GA0RAXMJ','2','PRNRMAIC','RMA INGRESO CLIENTE','SOFT_RMA','21.59','14.85'),
 ('_2GA0RBRH5','2','PRNRMASC','RMA SALIDA CLIENTE','SOFT_RMA','21.59','14.85'),
 ('_2GA0RCCUM','1','RMAPROVO','RMA SALIDA PROVEEDOR','A4','21.00','29.70'),
 ('_2GA0RCXOV','1','RMAPROI','RMA INGRESO PROVEEDOR','A4','21.00','29.70'),
 ('_3Q50R0QMU','2','PRNTRANS','TRANSFERENCIAS','A4','21.00','29.70'),
 ('_4G517FDNS','2','PRNMAIL','PROFORMA POR CORREO','PRNMAIL','21.00','29.70'),
 ('_4HP0ZHTHV','1','VIEWORD','ORDEN DE COMPRA','','0.00','0.00'),
 ('_4OL0VYMWW','2','RMAENTRA','RMA ENTRADA','A4','21.00','29.70'),
 ('_4OO13O3GI','2','RMAOUT','RMA SALIDA','A4','21.00','29.70'),
 ('_4OR0S497I','2','ORDVENTA','ORDEN DE VENTA','ORDENVENTA','21.00','29.70'),
 ('_6440RL9WS','2','PRBOLEE2','BOLETA ELECTRONICO AMSA','','0.00','0.00'),
 ('_6440RLEGT','2','PRFACTE2','FACTURA ELECTRONICO AMSA','','0.00','0.00'),
 ('_6440RLM26','2','PRNCREE2','N.CRED. ELECTRONICO AMSA','','0.00','0.00'),
 ('_6440RLQQ4','2','PRNDEBE2','N.DEB. ELECTRONICO AMSA','','0.00','0.00'),
 ('_6450QXX61','2','PRNMAIL2','PROFORMA POR CORREO AMSA','PRNMAIL2','0.00','0.00'),
 ('_64G10GSPZ','2','PRNGUI2','GUIA DE REMISION AMSA','','0.00','0.00'),
 ('_6B50YI4T9','2','RMAENTR2','AMSA INGRESO RMA','A4','0.00','0.00'),
 ('_6B50YM1I4','2','RMAOU2','AMSA SALIDA RMA','A4','0.00','0.00'),
 ('_6IA0NNLWH','2','PRNGUIAE','GUIA REMISION ELECTR','','0.00','0.00');
/*!40000 ALTER TABLE `prnform` ENABLE KEYS */;


--
-- Definition of table `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` char(20) DEFAULT NULL,
  `sub_cat` int(11) DEFAULT NULL,
  `nombre` text DEFAULT NULL,
  `content1` varchar(200) DEFAULT NULL,
  `content2` varchar(200) DEFAULT NULL,
  `content3` varchar(200) DEFAULT NULL,
  `marca` char(5) DEFAULT NULL,
  `prod_cod` varchar(200) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `caracteristicas` text DEFAULT NULL,
  `precio_prod` double(10,2) DEFAULT NULL,
  `stock_prod` int(11) DEFAULT NULL,
  `tipo_pro` char(1) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `garantia` varchar(200) DEFAULT '0',
  `precio_oferta` double(10,2) DEFAULT NULL,
  `estado_prod` char(1) DEFAULT '1',
  PRIMARY KEY (`prod_id`) USING BTREE,
  KEY `marca` (`marca`) USING BTREE,
  KEY `sub_cat` (`sub_cat`) USING BTREE,
  KEY `categoria` (`categoria`) USING BTREE,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`marca`) REFERENCES `marcra_productos` (`cod_marca`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`sub_cat`) REFERENCES `sub_categoria` (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5045 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `producto`
--

/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`prod_id`,`categoria`,`sub_cat`,`nombre`,`content1`,`content2`,`content3`,`marca`,`prod_cod`,`descripcion`,`caracteristicas`,`precio_prod`,`stock_prod`,`tipo_pro`,`estado`,`garantia`,`precio_oferta`,`estado_prod`) VALUES 
 (5019,'002',882,'BORGONA NEGRO 750ml - 11% Vol.','','','','3','0002','','',12.00,12,'','1','0',0.00,'1'),
 (5020,'002',883,'BORGONA BLANCA 750ml - 11% vol.','','','','3','0003','','',12.00,15,'','1','0',0.00,'1'),
 (5021,'002',889,'BORGONA ROSE','','','','002','0004','','',12.00,30,'','1','0',0.00,'1'),
 (5022,'002',888,'DSANGRE QUEBRANTA 750ml - 11% vol.','','','','002','0005','','',20.00,30,'','1','0',0.00,'1'),
 (5024,'005',1,'CAJA DE VINO BORGONA BLANCA','','','','3','0007','','',110.00,255,'','1','0',0.00,'1'),
 (5025,'005',1,'CAJA DE VINO BLANCO','','','','3','0008','','',120.00,156,'','1','0',0.00,'1'),
 (5026,'005',1,'CAJA DE VINO GRAN ROSE','','','','3','0009','','',120.00,92,'','1','0',0.00,'1'),
 (5027,'005',1,'CAJA DE VINO BORGONA TINTO','','','','3','0010','','',120.00,26,'','1','0',0.00,'1'),
 (5028,'006',1,'CAJA MACERADO DE MARACUYA','','','','3','0011','','',240.00,2,'','1','0',0.00,'1'),
 (5029,'006',1,'CAJA MACERADO DE MARACUYA','','','','3','0012','','',240.00,2,'','1','0',0.00,'1'),
 (5030,'007',1,'CAJA MACERADO DE PINA','','','','3','0013','','',240.00,2,'','1','0',0.00,'1'),
 (5031,'007',1,'CAJA MACERADO DE MARACUYA','','','','3','0014','','',240.00,2,'','1','0',0.00,'1'),
 (5032,'007',1,'MACERADO DE MARACUYA BOTELLA 500ml','','','','3','0015','','',25.00,12,'','1','0',0.00,'1'),
 (5033,'007',1,'MACERADO DE PINA BOTELLA 500ml','','','','3','0016','','',25.00,12,'','1','0',0.00,'1'),
 (5034,'003',1,'CAJA PISCO ACHOLADO (Quebranta-Italia)','','','','3','0017','','',200.00,2,'','1','0',0.00,'1'),
 (5035,'003',1,'CAJA PISCO ACHOLADO (Quebranta-Italia)','','','','3','0018','','',200.00,2,'','1','0',0.00,'1'),
 (5036,'003',1,'CAJA PISCO QUEBRANTA','','','','3','0019','','',200.00,2,'','1','0',0.00,'1'),
 (5037,'003',1,'CAJA PISCO ITALIA','','','','3','0020','','',200.00,2,'','1','0',0.00,'1'),
 (5038,'003',1,'CAJA PISCO TORONTEL','','','','3','0021','','',220.00,2,'','1','0',0.00,'1'),
 (5039,'003',1,'PISCO ITALIA BOTELLA 500ml','','','','3','0022','','',25.00,12,'','1','0',0.00,'1'),
 (5040,'003',1,'PISCO ACHOLADO BOTERLLA500ml','','','','3','0023','','',25.00,12,'','1','0',0.00,'1'),
 (5041,'003',1,'PISCO ACHOLADO BOTELLA500ml','','','','3','0024','','',25.00,12,'','1','0',0.00,'1'),
 (5042,'003',1,'PISCO QUEBRANTA BOTELLA500ml','','','','3','0025','','',25.00,12,'','1','0',0.00,'1'),
 (5043,'003',1,'PISCO TORONTEL BOTELLA 500ml','','','','3','0026','','',30.00,12,'','1','0',0.00,'1'),
 (5044,'005',1,'CAJA VINO D SANGRE','','','','3','0027','','',150.00,10,'','1','0',0.00,'1');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;


--
-- Definition of table `producto_foto`
--

DROP TABLE IF EXISTS `producto_foto`;
CREATE TABLE `producto_foto` (
  `foto_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  `imagen_url` varchar(200) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`foto_id`) USING BTREE,
  KEY `prod_id` (`prod_id`) USING BTREE,
  CONSTRAINT `producto_foto_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `producto_foto`
--

/*!40000 ALTER TABLE `producto_foto` DISABLE KEYS */;
INSERT INTO `producto_foto` (`foto_id`,`prod_id`,`imagen_url`,`orden`) VALUES 
 (1,5019,'K13Eg6cA4CvEYaRl8pplqtcVID2rq7Abup50RtvJ7Ae9WZsGmR6pB8R9QtDvwQcmmB13o1ybQWoojIOy.png',1),
 (2,5020,'AzaBRE8gSR37j5CjcHEj6mS8x4btgTJfqLN6E2qS9VnzPvCC35kzbpUWg76tY83uAn8OsYwOGvoosjJm.png',1),
 (3,5021,'Y8G2xeMBTVy43zLhFIksDkM89sEYoNNlnjc6Wsy0xwu3BQqq9Y3OULyooaJlSHqklrPs6snj3FRkt3EO.png',1),
 (4,5022,'EdlHvjcSIZjHj1Qo0JwugoYvXiAZsh0O6Nly4h0tZ2jbvaVnm21NNjS09xN3kWVvhNzEceg1e1l9z3yS.png',1);
/*!40000 ALTER TABLE `producto_foto` ENABLE KEYS */;


--
-- Definition of table `productos_exclusivos`
--

DROP TABLE IF EXISTS `productos_exclusivos`;
CREATE TABLE `productos_exclusivos` (
  `id_exclu` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_exclu`) USING BTREE,
  KEY `prod_id` (`prod_id`) USING BTREE,
  CONSTRAINT `productos_exclusivos_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `productos_exclusivos`
--

/*!40000 ALTER TABLE `productos_exclusivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_exclusivos` ENABLE KEYS */;


--
-- Definition of table `registrados_x_promociones`
--

DROP TABLE IF EXISTS `registrados_x_promociones`;
CREATE TABLE `registrados_x_promociones` (
  `id_registrado_promocion` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_registrado_promocion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `registrados_x_promociones`
--

/*!40000 ALTER TABLE `registrados_x_promociones` DISABLE KEYS */;
INSERT INTO `registrados_x_promociones` (`id_registrado_promocion`,`email`) VALUES 
 (155,'mtlpv159@gmail.com'),
 (156,'niquenaguirrefranz@gmail.com');
/*!40000 ALTER TABLE `registrados_x_promociones` ENABLE KEYS */;


--
-- Definition of table `salcaja`
--

DROP TABLE IF EXISTS `salcaja`;
CREATE TABLE `salcaja` (
  `cod_suc` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `fecha` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Movimiento',
  `ini_sol` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Saldo Efectivo Inicial Soles',
  `ing_sol` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Ingresos Efectivo de Soles',
  `sal_sol` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Egresos Efectivo de Soles',
  `tot_sol` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Saldo Efectivo de Soles',
  `ini_dol` decimal(14,4) NOT NULL DEFAULT 0.0000 COMMENT 'Saldo Efectivo Inicial Dolares',
  `ing_dol` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Ingresos Efectivo de Dolares',
  `sal_dol` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Egresos Efectivo de Dolares',
  `tot_dol` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Saldo Efectivo de Dolares',
  `ch_s_ing` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Ingresos Cheques de Soles',
  `ch_s_sal` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Egresos Cheques de Soles',
  `ch_d_ing` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Ingresos Cheques de Dolares',
  `ch_d_sal` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Egresos Cheques de Dolares',
  `cierre` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que Indica el Cierre de Caja',
  `user` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Usuario',
  `fec_hora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Fecha y Hora de Cierre',
  `saldo_liq` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Saldo de Caja - Comercial Yoselin',
  `saldo_liq_s` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Conciliacion Soles',
  `saldo_liq_d` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Conciliacion Dolares',
  PRIMARY KEY (`cod_suc`,`fecha`) USING BTREE,
  KEY `cod_suc` (`cod_suc`) USING BTREE,
  KEY `fecha` (`fecha`) USING BTREE,
  CONSTRAINT `FK_SALCAJA_ALMACEN` FOREIGN KEY (`cod_suc`) REFERENCES `almacen` (`cod_alma`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `salcaja`
--

/*!40000 ALTER TABLE `salcaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `salcaja` ENABLE KEYS */;


--
-- Definition of table `salcajag`
--

DROP TABLE IF EXISTS `salcajag`;
CREATE TABLE `salcajag` (
  `codapl` char(1) NOT NULL,
  `inddocu` char(2) NOT NULL,
  `fecha` date NOT NULL,
  `ini_sol` decimal(15,4) unsigned NOT NULL,
  `ing_sol` decimal(15,4) NOT NULL,
  `sal_sol` decimal(15,4) unsigned NOT NULL,
  `tot_sol` decimal(15,4) NOT NULL,
  `ini_dol` decimal(14,4) NOT NULL,
  `ing_dol` decimal(15,4) NOT NULL,
  `sal_dol` decimal(15,4) NOT NULL,
  `tot_dol` decimal(15,4) NOT NULL,
  `ch_s_ing` decimal(15,4) unsigned NOT NULL,
  `ch_s_sal` decimal(15,4) NOT NULL,
  `ch_d_ing` decimal(15,4) NOT NULL,
  `ch_d_sal` decimal(15,4) NOT NULL,
  `cierre` bit(1) NOT NULL,
  `user` char(6) NOT NULL,
  `fec_hora` char(50) NOT NULL,
  PRIMARY KEY (`fecha`) USING BTREE,
  UNIQUE KEY `principal` (`fecha`) USING BTREE,
  KEY `fecha` (`fecha`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `salcajag`
--

/*!40000 ALTER TABLE `salcajag` DISABLE KEYS */;
/*!40000 ALTER TABLE `salcajag` ENABLE KEYS */;


--
-- Definition of table `series`
--

DROP TABLE IF EXISTS `series`;
CREATE TABLE `series` (
  `mov_id` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal SYS(2015) VFP',
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `serie` char(25) NOT NULL DEFAULT '' COMMENT 'Nro de Serie',
  `id_ingreso` char(10) NOT NULL DEFAULT '' COMMENT 'ID Pricipal - Doc. Ingreso',
  `id_salida` char(10) NOT NULL DEFAULT '' COMMENT 'ID Pricipal - Doc. Salida',
  `flg_kar_i` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que ingreso a Almacen',
  `flg_kar_s` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica que salio del Almacen',
  `fecha_ing` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de ingreso a Almacen',
  `fecha_sal` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de salida de Almacen',
  `proceso` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si esta en espera',
  `fechavcto` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha del Vencimiento de Garantia',
  `unicodet_i` char(10) NOT NULL DEFAULT '' COMMENT 'ID Unico de detalle Ingresos',
  `unicodet_s` char(10) NOT NULL DEFAULT '' COMMENT 'ID Unico de detalle Salidas',
  `lote` varchar(25) NOT NULL DEFAULT '' COMMENT 'Nro de Lote',
  PRIMARY KEY (`mov_id`) USING BTREE,
  KEY `cod_prod` (`cod_prod`) USING BTREE,
  KEY `id_ingreso` (`id_ingreso`) USING BTREE,
  KEY `id_salida` (`id_salida`) USING BTREE,
  KEY `serie` (`cod_prod`,`serie`) USING BTREE,
  KEY `serie_ing` (`id_ingreso`,`cod_prod`) USING BTREE,
  KEY `serie_sal` (`id_salida`,`cod_prod`) USING BTREE,
  KEY `seriemov` (`cod_prod`,`flg_kar_i`,`flg_kar_s`,`proceso`) USING BTREE,
  KEY `unicodet_i` (`unicodet_i`) USING BTREE,
  KEY `unicodet_s` (`unicodet_s`) USING BTREE,
  KEY `lote` (`lote`) USING BTREE,
  CONSTRAINT `FK_SERIES_MOVIMIEN` FOREIGN KEY (`id_ingreso`) REFERENCES `movimien` (`mov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SERIES_SOPPROD` FOREIGN KEY (`cod_prod`) REFERENCES `sopprod` (`cod_prod`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `series`
--

/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;


--
-- Definition of table `softlink`
--

DROP TABLE IF EXISTS `softlink`;
CREATE TABLE `softlink` (
  `valid` char(2) NOT NULL DEFAULT '' COMMENT 'Validador',
  PRIMARY KEY (`valid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `softlink`
--

/*!40000 ALTER TABLE `softlink` DISABLE KEYS */;
INSERT INTO `softlink` (`valid`) VALUES 
 ('OK');
/*!40000 ALTER TABLE `softlink` ENABLE KEYS */;


--
-- Definition of table `soplinea`
--

DROP TABLE IF EXISTS `soplinea`;
CREATE TABLE `soplinea` (
  `cod_line` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Clasificacion',
  `nom_line` varchar(100) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `cod_sunat` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Sunat',
  `cod_osce` char(16) NOT NULL DEFAULT '' COMMENT 'ID OSCE',
  `aweb` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si es para la Web Site',
  PRIMARY KEY (`cod_line`) USING BTREE,
  KEY `nom_line` (`nom_line`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `soplinea`
--

/*!40000 ALTER TABLE `soplinea` DISABLE KEYS */;
INSERT INTO `soplinea` (`cod_line`,`nom_line`,`cod_sunat`,`cod_osce`,`aweb`) VALUES 
 ('00','[SIN CLASIFICACION]','06','44000000',0x00),
 ('01','MERCADERIA','','',0x00),
 ('02','SERVICIOS MANUALES','99','',0x00);
/*!40000 ALTER TABLE `soplinea` ENABLE KEYS */;


--
-- Definition of table `sopprod`
--

DROP TABLE IF EXISTS `sopprod`;
CREATE TABLE `sopprod` (
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `cod_clasi` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Clasificacion',
  `cod_cate` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Categoria',
  `cod_subc` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Sub-Categoria',
  `cod_prov` varchar(25) NOT NULL DEFAULT '' COMMENT 'ID de Proveedor',
  `cod_espe` varchar(25) NOT NULL DEFAULT '' COMMENT 'ID Anexo',
  `cod_sunat` varchar(25) NOT NULL DEFAULT '' COMMENT 'ID SUNAT-ONU',
  `nom_prod` varchar(150) NOT NULL DEFAULT '' COMMENT 'Descripcion de Producto',
  `cod_unid` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Unidad',
  `nom_unid` char(10) NOT NULL DEFAULT '' COMMENT 'Descripcion de la Unidad',
  `fac_unid` decimal(4,0) NOT NULL DEFAULT 1 COMMENT 'Factor del Producto',
  `kardoc_costo` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Precio Promedio - Kardex por documento',
  `kardoc_stock` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Stock - Kardex por documento',
  `kardoc_ultingfec` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Ult. Fecha de Ingreso',
  `kardoc_ultingcan` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Ult. Cantidad de Ingreso',
  `kardoc_unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Unico - Kardex por documento',
  `fec_ingre` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Alta',
  `flg_descargo` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Descargo en Kardex/Stock',
  `tip_moneda` decimal(1,0) NOT NULL DEFAULT 1 COMMENT 'Moneda de Valorizacion',
  `flg_serie` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Control de Series',
  `txt_observa` text NOT NULL COMMENT 'Observaciones',
  `flg_afecto` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Afecto/Inafecto a Imptos.',
  `flg_suspen` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Suspendido o Baja',
  `apl_lista` decimal(1,0) NOT NULL DEFAULT 3 COMMENT 'Indicador de en Lista de Precios',
  `foto` text NOT NULL COMMENT 'Fotografia',
  `web` text NOT NULL COMMENT 'Direccion WEB',
  `bi_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de BI - Compras',
  `impto1_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto1 - Compras',
  `impto2_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto2 - Compras',
  `impto3_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto3 - Compras',
  `dscto_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Descuento - Compras',
  `bi_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de BI - Ventas',
  `impto1_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto1 - Ventas',
  `impto2_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto2 - Ventas',
  `impto3_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto3 - Ventas',
  `dscto_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Descuento - Ventas',
  `cta_s_caja` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Caja Soles',
  `cta_d_caja` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Caja Dolares',
  `cod_ubic` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Ubicacion',
  `peso` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Peso x Unidad',
  `flg_percep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Control de Percepcion',
  `por_percep` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Porcentaje de Percepcion',
  `gasto` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Producto tipo GASTO',
  `dsctocompra` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Porcentaje de Dscto. Compra',
  `dsctocompra2` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Porcentaje de Dscto. Compra 2',
  `cod_promo` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Promocion',
  `can_promo` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Cantidad de Promocion',
  `ult_edicion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y Hora de ultima edicion',
  `ptosbonus` decimal(5,0) NOT NULL DEFAULT 0 COMMENT 'Record de Ptos. Bonus',
  `bonus_moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Ptos. Bonus Moneda',
  `bonus_importe` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Ptos. Bonus Importe',
  `flg_detrac` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de detraccion',
  `por_detrac` decimal(8,3) NOT NULL DEFAULT 0.000 COMMENT 'Porct de Detraccion',
  `cod_detrac` varchar(3) NOT NULL DEFAULT '' COMMENT 'Id de detraccion',
  `mon_detrac` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Monto Base de detraccion',
  `oferta` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si esta en Oferta',
  `largo` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'largo',
  `ancho` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'ancho',
  `area` decimal(15,3) NOT NULL COMMENT 'metro cuadrado',
  `aweb` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Estado en la Web',
  `id_product` int(11) NOT NULL DEFAULT 0 COMMENT 'Id de Web',
  `width` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Ancho',
  `height` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Altura',
  `depth` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Profundidad',
  `weight` decimal(20,6) NOT NULL DEFAULT 0.000000 COMMENT 'Peso',
  `costo_adicional` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Costo Adicional',
  `bien_normalizado` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de un Bien normalizado por SUNAT',
  `partida_arancelaria` varchar(15) NOT NULL DEFAULT '' COMMENT 'Nro de Partida arancelaria',
  PRIMARY KEY (`cod_prod`) USING BTREE,
  KEY `cod_cate` (`cod_cate`) USING BTREE,
  KEY `cod_clasi` (`cod_clasi`) USING BTREE,
  KEY `cod_prov` (`cod_prov`) USING BTREE,
  KEY `cod_subc` (`cod_subc`) USING BTREE,
  KEY `cod_ubic` (`cod_ubic`) USING BTREE,
  KEY `cod_unid` (`cod_unid`) USING BTREE,
  KEY `fec_ingre` (`fec_ingre`) USING BTREE,
  KEY `nom_prod` (`nom_prod`) USING BTREE,
  KEY `cod_espe` (`cod_espe`) USING BTREE,
  CONSTRAINT `FK_SOPPROD_SOPLINEA` FOREIGN KEY (`cod_clasi`) REFERENCES `soplinea` (`cod_line`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SOPPROD_SOPSUB1` FOREIGN KEY (`cod_cate`) REFERENCES `sopsub1` (`cod_sub1`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SOPPROD_SOPSUB2` FOREIGN KEY (`cod_subc`) REFERENCES `sopsub2` (`cod_sub2`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SOPPROD_UNIDADES` FOREIGN KEY (`cod_unid`) REFERENCES `unidades` (`cod_unid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sopprod`
--

/*!40000 ALTER TABLE `sopprod` DISABLE KEYS */;
INSERT INTO `sopprod` (`cod_prod`,`cod_clasi`,`cod_cate`,`cod_subc`,`cod_prov`,`cod_espe`,`cod_sunat`,`nom_prod`,`cod_unid`,`nom_unid`,`fac_unid`,`kardoc_costo`,`kardoc_stock`,`kardoc_ultingfec`,`kardoc_ultingcan`,`kardoc_unico`,`fec_ingre`,`flg_descargo`,`tip_moneda`,`flg_serie`,`txt_observa`,`flg_afecto`,`flg_suspen`,`apl_lista`,`foto`,`web`,`bi_c`,`impto1_c`,`impto2_c`,`impto3_c`,`dscto_c`,`bi_v`,`impto1_v`,`impto2_v`,`impto3_v`,`dscto_v`,`cta_s_caja`,`cta_d_caja`,`cod_ubic`,`peso`,`flg_percep`,`por_percep`,`gasto`,`dsctocompra`,`dsctocompra2`,`cod_promo`,`can_promo`,`ult_edicion`,`ptosbonus`,`bonus_moneda`,`bonus_importe`,`flg_detrac`,`por_detrac`,`cod_detrac`,`mon_detrac`,`oferta`,`largo`,`ancho`,`area`,`aweb`,`id_product`,`width`,`height`,`depth`,`weight`,`costo_adicional`,`bien_normalizado`,`partida_arancelaria`) VALUES 
 ('0001','01','004','1','','','','vino tinto','001','UND','1','12.000','12.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-02-21 15:16:39','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0002','01','002','1','','','','BORGONA NEGRO 750ml - 11% Vol.','001','UND','1','30.000','10.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-02-21 15:43:41','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0003','01','002','1','','','','BORGONA BLANCA 750ml - 11% vol.','001','UND','1','50.000','20.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-02-21 18:39:09','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0004','01','002','1','','','','BORGONA ROSE','001','UND','1','30.000','30.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-02-22 09:28:59','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0005','01','002','1','','','','DSANGRE QUEBRANTA 750ml - 11% vol.','001','UND','1','30.000','30.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-02-22 09:30:58','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0006','01','003','1','','','','PISCO ACHOLADO','001','UND','1','20.000','50.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-02-25 10:31:16','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0007','01','005','1','','','','CAJA DE VINO BORGONA BLANCA','001','UND','1','70.000','100.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-03-01 09:00:07','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0008','01','005','1','','','','CAJA DE VINO BLANCO','001','UND','1','70.000','156.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-03-15 20:08:29','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0009','01','005','1','','','','CAJA DE VINO GRAN ROSE','001','UND','1','70.000','92.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-03-15 20:09:57','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0010','01','005','1','','','','CAJA DE VINO BORGONA TINTO','001','UND','1','70.000','26.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-03-15 20:12:13','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0011','01','006','1','','','','CAJA MACERADO DE MARACUYA','001','UND','1','120.000','2.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 07:44:22','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0012','01','006','1','','','','CAJA MACERADO DE MARACUYA','001','UND','1','120.000','2.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 07:44:25','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0013','01','007','1','','','','CAJA MACERADO DE PINA','001','UND','1','120.000','2.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 07:46:58','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0014','01','007','1','','','','CAJA MACERADO DE MARACUYA','001','UND','1','120.000','2.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 07:48:56','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0015','01','007','1','','','','MACERADO DE MARACUYA BOTELLA 500ml','001','UND','1','10.000','12.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 07:51:29','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0016','01','007','1','','','','MACERADO DE PINA BOTELLA 500ml','001','UND','1','10.000','12.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 07:52:38','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0017','01','003','1','','','','CAJA PISCO ACHOLADO (Quebranta-Italia)','001','UND','1','144.000','2.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 07:58:33','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0018','01','003','1','','','','CAJA PISCO ACHOLADO (Quebranta-Italia)','001','UND','1','144.000','2.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 07:58:34','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0019','01','003','1','','','','CAJA PISCO QUEBRANTA','001','UND','1','144.000','2.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 07:59:54','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0020','01','003','1','','','','CAJA PISCO ITALIA','001','UND','1','144.000','2.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 08:01:23','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0021','01','003','1','','','','CAJA PISCO TORONTEL','001','UND','1','156.000','2.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 08:03:34','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0022','01','003','1','','','','PISCO ITALIA BOTELLA 500ml','001','UND','1','10.000','12.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 08:07:29','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0023','01','003','1','','','','PISCO ACHOLADO BOTERLLA500ml','001','UND','1','10.000','12.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 08:08:47','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0024','01','003','1','','','','PISCO ACHOLADO BOTELLA500ml','001','UND','1','10.000','12.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 08:11:19','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0025','01','003','1','','','','PISCO QUEBRANTA BOTELLA500ml','001','UND','1','10.000','12.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 08:12:24','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0026','01','003','1','','','','PISCO TORONTEL BOTELLA 500ml','001','UND','1','13.000','12.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 08:24:22','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,''),
 ('0027','01','005','1','','','','CAJA VINO D SANGRE','001','UND','1','110.000','10.000','0000-00-00','0.000','','0000-00-00',0x01,'1',0x01,'',0x00,0x00,'3','','','','','','','','','','','','','','','','0.000',0x00,'0.000',0x00,'0.000','0.000','','0.000','2026-05-24 08:31:15','0','0','0.00',0x00,'0.000','','0.0000',0x00,'0.000','0.000','0.000',0x00,0,'0.000000','0.000000','0.000000','0.000000','0.00',0x00,'');
/*!40000 ALTER TABLE `sopprod` ENABLE KEYS */;


--
-- Definition of table `sopsub1`
--

DROP TABLE IF EXISTS `sopsub1`;
CREATE TABLE `sopsub1` (
  `cod_sub1` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Categoria',
  `nom_sub1` varchar(100) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `por_dcto` decimal(6,2) NOT NULL DEFAULT 0.00 COMMENT 'Porcentaje - No Usado',
  `num_corr` decimal(5,0) NOT NULL DEFAULT 0 COMMENT 'Correlativo - No Usado',
  `bi_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de BI - Compras',
  `impto1_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto1 - Compras',
  `impto2_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto2 - Compras',
  `impto3_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto3 - Compras',
  `dscto_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Descuento - Compras',
  `bi_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de BI - Ventas',
  `impto1_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto1 - Ventas',
  `impto2_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto2 - Ventas',
  `impto3_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impto3 - Ventas',
  `dscto_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Descuento - Ventas',
  `cta_s_caja` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Caja Soles',
  `cta_d_caja` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Caja Dolares',
  `calidad` char(1) NOT NULL DEFAULT '' COMMENT 'Nro de Calidad',
  `cod_line` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Clasificacion',
  `aweb` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si es para la Web Site',
  PRIMARY KEY (`cod_sub1`) USING BTREE,
  KEY `cod_line` (`cod_line`) USING BTREE,
  KEY `nom_sub1` (`nom_sub1`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sopsub1`
--

/*!40000 ALTER TABLE `sopsub1` DISABLE KEYS */;
INSERT INTO `sopsub1` (`cod_sub1`,`nom_sub1`,`por_dcto`,`num_corr`,`bi_c`,`impto1_c`,`impto2_c`,`impto3_c`,`dscto_c`,`bi_v`,`impto1_v`,`impto2_v`,`impto3_v`,`dscto_v`,`cta_s_caja`,`cta_d_caja`,`calidad`,`cod_line`,`aweb`) VALUES 
 ('002','BORGONA','0.00','0','','','','','','','','','','','','','','',0x00),
 ('003','PISCO','0.00','0','','','','','','','','','','','','','','',0x00),
 ('004','VINO TINTO','0.00','0','','','','','','','','','','','','','','',0x00),
 ('005','CAJAS DE VINO','0.00','0','','','','','','','','','','','','','','',0x00),
 ('006','','0.00','0','','','','','','','','','','','','','','',0x00),
 ('007','MACERADOS','0.00','0','','','','','','','','','','','','','','',0x00);
/*!40000 ALTER TABLE `sopsub1` ENABLE KEYS */;


--
-- Definition of table `sopsub2`
--

DROP TABLE IF EXISTS `sopsub2`;
CREATE TABLE `sopsub2` (
  `cod_sub2` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Sub-Categoria',
  `nom_sub2` varchar(100) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `por_adic` decimal(6,2) NOT NULL DEFAULT 0.00 COMMENT 'Porcentaje - No Usado',
  `cod_sub1` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Categoria',
  `id_manufacturer` int(11) NOT NULL DEFAULT 0 COMMENT 'Id Fabricante',
  `aweb` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si es para la Web Site',
  PRIMARY KEY (`cod_sub2`) USING BTREE,
  KEY `cod_sub1` (`cod_sub1`) USING BTREE,
  KEY `nom_sub2` (`nom_sub2`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sopsub2`
--

/*!40000 ALTER TABLE `sopsub2` DISABLE KEYS */;
INSERT INTO `sopsub2` (`cod_sub2`,`nom_sub2`,`por_adic`,`cod_sub1`,`id_manufacturer`,`aweb`) VALUES 
 ('','TDAGGER','0.00','',0,0x00),
 ('000','[SIN SUB-CATEGORIA]','0.00','',0,0x00),
 ('1','GENERAL','0.00','1',0,0x00);
/*!40000 ALTER TABLE `sopsub2` ENABLE KEYS */;


--
-- Definition of table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `cod_alma` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen',
  `cod_prod` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto',
  `stock_act` decimal(14,3) NOT NULL DEFAULT 0.000 COMMENT 'Stock Actual',
  `stock_ing` decimal(14,3) NOT NULL DEFAULT 0.000 COMMENT 'Stock Transito',
  `stock_ped` decimal(14,3) NOT NULL DEFAULT 0.000 COMMENT 'Stock Pedido',
  `stock_min` decimal(14,3) NOT NULL DEFAULT 0.000 COMMENT 'Stock Minimo',
  `stock_max` decimal(14,3) NOT NULL DEFAULT 0.000 COMMENT 'Stock Maximo',
  `cod_ubic` varchar(25) NOT NULL DEFAULT '' COMMENT 'Ubicacion',
  PRIMARY KEY (`cod_alma`,`cod_prod`) USING BTREE,
  KEY `cod_alma` (`cod_alma`) USING BTREE,
  KEY `cod_prod` (`cod_prod`) USING BTREE,
  CONSTRAINT `FK_STOCKS_ALMACEN` FOREIGN KEY (`cod_alma`) REFERENCES `almacen` (`cod_alma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_STOCKS_SOPPROD` FOREIGN KEY (`cod_prod`) REFERENCES `sopprod` (`cod_prod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `stocks`
--

/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` (`cod_suc`,`cod_alma`,`cod_prod`,`stock_act`,`stock_ing`,`stock_ped`,`stock_min`,`stock_max`,`cod_ubic`) VALUES 
 ('1','109','0001','12.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0002','12.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0003','15.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0004','30.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0005','30.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0006','50.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0007','255.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0008','154.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0009','92.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0010','26.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0011','2.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0012','2.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0013','2.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0014','2.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0015','12.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0016','12.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0017','2.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0018','2.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0019','2.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0020','2.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0021','2.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0022','12.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0023','12.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0024','12.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0025','12.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0026','12.000','0.000','0.000','0.000','0.000',''),
 ('1','109','0027','10.000','0.000','0.000','0.000','0.000','');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;


--
-- Definition of table `sub_categoria`
--

DROP TABLE IF EXISTS `sub_categoria`;
CREATE TABLE `sub_categoria` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_catego` int(11) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sub_id`) USING BTREE,
  KEY `id_catego` (`id_catego`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=890 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sub_categoria`
--

/*!40000 ALTER TABLE `sub_categoria` DISABLE KEYS */;
INSERT INTO `sub_categoria` (`sub_id`,`id_catego`,`nombre`) VALUES 
 (1,48,'PROCESADORES'),
 (2,49,'PLACA MADRE'),
 (882,49,''),
 (883,49,''),
 (884,49,''),
 (885,49,''),
 (886,50,''),
 (887,50,''),
 (888,49,''),
 (889,49,'');
/*!40000 ALTER TABLE `sub_categoria` ENABLE KEYS */;


--
-- Definition of table `subareas`
--

DROP TABLE IF EXISTS `subareas`;
CREATE TABLE `subareas` (
  `codigo` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Sub-Area',
  `descrip` varchar(20) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `descrip` (`descrip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `subareas`
--

/*!40000 ALTER TABLE `subareas` DISABLE KEYS */;
/*!40000 ALTER TABLE `subareas` ENABLE KEYS */;


--
-- Definition of table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal` (
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `des_suc` varchar(100) NOT NULL DEFAULT '' COMMENT 'Descripcion o Razon Social',
  `ruc` char(11) NOT NULL DEFAULT '' COMMENT 'Nro de RUC',
  `telefono` varchar(25) NOT NULL DEFAULT '' COMMENT 'Nro de Telefono(S)',
  `direccion` varchar(100) NOT NULL DEFAULT '' COMMENT 'Direccion',
  `ciudad` varchar(30) NOT NULL DEFAULT '' COMMENT 'Ciudad',
  `distrito` varchar(30) NOT NULL DEFAULT '' COMMENT 'Distrito',
  `ubigeo` varchar(20) NOT NULL DEFAULT '' COMMENT 'Ubigeo',
  `flg_percep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indicador si la Empresa Es Perceptor',
  `cod_alma` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen de Costo Principal',
  `ruta` varchar(250) NOT NULL DEFAULT '' COMMENT 'Ruta de Contabilidad',
  `cod_sunat` char(7) NOT NULL DEFAULT '' COMMENT 'ID Sunat Establecimiento',
  `flg_electronico` varchar(50) NOT NULL DEFAULT '' COMMENT 'Flag de Fact. Electronica',
  `flg_pse` varchar(50) NOT NULL DEFAULT '' COMMENT 'Flag que indica que solo genera TXT',
  `user_sol` varchar(50) NOT NULL DEFAULT '' COMMENT 'Usuario SOL',
  `clave_sol` varchar(50) NOT NULL DEFAULT '' COMMENT 'Clave SOL',
  `archivo_pfx` varchar(100) NOT NULL DEFAULT '' COMMENT 'Archivo PFX',
  `clave_pfx` varchar(100) NOT NULL DEFAULT '' COMMENT 'Clave PFX',
  `fvcto_pfx` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Vcto PFX',
  `conexion_sunat` decimal(2,0) NOT NULL DEFAULT 3 COMMENT 'Tipo de Conexion a Sunat',
  `impresion_sunat` decimal(2,0) NOT NULL DEFAULT 1 COMMENT 'Tipo de Impresion QR SUNAT',
  `cfgesp` text NOT NULL COMMENT 'Configuracion',
  `facturas` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Envio de FA',
  `boletas` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Envio de BV',
  `rutacpe` text NOT NULL COMMENT 'Ruta de CPE',
  `flg_contingencia` varchar(50) NOT NULL DEFAULT '' COMMENT 'Flag doc. contingencia',
  `flg_exonerado` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica exonerado a imptos COMPRAS = NO GRAVADO',
  `registro_mtc` varchar(20) NOT NULL DEFAULT '' COMMENT 'Nro de registro MTC',
  `user_sol_gre` varchar(50) NOT NULL DEFAULT '' COMMENT 'Usuario SOL Guias',
  `clave_sol_gre` varchar(50) NOT NULL DEFAULT '' COMMENT 'Clave SOL Guias',
  `client_id_gre` varchar(250) NOT NULL DEFAULT '' COMMENT 'Client_ID Guias',
  `client_secret_gre` varchar(250) NOT NULL DEFAULT '' COMMENT 'Client_Secret Guias',
  `token_valor_gre` text NOT NULL COMMENT 'Token generado API-Rest SUNAT GUIAS',
  `token_tiempo_gre` varchar(50) NOT NULL DEFAULT '' COMMENT 'Tiempo naximo a usar el TOKEN generado',
  PRIMARY KEY (`cod_suc`) USING BTREE,
  KEY `nom_suc` (`des_suc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sucursal`
--

/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` (`cod_suc`,`des_suc`,`ruc`,`telefono`,`direccion`,`ciudad`,`distrito`,`ubigeo`,`flg_percep`,`cod_alma`,`ruta`,`cod_sunat`,`flg_electronico`,`flg_pse`,`user_sol`,`clave_sol`,`archivo_pfx`,`clave_pfx`,`fvcto_pfx`,`conexion_sunat`,`impresion_sunat`,`cfgesp`,`facturas`,`boletas`,`rutacpe`,`flg_contingencia`,`flg_exonerado`,`registro_mtc`,`user_sol_gre`,`clave_sol_gre`,`client_id_gre`,`client_secret_gre`,`token_valor_gre`,`token_tiempo_gre`) VALUES 
 ('1','','','','','','','',0x00,'','','','','','','','','','0000-00-00','3','1','',0x00,0x00,'','',0x00,'','','','','','','');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;


--
-- Definition of table `sys_dir_departamento`
--

DROP TABLE IF EXISTS `sys_dir_departamento`;
CREATE TABLE `sys_dir_departamento` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_nombre` varchar(300) DEFAULT NULL,
  `dep_cod` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`dep_id`) USING BTREE,
  KEY `dep_cod` (`dep_cod`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sys_dir_departamento`
--

/*!40000 ALTER TABLE `sys_dir_departamento` DISABLE KEYS */;
INSERT INTO `sys_dir_departamento` (`dep_id`,`dep_nombre`,`dep_cod`) VALUES 
 (1,'AMAZONAS','01'),
 (2,'ANCASH','02'),
 (3,'APURIMAC','03'),
 (4,'AREQUIPA','04'),
 (5,'AYACUCHO','05'),
 (6,'CAJAMARCA','06'),
 (7,'CALLAO','07'),
 (8,'CUSCO','08'),
 (9,'HUANCAVELICA','09'),
 (10,'HUANUCO','10'),
 (11,'ICA','11'),
 (12,'JUNIN','12'),
 (13,'LA LIBERTAD','13'),
 (14,'LAMBAYEQUE','14'),
 (15,'LIMA','15'),
 (16,'LORETO','16'),
 (17,'MADRE DE DIOS','17'),
 (18,'MOQUEGUA','18'),
 (19,'PASCO','19'),
 (20,'PIURA','20'),
 (21,'PUNO','21'),
 (22,'SAN MARTIN','22'),
 (23,'TACNA','23'),
 (24,'TUMBES','24'),
 (25,'UCAYALI','25');
/*!40000 ALTER TABLE `sys_dir_departamento` ENABLE KEYS */;


--
-- Definition of table `sys_dir_distrito`
--

DROP TABLE IF EXISTS `sys_dir_distrito`;
CREATE TABLE `sys_dir_distrito` (
  `dis_id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_nombre` varchar(150) DEFAULT NULL,
  `dis_codigo` varchar(2) DEFAULT NULL,
  `pro_codigo` varchar(2) DEFAULT NULL,
  `dep_codigo` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`dis_id`) USING BTREE,
  KEY `dep_codigo` (`dep_codigo`) USING BTREE,
  KEY `pro_codigo` (`pro_codigo`) USING BTREE,
  CONSTRAINT `sys_dir_distrito_ibfk_2` FOREIGN KEY (`pro_codigo`) REFERENCES `sys_dir_provincia` (`pro_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=1875 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sys_dir_distrito`
--

/*!40000 ALTER TABLE `sys_dir_distrito` DISABLE KEYS */;
INSERT INTO `sys_dir_distrito` (`dis_id`,`dis_nombre`,`dis_codigo`,`pro_codigo`,`dep_codigo`) VALUES 
 (1,'CHACHAPOYAS','01','01','01'),
 (2,'ASUNCION','02','01','01'),
 (3,'BALSAS','03','01','01'),
 (4,'CHETO','04','01','01'),
 (5,'CHILIQUIN','05','01','01'),
 (6,'CHUQUIBAMBA','06','01','01'),
 (7,'GRANADA','07','01','01'),
 (8,'HUANCAS','08','01','01'),
 (9,'LA JALCA','09','01','01'),
 (10,'LEIMEBAMBA','10','01','01'),
 (11,'LEVANTO','11','01','01'),
 (12,'MAGDALENA','12','01','01'),
 (13,'MARISCAL CASTILLA','13','01','01'),
 (14,'MOLINOPAMPA','14','01','01'),
 (15,'MONTEVIDEO','15','01','01'),
 (16,'OLLEROS','16','01','01'),
 (17,'QUINJALCA','17','01','01'),
 (18,'SAN FRANCISCO DE DAGUAS','18','01','01'),
 (19,'SAN ISIDRO DE MAINO','19','01','01'),
 (20,'SOLOCO','20','01','01'),
 (21,'SONCHE','21','01','01'),
 (22,'BAGUA','01','02','01'),
 (23,'ARAMANGO','02','02','01'),
 (24,'COPALLIN','03','02','01'),
 (25,'EL PARCO','04','02','01'),
 (26,'IMAZA','05','02','01'),
 (27,'LA PECA','06','02','01'),
 (28,'JUMBILLA','01','03','01'),
 (29,'CHISQUILLA','02','03','01'),
 (30,'CHURUJA','03','03','01'),
 (31,'COROSHA','04','03','01'),
 (32,'CUISPES','05','03','01'),
 (33,'FLORIDA','06','03','01'),
 (34,'JAZAN','07','03','01'),
 (35,'RECTA','08','03','01'),
 (36,'SAN CARLOS','09','03','01'),
 (37,'SHIPASBAMBA','10','03','01'),
 (38,'VALERA','11','03','01'),
 (39,'YAMBRASBAMBA','12','03','01'),
 (40,'NIEVA','01','04','01'),
 (41,'EL CENEPA','02','04','01'),
 (42,'RIO SANTIAGO','03','04','01'),
 (43,'LAMUD','01','05','01'),
 (44,'CAMPORREDONDO','02','05','01'),
 (45,'COCABAMBA','03','05','01'),
 (46,'COLCAMAR','04','05','01'),
 (47,'CONILA','05','05','01'),
 (48,'INGUILPATA','06','05','01'),
 (49,'LONGUITA','07','05','01'),
 (50,'LONYA CHICO','08','05','01'),
 (51,'LUYA','09','05','01'),
 (52,'LUYA VIEJO','10','05','01'),
 (53,'MARIA','11','05','01'),
 (54,'OCALLI','12','05','01'),
 (55,'OCUMAL','13','05','01'),
 (56,'PISUQUIA','14','05','01'),
 (57,'PROVIDENCIA','15','05','01'),
 (58,'SAN CRISTOBAL','16','05','01'),
 (59,'SAN FRANCISCO DEL YESO','17','05','01'),
 (60,'SAN JERONIMO','18','05','01'),
 (61,'SAN JUAN DE LOPECANCHA','19','05','01'),
 (62,'SANTA CATALINA','20','05','01'),
 (63,'SANTO TOMAS','21','05','01'),
 (64,'TINGO','22','05','01'),
 (65,'TRITA','23','05','01'),
 (66,'SAN NICOLAS','01','06','01'),
 (67,'CHIRIMOTO','02','06','01'),
 (68,'COCHAMAL','03','06','01'),
 (69,'HUAMBO','04','06','01'),
 (70,'LIMABAMBA','05','06','01'),
 (71,'LONGAR','06','06','01'),
 (72,'MARISCAL BENAVIDES','07','06','01'),
 (73,'MILPUC','08','06','01'),
 (74,'OMIA','09','06','01'),
 (75,'SANTA ROSA','10','06','01'),
 (76,'TOTORA','11','06','01'),
 (77,'VISTA ALEGRE','12','06','01'),
 (78,'BAGUA GRANDE','01','07','01'),
 (79,'CAJARURO','02','07','01'),
 (80,'CUMBA','03','07','01'),
 (81,'EL MILAGRO','04','07','01'),
 (82,'JAMALCA','05','07','01'),
 (83,'LONYA GRANDE','06','07','01'),
 (84,'YAMON','07','07','01'),
 (85,'HUARAZ','01','01','02'),
 (86,'COCHABAMBA','02','01','02'),
 (87,'COLCABAMBA','03','01','02'),
 (88,'HUANCHAY','04','01','02'),
 (89,'INDEPENDENCIA','05','01','02'),
 (90,'JANGAS','06','01','02'),
 (91,'LA LIBERTAD','07','01','02'),
 (92,'OLLEROS','08','01','02'),
 (93,'PAMPAS','09','01','02'),
 (94,'PARIACOTO','10','01','02'),
 (95,'PIRA','11','01','02'),
 (96,'TARICA','12','01','02'),
 (97,'AIJA','01','02','02'),
 (98,'CORIS','02','02','02'),
 (99,'HUACLLAN','03','02','02'),
 (100,'LA MERCED','04','02','02'),
 (101,'SUCCHA','05','02','02'),
 (102,'LLAMELLIN','01','03','02'),
 (103,'ACZO','02','03','02'),
 (104,'CHACCHO','03','03','02'),
 (105,'CHINGAS','04','03','02'),
 (106,'MIRGAS','05','03','02'),
 (107,'SAN JUAN DE RONTOY','06','03','02'),
 (108,'CHACAS','01','04','02'),
 (109,'ACOCHACA','02','04','02'),
 (110,'CHIQUIAN','01','05','02'),
 (111,'ABELARDO PARDO LEZAMETA','02','05','02'),
 (112,'ANTONIO RAYMONDI','03','05','02'),
 (113,'AQUIA','04','05','02'),
 (114,'CAJACAY','05','05','02'),
 (115,'CANIS','06','05','02'),
 (116,'COLQUIOC','07','05','02'),
 (117,'HUALLANCA','08','05','02'),
 (118,'HUASTA','09','05','02'),
 (119,'HUAYLLACAYAN','10','05','02'),
 (120,'LA PRIMAVERA','11','05','02'),
 (121,'MANGAS','12','05','02'),
 (122,'PACLLON','13','05','02'),
 (123,'SAN MIGUEL DE CORPANQUI','14','05','02'),
 (124,'TICLLOS','15','05','02'),
 (125,'CARHUAZ','01','06','02'),
 (126,'ACOPAMPA','02','06','02'),
 (127,'AMASHCA','03','06','02'),
 (128,'ANTA','04','06','02'),
 (129,'ATAQUERO','05','06','02'),
 (130,'MARCARA','06','06','02'),
 (131,'PARIAHUANCA','07','06','02'),
 (132,'SAN MIGUEL DE ACO','08','06','02'),
 (133,'SHILLA','09','06','02'),
 (134,'TINCO','10','06','02'),
 (135,'YUNGAR','11','06','02'),
 (136,'SAN LUIS','01','07','02'),
 (137,'SAN NICOLAS','02','07','02'),
 (138,'YAUYA','03','07','02'),
 (139,'CASMA','01','08','02'),
 (140,'BUENA VISTA ALTA','02','08','02'),
 (141,'COMANDANTE NOEL','03','08','02'),
 (142,'YAUTAN','04','08','02'),
 (143,'CORONGO','01','09','02'),
 (144,'ACO','02','09','02'),
 (145,'BAMBAS','03','09','02'),
 (146,'CUSCA','04','09','02'),
 (147,'LA PAMPA','05','09','02'),
 (148,'YANAC','06','09','02'),
 (149,'YUPAN','07','09','02'),
 (150,'HUARI','01','10','02'),
 (151,'ANRA','02','10','02'),
 (152,'CAJAY','03','10','02'),
 (153,'CHAVIN DE HUANTAR','04','10','02'),
 (154,'HUACACHI','05','10','02'),
 (155,'HUACCHIS','06','10','02'),
 (156,'HUACHIS','07','10','02'),
 (157,'HUANTAR','08','10','02'),
 (158,'MASIN','09','10','02'),
 (159,'PAUCAS','10','10','02'),
 (160,'PONTO','11','10','02'),
 (161,'RAHUAPAMPA','12','10','02'),
 (162,'RAPAYAN','13','10','02'),
 (163,'SAN MARCOS','14','10','02'),
 (164,'SAN PEDRO DE CHANA','15','10','02'),
 (165,'UCO','16','10','02'),
 (166,'HUARMEY','01','11','02'),
 (167,'COCHAPETI','02','11','02'),
 (168,'CULEBRAS','03','11','02'),
 (169,'HUAYAN','04','11','02'),
 (170,'MALVAS','05','11','02'),
 (171,'CARAZ','01','12','02'),
 (172,'HUALLANCA','02','12','02'),
 (173,'HUATA','03','12','02'),
 (174,'HUAYLAS','04','12','02'),
 (175,'MATO','05','12','02'),
 (176,'PAMPAROMAS','06','12','02'),
 (177,'PUEBLO LIBRE','07','12','02'),
 (178,'SANTA CRUZ','08','12','02'),
 (179,'SANTO TORIBIO','09','12','02'),
 (180,'YURACMARCA','10','12','02'),
 (181,'PISCOBAMBA','01','13','02'),
 (182,'CASCA','02','13','02'),
 (183,'ELEAZAR GUZMAN BARRON','03','13','02'),
 (184,'FIDEL OLIVAS ESCUDERO','04','13','02'),
 (185,'LLAMA','05','13','02'),
 (186,'LLUMPA','06','13','02'),
 (187,'LUCMA','07','13','02'),
 (188,'MUSGA','08','13','02'),
 (189,'OCROS','01','14','02'),
 (190,'ACAS','02','14','02'),
 (191,'CAJAMARQUILLA','03','14','02'),
 (192,'CARHUAPAMPA','04','14','02'),
 (193,'COCHAS','05','14','02'),
 (194,'CONGAS','06','14','02'),
 (195,'LLIPA','07','14','02'),
 (196,'SAN CRISTOBAL DE RAJAN','08','14','02'),
 (197,'SAN PEDRO','09','14','02'),
 (198,'SANTIAGO DE CHILCAS','10','14','02'),
 (199,'CABANA','01','15','02'),
 (200,'BOLOGNESI','02','15','02'),
 (201,'CONCHUCOS','03','15','02'),
 (202,'HUACASCHUQUE','04','15','02'),
 (203,'HUANDOVAL','05','15','02'),
 (204,'LACABAMBA','06','15','02'),
 (205,'LLAPO','07','15','02'),
 (206,'PALLASCA','08','15','02'),
 (207,'PAMPAS','09','15','02'),
 (208,'SANTA ROSA','10','15','02'),
 (209,'TAUCA','11','15','02'),
 (210,'POMABAMBA','01','16','02'),
 (211,'HUAYLLAN','02','16','02'),
 (212,'PAROBAMBA','03','16','02'),
 (213,'QUINUABAMBA','04','16','02'),
 (214,'RECUAY','01','17','02'),
 (215,'CATAC','02','17','02'),
 (216,'COTAPARACO','03','17','02'),
 (217,'HUAYLLAPAMPA','04','17','02'),
 (218,'LLACLLIN','05','17','02'),
 (219,'MARCA','06','17','02'),
 (220,'PAMPAS CHICO','07','17','02'),
 (221,'PARARIN','08','17','02'),
 (222,'TAPACOCHA','09','17','02'),
 (223,'TICAPAMPA','10','17','02'),
 (224,'CHIMBOTE','01','18','02'),
 (225,'CACERES DEL PERU','02','18','02'),
 (226,'COISHCO','03','18','02'),
 (227,'MACATE','04','18','02'),
 (228,'MORO','05','18','02'),
 (229,'NEPENA','06','18','02'),
 (230,'SAMANCO','07','18','02'),
 (231,'SANTA','08','18','02'),
 (232,'NUEVO CHIMBOTE','09','18','02'),
 (233,'SIHUAS','01','19','02'),
 (234,'ACOBAMBA','02','19','02'),
 (235,'ALFONSO UGARTE','03','19','02'),
 (236,'CASHAPAMPA','04','19','02'),
 (237,'CHINGALPO','05','19','02'),
 (238,'HUAYLLABAMBA','06','19','02'),
 (239,'QUICHES','07','19','02'),
 (240,'RAGASH','08','19','02'),
 (241,'SAN JUAN','09','19','02'),
 (242,'SICSIBAMBA','10','19','02'),
 (243,'YUNGAY','01','20','02'),
 (244,'CASCAPARA','02','20','02'),
 (245,'MANCOS','03','20','02'),
 (246,'MATACOTO','04','20','02'),
 (247,'QUILLO','05','20','02'),
 (248,'RANRAHIRCA','06','20','02'),
 (249,'SHUPLUY','07','20','02'),
 (250,'YANAMA','08','20','02'),
 (251,'ABANCAY','01','01','03'),
 (252,'CHACOCHE','02','01','03'),
 (253,'CIRCA','03','01','03'),
 (254,'CURAHUASI','04','01','03'),
 (255,'HUANIPACA','05','01','03'),
 (256,'LAMBRAMA','06','01','03'),
 (257,'PICHIRHUA','07','01','03'),
 (258,'SAN PEDRO DE CACHORA','08','01','03'),
 (259,'TAMBURCO','09','01','03'),
 (260,'ANDAHUAYLAS','01','02','03'),
 (261,'ANDARAPA','02','02','03'),
 (262,'CHIARA','03','02','03'),
 (263,'HUANCARAMA','04','02','03'),
 (264,'HUANCARAY','05','02','03'),
 (265,'HUAYANA','06','02','03'),
 (266,'KISHUARA','07','02','03'),
 (267,'PACOBAMBA','08','02','03'),
 (268,'PACUCHA','09','02','03'),
 (269,'PAMPACHIRI','10','02','03'),
 (270,'POMACOCHA','11','02','03'),
 (271,'SAN ANTONIO DE CACHI','12','02','03'),
 (272,'SAN JERONIMO','13','02','03'),
 (273,'SAN MIGUEL DE CHACCRAMPA','14','02','03'),
 (274,'SANTA MARIA DE CHICMO','15','02','03'),
 (275,'TALAVERA','16','02','03'),
 (276,'TUMAY HUARACA','17','02','03'),
 (277,'TURPO','18','02','03'),
 (278,'KAQUIABAMBA','19','02','03'),
 (279,'JOSE MARIA ARGUEDAS','20','02','03'),
 (280,'ANTABAMBA','01','03','03'),
 (281,'EL ORO','02','03','03'),
 (282,'HUAQUIRCA','03','03','03'),
 (283,'JUAN ESPINOZA MEDRANO','04','03','03'),
 (284,'OROPESA','05','03','03'),
 (285,'PACHACONAS','06','03','03'),
 (286,'SABAINO','07','03','03'),
 (287,'CHALHUANCA','01','04','03'),
 (288,'CAPAYA','02','04','03'),
 (289,'CARAYBAMBA','03','04','03'),
 (290,'CHAPIMARCA','04','04','03'),
 (291,'COLCABAMBA','05','04','03'),
 (292,'COTARUSE','06','04','03'),
 (293,'HUAYLLO','07','04','03'),
 (294,'JUSTO APU SAHUARAURA','08','04','03'),
 (295,'LUCRE','09','04','03'),
 (296,'POCOHUANCA','10','04','03'),
 (297,'SAN JUAN DE CHACNA','11','04','03'),
 (298,'SANAYCA','12','04','03'),
 (299,'SORAYA','13','04','03'),
 (300,'TAPAIRIHUA','14','04','03'),
 (301,'TINTAY','15','04','03'),
 (302,'TORAYA','16','04','03'),
 (303,'YANACA','17','04','03'),
 (304,'TAMBOBAMBA','01','05','03'),
 (305,'COTABAMBAS','02','05','03'),
 (306,'COYLLURQUI','03','05','03'),
 (307,'HAQUIRA','04','05','03'),
 (308,'MARA','05','05','03'),
 (309,'CHALLHUAHUACHO','06','05','03'),
 (310,'CHINCHEROS','01','06','03'),
 (311,'ANCO_HUALLO','02','06','03'),
 (312,'COCHARCAS','03','06','03'),
 (313,'HUACCANA','04','06','03'),
 (314,'OCOBAMBA','05','06','03'),
 (315,'ONGOY','06','06','03'),
 (316,'URANMARCA','07','06','03'),
 (317,'RANRACANCHA','08','06','03'),
 (318,'ROCCHACC','09','06','03'),
 (319,'EL PORVENIR','10','06','03'),
 (320,'LOS CHANKAS','11','06','03'),
 (321,'CHUQUIBAMBILLA','01','07','03'),
 (322,'CURPAHUASI','02','07','03'),
 (323,'GAMARRA','03','07','03'),
 (324,'HUAYLLATI','04','07','03'),
 (325,'MAMARA','05','07','03'),
 (326,'MICAELA BASTIDAS','06','07','03'),
 (327,'PATAYPAMPA','07','07','03'),
 (328,'PROGRESO','08','07','03'),
 (329,'SAN ANTONIO','09','07','03'),
 (330,'SANTA ROSA','10','07','03'),
 (331,'TURPAY','11','07','03'),
 (332,'VILCABAMBA','12','07','03'),
 (333,'VIRUNDO','13','07','03'),
 (334,'CURASCO','14','07','03'),
 (335,'AREQUIPA','01','01','04'),
 (336,'ALTO SELVA ALEGRE','02','01','04'),
 (337,'CAYMA','03','01','04'),
 (338,'CERRO COLORADO','04','01','04'),
 (339,'CHARACATO','05','01','04'),
 (340,'CHIGUATA','06','01','04'),
 (341,'JACOBO HUNTER','07','01','04'),
 (342,'LA JOYA','08','01','04'),
 (343,'MARIANO MELGAR','09','01','04'),
 (344,'MIRAFLORES','10','01','04'),
 (345,'MOLLEBAYA','11','01','04'),
 (346,'PAUCARPATA','12','01','04'),
 (347,'POCSI','13','01','04'),
 (348,'POLOBAYA','14','01','04'),
 (349,'QUEQUENA','15','01','04'),
 (350,'SABANDIA','16','01','04'),
 (351,'SACHACA','17','01','04'),
 (352,'SAN JUAN DE SIGUAS','18','01','04'),
 (353,'SAN JUAN DE TARUCANI','19','01','04'),
 (354,'SANTA ISABEL DE SIGUAS','20','01','04'),
 (355,'SANTA RITA DE SIGUAS','21','01','04'),
 (356,'SOCABAYA','22','01','04'),
 (357,'TIABAYA','23','01','04'),
 (358,'UCHUMAYO','24','01','04'),
 (359,'VITOR','25','01','04'),
 (360,'YANAHUARA','26','01','04'),
 (361,'YARABAMBA','27','01','04'),
 (362,'YURA','28','01','04'),
 (363,'JOSE LUIS BUSTAMANTE Y RIVERO','29','01','04'),
 (364,'CAMANA','01','02','04'),
 (365,'JOSE MARIA QUIMPER','02','02','04'),
 (366,'MARIANO NICOLAS VALCARCEL','03','02','04'),
 (367,'MARISCAL CACERES','04','02','04'),
 (368,'NICOLAS DE PIEROLA','05','02','04'),
 (369,'OCONA','06','02','04'),
 (370,'QUILCA','07','02','04'),
 (371,'SAMUEL PASTOR','08','02','04'),
 (372,'CARAVELI','01','03','04'),
 (373,'ACARI','02','03','04'),
 (374,'ATICO','03','03','04'),
 (375,'ATIQUIPA','04','03','04'),
 (376,'BELLA UNION','05','03','04'),
 (377,'CAHUACHO','06','03','04'),
 (378,'CHALA','07','03','04'),
 (379,'CHAPARRA','08','03','04'),
 (380,'HUANUHUANU','09','03','04'),
 (381,'JAQUI','10','03','04'),
 (382,'LOMAS','11','03','04'),
 (383,'QUICACHA','12','03','04'),
 (384,'YAUCA','13','03','04'),
 (385,'APLAO','01','04','04'),
 (386,'ANDAGUA','02','04','04'),
 (387,'AYO','03','04','04'),
 (388,'CHACHAS','04','04','04'),
 (389,'CHILCAYMARCA','05','04','04'),
 (390,'CHOCO','06','04','04'),
 (391,'HUANCARQUI','07','04','04'),
 (392,'MACHAGUAY','08','04','04'),
 (393,'ORCOPAMPA','09','04','04'),
 (394,'PAMPACOLCA','10','04','04'),
 (395,'TIPAN','11','04','04'),
 (396,'UNON','12','04','04'),
 (397,'URACA','13','04','04'),
 (398,'VIRACO','14','04','04'),
 (399,'CHIVAY','01','05','04'),
 (400,'ACHOMA','02','05','04'),
 (401,'CABANACONDE','03','05','04'),
 (402,'CALLALLI','04','05','04'),
 (403,'CAYLLOMA','05','05','04'),
 (404,'COPORAQUE','06','05','04'),
 (405,'HUAMBO','07','05','04'),
 (406,'HUANCA','08','05','04'),
 (407,'ICHUPAMPA','09','05','04'),
 (408,'LARI','10','05','04'),
 (409,'LLUTA','11','05','04'),
 (410,'MACA','12','05','04'),
 (411,'MADRIGAL','13','05','04'),
 (412,'SAN ANTONIO DE CHUCA','14','05','04'),
 (413,'SIBAYO','15','05','04'),
 (414,'TAPAY','16','05','04'),
 (415,'TISCO','17','05','04'),
 (416,'TUTI','18','05','04'),
 (417,'YANQUE','19','05','04'),
 (418,'MAJES','20','05','04'),
 (419,'CHUQUIBAMBA','01','06','04'),
 (420,'ANDARAY','02','06','04'),
 (421,'CAYARANI','03','06','04'),
 (422,'CHICHAS','04','06','04'),
 (423,'IRAY','05','06','04'),
 (424,'RIO GRANDE','06','06','04'),
 (425,'SALAMANCA','07','06','04'),
 (426,'YANAQUIHUA','08','06','04'),
 (427,'MOLLENDO','01','07','04'),
 (428,'COCACHACRA','02','07','04'),
 (429,'DEAN VALDIVIA','03','07','04'),
 (430,'ISLAY','04','07','04'),
 (431,'MEJIA','05','07','04'),
 (432,'PUNTA DE BOMBON','06','07','04'),
 (433,'COTAHUASI','01','08','04'),
 (434,'ALCA','02','08','04'),
 (435,'CHARCANA','03','08','04'),
 (436,'HUAYNACOTAS','04','08','04'),
 (437,'PAMPAMARCA','05','08','04'),
 (438,'PUYCA','06','08','04'),
 (439,'QUECHUALLA','07','08','04'),
 (440,'SAYLA','08','08','04'),
 (441,'TAURIA','09','08','04'),
 (442,'TOMEPAMPA','10','08','04'),
 (443,'TORO','11','08','04'),
 (444,'AYACUCHO','01','01','05'),
 (445,'ACOCRO','02','01','05'),
 (446,'ACOS VINCHOS','03','01','05'),
 (447,'CARMEN ALTO','04','01','05'),
 (448,'CHIARA','05','01','05'),
 (449,'OCROS','06','01','05'),
 (450,'PACAYCASA','07','01','05'),
 (451,'QUINUA','08','01','05'),
 (452,'SAN JOSE DE TICLLAS','09','01','05'),
 (453,'SAN JUAN BAUTISTA','10','01','05'),
 (454,'SANTIAGO DE PISCHA','11','01','05'),
 (455,'SOCOS','12','01','05'),
 (456,'TAMBILLO','13','01','05'),
 (457,'VINCHOS','14','01','05'),
 (458,'JESUS NAZARENO','15','01','05'),
 (459,'ANDRES AVELINO CACERES DORREGARAY','16','01','05'),
 (460,'CANGALLO','01','02','05'),
 (461,'CHUSCHI','02','02','05'),
 (462,'LOS MOROCHUCOS','03','02','05'),
 (463,'MARIA PARADO DE BELLIDO','04','02','05'),
 (464,'PARAS','05','02','05'),
 (465,'TOTOS','06','02','05'),
 (466,'SANCOS','01','03','05'),
 (467,'CARAPO','02','03','05'),
 (468,'SACSAMARCA','03','03','05'),
 (469,'SANTIAGO DE LUCANAMARCA','04','03','05'),
 (470,'HUANTA','01','04','05'),
 (471,'AYAHUANCO','02','04','05'),
 (472,'HUAMANGUILLA','03','04','05'),
 (473,'IGUAIN','04','04','05'),
 (474,'LURICOCHA','05','04','05'),
 (475,'SANTILLANA','06','04','05'),
 (476,'SIVIA','07','04','05'),
 (477,'LLOCHEGUA','08','04','05'),
 (478,'CANAYRE','09','04','05'),
 (479,'UCHURACCAY','10','04','05'),
 (480,'PUCACOLPA','11','04','05'),
 (481,'CHACA','12','04','05'),
 (482,'SAN MIGUEL','01','05','05'),
 (483,'ANCO','02','05','05'),
 (484,'AYNA','03','05','05'),
 (485,'CHILCAS','04','05','05'),
 (486,'CHUNGUI','05','05','05'),
 (487,'LUIS CARRANZA','06','05','05'),
 (488,'SANTA ROSA','07','05','05'),
 (489,'TAMBO','08','05','05'),
 (490,'SAMUGARI','09','05','05'),
 (491,'ANCHIHUAY','10','05','05'),
 (492,'ORONCCOY','11','05','05'),
 (493,'PUQUIO','01','06','05'),
 (494,'AUCARA','02','06','05'),
 (495,'CABANA','03','06','05'),
 (496,'CARMEN SALCEDO','04','06','05'),
 (497,'CHAVINA','05','06','05'),
 (498,'CHIPAO','06','06','05'),
 (499,'HUAC-HUAS','07','06','05'),
 (500,'LARAMATE','08','06','05'),
 (501,'LEONCIO PRADO','09','06','05'),
 (502,'LLAUTA','10','06','05'),
 (503,'LUCANAS','11','06','05'),
 (504,'OCANA','12','06','05'),
 (505,'OTOCA','13','06','05'),
 (506,'SAISA','14','06','05'),
 (507,'SAN CRISTOBAL','15','06','05'),
 (508,'SAN JUAN','16','06','05'),
 (509,'SAN PEDRO','17','06','05'),
 (510,'SAN PEDRO DE PALCO','18','06','05'),
 (511,'SANCOS','19','06','05'),
 (512,'SANTA ANA DE HUAYCAHUACHO','20','06','05'),
 (513,'SANTA LUCIA','21','06','05'),
 (514,'CORACORA','01','07','05'),
 (515,'CHUMPI','02','07','05'),
 (516,'CORONEL CASTANEDA','03','07','05'),
 (517,'PACAPAUSA','04','07','05'),
 (518,'PULLO','05','07','05'),
 (519,'PUYUSCA','06','07','05'),
 (520,'SAN FRANCISCO DE RAVACAYCO','07','07','05'),
 (521,'UPAHUACHO','08','07','05'),
 (522,'PAUSA','01','08','05'),
 (523,'COLTA','02','08','05'),
 (524,'CORCULLA','03','08','05'),
 (525,'LAMPA','04','08','05'),
 (526,'MARCABAMBA','05','08','05'),
 (527,'OYOLO','06','08','05'),
 (528,'PARARCA','07','08','05'),
 (529,'SAN JAVIER DE ALPABAMBA','08','08','05'),
 (530,'SAN JOSE DE USHUA','09','08','05'),
 (531,'SARA SARA','10','08','05'),
 (532,'QUEROBAMBA','01','09','05'),
 (533,'BELEN','02','09','05'),
 (534,'CHALCOS','03','09','05'),
 (535,'CHILCAYOC','04','09','05'),
 (536,'HUACANA','05','09','05'),
 (537,'MORCOLLA','06','09','05'),
 (538,'PAICO','07','09','05'),
 (539,'SAN PEDRO DE LARCAY','08','09','05'),
 (540,'SAN SALVADOR DE QUIJE','09','09','05'),
 (541,'SANTIAGO DE PAUCARAY','10','09','05'),
 (542,'SORAS','11','09','05'),
 (543,'HUANCAPI','01','10','05'),
 (544,'ALCAMENCA','02','10','05'),
 (545,'APONGO','03','10','05'),
 (546,'ASQUIPATA','04','10','05'),
 (547,'CANARIA','05','10','05'),
 (548,'CAYARA','06','10','05'),
 (549,'COLCA','07','10','05'),
 (550,'HUAMANQUIQUIA','08','10','05'),
 (551,'HUANCARAYLLA','09','10','05'),
 (552,'HUAYA','10','10','05'),
 (553,'SARHUA','11','10','05'),
 (554,'VILCANCHOS','12','10','05'),
 (555,'VILCAS HUAMAN','01','11','05'),
 (556,'ACCOMARCA','02','11','05'),
 (557,'CARHUANCA','03','11','05'),
 (558,'CONCEPCION','04','11','05'),
 (559,'HUAMBALPA','05','11','05'),
 (560,'INDEPENDENCIA','06','11','05'),
 (561,'SAURAMA','07','11','05'),
 (562,'VISCHONGO','08','11','05'),
 (563,'CAJAMARCA','01','01','06'),
 (564,'ASUNCION','02','01','06'),
 (565,'CHETILLA','03','01','06'),
 (566,'COSPAN','04','01','06'),
 (567,'ENCANADA','05','01','06'),
 (568,'JESUS','06','01','06'),
 (569,'LLACANORA','07','01','06'),
 (570,'LOS BANOS DEL INCA','08','01','06'),
 (571,'MAGDALENA','09','01','06'),
 (572,'MATARA','10','01','06'),
 (573,'NAMORA','11','01','06'),
 (574,'SAN JUAN','12','01','06'),
 (575,'CAJABAMBA','01','02','06'),
 (576,'CACHACHI','02','02','06'),
 (577,'CONDEBAMBA','03','02','06'),
 (578,'SITACOCHA','04','02','06'),
 (579,'CELENDIN','01','03','06'),
 (580,'CHUMUCH','02','03','06'),
 (581,'CORTEGANA','03','03','06'),
 (582,'HUASMIN','04','03','06'),
 (583,'JORGE CHAVEZ','05','03','06'),
 (584,'JOSE GALVEZ','06','03','06'),
 (585,'MIGUEL IGLESIAS','07','03','06'),
 (586,'OXAMARCA','08','03','06'),
 (587,'SOROCHUCO','09','03','06'),
 (588,'SUCRE','10','03','06'),
 (589,'UTCO','11','03','06'),
 (590,'LA LIBERTAD DE PALLAN','12','03','06'),
 (591,'CHOTA','01','04','06'),
 (592,'ANGUIA','02','04','06'),
 (593,'CHADIN','03','04','06'),
 (594,'CHIGUIRIP','04','04','06'),
 (595,'CHIMBAN','05','04','06'),
 (596,'CHOROPAMPA','06','04','06'),
 (597,'COCHABAMBA','07','04','06'),
 (598,'CONCHAN','08','04','06'),
 (599,'HUAMBOS','09','04','06'),
 (600,'LAJAS','10','04','06'),
 (601,'LLAMA','11','04','06'),
 (602,'MIRACOSTA','12','04','06'),
 (603,'PACCHA','13','04','06'),
 (604,'PION','14','04','06'),
 (605,'QUEROCOTO','15','04','06'),
 (606,'SAN JUAN DE LICUPIS','16','04','06'),
 (607,'TACABAMBA','17','04','06'),
 (608,'TOCMOCHE','18','04','06'),
 (609,'CHALAMARCA','19','04','06'),
 (610,'CONTUMAZA','01','05','06'),
 (611,'CHILETE','02','05','06'),
 (612,'CUPISNIQUE','03','05','06'),
 (613,'GUZMANGO','04','05','06'),
 (614,'SAN BENITO','05','05','06'),
 (615,'SANTA CRUZ DE TOLED','06','05','06'),
 (616,'TANTARICA','07','05','06'),
 (617,'YONAN','08','05','06'),
 (618,'CUTERVO','01','06','06'),
 (619,'CALLAYUC','02','06','06'),
 (620,'CHOROS','03','06','06'),
 (621,'CUJILLO','04','06','06'),
 (622,'LA RAMADA','05','06','06'),
 (623,'PIMPINGOS','06','06','06'),
 (624,'QUEROCOTILLO','07','06','06'),
 (625,'SAN ANDRES DE CUTERVO','08','06','06'),
 (626,'SAN JUAN DE CUTERVO','09','06','06'),
 (627,'SAN LUIS DE LUCMA','10','06','06'),
 (628,'SANTA CRUZ','11','06','06'),
 (629,'SANTO DOMINGO DE LA CAPILLA','12','06','06'),
 (630,'SANTO TOMAS','13','06','06'),
 (631,'SOCOTA','14','06','06'),
 (632,'TORIBIO CASANOVA','15','06','06'),
 (633,'BAMBAMARCA','01','07','06'),
 (634,'CHUGUR','02','07','06'),
 (635,'HUALGAYOC','03','07','06'),
 (636,'JAEN','01','08','06'),
 (637,'BELLAVISTA','02','08','06'),
 (638,'CHONTALI','03','08','06'),
 (639,'COLASAY','04','08','06'),
 (640,'HUABAL','05','08','06'),
 (641,'LAS PIRIAS','06','08','06'),
 (642,'POMAHUACA','07','08','06'),
 (643,'PUCARA','08','08','06'),
 (644,'SALLIQUE','09','08','06'),
 (645,'SAN FELIPE','10','08','06'),
 (646,'SAN JOSE DEL ALTO','11','08','06'),
 (647,'SANTA ROSA','12','08','06'),
 (648,'SAN IGNACIO','01','09','06'),
 (649,'CHIRINOS','02','09','06'),
 (650,'HUARANGO','03','09','06'),
 (651,'LA COIPA','04','09','06'),
 (652,'NAMBALLE','05','09','06'),
 (653,'SAN JOSE DE LOURDES','06','09','06'),
 (654,'TABACONAS','07','09','06'),
 (655,'PEDRO GALVEZ','01','10','06'),
 (656,'CHANCAY','02','10','06'),
 (657,'EDUARDO VILLANUEVA','03','10','06'),
 (658,'GREGORIO PITA','04','10','06'),
 (659,'ICHOCAN','05','10','06'),
 (660,'JOSE MANUEL QUIROZ','06','10','06'),
 (661,'JOSE SABOGAL','07','10','06'),
 (662,'SAN MIGUEL','01','11','06'),
 (663,'BOLIVAR','02','11','06'),
 (664,'CALQUIS','03','11','06'),
 (665,'CATILLUC','04','11','06'),
 (666,'EL PRADO','05','11','06'),
 (667,'LA FLORIDA','06','11','06'),
 (668,'LLAPA','07','11','06'),
 (669,'NANCHOC','08','11','06'),
 (670,'NIEPOS','09','11','06'),
 (671,'SAN GREGORIO','10','11','06'),
 (672,'SAN SILVESTRE DE COCHAN','11','11','06'),
 (673,'TONGOD','12','11','06'),
 (674,'UNION AGUA BLANCA','13','11','06'),
 (675,'SAN PABLO','01','12','06'),
 (676,'SAN BERNARDINO','02','12','06'),
 (677,'SAN LUIS','03','12','06'),
 (678,'TUMBADEN','04','12','06'),
 (679,'SANTA CRUZ','01','13','06'),
 (680,'ANDABAMBA','02','13','06'),
 (681,'CATACHE','03','13','06'),
 (682,'CHANCAYBANOS','04','13','06'),
 (683,'LA ESPERANZA','05','13','06'),
 (684,'NINABAMBA','06','13','06'),
 (685,'PULAN','07','13','06'),
 (686,'SAUCEPAMPA','08','13','06'),
 (687,'SEXI','09','13','06'),
 (688,'UTICYACU','10','13','06'),
 (689,'YAUYUCAN','11','13','06'),
 (690,'CALLAO','01','01','07'),
 (691,'BELLAVISTA','02','01','07'),
 (692,'CARMEN DE LA LEGUA','03','01','07'),
 (693,'LA PERLA','04','01','07'),
 (694,'LA PUNTA','05','01','07'),
 (695,'VENTANILLA','06','01','07'),
 (696,'MI PERU','07','01','07'),
 (697,'CUSCO','01','01','08'),
 (698,'CCORCA','02','01','08'),
 (699,'POROY','03','01','08'),
 (700,'SAN JERONIMO','04','01','08'),
 (701,'SAN SEBASTIAN','05','01','08'),
 (702,'SANTIAGO','06','01','08'),
 (703,'SAYLLA','07','01','08'),
 (704,'WANCHAQ','08','01','08'),
 (705,'ACOMAYO','01','02','08'),
 (706,'ACOPIA','02','02','08'),
 (707,'ACOS','03','02','08'),
 (708,'MOSOC LLACTA','04','02','08'),
 (709,'POMACANCHI','05','02','08'),
 (710,'RONDOCAN','06','02','08'),
 (711,'SANGARARA','07','02','08'),
 (712,'ANTA','01','03','08'),
 (713,'ANCAHUASI','02','03','08'),
 (714,'CACHIMAYO','03','03','08'),
 (715,'CHINCHAYPUJIO','04','03','08'),
 (716,'HUAROCONDO','05','03','08'),
 (717,'LIMATAMBO','06','03','08'),
 (718,'MOLLEPATA','07','03','08'),
 (719,'PUCYURA','08','03','08'),
 (720,'ZURITE','09','03','08'),
 (721,'CALCA','01','04','08'),
 (722,'COYA','02','04','08'),
 (723,'LAMAY','03','04','08'),
 (724,'LARES','04','04','08'),
 (725,'PISAC','05','04','08'),
 (726,'SAN SALVADOR','06','04','08'),
 (727,'TARAY','07','04','08'),
 (728,'YANATILE','08','04','08'),
 (729,'YANAOCA','01','05','08'),
 (730,'CHECCA','02','05','08'),
 (731,'KUNTURKANKI','03','05','08'),
 (732,'LANGUI','04','05','08'),
 (733,'LAYO','05','05','08'),
 (734,'PAMPAMARCA','06','05','08'),
 (735,'QUEHUE','07','05','08'),
 (736,'TUPAC AMARU','08','05','08'),
 (737,'SICUANI','01','06','08'),
 (738,'CHECACUPE','02','06','08'),
 (739,'COMBAPATA','03','06','08'),
 (740,'MARANGANI','04','06','08'),
 (741,'PITUMARCA','05','06','08'),
 (742,'SAN PABLO','06','06','08'),
 (743,'SAN PEDRO','07','06','08'),
 (744,'TINTA','08','06','08'),
 (745,'SANTO TOMAS','01','07','08'),
 (746,'CAPACMARCA','02','07','08'),
 (747,'CHAMACA','03','07','08'),
 (748,'COLQUEMARCA','04','07','08'),
 (749,'LIVITACA','05','07','08'),
 (750,'LLUSCO','06','07','08'),
 (751,'QUINOTA','07','07','08'),
 (752,'VELILLE','08','07','08'),
 (753,'ESPINAR','01','08','08'),
 (754,'CONDOROMA','02','08','08'),
 (755,'COPORAQUE','03','08','08'),
 (756,'OCORURO','04','08','08'),
 (757,'PALLPATA','05','08','08'),
 (758,'PICHIGUA','06','08','08'),
 (759,'SUYCKUTAMBO','07','08','08'),
 (760,'ALTO PICHIGUA','08','08','08'),
 (761,'SANTA ANA','01','09','08'),
 (762,'ECHARATE','02','09','08'),
 (763,'HUAYOPATA','03','09','08'),
 (764,'MARANURA','04','09','08'),
 (765,'OCOBAMBA','05','09','08'),
 (766,'QUELLOUNO','06','09','08'),
 (767,'KIMBIRI','07','09','08'),
 (768,'SANTA TERESA','08','09','08'),
 (769,'VILCABAMBA','09','09','08'),
 (770,'PICHARI','10','09','08'),
 (771,'INKAWASI','11','09','08'),
 (772,'VILLA VIRGEN','12','09','08'),
 (773,'VILLA KINTIARINA','13','09','08'),
 (774,'MEGANTONI','14','09','08'),
 (775,'PARURO','01','10','08'),
 (776,'ACCHA','02','10','08'),
 (777,'CCAPI','03','10','08'),
 (778,'COLCHA','04','10','08'),
 (779,'HUANOQUITE','05','10','08'),
 (780,'OMACHA','06','10','08'),
 (781,'PACCARITAMBO','07','10','08'),
 (782,'PILLPINTO','08','10','08'),
 (783,'YAURISQUE','09','10','08'),
 (784,'PAUCARTAMBO','01','11','08'),
 (785,'CAICAY','02','11','08'),
 (786,'CHALLABAMBA','03','11','08'),
 (787,'COLQUEPATA','04','11','08'),
 (788,'HUANCARANI','05','11','08'),
 (789,'KOSNIPATA','06','11','08'),
 (790,'URCOS','01','12','08'),
 (791,'ANDAHUAYLILLAS','02','12','08'),
 (792,'CAMANTI','03','12','08'),
 (793,'CCARHUAYO','04','12','08'),
 (794,'CCATCA','05','12','08'),
 (795,'CUSIPATA','06','12','08'),
 (796,'HUARO','07','12','08'),
 (797,'LUCRE','08','12','08'),
 (798,'MARCAPATA','09','12','08'),
 (799,'OCONGATE','10','12','08'),
 (800,'OROPESA','11','12','08'),
 (801,'QUIQUIJANA','12','12','08'),
 (802,'URUBAMBA','01','13','08'),
 (803,'CHINCHERO','02','13','08'),
 (804,'HUAYLLABAMBA','03','13','08'),
 (805,'MACHUPICCHU','04','13','08'),
 (806,'MARAS','05','13','08'),
 (807,'OLLANTAYTAMBO','06','13','08'),
 (808,'YUCAY','07','13','08'),
 (809,'HUANCAVELICA','01','01','09'),
 (810,'ACOBAMBILLA','02','01','09'),
 (811,'ACORIA','03','01','09'),
 (812,'CONAYCA','04','01','09'),
 (813,'CUENCA','05','01','09'),
 (814,'HUACHOCOLPA','06','01','09'),
 (815,'HUAYLLAHUARA','07','01','09'),
 (816,'IZCUCHACA','08','01','09'),
 (817,'LARIA','09','01','09'),
 (818,'MANTA','10','01','09'),
 (819,'MARISCAL CACERES','11','01','09'),
 (820,'MOYA','12','01','09'),
 (821,'NUEVO OCCORO','13','01','09'),
 (822,'PALCA','14','01','09'),
 (823,'PILCHACA','15','01','09'),
 (824,'VILCA','16','01','09'),
 (825,'YAULI','17','01','09'),
 (826,'ASCENSION','18','01','09'),
 (827,'HUANDO','19','01','09'),
 (828,'ACOBAMBA','01','02','09'),
 (829,'ANDABAMBA','02','02','09'),
 (830,'ANTA','03','02','09'),
 (831,'CAJA','04','02','09'),
 (832,'MARCAS','05','02','09'),
 (833,'PAUCARA','06','02','09'),
 (834,'POMACOCHA','07','02','09'),
 (835,'ROSARIO','08','02','09'),
 (836,'LIRCAY','01','03','09'),
 (837,'ANCHONGA','02','03','09'),
 (838,'CALLANMARCA','03','03','09'),
 (839,'CCOCHACCASA','04','03','09'),
 (840,'CHINCHO','05','03','09'),
 (841,'CONGALLA','06','03','09'),
 (842,'HUANCA-HUANCA','07','03','09'),
 (843,'HUAYLLAY GRANDE','08','03','09'),
 (844,'JULCAMARCA','09','03','09'),
 (845,'SAN ANTONIO DE ANTAPARCO','10','03','09'),
 (846,'SANTO TOMAS DE PATA','11','03','09'),
 (847,'SECCLLA','12','03','09'),
 (848,'CASTROVIRREYNA','01','04','09'),
 (849,'ARMA','02','04','09'),
 (850,'AURAHUA','03','04','09'),
 (851,'CAPILLAS','04','04','09'),
 (852,'CHUPAMARCA','05','04','09'),
 (853,'COCAS','06','04','09'),
 (854,'HUACHOS','07','04','09'),
 (855,'HUAMATAMBO','08','04','09'),
 (856,'MOLLEPAMPA','09','04','09'),
 (857,'SAN JUAN','10','04','09'),
 (858,'SANTA ANA','11','04','09'),
 (859,'TANTARA','12','04','09'),
 (860,'TICRAPO','13','04','09'),
 (861,'CHURCAMPA','01','05','09'),
 (862,'ANCO','02','05','09'),
 (863,'CHINCHIHUASI','03','05','09'),
 (864,'EL CARMEN','04','05','09'),
 (865,'LA MERCED','05','05','09'),
 (866,'LOCROJA','06','05','09'),
 (867,'PAUCARBAMBA','07','05','09'),
 (868,'SAN MIGUEL DE MAYOCC','08','05','09'),
 (869,'SAN PEDRO DE CORIS','09','05','09'),
 (870,'PACHAMARCA','10','05','09'),
 (871,'COSME','11','05','09'),
 (872,'HUAYTARA','01','06','09'),
 (873,'AYAVI','02','06','09'),
 (874,'CORDOVA','03','06','09'),
 (875,'HUAYACUNDO ARMA','04','06','09'),
 (876,'LARAMARCA','05','06','09'),
 (877,'OCOYO','06','06','09'),
 (878,'PILPICHACA','07','06','09'),
 (879,'QUERCO','08','06','09'),
 (880,'QUITO-ARMA','09','06','09'),
 (881,'SAN ANTONIO DE CUSICANCHA','10','06','09'),
 (882,'SAN FRANCISCO DE SANGAYAICO','11','06','09'),
 (883,'SAN ISIDRO','12','06','09'),
 (884,'SANTIAGO DE CHOCORVOS','13','06','09'),
 (885,'SANTIAGO DE QUIRAHUARA','14','06','09'),
 (886,'SANTO DOMINGO DE CAPILLAS','15','06','09'),
 (887,'TAMBO','16','06','09'),
 (888,'PAMPAS','01','07','09'),
 (889,'ACOSTAMBO','02','07','09'),
 (890,'ACRAQUIA','03','07','09'),
 (891,'AHUAYCHA','04','07','09'),
 (892,'COLCABAMBA','05','07','09'),
 (893,'DANIEL HERNANDEZ','06','07','09'),
 (894,'HUACHOCOLPA','07','07','09'),
 (895,'HUARIBAMBA','09','07','09'),
 (896,'NAHUIMPUQUIO','10','07','09'),
 (897,'PAZOS','11','07','09'),
 (898,'QUISHUAR','13','07','09'),
 (899,'SALCABAMBA','14','07','09'),
 (900,'SALCAHUASI','15','07','09'),
 (901,'SAN MARCOS DE ROCCHAC','16','07','09'),
 (902,'SURCUBAMBA','17','07','09'),
 (903,'TINTAY PUNCU','18','07','09'),
 (904,'QUICHUAS','19','07','09'),
 (905,'ANDAYMARCA','20','07','09'),
 (906,'ROBLE','21','07','09'),
 (907,'PICHOS','22','07','09'),
 (908,'SANTIAGO DE TUCUMA','23','07','09'),
 (909,'HUANUCO','01','01','10'),
 (910,'AMARILIS','02','01','10'),
 (911,'CHINCHAO','03','01','10'),
 (912,'CHURUBAMBA','04','01','10'),
 (913,'MARGOS','05','01','10'),
 (914,'QUISQUI','06','01','10'),
 (915,'SAN FRANCISCO DE CAYRAN','07','01','10'),
 (916,'SAN PEDRO DE CHAULAN','08','01','10'),
 (917,'SANTA MARIA DEL VALLE','09','01','10'),
 (918,'YARUMAYO','10','01','10'),
 (919,'PILLCO MARCA','11','01','10'),
 (920,'YACUS','12','01','10'),
 (921,'SAN PABLO DE PILLAO','13','01','10'),
 (922,'AMBO','01','02','10'),
 (923,'CAYNA','02','02','10'),
 (924,'COLPAS','03','02','10'),
 (925,'CONCHAMARCA','04','02','10'),
 (926,'HUACAR','05','02','10'),
 (927,'SAN FRANCISCO','06','02','10'),
 (928,'SAN RAFAEL','07','02','10'),
 (929,'TOMAY KICHWA','08','02','10'),
 (930,'LA UNION','01','03','10'),
 (931,'CHUQUIS','07','03','10'),
 (932,'MARIAS','11','03','10'),
 (933,'PACHAS','13','03','10'),
 (934,'QUIVILLA','16','03','10'),
 (935,'RIPAN','17','03','10'),
 (936,'SHUNQUI','21','03','10'),
 (937,'SILLAPATA','22','03','10'),
 (938,'YANAS','23','03','10'),
 (939,'HUACAYBAMBA','01','04','10'),
 (940,'CANCHABAMBA','02','04','10'),
 (941,'COCHABAMBA','03','04','10'),
 (942,'PINRA','04','04','10'),
 (943,'LLATA','01','05','10'),
 (944,'ARANCAY','02','05','10'),
 (945,'CHAVIN DE PARIARCA','03','05','10'),
 (946,'JACAS GRANDE','04','05','10'),
 (947,'JIRCAN','05','05','10'),
 (948,'MIRAFLORES','06','05','10'),
 (949,'MONZON','07','05','10'),
 (950,'PUNCHAO','08','05','10'),
 (951,'PUNOS','09','05','10'),
 (952,'SINGA','10','05','10'),
 (953,'TANTAMAYO','11','05','10'),
 (954,'RUPA-RUPA','01','06','10'),
 (955,'DANIEL ALOMIAS ROBLES','02','06','10'),
 (956,'HERMILIO VALDIZAN','03','06','10'),
 (957,'JOSE CRESPO Y CASTILLO','04','06','10'),
 (958,'LUYANDO','05','06','10'),
 (959,'MARIANO DAMASO BERAUN','06','06','10'),
 (960,'PUCAYACU','07','06','10'),
 (961,'CASTILLO GRANDE','08','06','10'),
 (962,'PUEBLO NUEVO','09','06','10'),
 (963,'SANTO DOMINGO DE ANDA','10','06','10'),
 (964,'HUACRACHUCO','01','07','10'),
 (965,'CHOLON','02','07','10'),
 (966,'SAN BUENAVENTURA','03','07','10'),
 (967,'LA MORADA','04','07','10'),
 (968,'SANTA ROSA DE ALTO YANAJANCA','05','07','10'),
 (969,'PANAO','01','08','10'),
 (970,'CHAGLLA','02','08','10'),
 (971,'MOLINO','03','08','10'),
 (972,'UMARI','04','08','10'),
 (973,'PUERTO INCA','01','09','10'),
 (974,'CODO DEL POZUZO','02','09','10'),
 (975,'HONORIA','03','09','10'),
 (976,'TOURNAVISTA','04','09','10'),
 (977,'YUYAPICHIS','05','09','10'),
 (978,'JESUS','01','10','10'),
 (979,'BANOS','02','10','10'),
 (980,'JIVIA','03','10','10'),
 (981,'QUEROPALCA','04','10','10'),
 (982,'RONDOS','05','10','10'),
 (983,'SAN FRANCISCO DE ASIS','06','10','10'),
 (984,'SAN MIGUEL DE CAURI','07','10','10'),
 (985,'CHAVINILLO','01','11','10'),
 (986,'CAHUAC','02','11','10'),
 (987,'CHACABAMBA','03','11','10'),
 (988,'APARICIO POMARES','04','11','10'),
 (989,'JACAS CHICO','05','11','10'),
 (990,'OBAS','06','11','10'),
 (991,'PAMPAMARCA','07','11','10'),
 (992,'CHORAS','08','11','10'),
 (993,'ICA','01','01','11'),
 (994,'LA TINGUINA','02','01','11'),
 (995,'LOS AQUIJES','03','01','11'),
 (996,'OCUCAJE','04','01','11'),
 (997,'PACHACUTEC','05','01','11'),
 (998,'PARCONA','06','01','11'),
 (999,'PUEBLO NUEVO','07','01','11'),
 (1000,'SALAS','08','01','11'),
 (1001,'SAN JOSE DE LOS MOLINOS','09','01','11'),
 (1002,'SAN JUAN BAUTISTA','10','01','11'),
 (1003,'SANTIAGO','11','01','11'),
 (1004,'SUBTANJALLA','12','01','11'),
 (1005,'TATE','13','01','11'),
 (1006,'YAUCA DEL ROSARIO','14','01','11'),
 (1007,'CHINCHA ALTA','01','02','11'),
 (1008,'ALTO LARAN','02','02','11'),
 (1009,'CHAVIN','03','02','11'),
 (1010,'CHINCHA BAJA','04','02','11'),
 (1011,'EL CARMEN','05','02','11'),
 (1012,'GROCIO PRADO','06','02','11'),
 (1013,'PUEBLO NUEVO','07','02','11'),
 (1014,'SAN JUAN DE YANAC','08','02','11'),
 (1015,'SAN PEDRO DE HUACARPANA','09','02','11'),
 (1016,'SUNAMPE','10','02','11'),
 (1017,'TAMBO DE MORA','11','02','11'),
 (1018,'NAZCA','01','03','11'),
 (1019,'CHANGUILLO','02','03','11'),
 (1020,'EL INGENIO','03','03','11'),
 (1021,'MARCONA','04','03','11'),
 (1022,'VISTA ALEGRE','05','03','11'),
 (1023,'PALPA','01','04','11'),
 (1024,'LLIPATA','02','04','11'),
 (1025,'RIO GRANDE','03','04','11'),
 (1026,'SANTA CRUZ','04','04','11'),
 (1027,'TIBILLO','05','04','11'),
 (1028,'PISCO','01','05','11'),
 (1029,'HUANCANO','02','05','11'),
 (1030,'HUMAY','03','05','11'),
 (1031,'INDEPENDENCIA','04','05','11'),
 (1032,'PARACAS','05','05','11'),
 (1033,'SAN ANDRES','06','05','11'),
 (1034,'SAN CLEMENTE','07','05','11'),
 (1035,'TUPAC AMARU INCA','08','05','11'),
 (1036,'HUANCAYO','01','01','12'),
 (1037,'CARHUACALLANGA','04','01','12'),
 (1038,'CHACAPAMPA','05','01','12'),
 (1039,'CHICCHE','06','01','12'),
 (1040,'CHILCA','07','01','12'),
 (1041,'CHONGOS ALTO','08','01','12'),
 (1042,'CHUPURO','11','01','12'),
 (1043,'COLCA','12','01','12'),
 (1044,'CULLHUAS','13','01','12'),
 (1045,'EL TAMBO','14','01','12'),
 (1046,'HUACRAPUQUIO','16','01','12'),
 (1047,'HUALHUAS','17','01','12'),
 (1048,'HUANCAN','19','01','12'),
 (1049,'HUASICANCHA','20','01','12'),
 (1050,'HUAYUCACHI','21','01','12'),
 (1051,'INGENIO','22','01','12'),
 (1052,'PARIAHUANCA','24','01','12'),
 (1053,'PILCOMAYO','25','01','12'),
 (1054,'PUCARA','26','01','12'),
 (1055,'QUICHUAY','27','01','12'),
 (1056,'QUILCAS','28','01','12'),
 (1057,'SAN AGUSTIN','29','01','12'),
 (1058,'SAN JERONIMO DE TUNAN','30','01','12'),
 (1059,'SANO','32','01','12'),
 (1060,'SAPALLANGA','33','01','12'),
 (1061,'SICAYA','34','01','12'),
 (1062,'SANTO DOMINGO DE ACOBAMBA','35','01','12'),
 (1063,'VIQUES','36','01','12'),
 (1064,'CONCEPCION','01','02','12'),
 (1065,'ACO','02','02','12'),
 (1066,'ANDAMARCA','03','02','12'),
 (1067,'CHAMBARA','04','02','12'),
 (1068,'COCHAS','05','02','12'),
 (1069,'COMAS','06','02','12'),
 (1070,'HEROINAS TOLEDO','07','02','12'),
 (1071,'MANZANARES','08','02','12'),
 (1072,'MARISCAL CASTILLA','09','02','12'),
 (1073,'MATAHUASI','10','02','12'),
 (1074,'MITO','11','02','12'),
 (1075,'NUEVE DE JULIO','12','02','12'),
 (1076,'ORCOTUNA','13','02','12'),
 (1077,'SAN JOSE DE QUERO','14','02','12'),
 (1078,'SANTA ROSA DE OCOPA','15','02','12'),
 (1079,'CHANCHAMAYO','01','03','12'),
 (1080,'PERENE','02','03','12'),
 (1081,'PICHANAQUI','03','03','12'),
 (1082,'SAN LUIS DE SHUARO','04','03','12'),
 (1083,'SAN RAMON','05','03','12'),
 (1084,'VITOC','06','03','12'),
 (1085,'JAUJA','01','04','12'),
 (1086,'ACOLLA','02','04','12'),
 (1087,'APATA','03','04','12'),
 (1088,'ATAURA','04','04','12'),
 (1089,'CANCHAYLLO','05','04','12'),
 (1090,'CURICACA','06','04','12'),
 (1091,'EL MANTARO','07','04','12'),
 (1092,'HUAMALI','08','04','12'),
 (1093,'HUARIPAMPA','09','04','12'),
 (1094,'HUERTAS','10','04','12'),
 (1095,'JANJAILLO','11','04','12'),
 (1096,'JULCAN','12','04','12'),
 (1097,'LEONOR ORDONEZ','13','04','12'),
 (1098,'LLOCLLAPAMPA','14','04','12'),
 (1099,'MARCO','15','04','12'),
 (1100,'MASMA','16','04','12'),
 (1101,'MASMA CHICCHE','17','04','12'),
 (1102,'MOLINOS','18','04','12'),
 (1103,'MONOBAMBA','19','04','12'),
 (1104,'MUQUI','20','04','12'),
 (1105,'MUQUIYAUYO','21','04','12'),
 (1106,'PACA','22','04','12'),
 (1107,'PACCHA','23','04','12'),
 (1108,'PANCAN','24','04','12'),
 (1109,'PARCO','25','04','12'),
 (1110,'POMACANCHA','26','04','12'),
 (1111,'RICRAN','27','04','12'),
 (1112,'SAN LORENZO','28','04','12'),
 (1113,'SAN PEDRO DE CHUNAN','29','04','12'),
 (1114,'SAUSA','30','04','12'),
 (1115,'SINCOS','31','04','12'),
 (1116,'TUNAN MARCA','32','04','12'),
 (1117,'YAULI','33','04','12'),
 (1118,'YAUYOS','34','04','12'),
 (1119,'JUNIN','01','05','12'),
 (1120,'CARHUAMAYO','02','05','12'),
 (1121,'ONDORES','03','05','12'),
 (1122,'ULCUMAYO','04','05','12'),
 (1123,'SATIPO','01','06','12'),
 (1124,'COVIRIALI','02','06','12'),
 (1125,'LLAYLLA','03','06','12'),
 (1126,'MAZAMARI','04','06','12'),
 (1127,'PAMPA HERMOSA','05','06','12'),
 (1128,'PANGOA','06','06','12'),
 (1129,'RIO NEGRO','07','06','12'),
 (1130,'RIO TAMBO','08','06','12'),
 (1131,'VIZCATAN DEL ENE','09','06','12'),
 (1132,'TARMA','01','07','12'),
 (1133,'ACOBAMBA','02','07','12'),
 (1134,'HUARICOLCA','03','07','12'),
 (1135,'HUASAHUASI','04','07','12'),
 (1136,'LA UNION','05','07','12'),
 (1137,'PALCA','06','07','12'),
 (1138,'PALCAMAYO','07','07','12'),
 (1139,'SAN PEDRO DE CAJAS','08','07','12'),
 (1140,'TAPO','09','07','12'),
 (1141,'LA OROYA','01','08','12'),
 (1142,'CHACAPALPA','02','08','12'),
 (1143,'HUAY-HUAY','03','08','12'),
 (1144,'MARCAPOMACOCHA','04','08','12'),
 (1145,'MOROCOCHA','05','08','12'),
 (1146,'PACCHA','06','08','12'),
 (1147,'SANTA BARBARA DE CARHUACAYAN','07','08','12'),
 (1148,'SANTA ROSA DE SACCO','08','08','12'),
 (1149,'SUITUCANCHA','09','08','12'),
 (1150,'YAULI','10','08','12'),
 (1151,'CHUPACA','01','09','12'),
 (1152,'AHUAC','02','09','12'),
 (1153,'CHONGOS BAJO','03','09','12'),
 (1154,'HUACHAC','04','09','12'),
 (1155,'HUAMANCACA CHICO','05','09','12'),
 (1156,'SAN JUAN DE YSCOS','06','09','12'),
 (1157,'SAN JUAN DE JARPA','07','09','12'),
 (1158,'TRES DE DICIEMBRE','08','09','12'),
 (1159,'YANACANCHA','09','09','12'),
 (1160,'TRUJILLO','01','01','13'),
 (1161,'EL PORVENIR','02','01','13'),
 (1162,'FLORENCIA DE MORA','03','01','13'),
 (1163,'HUANCHACO','04','01','13'),
 (1164,'LA ESPERANZA','05','01','13'),
 (1165,'LAREDO','06','01','13'),
 (1166,'MOCHE','07','01','13'),
 (1167,'POROTO','08','01','13'),
 (1168,'SALAVERRY','09','01','13'),
 (1169,'SIMBAL','10','01','13'),
 (1170,'VICTOR LARCO HERRERA','11','01','13'),
 (1171,'ASCOPE','01','02','13'),
 (1172,'CHICAMA','02','02','13'),
 (1173,'CHOCOPE','03','02','13'),
 (1174,'MAGDALENA DE CAO','04','02','13'),
 (1175,'PAIJAN','05','02','13'),
 (1176,'RAZURI','06','02','13'),
 (1177,'SANTIAGO DE CAO','07','02','13'),
 (1178,'CASA GRANDE','08','02','13'),
 (1179,'BOLIVAR','01','03','13'),
 (1180,'BAMBAMARCA','02','03','13'),
 (1181,'CONDORMARCA','03','03','13'),
 (1182,'LONGOTEA','04','03','13'),
 (1183,'UCHUMARCA','05','03','13'),
 (1184,'UCUNCHA','06','03','13'),
 (1185,'CHEPEN','01','04','13'),
 (1186,'PACANGA','02','04','13'),
 (1187,'PUEBLO NUEVO','03','04','13'),
 (1188,'JULCAN','01','05','13'),
 (1189,'CALAMARCA','02','05','13'),
 (1190,'CARABAMBA','03','05','13'),
 (1191,'HUASO','04','05','13'),
 (1192,'OTUZCO','01','06','13'),
 (1193,'AGALLPAMPA','02','06','13'),
 (1194,'CHARAT','04','06','13'),
 (1195,'HUARANCHAL','05','06','13'),
 (1196,'LA CUESTA','06','06','13'),
 (1197,'MACHE','08','06','13'),
 (1198,'PARANDAY','10','06','13'),
 (1199,'SALPO','11','06','13'),
 (1200,'SINSICAP','13','06','13'),
 (1201,'USQUIL','14','06','13'),
 (1202,'SAN PEDRO DE LLOC','01','07','13'),
 (1203,'GUADALUPE','02','07','13'),
 (1204,'JEQUETEPEQUE','03','07','13'),
 (1205,'PACASMAYO','04','07','13'),
 (1206,'SAN JOSE','05','07','13'),
 (1207,'TAYABAMBA','01','08','13'),
 (1208,'BULDIBUYO','02','08','13'),
 (1209,'CHILLIA','03','08','13'),
 (1210,'HUANCASPATA','04','08','13'),
 (1211,'HUAYLILLAS','05','08','13'),
 (1212,'HUAYO','06','08','13'),
 (1213,'ONGON','07','08','13'),
 (1214,'PARCOY','08','08','13'),
 (1215,'PATAZ','09','08','13'),
 (1216,'PIAS','10','08','13'),
 (1217,'SANTIAGO DE CHALLAS','11','08','13'),
 (1218,'TAURIJA','12','08','13'),
 (1219,'URPAY','13','08','13'),
 (1220,'HUAMACHUCO','01','09','13'),
 (1221,'CHUGAY','02','09','13'),
 (1222,'COCHORCO','03','09','13'),
 (1223,'CURGOS','04','09','13'),
 (1224,'MARCABAL','05','09','13'),
 (1225,'SANAGORAN','06','09','13'),
 (1226,'SARIN','07','09','13'),
 (1227,'SARTIMBAMBA','08','09','13'),
 (1228,'SANTIAGO DE CHUCO','01','10','13'),
 (1229,'ANGASMARCA','02','10','13'),
 (1230,'CACHICADAN','03','10','13'),
 (1231,'MOLLEBAMBA','04','10','13'),
 (1232,'MOLLEPATA','05','10','13'),
 (1233,'QUIRUVILCA','06','10','13'),
 (1234,'SANTA CRUZ DE CHUCA','07','10','13'),
 (1235,'SITABAMBA','08','10','13'),
 (1236,'CASCAS','01','11','13'),
 (1237,'LUCMA','02','11','13'),
 (1238,'COMPIN','03','11','13'),
 (1239,'SAYAPULLO','04','11','13'),
 (1240,'VIRU','01','12','13'),
 (1241,'CHAO','02','12','13'),
 (1242,'GUADALUPITO','03','12','13'),
 (1243,'CHICLAYO','01','01','14'),
 (1244,'CHONGOYAPE','02','01','14'),
 (1245,'ETEN','03','01','14'),
 (1246,'ETEN PUERTO','04','01','14'),
 (1247,'JOSE LEONARDO ORTIZ','05','01','14'),
 (1248,'LA VICTORIA','06','01','14'),
 (1249,'LAGUNAS','07','01','14'),
 (1250,'MONSEFU','08','01','14'),
 (1251,'NUEVA ARICA','09','01','14'),
 (1252,'OYOTUN','10','01','14'),
 (1253,'PICSI','11','01','14'),
 (1254,'PIMENTEL','12','01','14'),
 (1255,'REQUE','13','01','14'),
 (1256,'SANTA ROSA','14','01','14'),
 (1257,'SANA','15','01','14'),
 (1258,'CAYALTI','16','01','14'),
 (1259,'PATAPO','17','01','14'),
 (1260,'POMALCA','18','01','14'),
 (1261,'PUCALA','19','01','14'),
 (1262,'TUMAN','20','01','14'),
 (1263,'FERRENAFE','01','02','14'),
 (1264,'CANARIS','02','02','14'),
 (1265,'INCAHUASI','03','02','14'),
 (1266,'MANUEL ANTONIO MESONES MURO','04','02','14'),
 (1267,'PITIPO','05','02','14'),
 (1268,'PUEBLO NUEVO','06','02','14'),
 (1269,'LAMBAYEQUE','01','03','14'),
 (1270,'CHOCHOPE','02','03','14'),
 (1271,'ILLIMO','03','03','14'),
 (1272,'JAYANCA','04','03','14'),
 (1273,'MOCHUMI','05','03','14'),
 (1274,'MORROPE','06','03','14'),
 (1275,'MOTUPE','07','03','14'),
 (1276,'OLMOS','08','03','14'),
 (1277,'PACORA','09','03','14'),
 (1278,'SALAS','10','03','14'),
 (1279,'SAN JOSE','11','03','14'),
 (1280,'TUCUME','12','03','14'),
 (1281,'LIMA','01','01','15'),
 (1282,'ANCON','02','01','15'),
 (1283,'ATE','03','01','15'),
 (1284,'BARRANCO','04','01','15'),
 (1285,'BRENA','05','01','15'),
 (1286,'CARABAYLLO','06','01','15'),
 (1287,'CHACLACAYO','07','01','15'),
 (1288,'CHORRILLOS','08','01','15'),
 (1289,'CIENEGUILLA','09','01','15'),
 (1290,'COMAS','10','01','15'),
 (1291,'EL AGUSTINO','11','01','15'),
 (1292,'INDEPENDENCIA','12','01','15'),
 (1293,'JESUS MARIA','13','01','15'),
 (1294,'LA MOLINA','14','01','15'),
 (1295,'LA VICTORIA','15','01','15'),
 (1296,'LINCE','16','01','15'),
 (1297,'LOS OLIVOS','17','01','15'),
 (1298,'LURIGANCHO','18','01','15'),
 (1299,'LURIN','19','01','15'),
 (1300,'MAGDALENA DEL MAR','20','01','15'),
 (1301,'PUEBLO LIBRE','21','01','15'),
 (1302,'MIRAFLORES','22','01','15'),
 (1303,'PACHACAMAC','23','01','15'),
 (1304,'PUCUSANA','24','01','15'),
 (1305,'PUENTE PIEDRA','25','01','15'),
 (1306,'PUNTA HERMOSA','26','01','15'),
 (1307,'PUNTA NEGRA','27','01','15'),
 (1308,'RIMAC','28','01','15'),
 (1309,'SAN BARTOLO','29','01','15'),
 (1310,'SAN BORJA','30','01','15'),
 (1311,'SAN ISIDRO','31','01','15'),
 (1312,'SAN JUAN DE LURIGANCHO','32','01','15'),
 (1313,'SAN JUAN DE MIRAFLORES','33','01','15'),
 (1314,'SAN LUIS','34','01','15'),
 (1315,'SAN MARTIN DE PORRES','35','01','15'),
 (1316,'SAN MIGUEL','36','01','15'),
 (1317,'SANTA ANITA','37','01','15'),
 (1318,'SANTA MARIA DEL MAR','38','01','15'),
 (1319,'SANTA ROSA','39','01','15'),
 (1320,'SANTIAGO DE SURCO','40','01','15'),
 (1321,'SURQUILLO','41','01','15'),
 (1322,'VILLA EL SALVADOR','42','01','15'),
 (1323,'VILLA MARIA DEL TRIUNFO','43','01','15'),
 (1324,'BARRANCA','01','02','15'),
 (1325,'PARAMONGA','02','02','15'),
 (1326,'PATIVILCA','03','02','15'),
 (1327,'SUPE','04','02','15'),
 (1328,'SUPE PUERTO','05','02','15'),
 (1329,'CAJATAMBO','01','03','15'),
 (1330,'COPA','02','03','15'),
 (1331,'GORGOR','03','03','15'),
 (1332,'HUANCAPON','04','03','15'),
 (1333,'MANAS','05','03','15'),
 (1334,'CANTA','01','04','15'),
 (1335,'ARAHUAY','02','04','15'),
 (1336,'HUAMANTANGA','03','04','15'),
 (1337,'HUAROS','04','04','15'),
 (1338,'LACHAQUI','05','04','15'),
 (1339,'SAN BUENAVENTURA','06','04','15'),
 (1340,'SANTA ROSA DE QUIVES','07','04','15'),
 (1341,'SAN VICENTE DE CANETE','01','05','15'),
 (1342,'ASIA','02','05','15'),
 (1343,'CALANGO','03','05','15'),
 (1344,'CERRO AZUL','04','05','15'),
 (1345,'CHILCA','05','05','15'),
 (1346,'COAYLLO','06','05','15'),
 (1347,'IMPERIAL','07','05','15'),
 (1348,'LUNAHUANA','08','05','15'),
 (1349,'MALA','09','05','15'),
 (1350,'NUEVO IMPERIAL','10','05','15'),
 (1351,'PACARAN','11','05','15'),
 (1352,'QUILMANA','12','05','15'),
 (1353,'SAN ANTONIO','13','05','15'),
 (1354,'SAN LUIS','14','05','15'),
 (1355,'SANTA CRUZ DE FLORES','15','05','15'),
 (1356,'ZUNIGA','16','05','15'),
 (1357,'HUARAL','01','06','15'),
 (1358,'ATAVILLOS ALTO','02','06','15'),
 (1359,'ATAVILLOS BAJO','03','06','15'),
 (1360,'AUCALLAMA','04','06','15'),
 (1361,'CHANCAY','05','06','15'),
 (1362,'IHUARI','06','06','15'),
 (1363,'LAMPIAN','07','06','15'),
 (1364,'PACARAOS','08','06','15'),
 (1365,'SAN MIGUEL DE ACOS','09','06','15'),
 (1366,'SANTA CRUZ DE ANDAMARCA','10','06','15'),
 (1367,'SUMBILCA','11','06','15'),
 (1368,'VEINTISIETE DE NOVIEMBRE','12','06','15'),
 (1369,'MATUCANA','01','07','15'),
 (1370,'ANTIOQUIA','02','07','15'),
 (1371,'CALLAHUANCA','03','07','15'),
 (1372,'CARAMPOMA','04','07','15'),
 (1373,'CHICLA','05','07','15'),
 (1374,'CUENCA','06','07','15'),
 (1375,'HUACHUPAMPA','07','07','15'),
 (1376,'HUANZA','08','07','15'),
 (1377,'HUAROCHIRI','09','07','15'),
 (1378,'LAHUAYTAMBO','10','07','15'),
 (1379,'LANGA','11','07','15'),
 (1380,'LARAOS','12','07','15'),
 (1381,'MARIATANA','13','07','15'),
 (1382,'RICARDO PALMA','14','07','15'),
 (1383,'SAN ANDRES DE TUPICOCHA','15','07','15'),
 (1384,'SAN ANTONIO','16','07','15'),
 (1385,'SAN BARTOLOME','17','07','15'),
 (1386,'SAN DAMIAN','18','07','15'),
 (1387,'SAN JUAN DE IRIS','19','07','15'),
 (1388,'SAN JUAN DE TANTARANCHE','20','07','15'),
 (1389,'SAN LORENZO DE QUINTI','21','07','15'),
 (1390,'SAN MATEO','22','07','15'),
 (1391,'SAN MATEO DE OTAO','23','07','15'),
 (1392,'SAN PEDRO DE CASTA','24','07','15'),
 (1393,'SAN PEDRO DE HUANCAYRE','25','07','15'),
 (1394,'SANGALLAYA','26','07','15'),
 (1395,'SANTA CRUZ DE COCACHACRA','27','07','15'),
 (1396,'SANTA EULALIA','28','07','15'),
 (1397,'SANTIAGO DE ANCHUCAYA','29','07','15'),
 (1398,'SANTIAGO DE TUNA','30','07','15'),
 (1399,'SANTO DOMINGO DE LOS OLLEROS','31','07','15'),
 (1400,'SURCO','32','07','15'),
 (1401,'HUACHO','01','08','15'),
 (1402,'AMBAR','02','08','15'),
 (1403,'CALETA DE CARQUIN','03','08','15'),
 (1404,'CHECRAS','04','08','15'),
 (1405,'HUALMAY','05','08','15'),
 (1406,'HUAURA','06','08','15'),
 (1407,'LEONCIO PRADO','07','08','15'),
 (1408,'PACCHO','08','08','15'),
 (1409,'SANTA LEONOR','09','08','15'),
 (1410,'SANTA MARIA','10','08','15'),
 (1411,'SAYAN','11','08','15'),
 (1412,'VEGUETA','12','08','15'),
 (1413,'OYON','01','09','15'),
 (1414,'ANDAJES','02','09','15'),
 (1415,'CAUJUL','03','09','15'),
 (1416,'COCHAMARCA','04','09','15'),
 (1417,'NAVAN','05','09','15'),
 (1418,'PACHANGARA','06','09','15'),
 (1419,'YAUYOS','01','10','15'),
 (1420,'ALIS','02','10','15'),
 (1421,'AYAUCA','03','10','15'),
 (1422,'AYAVIRI','04','10','15'),
 (1423,'AZANGARO','05','10','15'),
 (1424,'CACRA','06','10','15'),
 (1425,'CARANIA','07','10','15'),
 (1426,'CATAHUASI','08','10','15'),
 (1427,'CHOCOS','09','10','15'),
 (1428,'COCHAS','10','10','15'),
 (1429,'COLONIA','11','10','15'),
 (1430,'HONGOS','12','10','15'),
 (1431,'HUAMPARA','13','10','15'),
 (1432,'HUANCAYA','14','10','15'),
 (1433,'HUANGASCAR','15','10','15'),
 (1434,'HUANTAN','16','10','15'),
 (1435,'HUANEC','17','10','15'),
 (1436,'LARAOS','18','10','15'),
 (1437,'LINCHA','19','10','15'),
 (1438,'MADEAN','20','10','15'),
 (1439,'MIRAFLORES','21','10','15'),
 (1440,'OMAS','22','10','15'),
 (1441,'PUTINZA','23','10','15'),
 (1442,'QUINCHES','24','10','15'),
 (1443,'QUINOCAY','25','10','15'),
 (1444,'SAN JOAQUIN','26','10','15'),
 (1445,'SAN PEDRO DE PILAS','27','10','15'),
 (1446,'TANTA','28','10','15'),
 (1447,'TAURIPAMPA','29','10','15'),
 (1448,'TOMAS','30','10','15'),
 (1449,'TUPE','31','10','15'),
 (1450,'VINAC','32','10','15'),
 (1451,'VITIS','33','10','15'),
 (1452,'IQUITOS','01','01','16'),
 (1453,'ALTO NANAY','02','01','16'),
 (1454,'FERNANDO LORES','03','01','16'),
 (1455,'INDIANA','04','01','16'),
 (1456,'LAS AMAZONAS','05','01','16'),
 (1457,'MAZAN','06','01','16'),
 (1458,'NAPO','07','01','16'),
 (1459,'PUNCHANA','08','01','16'),
 (1460,'TORRES CAUSANA','10','01','16'),
 (1461,'BELEN','12','01','16'),
 (1462,'SAN JUAN BAUTISTA','13','01','16'),
 (1463,'YURIMAGUAS','01','02','16'),
 (1464,'BALSAPUERTO','02','02','16'),
 (1465,'JEBEROS','05','02','16'),
 (1466,'LAGUNAS','06','02','16'),
 (1467,'SANTA CRUZ','10','02','16'),
 (1468,'TENIENTE CESAR LOPEZ ROJAS','11','02','16'),
 (1469,'NAUTA','01','03','16'),
 (1470,'PARINARI','02','03','16'),
 (1471,'TIGRE','03','03','16'),
 (1472,'TROMPETEROS','04','03','16'),
 (1473,'URARINAS','05','03','16'),
 (1474,'RAMON CASTILLA','01','04','16'),
 (1475,'PEBAS','02','04','16'),
 (1476,'YAVARI','03','04','16'),
 (1477,'SAN PABLO','04','04','16'),
 (1478,'REQUENA','01','05','16'),
 (1479,'ALTO TAPICHE','02','05','16'),
 (1480,'CAPELO','03','05','16'),
 (1481,'EMILIO SAN MARTIN','04','05','16'),
 (1482,'MAQUIA','05','05','16'),
 (1483,'PUINAHUA','06','05','16'),
 (1484,'SAQUENA','07','05','16'),
 (1485,'SOPLIN','08','05','16'),
 (1486,'TAPICHE','09','05','16'),
 (1487,'JENARO HERRERA','10','05','16'),
 (1488,'YAQUERANA','11','05','16'),
 (1489,'CONTAMANA','01','06','16'),
 (1490,'INAHUAYA','02','06','16'),
 (1491,'PADRE MARQUEZ','03','06','16'),
 (1492,'PAMPA HERMOSA','04','06','16'),
 (1493,'SARAYACU','05','06','16'),
 (1494,'VARGAS GUERRA','06','06','16'),
 (1495,'BARRANCA','01','07','16'),
 (1496,'CAHUAPANAS','02','07','16'),
 (1497,'MANSERICHE','03','07','16'),
 (1498,'MORONA','04','07','16'),
 (1499,'PASTAZA','05','07','16'),
 (1500,'ANDOAS','06','07','16'),
 (1501,'PUTUMAYO','01','08','16'),
 (1502,'ROSA PANDURO','02','08','16'),
 (1503,'TENIENTE MANUEL CLAVERO','03','08','16'),
 (1504,'YAGUAS','04','08','16'),
 (1505,'TAMBOPATA','01','01','17'),
 (1506,'INAMBARI','02','01','17'),
 (1507,'LAS PIEDRAS','03','01','17'),
 (1508,'LABERINTO','04','01','17'),
 (1509,'MANU','01','02','17'),
 (1510,'FITZCARRALD','02','02','17'),
 (1511,'MADRE DE DIOS','03','02','17'),
 (1512,'HUEPETUHE','04','02','17'),
 (1513,'INAPARI','01','03','17'),
 (1514,'IBERIA','02','03','17'),
 (1515,'TAHUAMANU','03','03','17'),
 (1516,'MOQUEGUA','01','01','18'),
 (1517,'CARUMAS','02','01','18'),
 (1518,'CUCHUMBAYA','03','01','18'),
 (1519,'SAMEGUA','04','01','18'),
 (1520,'SAN CRISTOBAL','05','01','18'),
 (1521,'TORATA','06','01','18'),
 (1522,'OMATE','01','02','18'),
 (1523,'CHOJATA','02','02','18'),
 (1524,'COALAQUE','03','02','18'),
 (1525,'ICHUNA','04','02','18'),
 (1526,'LA CAPILLA','05','02','18'),
 (1527,'LLOQUE','06','02','18'),
 (1528,'MATALAQUE','07','02','18'),
 (1529,'PUQUINA','08','02','18'),
 (1530,'QUINISTAQUILLAS','09','02','18'),
 (1531,'UBINAS','10','02','18'),
 (1532,'YUNGA','11','02','18'),
 (1533,'ILO','01','03','18'),
 (1534,'EL ALGARROBAL','02','03','18'),
 (1535,'PACOCHA','03','03','18'),
 (1536,'CHAUPIMARCA','01','01','19'),
 (1537,'HUACHON','02','01','19'),
 (1538,'HUARIACA','03','01','19'),
 (1539,'HUAYLLAY','04','01','19'),
 (1540,'NINACACA','05','01','19'),
 (1541,'PALLANCHACRA','06','01','19'),
 (1542,'PAUCARTAMBO','07','01','19'),
 (1543,'SAN FRANCISCO DE ASIS DE YARUSYACAN','08','01','19'),
 (1544,'SIMON BOLIVAR','09','01','19'),
 (1545,'TICLACAYAN','10','01','19'),
 (1546,'TINYAHUARCO','11','01','19'),
 (1547,'VICCO','12','01','19'),
 (1548,'YANACANCHA','13','01','19'),
 (1549,'YANAHUANCA','01','02','19'),
 (1550,'CHACAYAN','02','02','19'),
 (1551,'GOYLLARISQUIZGA','03','02','19'),
 (1552,'PAUCAR','04','02','19'),
 (1553,'SAN PEDRO DE PILLAO','05','02','19'),
 (1554,'SANTA ANA DE TUSI','06','02','19'),
 (1555,'TAPUC','07','02','19'),
 (1556,'VILCABAMBA','08','02','19'),
 (1557,'OXAPAMPA','01','03','19'),
 (1558,'CHONTABAMBA','02','03','19'),
 (1559,'HUANCABAMBA','03','03','19'),
 (1560,'PALCAZU','04','03','19'),
 (1561,'POZUZO','05','03','19'),
 (1562,'PUERTO BERMUDEZ','06','03','19'),
 (1563,'VILLA RICA','07','03','19'),
 (1564,'CONSTITUCION','08','03','19'),
 (1565,'PIURA','01','01','20'),
 (1566,'CASTILLA','04','01','20'),
 (1567,'CATACAOS','05','01','20'),
 (1568,'CURA MORI','07','01','20'),
 (1569,'EL TALLAN','08','01','20'),
 (1570,'LA ARENA','09','01','20'),
 (1571,'LA UNION','10','01','20'),
 (1572,'LAS LOMAS','11','01','20'),
 (1573,'TAMBO GRANDE','14','01','20'),
 (1574,'26 DE OCTUBRE','15','01','20'),
 (1575,'AYABACA','01','02','20'),
 (1576,'FRIAS','02','02','20'),
 (1577,'JILILI','03','02','20'),
 (1578,'LAGUNAS','04','02','20'),
 (1579,'MONTERO','05','02','20'),
 (1580,'PACAIPAMPA','06','02','20'),
 (1581,'PAIMAS','07','02','20'),
 (1582,'SAPILLICA','08','02','20'),
 (1583,'SICCHEZ','09','02','20'),
 (1584,'SUYO','10','02','20'),
 (1585,'HUANCABAMBA','01','03','20'),
 (1586,'CANCHAQUE','02','03','20'),
 (1587,'EL CARMEN DE LA FRONTERA','03','03','20'),
 (1588,'HUARMACA','04','03','20'),
 (1589,'LALAQUIZ','05','03','20'),
 (1590,'SAN MIGUEL DE EL FAIQUE','06','03','20'),
 (1591,'SONDOR','07','03','20'),
 (1592,'SONDORILLO','08','03','20'),
 (1593,'CHULUCANAS','01','04','20'),
 (1594,'BUENOS AIRES','02','04','20'),
 (1595,'CHALACO','03','04','20'),
 (1596,'LA MATANZA','04','04','20'),
 (1597,'MORROPON','05','04','20'),
 (1598,'SALITRAL','06','04','20'),
 (1599,'SAN JUAN DE BIGOTE','07','04','20'),
 (1600,'SANTA CATALINA DE MOSSA','08','04','20'),
 (1601,'SANTO DOMINGO','09','04','20'),
 (1602,'YAMANGO','10','04','20'),
 (1603,'PAITA','01','05','20'),
 (1604,'AMOTAPE','02','05','20'),
 (1605,'ARENAL','03','05','20'),
 (1606,'COLAN','04','05','20'),
 (1607,'LA HUACA','05','05','20'),
 (1608,'TAMARINDO','06','05','20'),
 (1609,'VICHAYAL','07','05','20'),
 (1610,'SULLANA','01','06','20'),
 (1611,'BELLAVISTA','02','06','20'),
 (1612,'IGNACIO ESCUDERO','03','06','20'),
 (1613,'LANCONES','04','06','20'),
 (1614,'MARCAVELICA','05','06','20'),
 (1615,'MIGUEL CHECA','06','06','20'),
 (1616,'QUERECOTILLO','07','06','20'),
 (1617,'SALITRAL','08','06','20'),
 (1618,'PARINAS','01','07','20'),
 (1619,'EL ALTO','02','07','20'),
 (1620,'LA BREA','03','07','20'),
 (1621,'LOBITOS','04','07','20'),
 (1622,'LOS ORGANOS','05','07','20'),
 (1623,'MANCORA','06','07','20'),
 (1624,'SECHURA','01','08','20'),
 (1625,'BELLAVISTA DE LA UNION','02','08','20'),
 (1626,'BERNAL','03','08','20'),
 (1627,'CRISTO NOS VALGA','04','08','20'),
 (1628,'VICE','05','08','20'),
 (1629,'RINCONADA LLICUAR','06','08','20'),
 (1630,'PUNO','01','01','21'),
 (1631,'ACORA','02','01','21'),
 (1632,'AMANTANI','03','01','21'),
 (1633,'ATUNCOLLA','04','01','21'),
 (1634,'CAPACHICA','05','01','21'),
 (1635,'CHUCUITO','06','01','21'),
 (1636,'COATA','07','01','21'),
 (1637,'HUATA','08','01','21'),
 (1638,'MANAZO','09','01','21'),
 (1639,'PAUCARCOLLA','10','01','21'),
 (1640,'PICHACANI','11','01','21'),
 (1641,'PLATERIA','12','01','21'),
 (1642,'SAN ANTONIO','13','01','21'),
 (1643,'TIQUILLACA','14','01','21'),
 (1644,'VILQUE','15','01','21'),
 (1645,'AZANGARO','01','02','21'),
 (1646,'ACHAYA','02','02','21'),
 (1647,'ARAPA','03','02','21'),
 (1648,'ASILLO','04','02','21'),
 (1649,'CAMINACA','05','02','21'),
 (1650,'CHUPA','06','02','21'),
 (1651,'JOSE DOMINGO CHOQUEHUANCA','07','02','21'),
 (1652,'MUNANI','08','02','21'),
 (1653,'POTONI','09','02','21'),
 (1654,'SAMAN','10','02','21'),
 (1655,'SAN ANTON','11','02','21'),
 (1656,'SAN JOSE','12','02','21'),
 (1657,'SAN JUAN DE SALINAS','13','02','21'),
 (1658,'SANTIAGO DE PUPUJA','14','02','21'),
 (1659,'TIRAPATA','15','02','21'),
 (1660,'MACUSANI','01','03','21'),
 (1661,'AJOYANI','02','03','21'),
 (1662,'AYAPATA','03','03','21'),
 (1663,'COASA','04','03','21'),
 (1664,'CORANI','05','03','21'),
 (1665,'CRUCERO','06','03','21'),
 (1666,'ITUATA','07','03','21'),
 (1667,'OLLACHEA','08','03','21'),
 (1668,'SAN GABAN','09','03','21'),
 (1669,'USICAYOS','10','03','21'),
 (1670,'JULI','01','04','21'),
 (1671,'DESAGUADERO','02','04','21'),
 (1672,'HUACULLANI','03','04','21'),
 (1673,'KELLUYO','04','04','21'),
 (1674,'PISACOMA','05','04','21'),
 (1675,'POMATA','06','04','21'),
 (1676,'ZEPITA','07','04','21'),
 (1677,'ILAVE','01','05','21'),
 (1678,'CAPAZO','02','05','21'),
 (1679,'PILCUYO','03','05','21'),
 (1680,'SANTA ROSA','04','05','21'),
 (1681,'CONDURIRI','05','05','21'),
 (1682,'HUANCANE','01','06','21'),
 (1683,'COJATA','02','06','21'),
 (1684,'HUATASANI','03','06','21'),
 (1685,'INCHUPALLA','04','06','21'),
 (1686,'PUSI','05','06','21'),
 (1687,'ROSASPATA','06','06','21'),
 (1688,'TARACO','07','06','21'),
 (1689,'VILQUE CHICO','08','06','21'),
 (1690,'LAMPA','01','07','21'),
 (1691,'CABANILLA','02','07','21'),
 (1692,'CALAPUJA','03','07','21'),
 (1693,'NICASIO','04','07','21'),
 (1694,'OCUVIRI','05','07','21'),
 (1695,'PALCA','06','07','21'),
 (1696,'PARATIA','07','07','21'),
 (1697,'PUCARA','08','07','21'),
 (1698,'SANTA LUCIA','09','07','21'),
 (1699,'VILAVILA','10','07','21'),
 (1700,'AYAVIRI','01','08','21'),
 (1701,'ANTAUTA','02','08','21'),
 (1702,'CUPI','03','08','21'),
 (1703,'LLALLI','04','08','21'),
 (1704,'MACARI','05','08','21'),
 (1705,'NUNOA','06','08','21'),
 (1706,'ORURILLO','07','08','21'),
 (1707,'SANTA ROSA','08','08','21'),
 (1708,'UMACHIRI','09','08','21'),
 (1709,'MOHO','01','09','21'),
 (1710,'CONIMA','02','09','21'),
 (1711,'HUAYRAPATA','03','09','21'),
 (1712,'TILALI','04','09','21'),
 (1713,'PUTINA','01','10','21'),
 (1714,'ANANEA','02','10','21'),
 (1715,'PEDRO VILCA APAZA','03','10','21'),
 (1716,'QUILCAPUNCU','04','10','21'),
 (1717,'SINA','05','10','21'),
 (1718,'JULIACA','01','11','21'),
 (1719,'CABANA','02','11','21'),
 (1720,'CABANILLAS','03','11','21'),
 (1721,'CARACOTO','04','11','21'),
 (1722,'SAN MIGUEL','05','11','21'),
 (1723,'SANDIA','01','12','21'),
 (1724,'CUYOCUYO','02','12','21'),
 (1725,'LIMBANI','03','12','21'),
 (1726,'PATAMBUCO','04','12','21'),
 (1727,'PHARA','05','12','21'),
 (1728,'QUIACA','06','12','21'),
 (1729,'SAN JUAN DEL ORO','07','12','21'),
 (1730,'YANAHUAYA','08','12','21'),
 (1731,'ALTO INAMBARI','09','12','21'),
 (1732,'SAN PEDRO DE PUTINA PUNCO','10','12','21'),
 (1733,'YUNGUYO','01','13','21'),
 (1734,'ANAPIA','02','13','21'),
 (1735,'COPANI','03','13','21'),
 (1736,'CUTURAPI','04','13','21'),
 (1737,'OLLARAYA','05','13','21'),
 (1738,'TINICACHI','06','13','21'),
 (1739,'UNICACHI','07','13','21'),
 (1740,'MOYOBAMBA','01','01','22'),
 (1741,'CALZADA','02','01','22'),
 (1742,'HABANA','03','01','22'),
 (1743,'JEPELACIO','04','01','22'),
 (1744,'SORITOR','05','01','22'),
 (1745,'YANTALO','06','01','22'),
 (1746,'BELLAVISTA','01','02','22'),
 (1747,'ALTO BIAVO','02','02','22'),
 (1748,'BAJO BIAVO','03','02','22'),
 (1749,'HUALLAGA','04','02','22'),
 (1750,'SAN PABLO','05','02','22'),
 (1751,'SAN RAFAEL','06','02','22'),
 (1752,'SAN JOSE DE SISA','01','03','22'),
 (1753,'AGUA BLANCA','02','03','22'),
 (1754,'SAN MARTIN','03','03','22'),
 (1755,'SANTA ROSA','04','03','22'),
 (1756,'SHATOJA','05','03','22'),
 (1757,'SAPOSOA','01','04','22'),
 (1758,'ALTO SAPOSOA','02','04','22'),
 (1759,'EL ESLABON','03','04','22'),
 (1760,'PISCOYACU','04','04','22'),
 (1761,'SACANCHE','05','04','22'),
 (1762,'TINGO DE SAPOSOA','06','04','22'),
 (1763,'LAMAS','01','05','22'),
 (1764,'ALONSO DE ALVARADO','02','05','22'),
 (1765,'BARRANQUITA','03','05','22'),
 (1766,'CAYNARACHI','04','05','22'),
 (1767,'CUNUMBUQUI','05','05','22'),
 (1768,'PINTO RECODO','06','05','22'),
 (1769,'RUMISAPA','07','05','22'),
 (1770,'SAN ROQUE DE CUMBAZA','08','05','22'),
 (1771,'SHANAO','09','05','22'),
 (1772,'TABALOSOS','10','05','22'),
 (1773,'ZAPATERO','11','05','22'),
 (1774,'JUANJUI','01','06','22'),
 (1775,'CAMPANILLA','02','06','22'),
 (1776,'HUICUNGO','03','06','22'),
 (1777,'PACHIZA','04','06','22'),
 (1778,'PAJARILLO','05','06','22'),
 (1779,'PICOTA','01','07','22'),
 (1780,'BUENOS AIRES','02','07','22'),
 (1781,'CASPISAPA','03','07','22'),
 (1782,'PILLUANA','04','07','22'),
 (1783,'PUCACACA','05','07','22'),
 (1784,'SAN CRISTOBAL','06','07','22'),
 (1785,'SAN HILARION','07','07','22'),
 (1786,'SHAMBOYACU','08','07','22'),
 (1787,'TINGO DE PONASA','09','07','22'),
 (1788,'TRES UNIDOS','10','07','22'),
 (1789,'RIOJA','01','08','22'),
 (1790,'AWAJUN','02','08','22'),
 (1791,'ELIAS SOPLIN VARGAS','03','08','22'),
 (1792,'NUEVA CAJAMARCA','04','08','22'),
 (1793,'PARDO MIGUEL','05','08','22'),
 (1794,'POSIC','06','08','22');
INSERT INTO `sys_dir_distrito` (`dis_id`,`dis_nombre`,`dis_codigo`,`pro_codigo`,`dep_codigo`) VALUES 
 (1795,'SAN FERNANDO','07','08','22'),
 (1796,'YORONGOS','08','08','22'),
 (1797,'YURACYACU','09','08','22'),
 (1798,'TARAPOTO','01','09','22'),
 (1799,'ALBERTO LEVEAU','02','09','22'),
 (1800,'CACATACHI','03','09','22'),
 (1801,'CHAZUTA','04','09','22'),
 (1802,'CHIPURANA','05','09','22'),
 (1803,'EL PORVENIR','06','09','22'),
 (1804,'HUIMBAYOC','07','09','22'),
 (1805,'JUAN GUERRA','08','09','22'),
 (1806,'LA BANDA DE SHILCAYO','09','09','22'),
 (1807,'MORALES','10','09','22'),
 (1808,'PAPAPLAYA','11','09','22'),
 (1809,'SAN ANTONIO','12','09','22'),
 (1810,'SAUCE','13','09','22'),
 (1811,'SHAPAJA','14','09','22'),
 (1812,'TOCACHE','01','10','22'),
 (1813,'NUEVO PROGRESO','02','10','22'),
 (1814,'POLVORA','03','10','22'),
 (1815,'SHUNTE','04','10','22'),
 (1816,'UCHIZA','05','10','22'),
 (1817,'TACNA','01','01','23'),
 (1818,'ALTO DE LA ALIANZA','02','01','23'),
 (1819,'CALANA','03','01','23'),
 (1820,'CIUDAD NUEVA','04','01','23'),
 (1821,'INCLAN','05','01','23'),
 (1822,'PACHIA','06','01','23'),
 (1823,'PALCA','07','01','23'),
 (1824,'POCOLLAY','08','01','23'),
 (1825,'SAMA','09','01','23'),
 (1826,'CORONEL GREGORIO ALBARRACIN LANCHIPA','10','01','23'),
 (1827,'LA YARADA-LOS PALOS','11','01','23'),
 (1828,'CANDARAVE','01','02','23'),
 (1829,'CAIRANI','02','02','23'),
 (1830,'CAMILACA','03','02','23'),
 (1831,'CURIBAYA','04','02','23'),
 (1832,'HUANUARA','05','02','23'),
 (1833,'QUILAHUANI','06','02','23'),
 (1834,'LOCUMBA','01','03','23'),
 (1835,'ILABAYA','02','03','23'),
 (1836,'ITE','03','03','23'),
 (1837,'TARATA','01','04','23'),
 (1838,'HEROES ALBARRACIN','02','04','23'),
 (1839,'ESTIQUE','03','04','23'),
 (1840,'ESTIQUE-PAMPA','04','04','23'),
 (1841,'SITAJARA','05','04','23'),
 (1842,'SUSAPAYA','06','04','23'),
 (1843,'TARUCACHI','07','04','23'),
 (1844,'TICACO','08','04','23'),
 (1845,'TUMBES','01','01','24'),
 (1846,'CORRALES','02','01','24'),
 (1847,'LA CRUZ','03','01','24'),
 (1848,'PAMPAS DE HOSPITAL','04','01','24'),
 (1849,'SAN JACINTO','05','01','24'),
 (1850,'SAN JUAN DE LA VIRGEN','06','01','24'),
 (1851,'ZORRITOS','01','02','24'),
 (1852,'CASITAS','02','02','24'),
 (1853,'CANOAS DE PUNTA SAL','03','02','24'),
 (1854,'ZARUMILLA','01','03','24'),
 (1855,'AGUAS VERDES','02','03','24'),
 (1856,'MATAPALO','03','03','24'),
 (1857,'PAPAYAL','04','03','24'),
 (1858,'CALLERIA','01','01','25'),
 (1859,'CAMPOVERDE','02','01','25'),
 (1860,'IPARIA','03','01','25'),
 (1861,'MASISEA','04','01','25'),
 (1862,'YARINACOCHA','05','01','25'),
 (1863,'NUEVA REQUENA','06','01','25'),
 (1864,'MANANTAY','07','01','25'),
 (1865,'RAYMONDI','01','02','25'),
 (1866,'SEPAHUA','02','02','25'),
 (1867,'TAHUANIA','03','02','25'),
 (1868,'YURUA','04','02','25'),
 (1869,'PADRE ABAD','01','03','25'),
 (1870,'IRAZOLA','02','03','25'),
 (1871,'CURIMANA','03','03','25'),
 (1872,'NESHUYA','04','03','25'),
 (1873,'ALEXANDER VON HUMBOLDT','05','03','25'),
 (1874,'PURUS','01','04','25');
/*!40000 ALTER TABLE `sys_dir_distrito` ENABLE KEYS */;


--
-- Definition of table `sys_dir_provincia`
--

DROP TABLE IF EXISTS `sys_dir_provincia`;
CREATE TABLE `sys_dir_provincia` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_nombre` varchar(150) DEFAULT NULL,
  `dep_codigo` varchar(2) DEFAULT NULL,
  `pro_cod` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`pro_id`) USING BTREE,
  KEY `dep_codigo` (`dep_codigo`) USING BTREE,
  KEY `pro_cod` (`pro_cod`) USING BTREE,
  CONSTRAINT `sys_dir_provincia_ibfk_1` FOREIGN KEY (`dep_codigo`) REFERENCES `sys_dir_departamento` (`dep_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sys_dir_provincia`
--

/*!40000 ALTER TABLE `sys_dir_provincia` DISABLE KEYS */;
INSERT INTO `sys_dir_provincia` (`pro_id`,`pro_nombre`,`dep_codigo`,`pro_cod`) VALUES 
 (1,'CHACHAPOYAS','01','01'),
 (2,'RODRIGUEZ DE MENDOZA','01','06'),
 (3,'CONDORCANQUI','01','04'),
 (4,'BAGUA','01','02'),
 (5,'UTCUBAMBA','01','07'),
 (6,'LUYA','01','05'),
 (7,'BONGARA','01','03'),
 (8,'HUARMEY','02','11'),
 (9,'POMABAMBA','02','16'),
 (10,'ASUNCION','02','04'),
 (11,'CORONGO','02','09'),
 (12,'OCROS','02','14'),
 (13,'SIHUAS','02','19'),
 (14,'AIJA','02','02'),
 (15,'CARLOS FERMIN FITZCA','02','07'),
 (16,'HUAYLAS','02','12'),
 (17,'RECUAY','02','17'),
 (18,'BOLOGNESI','02','05'),
 (19,'HUARI','02','10'),
 (20,'PALLASCA','02','15'),
 (21,'YUNGAY','02','20'),
 (22,'ANTONIO RAYMONDI','02','03'),
 (23,'CASMA','02','08'),
 (24,'MARISCAL LUZURIAGA','02','13'),
 (25,'SANTA','02','18'),
 (26,'HUARAZ','02','01'),
 (27,'CARHUAZ','02','06'),
 (28,'ABANCAY','03','01'),
 (29,'CHINCHEROS','03','06'),
 (30,'AYMARAES','03','04'),
 (31,'ANDAHUAYLAS','03','02'),
 (32,'GRAU','03','07'),
 (33,'COTABAMBAS','03','05'),
 (34,'ANTABAMBA','03','03'),
 (35,'CASTILLA','04','04'),
 (36,'CAMANA','04','02'),
 (37,'ISLAY','04','07'),
 (38,'CAYLLOMA','04','05'),
 (39,'CARAVELI','04','03'),
 (40,'LA UNION','04','08'),
 (41,'AREQUIPA','04','01'),
 (42,'CONDESUYOS','04','06'),
 (43,'PAUCAR DEL SARA SARA','05','08'),
 (44,'HUAMANGA','05','01'),
 (45,'LUCANAS','05','06'),
 (46,'VILCAS HUAMAN','05','11'),
 (47,'HUANTA','05','04'),
 (48,'SUCRE','05','09'),
 (49,'CANGALLO','05','02'),
 (50,'PARINACOCHAS','05','07'),
 (51,'LA MAR','05','05'),
 (52,'VICTOR FAJARDO','05','10'),
 (53,'HUANCA SANCOS','05','03'),
 (54,'CAJABAMBA','06','02'),
 (55,'HUALGAYOC','06','07'),
 (56,'SAN PABLO','06','12'),
 (57,'CONTUMAZA','06','05'),
 (58,'SAN MARCOS','06','10'),
 (59,'CELENDIN','06','03'),
 (60,'JAEN','06','08'),
 (61,'SANTA CRUZ','06','13'),
 (62,'CAJAMARCA','06','01'),
 (63,'CUTERVO','06','06'),
 (64,'SAN MIGUEL','06','11'),
 (65,'CHOTA','06','04'),
 (66,'SAN IGNACIO','06','09'),
 (67,'CALLAO','07','01'),
 (68,'ANTA','08','03'),
 (69,'ESPINAR','08','08'),
 (70,'URUBAMBA','08','13'),
 (71,'CUSCO','08','01'),
 (72,'CANCHIS','08','06'),
 (73,'PAUCARTAMBO','08','11'),
 (74,'CALCA','08','04'),
 (75,'LA CONVENCION','08','09'),
 (76,'ACOMAYO','08','02'),
 (77,'CHUMBIVILCAS','08','07'),
 (78,'QUISPICANCHI','08','12'),
 (79,'CANAS','08','05'),
 (80,'PARURO','08','10'),
 (81,'ACOBAMBA','09','02'),
 (82,'TAYACAJA','09','07'),
 (83,'CHURCAMPA','09','05'),
 (84,'ANGARAES','09','03'),
 (85,'HUANCAVELICA','09','01'),
 (86,'HUAYTARA','09','06'),
 (87,'CASTROVIRREYNA','09','04'),
 (88,'HUAMALIES','10','05'),
 (89,'LAURICOCHA','10','10'),
 (90,'DOS DE MAYO','10','03'),
 (91,'PACHITEA','10','08'),
 (92,'HUANUCO','10','01'),
 (93,'LEONCIO PRADO','10','06'),
 (94,'YAROWILCA','10','11'),
 (95,'HUACAYBAMBA','10','04'),
 (96,'PUERTO INCA','10','09'),
 (97,'AMBO','10','02'),
 (98,'MARANON','10','07'),
 (99,'PALPA','11','04'),
 (100,'CHINCHA','11','02'),
 (101,'PISCO','11','05'),
 (102,'NAZCA','11','03'),
 (103,'ICA','11','01'),
 (104,'JAUJA','12','04'),
 (105,'CHUPACA','12','09'),
 (106,'CONCEPCION','12','02'),
 (107,'TARMA','12','07'),
 (108,'JUNIN','12','05'),
 (109,'CHANCHAMAYO','12','03'),
 (110,'YAULI','12','08'),
 (111,'HUANCAYO','12','01'),
 (112,'SATIPO','12','06'),
 (113,'ASCOPE','13','02'),
 (114,'PACASMAYO','13','07'),
 (115,'VIRU','13','12'),
 (116,'JULCAN','13','05'),
 (117,'SANTIAGO DE CHUCO','13','10'),
 (118,'BOLIVAR','13','03'),
 (119,'PATAZ','13','08'),
 (120,'TRUJILLO','13','01'),
 (121,'OTUZCO','13','06'),
 (122,'GRAN CHIMU','13','11'),
 (123,'CHEPEN','13','04'),
 (124,'SANCHEZ CARRION','13','09'),
 (125,'LAMBAYEQUE','14','03'),
 (126,'CHICLAYO','14','01'),
 (127,'FERRENAFE','14','02'),
 (128,'BARRANCA','15','02'),
 (129,'HUAROCHIRI','15','07'),
 (130,'CANETE','15','05'),
 (131,'YAUYOS','15','10'),
 (132,'CAJATAMBO','15','03'),
 (133,'HUAURA','15','08'),
 (134,'LIMA','15','01'),
 (135,'HUARAL','15','06'),
 (136,'CANTA','15','04'),
 (137,'OYON','15','09'),
 (138,'ALTO AMAZONAS','16','02'),
 (139,'DATEM DEL MARANON','16','07'),
 (140,'REQUENA','16','05'),
 (141,'LORETO','16','03'),
 (142,'MAYNAS','16','01'),
 (143,'UCAYALI','16','06'),
 (144,'MARISCAL RAMON CASTILLA','16','04'),
 (145,'MANU','17','02'),
 (146,'TAHUAMANU','17','03'),
 (147,'TAMBOPATA','17','01'),
 (148,'GENERAL SANCHEZ CERR','18','02'),
 (149,'ILO','18','03'),
 (150,'MARISCAL NIETO','18','01'),
 (151,'PASCO','19','01'),
 (152,'DANIEL ALCIDES CARRI','19','02'),
 (153,'OXAPAMPA','19','03'),
 (154,'HUANCABAMBA','20','03'),
 (155,'SECHURA','20','08'),
 (156,'PIURA','20','01'),
 (157,'SULLANA','20','06'),
 (158,'MORROPON','20','04'),
 (159,'AYABACA','20','02'),
 (160,'TALARA','20','07'),
 (161,'PAITA','20','05'),
 (162,'EL COLLAO','21','05'),
 (163,'SAN ANTONIO DE PUTIN','21','10'),
 (164,'CARABAYA','21','03'),
 (165,'MELGAR','21','08'),
 (166,'YUNGUYO','21','13'),
 (167,'PUNO','21','01'),
 (168,'HUANCANE','21','06'),
 (169,'SAN ROMAN','21','11'),
 (170,'CHUCUITO','21','04'),
 (171,'MOHO','21','09'),
 (172,'AZANGARO','21','02'),
 (173,'LAMPA','21','07'),
 (174,'SANDIA','21','12'),
 (175,'HUALLAGA','22','04'),
 (176,'SAN MARTIN','22','09'),
 (177,'BELLAVISTA','22','02'),
 (178,'PICOTA','22','07'),
 (179,'LAMAS','22','05'),
 (180,'TOCACHE','22','10'),
 (181,'EL DORADO','22','03'),
 (182,'RIOJA','22','08'),
 (183,'MOYOBAMBA','22','01'),
 (184,'MARISCAL CACERES','22','06'),
 (185,'TARATA','23','04'),
 (186,'CANDARAVE','23','02'),
 (187,'JORGE BASADRE','23','03'),
 (188,'TACNA','23','01'),
 (189,'ZARUMILLA','24','03'),
 (190,'TUMBES','24','01'),
 (191,'CONTRALMIRANTE VILLA','24','02'),
 (192,'ATALAYA','25','02'),
 (193,'PADRE ABAD','25','03'),
 (194,'CORONEL PORTILLO','25','01'),
 (195,'PURUS','25','04');
/*!40000 ALTER TABLE `sys_dir_provincia` ENABLE KEYS */;


--
-- Definition of table `tablas`
--

DROP TABLE IF EXISTS `tablas`;
CREATE TABLE `tablas` (
  `nomtabla` char(15) NOT NULL DEFAULT '' COMMENT 'Nombre de la Tabla',
  `valor` decimal(10,0) NOT NULL DEFAULT 0 COMMENT 'Valor de ID Generado',
  PRIMARY KEY (`nomtabla`) USING BTREE,
  KEY `key_data` (`nomtabla`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tablas`
--

/*!40000 ALTER TABLE `tablas` DISABLE KEYS */;
INSERT INTO `tablas` (`nomtabla`,`valor`) VALUES 
 ('AUXILIAR','40807');
/*!40000 ALTER TABLE `tablas` ENABLE KEYS */;


--
-- Definition of table `tablope`
--

DROP TABLE IF EXISTS `tablope`;
CREATE TABLE `tablope` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Unico SYS(2015) - VFP',
  `codapl` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Aplicacion 1=Compras  2=Ventas',
  `codigo` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento',
  `descrip` varchar(30) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `indsubcta` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indicador si es un Sub-Documento',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Documento',
  `detigv` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Detalle Incluye Impuestos',
  `caligv` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Calcula Impuestos',
  `verigv` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Visualiza Impuestos',
  `tipond` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Tipo de Numeracion 0=Alfanumerico  1=Numerico',
  `correl` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Auto Correlativo',
  `ostock` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Accion en el STOCK Ingreso-Salida',
  `astock` char(1) NOT NULL DEFAULT '' COMMENT 'Indica si pregunta o antes de actualizar Kardex',
  `serie` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Prorratea Costos x Item de Documento',
  `series` char(1) NOT NULL DEFAULT '' COMMENT 'Control de Series - No Usado',
  `kardex` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si Actualiza Kardex',
  `docref` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si Maneja Referencia',
  `copiar` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si Copia los datos de la Referencia',
  `correc` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si va restar a un abono CASH, NC a FA,BV',
  `anular` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si se puede Anular',
  `borrar` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si se puede Elimnar',
  `formato` char(8) NOT NULL DEFAULT '' COMMENT 'Nombre de Formato de Impresion',
  `cola` varchar(250) NOT NULL DEFAULT '' COMMENT 'Cola de Impresion',
  `ctacte` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si Apertura Ctas.Ctes.',
  `status` char(1) NOT NULL DEFAULT '' COMMENT 'Indica si es Documento para Seguimiento',
  `dc` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento segun SUNAT',
  `docitem` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si maneja Item',
  `impto1` decimal(6,2) NOT NULL DEFAULT 0.00 COMMENT 'Porct. de Impuesto 1',
  `impto2` decimal(6,2) NOT NULL DEFAULT 0.00 COMMENT 'Porct. de Impuesto 2',
  `apl_impsto` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Indica como aplica los Impuestos al 1=NETO  2=TOTAL',
  `val_texto` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Manejo de Item de tipo TEXTO valorizado',
  `prn_lin` decimal(3,0) NOT NULL DEFAULT 0 COMMENT 'Nro de lineas por documento',
  `ask_kardex` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si Pregunta antes de descargar en Kardes',
  `doctrans` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Manejo de Transportista',
  `gen_asiento` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si el Documento se va a Contabilizar',
  `cta_bi` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de BI',
  `cta_impto1` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impuesto 1',
  `cta_impto2` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impuesto 2',
  `cta_impto3` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Impuesto 3',
  `cta_dscto` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Descuento',
  `bi_dh` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Indica posicion del BI Debe/Haber',
  `impto1_dh` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Indica posicion del Impto1 Debe/Haber',
  `impto2_dh` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Indica posicion del Impto2 Debe/Haber',
  `impto3_dh` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Indica posicion del Impto3 Debe/Haber',
  `dscto_dh` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Indica posicion del Descuento Debe/Haber',
  `total_dh` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Indica posicion del Total Debe/Haber',
  `opebco` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Documento de Operacion Bancaria',
  `modobco` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Modalidad de Documento de Pago',
  `fechvcto` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Manejo de Fecha de Vencimiento',
  `ruc` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Exige RUC',
  `di` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Exige DNI',
  `interes` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Calcula Interes moratorio',
  `ingbco` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Ingreo x Transferencia Bancaria',
  `cta_s_caja` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Caja Soles',
  `cta_d_caja` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Caja Dolares',
  `cta_s_bco` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Banco Soles',
  `cta_d_bco` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Banco Dolares',
  `cta_c_let` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Letras x Cobrar',
  `cta_p_let` char(15) NOT NULL DEFAULT '' COMMENT 'Cta de Letras x Pagar',
  `resu_doc` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si se contabiliza en forma Resumida',
  `add_impto` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si adiciona Impuestos al precio unit.',
  `flg_serie` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Control de Series',
  `contrato` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Control de Contratos',
  `genaviso` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Control de Avisos de pagos de contratos',
  `multiref` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Documento para Multireferencia',
  `comi` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'Flag que Resta un Porct de comision',
  `dni_monto` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Importe Minimo para exigir DNI',
  `dni_monto2` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Importe Minimo para exigir DNI 2',
  `dni_mone` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda del Importe minimo para exigir DNI',
  `ldireccion` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Control de Cambio de Direcciones',
  `auxi_exige` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Control de Exige AUXILIAR',
  `doc1` char(15) NOT NULL DEFAULT '' COMMENT 'Documento Texto 1',
  `doc2` char(15) NOT NULL DEFAULT '' COMMENT 'Documento Texto 2',
  `doc3` char(15) NOT NULL DEFAULT '' COMMENT 'Documento Texto 3 (Percepciones)',
  `flg_percep` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de control de Percepciones',
  `aplica` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Control de Aplicacion de Saldo a otras Referencias',
  `tipo_aplica` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Aplicacion a otras Referencias ABONO-CARGO',
  `refagrupa` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si se agrupa los Productos al referencias documentos',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `flg_peding` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Control de Stock Pedidos-Transito',
  `flg_prof` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de datos para proformas',
  `flg_pre_cero` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Permite el ingreso de precios en CERO (0)',
  `flg_num_ant` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Controla que exista el nro correlativo anterior',
  `flg_can_cero` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Permite el ingreso de cantidad en CERO (0)',
  `flg_electronico` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag doc. electronico',
  `flg_placa` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag Indica si exige Placa',
  `flg_contingencia` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag doc. contingencia',
  `flg_separa` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag indica que separa prod-serie / Caja Venta',
  PRIMARY KEY (`unico`) USING BTREE,
  UNIQUE KEY `tablope` (`codapl`,`codigo`) USING BTREE,
  KEY `formato` (`codapl`,`formato`) USING BTREE,
  KEY `descrip` (`descrip`) USING BTREE,
  KEY `codapl` (`codapl`) USING BTREE,
  CONSTRAINT `FK_TABLOPE_PRNFORM` FOREIGN KEY (`codapl`, `formato`) REFERENCES `prnform` (`codapl`, `prnform`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tablope`
--

/*!40000 ALTER TABLE `tablope` DISABLE KEYS */;
INSERT INTO `tablope` (`unico`,`codapl`,`codigo`,`descrip`,`indsubcta`,`moneda`,`detigv`,`caligv`,`verigv`,`tipond`,`correl`,`ostock`,`astock`,`serie`,`series`,`kardex`,`docref`,`copiar`,`correc`,`anular`,`borrar`,`formato`,`cola`,`ctacte`,`status`,`dc`,`docitem`,`impto1`,`impto2`,`apl_impsto`,`val_texto`,`prn_lin`,`ask_kardex`,`doctrans`,`gen_asiento`,`cta_bi`,`cta_impto1`,`cta_impto2`,`cta_impto3`,`cta_dscto`,`bi_dh`,`impto1_dh`,`impto2_dh`,`impto3_dh`,`dscto_dh`,`total_dh`,`opebco`,`modobco`,`fechvcto`,`ruc`,`di`,`interes`,`ingbco`,`cta_s_caja`,`cta_d_caja`,`cta_s_bco`,`cta_d_bco`,`cta_c_let`,`cta_p_let`,`resu_doc`,`add_impto`,`flg_serie`,`contrato`,`genaviso`,`multiref`,`comi`,`dni_monto`,`dni_monto2`,`dni_mone`,`ldireccion`,`auxi_exige`,`doc1`,`doc2`,`doc3`,`flg_percep`,`aplica`,`tipo_aplica`,`refagrupa`,`cod_suc`,`flg_peding`,`flg_prof`,`flg_pre_cero`,`flg_num_ant`,`flg_can_cero`,`flg_electronico`,`flg_placa`,`flg_contingencia`,`flg_separa`) VALUES 
 ('_2DB0P55A1','2','F2','FACTURA ELECTRONICO COMPU',0x00,'2',0x01,0x01,0x01,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNFACTE','PROFORMA',0x01,'N','01',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','2','2','2','2','1','1',0x00,'0',0x00,0x01,0x00,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'1',0x01,'1',0x00,0x00,0x00,0x00,0x01,0x01,0x00,0x00,0x00),
 ('_2DB0P55A2','2','B2','BOLETA ELECTRONICO COMPU',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNBOLEE','PROFORMA',0x01,'N','03',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','2','2','2','2','1','1',0x00,'0',0x00,0x00,0x01,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','700.00','99999.99','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'1',0x00,0x00,0x00,0x00,0x01,0x01,0x00,0x00,0x00),
 ('_2DB0P55UC','1','FA','FACTURA DE COMPRA',0x00,'2',0x00,0x01,0x01,0x01,0x00,'1','',0x00,'',0x01,0x01,0x01,0x01,0x00,0x01,'VIEWGEN','',0x01,'N','01',0x01,'18.00','0.00','1',0x01,'30',0x01,0x00,0x01,'','','','','','1','1','1','0','2','2',0x00,'0',0x00,0x01,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x01,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P55VZ','1','GR','GUIA DE REMISION',0x00,'2',0x00,0x01,0x01,0x01,0x01,'1','',0x00,'',0x01,0x00,0x00,0x00,0x00,0x01,'VIEWGEN','',0x00,'','',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P55XL','2','FA','FACTURA DE VENTA',0x00,'2',0x01,0x01,0x01,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNFACT','SOFTLINK',0x01,'N','01',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','2','2','2','2','1','1',0x00,'0',0x00,0x01,0x00,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'1',0x01,'',0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P55ZO','2','BV','BOLETA DE VENTA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNBOLE','SOFTLINK',0x01,'N','03',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','2','2','2','2','1','1',0x00,'0',0x00,0x00,0x00,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P561A','2','GR','GUIA DE REMISION',0x00,'2',0x01,0x01,0x01,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNGUIA','PROFORMA',0x00,'N','09',0x01,'18.00','0.00','1',0x01,'20',0x01,0x01,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x01,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P562T','1','OC','ORDEN DE COMPRA',0x00,'2',0x00,0x01,0x01,0x01,0x01,'0','',0x00,'',0x00,0x00,0x00,0x01,0x01,0x01,'VIEWORD','',0x00,'S','',0x01,'18.00','0.00','1',0x01,'30',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x01,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x01,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P564F','2','ND','NOTA DE DEBITO',0x00,'2',0x00,0x01,0x01,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNNTDEB','',0x01,'','08',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','2','2','2','2','1','1',0x00,'0',0x00,0x01,0x01,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x01,0x00,'0.000','700.00','99999.99','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P5662','1','ND','NOTA DE DEBITO',0x00,'1',0x00,0x01,0x01,0x01,0x01,'1','',0x00,'',0x01,0x01,0x00,0x00,0x01,0x01,'VIEWGEN','',0x01,'','08',0x01,'18.00','0.00','1',0x01,'10',0x01,0x00,0x01,'','','','','','1','1','1','0','2','2',0x00,'0',0x00,0x01,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P567P','1','NC','NOTA DE CREDITO',0x00,'2',0x00,0x01,0x01,0x01,0x00,'2','',0x00,'',0x01,0x01,0x01,0x01,0x00,0x01,'VIEWGEN','',0x01,'','07',0x01,'18.00','0.00','1',0x01,'12',0x01,0x00,0x01,'','','','','','2','2','2','0','1','1',0x00,'0',0x00,0x01,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'Nro. de Fact','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P569B','2','NC','NOTA DE CREDITO',0x00,'2',0x01,0x01,0x01,0x01,0x01,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNNTCRE','SOFTLINK',0x01,'N','07',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','1','1','1','1','2','2',0x00,'0',0x00,0x01,0x01,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','700.00','99999.99','1',0x00,0x00,'','','',0x00,0x00,'1',0x01,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_2DB0P56A3','2','N3','NOTA DEBITO ELECTRONICO COMPU',0x00,'2',0x00,0x01,0x01,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNNDEBE','',0x01,'','08',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','2','2','2','2','1','1',0x00,'0',0x00,0x01,0x01,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x01,0x00,'0.000','700.00','99999.99','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'1',0x00,0x00,0x01,0x00,0x01,0x01,0x00,0x00,0x00),
 ('_2DB0P56A4','2','N2','NOTA CREDITO ELECTRONICO COMPU',0x00,'2',0x01,0x01,0x01,0x01,0x01,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNNCREE','',0x01,'N','07',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','1','1','1','1','2','2',0x00,'0',0x00,0x01,0x01,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','700.00','99999.99','1',0x00,0x00,'B2','F2','',0x00,0x00,'1',0x01,'1',0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00),
 ('_2DB0P56AY','1','IN','INVENTARIO',0x00,'2',0x00,0x01,0x01,0x01,0x01,'1','',0x01,'',0x01,0x00,0x00,0x00,0x00,0x01,'VIEWGEN','',0x00,'S','',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P56CG','2','PR','PROFORMA DE VENTA',0x00,'2',0x01,0x01,0x01,0x01,0x01,'0','',0x00,'',0x00,0x00,0x00,0x00,0x01,0x01,'PRNPROF','PROFORMA',0x00,'N','',0x01,'18.00','0.00','1',0x01,'20',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','20.00','0.00','1',0x00,0x00,'Plazo Entrega','Garantia','Validez',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P56E3','1','NI','NOTA DE COMPRA SIN DOCUMENTO',0x00,'2',0x00,0x01,0x01,0x01,0x01,'1','',0x00,'',0x01,0x00,0x00,0x00,0x01,0x01,'VIEWGEN','',0x01,'','',0x01,'18.00','0.00','1',0x01,'50',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_2DB0P56KL','3','CH','CHEQUE',0x00,'1',0x01,0x01,0x01,0x00,0x00,'0','',0x00,'',0x01,0x00,0x00,0x00,0x01,0x00,'PRNVOUCH','',0x00,'','CH',0x01,'0.00','0.00','1',0x01,'30',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'2',0x01,0x00,0x00,0x00,0x00,'104112','104122','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P56M8','3','EF','EFECTIVO DISPONIBLE',0x00,'1',0x01,0x01,0x01,0x00,0x00,'0','',0x00,'',0x01,0x00,0x00,0x00,0x01,0x00,'PRNVOUCH','',0x00,'','EF',0x01,'0.00','0.00','1',0x01,'30',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'1',0x00,0x00,0x00,0x00,0x00,'1011','1012','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P56NV','3','LE','LETRA DE CAMBIO - CARTERA',0x01,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'PRNLETRA','',0x01,'','LE',0x00,'0.00','0.00','0',0x00,'30',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'3',0x01,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'1',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_2DB0P570O','1','BV','BOLETA DE COMPRA',0x00,'2',0x00,0x01,0x01,0x01,0x00,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'VIEWGEN','',0x01,'','03',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x01,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_2DB0P57AF','1','TK','TICKET DE COMPRA',0x00,'1',0x00,0x01,0x01,0x01,0x01,'1','',0x00,'',0x01,0x00,0x00,0x00,0x00,0x01,'VIEWGEN','',0x01,'','12',0x01,'18.00','0.00','1',0x01,'10',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x01,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0P57DW','1','RH','RECIBOS POR HONORARIOS',0x00,'1',0x00,0x00,0x00,0x01,0x01,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x01,'VIEWGEN','',0x01,'N','02',0x01,'0.00','0.00','1',0x01,'10',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x01,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0PI94D','3','MC','MULTI CANJE POR LETRAS',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DB0PNQJJ','3','M2','MOV. AUTOMATICO CLIENTE',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','07',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DW10I1HW','3','M1','MOV. AUTOMATICO PROVEEDOR',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','07',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'','42102','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DX0TBS3K','1','TS','TRANSFERENCIA DE STOCKS',0x00,'1',0x00,0x00,0x00,0x01,0x01,'1','',0x00,'',0x01,0x00,0x00,0x00,0x00,0x01,'VIEWGEN','',0x00,'','',0x01,'0.00','0.00','0',0x00,'50',0x00,0x01,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'Nro RMA','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2DX0TCCLF','2','TS','TRANSFERENCIA DE STOCKS',0x00,'2',0x00,0x00,0x00,0x01,0x01,'2','',0x00,'',0x01,0x00,0x00,0x00,0x00,0x01,'PRNTRANS','',0x00,'','',0x01,'0.00','0.00','0',0x00,'50',0x00,0x01,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'Nro RMA','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_2EG0XKU7X','2','RI','RMA RECEPCION - CLIENTE',0x00,'1',0x00,0x00,0x00,0x01,0x01,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNRMAIC','',0x01,'N','',0x01,'0.00','0.00','0',0x00,'15',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x01,0x00,'','Revizado','Solucion',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2EG0XN2VV','2','RS','RMA ENTREGA - CLIENTE',0x00,'1',0x00,0x00,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNRMASC','',0x00,'N','',0x01,'0.00','0.00','0',0x00,'15',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x01,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2EG0XQH0D','1','RS','RMA ENVIO - PROVEEDOR',0x00,'1',0x00,0x00,0x00,0x01,0x01,'2','',0x00,'',0x01,0x00,0x00,0x00,0x01,0x01,'RMAPROVO','',0x00,'N','',0x01,'0.00','0.00','0',0x00,'15',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x01,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2EG0XS7CR','1','RI','RMA RECOJO - PROVEEDOR',0x00,'2',0x01,0x01,0x00,0x01,0x01,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'RMAPROI','',0x00,'N','',0x01,'18.00','0.00','1',0x01,'15',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x01,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2JZ12WQU2','3','BD','DEPOSITOS',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'PRNVOUCH','',0x00,'','BD',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'2',0x00,0x00,0x00,0x00,0x00,'104112','104122','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_2TI0MOGPR','3','IT','I.T.F.',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'PRNVOUCH','',0x00,'','',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'','','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_31P16ZD4Z','2','NV','NOTA DE VENTA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'VIEWGEN','SOFTLINK',0x01,'N','',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x00,'7011101','4011101','','','7411101','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_31P1ACUC2','1','RP','RECIBO DE SERVICIOS PUBLICOS',0x00,'1',0x00,0x01,0x01,0x01,0x01,'1','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x01,'VIEWGEN','',0x01,'N','14',0x01,'18.00','0.00','1',0x01,'20',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x01,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_36P01V5ZH','3','L2','LETRA DE CAMBIO - COBRANZA',0x01,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'PRNLETRA','',0x01,'','LE',0x00,'0.00','0.00','0',0x00,'30',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'3',0x01,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'2',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_36P01VSDK','3','L3','LETRA DE CAMBIO - DESCUENTO',0x01,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'PRNLETRA','',0x01,'','LE',0x00,'0.00','0.00','0',0x00,'30',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'3',0x01,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'3',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_36P01W6DC','3','L4','LETRA DE CAMBIO - PROTESTO',0x01,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'PRNLETRA','',0x01,'','LE',0x00,'0.00','0.00','0',0x00,'30',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'3',0x01,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'4',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_37600OJM9','3','DT','DETRACCION',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','13',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x01,'2',0x00,0x00,0x00,0x00,0x00,'','','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_37600PJ8O','3','RT','RETENCION DEL IGV',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'','','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'6.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_37600QF9D','3','PO','PORTES Y MANTENIMIENTOS',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','PO',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'','','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_37600QTQZ','3','T1','TARJETA VISA',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','T1',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'4',0x01,0x00,0x00,0x00,0x00,'104112','104122','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'5.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_37600R96C','3','T2','TARJETA MASTERCARD',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','T2',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'104112','104122','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'5.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_37600RXH1','3','T3','TARJETA AMERICAN EXPRESS',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','T3',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'','','1011101','1011102','','',0x00,0x00,0x00,0x00,0x00,0x00,'5.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_4G516VEJC','2','PW','PROFORMA POR CORREO',0x00,'2',0x01,0x01,0x01,0x01,0x01,'2','',0x00,'',0x00,0x00,0x00,0x00,0x01,0x01,'PRNMAIL','',0x00,'N','',0x01,'18.00','0.00','1',0x01,'19',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'Plazo Entrega','Garantia','Validez',0x00,0x00,'0',0x00,'1',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_4GW0PRCZY','2','AB','AUXILIAR DE BOLETA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNBOLEE','\r\n',0x01,'N','',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x01,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','700.00','99999.99','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x00,0x01,0x01,0x00,0x00,0x00,0x00),
 ('_4HO0X20PP','2','DP','X PASE DE PRODUCTOS',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x00,0x00,0x01,0x01,'VIEWGEN','',0x00,'N','',0x01,'18.00','0.00','1',0x00,'20',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_4I212WRDR','2','XD','X DEVOLUCION DE PASE',0x00,'2',0x00,0x01,0x01,0x01,0x01,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'VIEWGEN','',0x00,'N','',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x01,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_4IF0SBRBL','2','OC','ORDEN DE VENTA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'ORDVENTA','',0x00,'N','',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_4M70NF1X4','3','GC','GASTOS POR CONSUMO',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x01,'1',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_4M70NHIZU','3','RE','RETIRO EN EFECTIVO',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x01,'1',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_4ME126R2Y','2','GI','GARANTIA RECEPCION',0x00,'2',0x01,0x01,0x00,0x01,0x01,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'RMAENTRA','',0x00,'N','',0x01,'18.00','0.00','1',0x01,'15',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','0.00','0.00','0',0x00,0x01,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_4ME12YTQH','2','GS','GARANTIA ENTREGA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'RMAOUT','',0x00,'N','',0x01,'18.00','0.00','1',0x00,'20',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x01,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_4MF0UNAHF','1','PE','GARANTIA PROVEEDOR - ENTRADA',0x00,'2',0x00,0x01,0x00,0x01,0x01,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'RMAPROI','',0x00,'N','',0x01,'18.00','0.00','1',0x00,'15',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x01,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_4MF0URPBC','1','PS','GARANTIA PROVEEDOR - SALIDA',0x00,'2',0x00,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'RMAPROVO','',0x00,'N','',0x01,'18.00','0.00','1',0x00,'15',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_53K13XUYT','3','PC','PERCEPCION AUTO.',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_54U10VUMZ','1','FI','FACTURA DE COMPRA INNOVA PC',0x00,'2',0x00,0x01,0x01,0x01,0x00,'1','',0x00,'',0x01,0x01,0x01,0x00,0x00,0x01,'VIEWGEN','',0x01,'N','1',0x01,'18.00','0.00','1',0x01,'30',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x01,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x01,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_5AT0NJ8XP','3','NC','NOTA DE CREDITO',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'VIEWGEN','',0x00,'','07',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'4',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_5K11746EM','3','TF','TRANSFERENCIA BCP',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'PRNVOUCH','',0x00,'','TF',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'2',0x00,0x00,0x00,0x00,0x00,'104113','104123','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_5K1174VE6','3','TB','TRANSFERENCIA BBVA',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'PRNVOUCH','',0x00,'','',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'2',0x00,0x00,0x00,0x00,0x00,'104112','104122','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_5KI122AML','3','TI','TRANFERENCIA INTERBANK',0x00,'1',0x00,0x00,0x00,0x00,0x00,'0','',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,'PRNVOUCH','',0x00,'','TI',0x00,'0.00','0.00','0',0x00,'0',0x00,0x00,0x01,'','','','','','0','0','0','0','0','0',0x01,'2',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x00,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x00,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_5LL0YY0P9','2','RR','NOTA RODMI VENTA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'VIEWGEN','',0x01,'N','',0x01,'18.00','0.00','1',0x01,'25',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_6440RHO8Z','2','B3','BOLETA ELECTRONICO AMSA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRBOLEE2','PROFORMA',0x01,'N','03',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','2','2','2','2','1','1',0x00,'0',0x00,0x00,0x01,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','700.00','99999.99','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'3',0x00,0x00,0x00,0x00,0x01,0x01,0x00,0x00,0x00),
 ('_6440RI0ED','2','N5','NOTA DEBITO ELECTRONICO AMSA',0x00,'2',0x00,0x01,0x01,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNDEBE2','',0x01,'','08',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','2','2','2','2','1','1',0x00,'0',0x00,0x01,0x01,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x01,0x00,'0.000','700.00','99999.99','1',0x00,0x00,'','','',0x00,0x00,'0',0x01,'3',0x00,0x00,0x01,0x00,0x01,0x01,0x00,0x00,0x00),
 ('_6440RI64I','2','N4','NOTA CREDITO ELECTRONICO AMSA',0x00,'2',0x01,0x01,0x01,0x01,0x01,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNCREE2','',0x01,'N','07',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','1','1','1','1','2','2',0x00,'0',0x00,0x01,0x01,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','700.00','99999.99','1',0x00,0x00,'B2','F2','',0x00,0x00,'1',0x01,'3',0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00),
 ('_6440RI9PD','2','F3','FACTURA ELECTRONICO AMSA',0x00,'2',0x01,0x01,0x01,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRFACTE2','PROFORMA',0x01,'N','01',0x01,'18.00','0.00','1',0x01,'999',0x01,0x00,0x01,'7011101','4011101','','4011301','7411101','2','2','2','2','1','1',0x00,'0',0x00,0x01,0x00,0x00,0x00,'1210101','1210102','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','0.00','0.00','1',0x00,0x00,'','','',0x00,0x00,'1',0x01,'3',0x00,0x00,0x00,0x00,0x01,0x01,0x00,0x00,0x00),
 ('_6450OU9TF','2','PE','PROFORMA POR CORREO AMSA',0x00,'2',0x01,0x01,0x01,0x01,0x01,'0','',0x00,'',0x00,0x00,0x00,0x00,0x01,0x01,'PRNMAIL2','',0x00,'N','',0x01,'18.00','0.00','1',0x01,'20',0x00,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x01,'3',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_64G10HIQF','2','G1','GUIA DE REMISION AMSA',0x01,'2',0x01,0x01,0x01,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNGUI2','',0x00,'N','09',0x01,'18.00','0.00','1',0x01,'20',0x00,0x01,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x01,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00),
 ('_69S0RU8F5','2','V2','NOTA VENTA AMSA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x00,'VIEWGEN','',0x01,'N','',0x01,'18.00','0.00','1',0x01,'20',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_6B50YDYKX','2','G2','GARANTIA RECEPCION AMSA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'1','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'RMAENTR2','',0x00,'N','',0x01,'18.00','0.00','1',0x01,'2',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x01,'0.000','0.00','0.00','0',0x00,0x01,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x01,0x01,0x00,0x00,0x00,0x00,0x00),
 ('_6B50YSTXQ','2','GO','GARANTIA ENTREGA AMSA',0x00,'2',0x01,0x01,0x00,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'RMAOU2','',0x00,'N','',0x01,'18.00','0.00','1',0x00,'20',0x01,0x00,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x01,0x00,'0.000','0.00','0.00','0',0x00,0x00,'','','',0x00,0x00,'0',0x01,'',0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00),
 ('_6IA0NQSKK','2','G3','GUIA REMISION ELECTRONICA',0x00,'2',0x01,0x01,0x01,0x01,0x01,'2','',0x00,'',0x01,0x01,0x01,0x00,0x01,0x01,'PRNGUIAE','',0x00,'N','09',0x01,'18.00','0.00','1',0x00,'999',0x00,0x01,0x00,'','','','','','0','0','0','0','0','0',0x00,'0',0x00,0x00,0x00,0x00,0x00,'','','','','','',0x00,0x00,0x01,0x00,0x00,0x00,'0.000','0.00','0.00','0',0x01,0x00,'','','',0x00,0x00,'0',0x01,'1',0x00,0x00,0x01,0x00,0x00,0x01,0x00,0x00,0x00);
/*!40000 ALTER TABLE `tablope` ENABLE KEYS */;


--
-- Definition of table `tabmodel`
--

DROP TABLE IF EXISTS `tabmodel`;
CREATE TABLE `tabmodel` (
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `codigo` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Modelo',
  `nom_model` varchar(50) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `observa` varchar(250) NOT NULL DEFAULT '' COMMENT 'Observaciones',
  `adicional` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'Porcentaje adicional',
  `moneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Precio',
  `ult_actualiza` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Ultima actualizacion de Costos',
  `prod_asocia` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Producto Asociado',
  `cod_asocia` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Producto Asociado',
  `t_costo` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Precio de Costo',
  `t_venta` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Precio de Venta',
  `t_util` decimal(15,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total Utilidad',
  `codexterno` char(6) NOT NULL DEFAULT '' COMMENT 'ID Externo de otra Aplicacion',
  `delinsumo` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que permite o no Eliminar Insumos',
  `cangen` decimal(15,3) NOT NULL DEFAULT 0.000 COMMENT 'Cantidad por defecto a Generar',
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `cod_asocia` (`cod_asocia`) USING BTREE,
  KEY `cod_suc` (`cod_suc`) USING BTREE,
  KEY `nom_model` (`nom_model`) USING BTREE,
  CONSTRAINT `FK_TABMODEL_SUCURSAL` FOREIGN KEY (`cod_suc`) REFERENCES `sucursal` (`cod_suc`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tabmodel`
--

/*!40000 ALTER TABLE `tabmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabmodel` ENABLE KEYS */;


--
-- Definition of table `tcambio`
--

DROP TABLE IF EXISTS `tcambio`;
CREATE TABLE `tcambio` (
  `dfecha` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de TC',
  `cambio` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'T.C. Promedio',
  `cambio2` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'T.C. Compra',
  `cambio3` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'T.C. Venta',
  PRIMARY KEY (`dfecha`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tcambio`
--

/*!40000 ALTER TABLE `tcambio` DISABLE KEYS */;
INSERT INTO `tcambio` (`dfecha`,`cambio`,`cambio2`,`cambio3`) VALUES 
 ('2024-03-21','3.750','3.750','3.750');
/*!40000 ALTER TABLE `tcambio` ENABLE KEYS */;


--
-- Definition of table `tipclasi`
--

DROP TABLE IF EXISTS `tipclasi`;
CREATE TABLE `tipclasi` (
  `tip_clasi` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Tipo de Auxiliar',
  `nom_clasi` varchar(50) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `precio` decimal(1,0) NOT NULL DEFAULT 1 COMMENT 'Tipo de Precio x Defecto',
  `tipo` decimal(1,0) NOT NULL DEFAULT 3 COMMENT 'Tipo de Auxiliar',
  PRIMARY KEY (`tip_clasi`) USING BTREE,
  KEY `nom_clasi` (`nom_clasi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tipclasi`
--

/*!40000 ALTER TABLE `tipclasi` DISABLE KEYS */;
INSERT INTO `tipclasi` (`tip_clasi`,`nom_clasi`,`precio`,`tipo`) VALUES 
 ('00','[SIN CLASIFICACION ]','1','3'),
 ('01','NUEVO CLIENTE','4','2'),
 ('02','FACEBOOK','5','2');
/*!40000 ALTER TABLE `tipclasi` ENABLE KEYS */;


--
-- Definition of table `tipo_envio`
--

DROP TABLE IF EXISTS `tipo_envio`;
CREATE TABLE `tipo_envio` (
  `id_tipo_envio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_envio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tipo_envio`
--

/*!40000 ALTER TABLE `tipo_envio` DISABLE KEYS */;
INSERT INTO `tipo_envio` (`id_tipo_envio`,`nombre`) VALUES 
 (1,'Recojo en tienda'),
 (2,'Envio');
/*!40000 ALTER TABLE `tipo_envio` ENABLE KEYS */;


--
-- Definition of table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago` (
  `id_tipo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  PRIMARY KEY (`id_tipo_pago`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tipo_pago`
--

/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` (`id_tipo_pago`,`nombre`,`estado`) VALUES 
 (1,'Deposito','1'),
 (2,'Efectivo','1'),
 (3,'Transferencia','1'),
 (4,'Tarjeta','0');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;


--
-- Definition of table `tipocon`
--

DROP TABLE IF EXISTS `tipocon`;
CREATE TABLE `tipocon` (
  `codigo` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Tipo de Contrato',
  `descrip` varchar(20) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `tipo` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo DIAS/MESES',
  `meses` decimal(3,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Meses',
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `descrip` (`descrip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tipocon`
--

/*!40000 ALTER TABLE `tipocon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocon` ENABLE KEYS */;


--
-- Definition of table `tipodetrac`
--

DROP TABLE IF EXISTS `tipodetrac`;
CREATE TABLE `tipodetrac` (
  `codigo` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Detraccion',
  `descrip` varchar(100) NOT NULL DEFAULT '' COMMENT 'Descripcion Detraccion',
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `descrip` (`descrip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tipodetrac`
--

/*!40000 ALTER TABLE `tipodetrac` DISABLE KEYS */;
INSERT INTO `tipodetrac` (`codigo`,`descrip`) VALUES 
 ('015','ABONOS, CUEROS Y PIELES DE ORIGEN ANIMAL'),
 ('016','ACEITE DE PESCADO.'),
 ('003','ALCOHOL ETILICO'),
 ('006','ALGODON\r'),
 ('029','ALGODON EN RAMA SIN DESMONTAR'),
 ('013','ANIMALES VIVOS'),
 ('009','ARENA Y PIEDRA'),
 ('019','ARRENDAMIENTO DE BIENES MUEBLES'),
 ('001','AZUCAR'),
 ('040','BIEN INMUEBLE GRAVADO CON IGV'),
 ('011','BIENES DEL INCISO A) DEL APENDICE I DE LA LEY DEL IGV\r'),
 ('035','BIENES EXONERADOS DEL IGV'),
 ('007','CANA DE AZUCAR\r'),
 ('014','CARNES Y DESPOJOS COMESTIBLES'),
 ('024','COMISION MERCANTIL'),
 ('030','CONTRATOS DE CONSTRUCCION\r'),
 ('037','DEMAS SERVICIOS GRAVADOS CON EL IGV'),
 ('018','EMBARCACIONES PESQUERAS'),
 ('033','ESPARRAGOS'),
 ('025','FABRICACION DE BIENES POR ENCARGO'),
 ('017','HARINA, POLVO Y (PELLETS) DE PESCADO, CRUSTACEOS, MOLUSCOS Y DEMAS INVERTEBRADOS ACUATICOS\r'),
 ('012','INTERMEDIACION LABORAL Y TERCERIZACION'),
 ('023','LECHE'),
 ('008','MADERA'),
 ('005','MAIZ AMARILLO DURO'),
 ('020','MANTENIMIENTO Y REPARACION DE BIENES MUEBLES'),
 ('034','MINERALES METALICOS NO AURIFEROS'),
 ('039','MINERALES NO METALICOS'),
 ('021','MOVIMIENTO DE CARGA'),
 ('031','ORO GRAVADO CON EL IGV\r'),
 ('036','ORO Y DEMAS MINERALES METALICOS EXONERADOS DEL IGV'),
 ('022','OTROS SERVICIOS EMPRESARIALES\r'),
 ('032','PAPRIKA Y OTROS FRUTOS DE LOS GENEROS CAPSICUM O PIMIENTA'),
 ('004','RECURSOS HIDROBIOLOGICOS\r'),
 ('010','RESIDUOS, SUBPRODUCTOS, DESECHOS, RECORTES Y DESPERDICIOS\r'),
 ('026','SERVICIO DE TRANSPORTE DE PERSONAS');
/*!40000 ALTER TABLE `tipodetrac` ENABLE KEYS */;


--
-- Definition of table `tipofact`
--

DROP TABLE IF EXISTS `tipofact`;
CREATE TABLE `tipofact` (
  `codigo` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Tipo de Facturacion',
  `descrip` char(20) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `tipo` char(1) NOT NULL DEFAULT '' COMMENT 'Tipo QUINCENAL/MENSUAL/ANUAL',
  `meses` decimal(3,0) NOT NULL DEFAULT 0 COMMENT 'Nro de Dias,Mes,Ano',
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `descrip` (`descrip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tipofact`
--

/*!40000 ALTER TABLE `tipofact` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipofact` ENABLE KEYS */;


--
-- Definition of table `tipoigv`
--

DROP TABLE IF EXISTS `tipoigv`;
CREATE TABLE `tipoigv` (
  `codigo` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Afectacion',
  `descrip` varchar(50) DEFAULT '' COMMENT 'Descripcion',
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tipoigv`
--

/*!40000 ALTER TABLE `tipoigv` DISABLE KEYS */;
INSERT INTO `tipoigv` (`codigo`,`descrip`) VALUES 
 ('10','GRAVADO - OPERACION ONEROSA'),
 ('11','GRAVADO - RETIRO POR PREMIO'),
 ('12','GRAVADO - RETIRO POR DONACION'),
 ('13','GRAVADO - RETIRO'),
 ('14','GRAVADO - RETIRO POR PUBLICIDAD\r'),
 ('15','GRAVADO - BONIFICACIONES'),
 ('16','GRAVADO - RETIRO POR ENTREGA A TRABAJADORES'),
 ('17','GRAVADO - IVAP'),
 ('20','EXONERADO - OPERACION ONEROSA'),
 ('21','EXONERADO - TRANSFERENCIA GRATUITA'),
 ('30','INAFECTO - OPERACION ONEROSA'),
 ('31','INAFECTO - RETIRO POR BONIFICACION'),
 ('32','INAFECTO - RETIRO'),
 ('33','INAFECTO - RETIRO POR MUESTRAS MEDICAS'),
 ('34','INAFECTO - RETIRO POR CONVENIO COLECTIVO'),
 ('35','INAFECTO - RETIRO POR PREMIO'),
 ('36','INAFECTO - RETIRO POR PUBLICIDAD'),
 ('40','EXPORTACION');
/*!40000 ALTER TABLE `tipoigv` ENABLE KEYS */;


--
-- Definition of table `tiponota`
--

DROP TABLE IF EXISTS `tiponota`;
CREATE TABLE `tiponota` (
  `tipo` char(2) NOT NULL DEFAULT '' COMMENT 'Tipo de Nota',
  `codigo` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Nota',
  `descrip` varchar(50) DEFAULT '' COMMENT 'Descripcion',
  PRIMARY KEY (`tipo`,`codigo`) USING BTREE,
  KEY `tipo` (`tipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tiponota`
--

/*!40000 ALTER TABLE `tiponota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiponota` ENABLE KEYS */;


--
-- Definition of table `tipoope`
--

DROP TABLE IF EXISTS `tipoope`;
CREATE TABLE `tipoope` (
  `codigo` char(4) NOT NULL DEFAULT '' COMMENT 'ID de Operacion',
  `descrip` varchar(100) DEFAULT '' COMMENT 'Descripcion',
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tipoope`
--

/*!40000 ALTER TABLE `tipoope` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoope` ENABLE KEYS */;


--
-- Definition of table `transpte`
--

DROP TABLE IF EXISTS `transpte`;
CREATE TABLE `transpte` (
  `codtrans` char(5) NOT NULL DEFAULT '' COMMENT 'ID de Transportista',
  `tiptrans` char(2) NOT NULL DEFAULT '' COMMENT 'Tipo de Transporte',
  `doctrans` char(2) NOT NULL COMMENT 'ID de Identidad',
  `ructrans` varchar(11) NOT NULL DEFAULT '' COMMENT 'Nro de RUC/DNI/CE',
  `brevete` varchar(15) NOT NULL DEFAULT '' COMMENT 'Nro de Brevete',
  `nomtrans` varchar(150) NOT NULL DEFAULT '' COMMENT 'Nombre o Razon Social',
  `dirtrans` varchar(150) NOT NULL DEFAULT '' COMMENT 'Direccion',
  `teltrans` varchar(15) NOT NULL DEFAULT '' COMMENT 'Telefono',
  `platrans` varchar(10) NOT NULL DEFAULT '' COMMENT 'PLaca 1',
  `marca` varchar(15) NOT NULL DEFAULT '' COMMENT 'Marca 1',
  `certifica` varchar(15) NOT NULL DEFAULT '' COMMENT 'Nro de Certificacion 1',
  `platrans2` varchar(10) NOT NULL DEFAULT '' COMMENT 'Placa 2',
  `marca2` varchar(15) NOT NULL DEFAULT '' COMMENT 'Marca 2',
  `certifica2` varchar(15) NOT NULL DEFAULT '' COMMENT 'Nro de Certificacion 2',
  PRIMARY KEY (`codtrans`) USING BTREE,
  KEY `brevete` (`brevete`) USING BTREE,
  KEY `dirtrans` (`dirtrans`) USING BTREE,
  KEY `nomtrans` (`nomtrans`) USING BTREE,
  KEY `platrans` (`platrans`) USING BTREE,
  KEY `platrans2` (`platrans2`) USING BTREE,
  KEY `ructrans` (`ructrans`) USING BTREE,
  KEY `teltrans` (`teltrans`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `transpte`
--

/*!40000 ALTER TABLE `transpte` DISABLE KEYS */;
INSERT INTO `transpte` (`codtrans`,`tiptrans`,`doctrans`,`ructrans`,`brevete`,`nomtrans`,`dirtrans`,`teltrans`,`platrans`,`marca`,`certifica`,`platrans2`,`marca2`,`certifica2`) VALUES 
 ('00000','','','','','[SIN TRANSPORTISTA]','','','','','','','','');
/*!40000 ALTER TABLE `transpte` ENABLE KEYS */;


--
-- Definition of table `transqc`
--

DROP TABLE IF EXISTS `transqc`;
CREATE TABLE `transqc` (
  `unico` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal - SYS(2015) VFP',
  `cod_suc` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal',
  `ruta` varchar(250) NOT NULL DEFAULT '' COMMENT 'Ruta de acceso al sistema Contable',
  `year` decimal(4,0) NOT NULL DEFAULT 0 COMMENT 'Ano de Transferencia',
  `mes` decimal(2,0) NOT NULL DEFAULT 0 COMMENT 'Mes de Transferencia',
  `lib_compras` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Libro Compras',
  `lib_ventas` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Libro Ventas',
  `lib_caja2` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Libro Caja Efectivo',
  `lib_caja` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Libro Caja Cheques',
  `lib_bcos` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Libro Bancos',
  `lib_letras` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Libro Letras',
  `docs_caja` varchar(250) NOT NULL DEFAULT '' COMMENT 'Doc(S) de Caja Efectivo',
  `docs_caja2` varchar(250) NOT NULL DEFAULT '' COMMENT 'Doc(S) de Caja Cheques',
  `docs_bcos` varchar(250) NOT NULL DEFAULT '' COMMENT 'Doc(S) de Caja Bancos',
  `docs_let` varchar(250) NOT NULL DEFAULT '' COMMENT 'Doc(S) de Caja Letras',
  `tipo_tr_c` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Transferencia Compras',
  `tipo_tr_v` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Transferencia Ventas',
  `debe1_ct` char(15) NOT NULL DEFAULT '' COMMENT 'Cta. 1 Debe Costo de Ventas',
  `debe2_ct` char(15) NOT NULL DEFAULT '' COMMENT 'Cta. 2 Debe Costo de Ventas',
  `haber_ct` char(15) NOT NULL DEFAULT '' COMMENT 'Cta. 1 Haber Costo de Ventas',
  `libro_ct` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Libro Costo Ventas',
  `docs_gasto` varchar(250) NOT NULL DEFAULT '' COMMENT 'Doc(S) de Gastos',
  `docs_bncg` varchar(250) NOT NULL DEFAULT '' COMMENT 'Doc(S) sin Transaccion',
  `cta1_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica FA-BV Soles (Ventas)',
  `cta2_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica FA-BV Dolares (Ventas)',
  `cta3_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 1 Soles (Ventas)',
  `cta4_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 1 Dolares (Ventas)',
  `cta5_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica ANTICIPOS Soles (Ventas)',
  `cta6_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica ANTICIPOS Dolares (Ventas)',
  `cta7_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 2 Soles (Ventas)',
  `cta8_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 2 Dolares (Ventas)',
  `cta9_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 3 Soles (Ventas)',
  `cta10_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 3 Dolares (Ventas)',
  `cta11_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 4 Soles (Ventas)',
  `cta12_v` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 4 Dolares (Ventas)',
  `cta1_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica FA-BV Soles (Compras)',
  `cta2_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica FA-BV Dolares (Compras)',
  `cta3_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 1 Soles (Compras)',
  `cta4_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 1 Dolares (Compras)',
  `cta5_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica ANTICIPOS Soles (Compras)',
  `cta6_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica ANTICIPOS Dolares (Compras)',
  `cta7_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 2 Soles (Compras)',
  `cta8_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 2 Dolares (Compras)',
  `cta9_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 3 Soles (Compras)',
  `cta10_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 3 Dolares (Compras)',
  `cta11_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 4 Soles (Compras)',
  `cta12_c` char(15) NOT NULL DEFAULT '' COMMENT 'Cta Basica LETRAS 4 Dolares (Compras)',
  PRIMARY KEY (`unico`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `transqc`
--

/*!40000 ALTER TABLE `transqc` DISABLE KEYS */;
INSERT INTO `transqc` (`unico`,`cod_suc`,`ruta`,`year`,`mes`,`lib_compras`,`lib_ventas`,`lib_caja2`,`lib_caja`,`lib_bcos`,`lib_letras`,`docs_caja`,`docs_caja2`,`docs_bcos`,`docs_let`,`tipo_tr_c`,`tipo_tr_v`,`debe1_ct`,`debe2_ct`,`haber_ct`,`libro_ct`,`docs_gasto`,`docs_bncg`,`cta1_v`,`cta2_v`,`cta3_v`,`cta4_v`,`cta5_v`,`cta6_v`,`cta7_v`,`cta8_v`,`cta9_v`,`cta10_v`,`cta11_v`,`cta12_v`,`cta1_c`,`cta2_c`,`cta3_c`,`cta4_c`,`cta5_c`,`cta6_c`,`cta7_c`,`cta8_c`,`cta9_c`,`cta10_c`,`cta11_c`,`cta12_c`) VALUES 
 ('_29H0S0PNC','1','E:|SOFTLINK|SOFTCONT90|DATA|EMPRESA000005|QCONT.DBC','2024','1','08','14','01','01','01','05','EF,M2,M1,IT,T1,T2,NC,TF,TB,TI','CH,BD,T3','CH,EF,BD,IT,PO,T1,T2,T3,GC','LE,LA,L2,L3,L4','1','1','','','','','','NC','12131','12132','1231101','1231111','1221101','1221111','1232101','1232111','1233101','1233111','1311101','1311111','42121','42122','4231101','4231102','4221101','4221102','4231101','4231102','4231101','4231102','4231101','4231102');
/*!40000 ALTER TABLE `transqc` ENABLE KEYS */;


--
-- Definition of table `trnstock`
--

DROP TABLE IF EXISTS `trnstock`;
CREATE TABLE `trnstock` (
  `codtrans` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Documento de Transaccion',
  `numtrans` char(11) NOT NULL DEFAULT '' COMMENT 'Nro de Transaccion',
  `fecha` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de Transaccion',
  `cod_trans` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Transportista',
  `cod_condi` char(2) NOT NULL DEFAULT '' COMMENT 'ID de Condicion',
  `suc_salida` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal de Salida',
  `alma_salida` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen de Salida',
  `id_salida` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal de Salida SYS(2015) VFP',
  `suc_ingreso` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal Ingreso',
  `alma_ingreso` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen Ingreso',
  `id_ingreso` char(10) NOT NULL DEFAULT '' COMMENT 'ID Principal de Ingreso SYS(2015) VFP',
  PRIMARY KEY (`suc_salida`,`codtrans`,`numtrans`) USING BTREE,
  KEY `fecha` (`fecha`) USING BTREE,
  KEY `id_ingreso` (`id_ingreso`) USING BTREE,
  KEY `id_salida` (`id_salida`) USING BTREE,
  KEY `cod_trans` (`cod_trans`) USING BTREE,
  KEY `cod_condi` (`cod_condi`) USING BTREE,
  CONSTRAINT `FK_TRNSTOCK_ESTADO` FOREIGN KEY (`cod_condi`) REFERENCES `estado` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TRNSTOCK_MOVIMIEN_INGRESOS` FOREIGN KEY (`id_ingreso`) REFERENCES `movimien` (`mov_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TRNSTOCK_MOVIMIEN_SALIDAS` FOREIGN KEY (`id_salida`) REFERENCES `movimien` (`mov_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TRNSTOCK_TRANSPTE` FOREIGN KEY (`cod_trans`) REFERENCES `transpte` (`codtrans`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT COMMENT='Tablas de Transacciones en Stock';

--
-- Dumping data for table `trnstock`
--

/*!40000 ALTER TABLE `trnstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `trnstock` ENABLE KEYS */;


--
-- Definition of table `ubigeo`
--

DROP TABLE IF EXISTS `ubigeo`;
CREATE TABLE `ubigeo` (
  `codigo` varchar(20) NOT NULL DEFAULT '' COMMENT 'ID de Ubigeo',
  `dpto` varchar(30) NOT NULL DEFAULT '' COMMENT 'Departamento',
  `prov` varchar(30) NOT NULL DEFAULT '' COMMENT 'Provincia',
  `dist` varchar(50) NOT NULL DEFAULT '' COMMENT 'Distrito'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ubigeo`
--

/*!40000 ALTER TABLE `ubigeo` DISABLE KEYS */;
INSERT INTO `ubigeo` (`codigo`,`dpto`,`prov`,`dist`) VALUES 
 ('010101','AMAZONAS','CHACHAPOYAS','CHACHAPOYAS'),
 ('010102','AMAZONAS','CHACHAPOYAS','ASUNCION'),
 ('010103','AMAZONAS','CHACHAPOYAS','BALSAS'),
 ('010104','AMAZONAS','CHACHAPOYAS','CHETO'),
 ('010105','AMAZONAS','CHACHAPOYAS','CHILIQUIN'),
 ('010106','AMAZONAS','CHACHAPOYAS','CHUQUIBAMBA'),
 ('010107','AMAZONAS','CHACHAPOYAS','GRANADA'),
 ('010108','AMAZONAS','CHACHAPOYAS','HUANCAS'),
 ('010109','AMAZONAS','CHACHAPOYAS','LA JALCA'),
 ('010110','AMAZONAS','CHACHAPOYAS','LEIMEBAMBA'),
 ('010111','AMAZONAS','CHACHAPOYAS','LEVANTO'),
 ('010112','AMAZONAS','CHACHAPOYAS','MAGDALENA'),
 ('010113','AMAZONAS','CHACHAPOYAS','MARISCAL CASTILLA'),
 ('010114','AMAZONAS','CHACHAPOYAS','MOLINOPAMPA'),
 ('010115','AMAZONAS','CHACHAPOYAS','MONTEVIDEO'),
 ('010116','AMAZONAS','CHACHAPOYAS','OLLEROS'),
 ('010117','AMAZONAS','CHACHAPOYAS','QUINJALCA'),
 ('010118','AMAZONAS','CHACHAPOYAS','SAN FRANCISCO DE DAGUAS'),
 ('010119','AMAZONAS','CHACHAPOYAS','SAN ISIDRO DE MAINO'),
 ('010120','AMAZONAS','CHACHAPOYAS','SOLOCO'),
 ('010121','AMAZONAS','CHACHAPOYAS','SONCHE'),
 ('010201','AMAZONAS','BAGUA','BAGUA'),
 ('010202','AMAZONAS','BAGUA','ARAMANGO'),
 ('010203','AMAZONAS','BAGUA','COPALLIN'),
 ('010204','AMAZONAS','BAGUA','EL PARCO'),
 ('010205','AMAZONAS','BAGUA','IMAZA'),
 ('010206','AMAZONAS','BAGUA','LA PECA'),
 ('010302','AMAZONAS','BONGARA','CHISQUILLA'),
 ('010303','AMAZONAS','BONGARA','CHURUJA'),
 ('010304','AMAZONAS','BONGARA','COROSHA'),
 ('010305','AMAZONAS','BONGARA','CUISPES'),
 ('010306','AMAZONAS','BONGARA','FLORIDA'),
 ('010307','AMAZONAS','BONGARA','JAZAN'),
 ('010308','AMAZONAS','BONGARA','RECTA'),
 ('010309','AMAZONAS','BONGARA','SAN CARLOS'),
 ('010310','AMAZONAS','BONGARA','SHIPASBAMBA'),
 ('010311','AMAZONAS','BONGARA','VALERA'),
 ('010312','AMAZONAS','BONGARA','YAMBRASBAMBA'),
 ('010401','AMAZONAS','CONDORCANQUI','NIEVA'),
 ('010402','AMAZONAS','CONDORCANQUI','EL CENEPA'),
 ('010403','AMAZONAS','CONDORCANQUI','RIO SANTIAGO'),
 ('010501','AMAZONAS','LUYA','LAMUD'),
 ('010502','AMAZONAS','LUYA','CAMPORREDONDO'),
 ('010503','AMAZONAS','LUYA','COCABAMBA'),
 ('010504','AMAZONAS','LUYA','COLCAMAR'),
 ('010505','AMAZONAS','LUYA','CONILA'),
 ('010506','AMAZONAS','LUYA','INGUILPATA'),
 ('010507','AMAZONAS','LUYA','LONGUITA'),
 ('010508','AMAZONAS','LUYA','LONYA CHICO'),
 ('010509','AMAZONAS','LUYA','LUYA'),
 ('010510','AMAZONAS','LUYA','LUYA VIEJO'),
 ('010511','AMAZONAS','LUYA','MARIA'),
 ('010512','AMAZONAS','LUYA','OCALLI'),
 ('010513','AMAZONAS','LUYA','OCUMAL'),
 ('010514','AMAZONAS','LUYA','PISUQUIA'),
 ('010515','AMAZONAS','LUYA','PROVIDENCIA'),
 ('010516','AMAZONAS','LUYA','SAN CRISTOBAL'),
 ('010517','AMAZONAS','LUYA','SAN FRANCISCO DE YESO'),
 ('010518','AMAZONAS','LUYA','SAN JERONIMO'),
 ('010519','AMAZONAS','LUYA','SAN JUAN DE LOPECANCHA'),
 ('010520','AMAZONAS','LUYA','SANTA CATALINA'),
 ('010521','AMAZONAS','LUYA','SANTO TOMAS'),
 ('010522','AMAZONAS','LUYA','TINGO'),
 ('010523','AMAZONAS','LUYA','TRITA'),
 ('010601','AMAZONAS','RODRIGUEZ DE MENDOZA','SAN NICOLAS'),
 ('010602','AMAZONAS','RODRIGUEZ DE MENDOZA','CHIRIMOTO'),
 ('010603','AMAZONAS','RODRIGUEZ DE MENDOZA','COCHAMAL'),
 ('010604','AMAZONAS','RODRIGUEZ DE MENDOZA','HUAMBO'),
 ('010605','AMAZONAS','RODRIGUEZ DE MENDOZA','LIMABAMBA'),
 ('010606','AMAZONAS','RODRIGUEZ DE MENDOZA','LONGAR'),
 ('010607','AMAZONAS','RODRIGUEZ DE MENDOZA','MARISCAL BENAVIDES'),
 ('010608','AMAZONAS','RODRIGUEZ DE MENDOZA','MILPUC'),
 ('010609','AMAZONAS','RODRIGUEZ DE MENDOZA','OMIA'),
 ('010610','AMAZONAS','RODRIGUEZ DE MENDOZA','SANTA ROSA'),
 ('010611','AMAZONAS','RODRIGUEZ DE MENDOZA','TOTORA'),
 ('010612','AMAZONAS','RODRIGUEZ DE MENDOZA','VISTA ALEGRE'),
 ('010701','AMAZONAS','UTCUBAMBA','BAGUA GRANDE'),
 ('010702','AMAZONAS','UTCUBAMBA','CAJARURO'),
 ('010703','AMAZONAS','UTCUBAMBA','CUMBA'),
 ('010704','AMAZONAS','UTCUBAMBA','EL MILAGRO'),
 ('010705','AMAZONAS','UTCUBAMBA','JAMALCA'),
 ('010706','AMAZONAS','UTCUBAMBA','LONYA GRANDE'),
 ('010707','AMAZONAS','UTCUBAMBA','YAMON'),
 ('020101','ANCASH','HUARAZ','HUARAZ'),
 ('020102','ANCASH','HUARAZ','COCHABAMBA'),
 ('020103','ANCASH','HUARAZ','COLCABAMBA'),
 ('020104','ANCASH','HUARAZ','HUANCHAY'),
 ('020105','ANCASH','HUARAZ','INDEPENDENCIA'),
 ('020106','ANCASH','HUARAZ','JANGAS'),
 ('020107','ANCASH','HUARAZ','LA LIBERTAD'),
 ('020108','ANCASH','HUARAZ','OLLEROS'),
 ('020109','ANCASH','HUARAZ','PAMPAS GRANDE'),
 ('020110','ANCASH','HUARAZ','PARIACOTO'),
 ('020111','ANCASH','HUARAZ','PIRA'),
 ('020112','ANCASH','HUARAZ','TARICA'),
 ('020201','ANCASH','AIJA','AIJA'),
 ('020202','ANCASH','AIJA','CORIS'),
 ('020203','ANCASH','AIJA','HUACLLAN'),
 ('020204','ANCASH','AIJA','LA MERCED'),
 ('020205','ANCASH','AIJA','SUCCHA'),
 ('020301','ANCASH','ANTONIO RAYMONDI','LLAMELLIN'),
 ('020302','ANCASH','ANTONIO RAYMONDI','ACZO'),
 ('020303','ANCASH','ANTONIO RAYMONDI','CHACCHO'),
 ('020304','ANCASH','ANTONIO RAYMONDI','CHINGAS'),
 ('020305','ANCASH','ANTONIO RAYMONDI','MIRGAS'),
 ('020306','ANCASH','ANTONIO RAYMONDI','SAN JUAN DE RONTOY'),
 ('020401','ANCASH','ASUNCION','CHACAS'),
 ('020402','ANCASH','ASUNCION','ACOCHACA'),
 ('020501','ANCASH','BOLOGNESI','CHIQUIAN'),
 ('020502','ANCASH','BOLOGNESI','ABELARDO PARDO LEZAMETA'),
 ('020503','ANCASH','BOLOGNESI','ANTONIO RAYMONDI'),
 ('020504','ANCASH','BOLOGNESI','AQUIA'),
 ('020505','ANCASH','BOLOGNESI','CAJACAY'),
 ('020506','ANCASH','BOLOGNESI','CANIS'),
 ('020507','ANCASH','BOLOGNESI','COLQUIOC'),
 ('020508','ANCASH','BOLOGNESI','HUALLANCA'),
 ('020509','ANCASH','BOLOGNESI','HUASTA'),
 ('020510','ANCASH','BOLOGNESI','HUAYLLACAYAN'),
 ('020511','ANCASH','BOLOGNESI','LA PRIMAVERA'),
 ('020512','ANCASH','BOLOGNESI','MANGAS'),
 ('020513','ANCASH','BOLOGNESI','PACLLON'),
 ('020514','ANCASH','BOLOGNESI','SAN MIGUEL DE CORPANQUI'),
 ('020515','ANCASH','BOLOGNESI','TICLLOS'),
 ('020601','ANCASH','CARHUAZ','CARHUAZ'),
 ('020602','ANCASH','CARHUAZ','ACOPAMPA'),
 ('020603','ANCASH','CARHUAZ','AMASHCA'),
 ('020604','ANCASH','CARHUAZ','ANTA'),
 ('020605','ANCASH','CARHUAZ','ATAQUERO'),
 ('020606','ANCASH','CARHUAZ','MARCARA'),
 ('020607','ANCASH','CARHUAZ','PARIAHUANCA'),
 ('020608','ANCASH','CARHUAZ','SAN MIGUEL DE ACO'),
 ('020609','ANCASH','CARHUAZ','SHILLA'),
 ('020610','ANCASH','CARHUAZ','TINCO'),
 ('020611','ANCASH','CARHUAZ','YUNGAR'),
 ('020701','ANCASH','CARLOS FERMIN FITZCARRALD','SAN LUIS'),
 ('020702','ANCASH','CARLOS FERMIN FITZCARRALD','SAN NICOLAS'),
 ('020703','ANCASH','CARLOS FERMIN FITZCARRALD','YAUYA'),
 ('020801','ANCASH','CASMA','CASMA'),
 ('020802','ANCASH','CASMA','BUENA VISTA ALTA'),
 ('020803','ANCASH','CASMA','COMANDANTE NOEL'),
 ('020804','ANCASH','CASMA','YAUTAN'),
 ('020901','ANCASH','CORONGO','CORONGO'),
 ('020902','ANCASH','CORONGO','ACO'),
 ('020903','ANCASH','CORONGO','BAMBAS'),
 ('020904','ANCASH','CORONGO','CUSCA'),
 ('020905','ANCASH','CORONGO','LA PAMPA'),
 ('020906','ANCASH','CORONGO','YANAC'),
 ('020907','ANCASH','CORONGO','YUPAN'),
 ('021001','ANCASH','HUARI','HUARI'),
 ('021002','ANCASH','HUARI','ANRA'),
 ('021003','ANCASH','HUARI','CAJAY'),
 ('021004','ANCASH','HUARI','CHAVIN DE HUANTAR'),
 ('021005','ANCASH','HUARI','HUACACHI'),
 ('021006','ANCASH','HUARI','HUACCHIS'),
 ('021007','ANCASH','HUARI','HUACHIS'),
 ('021008','ANCASH','HUARI','HUANTAR'),
 ('021009','ANCASH','HUARI','MASIN'),
 ('021010','ANCASH','HUARI','PAUCAS'),
 ('021011','ANCASH','HUARI','PONTO'),
 ('021012','ANCASH','HUARI','RAHUAPAMPA'),
 ('021013','ANCASH','HUARI','RAPAYAN'),
 ('021014','ANCASH','HUARI','SAN MARCOS'),
 ('021015','ANCASH','HUARI','SAN PEDRO DE CHANA'),
 ('021016','ANCASH','HUARI','UCO'),
 ('021101','ANCASH','HUARMEY','HUARMEY'),
 ('021102','ANCASH','HUARMEY','COCHAPETI'),
 ('021103','ANCASH','HUARMEY','CULEBRAS'),
 ('021104','ANCASH','HUARMEY','HUAYAN'),
 ('021105','ANCASH','HUARMEY','MALVAS'),
 ('021201','ANCASH','HUAYLAS','CARAZ'),
 ('021202','ANCASH','HUAYLAS','HUALLANCA'),
 ('021203','ANCASH','HUAYLAS','HUATA'),
 ('021204','ANCASH','HUAYLAS','HUAYLAS'),
 ('021205','ANCASH','HUAYLAS','MATO'),
 ('021206','ANCASH','HUAYLAS','PAMPAROMAS'),
 ('021207','ANCASH','HUAYLAS','PUEBLO LIBRE'),
 ('021208','ANCASH','HUAYLAS','SANTA CRUZ'),
 ('021209','ANCASH','HUAYLAS','SANTO TORIBIO'),
 ('021210','ANCASH','HUAYLAS','YURACMARCA'),
 ('021301','ANCASH','MARISCAL LUZURIAGA','PISCOBAMBA'),
 ('021302','ANCASH','MARISCAL LUZURIAGA','CASCA'),
 ('021303','ANCASH','MARISCAL LUZURIAGA','ELEAZAR GUZMAN BARRON'),
 ('021304','ANCASH','MARISCAL LUZURIAGA','FIDEL OLIVAS ESCUDERO'),
 ('021305','ANCASH','MARISCAL LUZURIAGA','LLAMA'),
 ('021306','ANCASH','MARISCAL LUZURIAGA','LLUMPA'),
 ('021307','ANCASH','MARISCAL LUZURIAGA','LUCMA'),
 ('021308','ANCASH','MARISCAL LUZURIAGA','MUSGA'),
 ('021401','ANCASH','OCROS','OCROS'),
 ('021402','ANCASH','OCROS','ACAS'),
 ('021403','ANCASH','OCROS','CAJAMARQUILLA'),
 ('021404','ANCASH','OCROS','CARHUAPAMPA'),
 ('021405','ANCASH','OCROS','COCHAS'),
 ('021406','ANCASH','OCROS','CONGAS'),
 ('021407','ANCASH','OCROS','LLIPA'),
 ('021408','ANCASH','OCROS','SAN CRISTOBAL DE RAJAN'),
 ('021409','ANCASH','OCROS','SAN PEDRO'),
 ('021410','ANCASH','OCROS','SANTIAGO DE CHILCAS'),
 ('021501','ANCASH','PALLASCA','CABANA'),
 ('021502','ANCASH','PALLASCA','BOLOGNESI'),
 ('021503','ANCASH','PALLASCA','CONCHUCOS'),
 ('021504','ANCASH','PALLASCA','HUACASCHUQUE'),
 ('021505','ANCASH','PALLASCA','HUANDOVAL'),
 ('021506','ANCASH','PALLASCA','LACABAMBA'),
 ('021507','ANCASH','PALLASCA','LLAPO'),
 ('021508','ANCASH','PALLASCA','PALLASCA'),
 ('021509','ANCASH','PALLASCA','PAMPAS'),
 ('021510','ANCASH','PALLASCA','SANTA ROSA'),
 ('021511','ANCASH','PALLASCA','TAUCA'),
 ('021601','ANCASH','POMABAMBA','POMABAMBA'),
 ('021602','ANCASH','POMABAMBA','HUAYLLAN'),
 ('021603','ANCASH','POMABAMBA','PAROBAMBA'),
 ('021604','ANCASH','POMABAMBA','QUINUABAMBA'),
 ('021701','ANCASH','RECUAY','RECUAY'),
 ('021702','ANCASH','RECUAY','CATAC'),
 ('021703','ANCASH','RECUAY','COTAPARACO'),
 ('021704','ANCASH','RECUAY','HUAYLLAPAMPA'),
 ('021705','ANCASH','RECUAY','LLACLLIN'),
 ('021706','ANCASH','RECUAY','MARCA'),
 ('021707','ANCASH','RECUAY','PAMPAS CHICO'),
 ('021708','ANCASH','RECUAY','PARARIN'),
 ('021709','ANCASH','RECUAY','TAPACOCHA'),
 ('021710','ANCASH','RECUAY','TICAPAMPA'),
 ('021801','ANCASH','SANTA','CHIMBOTE'),
 ('021802','ANCASH','SANTA','CACERES DEL PERU'),
 ('021803','ANCASH','SANTA','COISHCO'),
 ('021804','ANCASH','SANTA','MACATE'),
 ('021805','ANCASH','SANTA','MORO'),
 ('021806','ANCASH','SANTA','NEPENA'),
 ('021807','ANCASH','SANTA','SAMANCO'),
 ('021808','ANCASH','SANTA','SANTA'),
 ('021809','ANCASH','SANTA','NUEVO CHIMBOTE'),
 ('021901','ANCASH','SIHUAS','SIHUAS'),
 ('021902','ANCASH','SIHUAS','ACOBAMBA'),
 ('021903','ANCASH','SIHUAS','ALFONSO UGARTE'),
 ('021904','ANCASH','SIHUAS','CASHAPAMPA'),
 ('021905','ANCASH','SIHUAS','CHINGALPO'),
 ('021906','ANCASH','SIHUAS','HUAYLLABAMBA'),
 ('021907','ANCASH','SIHUAS','QUICHES'),
 ('021908','ANCASH','SIHUAS','RAGASH'),
 ('021909','ANCASH','SIHUAS','SAN JUAN'),
 ('021910','ANCASH','SIHUAS','SICSIBAMBA'),
 ('022001','ANCASH','YUNGAY','YUNGAY'),
 ('022002','ANCASH','YUNGAY','CASCAPARA'),
 ('022003','ANCASH','YUNGAY','MANCOS'),
 ('022004','ANCASH','YUNGAY','MATACOTO'),
 ('022005','ANCASH','YUNGAY','QUILLO'),
 ('022006','ANCASH','YUNGAY','RANRAHIRCA'),
 ('022007','ANCASH','YUNGAY','SHUPLUY'),
 ('022008','ANCASH','YUNGAY','YANAMA'),
 ('030101','APURIMAC','ABANCAY','ABANCAY'),
 ('030102','APURIMAC','ABANCAY','CHACOCHE'),
 ('030103','APURIMAC','ABANCAY','CIRCA'),
 ('030104','APURIMAC','ABANCAY','CURAHUASI'),
 ('030105','APURIMAC','ABANCAY','HUANIPACA'),
 ('030106','APURIMAC','ABANCAY','LAMBRAMA'),
 ('030107','APURIMAC','ABANCAY','PICHIRHUA'),
 ('030108','APURIMAC','ABANCAY','SAN PEDRO DE CACHORA'),
 ('030109','APURIMAC','ABANCAY','TAMBURCO'),
 ('030201','APURIMAC','ANDAHUAYLAS','ANDAHUAYLAS'),
 ('030202','APURIMAC','ANDAHUAYLAS','ANDARAPA'),
 ('030203','APURIMAC','ANDAHUAYLAS','CHIARA'),
 ('030204','APURIMAC','ANDAHUAYLAS','HUANCARAMA'),
 ('030205','APURIMAC','ANDAHUAYLAS','HUANCARAY'),
 ('030206','APURIMAC','ANDAHUAYLAS','HUAYANA'),
 ('030207','APURIMAC','ANDAHUAYLAS','KISHUARA'),
 ('030208','APURIMAC','ANDAHUAYLAS','PACOBAMBA'),
 ('030209','APURIMAC','ANDAHUAYLAS','PACUCHA'),
 ('030210','APURIMAC','ANDAHUAYLAS','PAMPACHIRI'),
 ('030211','APURIMAC','ANDAHUAYLAS','POMACOCHA'),
 ('030212','APURIMAC','ANDAHUAYLAS','SAN ANTONIO DE CACHI'),
 ('030213','APURIMAC','ANDAHUAYLAS','SAN JERONIMO'),
 ('030214','APURIMAC','ANDAHUAYLAS','SAN MIGUEL DE CHACCRAMPA'),
 ('030215','APURIMAC','ANDAHUAYLAS','SANTA MARIA DE CHICMO'),
 ('030216','APURIMAC','ANDAHUAYLAS','TALAVERA'),
 ('030217','APURIMAC','ANDAHUAYLAS','TUMAY HUARACA'),
 ('030218','APURIMAC','ANDAHUAYLAS','TURPO'),
 ('030219','APURIMAC','ANDAHUAYLAS','KAQUIABAMBA'),
 ('030220','APURIMAC','ANDAHUAYLAS','JOSE MARIA ARGUEDAS'),
 ('030301','APURIMAC','ANTABAMBA','ANTABAMBA'),
 ('030302','APURIMAC','ANTABAMBA','EL ORO'),
 ('030303','APURIMAC','ANTABAMBA','HUAQUIRCA'),
 ('030304','APURIMAC','ANTABAMBA','JUAN ESPINOZA MEDRANO'),
 ('030305','APURIMAC','ANTABAMBA','OROPESA'),
 ('030306','APURIMAC','ANTABAMBA','PACHACONAS'),
 ('030307','APURIMAC','ANTABAMBA','SABAINO'),
 ('030401','APURIMAC','AYMARAES','CHALHUANCA'),
 ('030402','APURIMAC','AYMARAES','CAPAYA'),
 ('030403','APURIMAC','AYMARAES','CARAYBAMBA'),
 ('030404','APURIMAC','AYMARAES','CHAPIMARCA'),
 ('030405','APURIMAC','AYMARAES','COLCABAMBA'),
 ('030406','APURIMAC','AYMARAES','COTARUSE'),
 ('030407','APURIMAC','AYMARAES','IHUAYLLO'),
 ('030408','APURIMAC','AYMARAES','JUSTO APU SAHUARAURA'),
 ('030409','APURIMAC','AYMARAES','LUCRE'),
 ('030410','APURIMAC','AYMARAES','POCOHUANCA'),
 ('030411','APURIMAC','AYMARAES','SAN JUAN DE CHACNA'),
 ('030412','APURIMAC','AYMARAES','SANAYCA'),
 ('030413','APURIMAC','AYMARAES','SORAYA'),
 ('030414','APURIMAC','AYMARAES','TAPAIRIHUA'),
 ('030415','APURIMAC','AYMARAES','TINTAY'),
 ('030416','APURIMAC','AYMARAES','TORAYA'),
 ('030417','APURIMAC','AYMARAES','YANACA'),
 ('030501','APURIMAC','COTABAMBAS','TAMBOBAMBA'),
 ('030502','APURIMAC','COTABAMBAS','COTABAMBAS'),
 ('030503','APURIMAC','COTABAMBAS','COYLLURQUI'),
 ('030504','APURIMAC','COTABAMBAS','HAQUIRA'),
 ('030505','APURIMAC','COTABAMBAS','MARA'),
 ('030506','APURIMAC','COTABAMBAS','CHALLHUAHUACHO'),
 ('030601','APURIMAC','CHINCHEROS','CHINCHEROS'),
 ('030602','APURIMAC','CHINCHEROS','ANCO_HUALLO'),
 ('030603','APURIMAC','CHINCHEROS','COCHARCAS'),
 ('030604','APURIMAC','CHINCHEROS','HUACCANA'),
 ('030605','APURIMAC','CHINCHEROS','OCOBAMBA'),
 ('030606','APURIMAC','CHINCHEROS','ONGOY'),
 ('030607','APURIMAC','CHINCHEROS','URANMARCA'),
 ('030608','APURIMAC','CHINCHEROS','RANRACANCHA'),
 ('030609','APURIMAC','CHINCHEROS','ROCCHACC'),
 ('030610','APURIMAC','CHINCHEROS','EL PORVENIR'),
 ('030611','APURIMAC','CHINCHEROS','LOS CHANKAS'),
 ('030612','APURIMAC','CHINCHEROS','AHUAYRO'),
 ('030701','APURIMAC','GRAU','CHUQUIBAMBILLA'),
 ('030702','APURIMAC','GRAU','CURPAHUASI'),
 ('030703','APURIMAC','GRAU','GAMARRA'),
 ('030704','APURIMAC','GRAU','HUAYLLATI'),
 ('030705','APURIMAC','GRAU','MAMARA'),
 ('030706','APURIMAC','GRAU','MICAELA BASTIDAS'),
 ('030707','APURIMAC','GRAU','PATAYPAMPA'),
 ('030708','APURIMAC','GRAU','PROGRESO'),
 ('030709','APURIMAC','GRAU','SAN ANTONIO'),
 ('030710','APURIMAC','GRAU','SANTA ROSA'),
 ('030711','APURIMAC','GRAU','TURPAY'),
 ('030712','APURIMAC','GRAU','VILCABAMBA'),
 ('030713','APURIMAC','GRAU','VIRUNDO'),
 ('030714','APURIMAC','GRAU','CURASCO'),
 ('040101','AREQUIPA','AREQUIPA','AREQUIPA'),
 ('040102','AREQUIPA','AREQUIPA','ALTO SELVA ALEGRE'),
 ('040103','AREQUIPA','AREQUIPA','CAYMA'),
 ('040104','AREQUIPA','AREQUIPA','CERRO COLORADO'),
 ('040105','AREQUIPA','AREQUIPA','CHARACATO'),
 ('040106','AREQUIPA','AREQUIPA','CHIGUATA'),
 ('040107','AREQUIPA','AREQUIPA','JACOBO HUNTER'),
 ('040108','AREQUIPA','AREQUIPA','LA JOYA'),
 ('040109','AREQUIPA','AREQUIPA','MARIANO MELGAR'),
 ('040110','AREQUIPA','AREQUIPA','MIRAFLORES'),
 ('040111','AREQUIPA','AREQUIPA','MOLLEBAYA'),
 ('040112','AREQUIPA','AREQUIPA','PAUCARPATA'),
 ('040113','AREQUIPA','AREQUIPA','POCSI'),
 ('040114','AREQUIPA','AREQUIPA','POLOBAYA'),
 ('040115','AREQUIPA','AREQUIPA','QUEQUENA'),
 ('040116','AREQUIPA','AREQUIPA','SABANDIA'),
 ('040117','AREQUIPA','AREQUIPA','SACHACA'),
 ('040118','AREQUIPA','AREQUIPA','SAN JUAN DE SIGUAS'),
 ('040119','AREQUIPA','AREQUIPA','SAN JUAN DE TARUCANI'),
 ('040120','AREQUIPA','AREQUIPA','SANTA ISABEL DE SIGUAS'),
 ('040121','AREQUIPA','AREQUIPA','SANTA RITA DE SIGUAS'),
 ('040122','AREQUIPA','AREQUIPA','SOCABAYA'),
 ('040123','AREQUIPA','AREQUIPA','TIABAYA'),
 ('040124','AREQUIPA','AREQUIPA','UCHUMAYO'),
 ('040125','AREQUIPA','AREQUIPA','VITOR'),
 ('040126','AREQUIPA','AREQUIPA','YANAHUARA'),
 ('040127','AREQUIPA','AREQUIPA','YARABAMBA'),
 ('040128','AREQUIPA','AREQUIPA','YURA'),
 ('040129','AREQUIPA','AREQUIPA','JOSE LUIS BUSTAMANTE Y RIVERO'),
 ('040201','AREQUIPA','CAMANA','CAMANA'),
 ('040202','AREQUIPA','CAMANA','JOSE MARIA QUIMPER'),
 ('040203','AREQUIPA','CAMANA','MARIANO NICOLAS VALCARCEL'),
 ('040204','AREQUIPA','CAMANA','MARISCAL CACERES'),
 ('040205','AREQUIPA','CAMANA','NICOLAS DE PIEROLA'),
 ('040206','AREQUIPA','CAMANA','OCONA'),
 ('040207','AREQUIPA','CAMANA','QUILCA'),
 ('040208','AREQUIPA','CAMANA','SAMUEL PASTOR'),
 ('040301','AREQUIPA','CARAVELI','CARAVELI'),
 ('040302','AREQUIPA','CARAVELI','ACARI'),
 ('040303','AREQUIPA','CARAVELI','ATICO'),
 ('040304','AREQUIPA','CARAVELI','ATIQUIPA'),
 ('040305','AREQUIPA','CARAVELI','BELLA UNION'),
 ('040306','AREQUIPA','CARAVELI','CAHUACHO'),
 ('040307','AREQUIPA','CARAVELI','CHALA'),
 ('040308','AREQUIPA','CARAVELI','CHAPARRA'),
 ('040309','AREQUIPA','CARAVELI','HUANUHUANU'),
 ('040310','AREQUIPA','CARAVELI','JAQUI'),
 ('040311','AREQUIPA','CARAVELI','LOMAS'),
 ('040312','AREQUIPA','CARAVELI','QUICACHA'),
 ('040313','AREQUIPA','CARAVELI','YAUCA'),
 ('040401','AREQUIPA','CASTILLA','APLAO'),
 ('040402','AREQUIPA','CASTILLA','ANDAGUA'),
 ('040403','AREQUIPA','CASTILLA','AYO'),
 ('040404','AREQUIPA','CASTILLA','CHACHAS'),
 ('040405','AREQUIPA','CASTILLA','CHILCAYMARCA'),
 ('040406','AREQUIPA','CASTILLA','CHOCO'),
 ('040407','AREQUIPA','CASTILLA','HUANCARQUI'),
 ('040408','AREQUIPA','CASTILLA','MACHAGUAY'),
 ('040409','AREQUIPA','CASTILLA','ORCOPAMPA'),
 ('040410','AREQUIPA','CASTILLA','PAMPACOLCA'),
 ('040411','AREQUIPA','CASTILLA','TIPAN'),
 ('040412','AREQUIPA','CASTILLA','UNON'),
 ('040413','AREQUIPA','CASTILLA','URACA'),
 ('040414','AREQUIPA','CASTILLA','VIRACO'),
 ('040501','AREQUIPA','CAYLLOMA','CHIVAY'),
 ('040502','AREQUIPA','CAYLLOMA','ACHOMA'),
 ('040503','AREQUIPA','CAYLLOMA','CABANACONDE'),
 ('040504','AREQUIPA','CAYLLOMA','CALLALLI'),
 ('040505','AREQUIPA','CAYLLOMA','CAYLLOMA'),
 ('040506','AREQUIPA','CAYLLOMA','COPORAQUE'),
 ('040507','AREQUIPA','CAYLLOMA','HUAMBO'),
 ('040508','AREQUIPA','CAYLLOMA','HUANCA'),
 ('040509','AREQUIPA','CAYLLOMA','ICHUPAMPA'),
 ('040510','AREQUIPA','CAYLLOMA','LARI'),
 ('040511','AREQUIPA','CAYLLOMA','LLUTA'),
 ('040512','AREQUIPA','CAYLLOMA','MACA'),
 ('040513','AREQUIPA','CAYLLOMA','MADRIGAL'),
 ('040514','AREQUIPA','CAYLLOMA','SAN ANTONIO DE CHUCA'),
 ('040515','AREQUIPA','CAYLLOMA','SIBAYO'),
 ('040516','AREQUIPA','CAYLLOMA','TAPAY'),
 ('040517','AREQUIPA','CAYLLOMA','TISCO'),
 ('040518','AREQUIPA','CAYLLOMA','TUTI'),
 ('040519','AREQUIPA','CAYLLOMA','YANQUE'),
 ('040520','AREQUIPA','CAYLLOMA','MAJES'),
 ('040601','AREQUIPA','CONDESUYOS','CHUQUIBAMBA'),
 ('040602','AREQUIPA','CONDESUYOS','ANDARAY'),
 ('040603','AREQUIPA','CONDESUYOS','CAYARANI'),
 ('040604','AREQUIPA','CONDESUYOS','CHICHAS'),
 ('040605','AREQUIPA','CONDESUYOS','IRAY'),
 ('040606','AREQUIPA','CONDESUYOS','RIO GRANDE'),
 ('040607','AREQUIPA','CONDESUYOS','SALAMANCA'),
 ('040608','AREQUIPA','CONDESUYOS','YANAQUIHUA'),
 ('040701','AREQUIPA','ISLAY','MOLLENDO'),
 ('040702','AREQUIPA','ISLAY','COCACHACRA'),
 ('040703','AREQUIPA','ISLAY','DEAN VALDIVIA'),
 ('040704','AREQUIPA','ISLAY','ISLAY'),
 ('040705','AREQUIPA','ISLAY','MEJIA'),
 ('040706','AREQUIPA','ISLAY','PUNTA DE BOMBON'),
 ('040801','AREQUIPA','LA UNI`ON','COTAHUASI'),
 ('040802','AREQUIPA','LA UNI`ON','ALCA'),
 ('040803','AREQUIPA','LA UNI`ON','CHARCANA'),
 ('040804','AREQUIPA','LA UNI`ON','HUAYNACOTAS');
INSERT INTO `ubigeo` (`codigo`,`dpto`,`prov`,`dist`) VALUES 
 ('040805','AREQUIPA','LA UNI`ON','PAMPAMARCA'),
 ('040806','AREQUIPA','LA UNI`ON','PUYCA'),
 ('040807','AREQUIPA','LA UNI`ON','QUECHUALLA'),
 ('040808','AREQUIPA','LA UNI`ON','SAYLA'),
 ('040809','AREQUIPA','LA UNI`ON','TAURIA'),
 ('040810','AREQUIPA','LA UNI`ON','TOMEPAMPA'),
 ('040811','AREQUIPA','LA UNI`ON','TORO'),
 ('050101','AYACUCHO','HUAMANGA','AYACUCHO'),
 ('050102','AYACUCHO','HUAMANGA','ACOCRO'),
 ('050103','AYACUCHO','HUAMANGA','ACOS VINCHOS'),
 ('050104','AYACUCHO','HUAMANGA','CARMEN ALTO'),
 ('050105','AYACUCHO','HUAMANGA','CHIARA'),
 ('050106','AYACUCHO','HUAMANGA','OCROS'),
 ('050107','AYACUCHO','HUAMANGA','PACAYCASA'),
 ('050108','AYACUCHO','HUAMANGA','QUINUA'),
 ('050109','AYACUCHO','HUAMANGA','SAN JOSE DE TICLLAS'),
 ('050110','AYACUCHO','HUAMANGA','SAN JUAN BAUTISTA'),
 ('050111','AYACUCHO','HUAMANGA','SANTIAGO DE PISCHA'),
 ('050112','AYACUCHO','HUAMANGA','SOCOS'),
 ('050113','AYACUCHO','HUAMANGA','TAMBILLO'),
 ('050114','AYACUCHO','HUAMANGA','VINCHOS'),
 ('050115','AYACUCHO','HUAMANGA','JESUS NAZARENO'),
 ('050116','AYACUCHO','HUAMANGA','ANDRES AVELINO CACERES DORREGARAY'),
 ('050201','AYACUCHO','CANGALLO','CANGALLO'),
 ('050202','AYACUCHO','CANGALLO','CHUSCHI'),
 ('050203','AYACUCHO','CANGALLO','LOS MOROCHUCOS'),
 ('050204','AYACUCHO','CANGALLO','MARIA PARADO DE BELLIDO'),
 ('050205','AYACUCHO','CANGALLO','PARAS'),
 ('050206','AYACUCHO','CANGALLO','TOTOS'),
 ('050301','AYACUCHO','HUANCA SANCOS','SANCOS'),
 ('050302','AYACUCHO','HUANCA SANCOS','CARAPO'),
 ('050303','AYACUCHO','HUANCA SANCOS','SACSAMARCA'),
 ('050304','AYACUCHO','HUANCA SANCOS','SANTIAGO DE LUCANAMARCA'),
 ('050401','AYACUCHO','HUANTA','HUANTA'),
 ('050402','AYACUCHO','HUANTA','AYAHUANCO'),
 ('050403','AYACUCHO','HUANTA','HUAMANGUILLA'),
 ('050404','AYACUCHO','HUANTA','IGUAIN'),
 ('050405','AYACUCHO','HUANTA','LURICOCHA'),
 ('050406','AYACUCHO','HUANTA','SANTILLANA'),
 ('050407','AYACUCHO','HUANTA','SIVIA'),
 ('050408','AYACUCHO','HUANTA','LLOCHEGUA'),
 ('050409','AYACUCHO','HUANTA','CANAYRE'),
 ('050410','AYACUCHO','HUANTA','UCHURACCAY'),
 ('050411','AYACUCHO','HUANTA','PUCACOLPA'),
 ('050412','AYACUCHO','HUANTA','CHACA'),
 ('050413','AYACUCHO','HUANTA','PUTIS'),
 ('050501','AYACUCHO','LA MAR','SAN MIGUEL'),
 ('050502','AYACUCHO','LA MAR','ANCO'),
 ('050503','AYACUCHO','LA MAR','AYNA'),
 ('050504','AYACUCHO','LA MAR','CHILCAS'),
 ('050505','AYACUCHO','LA MAR','CHUNGUI'),
 ('050506','AYACUCHO','LA MAR','LUIS CARRANZA'),
 ('050507','AYACUCHO','LA MAR','SANTA ROSA'),
 ('050508','AYACUCHO','LA MAR','TAMBO'),
 ('050509','AYACUCHO','LA MAR','SAMUGARI'),
 ('050510','AYACUCHO','LA MAR','ANCHIHUAY'),
 ('050511','AYACUCHO','LA MAR','ORONCCOY'),
 ('050512','AYACUCHO','LA MAR','UNION PROGRESO'),
 ('050513','AYACUCHO','LA MAR','RIO MAGDALENA'),
 ('050514','AYACUCHO','LA MAR','NINABAMBA'),
 ('050515','AYACUCHO','LA MAR','PATIBAMBA'),
 ('050601','AYACUCHO','LUCANAS','PUQUIO'),
 ('050602','AYACUCHO','LUCANAS','AUCARA'),
 ('050603','AYACUCHO','LUCANAS','CABANA'),
 ('050604','AYACUCHO','LUCANAS','CARMEN SALCEDO'),
 ('050605','AYACUCHO','LUCANAS','CHAVINA'),
 ('050606','AYACUCHO','LUCANAS','CHIPAO'),
 ('050607','AYACUCHO','LUCANAS','HUAC-HUAS'),
 ('050608','AYACUCHO','LUCANAS','LARAMATE'),
 ('050609','AYACUCHO','LUCANAS','LEONCIO PRADO'),
 ('050610','AYACUCHO','LUCANAS','LLAUTA'),
 ('050611','AYACUCHO','LUCANAS','LUCANAS'),
 ('050612','AYACUCHO','LUCANAS','OCANA'),
 ('050613','AYACUCHO','LUCANAS','OTOCA'),
 ('050614','AYACUCHO','LUCANAS','SAISA'),
 ('050615','AYACUCHO','LUCANAS','SAN CRISTOBAL'),
 ('050616','AYACUCHO','LUCANAS','SAN JUAN'),
 ('050617','AYACUCHO','LUCANAS','SAN PEDRO'),
 ('050618','AYACUCHO','LUCANAS','SAN PEDRO DE PALCO'),
 ('050619','AYACUCHO','LUCANAS','SANCOS'),
 ('050620','AYACUCHO','LUCANAS','SANTA ANA DE HUAYCAHUACHO'),
 ('050621','AYACUCHO','LUCANAS','SANTA LUCIA'),
 ('050701','AYACUCHO','PARINACOCHAS','CORACORA'),
 ('050702','AYACUCHO','PARINACOCHAS','CHUMPI'),
 ('050703','AYACUCHO','PARINACOCHAS','CORONEL CASTANEDA'),
 ('050704','AYACUCHO','PARINACOCHAS','PACAPAUSA'),
 ('050705','AYACUCHO','PARINACOCHAS','PULLO'),
 ('050706','AYACUCHO','PARINACOCHAS','PUYUSCA'),
 ('050707','AYACUCHO','PARINACOCHAS','SAN FRANCISCO DE RAVACAYCO'),
 ('050708','AYACUCHO','PARINACOCHAS','UPAHUACHO'),
 ('050801','AYACUCHO','P`AUCAR DEL SARA SARA','PAUSA'),
 ('050802','AYACUCHO','P`AUCAR DEL SARA SARA','COLTA'),
 ('050803','AYACUCHO','P`AUCAR DEL SARA SARA','CORCULLA'),
 ('050804','AYACUCHO','P`AUCAR DEL SARA SARA','LAMPA'),
 ('050805','AYACUCHO','P`AUCAR DEL SARA SARA','MARCABAMBA'),
 ('050806','AYACUCHO','P`AUCAR DEL SARA SARA','OYOLO'),
 ('050807','AYACUCHO','P`AUCAR DEL SARA SARA','PARARCA'),
 ('050808','AYACUCHO','P`AUCAR DEL SARA SARA','SAN JAVIER DE ALPABAMBA'),
 ('050809','AYACUCHO','P`AUCAR DEL SARA SARA','SAN JOSE DE USHUA'),
 ('050810','AYACUCHO','P`AUCAR DEL SARA SARA','SARA SARA'),
 ('050901','AYACUCHO','SUCRE','QUEROBAMBA'),
 ('050902','AYACUCHO','SUCRE','BELEN'),
 ('050903','AYACUCHO','SUCRE','CHALCOS'),
 ('050904','AYACUCHO','SUCRE','CHILCAYOC'),
 ('050905','AYACUCHO','SUCRE','HUACANA'),
 ('050906','AYACUCHO','SUCRE','MORCOLLA'),
 ('050907','AYACUCHO','SUCRE','PAICO'),
 ('050908','AYACUCHO','SUCRE','SAN PEDRO DE LARCAY'),
 ('050909','AYACUCHO','SUCRE','SAN SALVADOR DE QUIJE'),
 ('050910','AYACUCHO','SUCRE','SANTIAGO DE PAUCARAY'),
 ('050911','AYACUCHO','SUCRE','SORAS'),
 ('051001','AYACUCHO','VICTOR FAJARDO','HUANCAPI'),
 ('051002','AYACUCHO','VICTOR FAJARDO','ALCAMENCA'),
 ('051003','AYACUCHO','VICTOR FAJARDO','APONGO'),
 ('051004','AYACUCHO','VICTOR FAJARDO','ASQUIPATA'),
 ('051005','AYACUCHO','VICTOR FAJARDO','CANARIA'),
 ('051006','AYACUCHO','VICTOR FAJARDO','CAYARA'),
 ('051007','AYACUCHO','VICTOR FAJARDO','COLCA'),
 ('051008','AYACUCHO','VICTOR FAJARDO','HUAMANQUIQUIA'),
 ('051009','AYACUCHO','VICTOR FAJARDO','HUANCARAYLLA'),
 ('051010','AYACUCHO','VICTOR FAJARDO','HUALLA'),
 ('051011','AYACUCHO','VICTOR FAJARDO','SARHUA'),
 ('051012','AYACUCHO','VICTOR FAJARDO','VILCANCHOS'),
 ('051101','AYACUCHO','VILCAS HUAMAN','VILCAS HUAMAN'),
 ('051102','AYACUCHO','VILCAS HUAMAN','ACCOMARCA'),
 ('051103','AYACUCHO','VILCAS HUAMAN','CARHUANCA'),
 ('051104','AYACUCHO','VILCAS HUAMAN','CONCEPCION'),
 ('051105','AYACUCHO','VILCAS HUAMAN','HUAMBALPA'),
 ('051106','AYACUCHO','VILCAS HUAMAN','INDEPENDENCIA'),
 ('051107','AYACUCHO','VILCAS HUAMAN','SAURAMA'),
 ('051108','AYACUCHO','VILCAS HUAMAN','VISCHONGO'),
 ('060101','CAJAMARCA','CAJAMARCA','CAJAMARCA'),
 ('060102','CAJAMARCA','CAJAMARCA','ASUNCION'),
 ('060103','CAJAMARCA','CAJAMARCA','CHETILLA'),
 ('060104','CAJAMARCA','CAJAMARCA','COSPAN'),
 ('060105','CAJAMARCA','CAJAMARCA','ENCANADA'),
 ('060106','CAJAMARCA','CAJAMARCA','JESUS'),
 ('060107','CAJAMARCA','CAJAMARCA','LLACANORA'),
 ('060108','CAJAMARCA','CAJAMARCA','LOS BANOS DEL INCA'),
 ('060109','CAJAMARCA','CAJAMARCA','MAGDALENA'),
 ('060110','CAJAMARCA','CAJAMARCA','MATARA'),
 ('060111','CAJAMARCA','CAJAMARCA','NAMORA'),
 ('060112','CAJAMARCA','CAJAMARCA','SAN JUAN'),
 ('060201','CAJAMARCA','CAJABAMBA','CAJABAMBA'),
 ('060202','CAJAMARCA','CAJABAMBA','CACHACHI'),
 ('060203','CAJAMARCA','CAJABAMBA','CONDEBAMBA'),
 ('060204','CAJAMARCA','CAJABAMBA','SITACOCHA'),
 ('060301','CAJAMARCA','CELENDIN','CELENDIN'),
 ('060302','CAJAMARCA','CELENDIN','CHUMUCH'),
 ('060303','CAJAMARCA','CELENDIN','CORTEGANA'),
 ('060304','CAJAMARCA','CELENDIN','HUASMIN'),
 ('060305','CAJAMARCA','CELENDIN','JORGE CHAVEZ'),
 ('060306','CAJAMARCA','CELENDIN','JOSE GALVEZ'),
 ('060307','CAJAMARCA','CELENDIN','MIGUEL IGLESIAS'),
 ('060308','CAJAMARCA','CELENDIN','OXAMARCA'),
 ('060309','CAJAMARCA','CELENDIN','SOROCHUCO'),
 ('060310','CAJAMARCA','CELENDIN','SUCRE'),
 ('060311','CAJAMARCA','CELENDIN','UTCO'),
 ('060312','CAJAMARCA','CELENDIN','LA LIBERTAD DE PALLAN'),
 ('060401','CAJAMARCA','CHOTA','CHOTA'),
 ('060402','CAJAMARCA','CHOTA','ANGUIA'),
 ('060403','CAJAMARCA','CHOTA','CHADIN'),
 ('060404','CAJAMARCA','CHOTA','CHIGUIRIP'),
 ('060405','CAJAMARCA','CHOTA','CHIMBAN'),
 ('060406','CAJAMARCA','CHOTA','CHOROPAMPA'),
 ('060407','CAJAMARCA','CHOTA','COCHABAMBA'),
 ('060408','CAJAMARCA','CHOTA','CONCHAN'),
 ('060409','CAJAMARCA','CHOTA','HUAMBOS'),
 ('060410','CAJAMARCA','CHOTA','LAJAS'),
 ('060411','CAJAMARCA','CHOTA','LLAMA'),
 ('060412','CAJAMARCA','CHOTA','MIRACOSTA'),
 ('060413','CAJAMARCA','CHOTA','PACCHA'),
 ('060414','CAJAMARCA','CHOTA','PION'),
 ('060415','CAJAMARCA','CHOTA','QUEROCOTO'),
 ('060416','CAJAMARCA','CHOTA','SAN JUAN DE LICUPIS'),
 ('060417','CAJAMARCA','CHOTA','TACABAMBA'),
 ('060418','CAJAMARCA','CHOTA','TOCMOCHE'),
 ('060419','CAJAMARCA','CHOTA','CHALAMARCA'),
 ('060501','CAJAMARCA','CONTUMAZA','CONTUMAZA'),
 ('060502','CAJAMARCA','CONTUMAZA','CHILETE'),
 ('060503','CAJAMARCA','CONTUMAZA','CUPISNIQUE'),
 ('060504','CAJAMARCA','CONTUMAZA','GUZMANGO'),
 ('060505','CAJAMARCA','CONTUMAZA','SAN BENITO'),
 ('060506','CAJAMARCA','CONTUMAZA','SANTA CRUZ DE TOLEDO'),
 ('060507','CAJAMARCA','CONTUMAZA','TANTARICA'),
 ('060508','CAJAMARCA','CONTUMAZA','YONAN'),
 ('060601','CAJAMARCA','CUTERVO','CUTERVO'),
 ('060602','CAJAMARCA','CUTERVO','CALLAYUC'),
 ('060603','CAJAMARCA','CUTERVO','CHOROS'),
 ('060604','CAJAMARCA','CUTERVO','CUJILLO'),
 ('060605','CAJAMARCA','CUTERVO','LA RAMADA'),
 ('060606','CAJAMARCA','CUTERVO','PIMPINGOS'),
 ('060607','CAJAMARCA','CUTERVO','QUEROCOTILLO'),
 ('060608','CAJAMARCA','CUTERVO','SAN ANDRES DE CUTERVO'),
 ('060609','CAJAMARCA','CUTERVO','SAN JUAN DE CUTERVO'),
 ('060610','CAJAMARCA','CUTERVO','SAN LUIS DE LUCMA'),
 ('060611','CAJAMARCA','CUTERVO','SANTA CRUZ'),
 ('060612','CAJAMARCA','CUTERVO','SANTO DOMINGO DE LA CAPILLA'),
 ('060613','CAJAMARCA','CUTERVO','SANTO TOMAS'),
 ('060614','CAJAMARCA','CUTERVO','SOCOTA'),
 ('060615','CAJAMARCA','CUTERVO','TORIBIO CASANOVA'),
 ('060701','CAJAMARCA','HUALGAYOC','BAMBAMARCA'),
 ('060702','CAJAMARCA','HUALGAYOC','CHUGUR'),
 ('060703','CAJAMARCA','HUALGAYOC','HUALGAYOC'),
 ('060801','CAJAMARCA','JAEN','JAEN'),
 ('060802','CAJAMARCA','JAEN','BELLAVISTA'),
 ('060803','CAJAMARCA','JAEN','CHONTALI'),
 ('060804','CAJAMARCA','JAEN','COLASAY'),
 ('060805','CAJAMARCA','JAEN','HUABAL'),
 ('060806','CAJAMARCA','JAEN','LAS PIRIAS'),
 ('060807','CAJAMARCA','JAEN','POMAHUACA'),
 ('060808','CAJAMARCA','JAEN','PUCARA'),
 ('060809','CAJAMARCA','JAEN','SALLIQUE'),
 ('060810','CAJAMARCA','JAEN','SAN FELIPE'),
 ('060811','CAJAMARCA','JAEN','SAN JOSE DEL ALTO'),
 ('060812','CAJAMARCA','JAEN','SANTA ROSA'),
 ('060901','CAJAMARCA','SAN IGNACIO','SAN IGNACIO'),
 ('060902','CAJAMARCA','SAN IGNACIO','CHIRINOS'),
 ('060903','CAJAMARCA','SAN IGNACIO','HUARANGO'),
 ('060904','CAJAMARCA','SAN IGNACIO','LA COIPA'),
 ('060905','CAJAMARCA','SAN IGNACIO','NAMBALLE'),
 ('060906','CAJAMARCA','SAN IGNACIO','SAN JOSE DE LOURDES'),
 ('060907','CAJAMARCA','SAN IGNACIO','TABACONAS'),
 ('061001','CAJAMARCA','SAN MARCOS','PEDRO GALVEZ'),
 ('061002','CAJAMARCA','SAN MARCOS','CHANCAY'),
 ('061003','CAJAMARCA','SAN MARCOS','EDUARDO VILLANUEVA'),
 ('061004','CAJAMARCA','SAN MARCOS','GREGORIO PITA'),
 ('061005','CAJAMARCA','SAN MARCOS','ICHOCAN'),
 ('061006','CAJAMARCA','SAN MARCOS','JOSE MANUEL QUIROZ'),
 ('061007','CAJAMARCA','SAN MARCOS','JOSE SABOGAL'),
 ('061101','CAJAMARCA','SAN MIGUEL','SAN MIGUEL'),
 ('061102','CAJAMARCA','SAN MIGUEL','BOLIVAR'),
 ('061103','CAJAMARCA','SAN MIGUEL','CALQUIS'),
 ('061104','CAJAMARCA','SAN MIGUEL','CATILLUC'),
 ('061105','CAJAMARCA','SAN MIGUEL','EL PRADO'),
 ('061106','CAJAMARCA','SAN MIGUEL','LA FLORIDA'),
 ('061107','CAJAMARCA','SAN MIGUEL','LLAPA'),
 ('061108','CAJAMARCA','SAN MIGUEL','NANCHOC'),
 ('061109','CAJAMARCA','SAN MIGUEL','NIEPOS'),
 ('061110','CAJAMARCA','SAN MIGUEL','SAN GREGORIO'),
 ('061111','CAJAMARCA','SAN MIGUEL','SAN SILVESTRE DE COCHAN'),
 ('061112','CAJAMARCA','SAN MIGUEL','TONGOD'),
 ('061113','CAJAMARCA','SAN MIGUEL','UNION AGUA BLANCA'),
 ('061201','CAJAMARCA','SAN PABLO','SAN PABLO'),
 ('061202','CAJAMARCA','SAN PABLO','SAN BERNARDINO'),
 ('061203','CAJAMARCA','SAN PABLO','SAN LUIS'),
 ('061204','CAJAMARCA','SAN PABLO','TUMBADEN'),
 ('061301','CAJAMARCA','SANTA CRUZ','SANTA CRUZ'),
 ('061302','CAJAMARCA','SANTA CRUZ','ANDABAMBA'),
 ('061303','CAJAMARCA','SANTA CRUZ','CATACHE'),
 ('061304','CAJAMARCA','SANTA CRUZ','CHANCAYBANOS'),
 ('061305','CAJAMARCA','SANTA CRUZ','LA ESPERANZA'),
 ('061306','CAJAMARCA','SANTA CRUZ','NINABAMBA'),
 ('061307','CAJAMARCA','SANTA CRUZ','PULAN'),
 ('061308','CAJAMARCA','SANTA CRUZ','SAUCEPAMPA'),
 ('061309','CAJAMARCA','SANTA CRUZ','SEXI'),
 ('061310','CAJAMARCA','SANTA CRUZ','UTICYACU'),
 ('061311','CAJAMARCA','SANTA CRUZ','YAUYUCAN'),
 ('070101','CALLAO','PROV. CONST. DEL CALLAO','CALLAO'),
 ('070102','CALLAO','PROV. CONST. DEL CALLAO','BELLAVISTA'),
 ('070103','CALLAO','PROV. CONST. DEL CALLAO','CARMEN DE LA LEGUA REYNOSO'),
 ('070104','CALLAO','PROV. CONST. DEL CALLAO','LA PERLA'),
 ('070105','CALLAO','PROV. CONST. DEL CALLAO','LA PUNTA'),
 ('070106','CALLAO','PROV. CONST. DEL CALLAO','VENTANILLA'),
 ('070107','CALLAO','PROV. CONST. DEL CALLAO','MI PERU'),
 ('080101','CUSCO','CUSCO','CUSCO'),
 ('080102','CUSCO','CUSCO','CCORCA'),
 ('080103','CUSCO','CUSCO','POROY'),
 ('080104','CUSCO','CUSCO','SAN JERONIMO'),
 ('080105','CUSCO','CUSCO','SAN SEBASTIAN'),
 ('080106','CUSCO','CUSCO','SANTIAGO'),
 ('080107','CUSCO','CUSCO','SAYLLA'),
 ('080108','CUSCO','CUSCO','WANCHAQ'),
 ('080201','CUSCO','ACOMAYO','ACOMAYO'),
 ('080202','CUSCO','ACOMAYO','ACOPIA'),
 ('080203','CUSCO','ACOMAYO','ACOS'),
 ('080204','CUSCO','ACOMAYO','MOSOC LLACTA'),
 ('080205','CUSCO','ACOMAYO','POMACANCHI'),
 ('080206','CUSCO','ACOMAYO','RONDOCAN'),
 ('080207','CUSCO','ACOMAYO','SANGARARA'),
 ('080301','CUSCO','ANTA','ANTA'),
 ('080302','CUSCO','ANTA','ANCAHUASI'),
 ('080303','CUSCO','ANTA','CACHIMAYO'),
 ('080304','CUSCO','ANTA','CHINCHAYPUJIO'),
 ('080305','CUSCO','ANTA','HUAROCONDO'),
 ('080306','CUSCO','ANTA','LIMATAMBO'),
 ('080307','CUSCO','ANTA','MOLLEPATA'),
 ('080308','CUSCO','ANTA','PUCYURA'),
 ('080309','CUSCO','ANTA','ZURITE'),
 ('080401','CUSCO','CALCA','CALCA'),
 ('080402','CUSCO','CALCA','COYA'),
 ('080403','CUSCO','CALCA','LAMAY'),
 ('080404','CUSCO','CALCA','LARES'),
 ('080405','CUSCO','CALCA','PISAC'),
 ('080406','CUSCO','CALCA','SAN SALVADOR'),
 ('080407','CUSCO','CALCA','TARAY'),
 ('080408','CUSCO','CALCA','YANATILE'),
 ('080501','CUSCO','CANAS','YANAOCA'),
 ('080502','CUSCO','CANAS','CHECCA'),
 ('080503','CUSCO','CANAS','KUNTURKANKI'),
 ('080504','CUSCO','CANAS','LANGUI'),
 ('080505','CUSCO','CANAS','LAYO'),
 ('080506','CUSCO','CANAS','PAMPAMARCA'),
 ('080507','CUSCO','CANAS','QUEHUE'),
 ('080508','CUSCO','CANAS','TUPAC AMARU'),
 ('080601','CUSCO','CANCHIS','SICUANI'),
 ('080602','CUSCO','CANCHIS','CHECACUPE'),
 ('080603','CUSCO','CANCHIS','COMBAPATA'),
 ('080604','CUSCO','CANCHIS','MARANGANI'),
 ('080605','CUSCO','CANCHIS','PITUMARCA'),
 ('080606','CUSCO','CANCHIS','SAN PABLO'),
 ('080607','CUSCO','CANCHIS','SAN PEDRO'),
 ('080608','CUSCO','CANCHIS','TINTA'),
 ('080701','CUSCO','CHUMBIVILCAS','SANTO TOMAS'),
 ('080702','CUSCO','CHUMBIVILCAS','CAPACMARCA'),
 ('080703','CUSCO','CHUMBIVILCAS','CHAMACA'),
 ('080704','CUSCO','CHUMBIVILCAS','COLQUEMARCA'),
 ('080705','CUSCO','CHUMBIVILCAS','LIVITACA'),
 ('080706','CUSCO','CHUMBIVILCAS','LLUSCO'),
 ('080707','CUSCO','CHUMBIVILCAS','QUINOTA'),
 ('080708','CUSCO','CHUMBIVILCAS','VELILLE'),
 ('080801','CUSCO','ESPINAR','ESPINAR'),
 ('080802','CUSCO','ESPINAR','CONDOROMA'),
 ('080803','CUSCO','ESPINAR','COPORAQUE'),
 ('080804','CUSCO','ESPINAR','OCORURO'),
 ('080805','CUSCO','ESPINAR','PALLPATA'),
 ('080806','CUSCO','ESPINAR','PICHIGUA'),
 ('080807','CUSCO','ESPINAR','SUYCKUTAMBO'),
 ('080808','CUSCO','ESPINAR','ALTO PICHIGUA'),
 ('080901','CUSCO','LA CONVENCION','SANTA ANA'),
 ('080902','CUSCO','LA CONVENCION','ECHARATE'),
 ('080903','CUSCO','LA CONVENCION','HUAYOPATA'),
 ('080904','CUSCO','LA CONVENCION','MARANURA'),
 ('080905','CUSCO','LA CONVENCION','OCOBAMBA'),
 ('080906','CUSCO','LA CONVENCION','QUELLOUNO'),
 ('080907','CUSCO','LA CONVENCION','KIMBIRI'),
 ('080908','CUSCO','LA CONVENCION','SANTA TERESA'),
 ('080909','CUSCO','LA CONVENCION','VILCABAMBA'),
 ('080910','CUSCO','LA CONVENCION','PICHARI'),
 ('080911','CUSCO','LA CONVENCION','INKAWASI'),
 ('080912','CUSCO','LA CONVENCION','VILLA VIRGEN'),
 ('080913','CUSCO','LA CONVENCION','VILLA KINTIARINA'),
 ('080914','CUSCO','LA CONVENCION','MEGANTONI'),
 ('080915','CUSCO','LA CONVENCION','KUMPIRUSHIATO'),
 ('080916','CUSCO','LA CONVENCION','CIELO PUNCO'),
 ('080917','CUSCO','LA CONVENCION','MANITEA'),
 ('080918','CUSCO','LA CONVENCION','UNION ASHANINKA'),
 ('081001','CUSCO','PARURO','PARURO'),
 ('081002','CUSCO','PARURO','ACCHA'),
 ('081003','CUSCO','PARURO','CCAPI'),
 ('081004','CUSCO','PARURO','COLCHA'),
 ('081005','CUSCO','PARURO','HUANOQUITE'),
 ('081006','CUSCO','PARURO','OMACHA'),
 ('081007','CUSCO','PARURO','PACCARITAMBO'),
 ('081008','CUSCO','PARURO','PILLPINTO'),
 ('081009','CUSCO','PARURO','YAURISQUE'),
 ('081101','CUSCO','PAUCARTAMBO','PAUCARTAMBO'),
 ('081102','CUSCO','PAUCARTAMBO','CAICAY'),
 ('081103','CUSCO','PAUCARTAMBO','CHALLABAMBA'),
 ('081104','CUSCO','PAUCARTAMBO','COLQUEPATA'),
 ('081105','CUSCO','PAUCARTAMBO','HUANCARANI'),
 ('081106','CUSCO','PAUCARTAMBO','KOSNIPATA'),
 ('081201','CUSCO','QUISPICANCHI','URCOS'),
 ('081202','CUSCO','QUISPICANCHI','ANDAHUAYLILLAS'),
 ('081203','CUSCO','QUISPICANCHI','CAMANTI'),
 ('081204','CUSCO','QUISPICANCHI','CCARHUAYO'),
 ('081205','CUSCO','QUISPICANCHI','CCATCA'),
 ('081206','CUSCO','QUISPICANCHI','CUSIPATA'),
 ('081207','CUSCO','QUISPICANCHI','HUARO'),
 ('081208','CUSCO','QUISPICANCHI','LUCRE'),
 ('081209','CUSCO','QUISPICANCHI','MARCAPATA'),
 ('081210','CUSCO','QUISPICANCHI','OCONGATE'),
 ('081211','CUSCO','QUISPICANCHI','OROPESA'),
 ('081212','CUSCO','QUISPICANCHI','QUIQUIJANA'),
 ('081301','CUSCO','URUBAMBA','URUBAMBA'),
 ('081302','CUSCO','URUBAMBA','CHINCHERO'),
 ('081303','CUSCO','URUBAMBA','HUAYLLABAMBA'),
 ('081304','CUSCO','URUBAMBA','MACHUPICCHU'),
 ('081305','CUSCO','URUBAMBA','MARAS'),
 ('081306','CUSCO','URUBAMBA','OLLANTAYTAMBO'),
 ('081307','CUSCO','URUBAMBA','YUCAY'),
 ('090101','HUANCAVELICA','HUANCAVELICA','HUANCAVELICA'),
 ('090102','HUANCAVELICA','HUANCAVELICA','ACOBAMBILLA'),
 ('090103','HUANCAVELICA','HUANCAVELICA','ACORIA'),
 ('090104','HUANCAVELICA','HUANCAVELICA','CONAYCA'),
 ('090105','HUANCAVELICA','HUANCAVELICA','CUENCA'),
 ('090106','HUANCAVELICA','HUANCAVELICA','HUACHOCOLPA'),
 ('090107','HUANCAVELICA','HUANCAVELICA','HUAYLLAHUARA'),
 ('090108','HUANCAVELICA','HUANCAVELICA','IZCUCHACA'),
 ('090109','HUANCAVELICA','HUANCAVELICA','LARIA'),
 ('090110','HUANCAVELICA','HUANCAVELICA','MANTA'),
 ('090111','HUANCAVELICA','HUANCAVELICA','MARISCAL CACERES'),
 ('090112','HUANCAVELICA','HUANCAVELICA','MOYA'),
 ('090113','HUANCAVELICA','HUANCAVELICA','NUEVO OCCORO'),
 ('090114','HUANCAVELICA','HUANCAVELICA','PALCA'),
 ('090115','HUANCAVELICA','HUANCAVELICA','PILCHACA'),
 ('090116','HUANCAVELICA','HUANCAVELICA','VILCA'),
 ('090117','HUANCAVELICA','HUANCAVELICA','YAULI'),
 ('090118','HUANCAVELICA','HUANCAVELICA','ASCENSION'),
 ('090119','HUANCAVELICA','HUANCAVELICA','HUANDO'),
 ('090201','HUANCAVELICA','ACOBAMBA','ACOBAMBA'),
 ('090202','HUANCAVELICA','ACOBAMBA','ANDABAMBA'),
 ('090203','HUANCAVELICA','ACOBAMBA','ANTA'),
 ('090204','HUANCAVELICA','ACOBAMBA','CAJA'),
 ('090205','HUANCAVELICA','ACOBAMBA','MARCAS'),
 ('090206','HUANCAVELICA','ACOBAMBA','PAUCARA'),
 ('090207','HUANCAVELICA','ACOBAMBA','POMACOCHA'),
 ('090208','HUANCAVELICA','ACOBAMBA','ROSARIO'),
 ('090301','HUANCAVELICA','ANGARAES','LIRCAY'),
 ('090302','HUANCAVELICA','ANGARAES','ANCHONGA'),
 ('090303','HUANCAVELICA','ANGARAES','CALLANMARCA'),
 ('090304','HUANCAVELICA','ANGARAES','CCOCHACCASA'),
 ('090305','HUANCAVELICA','ANGARAES','CHINCHO'),
 ('090306','HUANCAVELICA','ANGARAES','CONGALLA'),
 ('090307','HUANCAVELICA','ANGARAES','HUANCA-HUANCA'),
 ('090308','HUANCAVELICA','ANGARAES','HUAYLLAY GRANDE'),
 ('090309','HUANCAVELICA','ANGARAES','JULCAMARCA'),
 ('090310','HUANCAVELICA','ANGARAES','SAN ANTONIO DE ANTAPARCO'),
 ('090311','HUANCAVELICA','ANGARAES','SANTO TOMAS DE PATA'),
 ('090312','HUANCAVELICA','ANGARAES','SECCLLA'),
 ('090401','HUANCAVELICA','CASTROVIRREYNA','CASTROVIRREYNA'),
 ('090402','HUANCAVELICA','CASTROVIRREYNA','ARMA'),
 ('090403','HUANCAVELICA','CASTROVIRREYNA','AURAHUA'),
 ('090404','HUANCAVELICA','CASTROVIRREYNA','CAPILLAS'),
 ('090405','HUANCAVELICA','CASTROVIRREYNA','CHUPAMARCA'),
 ('090406','HUANCAVELICA','CASTROVIRREYNA','COCAS'),
 ('090407','HUANCAVELICA','CASTROVIRREYNA','HUACHOS'),
 ('090408','HUANCAVELICA','CASTROVIRREYNA','HUAMATAMBO'),
 ('090409','HUANCAVELICA','CASTROVIRREYNA','MOLLEPAMPA'),
 ('090410','HUANCAVELICA','CASTROVIRREYNA','SAN JUAN'),
 ('090411','HUANCAVELICA','CASTROVIRREYNA','SANTA ANA'),
 ('090412','HUANCAVELICA','CASTROVIRREYNA','TANTARA'),
 ('090413','HUANCAVELICA','CASTROVIRREYNA','TICRAPO'),
 ('090501','HUANCAVELICA','CHURCAMPA','CHURCAMPA'),
 ('090502','HUANCAVELICA','CHURCAMPA','ANCO'),
 ('090503','HUANCAVELICA','CHURCAMPA','CHINCHIHUASI'),
 ('090504','HUANCAVELICA','CHURCAMPA','EL CARMEN'),
 ('090505','HUANCAVELICA','CHURCAMPA','LA MERCED'),
 ('090506','HUANCAVELICA','CHURCAMPA','LOCROJA');
INSERT INTO `ubigeo` (`codigo`,`dpto`,`prov`,`dist`) VALUES 
 ('090507','HUANCAVELICA','CHURCAMPA','PAUCARBAMBA'),
 ('090508','HUANCAVELICA','CHURCAMPA','SAN MIGUEL DE MAYOCC'),
 ('090509','HUANCAVELICA','CHURCAMPA','SAN PEDRO DE CORIS'),
 ('090510','HUANCAVELICA','CHURCAMPA','PACHAMARCA'),
 ('090511','HUANCAVELICA','CHURCAMPA','COSME'),
 ('090601','HUANCAVELICA','HUAYTARA','HUAYTARA'),
 ('090602','HUANCAVELICA','HUAYTARA','AYAVI'),
 ('090603','HUANCAVELICA','HUAYTARA','CORDOVA'),
 ('090604','HUANCAVELICA','HUAYTARA','HUAYACUNDO ARMA'),
 ('090605','HUANCAVELICA','HUAYTARA','LARAMARCA'),
 ('090606','HUANCAVELICA','HUAYTARA','OCOYO'),
 ('090607','HUANCAVELICA','HUAYTARA','PILPICHACA'),
 ('090608','HUANCAVELICA','HUAYTARA','QUERCO'),
 ('090609','HUANCAVELICA','HUAYTARA','QUITO-ARMA'),
 ('090610','HUANCAVELICA','HUAYTARA','SAN ANTONIO DE CUSICANCHA'),
 ('090611','HUANCAVELICA','HUAYTARA','SAN FRANCISCO DE SANGAYAICO'),
 ('090612','HUANCAVELICA','HUAYTARA','SAN ISIDRO'),
 ('090613','HUANCAVELICA','HUAYTARA','SANTIAGO DE CHOCORVOS'),
 ('090614','HUANCAVELICA','HUAYTARA','SANTIAGO DE QUIRAHUARA'),
 ('090615','HUANCAVELICA','HUAYTARA','SANTO DOMINGO DE CAPILLAS'),
 ('090616','HUANCAVELICA','HUAYTARA','TAMBO'),
 ('090701','HUANCAVELICA','TAYACAJA','PAMPAS'),
 ('090702','HUANCAVELICA','TAYACAJA','ACOSTAMBO'),
 ('090703','HUANCAVELICA','TAYACAJA','ACRAQUIA'),
 ('090704','HUANCAVELICA','TAYACAJA','AHUAYCHA'),
 ('090705','HUANCAVELICA','TAYACAJA','COLCABAMBA'),
 ('090706','HUANCAVELICA','TAYACAJA','DANIEL HERNANDEZ'),
 ('090707','HUANCAVELICA','TAYACAJA','HUACHOCOLPA'),
 ('090709','HUANCAVELICA','TAYACAJA','HUARIBAMBA'),
 ('090710','HUANCAVELICA','TAYACAJA','NAHUIMPUQUIO'),
 ('090711','HUANCAVELICA','TAYACAJA','PAZOS'),
 ('090713','HUANCAVELICA','TAYACAJA','QUISHUAR'),
 ('090714','HUANCAVELICA','TAYACAJA','SALCABAMBA'),
 ('090715','HUANCAVELICA','TAYACAJA','SALCAHUASI'),
 ('090716','HUANCAVELICA','TAYACAJA','SAN MARCOS DE ROCCHAC'),
 ('090717','HUANCAVELICA','TAYACAJA','SURCUBAMBA'),
 ('090718','HUANCAVELICA','TAYACAJA','TINTAY PUNCU'),
 ('090719','HUANCAVELICA','TAYACAJA','QUICHUAS'),
 ('090720','HUANCAVELICA','TAYACAJA','ANDAYMARCA'),
 ('090721','HUANCAVELICA','TAYACAJA','ROBLE'),
 ('090722','HUANCAVELICA','TAYACAJA','PICHOS'),
 ('090723','HUANCAVELICA','TAYACAJA','SANTIAGO DE TUCUMA'),
 ('090724','HUANCAVELICA','TAYACAJA','LAMBRAS'),
 ('090725','HUANCAVELICA','TAYACAJA','COCHABAMBA'),
 ('100101','HUANUCO','HUANUCO','HUANUCO'),
 ('100102','HUANUCO','HUANUCO','AMARILIS'),
 ('100103','HUANUCO','HUANUCO','CHINCHAO'),
 ('100104','HUANUCO','HUANUCO','CHURUBAMBA'),
 ('100105','HUANUCO','HUANUCO','MARGOS'),
 ('100106','HUANUCO','HUANUCO','QUISQUI (KICHKI)'),
 ('100107','HUANUCO','HUANUCO','SAN FRANCISCO DE CAYRAN'),
 ('100108','HUANUCO','HUANUCO','SAN PEDRO DE CHAULAN'),
 ('100109','HUANUCO','HUANUCO','SANTA MARIA DEL VALLE'),
 ('100110','HUANUCO','HUANUCO','YARUMAYO'),
 ('100111','HUANUCO','HUANUCO','PILLCO MARCA'),
 ('100112','HUANUCO','HUANUCO','YACUS'),
 ('100113','HUANUCO','HUANUCO','SAN PABLO DE PILLAO'),
 ('100201','HUANUCO','AMBO','AMBO'),
 ('100202','HUANUCO','AMBO','CAYNA'),
 ('100203','HUANUCO','AMBO','COLPAS'),
 ('100204','HUANUCO','AMBO','CONCHAMARCA'),
 ('100205','HUANUCO','AMBO','HUACAR'),
 ('100206','HUANUCO','AMBO','SAN FRANCISCO'),
 ('100207','HUANUCO','AMBO','SAN RAFAEL'),
 ('100208','HUANUCO','AMBO','TOMAY KICHWA'),
 ('100301','HUANUCO','DOS DE MAYO','LA UNION'),
 ('100307','HUANUCO','DOS DE MAYO','CHUQUIS'),
 ('100311','HUANUCO','DOS DE MAYO','MARIAS'),
 ('100313','HUANUCO','DOS DE MAYO','PACHAS'),
 ('100316','HUANUCO','DOS DE MAYO','QUIVILLA'),
 ('100317','HUANUCO','DOS DE MAYO','RIPAN'),
 ('100321','HUANUCO','DOS DE MAYO','SHUNQUI'),
 ('100322','HUANUCO','DOS DE MAYO','SILLAPATA'),
 ('100323','HUANUCO','DOS DE MAYO','YANAS'),
 ('100401','HUANUCO','HUACAYBAMBA','HUACAYBAMBA'),
 ('100402','HUANUCO','HUACAYBAMBA','CANCHABAMBA'),
 ('100403','HUANUCO','HUACAYBAMBA','COCHABAMBA'),
 ('100404','HUANUCO','HUACAYBAMBA','PINRA'),
 ('100501','HUANUCO','HUAMALIES','LLATA'),
 ('100502','HUANUCO','HUAMALIES','ARANCAY'),
 ('100503','HUANUCO','HUAMALIES','CHAVIN DE PARIARCA'),
 ('100504','HUANUCO','HUAMALIES','JACAS GRANDE'),
 ('100505','HUANUCO','HUAMALIES','JIRCAN'),
 ('100506','HUANUCO','HUAMALIES','MIRAFLORES'),
 ('100507','HUANUCO','HUAMALIES','MONZON'),
 ('100508','HUANUCO','HUAMALIES','PUNCHAO'),
 ('100509','HUANUCO','HUAMALIES','PUNOS'),
 ('100510','HUANUCO','HUAMALIES','SINGA'),
 ('100511','HUANUCO','HUAMALIES','TANTAMAYO'),
 ('100601','HUANUCO','LEONCIO PRADO','RUPA-RUPA'),
 ('100602','HUANUCO','LEONCIO PRADO','DANIEL ALOMIA ROBLES'),
 ('100603','HUANUCO','LEONCIO PRADO','HERMILIO VALDIZAN'),
 ('100604','HUANUCO','LEONCIO PRADO','JOSE CRESPO Y CASTILLO'),
 ('100605','HUANUCO','LEONCIO PRADO','LUYANDO'),
 ('100606','HUANUCO','LEONCIO PRADO','MARIANO DAMASO BERAUN'),
 ('100607','HUANUCO','LEONCIO PRADO','PUCAYACU'),
 ('100608','HUANUCO','LEONCIO PRADO','CASTILLO GRANDE'),
 ('100609','HUANUCO','LEONCIO PRADO','PUEBLO NUEVO'),
 ('100610','HUANUCO','LEONCIO PRADO','SANTO DOMINGO DE ANDA'),
 ('100701','HUANUCO','MARANON','HUACRACHUCO'),
 ('100702','HUANUCO','MARANON','CHOLON'),
 ('100703','HUANUCO','MARANON','SAN BUENAVENTURA'),
 ('100704','HUANUCO','MARANON','LA MORADA'),
 ('100705','HUANUCO','MARANON','SANTA ROSA DE ALTO YANAJANCA'),
 ('100801','HUANUCO','PACHITEA','PANAO'),
 ('100802','HUANUCO','PACHITEA','CHAGLLA'),
 ('100803','HUANUCO','PACHITEA','MOLINO'),
 ('100804','HUANUCO','PACHITEA','UMARI'),
 ('100901','HUANUCO','PUERTO INCA','PUERTO INCA'),
 ('100902','HUANUCO','PUERTO INCA','CODO DEL POZUZO'),
 ('100903','HUANUCO','PUERTO INCA','HONORIA'),
 ('100904','HUANUCO','PUERTO INCA','TOURNAVISTA'),
 ('100905','HUANUCO','PUERTO INCA','YUYAPICHIS'),
 ('101001','HUANUCO','LAURICOCHA','JESUS'),
 ('101002','HUANUCO','LAURICOCHA','BANOS'),
 ('101003','HUANUCO','LAURICOCHA','JIVIA'),
 ('101004','HUANUCO','LAURICOCHA','QUEROPALCA'),
 ('101005','HUANUCO','LAURICOCHA','RONDOS'),
 ('101006','HUANUCO','LAURICOCHA','SAN FRANCISCO DE ASIS'),
 ('101007','HUANUCO','LAURICOCHA','SAN MIGUEL DE CAURI'),
 ('101101','HUANUCO','YAROWILCA','CHAVINILLO'),
 ('101102','HUANUCO','YAROWILCA','CAHUAC'),
 ('101103','HUANUCO','YAROWILCA','CHACABAMBA'),
 ('101104','HUANUCO','YAROWILCA','APARICIO POMARES'),
 ('101105','HUANUCO','YAROWILCA','JACAS CHICO'),
 ('101106','HUANUCO','YAROWILCA','OBAS'),
 ('101107','HUANUCO','YAROWILCA','PAMPAMARCA'),
 ('101108','HUANUCO','YAROWILCA','CHORAS'),
 ('110101','ICA','ICA','ICA'),
 ('110102','ICA','ICA','LA TINGUINA'),
 ('110103','ICA','ICA','LOS AQUIJES'),
 ('110104','ICA','ICA','OCUCAJE'),
 ('110105','ICA','ICA','PACHACUTEC'),
 ('110106','ICA','ICA','PARCONA'),
 ('110107','ICA','ICA','PUEBLO NUEVO'),
 ('110108','ICA','ICA','SALAS'),
 ('110109','ICA','ICA','SAN JOSE DE LOS MOLINOS'),
 ('110110','ICA','ICA','SAN JUAN BAUTISTA'),
 ('110111','ICA','ICA','SANTIAGO'),
 ('110112','ICA','ICA','SUBTANJALLA'),
 ('110113','ICA','ICA','TATE'),
 ('110114','ICA','ICA','YAUCA DEL ROSARIO'),
 ('110201','ICA','CHINCHA','CHINCHA ALTA'),
 ('110202','ICA','CHINCHA','ALTO LARAN'),
 ('110203','ICA','CHINCHA','CHAVIN'),
 ('110204','ICA','CHINCHA','CHINCHA BAJA'),
 ('110205','ICA','CHINCHA','EL CARMEN'),
 ('110206','ICA','CHINCHA','GROCIO PRADO'),
 ('110207','ICA','CHINCHA','PUEBLO NUEVO'),
 ('110208','ICA','CHINCHA','SAN JUAN DE YANAC'),
 ('110209','ICA','CHINCHA','SAN PEDRO DE HUACARPANA'),
 ('110210','ICA','CHINCHA','SUNAMPE'),
 ('110211','ICA','CHINCHA','TAMBO DE MORA'),
 ('110301','ICA','NASCA','NASCA'),
 ('110302','ICA','NASCA','CHANGUILLO'),
 ('110303','ICA','NASCA','EL INGENIO'),
 ('110304','ICA','NASCA','MARCONA'),
 ('110305','ICA','NASCA','VISTA ALEGRE'),
 ('110401','ICA','PALPA','PALPA'),
 ('110402','ICA','PALPA','LLIPATA'),
 ('110403','ICA','PALPA','RIO GRANDE'),
 ('110404','ICA','PALPA','SANTA CRUZ'),
 ('110405','ICA','PALPA','TIBILLO'),
 ('110501','ICA','PISCO','PISCO'),
 ('110502','ICA','PISCO','HUANCANO'),
 ('110503','ICA','PISCO','HUMAY'),
 ('110504','ICA','PISCO','INDEPENDENCIA'),
 ('110505','ICA','PISCO','PARACAS'),
 ('110506','ICA','PISCO','SAN ANDRES'),
 ('110507','ICA','PISCO','SAN CLEMENTE'),
 ('110508','ICA','PISCO','TUPAC AMARU INCA'),
 ('120101','JUNIN','HUANCAYO','HUANCAYO'),
 ('120104','JUNIN','HUANCAYO','CARHUACALLANGA'),
 ('120105','JUNIN','HUANCAYO','CHACAPAMPA'),
 ('120106','JUNIN','HUANCAYO','CHICCHE'),
 ('120107','JUNIN','HUANCAYO','CHILCA'),
 ('120108','JUNIN','HUANCAYO','CHONGOS ALTO'),
 ('120111','JUNIN','HUANCAYO','CHUPURO'),
 ('120112','JUNIN','HUANCAYO','COLCA'),
 ('120113','JUNIN','HUANCAYO','CULLHUAS'),
 ('120114','JUNIN','HUANCAYO','EL TAMBO'),
 ('120116','JUNIN','HUANCAYO','HUACRAPUQUIO'),
 ('120117','JUNIN','HUANCAYO','HUALHUAS'),
 ('120119','JUNIN','HUANCAYO','HUANCAN'),
 ('120120','JUNIN','HUANCAYO','HUASICANCHA'),
 ('120121','JUNIN','HUANCAYO','HUAYUCACHI'),
 ('120122','JUNIN','HUANCAYO','INGENIO'),
 ('120124','JUNIN','HUANCAYO','PARIAHUANCA'),
 ('120125','JUNIN','HUANCAYO','PILCOMAYO'),
 ('120126','JUNIN','HUANCAYO','PUCARA'),
 ('120127','JUNIN','HUANCAYO','QUICHUAY'),
 ('120128','JUNIN','HUANCAYO','QUILCAS'),
 ('120129','JUNIN','HUANCAYO','SAN AGUSTIN'),
 ('120130','JUNIN','HUANCAYO','SAN JERONIMO DE TUNAN'),
 ('120132','JUNIN','HUANCAYO','SANO'),
 ('120133','JUNIN','HUANCAYO','SAPALLANGA'),
 ('120134','JUNIN','HUANCAYO','SICAYA'),
 ('120135','JUNIN','HUANCAYO','SANTO DOMINGO DE ACOBAMBA'),
 ('120136','JUNIN','HUANCAYO','VIQUES'),
 ('120201','JUNIN','CONCEPCION','CONCEPCION'),
 ('120202','JUNIN','CONCEPCION','ACO'),
 ('120203','JUNIN','CONCEPCION','ANDAMARCA'),
 ('120204','JUNIN','CONCEPCION','CHAMBARA'),
 ('120205','JUNIN','CONCEPCION','COCHAS'),
 ('120206','JUNIN','CONCEPCION','COMAS'),
 ('120207','JUNIN','CONCEPCION','HEROINAS TOLEDO'),
 ('120208','JUNIN','CONCEPCION','MANZANARES'),
 ('120209','JUNIN','CONCEPCION','MARISCAL CASTILLA'),
 ('120210','JUNIN','CONCEPCION','MATAHUASI'),
 ('120211','JUNIN','CONCEPCION','MITO'),
 ('120212','JUNIN','CONCEPCION','NUEVE DE JULIO'),
 ('120213','JUNIN','CONCEPCION','ORCOTUNA'),
 ('120214','JUNIN','CONCEPCION','SAN JOSE DE QUERO'),
 ('120215','JUNIN','CONCEPCION','SANTA ROSA DE OCOPA'),
 ('120301','JUNIN','CHANCHAMAYO','CHANCHAMAYO'),
 ('120302','JUNIN','CHANCHAMAYO','PERENE'),
 ('120303','JUNIN','CHANCHAMAYO','PICHANAQUI'),
 ('120304','JUNIN','CHANCHAMAYO','SAN LUIS DE SHUARO'),
 ('120305','JUNIN','CHANCHAMAYO','SAN RAMON'),
 ('120306','JUNIN','CHANCHAMAYO','VITOC'),
 ('120401','JUNIN','JAUJA','JAUJA'),
 ('120402','JUNIN','JAUJA','ACOLLA'),
 ('120403','JUNIN','JAUJA','APATA'),
 ('120404','JUNIN','JAUJA','ATAURA'),
 ('120405','JUNIN','JAUJA','CANCHAYLLO'),
 ('120406','JUNIN','JAUJA','CURICACA'),
 ('120407','JUNIN','JAUJA','EL MANTARO'),
 ('120408','JUNIN','JAUJA','HUAMALI'),
 ('120409','JUNIN','JAUJA','HUARIPAMPA'),
 ('120410','JUNIN','JAUJA','HUERTAS'),
 ('120411','JUNIN','JAUJA','JANJAILLO'),
 ('120412','JUNIN','JAUJA','JULCAN'),
 ('120413','JUNIN','JAUJA','LEONOR ORDONEZ'),
 ('120414','JUNIN','JAUJA','LLOCLLAPAMPA'),
 ('120415','JUNIN','JAUJA','MARCO'),
 ('120416','JUNIN','JAUJA','MASMA'),
 ('120417','JUNIN','JAUJA','MASMA CHICCHE'),
 ('120418','JUNIN','JAUJA','MOLINOS'),
 ('120419','JUNIN','JAUJA','MONOBAMBA'),
 ('120420','JUNIN','JAUJA','MUQUI'),
 ('120421','JUNIN','JAUJA','MUQUIYAUYO'),
 ('120422','JUNIN','JAUJA','PACA'),
 ('120423','JUNIN','JAUJA','PACCHA'),
 ('120424','JUNIN','JAUJA','PANCAN'),
 ('120425','JUNIN','JAUJA','PARCO'),
 ('120426','JUNIN','JAUJA','POMACANCHA'),
 ('120427','JUNIN','JAUJA','RICRAN'),
 ('120428','JUNIN','JAUJA','SAN LORENZO'),
 ('120429','JUNIN','JAUJA','SAN PEDRO DE CHUNAN'),
 ('120430','JUNIN','JAUJA','SAUSA'),
 ('120431','JUNIN','JAUJA','SINCOS'),
 ('120432','JUNIN','JAUJA','TUNAN MARCA'),
 ('120433','JUNIN','JAUJA','YAULI'),
 ('120434','JUNIN','JAUJA','YAUYOS'),
 ('120501','JUNIN','JUNIN','JUNIN'),
 ('120502','JUNIN','JUNIN','CARHUAMAYO'),
 ('120503','JUNIN','JUNIN','ONDORES'),
 ('120504','JUNIN','JUNIN','ULCUMAYO'),
 ('120601','JUNIN','SATIPO','SATIPO'),
 ('120602','JUNIN','SATIPO','COVIRIALI'),
 ('120603','JUNIN','SATIPO','LLAYLLA'),
 ('120604','JUNIN','SATIPO','MAZAMARI'),
 ('120605','JUNIN','SATIPO','PAMPA HERMOSA'),
 ('120606','JUNIN','SATIPO','PANGOA'),
 ('120607','JUNIN','SATIPO','RIO NEGRO'),
 ('120608','JUNIN','SATIPO','RIO TAMBO'),
 ('120609','JUNIN','SATIPO','VIZCATAN DEL ENE'),
 ('120701','JUNIN','TARMA','TARMA'),
 ('120702','JUNIN','TARMA','ACOBAMBA'),
 ('120703','JUNIN','TARMA','HUARICOLCA'),
 ('120704','JUNIN','TARMA','HUASAHUASI'),
 ('120705','JUNIN','TARMA','LA UNION'),
 ('120706','JUNIN','TARMA','PALCA'),
 ('120707','JUNIN','TARMA','PALCAMAYO'),
 ('120708','JUNIN','TARMA','SAN PEDRO DE CAJAS'),
 ('120709','JUNIN','TARMA','TAPO'),
 ('120801','JUNIN','YAULI','LA OROYA'),
 ('120802','JUNIN','YAULI','CHACAPALPA'),
 ('120803','JUNIN','YAULI','HUAY-HUAY'),
 ('120804','JUNIN','YAULI','MARCAPOMACOCHA'),
 ('120805','JUNIN','YAULI','MOROCOCHA'),
 ('120806','JUNIN','YAULI','PACCHA'),
 ('120807','JUNIN','YAULI','SANTA BARBARA DE CARHUACAYAN'),
 ('120808','JUNIN','YAULI','SANTA ROSA DE SACCO'),
 ('120809','JUNIN','YAULI','SUITUCANCHA'),
 ('120810','JUNIN','YAULI','YAULI'),
 ('120901','JUNIN','CHUPACA','CHUPACA'),
 ('120902','JUNIN','CHUPACA','AHUAC'),
 ('120903','JUNIN','CHUPACA','CHONGOS BAJO'),
 ('120904','JUNIN','CHUPACA','HUACHAC'),
 ('120905','JUNIN','CHUPACA','HUAMANCACA CHICO'),
 ('120906','JUNIN','CHUPACA','SAN JUAN DE ISCOS'),
 ('120907','JUNIN','CHUPACA','SAN JUAN DE JARPA'),
 ('120908','JUNIN','CHUPACA','TRES DE DICIEMBRE'),
 ('120909','JUNIN','CHUPACA','YANACANCHA'),
 ('130101','LA LIBERTAD','TRUJILLO','TRUJILLO'),
 ('130102','LA LIBERTAD','TRUJILLO','EL PORVENIR'),
 ('130103','LA LIBERTAD','TRUJILLO','FLORENCIA DE MORA'),
 ('130104','LA LIBERTAD','TRUJILLO','HUANCHACO'),
 ('130105','LA LIBERTAD','TRUJILLO','LA ESPERANZA'),
 ('130106','LA LIBERTAD','TRUJILLO','LAREDO'),
 ('130107','LA LIBERTAD','TRUJILLO','MOCHE'),
 ('130108','LA LIBERTAD','TRUJILLO','POROTO'),
 ('130109','LA LIBERTAD','TRUJILLO','SALAVERRY'),
 ('130110','LA LIBERTAD','TRUJILLO','SIMBAL'),
 ('130111','LA LIBERTAD','TRUJILLO','VICTOR LARCO HERRERA'),
 ('130201','LA LIBERTAD','ASCOPE','ASCOPE'),
 ('130202','LA LIBERTAD','ASCOPE','CHICAMA'),
 ('130203','LA LIBERTAD','ASCOPE','CHOCOPE'),
 ('130204','LA LIBERTAD','ASCOPE','MAGDALENA DE CAO'),
 ('130205','LA LIBERTAD','ASCOPE','PAIJAN'),
 ('130206','LA LIBERTAD','ASCOPE','RAZURI'),
 ('130207','LA LIBERTAD','ASCOPE','SANTIAGO DE CAO'),
 ('130208','LA LIBERTAD','ASCOPE','CASA GRANDE'),
 ('130301','LA LIBERTAD','BOLIVAR','BOLIVAR'),
 ('130302','LA LIBERTAD','BOLIVAR','BAMBAMARCA'),
 ('130303','LA LIBERTAD','BOLIVAR','CONDORMARCA'),
 ('130304','LA LIBERTAD','BOLIVAR','LONGOTEA'),
 ('130305','LA LIBERTAD','BOLIVAR','UCHUMARCA'),
 ('130306','LA LIBERTAD','BOLIVAR','UCUNCHA'),
 ('130401','LA LIBERTAD','CHEPEN','CHEPEN'),
 ('130402','LA LIBERTAD','CHEPEN','PACANGA'),
 ('130403','LA LIBERTAD','CHEPEN','PUEBLO NUEVO'),
 ('130501','LA LIBERTAD','JULCAN','JULCAN'),
 ('130502','LA LIBERTAD','JULCAN','CALAMARCA'),
 ('130503','LA LIBERTAD','JULCAN','CARABAMBA'),
 ('130504','LA LIBERTAD','JULCAN','HUASO'),
 ('130601','LA LIBERTAD','OTUZCO','OTUZCO'),
 ('130602','LA LIBERTAD','OTUZCO','AGALLPAMPA'),
 ('130604','LA LIBERTAD','OTUZCO','CHARAT'),
 ('130605','LA LIBERTAD','OTUZCO','HUARANCHAL'),
 ('130606','LA LIBERTAD','OTUZCO','LA CUESTA'),
 ('130608','LA LIBERTAD','OTUZCO','MACHE'),
 ('130610','LA LIBERTAD','OTUZCO','PARANDAY'),
 ('130611','LA LIBERTAD','OTUZCO','SALPO'),
 ('130613','LA LIBERTAD','OTUZCO','SINSICAP'),
 ('130614','LA LIBERTAD','OTUZCO','USQUIL'),
 ('130701','LA LIBERTAD','PACASMAYO','SAN PEDRO DE LLOC'),
 ('130702','LA LIBERTAD','PACASMAYO','GUADALUPE'),
 ('130703','LA LIBERTAD','PACASMAYO','JEQUETEPEQUE'),
 ('130704','LA LIBERTAD','PACASMAYO','PACASMAYO'),
 ('130705','LA LIBERTAD','PACASMAYO','SAN JOSE'),
 ('130801','LA LIBERTAD','PATAZ','TAYABAMBA'),
 ('130802','LA LIBERTAD','PATAZ','BULDIBUYO'),
 ('130803','LA LIBERTAD','PATAZ','CHILLIA'),
 ('130804','LA LIBERTAD','PATAZ','HUANCASPATA'),
 ('130805','LA LIBERTAD','PATAZ','HUAYLILLAS'),
 ('130806','LA LIBERTAD','PATAZ','HUAYO'),
 ('130807','LA LIBERTAD','PATAZ','ONGON'),
 ('130808','LA LIBERTAD','PATAZ','PARCOY'),
 ('130809','LA LIBERTAD','PATAZ','PATAZ'),
 ('130810','LA LIBERTAD','PATAZ','PIAS'),
 ('130811','LA LIBERTAD','PATAZ','SANTIAGO DE CHALLAS'),
 ('130812','LA LIBERTAD','PATAZ','TAURIJA'),
 ('130813','LA LIBERTAD','PATAZ','URPAY'),
 ('130901','LA LIBERTAD','SANCHEZ CARRION','HUAMACHUCO'),
 ('130902','LA LIBERTAD','SANCHEZ CARRION','CHUGAY'),
 ('130903','LA LIBERTAD','SANCHEZ CARRION','COCHORCO'),
 ('130904','LA LIBERTAD','SANCHEZ CARRION','CURGOS'),
 ('130905','LA LIBERTAD','SANCHEZ CARRION','MARCABAL'),
 ('130906','LA LIBERTAD','SANCHEZ CARRION','SANAGORAN'),
 ('130907','LA LIBERTAD','SANCHEZ CARRION','SARIN'),
 ('130908','LA LIBERTAD','SANCHEZ CARRION','SARTIMBAMBA'),
 ('131001','LA LIBERTAD','SANTIAGO DE CHUCO','SANTIAGO DE CHUCO'),
 ('131002','LA LIBERTAD','SANTIAGO DE CHUCO','ANGASMARCA'),
 ('131003','LA LIBERTAD','SANTIAGO DE CHUCO','CACHICADAN'),
 ('131004','LA LIBERTAD','SANTIAGO DE CHUCO','MOLLEBAMBA'),
 ('131005','LA LIBERTAD','SANTIAGO DE CHUCO','MOLLEPATA'),
 ('131006','LA LIBERTAD','SANTIAGO DE CHUCO','QUIRUVILCA'),
 ('131007','LA LIBERTAD','SANTIAGO DE CHUCO','SANTA CRUZ DE CHUCA'),
 ('131008','LA LIBERTAD','SANTIAGO DE CHUCO','SITABAMBA'),
 ('131101','LA LIBERTAD','GRAN CHIMU','CASCAS'),
 ('131102','LA LIBERTAD','GRAN CHIMU','LUCMA'),
 ('131103','LA LIBERTAD','GRAN CHIMU','MARMOT'),
 ('131104','LA LIBERTAD','GRAN CHIMU','SAYAPULLO'),
 ('131201','LA LIBERTAD','VIRU','VIRU'),
 ('131202','LA LIBERTAD','VIRU','CHAO'),
 ('131203','LA LIBERTAD','VIRU','GUADALUPITO'),
 ('140101','LAMBAYEQUE','CHICLAYO','CHICLAYO'),
 ('140102','LAMBAYEQUE','CHICLAYO','CHONGOYAPE'),
 ('140103','LAMBAYEQUE','CHICLAYO','ETEN'),
 ('140104','LAMBAYEQUE','CHICLAYO','ETEN PUERTO'),
 ('140105','LAMBAYEQUE','CHICLAYO','JOSE LEONARDO ORTIZ'),
 ('140106','LAMBAYEQUE','CHICLAYO','LA VICTORIA'),
 ('140107','LAMBAYEQUE','CHICLAYO','LAGUNAS'),
 ('140108','LAMBAYEQUE','CHICLAYO','MONSEFU'),
 ('140109','LAMBAYEQUE','CHICLAYO','NUEVA ARICA'),
 ('140110','LAMBAYEQUE','CHICLAYO','OYOTUN'),
 ('140111','LAMBAYEQUE','CHICLAYO','PICSI'),
 ('140112','LAMBAYEQUE','CHICLAYO','PIMENTEL'),
 ('140113','LAMBAYEQUE','CHICLAYO','REQUE'),
 ('140114','LAMBAYEQUE','CHICLAYO','SANTA ROSA'),
 ('140115','LAMBAYEQUE','CHICLAYO','SANA'),
 ('140116','LAMBAYEQUE','CHICLAYO','CAYALTI'),
 ('140117','LAMBAYEQUE','CHICLAYO','PATAPO'),
 ('140118','LAMBAYEQUE','CHICLAYO','POMALCA'),
 ('140119','LAMBAYEQUE','CHICLAYO','PUCALA'),
 ('140120','LAMBAYEQUE','CHICLAYO','TUMAN'),
 ('140201','LAMBAYEQUE','FERRENAFE','FERRENAFE'),
 ('140202','LAMBAYEQUE','FERRENAFE','CANARIS'),
 ('140203','LAMBAYEQUE','FERRENAFE','INCAHUASI'),
 ('140204','LAMBAYEQUE','FERRENAFE','MANUEL ANTONIO MESONES MURO'),
 ('140205','LAMBAYEQUE','FERRENAFE','PITIPO'),
 ('140206','LAMBAYEQUE','FERRENAFE','PUEBLO NUEVO'),
 ('140301','LAMBAYEQUE','LAMBAYEQUE','LAMBAYEQUE'),
 ('140302','LAMBAYEQUE','LAMBAYEQUE','CHOCHOPE'),
 ('140303','LAMBAYEQUE','LAMBAYEQUE','ILLIMO'),
 ('140304','LAMBAYEQUE','LAMBAYEQUE','JAYANCA'),
 ('140305','LAMBAYEQUE','LAMBAYEQUE','MOCHUMI'),
 ('140306','LAMBAYEQUE','LAMBAYEQUE','MORROPE'),
 ('140307','LAMBAYEQUE','LAMBAYEQUE','MOTUPE'),
 ('140308','LAMBAYEQUE','LAMBAYEQUE','OLMOS'),
 ('140309','LAMBAYEQUE','LAMBAYEQUE','PACORA'),
 ('140310','LAMBAYEQUE','LAMBAYEQUE','SALAS'),
 ('140311','LAMBAYEQUE','LAMBAYEQUE','SAN JOSE'),
 ('140312','LAMBAYEQUE','LAMBAYEQUE','TUCUME'),
 ('150101','LIMA','LIMA','LIMA'),
 ('150102','LIMA','LIMA','ANCON'),
 ('150103','LIMA','LIMA','ATE'),
 ('150104','LIMA','LIMA','BARRANCO'),
 ('150105','LIMA','LIMA','BRENA'),
 ('150106','LIMA','LIMA','CARABAYLLO'),
 ('150107','LIMA','LIMA','CHACLACAYO'),
 ('150108','LIMA','LIMA','CHORRILLOS'),
 ('150109','LIMA','LIMA','CIENEGUILLA'),
 ('150110','LIMA','LIMA','COMAS'),
 ('150111','LIMA','LIMA','EL AGUSTINO'),
 ('150112','LIMA','LIMA','INDEPENDENCIA'),
 ('150113','LIMA','LIMA','JESUS MARIA'),
 ('150114','LIMA','LIMA','LA MOLINA'),
 ('150115','LIMA','LIMA','LA VICTORIA'),
 ('150116','LIMA','LIMA','LINCE'),
 ('150117','LIMA','LIMA','LOS OLIVOS'),
 ('150118','LIMA','LIMA','LURIGANCHO'),
 ('150119','LIMA','LIMA','LURIN'),
 ('150120','LIMA','LIMA','MAGDALENA DEL MAR'),
 ('150121','LIMA','LIMA','PUEBLO LIBRE');
INSERT INTO `ubigeo` (`codigo`,`dpto`,`prov`,`dist`) VALUES 
 ('150122','LIMA','LIMA','MIRAFLORES'),
 ('150123','LIMA','LIMA','PACHACAMAC'),
 ('150124','LIMA','LIMA','PUCUSANA'),
 ('150125','LIMA','LIMA','PUENTE PIEDRA'),
 ('150126','LIMA','LIMA','PUNTA HERMOSA'),
 ('150127','LIMA','LIMA','PUNTA NEGRA'),
 ('150128','LIMA','LIMA','RIMAC'),
 ('150129','LIMA','LIMA','SAN BARTOLO'),
 ('150130','LIMA','LIMA','SAN BORJA'),
 ('150131','LIMA','LIMA','SAN ISIDRO'),
 ('150132','LIMA','LIMA','SAN JUAN DE LURIGANCHO'),
 ('150133','LIMA','LIMA','SAN JUAN DE MIRAFLORES'),
 ('150134','LIMA','LIMA','SAN LUIS'),
 ('150135','LIMA','LIMA','SAN MARTIN DE PORRES'),
 ('150136','LIMA','LIMA','SAN MIGUEL'),
 ('150137','LIMA','LIMA','SANTA ANITA'),
 ('150138','LIMA','LIMA','SANTA MARIA DEL MAR'),
 ('150139','LIMA','LIMA','SANTA ROSA'),
 ('150140','LIMA','LIMA','SANTIAGO DE SURCO'),
 ('150141','LIMA','LIMA','SURQUILLO'),
 ('150142','LIMA','LIMA','VILLA EL SALVADOR'),
 ('150143','LIMA','LIMA','VILLA MARIA DEL TRIUNFO'),
 ('150201','LIMA','BARRANCA','BARRANCA'),
 ('150202','LIMA','BARRANCA','PARAMONGA'),
 ('150203','LIMA','BARRANCA','PATIVILCA'),
 ('150204','LIMA','BARRANCA','SUPE'),
 ('150205','LIMA','BARRANCA','SUPE PUERTO'),
 ('150301','LIMA','CAJATAMBO','CAJATAMBO'),
 ('150302','LIMA','CAJATAMBO','COPA'),
 ('150303','LIMA','CAJATAMBO','GORGOR'),
 ('150304','LIMA','CAJATAMBO','HUANCAPON'),
 ('150305','LIMA','CAJATAMBO','MANAS'),
 ('150401','LIMA','CANTA','CANTA'),
 ('150402','LIMA','CANTA','ARAHUAY'),
 ('150403','LIMA','CANTA','HUAMANTANGA'),
 ('150404','LIMA','CANTA','HUAROS'),
 ('150405','LIMA','CANTA','LACHAQUI'),
 ('150406','LIMA','CANTA','SAN BUENAVENTURA'),
 ('150407','LIMA','CANTA','SANTA ROSA DE QUIVES'),
 ('150501','LIMA','CANETE','SAN VICENTE DE CANETE'),
 ('150502','LIMA','CANETE','ASIA'),
 ('150503','LIMA','CANETE','CALANGO'),
 ('150504','LIMA','CANETE','CERRO AZUL'),
 ('150505','LIMA','CANETE','CHILCA'),
 ('150506','LIMA','CANETE','COAYLLO'),
 ('150507','LIMA','CANETE','IMPERIAL'),
 ('150508','LIMA','CANETE','LUNAHUANA'),
 ('150509','LIMA','CANETE','MALA'),
 ('150510','LIMA','CANETE','NUEVO IMPERIAL'),
 ('150511','LIMA','CANETE','PACARAN'),
 ('150512','LIMA','CANETE','QUILMANA'),
 ('150513','LIMA','CANETE','SAN ANTONIO'),
 ('150514','LIMA','CANETE','SAN LUIS'),
 ('150515','LIMA','CANETE','SANTA CRUZ DE FLORES'),
 ('150516','LIMA','CANETE','ZUNIGA'),
 ('150601','LIMA','HUARAL','HUARAL'),
 ('150602','LIMA','HUARAL','ATAVILLOS ALTO'),
 ('150603','LIMA','HUARAL','ATAVILLOS BAJO'),
 ('150604','LIMA','HUARAL','AUCALLAMA'),
 ('150605','LIMA','HUARAL','CHANCAY'),
 ('150606','LIMA','HUARAL','IHUARI'),
 ('150607','LIMA','HUARAL','LAMPIAN'),
 ('150608','LIMA','HUARAL','PACARAOS'),
 ('150609','LIMA','HUARAL','SAN MIGUEL DE ACOS'),
 ('150610','LIMA','HUARAL','SANTA CRUZ DE ANDAMARCA'),
 ('150611','LIMA','HUARAL','SUMBILCA'),
 ('150612','LIMA','HUARAL','VEINTISIETE DE NOVIEMBRE'),
 ('150701','LIMA','HUAROCHIRI','MATUCANA'),
 ('150702','LIMA','HUAROCHIRI','ANTIOQUIA'),
 ('150703','LIMA','HUAROCHIRI','CALLAHUANCA'),
 ('150704','LIMA','HUAROCHIRI','CARAMPOMA'),
 ('150705','LIMA','HUAROCHIRI','CHICLA'),
 ('150706','LIMA','HUAROCHIRI','CUENCA'),
 ('150707','LIMA','HUAROCHIRI','HUACHUPAMPA'),
 ('150708','LIMA','HUAROCHIRI','HUANZA'),
 ('150709','LIMA','HUAROCHIRI','HUAROCHIRI'),
 ('150710','LIMA','HUAROCHIRI','LAHUAYTAMBO'),
 ('150711','LIMA','HUAROCHIRI','LANGA'),
 ('150712','LIMA','HUAROCHIRI','LARAOS'),
 ('150713','LIMA','HUAROCHIRI','MARIATANA'),
 ('150714','LIMA','HUAROCHIRI','RICARDO PALMA'),
 ('150715','LIMA','HUAROCHIRI','SAN ANDRES DE TUPICOCHA'),
 ('150716','LIMA','HUAROCHIRI','SAN ANTONIO'),
 ('150717','LIMA','HUAROCHIRI','SAN BARTOLOME'),
 ('150718','LIMA','HUAROCHIRI','SAN DAMIAN'),
 ('150719','LIMA','HUAROCHIRI','SAN JUAN DE IRIS'),
 ('150720','LIMA','HUAROCHIRI','SAN JUAN DE TANTARANCHE'),
 ('150721','LIMA','HUAROCHIRI','SAN LORENZO DE QUINTI'),
 ('150722','LIMA','HUAROCHIRI','SAN MATEO'),
 ('150723','LIMA','HUAROCHIRI','SAN MATEO DE OTAO'),
 ('150724','LIMA','HUAROCHIRI','SAN PEDRO DE CASTA'),
 ('150725','LIMA','HUAROCHIRI','SAN PEDRO DE HUANCAYRE'),
 ('150726','LIMA','HUAROCHIRI','SANGALLAYA'),
 ('150727','LIMA','HUAROCHIRI','SANTA CRUZ DE COCACHACRA'),
 ('150728','LIMA','HUAROCHIRI','SANTA EULALIA'),
 ('150729','LIMA','HUAROCHIRI','SANTIAGO DE ANCHUCAYA'),
 ('150730','LIMA','HUAROCHIRI','SANTIAGO DE TUNA'),
 ('150731','LIMA','HUAROCHIRI','SANTO DOMINGO DE LOS OLLEROS'),
 ('150732','LIMA','HUAROCHIRI','SURCO'),
 ('150801','LIMA','HUAURA','HUACHO'),
 ('150802','LIMA','HUAURA','AMBAR'),
 ('150803','LIMA','HUAURA','CALETA DE CARQUIN'),
 ('150804','LIMA','HUAURA','CHECRAS'),
 ('150805','LIMA','HUAURA','HUALMAY'),
 ('150806','LIMA','HUAURA','HUAURA'),
 ('150807','LIMA','HUAURA','LEONCIO PRADO'),
 ('150808','LIMA','HUAURA','PACCHO'),
 ('150809','LIMA','HUAURA','SANTA LEONOR'),
 ('150810','LIMA','HUAURA','SANTA MARIA'),
 ('150811','LIMA','HUAURA','SAYAN'),
 ('150812','LIMA','HUAURA','VEGUETA'),
 ('150901','LIMA','OYON','OYON'),
 ('150902','LIMA','OYON','ANDAJES'),
 ('150903','LIMA','OYON','CAUJUL'),
 ('150904','LIMA','OYON','COCHAMARCA'),
 ('150905','LIMA','OYON','NAVAN'),
 ('150906','LIMA','OYON','PACHANGARA'),
 ('151001','LIMA','YAUYOS','YAUYOS'),
 ('151002','LIMA','YAUYOS','ALIS'),
 ('151003','LIMA','YAUYOS','ALLAUCA'),
 ('151004','LIMA','YAUYOS','AYAVIRI'),
 ('151005','LIMA','YAUYOS','AZANGARO'),
 ('151006','LIMA','YAUYOS','CACRA'),
 ('151007','LIMA','YAUYOS','CARANIA'),
 ('151008','LIMA','YAUYOS','CATAHUASI'),
 ('151009','LIMA','YAUYOS','CHOCOS'),
 ('151010','LIMA','YAUYOS','COCHAS'),
 ('151011','LIMA','YAUYOS','COLONIA'),
 ('151012','LIMA','YAUYOS','HONGOS'),
 ('151013','LIMA','YAUYOS','HUAMPARA'),
 ('151014','LIMA','YAUYOS','HUANCAYA'),
 ('151015','LIMA','YAUYOS','HUANGASCAR'),
 ('151016','LIMA','YAUYOS','HUANTAN'),
 ('151017','LIMA','YAUYOS','HUANEC'),
 ('151018','LIMA','YAUYOS','LARAOS'),
 ('151019','LIMA','YAUYOS','LINCHA'),
 ('151020','LIMA','YAUYOS','MADEAN'),
 ('151021','LIMA','YAUYOS','MIRAFLORES'),
 ('151022','LIMA','YAUYOS','OMAS'),
 ('151023','LIMA','YAUYOS','PUTINZA'),
 ('151024','LIMA','YAUYOS','QUINCHES'),
 ('151025','LIMA','YAUYOS','QUINOCAY'),
 ('151026','LIMA','YAUYOS','SAN JOAQUIN'),
 ('151027','LIMA','YAUYOS','SAN PEDRO DE PILAS'),
 ('151028','LIMA','YAUYOS','TANTA'),
 ('151029','LIMA','YAUYOS','TAURIPAMPA'),
 ('151030','LIMA','YAUYOS','TOMAS'),
 ('151031','LIMA','YAUYOS','TUPE'),
 ('151032','LIMA','YAUYOS','VINAC'),
 ('151033','LIMA','YAUYOS','VITIS'),
 ('160101','LORETO','MAYNAS','IQUITOS'),
 ('160102','LORETO','MAYNAS','ALTO NANAY'),
 ('160103','LORETO','MAYNAS','FERNANDO LORES'),
 ('160104','LORETO','MAYNAS','INDIANA'),
 ('160105','LORETO','MAYNAS','LAS AMAZONAS'),
 ('160106','LORETO','MAYNAS','MAZAN'),
 ('160107','LORETO','MAYNAS','NAPO'),
 ('160108','LORETO','MAYNAS','PUNCHANA'),
 ('160110','LORETO','MAYNAS','TORRES CAUSANA'),
 ('160112','LORETO','MAYNAS','BELEN'),
 ('160113','LORETO','MAYNAS','SAN JUAN BAUTISTA'),
 ('160201','LORETO','ALTO AMAZONAS','YURIMAGUAS'),
 ('160202','LORETO','ALTO AMAZONAS','BALSAPUERTO'),
 ('160205','LORETO','ALTO AMAZONAS','JEBEROS'),
 ('160206','LORETO','ALTO AMAZONAS','LAGUNAS'),
 ('160210','LORETO','ALTO AMAZONAS','SANTA CRUZ'),
 ('160211','LORETO','ALTO AMAZONAS','TENIENTE CESAR LOPEZ ROJAS'),
 ('160301','LORETO','LORETO','NAUTA'),
 ('160302','LORETO','LORETO','PARINARI'),
 ('160303','LORETO','LORETO','TIGRE'),
 ('160304','LORETO','LORETO','TROMPETEROS'),
 ('160305','LORETO','LORETO','URARINAS'),
 ('160401','LORETO','MARISCAL RAMON CASTILLA','RAMON CASTILLA'),
 ('160402','LORETO','MARISCAL RAMON CASTILLA','PEBAS'),
 ('160403','LORETO','MARISCAL RAMON CASTILLA','YAVARI'),
 ('160404','LORETO','MARISCAL RAMON CASTILLA','SAN PABLO'),
 ('160501','LORETO','REQUENA','REQUENA'),
 ('160502','LORETO','REQUENA','ALTO TAPICHE'),
 ('160503','LORETO','REQUENA','CAPELO'),
 ('160504','LORETO','REQUENA','EMILIO SAN MARTIN'),
 ('160505','LORETO','REQUENA','MAQUIA'),
 ('160506','LORETO','REQUENA','PUINAHUA'),
 ('160507','LORETO','REQUENA','SAQUENA'),
 ('160508','LORETO','REQUENA','SOPLIN'),
 ('160509','LORETO','REQUENA','TAPICHE'),
 ('160510','LORETO','REQUENA','JENARO HERRERA'),
 ('160511','LORETO','REQUENA','YAQUERANA'),
 ('160601','LORETO','UCAYALI','CONTAMANA'),
 ('160602','LORETO','UCAYALI','INAHUAYA'),
 ('160603','LORETO','UCAYALI','PADRE MARQUEZ'),
 ('160604','LORETO','UCAYALI','PAMPA HERMOSA'),
 ('160605','LORETO','UCAYALI','SARAYACU'),
 ('160606','LORETO','UCAYALI','VARGAS GUERRA'),
 ('160701','LORETO','DATEM DEL MARANON','BARRANCA'),
 ('160702','LORETO','DATEM DEL MARANON','CAHUAPANAS'),
 ('160703','LORETO','DATEM DEL MARANON','MANSERICHE'),
 ('160704','LORETO','DATEM DEL MARANON','MORONA'),
 ('160705','LORETO','DATEM DEL MARANON','PASTAZA'),
 ('160706','LORETO','DATEM DEL MARANON','ANDOAS'),
 ('160801','LORETO','PUTUMAYO','PUTUMAYO'),
 ('160802','LORETO','PUTUMAYO','ROSA PANDURO'),
 ('160803','LORETO','PUTUMAYO','TENIENTE MANUEL CLAVERO'),
 ('160804','LORETO','PUTUMAYO','YAGUAS'),
 ('170101','MADRE DE DIOS','TAMBOPATA','TAMBOPATA'),
 ('170102','MADRE DE DIOS','TAMBOPATA','INAMBARI'),
 ('170103','MADRE DE DIOS','TAMBOPATA','LAS PIEDRAS'),
 ('170104','MADRE DE DIOS','TAMBOPATA','LABERINTO'),
 ('170201','MADRE DE DIOS','MANU','MANU'),
 ('170202','MADRE DE DIOS','MANU','FITZCARRALD'),
 ('170203','MADRE DE DIOS','MANU','MADRE DE DIOS'),
 ('170204','MADRE DE DIOS','MANU','HUEPETUHE'),
 ('170301','MADRE DE DIOS','TAHUAMANU','INAPARI'),
 ('170302','MADRE DE DIOS','TAHUAMANU','IBERIA'),
 ('170303','MADRE DE DIOS','TAHUAMANU','TAHUAMANU'),
 ('180101','MOQUEGUA','MARISCAL NIETO','MOQUEGUA'),
 ('180102','MOQUEGUA','MARISCAL NIETO','CARUMAS'),
 ('180103','MOQUEGUA','MARISCAL NIETO','CUCHUMBAYA'),
 ('180104','MOQUEGUA','MARISCAL NIETO','SAMEGUA'),
 ('180105','MOQUEGUA','MARISCAL NIETO','SAN CRISTOBAL'),
 ('180106','MOQUEGUA','MARISCAL NIETO','TORATA'),
 ('180107','MOQUEGUA','MARISCAL NIETO','SAN ANTONIO'),
 ('180201','MOQUEGUA','GENERAL SANCHEZ CERRO','OMATE'),
 ('180202','MOQUEGUA','GENERAL SANCHEZ CERRO','CHOJATA'),
 ('180203','MOQUEGUA','GENERAL SANCHEZ CERRO','COALAQUE'),
 ('180204','MOQUEGUA','GENERAL SANCHEZ CERRO','ICHUNA'),
 ('180205','MOQUEGUA','GENERAL SANCHEZ CERRO','LA CAPILLA'),
 ('180206','MOQUEGUA','GENERAL SANCHEZ CERRO','LLOQUE'),
 ('180207','MOQUEGUA','GENERAL SANCHEZ CERRO','MATALAQUE'),
 ('180208','MOQUEGUA','GENERAL SANCHEZ CERRO','PUQUINA'),
 ('180209','MOQUEGUA','GENERAL SANCHEZ CERRO','QUINISTAQUILLAS'),
 ('180210','MOQUEGUA','GENERAL SANCHEZ CERRO','UBINAS'),
 ('180211','MOQUEGUA','GENERAL SANCHEZ CERRO','YUNGA'),
 ('180301','MOQUEGUA','ILO','ILO'),
 ('180302','MOQUEGUA','ILO','EL ALGARROBAL'),
 ('180303','MOQUEGUA','ILO','PACOCHA'),
 ('190101','PASCO','PASCO','CHAUPIMARCA'),
 ('190102','PASCO','PASCO','HUACHON'),
 ('190103','PASCO','PASCO','HUARIACA'),
 ('190104','PASCO','PASCO','HUAYLLAY'),
 ('190105','PASCO','PASCO','NINACACA'),
 ('190106','PASCO','PASCO','PALLANCHACRA'),
 ('190107','PASCO','PASCO','PAUCARTAMBO'),
 ('190108','PASCO','PASCO','SAN FRANCISCO DE ASIS DE YARUSYACAN'),
 ('190109','PASCO','PASCO','SIMON BOLIVAR'),
 ('190110','PASCO','PASCO','TICLACAYAN'),
 ('190111','PASCO','PASCO','TINYAHUARCO'),
 ('190112','PASCO','PASCO','VICCO'),
 ('190113','PASCO','PASCO','YANACANCHA'),
 ('190201','PASCO','DANIEL ALCIDES CARRION','YANAHUANCA'),
 ('190202','PASCO','DANIEL ALCIDES CARRION','CHACAYAN'),
 ('190203','PASCO','DANIEL ALCIDES CARRION','GOYLLARISQUIZGA'),
 ('190204','PASCO','DANIEL ALCIDES CARRION','PAUCAR'),
 ('190205','PASCO','DANIEL ALCIDES CARRION','SAN PEDRO DE PILLAO'),
 ('190206','PASCO','DANIEL ALCIDES CARRION','SANTA ANA DE TUSI'),
 ('190207','PASCO','DANIEL ALCIDES CARRION','TAPUC'),
 ('190208','PASCO','DANIEL ALCIDES CARRION','VILCABAMBA'),
 ('190301','PASCO','OXAPAMPA','OXAPAMPA'),
 ('190302','PASCO','OXAPAMPA','CHONTABAMBA'),
 ('190303','PASCO','OXAPAMPA','HUANCABAMBA'),
 ('190304','PASCO','OXAPAMPA','PALCAZU'),
 ('190305','PASCO','OXAPAMPA','POZUZO'),
 ('190306','PASCO','OXAPAMPA','PUERTO BERMUDEZ'),
 ('190307','PASCO','OXAPAMPA','VILLA RICA'),
 ('190308','PASCO','OXAPAMPA','CONSTITUCION'),
 ('200101','PIURA','PIURA','PIURA'),
 ('200104','PIURA','PIURA','CASTILLA'),
 ('200105','PIURA','PIURA','CATACAOS'),
 ('200107','PIURA','PIURA','CURA MORI'),
 ('200108','PIURA','PIURA','EL TALLAN'),
 ('200109','PIURA','PIURA','LA ARENA'),
 ('200110','PIURA','PIURA','LA UNION'),
 ('200111','PIURA','PIURA','LAS LOMAS'),
 ('200114','PIURA','PIURA','TAMBO GRANDE'),
 ('200115','PIURA','PIURA','VEINTISEIS DE OCTUBRE'),
 ('200201','PIURA','AYABACA','AYABACA'),
 ('200202','PIURA','AYABACA','FRIAS'),
 ('200203','PIURA','AYABACA','JILILI'),
 ('200204','PIURA','AYABACA','LAGUNAS'),
 ('200205','PIURA','AYABACA','MONTERO'),
 ('200206','PIURA','AYABACA','PACAIPAMPA'),
 ('200207','PIURA','AYABACA','PAIMAS'),
 ('200208','PIURA','AYABACA','SAPILLICA'),
 ('200209','PIURA','AYABACA','SICCHEZ'),
 ('200210','PIURA','AYABACA','SUYO'),
 ('200301','PIURA','HUANCABAMBA','HUANCABAMBA'),
 ('200302','PIURA','HUANCABAMBA','CANCHAQUE'),
 ('200303','PIURA','HUANCABAMBA','EL CARMEN DE LA FRONTERA'),
 ('200304','PIURA','HUANCABAMBA','HUARMACA'),
 ('200305','PIURA','HUANCABAMBA','LALAQUIZ'),
 ('200306','PIURA','HUANCABAMBA','SAN MIGUEL DE EL FAIQUE'),
 ('200307','PIURA','HUANCABAMBA','SONDOR'),
 ('200308','PIURA','HUANCABAMBA','SONDORILLO'),
 ('200401','PIURA','MORROPON','CHULUCANAS'),
 ('200402','PIURA','MORROPON','BUENOS AIRES'),
 ('200403','PIURA','MORROPON','CHALACO'),
 ('200404','PIURA','MORROPON','LA MATANZA'),
 ('200405','PIURA','MORROPON','MORROPON'),
 ('200406','PIURA','MORROPON','SALITRAL'),
 ('200407','PIURA','MORROPON','SAN JUAN DE BIGOTE'),
 ('200408','PIURA','MORROPON','SANTA CATALINA DE MOSSA'),
 ('200409','PIURA','MORROPON','SANTO DOMINGO'),
 ('200410','PIURA','MORROPON','YAMANGO'),
 ('200501','PIURA','PAITA','PAITA'),
 ('200502','PIURA','PAITA','AMOTAPE'),
 ('200503','PIURA','PAITA','ARENAL'),
 ('200504','PIURA','PAITA','COLAN'),
 ('200505','PIURA','PAITA','LA HUACA'),
 ('200506','PIURA','PAITA','TAMARINDO'),
 ('200507','PIURA','PAITA','VICHAYAL'),
 ('200601','PIURA','SULLANA','SULLANA'),
 ('200602','PIURA','SULLANA','BELLAVISTA'),
 ('200603','PIURA','SULLANA','IGNACIO ESCUDERO'),
 ('200604','PIURA','SULLANA','LANCONES'),
 ('200605','PIURA','SULLANA','MARCAVELICA'),
 ('200606','PIURA','SULLANA','MIGUEL CHECA'),
 ('200607','PIURA','SULLANA','QUERECOTILLO'),
 ('200608','PIURA','SULLANA','SALITRAL'),
 ('200701','PIURA','TALARA','PARINAS'),
 ('200702','PIURA','TALARA','EL ALTO'),
 ('200703','PIURA','TALARA','LA BREA'),
 ('200704','PIURA','TALARA','LOBITOS'),
 ('200705','PIURA','TALARA','LOS ORGANOS'),
 ('200706','PIURA','TALARA','MANCORA'),
 ('200801','PIURA','SECHURA','SECHURA'),
 ('200802','PIURA','SECHURA','BELLAVISTA DE LA UNION'),
 ('200803','PIURA','SECHURA','BERNAL'),
 ('200804','PIURA','SECHURA','CRISTO NOS VALGA'),
 ('200805','PIURA','SECHURA','VICE'),
 ('200806','PIURA','SECHURA','RINCONADA LLICUAR'),
 ('210101','PUNO','PUNO','PUNO'),
 ('210102','PUNO','PUNO','ACORA'),
 ('210103','PUNO','PUNO','AMANTANI'),
 ('210104','PUNO','PUNO','ATUNCOLLA'),
 ('210105','PUNO','PUNO','CAPACHICA'),
 ('210106','PUNO','PUNO','CHUCUITO'),
 ('210107','PUNO','PUNO','COATA'),
 ('210108','PUNO','PUNO','HUATA'),
 ('210109','PUNO','PUNO','MANAZO'),
 ('210110','PUNO','PUNO','PAUCARCOLLA'),
 ('210111','PUNO','PUNO','PICHACANI'),
 ('210112','PUNO','PUNO','PLATERIA'),
 ('210113','PUNO','PUNO','SAN ANTONIO'),
 ('210114','PUNO','PUNO','TIQUILLACA'),
 ('210115','PUNO','PUNO','VILQUE'),
 ('210201','PUNO','AZANGARO','AZANGARO'),
 ('210202','PUNO','AZANGARO','ACHAYA'),
 ('210203','PUNO','AZANGARO','ARAPA'),
 ('210204','PUNO','AZANGARO','ASILLO'),
 ('210205','PUNO','AZANGARO','CAMINACA'),
 ('210206','PUNO','AZANGARO','CHUPA'),
 ('210207','PUNO','AZANGARO','JOSE DOMINGO CHOQUEHUANCA'),
 ('210208','PUNO','AZANGARO','MUNANI'),
 ('210209','PUNO','AZANGARO','POTONI'),
 ('210210','PUNO','AZANGARO','SAMAN'),
 ('210211','PUNO','AZANGARO','SAN ANTON'),
 ('210212','PUNO','AZANGARO','SAN JOSE'),
 ('210213','PUNO','AZANGARO','SAN JUAN DE SALINAS'),
 ('210214','PUNO','AZANGARO','SANTIAGO DE PUPUJA'),
 ('210215','PUNO','AZANGARO','TIRAPATA'),
 ('210301','PUNO','CARABAYA','MACUSANI'),
 ('210302','PUNO','CARABAYA','AJOYANI'),
 ('210303','PUNO','CARABAYA','AYAPATA'),
 ('210304','PUNO','CARABAYA','COASA'),
 ('210305','PUNO','CARABAYA','CORANI'),
 ('210306','PUNO','CARABAYA','CRUCERO'),
 ('210307','PUNO','CARABAYA','ITUATA'),
 ('210308','PUNO','CARABAYA','OLLACHEA'),
 ('210309','PUNO','CARABAYA','SAN GABAN'),
 ('210310','PUNO','CARABAYA','USICAYOS'),
 ('210401','PUNO','CHUCUITO','JULI'),
 ('210402','PUNO','CHUCUITO','DESAGUADERO'),
 ('210403','PUNO','CHUCUITO','HUACULLANI'),
 ('210404','PUNO','CHUCUITO','KELLUYO'),
 ('210405','PUNO','CHUCUITO','PISACOMA'),
 ('210406','PUNO','CHUCUITO','POMATA'),
 ('210407','PUNO','CHUCUITO','ZEPITA'),
 ('210501','PUNO','EL COLLAO','ILAVE'),
 ('210502','PUNO','EL COLLAO','CAPAZO'),
 ('210503','PUNO','EL COLLAO','PILCUYO'),
 ('210504','PUNO','EL COLLAO','SANTA ROSA'),
 ('210505','PUNO','EL COLLAO','CONDURIRI'),
 ('210601','PUNO','HUANCANE','HUANCANE'),
 ('210602','PUNO','HUANCANE','COJATA'),
 ('210603','PUNO','HUANCANE','HUATASANI'),
 ('210604','PUNO','HUANCANE','INCHUPALLA'),
 ('210605','PUNO','HUANCANE','PUSI'),
 ('210606','PUNO','HUANCANE','ROSASPATA'),
 ('210607','PUNO','HUANCANE','TARACO'),
 ('210608','PUNO','HUANCANE','VILQUE CHICO'),
 ('210701','PUNO','LAMPA','LAMPA'),
 ('210702','PUNO','LAMPA','CABANILLA'),
 ('210703','PUNO','LAMPA','CALAPUJA'),
 ('210704','PUNO','LAMPA','NICASIO'),
 ('210705','PUNO','LAMPA','OCUVIRI'),
 ('210706','PUNO','LAMPA','PALCA'),
 ('210707','PUNO','LAMPA','PARATIA'),
 ('210708','PUNO','LAMPA','PUCARA'),
 ('210709','PUNO','LAMPA','SANTA LUCIA'),
 ('210710','PUNO','LAMPA','VILAVILA'),
 ('210801','PUNO','MELGAR','AYAVIRI'),
 ('210802','PUNO','MELGAR','ANTAUTA'),
 ('210803','PUNO','MELGAR','CUPI'),
 ('210804','PUNO','MELGAR','LLALLI'),
 ('210805','PUNO','MELGAR','MACARI'),
 ('210806','PUNO','MELGAR','NUNOA'),
 ('210807','PUNO','MELGAR','ORURILLO'),
 ('210808','PUNO','MELGAR','SANTA ROSA'),
 ('210809','PUNO','MELGAR','UMACHIRI'),
 ('210901','PUNO','MOHO','MOHO'),
 ('210902','PUNO','MOHO','CONIMA'),
 ('210903','PUNO','MOHO','HUAYRAPATA'),
 ('210904','PUNO','MOHO','TILALI'),
 ('211001','PUNO','SAN ANTONIO DE PUTINA','PUTINA'),
 ('211002','PUNO','SAN ANTONIO DE PUTINA','ANANEA'),
 ('211003','PUNO','SAN ANTONIO DE PUTINA','PEDRO VILCA APAZA'),
 ('211004','PUNO','SAN ANTONIO DE PUTINA','QUILCAPUNCU'),
 ('211005','PUNO','SAN ANTONIO DE PUTINA','SINA'),
 ('211101','PUNO','SAN ROMAN','JULIACA'),
 ('211102','PUNO','SAN ROMAN','CABANA'),
 ('211103','PUNO','SAN ROMAN','CABANILLAS'),
 ('211104','PUNO','SAN ROMAN','CARACOTO'),
 ('211105','PUNO','SAN ROMAN','SAN MIGUEL'),
 ('211201','PUNO','SANDIA','SANDIA'),
 ('211202','PUNO','SANDIA','CUYOCUYO'),
 ('211203','PUNO','SANDIA','LIMBANI'),
 ('211204','PUNO','SANDIA','PATAMBUCO'),
 ('211205','PUNO','SANDIA','PHARA'),
 ('211206','PUNO','SANDIA','QUIACA'),
 ('211207','PUNO','SANDIA','SAN JUAN DEL ORO'),
 ('211208','PUNO','SANDIA','YANAHUAYA'),
 ('211209','PUNO','SANDIA','ALTO INAMBARI'),
 ('211210','PUNO','SANDIA','SAN PEDRO DE PUTINA PUNCO'),
 ('211301','PUNO','YUNGUYO','YUNGUYO'),
 ('211302','PUNO','YUNGUYO','ANAPIA'),
 ('211303','PUNO','YUNGUYO','COPANI'),
 ('211304','PUNO','YUNGUYO','CUTURAPI'),
 ('211305','PUNO','YUNGUYO','OLLARAYA'),
 ('211306','PUNO','YUNGUYO','TINICACHI');
INSERT INTO `ubigeo` (`codigo`,`dpto`,`prov`,`dist`) VALUES 
 ('211307','PUNO','YUNGUYO','UNICACHI'),
 ('220101','SAN MARTIN','MOYOBAMBA','MOYOBAMBA'),
 ('220102','SAN MARTIN','MOYOBAMBA','CALZADA'),
 ('220103','SAN MARTIN','MOYOBAMBA','HABANA'),
 ('220104','SAN MARTIN','MOYOBAMBA','JEPELACIO'),
 ('220105','SAN MARTIN','MOYOBAMBA','SORITOR'),
 ('220106','SAN MARTIN','MOYOBAMBA','YANTALO'),
 ('220201','SAN MARTIN','BELLAVISTA','BELLAVISTA'),
 ('220202','SAN MARTIN','BELLAVISTA','ALTO BIAVO'),
 ('220203','SAN MARTIN','BELLAVISTA','BAJO BIAVO'),
 ('220204','SAN MARTIN','BELLAVISTA','HUALLAGA'),
 ('220205','SAN MARTIN','BELLAVISTA','SAN PABLO'),
 ('220206','SAN MARTIN','BELLAVISTA','SAN RAFAEL'),
 ('220301','SAN MARTIN','EL DORADO','SAN JOSE DE SISA'),
 ('220302','SAN MARTIN','EL DORADO','AGUA BLANCA'),
 ('220303','SAN MARTIN','EL DORADO','SAN MARTIN'),
 ('220304','SAN MARTIN','EL DORADO','SANTA ROSA'),
 ('220305','SAN MARTIN','EL DORADO','SHATOJA'),
 ('220401','SAN MARTIN','HUALLAGA','SAPOSOA'),
 ('220402','SAN MARTIN','HUALLAGA','ALTO SAPOSOA'),
 ('220403','SAN MARTIN','HUALLAGA','EL ESLABON'),
 ('220404','SAN MARTIN','HUALLAGA','PISCOYACU'),
 ('220405','SAN MARTIN','HUALLAGA','SACANCHE'),
 ('220406','SAN MARTIN','HUALLAGA','TINGO DE SAPOSOA'),
 ('220501','SAN MARTIN','LAMAS','LAMAS'),
 ('220502','SAN MARTIN','LAMAS','ALONSO DE ALVARADO'),
 ('220503','SAN MARTIN','LAMAS','BARRANQUITA'),
 ('220504','SAN MARTIN','LAMAS','CAYNARACHI'),
 ('220505','SAN MARTIN','LAMAS','CUNUMBUQUI'),
 ('220506','SAN MARTIN','LAMAS','PINTO RECODO'),
 ('220507','SAN MARTIN','LAMAS','RUMISAPA'),
 ('220508','SAN MARTIN','LAMAS','SAN ROQUE DE CUMBAZA'),
 ('220509','SAN MARTIN','LAMAS','SHANAO'),
 ('220510','SAN MARTIN','LAMAS','TABALOSOS'),
 ('220511','SAN MARTIN','LAMAS','ZAPATERO'),
 ('220601','SAN MARTIN','MARISCAL CACERES','JUANJUI'),
 ('220602','SAN MARTIN','MARISCAL CACERES','CAMPANILLA'),
 ('220603','SAN MARTIN','MARISCAL CACERES','HUICUNGO'),
 ('220604','SAN MARTIN','MARISCAL CACERES','PACHIZA'),
 ('220605','SAN MARTIN','MARISCAL CACERES','PAJARILLO'),
 ('220701','SAN MARTIN','PICOTA','PICOTA'),
 ('220702','SAN MARTIN','PICOTA','BUENOS AIRES'),
 ('220703','SAN MARTIN','PICOTA','CASPISAPA'),
 ('220704','SAN MARTIN','PICOTA','PILLUANA'),
 ('220705','SAN MARTIN','PICOTA','PUCACACA'),
 ('220706','SAN MARTIN','PICOTA','SAN CRISTOBAL'),
 ('220707','SAN MARTIN','PICOTA','SAN HILARION'),
 ('220708','SAN MARTIN','PICOTA','SHAMBOYACU'),
 ('220709','SAN MARTIN','PICOTA','TINGO DE PONASA'),
 ('220710','SAN MARTIN','PICOTA','TRES UNIDOS'),
 ('220801','SAN MARTIN','RIOJA','RIOJA'),
 ('220802','SAN MARTIN','RIOJA','AWAJUN'),
 ('220803','SAN MARTIN','RIOJA','ELIAS SOPLIN VARGAS'),
 ('220804','SAN MARTIN','RIOJA','NUEVA CAJAMARCA'),
 ('220805','SAN MARTIN','RIOJA','PARDO MIGUEL'),
 ('220806','SAN MARTIN','RIOJA','POSIC'),
 ('220807','SAN MARTIN','RIOJA','SAN FERNANDO'),
 ('220808','SAN MARTIN','RIOJA','YORONGOS'),
 ('220809','SAN MARTIN','RIOJA','YURACYACU'),
 ('220901','SAN MARTIN','SAN MARTIN','TARAPOTO'),
 ('220902','SAN MARTIN','SAN MARTIN','ALBERTO LEVEAU'),
 ('220903','SAN MARTIN','SAN MARTIN','CACATACHI'),
 ('220904','SAN MARTIN','SAN MARTIN','CHAZUTA'),
 ('220905','SAN MARTIN','SAN MARTIN','CHIPURANA'),
 ('220906','SAN MARTIN','SAN MARTIN','EL PORVENIR'),
 ('220907','SAN MARTIN','SAN MARTIN','HUIMBAYOC'),
 ('220908','SAN MARTIN','SAN MARTIN','JUAN GUERRA'),
 ('220909','SAN MARTIN','SAN MARTIN','LA BANDA DE SHILCAYO'),
 ('220910','SAN MARTIN','SAN MARTIN','MORALES'),
 ('220911','SAN MARTIN','SAN MARTIN','PAPAPLAYA'),
 ('220912','SAN MARTIN','SAN MARTIN','SAN ANTONIO'),
 ('220913','SAN MARTIN','SAN MARTIN','SAUCE'),
 ('220914','SAN MARTIN','SAN MARTIN','SHAPAJA'),
 ('221001','SAN MARTIN','TOCACHE','TOCACHE'),
 ('221002','SAN MARTIN','TOCACHE','NUEVO PROGRESO'),
 ('221003','SAN MARTIN','TOCACHE','POLVORA'),
 ('221004','SAN MARTIN','TOCACHE','SHUNTE'),
 ('221005','SAN MARTIN','TOCACHE','UCHIZA'),
 ('221006','SAN MARTIN','TOCACHE','SANTA LUCIA'),
 ('230101','TACNA','TACNA','TACNA'),
 ('230102','TACNA','TACNA','ALTO DE LA ALIANZA'),
 ('230103','TACNA','TACNA','CALANA'),
 ('230104','TACNA','TACNA','CIUDAD NUEVA'),
 ('230105','TACNA','TACNA','INCLAN'),
 ('230106','TACNA','TACNA','PACHIA'),
 ('230107','TACNA','TACNA','PALCA'),
 ('230108','TACNA','TACNA','POCOLLAY'),
 ('230109','TACNA','TACNA','SAMA'),
 ('230110','TACNA','TACNA','CORONEL GREGORIO ALBARRACIN LANCHIPA'),
 ('230111','TACNA','TACNA','LA YARADA LOS PALOS'),
 ('230201','TACNA','CANDARAVE','CANDARAVE'),
 ('230202','TACNA','CANDARAVE','CAIRANI'),
 ('230203','TACNA','CANDARAVE','CAMILACA'),
 ('230204','TACNA','CANDARAVE','CURIBAYA'),
 ('230205','TACNA','CANDARAVE','HUANUARA'),
 ('230206','TACNA','CANDARAVE','QUILAHUANI'),
 ('230301','TACNA','JORGE BASADRE','LOCUMBA'),
 ('230302','TACNA','JORGE BASADRE','ILABAYA'),
 ('230303','TACNA','JORGE BASADRE','ITE'),
 ('230401','TACNA','TARATA','TARATA'),
 ('230402','TACNA','TARATA','HEROES ALBARRACIN'),
 ('230403','TACNA','TARATA','ESTIQUE'),
 ('230404','TACNA','TARATA','ESTIQUE-PAMPA'),
 ('230405','TACNA','TARATA','SITAJARA'),
 ('230406','TACNA','TARATA','SUSAPAYA'),
 ('230407','TACNA','TARATA','TARUCACHI'),
 ('230408','TACNA','TARATA','TICACO'),
 ('240101','TUMBES','TUMBES','TUMBES'),
 ('240102','TUMBES','TUMBES','CORRALES'),
 ('240103','TUMBES','TUMBES','LA CRUZ'),
 ('240104','TUMBES','TUMBES','PAMPAS DE HOSPITAL'),
 ('240105','TUMBES','TUMBES','SAN JACINTO'),
 ('240106','TUMBES','TUMBES','SAN JUAN DE LA VIRGEN'),
 ('240201','TUMBES','CONTRALMIRANTE VILLAR','ZORRITOS'),
 ('240202','TUMBES','CONTRALMIRANTE VILLAR','CASITAS'),
 ('240203','TUMBES','CONTRALMIRANTE VILLAR','CANOAS DE PUNTA SAL'),
 ('240301','TUMBES','ZARUMILLA','ZARUMILLA'),
 ('240302','TUMBES','ZARUMILLA','AGUAS VERDES'),
 ('240303','TUMBES','ZARUMILLA','MATAPALO'),
 ('240304','TUMBES','ZARUMILLA','PAPAYAL'),
 ('250101','UCAYALI','CORONEL PORTILLO','CALLERIA'),
 ('250102','UCAYALI','CORONEL PORTILLO','CAMPOVERDE'),
 ('250103','UCAYALI','CORONEL PORTILLO','IPARIA'),
 ('250104','UCAYALI','CORONEL PORTILLO','MASISEA'),
 ('250105','UCAYALI','CORONEL PORTILLO','YARINACOCHA'),
 ('250106','UCAYALI','CORONEL PORTILLO','NUEVA REQUENA'),
 ('250107','UCAYALI','CORONEL PORTILLO','MANANTAY'),
 ('250201','UCAYALI','ATALAYA','RAYMONDI'),
 ('250202','UCAYALI','ATALAYA','SEPAHUA'),
 ('250203','UCAYALI','ATALAYA','TAHUANIA'),
 ('250204','UCAYALI','ATALAYA','YURUA'),
 ('250301','UCAYALI','PADRE ABAD','PADRE ABAD'),
 ('250302','UCAYALI','PADRE ABAD','IRAZOLA'),
 ('250303','UCAYALI','PADRE ABAD','CURIMANA'),
 ('250304','UCAYALI','PADRE ABAD','NESHUYA'),
 ('250305','UCAYALI','PADRE ABAD','ALEXANDER VON HUMBOLDT'),
 ('250306','UCAYALI','PADRE ABAD','HUIPOCA'),
 ('250307','UCAYALI','PADRE ABAD','BOQUERON'),
 ('250401','UCAYALI','PURUS','PURUS');
/*!40000 ALTER TABLE `ubigeo` ENABLE KEYS */;


--
-- Definition of table `unese`
--

DROP TABLE IF EXISTS `unese`;
CREATE TABLE `unese` (
  `codigo` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Unese',
  `descrip` varchar(100) DEFAULT '' COMMENT 'Descripcion Unese',
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `unese`
--

/*!40000 ALTER TABLE `unese` DISABLE KEYS */;
INSERT INTO `unese` (`codigo`,`descrip`) VALUES 
 ('10','GRUPO'),
 ('11','EQUIPAR'),
 ('13','RACIONAR'),
 ('14','DISPARO'),
 ('15','PALO'),
 ('16','CIENTO QUINCE KG TAMBOR'),
 ('17','TAMBOR DE CIEN LIBRAS'),
 ('18','FIFTYFIVE GALON TAMBOR (EE.UU.)'),
 ('19','CAMION CISTERNA'),
 ('1A','MILLA COCHE'),
 ('1B','RECUENTO DE COCHE'),
 ('1C','RECUENTO DE LOCOMOTORA'),
 ('1D','RECUENTO DE VAGON DE COLA'),
 ('1E','COCHE VACIO'),
 ('1F','TREN DE MILLA'),
 ('1G','EL USO DE COMBUSTIBLE GALON (EE.UU.)'),
 ('1H','VAGON DE COLA MILLA'),
 ('1I','TIPO DE INTERES FIJO'),
 ('1J','TONELADA MILLA'),
 ('1K','MILLA LOCOMOTORA'),
 ('1L','RECUENTO TOTAL DE COCHE'),
 ('1M','MILLA TOTAL DE AUTOMOVILES'),
 ('1X','CUARTO DE MILLA'),
 ('20','CONTENEDORES DE VEINTE PIES'),
 ('21','CONTENEDOR DE CUARENTA PIES'),
 ('22','DECILITRO POR GRAMO'),
 ('23','GRAMO POR CENTIMETRO CUBICO'),
 ('24','LIBRA TEORICO'),
 ('25','GRAMO POR CENTIMETRO CUADRADO'),
 ('26','TONELADA REAL'),
 ('27','TONELADA TEORICA'),
 ('28','KILOGRAMO POR METRO CUADRADO'),
 ('29','LIBRAS POR MIL PIES CUADRADOS'),
 ('2A','RADIAN POR SEGUNDO'),
 ('2B','RADIAN POR SEGUNDO AL CUADRADO'),
 ('2I','UNIDAD TERMICA BRITANICA POR HORA'),
 ('2J','CENTIMETRO CUBICO POR SEGUNDO'),
 ('2K','PIE CUBICO POR HORA'),
 ('2L','PIES CUBICOS POR MINUTO'),
 ('2M','CENTIMETRO POR SEGUNDO'),
 ('2N','DECIBEL'),
 ('2P','KILOBYTE'),
 ('2Q','KILOBECQUEREL'),
 ('2R','KILOCURIE'),
 ('2U','MEGAGRAMO'),
 ('2V','MEGAGRAMO POR HORA'),
 ('2W','COMPARTIMIENTO'),
 ('2X','METRO POR MINUTO'),
 ('2Y','MILLIR~APNTGEN'),
 ('2Z','MILIVOLTIOS'),
 ('30','CABALLOS DE POTENCIA POR DIA DE AIRE TONELADA METRICA SECA'),
 ('31','COJE PESO'),
 ('32','KILOGRAMOS POR TONELADA METRICA DE AIRE SECO'),
 ('33','METROS CUADRADOS POR GRAMO KILOPASCALES'),
 ('34','KILOPASCALES POR MILIMETRO'),
 ('35','MILILITROS POR SEGUNDO CENTIMETRO CUADRADO'),
 ('36','PIES CUBICOS POR MINUTO POR PIE CUADRADO'),
 ('37','ONZAS POR PIE CUADRADO'),
 ('38','ONZAS POR PIE CUADRADO POR 0,01 PULGADAS'),
 ('3B','MEGAJOULE'),
 ('3C','MANMONTH'),
 ('3E','LIBRA POR LIBRA DE PRODUCTO'),
 ('3G','LIBRAS POR PIEZA DE PRODUCTO'),
 ('3H','KILOGRAMO POR KILOGRAMO DE PRODUCTO'),
 ('3I','KILOGRAMOS POR UNIDAD DE PRODUCTO'),
 ('4','PEQUENO AEROSOL'),
 ('40','MILILITROS POR SEGUNDO'),
 ('41','MILILITRO POR MINUTO'),
 ('43','SUPER SACOS A GRANEL'),
 ('44','KG FIVEHUNDRED BOLSA A GRANEL'),
 ('45','KG THREEHUNDRED BOLSA A GRANEL'),
 ('46','BOLSA A GRANEL CINCUENTA LIBRAS'),
 ('47','BOLSA DE CINCUENTA LIBRAS'),
 ('48','MAYOR CARGA DE LA CABINA'),
 ('4A','BOBINA'),
 ('4B','GORRA'),
 ('4C','CENTISTOKES'),
 ('4E','VEINTE PAQUETE'),
 ('4G','MICROLITRO'),
 ('4H','MICROMETROS (MICRAS)'),
 ('4K','MILIAMPERIOS'),
 ('4L','MEGABYTE'),
 ('4M','MILIGRAMO POR HORA'),
 ('4N','MEGABECQUEREL'),
 ('4O','MICROFARADIOS'),
 ('4P','NEWTON POR METRO'),
 ('4Q','ONZA PULGADAS'),
 ('4R','PIES ONZA'),
 ('4T','PICOFARADIOS'),
 ('4U','LIBRAS POR HORA'),
 ('4W','TONELADA (US) POR HORA'),
 ('4X','KILOLITER POR HORA'),
 ('5','ASCENSOR'),
 ('53','KILOGRAMOS TEORICAS'),
 ('54','TONO TEORICO'),
 ('56','SITAS'),
 ('57','MALLA'),
 ('58','KILOGRAMO NETO'),
 ('59','PARTE POR MILLON'),
 ('5A','BARRIL POR MINUTO'),
 ('5B','LOTE'),
 ('5C','GALON (EE.UU.) POR MIL'),
 ('5E','MMPCS / DIA'),
 ('5F','LIBRAS POR MIL'),
 ('5G','BOMBA'),
 ('5H','ESCENARIO'),
 ('5I','PIE CUBICO ESTANDAR'),
 ('5J','CABALLOS DE POTENCIA HIDRAULICA'),
 ('5K','CONTAR POR MINUTO'),
 ('5P','NIVEL SISMICA'),
 ('5Q','LINEA SISMICA'),
 ('60','POR CIENTO EN PESO'),
 ('61','PARTE POR MIL MILLONES (US)'),
 ('62','POR CIENTO POR 1000 HORAS'),
 ('63','TASA DE FRACASO EN EL TIEMPO'),
 ('64','LIBRAS POR PULGADA CUADRADA, DE CALIBRE'),
 ('66','OERSTED'),
 ('69','ESCALA ESPECIFICA DE PRUEBA'),
 ('71','VOLTIAMPERIO POR LIBRA'),
 ('72','VATIOS POR LIBRA'),
 ('73','TUM AMPERIOS POR CENTIMETRO'),
 ('74','MILIPASCAL'),
 ('76','GAUSS'),
 ('77','MILI PULGADAS'),
 ('78','KILOGAUSS'),
 ('8','MUCHO CALOR'),
 ('80','LIBRAS POR PULGADA CUADRADA ABSOLUTA'),
 ('81','ENRIQUE'),
 ('84','KILOPOUND POR PULGADA CUADRADA'),
 ('85','PIE-LIBRA FUERZA'),
 ('87','LIBRAS POR PIE CUBICO'),
 ('89','EQUILIBRIO'),
 ('90','SEGUNDO UNIVERSALES SAYBOLD'),
 ('91','STOKES'),
 ('92','CALORIAS POR CENTIMETRO CUBICO'),
 ('93','CALORIAS POR GRAMO'),
 ('94','UNIDAD DE ENROLLAMIENTO'),
 ('95','VEINTE MIL GALONES TANKCAR (EE.UU.)'),
 ('96','DIEZ MIL GALONES TANKCAR (EE.UU.)'),
 ('97','DIEZ TAMBOR KG'),
 ('98','QUINCE KG TAMBOR'),
 ('A1','15 C CALORIAS'),
 ('A10','AMPERIOS METRO CUADRADO POR SEGUNDO JULIOS'),
 ('A12','UNIDAD ASTRONOMICA'),
 ('A13','ATTOJOULE'),
 ('A14','GRANERO'),
 ('A15','GRANERO POR VOLTIO DE ELECTRONES'),
 ('A16','GRANERO POR VOLTIO DE ELECTRONES ESTEREORRADIAN,'),
 ('A17','GRANERO POR STERDIAN'),
 ('A18','BECQUEREL POR KILOGRAMO'),
 ('A19','BECQUEREL POR METRO CUBICO'),
 ('A2','AMPERIOS POR CENTIMETRO'),
 ('A20','UNIDAD TERMICA BRITANICA POR SEGUNDO GRADO RANKIN PIES CUADRADOS'),
 ('A21','UNIDAD TERMICA BRITANICA POR GRADO LIBRA RANKIN'),
 ('A22','UNIDAD TERMICA BRITANICA POR SEGUNDO GRADO PIE RANKIN'),
 ('A23','UNIDAD TERMICA BRITANICA POR GRADO HORAS PIES CUADRADOS RANKIN'),
 ('A24','CANDELAS POR METRO CUADRADO'),
 ('A25','VAPEUR CHEVAL'),
 ('A26','MEDIDOR DE COULOMB'),
 ('A27','COULOMB METRO CUADRADO POR VOLTIO'),
 ('A28','CULOMBIO POR CENTIMETRO CUBICO'),
 ('A29','CULOMBIO POR METRO CUBICO'),
 ('A3','AMPERIOS POR MILIMETRO'),
 ('A30','CULOMBIO POR MILIMETRO CUBICO'),
 ('A31','CULOMBIO POR SEGUNDO KILOGRAMO'),
 ('A32','COULOMB POR MOL'),
 ('A33','CULOMBIO POR CENTIMETRO CUADRADO'),
 ('A34','CULOMBIO POR METRO CUADRADO'),
 ('A35','CULOMBIO POR MILIMETRO CUADRADO'),
 ('A36','CENTIMETRO CUBICO POR MOL'),
 ('A37','DECIMETRO CUBICO POR MOL'),
 ('A38','METRO CUBICO POR COULOMB'),
 ('A39','METRO CUBICO POR KILOGRAMO'),
 ('A4','AMPERIOS POR CENTIMETRO CUADRADO'),
 ('A40','METRO CUBICO POR MOL'),
 ('A41','AMPERIOS POR METRO CUADRADO'),
 ('A42','CURIE POR KILOGRAMO'),
 ('A43','TONELAJE DE PESO MUERTO'),
 ('A44','DECALITRO'),
 ('A45','DECAMETRO'),
 ('A47','DECITEX'),
 ('A48','GRADO RANKIN'),
 ('A49','DENIER'),
 ('A5','AMPERIOS METRO CUADRADO'),
 ('A50','SEGUNDO DINAS POR CENTIMETRO CUBICO'),
 ('A51','SEGUNDO DINAS POR CENTIMETRO'),
 ('A52','SEGUNDO DINAS POR CENTIMETRO A LA QUINTA'),
 ('A53','ELECTRONVOLT'),
 ('A54','ELECTRONVOLT POR METRO'),
 ('A55','ELECTRONVOLT METRO CUADRADO'),
 ('A56','ELECTRONVOLT METROS CUADRADOS POR KILOGRAMO'),
 ('A57','ERGIO'),
 ('A58','ERG POR CENTIMETRO'),
 ('A6','AMPERIO POR METRO CUADRADO AL CUADRADO KELVIN'),
 ('A60','ERG POR CENTIMETRO CUBICO'),
 ('A61','ERG POR GRAMO'),
 ('A62','ERG POR GRAMO SEGUNDO'),
 ('A63','ERG POR SEGUNDO'),
 ('A64','ERG POR SEGUNDO CENTIMETRO CUADRADO'),
 ('A65','ERG POR SEGUNDO CENTIMETRO CUADRADO'),
 ('A66','ERG CENTIMETRO CUADRADO'),
 ('A67','ERG CENTIMETRO CUADRADO POR GRAMO'),
 ('A68','EXAJOULE'),
 ('A69','FARADIOS POR METRO'),
 ('A7','AMPERIOS POR MILIMETRO CUADRADO'),
 ('A70','FEMTOJOULE'),
 ('A71','FEMTOMETRO'),
 ('A73','PIE POR SEGUNDO CUADRADO'),
 ('A74','PIE-LIBRA FUERZA POR SEGUNDO'),
 ('A75','TONELADAS DE MERCANCIAS'),
 ('A76','GALON'),
 ('A77','UNIDAD CGS DE GAUSS DE DESPLAZAMIENTO'),
 ('A78','UNIDAD CGS DE GAUSS DE LA CORRIENTE ECLECTICA'),
 ('A79','UNIDAD CGS DE GAUSS DE LA CARGA ELECTRICA'),
 ('A8','SEGUNDO AMPERIOS'),
 ('A80','UNIDAD CGS DE GAUSS DE INTENSIDAD DE CAMPO ELECTRICO'),
 ('A81','UNIDAD CGS DE GAUSS DE POLARIZACION ELECTRICA'),
 ('A82','UNIDAD CGS DE GAUSS DE POTENCIAL ELECTRICO'),
 ('A83','UNIDAD CGS DE GAUSS DE MAGNETIZACION'),
 ('A84','GIGACOULOMB POR METRO CUBICO'),
 ('A85','GIGAELECTRONVOLT'),
 ('A86','GIGAHERCIOS'),
 ('A87','GIGAOHM'),
 ('A88','MEDIDOR DE GIGAOHMIO'),
 ('A89','GIGAPASCAL'),
 ('A9','TARIFA'),
 ('A90','GIGAVATIOS'),
 ('A91','GON'),
 ('A93','GRAMO POR METRO CUBICO'),
 ('A94','GRAMO POR MOL'),
 ('A95','GRIS'),
 ('A96','GRIS POR SEGUNDO'),
 ('A97','HECTOPASCAL'),
 ('A98','HENRY POR METRO'),
 ('AA','PELOTA'),
 ('AB','PAQUETE A GRANEL'),
 ('ACR','ACRE'),
 ('AD','BYTE'),
 ('AE','AMPERIO POR METRO'),
 ('AH','MINUTO ADICIONAL'),
 ('AI','MINUTO Y MEDIO POR LLAMADA'),
 ('AJ','POLICIA'),
 ('AK','BRAZA'),
 ('AL','LINEA DE ACCESO'),
 ('AM','AMPOLLA'),
 ('AMH','AMPERIO-HORA'),
 ('AMP','AMPERIO'),
 ('ANN','ANO'),
 ('AP','SOLO SE LIBRA DE ALUMINIO'),
 ('APZ','ONZA TROY ONZA O BOTICARIOS'),
 ('AQ','FACTOR ANTI-HEMOFILICO UNIDAD (AHF)'),
 ('AR','SUPOSITORIO'),
 ('ARE','SON'),
 ('AS','SURTIDO'),
 ('ASM','GRADO ALCOHOLICO MASICO'),
 ('ASU','GRADO ALCOHOLICO VOLUMETRICO'),
 ('ATM','ATMOSFERA ESTANDAR'),
 ('ATT','AMBIENTE TECNICO'),
 ('AV','CAPSULA'),
 ('AW','VIAL LLENO DE POLVO'),
 ('AY','ASAMBLEA'),
 ('AZ','UNIDAD TERMICA BRITANICA POR LIBRA'),
 ('B0','BTU POR PIE CUBICO'),
 ('B1','BARRIL (EE.UU.) POR DIA'),
 ('B11','JULIO POR KILOGRAMO KELVIN'),
 ('B12','JULIOS POR METRO'),
 ('B13','JULIOS POR METRO CUADRADO'),
 ('B14','JOULE POR METRO A LA CUARTA POTENCIA'),
 ('B15','JOULE POR MOL'),
 ('B16','JULIOS POR MOL KELVIN'),
 ('B18','SEGUNDO JULIOS'),
 ('B2','LITERA'),
 ('B20','METRO CUADRADO JULIO POR KILOGRAMO'),
 ('B21','KELVIN POR VATIO'),
 ('B22','KILOAMPERIOS'),
 ('B23','KILOAMPERIOS POR METRO CUADRADO'),
 ('B24','KILOAMPERIOS POR METRO'),
 ('B25','KILOBECQUEREL POR KILOGRAMO'),
 ('B26','KILOCOULOMB'),
 ('B27','KILOCOULOMB POR METRO CUBICO'),
 ('B28','KILOCOULOMB POR METRO CUADRADO'),
 ('B29','KILOELECTRONVOLT'),
 ('B3','LIBRA DE BATEO'),
 ('B31','KILOGRAMO METRO POR SEGUNDO'),
 ('B32','KILOGRAMO METRO CUADRADO'),
 ('B33','KILOGRAMO METRO CUADRADO POR SEGUNDO'),
 ('B34','KILOGRAMOS POR DECIMETRO CUBICO'),
 ('B35','KILOGRAMO POR LITRO'),
 ('B36','CALORIAS POR GRAMO TERMOQUIMICO'),
 ('B37','KILOGRAMO-FUERZA'),
 ('B38','METROS KILOGRAMO-FUERZA'),
 ('B39','METROS KILOGRAMO-FUERZA POR SEGUNDO'),
 ('B4','BARRIL, IMPERIAL'),
 ('B40','KILOGRAMO-FUERZA POR METRO CUADRADO'),
 ('B41','KILOJULIOS POR KELVIN'),
 ('B42','KILOJULIOS POR KILOGRAMO'),
 ('B43','KILOJULIOS POR KILOGRAMO KELVIN'),
 ('B44','KILOJULIOS POR MOL'),
 ('B45','KILOMOL'),
 ('B46','KILOMOL POR METRO CUBICO'),
 ('B47','KILONEWTON'),
 ('B48','KILONEWTON METROS'),
 ('B49','KILOOHM'),
 ('B5','PALANQUILLA'),
 ('B50','MEDIDOR DE KILOOHM'),
 ('B51','KILOPOND'),
 ('B52','KILOSECOND'),
 ('B53','KILOSIEMENS'),
 ('B54','KILOSIEMENS POR METRO'),
 ('B55','KILOVOLTIOS POR METRO'),
 ('B56','KILOWEBER POR METRO'),
 ('B57','ANO LUZ'),
 ('B58','LITROS POR MOL'),
 ('B59','LUMEN HORA'),
 ('B6','BOLLO'),
 ('B60','LUMEN POR METRO CUADRADO'),
 ('B61','LUMEN POR VATIO'),
 ('B62','LUMEN SEGUNDO'),
 ('B63','LUX HORA'),
 ('B64','SEGUNDO LUX'),
 ('B65','MAXWELL'),
 ('B66','MEGAAMPERE POR METRO CUADRADO'),
 ('B67','MEGABECQUEREL POR KILOGRAMO'),
 ('B69','MEGACOULOMB POR METRO CUBICO'),
 ('B7','CICLO'),
 ('B70','MEGACOULOMB POR METRO CUADRADO'),
 ('B71','MEGAELECTRONVOLT'),
 ('B72','MEGAGRAMO POR METRO CUBICO'),
 ('B73','MEGANEWTON'),
 ('B74','MEDIDOR DE MEGANEWTON'),
 ('B75','MEGAOHMIO'),
 ('B76','METROS MEGAOHMIO'),
 ('B77','MEGASIEMENS POR METRO'),
 ('B78','MEGAVOLTIO'),
 ('B79','MEGAVOLT POR METRO'),
 ('B8','JULIOS POR METRO CUBICO'),
 ('B81','METRO CUADRADO RECIPROCO SEGUNDO RECIPROCA'),
 ('B83','METROS A LA CUARTA POTENCIA'),
 ('B84','MICROAMPERIOS'),
 ('B85','MICROBAR'),
 ('B86','MICROCULOMBIOS'),
 ('B87','MICROCULOMBIOS POR METRO CUBICO'),
 ('B88','MICROCULOMBIOS POR METRO CUADRADO'),
 ('B89','MICROFARADIOS POR METRO'),
 ('B9','NAPA'),
 ('B90','MICROHENRIO'),
 ('B91','MICROHENRIO POR METRO'),
 ('B92','MICRONEWTON'),
 ('B93','MEDIDOR DE MICRONEWTON'),
 ('B94','MICROOHM'),
 ('B95','MEDIDOR DE MICROOHM'),
 ('B96','MICROPASCAL'),
 ('B97','MICRORADIAN'),
 ('B98','MICROSEGUNDO'),
 ('B99','MICROSIEMENS'),
 ('BAR','BAR'),
 ('BB','CAJA DE BASE'),
 ('BD','TABLERO'),
 ('BE','HAZ'),
 ('BFT','PIE TABLAR'),
 ('BG','BOLSO'),
 ('BH','CEPILLO'),
 ('BHP','POTENCIA AL FRENO'),
 ('BIL','BILLONES DE DOLARES (EE.UU.)'),
 ('BJ','CANGILON'),
 ('BK','CESTA'),
 ('BL','BALA'),
 ('BLD','BARRIL SECO (EE.UU.)'),
 ('BLL','BARRIL (US) (PETROLEO, ETC.)'),
 ('BO','BOTELLA'),
 ('BP','CIENTOS DE PIES TABLARES'),
 ('BQL','BECQUEREL'),
 ('BR','BAR'),
 ('BT','TORNILLO'),
 ('BTU','UNIDAD TERMICA BRITANICA'),
 ('BUA','BUSHEL (US)'),
 ('BUI','BUSHEL (REINO UNIDO)'),
 ('BW','EL PESO DE BASE'),
 ('BX','CAJA'),
 ('BZ','MILLON DE BTU'),
 ('C0','LLAMADA'),
 ('C1','COMPUESTA LIBRA PRODUCTO (PESO TOTAL)'),
 ('C10','MILLIFARAD'),
 ('C11','MILIGALES'),
 ('C12','MILIGRAMO POR METRO'),
 ('C13','MILIGRAY'),
 ('C14','MILIHENRIO'),
 ('C15','MILLIJOULE'),
 ('C16','MILIMETRO POR SEGUNDO'),
 ('C17','MILIMETRO CUADRADO POR SEGUNDO'),
 ('C18','MILIMOLES'),
 ('C19','POR KILOGRAMO MOL'),
 ('C2','CARSET'),
 ('C20','MILINEWTON'),
 ('C22','MILINEWTON POR METRO'),
 ('C23','MEDIDOR DE MILIOHM'),
 ('C24','SEGUNDO MILIPASCAL'),
 ('C25','MILIRRADIAN'),
 ('C26','MILISEGUNDO'),
 ('C27','MILLISIEMENS'),
 ('C28','MILISIEVERT'),
 ('C29','MILITESLAS'),
 ('C3','MICROVOLTIOS POR METRO'),
 ('C30','MILIVOLTIOS POR METRO'),
 ('C31','MILIVATIOS'),
 ('C32','MILIVATIOS POR METRO CUADRADO'),
 ('C33','MILLIWEBER'),
 ('C34','TOPO'),
 ('C35','MOL POR DECIMETRO CUBICO'),
 ('C36','MOL POR METRO CUBICO'),
 ('C38','MOL POR LITRO'),
 ('C39','NA'),
 ('C4','PARTIDO DE CARGA'),
 ('C40','NANOCOULOMB'),
 ('C41','NANOFARADIOS'),
 ('C42','NANOFARADIOS POR METRO'),
 ('C43','NANOHENRY'),
 ('C44','NANOHENRY POR METRO'),
 ('C45','NANOMETROS'),
 ('C46','MEDIDOR DE NANOOHM'),
 ('C47','NANOSEGUNDO'),
 ('C48','NANOTESLA'),
 ('C49','NANOWATT'),
 ('C5','COSTO'),
 ('C50','NEPER'),
 ('C51','NEPER POR SEGUNDO'),
 ('C52','PICOMETRO'),
 ('C53','SEGUNDO NEWTON METRO'),
 ('C54','NEWTON METRO CUADRADO KILOGRAMO AL CUADRADO'),
 ('C55','NEWTON POR METRO CUADRADO'),
 ('C56','NEWTON POR MILIMETRO CUADRADO'),
 ('C57','SEGUNDO NEWTON'),
 ('C58','NEWTON POR METRO SEGUNDO'),
 ('C59','OCTAVA'),
 ('C6','CELDA'),
 ('C60','CENTIMETRO OHMIOS'),
 ('C61','METRO OHM'),
 ('C62','UNO'),
 ('C63','PARSEC'),
 ('C64','POR KELVIN PASCAL'),
 ('C65','PASCAL SEGUNDO'),
 ('C66','PASCAL SEGUNDO POR METRO CUBICO'),
 ('C67','PASCAL SEGUNDO POR METRO'),
 ('C68','PETAJULIO'),
 ('C69','PHON'),
 ('C7','CENTIPOISES'),
 ('C70','MICROMICROAMPERIO'),
 ('C71','PICOCOULOMB'),
 ('C72','PICOFARADIOS POR METRO'),
 ('C73','PICOHENRY'),
 ('C75','PICOWATT'),
 ('C76','PICOWATT POR METRO CUADRADO'),
 ('C77','GAGE LIBRA'),
 ('C78','LIBRA FUERZA'),
 ('C8','MILLICOULOMB POR KILOGRAMO'),
 ('C80','RAD'),
 ('C81','RADIAN'),
 ('C82','RADIAN METRO CUADRADO POR MOL'),
 ('C83','RADIAN METRO CUADRADO POR KILOGRAMO'),
 ('C84','RADIANES POR METRO'),
 ('C86','METRO CUBICO RECIPROCA'),
 ('C87','RECIPROCO METRO CUBICO POR SEGUNDO'),
 ('C88','VOLTIOS DE ELECTRONES RECIPROCA POR METRO CUBICO'),
 ('C89','RECIPROCO HENRY'),
 ('C9','GRUPO BOBINA'),
 ('C90','JULIOS POR METRO CUBICO DE RECIPROCIDAD'),
 ('C91','KELVIN RECIPROCO O KELVIN A LA POTENCIA MENOS UNO'),
 ('C92','MEDIDOR DE RECIPROCIDAD'),
 ('C93','METRO CUADRADO RECIPROCO'),
 ('C94','MINUTOS RECIPROCA'),
 ('C95','MOL RECIPROCA'),
 ('C96','PASCAL RECIPROCO O PASCAL A LA POTENCIA MENOS UNO'),
 ('C97','SEGUNDO RECIPROCA'),
 ('C98','RECIPROCO SEGUNDO POR METRO CUBICO'),
 ('C99','RECIPROCO SEGUNDO POR METRO CUADRADO'),
 ('CA','PODER'),
 ('CCT','LA CAPACIDAD DE CARGA EN TONELADAS METRICAS'),
 ('CDL','CANDELA'),
 ('CEL','GRADO CELSIUS'),
 ('CEN','CIEN'),
 ('CG','TARJETA'),
 ('CGM','CENTIGRAMO'),
 ('CH','ENVASE'),
 ('CJ','CONO'),
 ('CK','CONECTOR'),
 ('CKG','COULOMB POR KILOGRAMO'),
 ('CL','BOBINA'),
 ('CLF','CIENTOS DE LICENCIA'),
 ('CLT','CENTILITRO'),
 ('CMK','CENTIMETRO CUADRADO'),
 ('CMQ','CENTIMETRO CUBICO'),
 ('CMT','CENTIMETRO'),
 ('CNP','CIENTOS DE PAQUETE'),
 ('CNT','CENTAL (REINO UNIDO)'),
 ('CO','GARRAFON'),
 ('COU','CULOMBIO'),
 ('CQ','CARTUCHO'),
 ('CR','CAJA'),
 ('CS','CASO'),
 ('CT','CAJA DE CARTON'),
 ('CTM','QUILATE METRICO'),
 ('CU','VASO'),
 ('CUR','CURIE'),
 ('CV','CUBRIR'),
 ('CWA','CIENTOS DE LIBRAS (CWT) / QUINTAL (EE.UU.)'),
 ('CWI','QUINTAL (REINO UNIDO)'),
 ('CY','CILINDRO'),
 ('CZ','COMBO'),
 ('D1','SEGUNDO RECIPROCA POR ESTEREORRADIAN'),
 ('D10','SIEMENS POR METRO'),
 ('D12','SIEMENS METRO CUADRADO POR MOL'),
 ('D13','SIEVERT'),
 ('D14','MIL YARDAS LINEALES'),
 ('D15','SONE'),
 ('D16','CENTIMETRO CUADRADO POR ERG'),
 ('D17','CENTIMETRO CUADRADO POR ESTEREORRADIAN ERG'),
 ('D18','KELVIN METRO'),
 ('D19','KELVIN METRO CUADRADO POR VATIO'),
 ('D2','RECIPROCO SEGUNDO POR METRO CUADRADO ESTEREORRADIAN'),
 ('D20','METRO CUADRADO POR EFECTO JOULE'),
 ('D21','METROS CUADRADOS POR KILOGRAMO'),
 ('D22','METRO CUADRADO POR MOL'),
 ('D23','GRAMO PLUMA (PROTEINA)'),
 ('D24','METRO CUADRADO POR ESTEREORRADIAN'),
 ('D25','METRO CUADRADO POR ESTEREORRADIAN JULIOS'),
 ('D26','METRO CUADRADO POR SEGUNDO VOLTIOS'),
 ('D27','ESTEREORRADIAN'),
 ('D28','SIFON'),
 ('D29','TERAHERCIOS'),
 ('D30','TERAJULIO'),
 ('D31','TERAVATIOS'),
 ('D32','TERAVATIOS HORA'),
 ('D33','TESLA'),
 ('D34','TEXAS'),
 ('D35','CALORIA TERMOQUIMICA'),
 ('D37','CALORIAS POR GRAMO TERMOQUIMICO KELVIN'),
 ('D38','TERMOQUIMICO CALORIAS CENTIMETRO POR SEGUNDO KELVIN'),
 ('D39','TERMOQUIMICO CALORIAS POR SEGUNDO KELVIN CENTIMETRO CUADRADO'),
 ('D40','MILES DE LITROS'),
 ('D41','TONELADA POR METRO CUBICO'),
 ('D42','ANO TROPICAL'),
 ('D43','UNIDAD DE MASA ATOMICA UNIFICADA'),
 ('D44','VAR'),
 ('D45','VOLTIOS CUADRADO POR CUADRADO KELVIN'),
 ('D46','VOLTIOS - AMPERIOS'),
 ('D47','VOLTIOS POR CENTIMETRO'),
 ('D48','VOLTIOS POR KELVIN'),
 ('D49','MILIVOLTIOS POR KELVIN'),
 ('D5','KILOGRAMOS POR CENTIMETRO CUADRADO'),
 ('D50','VOLTIOS POR METRO'),
 ('D51','VOLTIOS POR MILIMETRO'),
 ('D52','VATIOS POR KELVIN'),
 ('D53','VATIOS POR KELVIN METRO'),
 ('D54','VATIOS POR METRO CUADRADO'),
 ('D55','VATIO POR METRO CUADRADO KELVIN'),
 ('D56','VATIO POR METRO CUADRADO KELVIN A LA CUARTA POTENCIA'),
 ('D57','WATT POR ESTEREORRADIAN'),
 ('D58','VATIOS POR METRO CUADRADO ESTEREORRADIAN'),
 ('D59','WEBER POR METRO'),
 ('D6','R~APNTGEN POR SEGUNDO'),
 ('D60','WEBER POR MILIMETRO'),
 ('D61','MINUTO'),
 ('D62','SEGUNDO'),
 ('D63','LIBRO'),
 ('D64','BLOQUEAR'),
 ('D65','REDONDO'),
 ('D66','CASETE'),
 ('D67','DOLAR POR HORA'),
 ('D69','PULGADA A LA CUARTA POTENCIA'),
 ('D7','EMPAREDADO'),
 ('D70','TABLA INTERNACIONAL (TI) DE CALORIAS'),
 ('D71','TABLA DE CALORIAS INTERNACIONAL (TI) POR SEGUNDO KELVIN CENTIMETRO'),
 ('D72','TABLA DE CALORIAS INTERNACIONAL (TI) POR SEGUNDO KELVIN CENTIMETRO CUADRADO'),
 ('D73','METRO CUADRADO JULIOS'),
 ('D74','KILOGRAMO POR MOL'),
 ('D75','TABLA INTERNACIONAL (TI) DE CALORIAS POR GRAMO'),
 ('D76','TABLA INTERNACIONAL (TI) DE CALORIAS POR GRAMO KELVIN'),
 ('D77','MEGACOULOMB'),
 ('D79','HAZ'),
 ('D8','PUNTUACION DRAIZE'),
 ('D80','MICROVATIO'),
 ('D81','MICROTESLAS'),
 ('D82','MICROVOLTIO'),
 ('D83','MEDIDOR DE MILINEWTON'),
 ('D85','MICROVATIOS POR METRO CUADRADO'),
 ('D86','MILLICOULOMB'),
 ('D87','MILIMOLES POR KILOGRAMO'),
 ('D88','MILLICOULOMB POR METRO CUBICO'),
 ('D89','MILLICOULOMB POR METRO CUADRADO'),
 ('D9','DINAS POR CENTIMETRO CUADRADO'),
 ('D90','METRO CUBICO (NETO)'),
 ('D91','MOVIMIENTO RAPIDO DEL OJO'),
 ('D92','BANDA'),
 ('D93','SEGUNDO POR METRO CUBICO'),
 ('D94','SEGUNDO POR METRO CUBICO RADIAN'),
 ('D95','JOULE POR GRAMO'),
 ('D96','BRUTO LIBRA'),
 ('D97','PALET DE CARGA / UNIDAD'),
 ('D98','LIBRA DE MASA'),
 ('D99','MANGA'),
 ('DAA','DECARE'),
 ('DAD','DIEZ DIA'),
 ('DAY','DIA'),
 ('DB','LIBRA SECA'),
 ('DC','DISCO (DISCO)'),
 ('DD','LA LICENCIATURA'),
 ('DE','ACUERDO'),
 ('DEC','DECADA'),
 ('DG','DECIGRAMO'),
 ('DI','DISPENSADOR'),
 ('DJ','DECAGRAMO'),
 ('DLT','DECILITRO'),
 ('DMK','DECIMETRO CUADRADO'),
 ('DMQ','DECIMETRO CUBICO'),
 ('DMT','DECIMETRO'),
 ('DN','MEDIDOR DE DECINEWTON'),
 ('DPC','DOCENAS DE PIEZAS'),
 ('DPR','DOCENAS DE PARES'),
 ('DPT','PESO DE DESPLAZAMIENTO'),
 ('DQ','REGISTRO DE DATOS'),
 ('DR','TAMBOR'),
 ('DRA','DRAM (EE.UU.)'),
 ('DRI','DRAM (REINO UNIDO)'),
 ('DRL','DOCENA DE ROLLO'),
 ('DRM','DRACMA (REINO UNIDO)'),
 ('DS','MONITOR'),
 ('DT','TONELADA SECA'),
 ('DTN','DECITONELADA'),
 ('DU','DINA'),
 ('DWT','PESO DE VEINTE-CUATRO GRANOS'),
 ('DX','DINAS POR CENTIMETRO'),
 ('DY','LIBRO DE DIRECTORIO'),
 ('DZN','DOCENA'),
 ('DZP','DOCENA DE PAQUETE'),
 ('E2','CINTURON'),
 ('E3','REMOLQUE'),
 ('E4','KILO BRUTO'),
 ('E5','TONELADA METRICA DE LARGO'),
 ('EA','CADA'),
 ('EB','CASILLA DE CORREO ELECTRONICO'),
 ('EC','CADA UNO POR MES'),
 ('EP','ONCE PAQUETE'),
 ('EQ','GALON EQUIVALENTE'),
 ('EV','SOBRE'),
 ('F1','MILES DE PIES CUBICOS POR DIA'),
 ('F9','FIBRA POR CENTIMETRO CUBICO DE AIRE'),
 ('FAH','GRADOS FAHRENHEIT'),
 ('FAR','FARADIO'),
 ('FB','CAMPO'),
 ('FC','MIL PIES CUBICOS'),
 ('FD','MILLONES DE PARTICULAS POR PIE CUBICO'),
 ('FE','PIE DE PISTA'),
 ('FF','100 METRO CUBICO'),
 ('FG','PARCHE TRANSDERMICO'),
 ('FH','MICROMOL'),
 ('FL','TONELADA DE ESCAMAS'),
 ('FM','MILLONES DE PIES CUBICOS'),
 ('FOT','PIE'),
 ('FP','LIBRA POR PIE CUADRADO'),
 ('FR','PIE POR MINUTO'),
 ('FS','PIE POR SEGUNDO'),
 ('FTK','PIE CUADRADO'),
 ('FTQ','PIE CUBICO'),
 ('G2','US GALON POR MINUTO'),
 ('G3','GALONES POR MINUTO IMPERIAL'),
 ('G7','HOJA DE MICROFICHAS'),
 ('GB','GALON (EE.UU.) POR DIA'),
 ('GBQ','GIGABECQUEREL'),
 ('GC','GRAMO POR 100 GRAMOS'),
 ('GD','BARRIL BRUTO'),
 ('GE','LIBRAS POR GALON (US)'),
 ('GF','GRAMO POR METRO (GRAMO POR 100 CENTIMETROS)'),
 ('GFI','GRAMO DE ISOTOPO FISIONABLE'),
 ('GGR','GRAN BRUTO'),
 ('GH','MEDIO GALON (US)'),
 ('GIA','GILL (EE.UU.)'),
 ('GII','GILL (REINO UNIDO)'),
 ('GJ','GRAMO POR MILILITRO'),
 ('GK','GRAMO POR KILOGRAMO'),
 ('GL','GRAMO POR LITRO'),
 ('GLD','GALON SECO (EE.UU.)'),
 ('GLI','GALON (REINO UNIDO)'),
 ('GLL','GALON (EE.UU.)'),
 ('GM','GRAMO POR METRO CUADRADO'),
 ('GN','GALON BRUTO'),
 ('GO','MILIGRAMOS POR METRO CUADRADO'),
 ('GP','MILIGRAMO POR METRO CUBICO'),
 ('GQ','MICROGRAMOS POR METRO CUBICO'),
 ('GRM','GRAMO'),
 ('GRN','GRANO'),
 ('GRO','BRUTO'),
 ('GRT','TONELADA DE REGISTRO BRUTO'),
 ('GT','TONELADA BRUTA'),
 ('GV','GIGAJOULE'),
 ('GW','GALONES POR CADA MIL PIES CUBICOS'),
 ('GWH','GIGAVATIOS HORA'),
 ('GY','PATIO BRUTO'),
 ('GZ','SISTEMA DE GALGA'),
 ('H1','LA MITAD DE LA PAGINA - ELECTRONICA'),
 ('H2','MEDIO LITRO'),
 ('HA','MADEJA'),
 ('HAR','HECTAREA'),
 ('HBA','HECTOBAR'),
 ('HBX','CIEN BOXE'),
 ('HC','CIENTOS DE RECUENTO'),
 ('HD','MEDIA DOCENA'),
 ('HE','CENTESIMA PARTE DE UN QUILATE'),
 ('HF','CIENTOS DE PIES'),
 ('HGM','HECTOGRAMO'),
 ('HH','CIEN PIES CUBICOS'),
 ('HI','CIENTOS DE HOJA'),
 ('HIU','CIENTOS DE UNIDAD INTERNACIONAL'),
 ('HJ','CABALLOS DE POTENCIA METRICA'),
 ('HK','CIENTOS DE KILOGRAMOS'),
 ('HL','CIENTOS DE PIES (LINEAL)'),
 ('HLT','HECTOLITRO'),
 ('HM','MILLAS POR HORA'),
 ('HMQ','MILLONES DE METROS CUBICOS'),
 ('HMT','HECTOMETRO'),
 ('HN','MILIMETRO CONVENCIONAL DE MERCURIO'),
 ('HO','ONZA TROY CIEN'),
 ('HP','MILIMETRO CONVENCIONAL DEL AGUA'),
 ('HPA','HECTOLITRO DE ALCOHOL PURO'),
 ('HS','CIENTOS DE PIES CUADRADOS'),
 ('HT','MEDIA HORA'),
 ('HTZ','HERTZ'),
 ('HUR','HORA'),
 ('HY','CIENTOS DE YARDAS'),
 ('IA','PULGADAS LIBRA (LIBRA PULGADAS)'),
 ('IC','CONTAR POR PULGADA'),
 ('IE','PERSONA'),
 ('IF','PULGADAS DE AGUA'),
 ('II','PULGADA DE COLUMNA'),
 ('IL','PULGADAS POR MINUTO'),
 ('IM','IMPRESION'),
 ('INH','PULGADA'),
 ('INK','PULGADA CUADRADA'),
 ('INQ','EN CUBOS PULGADAS'),
 ('IP','POLIZA DE SEGUROS'),
 ('IT','CONTAR POR CENTIMETRO'),
 ('IU','PULGADAS POR SEGUNDO (VELOCIDAD LINEAL)'),
 ('IV','PULGADA POR SEGUNDO AL CUADRADO (ACELERACION)'),
 ('J2','JULIO POR KILOGRAMO'),
 ('JB','JUMBO'),
 ('JE','JOULE POR KELVIN'),
 ('JG','JARRA'),
 ('JK','MEGAJULIOS POR KILOGRAMO'),
 ('JM','MEGAJULIOS POR METRO CUBICO'),
 ('JO','ARTICULACION'),
 ('JOU','JOULE'),
 ('JR','TARRO'),
 ('K1','LA DEMANDA DE KILOVATIOS'),
 ('K2','LA DEMANDA REACTIVA KILOVOLTIOS AMPERIOS'),
 ('K3','KILOVOLTIOS AMPERIOS HORA REACTIVA'),
 ('K5','KILOVOLTIOS AMPERIOS (REACTIVA)'),
 ('K6','KILOLITER'),
 ('KA','PASTEL'),
 ('KB','KILOCHARACTER'),
 ('KBA','KILOBAR'),
 ('KD','DECIMAL KILOGRAMO'),
 ('KEL','KELVIN'),
 ('KF','KILOPACKET'),
 ('KG','BARRILETE'),
 ('KGM','KILOGRAMO'),
 ('KGS','KILOGRAMO POR SEGUNDO'),
 ('KHZ','KILOHERCIO'),
 ('KI','KILOGRAMO POR MILIMETROS DE ANCHO'),
 ('KJ','KILOSEGMENT'),
 ('KJO','KILOJULIOS'),
 ('KL','KILOGRAMO POR METRO'),
 ('KMH','KILOMETRO POR HORA'),
 ('KMK','KILOMETRO CUADRADO'),
 ('KMQ','KILOGRAMO POR METRO CUBICO'),
 ('KNI','KILOGRAMO DE NITROGENO'),
 ('KNS','KILOGRAMO SUSTANCIA LLAMADA'),
 ('KNT','NUDO'),
 ('KO','MILLIEQUIVALENCE POTASA CAUSTICA POR GRAMO DE PRODUCTO'),
 ('KPA','KILOPASCALES'),
 ('KPH','KILOGRAMO DE HIDROXIDO DE POTASIO (POTASA CAUSTICA)'),
 ('KPO','KILOGRAMO DE OXIDO DE POTASIO'),
 ('KPP','KILOGRAMO DE PENTOXIDO DE FOSFORO (ANHIDRIDO FOSFORICO)'),
 ('KR','KILOR~APNTGEN'),
 ('KS','MILES DE LIBRAS POR PULGADA CUADRADA'),
 ('KSD','KILOGRAMO DE MATERIA SECA DEL 90%'),
 ('KSH','KILOGRAMO DE HIDROXIDO DE SODIO (SODA CAUSTICA)'),
 ('KT','EQUIPO'),
 ('KTM','KILOMETRO'),
 ('KTN','KILOTONES'),
 ('KUR','KILOGRAMO DE URANIO'),
 ('KVA','KILOVOLTIOS - AMPERIOS'),
 ('KVR','KILOVAR'),
 ('KVT','KILOVOLTIO'),
 ('KW','KILOGRAMOS POR MILIMETRO'),
 ('KWH','KILOVATIO HORA'),
 ('KWT','KILOVATIO'),
 ('KX','MILILITRO POR KILOGRAMO'),
 ('L2','LITROS POR MINUTO'),
 ('LA','LIBRAS POR PULGADA CUBICA'),
 ('LBR','LIBRA'),
 ('LBT','TROY LIBRAS (US)'),
 ('LC','CENTIMETRO LINEAL'),
 ('LD','LITROS POR DIA'),
 ('LE','LITE'),
 ('LEF','HOJA'),
 ('LF','PIE LINEAL'),
 ('LH','HORA DE TRABAJO'),
 ('LI','LINEAL PULGADAS'),
 ('LJ','AEROSOL GRANDE'),
 ('LK','ENLAZAR'),
 ('LM','METRO LINEAL'),
 ('LN','LONGITUD'),
 ('LO','MUCHO'),
 ('LP','LIBRA LIQUIDA'),
 ('LPA','LITRO DE ALCOHOL PURO'),
 ('LR','CAPA'),
 ('LS','SUMA GLOBAL'),
 ('LTN','TONELADA (REINO UNIDO) O LONGTON (EE.UU.)'),
 ('LTR','LITRO'),
 ('LUM','LUMEN'),
 ('LUX','LUX'),
 ('LX','YARDA LINEAR POR LIBRA'),
 ('LY','YARDA LINEAR'),
 ('M0','CINTA MAGNETICA'),
 ('M1','MILIGRAMOS POR LITRO'),
 ('M4','VALOR MONETARIO'),
 ('M5','MICROCURIE'),
 ('M7','MICRO PULGADAS'),
 ('M9','MILLON DE BTU POR 1000 PIES CUBICOS'),
 ('MA','MAQUINA POR UNIDAD'),
 ('MAL','MEGA LITROS'),
 ('MAM','MEGAMETRO'),
 ('MAW','MEGAVATIO'),
 ('MBE','MILES DE LADRILLO ESTANDAR EQUIVALENTE'),
 ('MBF','MILES DE PIES TABLARES'),
 ('MBR','MILIBARES'),
 ('MC','MICROGRAMO'),
 ('MCU','MILICURIOS'),
 ('MD','AIRE TONELADA METRICA SECA'),
 ('MF','MILIGRAMOS POR PIE CUADRADO POR CADA LADO'),
 ('MGM','MILIGRAMO'),
 ('MHZ','MEGAHERCIO'),
 ('MIK','MILLA CUADRADA'),
 ('MIL','MIL'),
 ('MIN','MINUTO'),
 ('MIO','MILLON'),
 ('MIU','MILLONES DE UNIDADES INTERNACIONALES'),
 ('MK','MILIGRAMOS POR PULGADA CUADRADA'),
 ('MLD','MIL MILLONES'),
 ('MLT','MILILITRO'),
 ('MMK','MILIMETRO CUADRADO'),
 ('MMQ','MILIMETRO CUBICO'),
 ('MMT','MILIMETRO'),
 ('MON','MES'),
 ('MPA','MEGAPASCALES'),
 ('MQ','MIL METROS'),
 ('MQH','METROS CUBICOS POR HORA'),
 ('MQS','METRO CUBICO POR SEGUNDO'),
 ('MSK','METRO POR SEGUNDO AL CUADRADO'),
 ('MT','ESTERA'),
 ('MTK','METRO CUADRADO'),
 ('MTQ','METRO CUBICO'),
 ('MTR','METRO'),
 ('MTS','METRO POR SEGUNDO'),
 ('MV','NUMERO DE MULTIPLICADORES'),
 ('MVA','MEGAVOLT - AMPERIOS'),
 ('MWH','MEGAVATIO HORA (1000 KW.H)'),
 ('N1','PLUMA DE CALORIAS'),
 ('N2','NUMERO DE LINEAS'),
 ('N3','PUNTO DE IMPRESION'),
 ('NA','MILIGRAMO POR KILOGRAMO'),
 ('NAR','NUMERO DE ARTICULOS'),
 ('NB','BARCAZA'),
 ('NBB','NUMERO DE BOBINAS'),
 ('NC','COCHE'),
 ('NCL','NUMERO DE CELULAS'),
 ('ND','BARRIL NETO'),
 ('NE','LITROS NETO'),
 ('NEW','NEWTON'),
 ('NF','MENSAJE'),
 ('NG','GALONES NETOS (US)'),
 ('NH','MENSAJE DE HORA'),
 ('NI','GALON IMPERIAL NETA'),
 ('NIU','UNIDADES INTERNACIONALES (BIENES)'),
 ('NJ','NUMERO DE PANTALLAS'),
 ('NL','CARGA'),
 ('NMI','MILLA NAUTICA'),
 ('NMP','NUMERO DE PAQUETES'),
 ('NN','TREN'),
 ('NPL','NUMERO DE PARCELAS'),
 ('NPR','NUMERO DE PARES'),
 ('NPT','NUMERO DE PIEZAS'),
 ('NQ','MHO'),
 ('NR','MICROMHO'),
 ('NRL','NUMERO DE ROLLOS'),
 ('NT','TONELADA NETA'),
 ('NTT','TONELADA DE REGISTRO NETO'),
 ('NU','NEWTON METRO'),
 ('NV','VEHICULO'),
 ('NX','PARTE POR MIL'),
 ('NY','LIBRA POR TONELADA METRICA DE AIRE SECO'),
 ('OA','PANEL'),
 ('OHM','OHM'),
 ('ON','ONZAS POR YARDA CUADRADA'),
 ('ONZ','ONZA'),
 ('OP','DOS PAQUETES'),
 ('OT','HORA EXTRA'),
 ('OZ','AV ONZA'),
 ('OZA','ONZA LIQUIDA (EE.UU.)'),
 ('OZI','ONZA LIQUIDA (REINO UNIDO)'),
 ('P0','PAGINA - ELECTRONICA'),
 ('P1','POR CIENTO'),
 ('P2','LIBRAS POR PIE'),
 ('P3','TRES PAQUETES'),
 ('P4','PAQUETE DE CUATRO'),
 ('P5','PAQUETE DE CINCO'),
 ('P6','PAQUETE DE SEIS'),
 ('P7','SIETE PAQUETE'),
 ('P8','PAQUETE DE OCHO'),
 ('P9','NUEVE PAQUETE'),
 ('PA','PAQUETE'),
 ('PAL','PASCAL'),
 ('PB','PAR PULGADAS'),
 ('PD','ALMOHADILLA'),
 ('PE','LIBRA EQUIVALE'),
 ('PF','PALET (ASCENSOR)'),
 ('PG','PLATO'),
 ('PGL','GALON PRUEBA'),
 ('PI','TONO'),
 ('PK','PAQUETE'),
 ('PL','CUBO'),
 ('PM','PORCENTAJE LIBRA'),
 ('PN','NASA'),
 ('PO','LIBRAS POR PULGADA DE LONGITUD'),
 ('PQ','PAGINA POR PULGADA'),
 ('PR','PAR'),
 ('PS','LIBRA-FUERZA POR PULGADA CUADRADA'),
 ('PT','PINTA (EE.UU.)'),
 ('PTD','PINTA SECO (EE.UU.)'),
 ('PTI','PINTA (REINO UNIDO)'),
 ('PTL','MEDIO LITRO DE LIQUIDO (EE.UU.)'),
 ('PU','BANDEJA DE LAS / BANDEJA'),
 ('PV','MEDIA PINTA (EE.UU.)'),
 ('PW','LIBRA POR PULGADA DE ANCHURA'),
 ('PY','PECK SECO (EE.UU.)'),
 ('PZ','PECK SECO (REINO UNIDO)'),
 ('Q3','COMIDA'),
 ('QA','PAGINA - FACSIMIL'),
 ('QAN','TRIMESTRE (DE UN ANO)'),
 ('QB','PAGINA - IMPRESA'),
 ('QD','TRIMESTRE DOCENA'),
 ('QH','CUARTO DE HORA'),
 ('QK','TRIMESTRE KILOGRAMO'),
 ('QR','MANO DE PAPEL'),
 ('QT','CUARTO DE GALON (EE.UU.)'),
 ('QTD','CUARTO SECO (EE.UU.)'),
 ('QTI','CUARTO DE GALON (REINO UNIDO)'),
 ('QTL','CUARTO LIQUIDO (EE.UU.)'),
 ('QTR','TRIMESTRE (REINO UNIDO)'),
 ('R1','PICA'),
 ('R4','CALORIA'),
 ('R9','MIL METROS CUBICOS'),
 ('RA','ESTANTE'),
 ('RD','BARRA'),
 ('RG','ANILLO'),
 ('RH','CORRER O FUNCIONAR HORA'),
 ('RK','RODAR MEDIDA METRICA'),
 ('RL','CARRETE'),
 ('RM','RESMA'),
 ('RN','RESMA MEDIDA METRICA'),
 ('RO','RODAR'),
 ('RP','LIBRA POR RESMA'),
 ('RPM','REVOLUCIONES POR MINUTO'),
 ('RPS','REVOLUCIONES POR SEGUNDO'),
 ('RS','REINICIAR'),
 ('RT','INGRESOS POR TONELADA MILLA'),
 ('RU','CORRER'),
 ('S3','PIE CUADRADO POR SEGUNDO'),
 ('S4','METRO CUADRADO POR SEGUNDO'),
 ('S5','SESENTA CUARTOS DE PULGADA'),
 ('S6','SESION'),
 ('S7','UNIDAD DE ALMACENAMIENTO'),
 ('S8','UNIDAD ESTANDAR DE LA PUBLICIDAD'),
 ('SA','SACO'),
 ('SAN','MEDIO ANO (6 MESES)'),
 ('SCO','PUNTUACION'),
 ('SCR','ESCRUPULO'),
 ('SD','LIBRA SOLIDA'),
 ('SE','SECCION'),
 ('SEC','SEGUNDO'),
 ('SET','CONJUNTO'),
 ('SG','SEGMENTO'),
 ('SHT','TONELADA DE ENVIO'),
 ('SIE','SIEMENS'),
 ('SK','TANKTRUCK DIVIDIDA'),
 ('SL','HOJA DE DESLIZAMIENTO'),
 ('SMI','MILLA (MILLA TERRESTRE)'),
 ('SN','BARRA CUADRADA'),
 ('SO','CARRETE'),
 ('SP','PAQUETE DE ESTANTE'),
 ('SQ','CUADRADO'),
 ('SR','TIRA'),
 ('SS','HOJA DE MEDIDA METRICA'),
 ('SST','CORTA ESTANDAR (7200 COINCIDENCIAS)'),
 ('ST','HOJA'),
 ('STI','PIEDRA (REINO UNIDO)'),
 ('STN','TONELADA (EE.UU.) O TONELADA CORTA (UK / US)'),
 ('SV','PATINAR'),
 ('SW','MADEJA'),
 ('SX','ENVIO'),
 ('T0','LINEA DE TELECOMUNICACIONES EN EL SERVICIO'),
 ('T1','BRUTO DE MIL LIBRAS'),
 ('T3','MILES DE PIEZAS'),
 ('T4','MILES DE BOLSA'),
 ('T5','MILES DE CARCASA'),
 ('T6','MIL GALONES (US)'),
 ('T7','MIL IMPRESIONES'),
 ('T8','MIL PULGADA LINEAL'),
 ('TA','PIE CUBICO DECIMO'),
 ('TAH','KILOAMPERIOS HORAS (HORA MIL AMPERIOS)'),
 ('TC','CAMION'),
 ('TD','TERMIA'),
 ('TE','TOTALIZADOR'),
 ('TF','DIEZ POR YARDA CUADRADA'),
 ('TI','MIL PULGADA CUADRADA'),
 ('TJ','MIL CENTIMETRO CUADRADO'),
 ('TK','TANQUE, RECTANGULAR'),
 ('TL','MIL PIES (LINEAL)'),
 ('TN','ESTANO'),
 ('TNE','TONELADA (TONELADA METRICA)'),
 ('TP','DIEZ PAQUETE'),
 ('TPR','DIEZ PARES'),
 ('TQ','MIL PIES'),
 ('TQD','MILES DE METROS CUBICOS POR DIA'),
 ('TR','DIEZ PIES CUADRADOS'),
 ('TRL','BILLONES (EUR)'),
 ('TS','MIL PIES CUADRADOS'),
 ('TSD','TONELADA DE SUSTANCIA SECA DEL 90%'),
 ('TSH','TONELADA DE VAPOR POR HORA'),
 ('TT','MIL METROS LINEALES'),
 ('TU','TUBO'),
 ('TV','MILES DE KILOGRAMOS'),
 ('TW','MILES DE HOJA'),
 ('TY','TANQUE, CILINDRICA'),
 ('U1','TRATAMIENTO'),
 ('U2','TABLETA'),
 ('UA','TORR'),
 ('UB','LINEA DE TELECOMUNICACIONES EN EL SERVICIO NORMAL'),
 ('UC','PUERTO DE TELECOMUNICACIONES'),
 ('UD','MINUTO DIEZ'),
 ('UE','DECIMA HORA'),
 ('UF','POR EL USO DE LAS TELECOMUNICACIONES DE LINEA MEDIA'),
 ('UH','DIEZ MIL YARDAS'),
 ('UM','MILLONES DE UNIDADES'),
 ('VA','VOLTIOS AMPERIOS POR KILOGRAMO'),
 ('VI','FRASCO'),
 ('VLT','VOLTIO'),
 ('VQ','ABULTAR'),
 ('VS','VISITAR'),
 ('W2','KILO HUMEDA'),
 ('W4','DOS SEMANAS'),
 ('WA','VATIOS POR KILOGRAMO'),
 ('WB','LIBRA MOJADO'),
 ('WCD','CABLE'),
 ('WE','TONELADA HUMEDA'),
 ('WEB','WEBER'),
 ('WEE','SEMANA'),
 ('WG','GALON'),
 ('WH','RUEDA'),
 ('WHR','VATIOS HORA'),
 ('WI','PESO POR PULGADA CUADRADA'),
 ('WM','MES TRABAJANDO'),
 ('WR','ENVOLVER'),
 ('WSD','ESTANDAR'),
 ('WTT','VATIO'),
 ('WW','MILILITRO DE AGUA'),
 ('X1','CADENA'),
 ('YDK','YARDA CUADRADA'),
 ('YDQ','YARDA CUBICA'),
 ('YL','CIENTOS DE YARDAS LINEALES'),
 ('YRD','YARDA'),
 ('YT','YARDAS DIEZ'),
 ('Z1','AEROFURGONETA'),
 ('Z2','PECHO'),
 ('Z3','BARRIL'),
 ('Z4','PIPA'),
 ('Z5','ARRASTRAR'),
 ('Z6','PUNTO DE CONFERENCIAS'),
 ('Z8','LINEA DE AGATA PAGINA DE NOTICIAS'),
 ('ZP','PAGINA'),
 ('ZZ','UNIDADES INTERNACIONALES (SERVICIOS)');
/*!40000 ALTER TABLE `unese` ENABLE KEYS */;


--
-- Definition of table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
CREATE TABLE `unidades` (
  `cod_unid` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Unidad',
  `nom_unid` varchar(30) NOT NULL DEFAULT '' COMMENT 'Descripion',
  `fac_unid` decimal(8,0) NOT NULL DEFAULT 1 COMMENT 'Factor de Unidad',
  `cod_sunat` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Sunat',
  `ple_sunat` char(3) NOT NULL DEFAULT '' COMMENT 'ID PLE Sunat',
  PRIMARY KEY (`cod_unid`) USING BTREE,
  KEY `nom_unid` (`nom_unid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `unidades`
--

/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` (`cod_unid`,`nom_unid`,`fac_unid`,`cod_sunat`,`ple_sunat`) VALUES 
 ('001','UND','1','NIU',''),
 ('002','KILO','1000','KGM',''),
 ('003','LITRO','1000','MLT',''),
 ('004','METRO','1000','MTR',''),
 ('005','UND-SERV','1','ZZ',''),
 ('UND','UNIDAD','1','','');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;


--
-- Definition of table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `use_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `clave` varchar(200) DEFAULT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `token_reset` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`use_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`use_id`,`nombres`,`email`,`clave`,`perfil`,`token_reset`) VALUES 
 (1,'ADMIN','santodomingo@admin.com','h3ct0r$2040','admin',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


--
-- Definition of table `usuariosBK`
--

DROP TABLE IF EXISTS `usuariosBK`;
CREATE TABLE `usuariosBK` (
  `use_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT '',
  `dni` varchar(30) DEFAULT '',
  `clave` varchar(200) DEFAULT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  `fecha_create` timestamp NULL DEFAULT current_timestamp(),
  `token_reset` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`use_id`) USING BTREE,
  KEY `usuarios_ibfk_1` (`idrol`),
  CONSTRAINT `usuariosBK_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `usuarios_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13679 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `usuariosBK`
--

/*!40000 ALTER TABLE `usuariosBK` DISABLE KEYS */;
INSERT INTO `usuariosBK` (`use_id`,`nombres`,`email`,`telefono`,`dni`,`clave`,`perfil`,`idrol`,`fecha_create`,`token_reset`) VALUES 
 (5,'ADMIN','aceadvance@admin.com','','','advanc3$$$%comput3r','admin',1,'2024-06-14 06:51:32',NULL);
/*!40000 ALTER TABLE `usuariosBK` ENABLE KEYS */;


--
-- Definition of trigger `usuarios_BEFORE_INSERT`
--

DROP TRIGGER /*!50030 IF EXISTS */ `usuarios_BEFORE_INSERT`;

DELIMITER $$

CREATE DEFINER = `root`@`190.204.4.127` TRIGGER `usuarios_BEFORE_INSERT` BEFORE INSERT ON `usuariosBK` FOR EACH ROW BEGIN
	SET new.perfil = (select rol FROM usuarios_roles where id=new.idrol);
    END $$

DELIMITER ;

--
-- Definition of table `usuarios_roles`
--

DROP TABLE IF EXISTS `usuarios_roles`;
CREATE TABLE `usuarios_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(200) DEFAULT '',
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `usuarios_roles`
--

/*!40000 ALTER TABLE `usuarios_roles` DISABLE KEYS */;
INSERT INTO `usuarios_roles` (`id`,`rol`,`fecha`,`estado`) VALUES 
 (1,'admin','2024-06-13 20:40:47',1),
 (2,'usuario','2024-06-13 20:41:03',1),
 (3,'usuarios digital','2024-06-13 20:41:09',1),
 (4,'vendedor','2024-06-14 06:34:45',1);
/*!40000 ALTER TABLE `usuarios_roles` ENABLE KEYS */;


--
-- Definition of table `usuarios_vip`
--

DROP TABLE IF EXISTS `usuarios_vip`;
CREATE TABLE `usuarios_vip` (
  `vip_id` int(11) NOT NULL AUTO_INCREMENT,
  `use_id` int(11) DEFAULT 0,
  `vip_estado` int(11) DEFAULT 0,
  `vip_fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`vip_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `usuarios_vip`
--

/*!40000 ALTER TABLE `usuarios_vip` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_vip` ENABLE KEYS */;


--
-- Definition of table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE `vendedor` (
  `codvend` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Personal',
  `nomvend` varchar(35) NOT NULL DEFAULT '' COMMENT 'Apellidos y Nombres',
  `rucvend` varchar(11) NOT NULL DEFAULT '' COMMENT 'Nro de Ruc',
  `dnivend` varchar(8) NOT NULL DEFAULT '' COMMENT 'Nro de Documento',
  `nacvend` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de nacimiento',
  `lugvend` varchar(15) NOT NULL DEFAULT '' COMMENT 'Lugar de nacimiento',
  `sexvend` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Sexo',
  `carvend` varchar(50) NOT NULL DEFAULT '' COMMENT 'Cargo',
  `ingvend` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de ingreso',
  `salvend` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha de cese',
  `dirvend` varchar(35) NOT NULL DEFAULT '' COMMENT 'Direccion',
  `ciuvend` varchar(15) NOT NULL DEFAULT '' COMMENT 'Distrito - Ciudad',
  `telvend` varchar(15) NOT NULL DEFAULT '' COMMENT 'Telefono 1',
  `tel2vend` varchar(15) NOT NULL DEFAULT '' COMMENT 'Telefono 2',
  `mailvend` varchar(35) NOT NULL DEFAULT '' COMMENT 'Email',
  `estadocivil` varchar(10) NOT NULL DEFAULT '' COMMENT 'Estado Civil',
  `tipovend` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Tipo de Personal',
  `activo` char(10) NOT NULL DEFAULT '' COMMENT 'Indica si esta Activo',
  `usuario` char(30) NOT NULL DEFAULT '' COMMENT 'Usuario',
  `clave` char(30) NOT NULL DEFAULT '' COMMENT 'Clave',
  `sucursal` char(1) NOT NULL DEFAULT '' COMMENT 'ID de Sucursal x defecto',
  `almacen` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Almacen x defecto',
  `acceso` text NOT NULL COMMENT 'Config. de Acceso',
  `comitotal` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto Tope de Comision',
  `comiporct` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Porcentaje de Comision',
  `comimoneda` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Comision',
  `comitotal_c` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Monto Tope de Comision Cobranza',
  `comiporct_c` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Porcentaje de Comision Cobranza',
  `comimoneda_c` decimal(1,0) NOT NULL DEFAULT 0 COMMENT 'Moneda de Comision Cobranza',
  `directo` text NOT NULL COMMENT 'Config. de accesos de directos',
  `docs_c` varchar(200) NOT NULL DEFAULT '' COMMENT 'Documentos de Compras',
  `docs_v` varchar(200) NOT NULL DEFAULT '' COMMENT 'Documentos de Ventas',
  `auditdocs_c` varchar(200) NOT NULL DEFAULT '' COMMENT 'Docs de Compras a Auditar',
  `auditdocs_v` varchar(200) NOT NULL DEFAULT '' COMMENT 'Docs de Ventas a Auditar',
  `audit_doc` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Auditoria en Ventas-Compras',
  `audit_bco` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Auditoria en Bancos',
  `seekcod` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag de Busqueda de ID Vacios',
  `maquina` varchar(20) NOT NULL DEFAULT '' COMMENT 'Nombre de Pc desde donde se Conecta',
  `estado` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Estado de Conexion',
  `cartera` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Flag que indica si tiene cartera de clientes',
  `ult_edicion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora de ultima edicion',
  PRIMARY KEY (`codvend`) USING BTREE,
  UNIQUE KEY `usuario` (`usuario`) USING BTREE,
  KEY `dnivend` (`dnivend`) USING BTREE,
  KEY `rucvend` (`rucvend`) USING BTREE,
  KEY `tipovend` (`tipovend`,`nomvend`) USING BTREE,
  KEY `nomvend` (`nomvend`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `vendedor`
--

/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` (`codvend`,`nomvend`,`rucvend`,`dnivend`,`nacvend`,`lugvend`,`sexvend`,`carvend`,`ingvend`,`salvend`,`dirvend`,`ciuvend`,`telvend`,`tel2vend`,`mailvend`,`estadocivil`,`tipovend`,`activo`,`usuario`,`clave`,`sucursal`,`almacen`,`acceso`,`comitotal`,`comiporct`,`comimoneda`,`comitotal_c`,`comiporct_c`,`comimoneda_c`,`directo`,`docs_c`,`docs_v`,`auditdocs_c`,`auditdocs_v`,`audit_doc`,`audit_bco`,`seekcod`,`maquina`,`estado`,`cartera`,`ult_edicion`) VALUES 
 ('000001','ADMINISTRADOR DE SISTEMA','','','0000-00-00','','1','','2001-01-01','0000-00-00','','','','','','','1','A','ADMIN','76919299919E61696960','','','71838383838383838383837E838383838383837E7E83838360838383838383838383838383838383838383835050665E6060605050625E6060607E837E60687E7E33A3919C999491A350506133A3919C999491A350506233A3919C999491A350506433A3919C999491A350506533A3919C999491A350506633A3919C999491A350506833A3919C999491A350616033A3919C999491A350616133A3919C999491A350616333A3919C999491A350616533A3919C999491A350616633A3919C999491A350616833A3919C999491A350616933A3919C999491A350626033A3919C999491A35062663354615E5A3376717383857E71845050613376717383857E71845050633376717383857E71845050643376717383857E71845050663376717383857E71845050683354625E6133739C99959EA495A350506133739C99959EA495A350506333739C99959EA495A350506433739C99959EA495A350506633737C79758F7C7584827150506133737C79758F7C7584827150506333737C79758F7C7584827150506433739C99959EA495A350616033739C99959EA495A35061613354625E623373919A918499959E94915050613373919A918499959E94915050633354625E633380A29FA69595949FA2955050613380A29FA69595949FA2955050633380A29FA69595949FA2955050643380827F868F7C758482715050613380827F868F7C758482715050633380827F868F7C758482715050643380A29FA69595949FA2955061603380A29FA69595949FA2955061613380A29FA69595949FA2955061633354625E643372919E939FA35050613372919E939FA35050623372919E939FA350506333799DA09FA2A491A27D9F50506133799DA09FA2A491A27D9F50506233799DA09FA2A491A27D9F50506333799DA09FA2A491A27D9F50506433799DA09FA2A491A27D9F5050653372919E939FA35050663372919E939FA350506733919C9D9193959E50506133919C9D9193959E50506333919C9D9193959E50506433919C9D9193959E50506533919C9D9193959E5050663354635E6633797E86757E847182797F50506133797E86757E847182797F50506233797E86757E847182797F50506433797E86757E847182797F50506633797E86757E847182797F50506733919C9D9193959E50616033919C9D9193959E5061613354635E693384827E83847F737B835050613384827E83847F737B835050633384827E83847F737B835050643354635E5A3383758279758350506133837582797583505063338375827975835050643383758279758350506633837582797583505068338375827975835050693383758279758350616033919C9D9193959E50626033919C9D9193959E50626133919C9D9193959E506263339795A2959E939991505061339795A2959E939991505062339795A2959E939991505064339795A2959E939991505066339795A2959E939991505067339795A2959E939991505069339795A2959E9399915061603354645E6833739F9D99A3999F9E95A350506133739F9D99A3999F9E95A350506333739F9D99A3999F9E95A350506433739F9D99A3999F9E95A350506533739F9D99A3999F9E95A350506633739F9D99A3999F9E95A350506733739F9D99A3999F9E95A350506833739F9D99A3999F9E95A350616033739F9D99A3999F9E95A350616133739F9D99A3999F9E95A350616233739F9D99A3999F9E95A350616333739F9D99A3999F9E95A350616433739F9D99A3999F9E95A3506165339795A2959E9399915061633354645E5A33717E717C7983798350506133717E717C7983798350506233717E717C7983798350506433717E717C7983798350506533717E717C79837983505066339795A2959E939991506167339795A2959E939991506168339795A2959E939991506169339795A2959E9399915062603354655E61338479757E747183505061338479757E7471835050623354655E623380827F748573847F835050613380827F748573847F835050623380827F748573847F835050633380827F748573847F835050653380827F748573847F835050663380827F748573847F835050683354655E6333829593919C80A29550506133829593919C80A29550506333829593919C80A29550506433829593919C80A2955050653354655E6433718588797C797182758350506133718588797C797182758350506233718588797C797182758350506433718588797C797182758350506533718588797C797182758350506733718588797C79718275835050683354655E6533749F93868471737D8050506133749F93868471737D805050623354655E663376999E919E939995A29F5050613376999E919E939995A29F5050623376999E919E939995A29F5050643376999E919E939995A29F5050653371949D999E99A3A4A2915061613371949D999E99A3A4A2915061623385A4999C95A35050613354665E6333747F73857D757E847F8350506133747F73857D757E847F83505062338395A27495969593A49F505061338395A27495969593A49F5050633385A4999C95A35050653385A4999C95A35050663354665E66338273717C83847B5050613385A4999C95A35050693385A4999C95A35061603385A4999C95A35061623385A4999C95A35061633354665E5A33739FA2A29593A49FA250506133739FA2A29593A49FA25050623354665E5A3384A2919EA39695A2959E5050613384A2919EA39695A2959E5050623384A2919EA39695A2959E5050643384A2919EA39695A2959E5050653384A2919EA39695A2959E5050673384A2919EA39695A2959E5050693385A4999C95A35061683354665E5A3385A4999C95A35062613385A4999C95A350626233','0.00','0.01','2','0.00','0.00','1','101 102 104 105 106 107 108 109 110 111 201 202 203 204 205 301 302','FA PE PS GR IN NI NC OC TS','AB B3 B2 F3 F2 GS GO GI G2 GR G1 G3 N4 N2 NV N5 N3 RR V2 OC PR PW PE TS','FA GR IN NI NC OC TS','GR NV RR PR PW TS',0x01,0x01,0x01,'',0x00,0x00,'2013-09-28 06:09:00');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;


--
-- Definition of table `website`
--

DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `cod_url` char(6) NOT NULL DEFAULT '' COMMENT 'ID de Url',
  `nom_url` varchar(250) NOT NULL DEFAULT '' COMMENT 'Direccion Url',
  PRIMARY KEY (`cod_url`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `website`
--

/*!40000 ALTER TABLE `website` DISABLE KEYS */;
INSERT INTO `website` (`cod_url`,`nom_url`) VALUES 
 ('000001','www.softlinkperu.com'),
 ('000002','www.sunat.gob.pe'),
 ('000003','www.reniec.gob.pe'),
 ('000004','www.inei.gob.pe'),
 ('000005','http://www.sunat.gob.pe/cl-ti-itmrconsruc/jcrS00Alias');
/*!40000 ALTER TABLE `website` ENABLE KEYS */;


--
-- Definition of table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
CREATE TABLE `zonas` (
  `codigo` char(3) NOT NULL DEFAULT '' COMMENT 'ID de Zona',
  `descrip` varchar(50) NOT NULL DEFAULT '' COMMENT 'Descripcion',
  `postal` varchar(10) NOT NULL DEFAULT '' COMMENT 'Postal',
  `region` varchar(15) NOT NULL DEFAULT '' COMMENT 'Provincia',
  `pais` varchar(15) NOT NULL DEFAULT '' COMMENT 'Departamento',
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `descrip` (`descrip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `zonas`
--

/*!40000 ALTER TABLE `zonas` DISABLE KEYS */;
INSERT INTO `zonas` (`codigo`,`descrip`,`postal`,`region`,`pais`) VALUES 
 ('000','[SIN ZONA]','','',''),
 ('001','AREQUIPA','','AREQUIPA','PERU'),
 ('002','LIMA','','LIMA','PERU'),
 ('003','TACNA','','TACNA','PERU'),
 ('004','JULIACA','','PUNO','PERU'),
 ('005','CUSCO','','CUSCO','PERU'),
 ('006','HUANCAYO','','HUANCAYO','PERU'),
 ('007','TRUJILLO','','TRUJILLO','PERU'),
 ('008','PUERTO MALDONADO','','PUERTO MALDONAD','PERU'),
 ('009','PIURA','','PIURA','PERU'),
 ('010','JAEN','','JAEN','PERU'),
 ('011','CAJAMARCA','','CAJAMARCA','PERU'),
 ('012','ILO','','ILO','PERU'),
 ('013','DESAGUADERO','','DESAGUADERO','BOLIVIA'),
 ('014','PUNO','','PUNO','PERU'),
 ('015','CHICLAYO','','LAMBAYEQUE','PERU'),
 ('016','ARICA','','ARICA','CHILE'),
 ('017','ICA','','ICA','PERU'),
 ('021','AYACUCHO','','AYACUCHO','PERU'),
 ('022','HUARMEY','','ANCASH','HUARMEY'),
 ('023','TARAPOTO','','SAN MARTIN','SAN MARTIN');
/*!40000 ALTER TABLE `zonas` ENABLE KEYS */;


--
-- Definition of table `zz_producto`
--

DROP TABLE IF EXISTS `zz_producto`;
CREATE TABLE `zz_producto` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` char(20) DEFAULT NULL,
  `sub_cat` int(11) DEFAULT NULL,
  `nombre` varchar(225) DEFAULT NULL,
  `marca` varchar(150) DEFAULT NULL,
  `cod_pro` varchar(200) DEFAULT NULL,
  `preciopro` double(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `costopro` double(10,2) DEFAULT 0.00,
  `fechareg` varchar(50) DEFAULT NULL,
  `cargado` int(11) DEFAULT NULL,
  `precio_distribucion` double(10,2) DEFAULT 0.00,
  `precio_vip` double(10,2) DEFAULT 0.00,
  `precio_oferta` double(10,2) DEFAULT 0.00,
  `precio_remate` double(10,2) DEFAULT 0.00,
  PRIMARY KEY (`prod_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `zz_producto`
--

/*!40000 ALTER TABLE `zz_producto` DISABLE KEYS */;
INSERT INTO `zz_producto` (`prod_id`,`cat_id`,`sub_cat`,`nombre`,`marca`,`cod_pro`,`preciopro`,`stock`,`costopro`,`fechareg`,`cargado`,`precio_distribucion`,`precio_vip`,`precio_oferta`,`precio_remate`) VALUES 
 (31,'1',1,'prueba','null','0001',12.00,12,12.00,'2026-02-21 19:38:31',2,0.00,0.00,0.00,0.00),
 (32,'1',1,'vino','null','0001',12.00,12,12.00,'2026-02-21 19:41:54',0,0.00,0.00,0.00,0.00),
 (33,'1',1,'qewqewq','null','0001',12.00,12,12.00,'2026-02-21 19:46:19',0,0.00,0.00,0.00,0.00),
 (34,'1',1,'sadsad','null','0001',12.00,12,12.00,'2026-02-21 19:47:42',0,0.00,0.00,0.00,0.00),
 (35,'1',1,'sdasd','null','0001',12.00,12,12.00,'2026-02-21 19:48:51',0,0.00,0.00,0.00,0.00),
 (36,'1',1,'asdsaqd','null','0001',12.00,12,12.00,'2026-02-21 19:53:39',0,0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `zz_producto` ENABLE KEYS */;


--
-- Definition of function `nstock`
--

DROP FUNCTION IF EXISTS `nstock`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nstock`(_S DECIMAL(15,3),
        _C DECIMAL(15,3),
        _F DECIMAL(4,0),
        _I DECIMAL(1,0)) RETURNS decimal(15,3)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
 IF _S=0 AND _I<0 THEN
 	RETURN _C * _I ;
 ELSE
 	RETURN stock( TRUNCATE(_S, 0), (_S - TRUNCATE(_S, 0))*1000, TRUNCATE(_C, 0), (_C - TRUNCATE(_C, 0))*1000, _F, _I ) ;
 END IF ;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `stock`
--

DROP FUNCTION IF EXISTS `stock`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `stock`(_01 DECIMAL(15,3),
        _02 DECIMAL(15,3),
        _03 DECIMAL(15,3),
        _04 DECIMAL(15,3),
        _05 DECIMAL(4,0),
        _06 DECIMAL(1,0)) RETURNS decimal(15,3)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
 
 DECLARE lnResto DECIMAL(15,3) DEFAULT 0 ;
 SET _03 = ((_01+(_06*_03)) * _05 ) + (_02+(_06*_04)) ;
	
 SET lnResto = IF(_03 < 0, _03*-1, _03);
 SET _04 = MOD(lnResto, _05) ;
 IF _03 < 0 THEN
	SET _04 = _04 * -1 ;
 END IF ;
 SET _03 = IF(_05 = 0, 0, TRUNCATE(_03/_05,0) ) ;
 RETURN (_04/1000) + _03 ;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `stockval`
--

DROP FUNCTION IF EXISTS `stockval`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `stockval`(_C DECIMAL(15,3),
        _P DECIMAL(15,4),
        _F DECIMAL(4,0),
        _O DECIMAL(1,0)) RETURNS decimal(15,3)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
 IF _O = 1 THEN
    RETURN TRUNCATE(_c, 0) * _p + (( _c - TRUNCATE(_c, 0)) * 1000) * IF( _f > 0, _p/_f, 0) ;
 ELSE
     RETURN _c / IF( _p = 0 , 1 , _p ) ;
 END IF ;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `CargarProductos`
--

DROP PROCEDURE IF EXISTS `CargarProductos`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CargarProductos`()
BEGIN
    DECLARE pstock, busca, codmarca, filtrar, codupt, ultcod, ncod INT;
    DECLARE catid, subtid, codpro, marcacod, ncarat, Newcodpro VARCHAR(10);
    DECLARE producto, pmarca VARCHAR(250);
    DECLARE pprecio, pcosto DECIMAL(14,2);
    DECLARE done INT DEFAULT FALSE;

    DECLARE id_record CURSOR FOR 
        SELECT cat_id, sub_cat, TRIM(nombre), TRIM(marca), cod_pro, preciopro, stock, costopro, prod_id 
        FROM zz_producto 
        WHERE cargado = 0
        AND MONTH(fechareg) = MONTH(CURDATE()) 
        AND YEAR(fechareg) = YEAR(CURDATE());

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN id_record;

    id_loop: LOOP
        FETCH id_record INTO catid, subtid, producto, pmarca, codpro, pprecio, pstock, pcosto, codupt;
        
        IF done THEN 
            LEAVE id_loop; 
        END IF;

        SELECT COUNT(*) INTO busca FROM marcra_productos WHERE nombre_marca = pmarca;
        
        IF (busca = 0) THEN 
            SELECT COALESCE(MAX(cod_marca), 0) INTO codmarca FROM marcra_productos;
            SET codmarca = codmarca + 1;
            INSERT INTO marcra_productos (nombre_marca, cod_marca) VALUES (pmarca, codmarca);
        END IF;

        SELECT COUNT(*) INTO filtrar FROM producto WHERE nombre = producto;    
        
        IF (filtrar = 0) THEN 
            SELECT cod_marca INTO marcacod FROM marcra_productos WHERE nombre_marca = pmarca LIMIT 1;
            SELECT (CASE WHEN COUNT(prod_cod) = 0 THEN 1 ELSE MAX(prod_cod)+1 END) INTO ultcod FROM producto;
            
            SET Newcodpro = LPAD(ultcod, 4, '0');
            
            INSERT INTO producto VALUES (0, catid, subtid, producto, '', '', '', marcacod, Newcodpro, '', '', pprecio, pstock, '', 1, 0, 0.0, 1);
            
            SET ncarat = LPAD(subtid, 3, '0');
            
            INSERT INTO sopprod VALUES (Newcodpro, '01', '000', '001', '', '', '', producto, '001', 'UND', '1', pcosto, pstock, '0000-00-00', 0, '', '0000-00-00', 1, 1, 1, '', 0, 0, 3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, '', 0, NOW(), 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
            INSERT INTO precios VALUES (Newcodpro, 1, 1, 0, '0000-00-00', pprecio, pprecio, pprecio, pprecio, 0, 0, pcosto, 0, 0, 0, 0, 0, 0, 0, 0, 0);
            INSERT INTO stocks VALUES (1, 109, Newcodpro, pstock, 0, 0, 0, 0, '');
            
            UPDATE zz_producto SET cargado = 1, cod_pro = Newcodpro WHERE prod_id = codupt;
        ELSE 
            UPDATE zz_producto SET cargado = 2 WHERE prod_id = codupt;
        END IF;     

    END LOOP id_loop;

    CLOSE id_record;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_kardex_documentos`
--

DROP PROCEDURE IF EXISTS `sp_kardex_documentos`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_kardex_documentos`(IN tcID_UNICO CHAR(10),
        IN tcCOD_ALMA CHAR(3),
        IN tdFECHA DATE,
        IN tnMONEDA DECIMAL(1,0),
        IN tcDOC_ING VARCHAR(200),
        IN tcDOC_SAL VARCHAR(200))
    SQL SECURITY INVOKER
BEGIN
  DECLARE _Costo  DECIMAL(15,3) DEFAULT 0;
  DECLARE _Stock, lnOldStk, lnCantid, lnUltIngCan DECIMAL(15,3) DEFAULT 0;
  DECLARE lnMoneKar, lnMoneProd, lnCodapl DECIMAL(1,0) DEFAULT 0;
  DECLARE lnPreunit, lnPrecio, lnTcambio, _Stkval, _Unidad DECIMAL(15,4) DEFAULT 0;
  DECLARE lnFactor DECIMAL(4,0) DEFAULT 1;
  DECLARE lcDoc CHAR(1) ;
  DECLARE lcCodigo, lcProdAct CHAR(6) DEFAULT '';
  DECLARE llNoCalc, llPromo BIT(1);
  DECLARE ldFecha, lnUltIngFec DATE ;
  DECLARE ll_Loop_End INTEGER DEFAULT 0;
  
  DECLARE tmpStockCostoDoc CURSOR FOR
          SELECT codapl, doc, codigo, moneda, preunit, cantid, tcambio, no_calc, promo, fecha
           FROM kardex
           WHERE IF(tcCOD_ALMA <> '', cod_alma = tcCOD_ALMA, cod_alma <> '')
                 AND fecha < tdFECHA
                 AND FIND_IN_SET(cod_docu, IF(codapl = 1, tcDOC_ING, tcDOC_SAL))>0
           ORDER BY codigo, fecha ASC, doc ASC, auto_recno ASC ;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET ll_Loop_End = 1;
  
  OPEN tmpStockCostoDoc ;
  REPEAT
    FETCH tmpStockCostoDoc INTO lnCodapl, lcDoc, lcCodigo, lnMoneKar, lnPreunit, lnCantid, lnTcambio, llNoCalc, llPromo, ldFecha ;
    IF (lcCodigo <> lcProdAct) OR ll_Loop_End THEN
       IF lcProdAct <> '' THEN
          
          UPDATE sopprod SET
                 sopprod.kardoc_costo = _Costo,
                 sopprod.kardoc_stock = _Stock,
                 sopprod.kardoc_ultingfec = lnUltIngfec,
                 sopprod.kardoc_ultingcan = lnUltIngCan,
                 sopprod.kardoc_unico = tcID_UNICO
           WHERE cod_prod = lcProdAct ;
       END IF ;
       
       SELECT tip_moneda, fac_unid INTO lnMoneProd, lnFactor
        FROM sopprod
        WHERE cod_prod = lcCodigo ;
       
       SET lcProdAct = lcCodigo ;
       SET _Stock = 0 ;
       SET _Costo = 0 ;
       SET lnUltIngCan = 0 ;
       SET lnUltIngFec = '0000-00-00' ;
    END IF ;
    IF NOT ll_Loop_End THEN
       IF lcDoc = 'S' THEN
           SET _Stock  = NSTOCK( _Stock, lnCantid, lnFactor, -1 ) ;
       ELSE
           SET lnUltIngCan = lnCantid ;
           SET lnUltIngFec = ldFecha ;
           SET lnPrecio = lnPreunit ;
           IF tnMONEDA = 3 THEN
              IF lnMoneProd=1 AND lnMoneKar=2 THEN           
	             SELECT cambio3 INTO lnTcambio FROM tcambio WHERE dfecha <= ldFecha ORDER BY dfecha DESC LIMIT 1 ;
                 SET lnPrecio = lnPrecio * lnTcambio ;
              END IF;
              IF lnMoneProd=2 AND lnMoneKar=1 THEN
	             SELECT cambio3 INTO lnTcambio FROM tcambio WHERE dfecha <= ldFecha ORDER BY dfecha DESC LIMIT 1 ;
                 SET lnPrecio = lnPrecio / lnTcambio ;
              END IF;
           ELSE
              IF tnMONEDA=1 AND lnMoneKar=2 THEN
	             SELECT cambio3 INTO lnTcambio FROM tcambio WHERE dfecha <= ldFecha ORDER BY dfecha DESC LIMIT 1 ;
                 SET lnPrecio = lnPrecio * lnTcambio ;
              END IF;
              IF tnMONEDA=2 AND lnMoneKar=1 THEN
	             SELECT cambio3 INTO lnTcambio FROM tcambio WHERE dfecha <= ldFecha ORDER BY dfecha DESC LIMIT 1 ;
                 SET lnPrecio = lnPrecio / lnTcambio ;
              END IF;
           END IF ;
			SET lnPrecio = ROUND(lnPrecio, 4) ;
  
			SET lnOldStk = _Stock ;
			SET lnPrecio = IF(lnPreunit = 0, _Costo, lnPrecio) ;
			SET _Stkval  = ROUND(STOCKVAL(_Stock, _Costo, lnFactor, 1) + STOCKVAL(lnCantid, lnPrecio, lnFactor, 1), 4) ;
			SET _Stock   = NSTOCK( _Stock, lnCantid, lnFactor, 1) ;
			SET _Unidad  = ( TRUNCATE(_Stock,0) * lnFactor ) + ( (_Stock - TRUNCATE(_Stock,0)) * 1000 ) ;
			
			IF _Unidad <> 0 AND lnCodapl=1 AND llPromo<>1 AND llNoCalc<>5 THEN
				IF lnOldStk <= 0 THEN
					SET _Costo = ROUND( lnPrecio, 3) ;
				ELSE
					SET _Costo = ROUND( ( ( ( (_Stkval * 1000)/_Unidad) / 1000 ) * lnFactor ), 3 ) ;
				END IF;
			END IF;
	   END IF ;
    END IF ;
  UNTIL ll_Loop_End END REPEAT ;
  CLOSE tmpStockCostoDoc ;
  
  SELECT s.cod_prod, s.cod_espe, s.nom_prod, s.nom_unid, s.fac_unid, s.tip_moneda,
        s.kardoc_costo, s.kardoc_stock, s.kardoc_ultingfec, s.kardoc_ultingcan,
        l.cod_sunat AS sunat_cla,
        u.cod_sunat AS sunat_und,
        l.cod_osce
   FROM sopprod s
   INNER JOIN soplinea l ON s.cod_clasi = l.cod_line
   INNER JOIN unidades u ON s.cod_unid = u.cod_unid   
   WHERE s.kardoc_unico = tcID_UNICO ;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_limitecredito_clie`
--

DROP PROCEDURE IF EXISTS `sp_limitecredito_clie`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_limitecredito_clie`(IN tcCOD_AUXI CHAR(6))
    SQL SECURITY INVOKER
BEGIN
  DECLARE lnMaxCredi, lnUtilCredi, lnMonTotal, lnSalDocu DECIMAL(15,2) DEFAULT 0;
  DECLARE lnNotaCre, lnTotDoc, lnTotDeuda DECIMAL(15,2) DEFAULT 0;
  DECLARE lcTdFlags CHAR(12) DEFAULT '';
  DECLARE lnCreMoneda, lnTipMone DECIMAL(1,0) DEFAULT 0;
  DECLARE lnTipCambio DECIMAL(13,3) DEFAULT 0;
  DECLARE ll_Loop_End INTEGER DEFAULT 0;
  
  DECLARE tmpLimiteCre CURSOR FOR
          SELECT tip_mone, tip_cambio, tdflags, mon_total, sal_docu
           FROM movimien
           WHERE cod_auxi = tcCOD_AUXI
            AND SUBSTRING(tdflags,8,1)='S'
            AND flg_limite = 0
            AND flg_anulado = 0
            AND sal_docu>0;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET ll_Loop_End = 1;
  
  SELECT cre_moneda, max_credi, util_credi INTO lnCreMoneda, lnMaxCredi, lnUtilCredi
   FROM auxiliar
   WHERE cod_auxi = tcCOD_AUXI ;
  
  OPEN tmpLimiteCre;
  REPEAT
    FETCH tmpLimiteCre INTO lnTipMone, lnTipCambio, lcTdflags, lnMonTotal, lnSalDocu ;
    IF NOT ll_Loop_End THEN
        SET lnTipCambio = IF(lnTipCambio=0, 1, lnTipCambio);
        SET lnTotDoc    = IF(SUBSTRING(lcTdflags,1,1)='I', lnSalDocu, lnSalDocu);
        SET lnNotaCre   = IF(SUBSTRING(lcTdflags,1,1)='I', -1, 1);
		IF lnCreMoneda = 1 THEN
			IF lnTipMone = 2 THEN
				SET lnTotDoc = (lnTotDoc * lnTipCambio) * lnNotaCre ;
			END IF ;
		ELSE
			IF lnTipMone = 1 THEN
				SET lnTotDoc = (lnTotDoc / lnTipCambio) * lnNotaCre ;
			END IF ;
		END IF ;
		SET lnTotDeuda = lnTotDeuda + (lnTotDoc * lnNotaCre) ;
    END IF ;
  UNTIL ll_Loop_End END REPEAT ;
  CLOSE tmpLimiteCre;
  
  UPDATE auxiliar SET util_credi = lnTotDeuda WHERE cod_auxi = tcCOD_AUXI ;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_recalculo_bancos`
--

DROP PROCEDURE IF EXISTS `sp_recalculo_bancos`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recalculo_bancos`(IN tcCOD_CTA CHAR(3), IN tdFECHA_DOC DATE)
    SQL SECURITY INVOKER
BEGIN
  DECLARE lcMov_id CHAR(10);
  DECLARE lcIe CHAR(1);
  DECLARE lnImporte, _Saldo DECIMAL(15,4) DEFAULT 0;
  DECLARE ll_Loop_End INTEGER DEFAULT 0;
  
  DECLARE tmpMovBancos CURSOR FOR
          SELECT mov_id, ie, importe
           FROM movbcos
           WHERE cod_cta = tcCOD_CTA AND fechadoc >= tdFECHA_DOC
           ORDER BY fechadoc ASC, auto_recno ASC ;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET ll_Loop_End = 1;
  
  CALL sp_saldo_bancos(tcCOD_CTA, tdFECHA_DOC, @p1);
  SELECT @p1 INTO _Saldo ;
  
  OPEN tmpMovBancos ;
  REPEAT
    FETCH tmpMovBancos INTO lcMov_id, lcIe, lnImporte ;
    IF NOT ll_Loop_End THEN
       IF lcIe = 'A' THEN
           SET _Saldo  = _Saldo + lnImporte ;
       ELSE
           SET _Saldo  = _Saldo - lnImporte ;
	   END IF ;
    END IF ;
    
    UPDATE movbcos SET saldo = _Saldo WHERE mov_id = lcMov_Id ;
  UNTIL ll_Loop_End END REPEAT ;
  CLOSE tmpMovBancos ;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_recalculo_cajachica`
--

DROP PROCEDURE IF EXISTS `sp_recalculo_cajachica`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recalculo_cajachica`(IN tcCOD_SUC CHAR(3),
        IN tdFECHA DATE)
    SQL SECURITY INVOKER
BEGIN
  DECLARE ldFecha DATE ;
  DECLARE lnIng_sol, lnSal_sol, lnIng_dol, lnSal_dol DECIMAL(15,4) DEFAULT 0;
  DECLARE _SalIni_sol, _SalIni_dol, _SalFin_sol, _SalFin_dol DECIMAL(15,4) DEFAULT 0;
  DECLARE ll_Loop_End INTEGER DEFAULT 0;
  
  DECLARE tmpSalCaja CURSOR FOR
          SELECT fecha, ing_sol, sal_sol, ing_dol, sal_dol
           FROM salcaja
           WHERE cod_suc = tcCOD_SUC AND fecha >= tdFECHA
           ORDER BY fecha ASC ;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET ll_Loop_End = 1;
  
  CALL sp_saldo_cajachica(tcCOD_SUC, tdFECHA, @p1, @p2);
  SELECT @p1, @p2 INTO _SalIni_sol, _SalIni_dol ;
  
  OPEN tmpSalCaja ;
  REPEAT
    FETCH tmpSalCaja INTO ldFecha, lnIng_sol, lnSal_sol, lnIng_dol, lnSal_dol ;
    IF NOT ll_Loop_End THEN
       SET _SalFin_sol = ((_SalIni_sol + lnIng_sol) - lnSal_sol) ;
       SET _SalFin_dol = ((_SalIni_dol + lnIng_dol) - lnSal_dol) ;
		  
	    UPDATE salcaja SET
    	       ini_sol = _SalIni_sol,
	           ini_dol = _SalIni_dol,
	           tot_sol = _SalFin_sol,
	           tot_dol = _SalFin_dol
	        WHERE cod_suc = tcCOD_SUC AND fecha = ldFecha ;  
       SET _SalIni_sol = _SalFin_sol ;
       SET _SalIni_dol = _SalFin_dol ;
    END IF ;
    
  UNTIL ll_Loop_End END REPEAT ;
  CLOSE tmpSalCaja ;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_recalculo_ctacte`
--

DROP PROCEDURE IF EXISTS `sp_recalculo_ctacte`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recalculo_ctacte`(IN tcID_DOC CHAR(10))
    SQL SECURITY INVOKER
BEGIN
  DECLARE lnAbonoS, lnAbonoD, lnCargoS, lnCargoD DECIMAL(15,2) DEFAULT 0;
  DECLARE lcIe char(1);
  DECLARE lnImporte DECIMAL(15,2) DEFAULT 0;
  DECLARE lnMoneda DECIMAL(1,0) DEFAULT 0;
  DECLARE lnTCambio DECIMAL(13,3) DEFAULT 0;
  DECLARE ldFecpago, ldFecCancel DATE DEFAULT '0000-00-00';
  DECLARE ll_Loop_End INTEGER DEFAULT 0;
  
  DECLARE tmpCaja CURSOR FOR
          SELECT ie, importe, moneda, tcambio, fecpago 
          FROM movcajag 
          WHERE id_doc = tcID_DOC AND pendiente = 0 ;
          
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET ll_Loop_End = 1;
  
  OPEN tmpCaja;
  REPEAT
    FETCH tmpCaja INTO lcIe, lnImporte, lnMoneda, lnTCambio, ldFecpago ;
    IF NOT ll_Loop_End THEN
        SET lnTCambio = IF(lnTCambio=0, 1, lnTCambio) ;
        
		IF ldFecpago > ldFecCancel THEN
	        SET ldFecCancel = ldFecpago ;
        END IF ;        
        
        IF lcIe = 'A' THEN
            SET lnAbonoS = lnAbonoS + ( lnImporte * IF(lnMoneda=2, lnTcambio, 1) );
            SET lnAbonoD = lnAbonoD + ( lnImporte / IF(lnMoneda=1, lnTcambio, 1) );
        ELSE
            SET lnCargoS = lnCargoS + ( lnImporte * IF(lnMoneda=2, lnTcambio, 1) );
            SET lnCargoD = lnCargoD + ( lnImporte / IF(lnMoneda=1, lnTcambio, 1) );
        END IF ;
    END IF ;
  UNTIL ll_Loop_End END REPEAT ;
  CLOSE tmpCaja;
  UPDATE movimien SET sal_docu  = IF(movimien.tip_mone=1, ((movimien.mon_total+lnCargoS)-lnAbonoS), ((movimien.mon_total+lnCargoD)-lnAbonoD)),
  					  tot_cargo = IF(movimien.tip_mone=1, lnCargoS, lnCargoD)  WHERE movimien.mov_id = tcID_DOC;
  UPDATE movimien SET fecpago = IF(movimien.sal_docu=0, ldFecCancel, '0000-00-00')  WHERE movimien.mov_id = tcID_DOC;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_recalculo_kardex`
--

DROP PROCEDURE IF EXISTS `sp_recalculo_kardex`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recalculo_kardex`(IN tcCOD_SUC CHAR(1),
        IN tcCOD_ALMA CHAR(3),
        IN tcCOD_PROD CHAR(6),
        IN tdFEC_DOCU DATE)
    SQL SECURITY INVOKER
BEGIN
  DECLARE _Costo, _Inver, _Cosult, lnUltcos, lnUltinv, lnPrecio, lnPreinv DECIMAL(15,3) DEFAULT 0;
  DECLARE _Stock, lnOldStk, lnCantid DECIMAL(15,3) DEFAULT 0;
  DECLARE lnMoneKar, lnMoneProd, lnCodapl DECIMAL(1,0) DEFAULT 0;
  DECLARE lnPreunit, lnTcambio, _Stkval1, _Stkval2, _Unidad DECIMAL(15,4) DEFAULT 0;
  DECLARE lnFactor DECIMAL(4,0) DEFAULT 1;
  DECLARE lnReg DECIMAL(4,0) DEFAULT 0 ;
  DECLARE lcDoc, lcTipoRecalculo CHAR(1) ;
  DECLARE lcUnicodet CHAR(10);
  DECLARE lcDocNoCalc CHAR(50);
  DECLARE lcCodDocu CHAR(2);
  DECLARE lcSucAlma CHAR(3);
  DECLARE llNoCalc, llPromo BIT(1);
  DECLARE ll_Loop_End INTEGER DEFAULT 0;
  
  DECLARE tmpStockCosto CURSOR FOR
          SELECT unicodet, codapl, doc, moneda, preunit, cantid, tcambio, no_calc, promo, cod_docu
           FROM kardex
           WHERE cod_alma = tcCOD_ALMA AND codigo = tcCOD_PROD AND fecha >= tdFEC_DOCU
           ORDER BY fecha ASC, doc ASC, auto_recno ASC ;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET ll_Loop_End = 1;
  
  SELECT tip_moneda, fac_unid INTO lnMoneProd, lnFactor
   FROM sopprod
   WHERE cod_prod = tcCOD_PROD ;
  
  SELECT cod_alma INTO lcSucAlma
   FROM sucursal
   WHERE cod_suc = tcCOD_SUC ;
  
  SELECT SUBSTRING(cfg1, 8, 1), SUBSTRING(cfgesp, 7) INTO lcTipoRecalculo, lcDocNoCalc
   FROM paramete
   WHERE key_unico = 'DECIMAL' ;
  
  CALL sp_saldo_stock_costos(tcCOD_ALMA, tcCOD_PROD, tdFEC_DOCU, @p1, @p2, @p3, @p4);
  SELECT @p1, @p2, @p3, @p4 INTO _Stock, _Costo, _Inver, _Cosult ;
  SET lnUltcos = _Cosult ;
  SET lnUltinv = _Inver ;
  
  OPEN tmpStockCosto ;
  REPEAT
    FETCH tmpStockCosto INTO lcUnicodet, lnCodapl, lcDoc, lnMoneKar, lnPreunit, lnCantid, lnTcambio, llNoCalc, llPromo, lcCodDocu ;
    IF NOT ll_Loop_End THEN
       IF lcDoc = 'S' THEN
           SET _Stock  = NSTOCK( _Stock, lnCantid, lnFactor, -1 ) ;
       ELSE
           SET lnPrecio = lnPreunit ;
           SET lnPreinv = lnPreunit ;
			
		   
		   IF lnMoneProd=1 AND lnMoneKar=2 THEN
		      SET lnPrecio = lnPrecio * lnTcambio ;
           END IF;
		   IF lnMoneProd=2 AND lnMoneKar=1 THEN
		      SET lnPrecio = lnPrecio / lnTcambio ;
           END IF;
			
			
			IF lnMoneProd=1 AND lnMoneKar=1 THEN
			   SET lnPreInv = lnPreInv / lnTcambio ;
            END IF;
			IF lnMoneProd=2 AND lnMoneKar=2 THEN
			   SET lnPreInv = lnPreInv * lnTcambio ;
		    END IF;
			
			SET lnOldStk = _Stock ;
			SET lnPrecio = IF(lnPreunit = 0, _Costo, lnPrecio) ;
			SET lnPreInv = IF(lnPreunit = 0, _Inver, lnPreInv) ;
			SET _Stkval1 = ROUND(STOCKVAL(_Stock, _Costo, lnFactor, 1) + STOCKVAL(lnCantid, lnPrecio, lnFactor, 1), 4) ;
			SET _Stkval2 = ROUND(STOCKVAL(_Stock, _Inver, lnFactor, 1) + STOCKVAL(lnCantid, lnPreInv, lnFactor, 1), 4) ;
			SET _Stock  = NSTOCK( _Stock, lnCantid, lnFactor, 1) ;
			SET _Unidad = ( TRUNCATE(_Stock,0) * lnFactor ) + ( (_Stock - TRUNCATE(_Stock,0)) * 1000 ) ;
			
            IF lnCodapl=1 AND llPromo<>1 AND llNoCalc<>5 AND lcCodDocu<>lcDocNoCalc THEN
			   
				IF _Unidad <> 0 THEN
					IF lnOldStk <= 0 THEN
						SET _Costo = lnPrecio ;
						SET _Inver = lnPreInv ;
					ELSE
						SET _Costo = ROUND( ( ( ( (_Stkval1 * 1000)/_Unidad) / 1000 ) * lnFactor ), 3 ) ;
						SET _Inver = ROUND( ( ( ( (_Stkval2 * 1000)/_Unidad) / 1000 ) * lnFactor ), 3 ) ;
					END IF;
				END IF;
				
				SET lnUltcos = lnPrecio ;
				SET lnUltinv = lnPreInv ;
			END IF;
	   END IF ;
    END IF ;
   
   UPDATE kardex SET
          saldo = _Stock,
          preprom = IF(lcTipoRecalculo='U', lnUltcos, _Costo),
          preinver = IF(lcTipoRecalculo='U', lnUltinv, _Inver),
          preultimo = lnUltcos
     WHERE unicodet = lcUnicodet ;
  UNTIL ll_Loop_End END REPEAT ;
  CLOSE tmpStockCosto ;
  
  IF (lcSucAlma = tcCOD_ALMA) OR lcSucAlma = '' THEN
     INSERT INTO Precios SET
            precios.cod_suc = tcCOD_SUC,
            precios.cod_prod = tcCOD_PROD,
            precios.en_lista = IF(precios.lsupendido=1, 0, 1),
            precios.costo_ultimo = IF(lnUltcos>0, lnUltcos, precios.costo_ultimo),
            precios.precio_costo = IF(lcTipoRecalculo='U', lnUltcos, _Costo),
            precios.precio_inver = IF(lcTipoRecalculo='U', lnUltinv, _Inver)
     ON DUPLICATE KEY UPDATE
            precios.en_lista = IF(precios.lsupendido=1, 0, 1),
            precios.costo_ultimo = IF(lnUltcos>0, lnUltcos, precios.costo_ultimo),
            precios.precio_costo = IF(lcTipoRecalculo='U', lnUltcos, _Costo),
            precios.precio_inver = IF(lcTipoRecalculo='U', lnUltinv, _Inver);
  END IF ;
  
  INSERT INTO stocks SET
         stocks.cod_alma = tcCOD_ALMA,
         stocks.cod_prod = tcCOD_PROD,
         stocks.cod_suc = tcCOD_SUC,
         stocks.stock_act = _Stock
   ON DUPLICATE KEY UPDATE
         stocks.stock_act = _Stock ;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_saldo_bancos`
--

DROP PROCEDURE IF EXISTS `sp_saldo_bancos`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saldo_bancos`(IN tcCOD_CTA CHAR(3), IN tdFECHA_DOC DATE, OUT tnSaldo DECIMAL(15,3))
    SQL SECURITY INVOKER
BEGIN
 DECLARE ll_Loop_End INTEGER DEFAULT 0;
  
  DECLARE tmpSaldoBanco CURSOR FOR
           SELECT saldo
           FROM movbcos
           WHERE cod_cta = tcCOD_CTA AND fechadoc < tdFECHA_DOC
           ORDER BY fechadoc DESC, auto_recno DESC
           LIMIT 1 ;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET ll_Loop_End = 1;
  SET tnSaldo = 0 ;
  
  OPEN tmpSaldoBanco ;
  REPEAT
     FETCH tmpSaldoBanco INTO tnSaldo ;
     IF NOT ll_Loop_End THEN
        SET tnSaldo = tnSaldo * 1 ;
     END IF ;
  UNTIL ll_Loop_End END REPEAT ;
  CLOSE tmpSaldoBanco;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_saldo_cajachica`
--

DROP PROCEDURE IF EXISTS `sp_saldo_cajachica`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saldo_cajachica`(IN tcCOD_SUC CHAR(3),
        IN tdFECHA DATE,
        OUT tnSaldoSol DECIMAL(15,4),
        OUT tnSaldoDol DECIMAL(15,4))
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
 DECLARE ll_Loop_End INTEGER DEFAULT 0;
  
  DECLARE tmpSaldoCajaChica CURSOR FOR
           SELECT tot_sol, tot_dol
           FROM salcaja
           WHERE cod_suc = tcCOD_SUC AND fecha < tdFECHA
           ORDER BY fecha DESC
           LIMIT 1 ;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET ll_Loop_End = 1;
  SET tnSaldoSol = 0 ;
  SET tnSaldoDol = 0 ;
  
  OPEN tmpSaldoCajaChica ;
  REPEAT
     FETCH tmpSaldoCajaChica INTO tnSaldoSol, tnSaldoDol ;
     IF NOT ll_Loop_End THEN
        SET tnSaldoSol = tnSaldoSol * 1 ;
        SET tnSaldoDol = tnSaldoDol * 1 ;
     END IF ;
  UNTIL ll_Loop_End END REPEAT ;
  CLOSE tmpSaldoCajaChica;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_saldo_stock_costos`
--

DROP PROCEDURE IF EXISTS `sp_saldo_stock_costos`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saldo_stock_costos`(IN tcCOD_ALMA CHAR(3),
        IN tcCOD_PROD CHAR(6),
        IN tdFEC_DOCU DATE,
        OUT tnStock DECIMAL(15,3),
        OUT tnPreProm DECIMAL(15,3),
        OUT tnPreInver DECIMAL(15,3),
        OUT tnPreUltimo DECIMAL(15,3))
    SQL SECURITY INVOKER
BEGIN
  DECLARE ll_Loop_End INTEGER DEFAULT 0;
  
  DECLARE tmpSaldos CURSOR FOR
           SELECT saldo, preprom, preinver, preultimo
           FROM kardex
           WHERE cod_alma = tcCOD_ALMA AND codigo = tcCOD_PROD AND fecha < tdFEC_DOCU
           ORDER BY fecha DESC, doc DESC, auto_recno DESC
           LIMIT 1 ;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET ll_Loop_End = 1;
  SET tnStock = 0 ;
  SET tnPreProm = 0 ;
  SET tnPreInver = 0 ;
  SET tnPreUltimo = 0 ;
  
  OPEN tmpSaldos ;
  REPEAT
     FETCH tmpSaldos INTO tnStock, tnPreProm, tnPreInver, tnPreUltimo ;
     IF NOT ll_Loop_End THEN
        SET tnStock     = tnStock * 1 ;
        SET tnPreProm   = tnPreProm * 1 ;
        SET tnPreInver  = tnPreInver * 1 ;
        SET tnPreUltimo = tnPreUltimo * 1 ;
     END IF ;
  UNTIL ll_Loop_End END REPEAT ;
  CLOSE tmpSaldos;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `view_lista_productos`
--

DROP TABLE IF EXISTS `view_lista_productos`;
DROP VIEW IF EXISTS `view_lista_productos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_lista_productos` AS (select `p`.`prod_id` AS `prod_id`,`p`.`categoria` AS `categoria`,`p`.`sub_cat` AS `sub_cat`,`p`.`categoria` AS `sub_catOTRO`,`p`.`nombre` AS `nombre`,`p`.`content1` AS `content1`,`p`.`content2` AS `content2`,`p`.`content3` AS `content3`,`p`.`marca` AS `marca`,`p`.`prod_cod` AS `prod_cod`,`p`.`descripcion` AS `descripcion`,`p`.`caracteristicas` AS `caracteristicas`,`p`.`precio_prod` AS `precio_prod`,`p`.`stock_prod` AS `stock_prod`,`p`.`tipo_pro` AS `tipo_pro`,`p`.`estado` AS `estado`,`p`.`garantia` AS `garantia`,`p`.`precio_oferta` AS `precio_oferta`,`gp`.`nombre_cate` AS `nombre_cate`,`sc`.`nombre` AS `etiqueta` from ((`producto` `p` join `grupo_seleccion` `gp` on(`gp`.`codi_categoria` = `p`.`categoria`)) join `sub_categoria` `sc` on(`sc`.`sub_id` = `p`.`sub_cat`)));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
