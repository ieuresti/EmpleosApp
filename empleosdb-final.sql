-- MySQL dump 10.16  Distrib 10.1.25-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: empleosdb
-- ------------------------------------------------------
-- Server version	10.1.25-MariaDB

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
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Arquitectura','Habilidades para diseñar, dirigir y construir proyectos arquitectónicos, que pueden ir desde diseños en pequeña escala (como casas), hasta gran escala (como el planeamiento de una ciudad).'),(2,'Contablidad/Finanzas','Actividades para mantener oportuna y correcta la aplicación del sistema contable y presupuestal, asi como mantener en forma eficiente la programación y pago de los egresos, así como la respectiva creación de pasivos.'),(3,'Computacion/TI','Trabajos de capturistas, manejo de paqueteria de software, diseño de redes, telecomunicaciones, etc.'),(4,'Ingenieria electronica','Trabajos con aplicación en la industria, telecomunicaciones, en el diseño y análisis de instrumentación electrónica, microcontroladores y microprocesadores. '),(5,'Recursos Humanos','Administración de nóminas, pagas extra de los empleados, supervisar el trabajo de los empleados, determinar las necesidades del personal.'),(6,'Servicio y atencion al cliente','Actividades relacionadas con ofrecer servicios y atencion a los clientes de forma efectiva.'),(7,'Logistica/transportes','Trabajos relacionados con capacidad de observación, buena memoria, habilidad numérica y verbal, razonamiento concreto y abstracto, imaginación e inventiva, habilidad para el manejo de instrumentos y material de laboratorio, capacidad de adaptación social y trabajo de campo.'),(8,'Desarrollo de software','Profesionistas capaces de analizar, diseñar y mejorar estratégicamente proyectos de sistemas de software mediante la aplicación de procesos, modelos, herramientas y estándares de calidad en su desarrollo.'),(9,'Diseño','Crear conceptos visuales para publicidad, reunirse con clientes para conocer el presupuesto del proyecto, asesorar a los clientes para crear estrategias de publicidad visual, liderar equipos de trabajo, diseñar logotipos.'),(10,'Comunicaciones','Profesionales que se encargan de escribir las noticias que usualmente vemos en las revistas, periódicos e incluso en la televisión, muchos incluso, se dedican a escribir historias en Blogs y en los diferentes medios de comunicación escrita.'),(11,'Mercadotecnia','Investigación de mercados, programación y desarrollo del producto, fijación de precios, canales de distribución y logística. Comunicación integral: publicidad, comunicación e imagen, relaciones públicas, marketing directo, promoción, etc.'),(12,'Ventas','Habilidades para supervisar y dirigir las actividades de una oficina o de un departamento de Ventas. Coordinar y monitorear el trabajo de los empleados a su cargo.'),(13,'Publicidad','Habilidadeds para planificar, dirigir y coordinar las actividades de publicidad y relaciones públicas de la empresa u organización. Diseñar y planificar campañas publicitarias. Dirigir y gestionar las actividades del personal de publicidad y relaciones públicas.'),(14,'Gerencia/Administracion','Profesionistas capaces para programar, organizar, dirigir, controlar y supervisar las actividades de personal, tesorería, contabilidad y costos, logística y servicios internos y de mantenimiento.'),(15,'Educación','Funciones de docencia de carácter profesional que implica la realización directa de los procesos sistemáticos de enseñanza - aprendizaje, lo cual incluye el diagnóstico, la planificación, la ejecución y la evaluación de los mismos procesos y sus resultados.'),(16,'Blockchain y Bitcoin','Trabajos relaciondos con Bitcoin, Blockchain, desarrollo de sistemas distribuidos, contratos inteligentes y RESTful APIs basadas en entornos de Open Source.');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Perfiles`
--

DROP TABLE IF EXISTS `Perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Perfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Perfiles`
--

LOCK TABLES `Perfiles` WRITE;
/*!40000 ALTER TABLE `Perfiles` DISABLE KEYS */;
INSERT INTO `Perfiles` VALUES (1,'SUPERVISOR'),(2,'ADMINISTRADOR'),(3,'USUARIO');
/*!40000 ALTER TABLE `Perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Solicitudes`
--

DROP TABLE IF EXISTS `Solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Solicitudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `archivo` varchar(250) NOT NULL,
  `comentarios` text,
  `idVacante` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Vacante_Usuario_UNIQUE` (`idVacante`,`idUsuario`),
  KEY `fk_Solicitudes_Vacantes1_idx` (`idVacante`),
  KEY `fk_Solicitudes_Usuarios1_idx` (`idUsuario`),
  CONSTRAINT `fk_Solicitudes_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`id`),
  CONSTRAINT `fk_Solicitudes_Vacantes1` FOREIGN KEY (`idVacante`) REFERENCES `Vacantes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Solicitudes`
--

LOCK TABLES `Solicitudes` WRITE;
/*!40000 ALTER TABLE `Solicitudes` DISABLE KEYS */;
INSERT INTO `Solicitudes` VALUES (1,'2019-06-19','curriculum.pdf','Buenas tardes. Envío mi Curriculum Vitae para aplicar para esta oferta de trabajo!',14,6);
/*!40000 ALTER TABLE `Solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsuarioPerfil`
--

DROP TABLE IF EXISTS `UsuarioPerfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsuarioPerfil` (
  `idUsuario` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  UNIQUE KEY `Usuario_Perfil_UNIQUE` (`idUsuario`,`idPerfil`),
  KEY `fk_Usuarios1_idx` (`idUsuario`),
  KEY `fk_Perfiles1_idx` (`idPerfil`),
  CONSTRAINT `fk_Perfiles1` FOREIGN KEY (`idPerfil`) REFERENCES `Perfiles` (`id`),
  CONSTRAINT `fk_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsuarioPerfil`
--

LOCK TABLES `UsuarioPerfil` WRITE;
/*!40000 ALTER TABLE `UsuarioPerfil` DISABLE KEYS */;
INSERT INTO `UsuarioPerfil` VALUES (1,2),(1,3),(2,1),(3,1),(4,3),(5,3);
/*!40000 ALTER TABLE `UsuarioPerfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `fechaRegistro` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Ivan Uresti','talyfuantos@gmail.com','ivan','12345',1,'2019-05-25'),(2,'Luis Gomez','luisg@gmail.com','luis','$2a$10$030/vtqQxOZvB1cAbP/q0ePvVZqNWJgCliu5qdtLB//refPYdsYFe',1,'2019-06-10'),(3,'Marisa Salinas','marisa@gmail.com','marisa','$2a$10$SGZWfNSLPqyFY61vKrgYHuyqdcPfGfXB3fmWUApAbyKTOukj66ndG',1,'2019-06-10'),(4,'Daniel Lopez','daniel@gmail.com','dlopez','$2a$10$toryw/qd.E4KK0UMABE2RuHCxgAd70EUKaAwifSTGTGTeSIo/Lzie',1,'2019-06-14'),(5,'Miguel  Hernandez','miguelhdz@gmail.com','miguel','$2a$10$9.wEEzaj8F55wovbrINuh.iwBQX3rRHSuRwafmMC9Bmw/K1bWeJqy',1,'2019-06-19');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vacantes`
--

DROP TABLE IF EXISTS `Vacantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vacantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `salario` double NOT NULL,
  `estatus` enum('Creada','Aprobada','Eliminada') NOT NULL,
  `destacado` int(11) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `detalles` text,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vacantes_categorias1_idx` (`idCategoria`),
  CONSTRAINT `fk_vacantes_categorias1` FOREIGN KEY (`idCategoria`) REFERENCES `Categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vacantes`
--

LOCK TABLES `Vacantes` WRITE;
/*!40000 ALTER TABLE `Vacantes` DISABLE KEYS */;
INSERT INTO `Vacantes` VALUES (2,'Administrador de datos en la nube ','Únete al Socio Logístico con mayor presencia en México, Soft Technologies te invita a formar parte de su gran equipo de trabajo como Administrador de datos en la nube.','2019-06-06',20000,'Aprobada',0,'logo2.png','<p><span style=\"color: #0000ff;\"><strong>REQUISITOS</strong></span></p>\r\n<p>Escolaridad: Lic. trunca o pasante en Ing en Sistemas Computacionales o afin.<br />Experiencia de 2 a&ntilde;os en:</p>\r\n<ul>\r\n<li>2 a&ntilde;os como ingeniero de infraestructura en tecnolog&iacute;as Microsoft, experiencia en soluciones de Infraestructura (Hardware/Software).</li>\r\n<li>2 a&ntilde;os administrando servidores en centros de datos.</li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong>ESPEC&Iacute;FICOS</strong></span></p>\r\n<ul>\r\n<li>Administraci&oacute;n monitoreo y mantenimiento de servicios en la nube Microsoft Azure.</li>\r\n<li>Administraci&oacute;n de servicios y proveedores de nube ITIL Foundations.</li>\r\n<li>Herramientas y Tecnolog&iacute;as de Virtualizaci&oacute;n Autoestudio.</li>\r\n<li>Herramientas de Monitoreo para servicios en la Nube o en Sitio.</li>\r\n<li>Esquemas de alta disponibilidad para nubes, cluster dispersos geogr&aacute;ficamente.</li>\r\n<li>Servicios de Nube: SaaS, PaaS, IaaS.</li>\r\n<li>Conocimientos b&aacute;sicos de Redes.</li>\r\n<li>Administraci&oacute;n de bases de datos en la nube SQL Azure.</li>\r\n<li>Conocimiento de consumo de costos de servicios en la nube.</li>\r\n<li>Herramientas de Monitoreo para nube.</li>\r\n<li>VPN.</li>\r\n<li>Almacenamiento en Nube.</li>\r\n</ul>\r\n<p>&nbsp;<span style=\"color: #0000ff;\"><strong>OFRECEMOS</strong></span></p>\r\n<ul>\r\n<li>ATRACTIVO SUELDO + prestaciones superiores a las de ley.</li>\r\n<li>Excelente ambiente de trabajo.</li>\r\n<li>Zonas de trabajo: Condesa.</li>\r\n<li>Horario Tiempo Completo: Lunes a Viernes: 09:00-06:00 con disponibilidad de horario.</li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong>ADICIONALES</strong></span></p>\r\n<ul>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ul>',3),(5,'Jefe de Almacén','Se requiere Jefe de Almacén y logística en empresa líder a nivel nacional dedicada a la distribución de medicamentos de alta especialidad en el sector gobierno, organismos descentralizados y hospitales privados.','2019-05-07',12400,'Aprobada',1,'logo5.png','<p><span style=\"background-color: #00ccff;\"><em>Requisitos:</em></span></p>\r\n<ol>\r\n<li>Titulado en Ing. Industrial, Ing. Qu&iacute;mico, Q.F.B., Q.F.I., Lic. En Farmacia y/o carrera af&iacute;n.</li>\r\n<li>5 a&ntilde;os Experiencia en posici&oacute;n similar: Manejo de almacenes en Red Fr&iacute;a y distribuci&oacute;n de insumos para la salud.</li>\r\n<li>Trato con clientes, proveedores y con personal a cargo.</li>\r\n</ol>\r\n<p><span style=\"background-color: #00ccff;\"><em>Actividades:</em></span></p>\r\n<ul>\r\n<li>Cumplir con los requisitos Normativos y de los Clientes en la recepci&oacute;n, almacenamiento, reabasto, etiquetado, surtido y embarque de los insumos para la salud.</li>\r\n<li>Reportar continuamente el desempe&ntilde;o de los procesos a su cargo para asegurar el cumplimiento en cantidad, calidad, costo y tiempo de la operaci&oacute;n.</li>\r\n<li>Garantizar el ingreso de los insumos para la salud en el sistema SAP y su revisi&oacute;n f&iacute;sica, verificando los reportes de ingresos, as&iacute; como las desviaciones que se presenten para garantizar la efectividad del proceso.</li>\r\n<li>Garantizar la confiabilidad de inventario del stock almacenado, de los insumos y/o materiales requeridos; solicitando reportes de inventario peri&oacute;dicos para disminuir gradualmente las diferencias de inventario y control de costos.</li>\r\n<li>Garantizar que el &Aacute;rea de mantenimiento lleve a cabo el programa de mantenimiento preventivo y correctivo de los equipos e instalaciones del almac&eacute;n, solicitando los reportes correspondientes para asegurar el funcionamiento eficiente y &oacute;ptimo de los equipos.</li>\r\n</ul>\r\n<p><em><span style=\"background-color: #00ccff;\">Ofrecemos:</span></em></p>\r\n<ul>\r\n<li>Sueldo competitivo</li>\r\n<li>Prestaciones de ley</li>\r\n<li>Prestaciones Superiores: Seguro de Vida, Seguro de Gastos M&eacute;dicos Mayores, Fondo y Caja de Ahorro, comedor</li>\r\n<li>Zona para laborar en Tlalpan, se requiere disponibilidad de horario</li>\r\n</ul>\r\n<p><span style=\"background-color: #00ccff;\"><em>Requerimientos:</em></span></p>\r\n<ul>\r\n<li>Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</li>\r\n<li>A&ntilde;os de experiencia: 3</li>\r\n<li>Edad: entre 31 y 48 a&ntilde;os</li>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ul>\r\n<p><span style=\"background-color: #00ccff;\"><em>Funciones:</em></span></p>\r\n<p>&bull; Entradas y salidas de material <br />&bull; Conteos c&iacute;clicos <br />&bull; Acomodo de material y Surtido de pedidos <br />&bull; Manejo de inventarios <br /><br />Competencias/Habilidades<br />Din&aacute;mico, comunicaci&oacute;n efectiva, responsable, trabajo en equipo.</p>',7),(6,'Analista de Crédito y Cobranza','Importante Empresa solicita Analista de crédito para actualizar y depurar las cuentas: integración documental y actualización en SAP.','2019-05-07',21000,'Aprobada',1,'logo2.png','<p><span style=\"color: #ff0000;\"><strong>Analista de Cr&eacute;dito y Cobranza</strong></span><br /><br /><strong>Requisitos:</strong></p>\r\n<ol>\r\n<li>Titulado. Licenciatura en Contabilidad, Administraci&oacute;n o af&iacute;n.</li>\r\n<li>3 a&ntilde;os en cr&eacute;dito y cobranza, manejo de Excel a nivel avanzado, SAP (FBL5N)</li>\r\n<li>Deseable experiencia en sector farmac&eacute;utico</li>\r\n</ol>\r\n<p><strong>Actividades:</strong></p>\r\n<ul>\r\n<li>Aplicaci&oacute;n de pagos, compensaci&oacute;n de notas de cr&eacute;dito.</li>\r\n<li>An&aacute;lisis y actualizaci&oacute;n en FBL5N de cada cuenta.</li>\r\n<li>Generaci&oacute;n de reportes para las diferentes &aacute;reas; comercial, operaciones, contralor&iacute;a, financiera, etc.</li>\r\n<li>Elaboraci&oacute;n del presupuesto de ingresos por cobranza.</li>\r\n</ul>\r\n<p><strong>Ofrecemos:</strong></p>\r\n<ul>\r\n<li>Sueldo competitivo</li>\r\n<li>Prestaciones de ley</li>\r\n<li>Prestaciones Superiores: Seguro de Vida, Seguro de Gastos M&eacute;dicos Mayores, Fondo y Caja de Ahorro.</li>\r\n<li>Comedor</li>\r\n<li>Zona para laborar, Tlalpan de lunes a viernes</li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\">Interesados que cubran el perfil al 100% postularse por este medio.</span><br /><br /><span style=\"color: #ff0000;\"><strong>Requerimientos</strong></span></p>\r\n<ol>\r\n<li>Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</li>\r\n<li>A&ntilde;os de experiencia: 3</li>\r\n<li>Edad: entre 28 y 46 a&ntilde;os</li>\r\n<li>Conocimientos: Microsoft Excel, SAP</li>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ol>',2),(7,'Diseñador grafico - Técnico o superior','Estamos solicitando personal, \"diseñador\" para sus puntos de venta localizados en la zona, debe tener conocimientos en alguno de los diferentes softwares de diseño, Corel, Photoshop o Illustrator.','2019-05-07',7200,'Aprobada',1,'logo3.png','<p><strong><span style=\"color: #0000ff;\">DESCRIPCION</span></strong></p>\r\n<p><span style=\"color: #ff0000;\"><em><strong>Consultor&iacute;a de Imagen est&aacute; en b&uacute;squeda del talento de un Dise&ntilde;ador Gr&aacute;fico</strong></em></span><br /><br /><span style=\"color: #0000ff;\"><em><strong>REQUISITOS:</strong></em></span><br /><br /><span style=\"color: #000000;\">- Licenciatura en Dise&ntilde;o</span><br /><span style=\"color: #000000;\">- Experiencia m&iacute;nima de dos a&ntilde;os desarrollando actividades de dise&ntilde;o publicitario, y de identidad corporativa.</span><br /><span style=\"color: #000000;\">- Manejo de paqueter&iacute;a: Photo shop, Illustrator, Adobe InDesign, Dreamweaver, HTML</span><br /><span style=\"color: #000000;\">- Desarrollo de mensajes visuales, informativos, de identidad y de persuasi&oacute;n</span><br /><span style=\"color: #000000;\">- Estrategia digital, uso de medios digitales audio, v&iacute;deo e imagen</span></p>\r\n<p><span style=\"color: #0000ff;\"><em><strong>FUNCIONES:</strong></em></span></p>\r\n<p><span style=\"color: #000000;\">- Dise&ntilde;ar papeler&iacute;a institucional, estrategias digitales, presentaciones corporativas. Crear y editar fotograf&iacute;as y gr&aacute;ficos - Preparar archivos para impresi&oacute;n digital y offset</span><br /><span style=\"color: #000000;\">- Dise&ntilde;o, construcci&oacute;n y mantenimiento de p&aacute;ginas web, as&iacute; como campa&ntilde;as de mailing-newsletter etc.</span><br /><span style=\"color: #000000;\">- Dise&ntilde;o de material gr&aacute;fico para redes sociales y p&aacute;ginas web</span><br /><span style=\"color: #000000;\">- Desarrollo y dise&ntilde;o de eventos como ferias, exposiciones, festejos, aniversarios etc.</span><br /><br /><span style=\"color: #0000ff;\"><em><strong>OFRECEMOS:</strong></em></span></p>\r\n<p><span style=\"color: #000000;\">- Pago semanal</span><br /><span style=\"color: #000000;\">- Prestaciones de Ley</span><br /><span style=\"color: #000000;\">- Contrataci&oacute;n directa por la empresa Horario 9:00 AM&ndash; 7:00 PM de Lunes a Viernes</span></p>\r\n<p><span style=\"color: #0000ff;\"><em><strong>REQUERIMIENTOS:</strong></em></span></p>\r\n<p><span style=\"color: #000000;\">- Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</span><br /><span style=\"color: #000000;\">- A&ntilde;os de experiencia: 2</span><br /><span style=\"color: #000000;\">- Edad: entre 24 y 40 a&ntilde;os</span><br /><span style=\"color: #000000;\">- Conocimientos: Microsoft Office</span><br /><span style=\"color: #000000;\">- Disponibilidad de viajar: No</span><br /><span style=\"color: #000000;\">- Disponibilidad de cambio de residencia: No</span></p>',9),(8,'Gerente de Recursos Humanos','Reclutamos para una empresa líder de transporte especializado un Gerente de Recursos Humanos con buen liderazgo, dinámico, negociador, pro activo, enfocado a resultados.','2019-05-08',22000,'Eliminada',1,'logo1.png','<p><span style=\"color: #ff0000;\"><strong>Funciones:</strong></span></p>\r\n<ul>\r\n<li>Responsable de las &aacute;reas de Reclutamiento, Capcitaci&oacute;n, N&oacute;mina, Laboral, Compensaciones, Seguridad Patrimonial.</li>\r\n<li>Promover la cultura organizacional</li>\r\n<li>Asegurar el cumplimiento de pol&iacute;ticas, normas y procedimientos.</li>\r\n<li>Desarrollar el talento.</li>\r\n<li>Asegurar el reclutamiento en tiempo y forma, cuidando las pol&iacute;ticas establecidas.</li>\r\n<li>Garantizar la equidad interna, competitividad externa y pago oportuno.</li>\r\n<li>Asegurar el cumplimiento del Reglamento Interior de Trabajo.</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Requisitos:</strong></span></p>\r\n<ul>\r\n<li>Carrera profesional (LAE, LRH, af&iacute;n)</li>\r\n<li>5 a&ntilde;os de experiencia como Gerente de Recursos Humanos</li>\r\n<li>Experiencia en empresas de transporte</li>\r\n<li>Conocimiento en esquemas de desarrollo, compensaciones, reclutamiento.</li>\r\n<li>Preferentemente con buen nivel de ingl&eacute;s</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Se ofrece:</strong></span></p>\r\n<ul>\r\n<li>Sueldo competitivo</li>\r\n<li>Prestaciones de ley</li>\r\n<li>Bonos de despensa</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Requerimientos</strong></span></p>\r\n<ul>\r\n<li>Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</li>\r\n<li>A&ntilde;os de experiencia: 5</li>\r\n<li>Idiomas: Ingl&eacute;s</li>\r\n<li>Edad: entre 30 y 50 a&ntilde;os</li>\r\n<li>Conocimientos: Microsoft Office</li>\r\n<li>Disponibilidad de viajar: Si</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ul>\r\n<p><span style=\"color: #0000ff;\"><strong>Interesados enviar su CV por este medio.</strong></span></p>',5),(9,'Residente de obra Arquitecto o Ing Civil','Estamos solicitando Arquitecto / Ing Civil con experiencia en desarrollos habitacionales, en los procesos de venta, comercialización, publicidad y administradores de obras.','2019-05-08',16500,'Aprobada',1,'logo12.png','<p><strong>Descripci&oacute;n</strong><br />Empresa constructora solicita personal para puesto de Residente de Obra.<br /><br /><strong>Escolaridad:</strong> Arquitecto y/o Ingeniero Civil<br /><br /><strong>Funci&oacute;n principal:</strong><br />* Supervisi&oacute;n y control de obra<br />* Cuantificacion de avances<br />* Elaboraci&oacute;n de estimaciones<br />* Manejo de contratistas y personal<br />* Estimaciones de avance de obra<br />* Elaboraci&oacute;n de paquetes de obra<br />* Realizaciones de reports de obra<br />* Interpretaci&oacute;n de planos.( Memorias de calculo ..)<br />* An&aacute;lisis de precios unitarios.<br />* Ejecuci&oacute;n de proyectos.<br />* Bit&aacute;cora de obra<br /><br /><strong>Habilidades:</strong><br />* Negociaci&oacute;n, liderazgo, capacidad para resolver conflictos<br />* Opus, AutoCAD, Excell<br /><br /><strong>Requerimientos</strong><br />* Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura<br />* A&ntilde;os de experiencia: 4<br />* Idiomas: Ingl&eacute;s<br />* Edad: entre 27 y 60 a&ntilde;os<br />* Disponibilidad de viajar: No<br />* Disponibilidad de cambio de residencia: No</p>\r\n<p><span style=\"background-color: #ffffff; color: #0000ff;\"><strong>Interesados, favor en enviar su CV en formato PDF aqu&iacute; en la plataforma.</strong></span></p>',1),(10,'Administrador de redes y Sistema Operativo Red Hat','Empresa importante del sector financiero solicita Ing. de Sistemas para monitorear y administrar el desempeño de los servidores Linux.','2019-05-09',25000,'Aprobada',1,'logo14.png','<p style=\"text-align: center;\"><span style=\"color: #0000ff;\">&iexcl;&iexcl;INT&Eacute;GRATE A NUESTRO GRAN EQUIPO!!</span><br /><span style=\"color: #0000ff;\">EMPRESA IMPORTANTE SOLICITA ADMINISTRADOR DE SO RED HAT ENTERPRISE LINUX.</span></p>\r\n<p><span style=\"color: #ff0000;\"><strong>Requisitos:</strong></span></p>\r\n<ul>\r\n<li>Ingeniero en computaci&oacute;n o carrera af&iacute;n (Titulado)</li>\r\n<li>Promedio m&iacute;nimo de 8.0</li>\r\n<li>Sexo: Indistinto</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Experiencia m&iacute;nima de 2 a 3 a&ntilde;os en:</strong></span></p>\r\n<ul>\r\n<li>Instalaci&oacute;n, configuraci&oacute;n, aplicaci&oacute;n de parches y actualizaci&oacute;n del software mencionado.</li>\r\n<li>Implementaci&oacute;n de recomendaciones de seguridad inform&aacute;tica y buenas pr&aacute;cticas.</li>\r\n<li>Resoluci&oacute;n de problemas a nivel Sistema Operativo.</li>\r\n<li>Monitoreo y an&aacute;lisis de desempe&ntilde;o de los servidores Linux.</li>\r\n<li>Atenci&oacute;n de reportes de Soporte t&eacute;cnico, atenci&oacute;n y asesor&iacute;as a usuarios finales asignados por el Centro de Soporte Institucional (Mesa de Ayuda).</li>\r\n<li>Alta, baja y modificaci&oacute;n de cuentas de usuario.</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Contar con alguno de los siguientes cursos:</strong></span></p>\r\n<ul>\r\n<li>Red Hat System Administration I version 6 o superior</li>\r\n<li>Red Hat System Administration II</li>\r\n<li>Certificaci&oacute;n Red Hat Certified System Administrator (RHCSA) para versi&oacute;n 6 o superior</li>\r\n<li>Red Hat Certified Engineer (RHCE) para versi&oacute;n 6 o superior</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Propuesta de trabajo:</strong></span></p>\r\n<ul>\r\n<li>Sueldo seg&uacute;n experiencia y conocimientos</li>\r\n<li>Prestaciones de Ley</li>\r\n<li>Zona de trabajo: Legar&iacute;a</li>\r\n<li>Horario propuesto: lunes a viernes de 9 &ndash; 18 horas</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Requerimientos</strong></span></p>\r\n<ol>\r\n<li>Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</li>\r\n<li>A&ntilde;os de experiencia: 2</li>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ol>\r\n<p><span style=\"color: #008000;\"><strong>SI CUMPLES CON LOS REQUISITOS MENCIONADOS NO DUDES EN ENVIARNOS TU CV POR ESTE MEDIO.</strong> </span></p>',3),(11,'Programador de Software','Empresa con presencia a nivel nacional, te invita a formar parte de su equipo de trabajo para diseñar, crear y realizar mantenimiento a páginas y aplicaciones web.','2019-05-09',19700,'Creada',1,'logo15.png','<p><span style=\"color: #ff0000;\"><strong>PROGRAMADOR DE SOFTWARE</strong></span><br /><br /><strong>OBJETIVO:</strong> DISE&Ntilde;AR, CREAR Y REALIZAR MANTENIMIENTO A P&Aacute;GINAS Y APLICACIONES WEB<br /><br /><strong><span style=\"color: #0000ff;\">REQUISITOS:</span></strong></p>\r\n<p>* EDAD: 25 A 35 A&Ntilde;OS<br />* LICENCIATURA: DESARROLLO DE SOFTWARE, INFORM&Aacute;TICA, INGENIER&Iacute;A EN SISTEMAS COMPUTACIONALES O AF&Iacute;N<br />* INGLES T&Eacute;CNICO<br />* EXPERIENCIA EN PUESTO SIMILAR M&Iacute;NIMA 3 A&Ntilde;OS (ESTAR EJERCIENDO ACTUALMENTE)<br />* MANEJO DE ERP<br />* EXPERIENCIA EN VISUAL C# (2 A&Ntilde;OS)<br />* EXPERIENCIA EN JAVA (2 A&Ntilde;OS)<br />* EXPERIENCIA EN MICROSOFT SQL SERVER (2 A&Ntilde;OS)<br />* EXPERIENCIA DE MVC Y POO (1 A&Ntilde;O)<br /><br /><strong><span style=\"color: #0000ff;\">FUNCIONES: (EXPERIENCIA EN ESTAS ACTIVIDADES)</span></strong></p>\r\n<p>* MANEJO DE C&Oacute;DIGO EN DISTINTOS LENGUAJES DE PROGRAMACI&Oacute;N, TALES COMO HTML, XML PHP Y JAVASCRIPT.<br />* DISE&Ntilde;AR NUEVAS APLICACIONES Y SITIOS DE INTERNET<br />* DETECTAR Y SOLUCIONAR ERRORES O PROBLEMAS EN LA EJECUCI&Oacute;N DE LAS APLICACIONES Y SITIOS WEB.<br />* AGREGAR NUEVAS FUNCIONES A LA EJECUCI&Oacute;N DE LOS SITIOS DE INTERNET Y LAS APLICACIONES<br />* ESTAR AL CORRIENTE CON LOS NUEVOS LENGUAJES DE PROGRAMACI&Oacute;N, TECNOLOG&Iacute;AS Y TENDENCIAS EN EL MERCADO<br />* COLABORAR EN LA ATENCI&Oacute;N Y CAPACITACI&Oacute;N DE LOS USUARIOS EN LOS SISTEMAS IMPLEMENTADOS<br />* DOCUMENTAR ADECUADAMENTE LOS PROGRAMAS DESARROLLADOS<br /><br /><strong><span style=\"color: #0000ff;\">OFERTA:</span></strong></p>\r\n<p>* PERCEPCI&Oacute;N MENSUAL $10,000 NETOS (PAGO QUINCENAL, INCLUYE VALES DE DESPENSA)<br />* PRESTACIONES DE LEY<br />* HORARIO: L-V 9:00 A 7:00 Y S&Aacute;BADO MEDIO D&Iacute;A<br /><br /><span style=\"color: #0000ff;\"><strong>REQUERIMIENTOS</strong></span></p>\r\n<p>* EDUCACI&Oacute;N M&Iacute;NIMA: EDUCACI&Oacute;N SUPERIOR - LICENCIATURA<br />* A&Ntilde;OS DE EXPERIENCIA: 3<br />* IDIOMAS: INGL&Eacute;S<br />* EDAD: ENTRE 25 Y 35 A&Ntilde;OS<br />* CONOCIMIENTOS: SQL SERVER, C#, JAVA, ASP.NET MVC, MYSQL<br />* DISPONIBILIDAD DE VIAJAR: NO<br />* DISPONIBILIDAD DE CAMBIO DE RESIDENCIA: NO</p>\r\n<p><em><strong>SI CUMPLES CON EL PERFIL. POR FAVOR ENVIANOS TU CV POR ESTE MEDIO EN FORMATO PDF, DOCX.</strong></em></p>\r\n<p>&nbsp;</p>',8),(12,'Ejecutivo Contable','Empresa internacional solicita Contador Público para realizar las siguientes actividades: conciliaciones y movimientos bancarios, emisión de estados financieros, cálculo de impuestos y presentación de declaraciones, estrategias fiscales, entre otros.','2019-05-09',16900,'Aprobada',1,'logo10.png','<p><strong>EMPRESA L&Iacute;DER EN LA ADMINISTRACI&Oacute;N DE CAPITAL HUMANO EST&Aacute; EN B&Uacute;SQUEDA DE:</strong><br /><br /><strong>EJECUTIVO DE CONTABLE</strong><br /><br /><strong><span style=\"color: #ff0000;\">REQUISITOS:</span></strong><br /><br />- Contabilidad (Titulado o Pasante)<br />- 1 a&ntilde;o de experiencia comprobable en el &aacute;rea contable.<br /><br /><span style=\"color: #ff0000;\"><strong>FUNCIONES:</strong></span><br /><br />- Manejar los registros contables (p&oacute;lizas de ingreso y egresos diarios).<br />- C&aacute;lculo de impuestos provisionales.<br />- C&aacute;lculo de declaraciones anuales para personas morales y f&iacute;sicas.<br />- Elaboraci&oacute;n de estados financieros.<br />- Atenci&oacute;n a visitas domiciliarias.<br /><br /><strong>ZONA DE TRABAJO: Col. Buena Vista, D.F</strong></p>\r\n<p><span style=\"color: #ff0000;\"><strong>OFRECEMOS:</strong></span></p>\r\n<p>- Salario atractivo, seg&uacute;n experiencia.<br />- Prestaciones superiores a las de ley (seguro de vida, seguro de gastos m&eacute;dicos, seguro de gastos funerarios, tarjeta de descuentos, universidad corporativa), desde el primer d&iacute;a.<br /><br /><span style=\"color: #ff0000;\"><strong>REQUERIMIENTOS:</strong></span></p>\r\n<p>- Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura<br />- A&ntilde;os de experiencia: 1<br />- Disponibilidad de viajar: Si<br />- Disponibilidad de cambio de residencia: No</p>\r\n<p>INTERESADOS FAVOR DE ENVIAR SU CV POR ESTE MEDIO.<br /><br /><strong>SOMOS UNA EMPRESA INCLUYENTE QUE RESPETA LA DIVERSIDAD Y NO HACE NING&Uacute;N TIPO DE DISCRIMINACI&Oacute;N YA SEA POR G&Eacute;NERO, DISCAPACIDAD, ORIENTACI&Oacute;N POL&Iacute;TICA, RELIGIOSA O SEXUAL, NI CONDICI&Oacute;N SOCIAL O EDAD.</strong></p>',2),(13,'Ingeniero electrónico','Estamos reclutando Ing. Electrónico para diseñar equipos y sistemas electrónicos (circuitos), tanto analógicos como digitales y para dirigir la operación de equipos y sistemas electrónicos en las áreas de comunicación, control, instrumentación y potencia.','2019-05-09',23600,'Creada',1,'logo13.png','<p>&iexcl;&Uacute;nete a nuestro equipo de trabajo!<br /><br />Nuestra visi&oacute;n es ser la inspiraci&oacute;n de la industria de la entrega inmediata, a trav&eacute;s del desarrollo del talento humano y la excelencia operacional.</p>\r\n<p><span style=\"color: #0000ff;\"><strong>FUNCIONES:</strong></span><br />- Mantendr&aacute; los equipos, maquinaria dentro del sectro en excelentes condiciones mediante un buen servicio de mantenimiento preventivo, correctivo, predictivo.<br />- Evitar&aacute; paros inoportunos y p&eacute;rdidas para la empresa.<br />- Apoyar&aacute; a producci&oacute;n medienta capacitaci&oacute;n de maquinaria nueva.<br />- Coordinar&aacute; al personal para establecer par&aacute;metros en &aacute;rea.<br /><br /><span style=\"color: #0000ff;\"><strong>DEBERAS TENER:</strong></span><br />- Ing. en mecatr&oacute;nica, electr&oacute;nica y electromec&aacute;nico.<br />- Experiencia en el ramo de mantenimiento en general.<br />- Conocimiento en maquinaria industrial.<br />- 2 a&ntilde;os de experiencia minimo.<br />- Destrezay habilidad en herramientas mec&aacute;nicas, el&eacute;ctricas y electr&oacute;nicas.<br /><br /><span style=\"color: #0000ff;\"><strong>VALORAMOS:</strong></span><br />- Liderazgo<br />- Responsabilidad<br />- Actitud de servicio<br />- Enfoque a resultados<br />- Comunicaci&oacute;n efectiva<br />- Retenci&oacute;n de informaci&oacute;n<br />- Habilidad anal&iacute;tica<br /><br /><span style=\"color: #0000ff;\"><strong>QUE OFRECEMOS:</strong></span><br />- Prestaciones superiores a la ley (fondo de ahorro, 30 d&iacute;as de aguinaldo, 15 d&iacute;as de vacaciones, vales de despensa, utilidades, bono por puntualidad y asistencia, SGMM).<br />- Estabilidad y crecimiento laboral.</p>\r\n<p><span style=\"color: #0000ff;\"><strong>REQUERIMIENTOS:</strong></span><br />- Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura<br />- A&ntilde;os de experiencia: 3<br />- Edad: entre 25 y 30 a&ntilde;os<br />- Conocimientos: Windows, Administraci&oacute;n de archivos<br />- Disponibilidad de viajar: No<br />- Disponibilidad de cambio de residencia: No</p>\r\n<p><span style=\"color: #0000ff;\"><strong>SI CUBRES EL PERFIL, POR FAVOR ENVIANOS TU CV POR ESTE MEDIO.</strong></span></p>',4),(14,'Programador de Blockchain y Bitcoin','Empresa Mexicana requiere Ing. de Sistemas con experiencia en desarrollo de Blockchain, Bitcoin y Cryptomonedas.','2019-06-01',20000,'Aprobada',1,'AYHRERYKlogo-bitcoin.png','<p><span style=\"color: #ff0000;\"><strong>Educaci&oacute;n:</strong></span></p>\r\n<ul>\r\n<li>Ing. en Sistemas, de preferencia con estudios de Maestria.</li>\r\n<li>Ingles</li>\r\n</ul>\r\n<p><span style=\"color: #ff0000;\"><strong>Requisitos:</strong></span></p>\r\n<ol>\r\n<li>Experiencia en Sistemas Descentralizados.</li>\r\n<li>Desarrollo de aplicaciones en el blockchain de Bitcoin (dApps).</li>\r\n<li>Conocimientos de Contratos Inteligentes (Ethereum).</li>\r\n</ol>\r\n<p><span style=\"color: #0000ff;\"><em><strong>Si cumples con los requisitos mencionares, por favor env&iacute;anos tu CV en formato PDF.</strong></em></span></p>',16);
/*!40000 ALTER TABLE `Vacantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('marisa','SUPERVISOR'),('ivan','ADMINISTRADOR');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('ivan','{noop}ivan123',1),('marisa','{noop}mari123',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-19 20:25:25
