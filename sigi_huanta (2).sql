-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-12-2025 a las 04:01:57
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sigi_huanta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sigi_modulo_formativo`
--

DROP TABLE IF EXISTS `sigi_modulo_formativo`;
CREATE TABLE IF NOT EXISTS `sigi_modulo_formativo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(1000) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nro_modulo` int NOT NULL,
  `id_plan_estudio` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modulo_plan` (`id_plan_estudio`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `sigi_modulo_formativo`
--

INSERT INTO `sigi_modulo_formativo` (`id`, `descripcion`, `nro_modulo`, `id_plan_estudio`) VALUES
(1, 'ANALISIS Y DISEÑO DE SISTEMAS WEB', 1, 1),
(2, 'DESARROLLO DE APLICACIONES WEB', 2, 1),
(3, 'DISEÑO DE SERVICIOS WEB', 3, 1),
(4, 'ASISTENCIA EN PROMOCIÓN Y PREVENCIÓN DE LA SALUD', 1, 2),
(5, 'ASISTENCIA EN LA ATENCIÓN BÁSICA DE LA SALUD', 2, 2),
(6, 'ASISTENCIA EN LA ATENCIÓN INTEGRAL EN SALUD', 3, 2),
(7, 'MANEJO DE LA MATERIA PRIMA', 1, 3),
(8, 'PROCESO DE LA PRODUCCIÓN EN LA INDUSTRIA ALIMENTARIA', 2, 3),
(9, 'ENVASADO Y EMBALADO DE ALIMENTOS', 3, 3),
(10, 'CONTROL PARA EL ASEGURAMIENTO DE LA CALIDAD DE ALIMENTOS', 4, 3),
(11, 'MANTENIMIENTO PROGRAMADO Y REPARACIÓN DE LOS SISTEMAS DE CONTROL DEL VEHÍCULO', 1, 4),
(12, 'MANTENIMIENTO Y REPARACIÓN DEL SISTEMA ELÉCTRICO Y ELECTRÓNICO AUTOMOTRIZ', 2, 4),
(13, 'MANTENIMIENTO Y REPARACIÓN DEL SISTEMA DE TRANSMISIÓN.', 3, 4),
(14, 'MANTENIMIENTO Y REPARACIÓN DE MOTORES DE COMBUSTIÓN INTERNA Y SISTEMAS ELECTRÓNICOS.', 4, 4),
(15, 'GESTIÓN DE LA PRODUCCIÓN DE CULTIVOS', 1, 5),
(16, 'GESTIÓN DE LA PRODUCCIÓN PECUARIA', 2, 5),
(17, 'PREVENCIÓN Y MANEJO SANITARIO Y FITOSANITARIO', 3, 5),
(18, 'APROVECHAMIENTO Y MERCADEO DE PRODUCTOS AGROPECUARIOS', 4, 5),
(19, 'RECEPCIÓN, ACONDICIONAMIENTO Y MEZCLADO DE LA MATERIA PRIMA E INSUMOS.', 1, 7),
(20, 'TRATAMIENTO TÉRMICO, OPERACIONES DE ELIMINACIÓN DE AGUA Y SEPARACIÓN EN EL PROCESAMIENTO DE ALIMENTOS.', 2, 7),
(21, 'BIOTECNOLOGÍA Y ENVASADO EN EL PROCESAMIENTO DE ALIMENTOS.', 3, 7),
(22, 'ASEGURAMIENTO DE LA CALIDAD.', 4, 7),
(23, 'ASISTENCIA EN PROMOCIÓN Y PREVENCIÓN DE LA SALUD', 1, 6),
(24, 'ASISTENCIA EN LA ATENCIÓN BÁSICA DE LA SALUD', 2, 6),
(25, 'ASISTENCIA EN LA ATENCIÓN INTEGRAL EN SALUD', 3, 6),
(26, 'PREPARACIÓN DEL TERRENO E IMPLEMENTACIÓN DE INFRAESTRUCTURA AGROPECUARIA', 1, 9),
(27, 'SUPERVISIÓN Y EJECUCIÓN DEL PLAN OPERATIVO DE LOS PROCESOS PRODUCTIVOS AGROPECUARIOS', 2, 9),
(28, 'PROCESAMIENTO PRIMARIO Y APROVECHAMIENTO DE PRODUCTOS AGROPECUARIOS.', 3, 9),
(29, 'ALMACENAMIENTO Y COMERCIALIZACIÓN DE LA PRODUCCIÓN AGROPECUARIA', 4, 9),
(30, 'MANTENIMIENTO DE VEHÍCULOS CONVENCIONALES Y CON ASISTENCIA ELECTRÓNICA.', 1, 8),
(31, 'MANTENIMIENTO DE SISTEMAS ELECTRÍCOS Y ELECTRÓNICOS AUTOMOTRICES.', 2, 8),
(32, 'MANTENIMIENTO DEL SISTEMA DE TRANSMISIÓN DE VEHÍCULOS CON ASISTENCIA ELECTRÓNICA.', 3, 8),
(33, 'MANTENIMIENTO DE MOTORES DE COMBUSTIÓN INTERNA CON ASISTENCIA ELECTRÓNICA.', 4, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sigi_planes_estudio`
--

DROP TABLE IF EXISTS `sigi_planes_estudio`;
CREATE TABLE IF NOT EXISTS `sigi_planes_estudio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_programa_estudios` int NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `resolucion` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `perfil_egresado` varchar(3000) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_planes_programa` (`id_programa_estudios`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `sigi_planes_estudio`
--

INSERT INTO `sigi_planes_estudio` (`id`, `id_programa_estudios`, `nombre`, `resolucion`, `fecha_registro`, `perfil_egresado`) VALUES
(1, 1, '2021', 'RD. 095-8566', '2025-08-11 08:58:16', 'El Profesional Técnico de Diseño y Programación Web, cuenta con habilidades para diseñar y desarrollar proyectos Web en medios digitales y multimediales. Propone soluciones creativas e innovadoras que respondan a las necesidades y requerimientos del cliente y a las exigencias del mercado laboral, así como coordinar la implementación de proyectos Web y posicionamiento SEO, aplicando estándares de seguridad. También, se desempeña con responsabilidad, eficiencia y valores orientados hacia la mejora continua.  Destaca por contar con habilidades para la innovación y generar buenas prácticas en la empresa orientadas al trabajo colaborativo, efectivo y ético. Se comunica de manera efectiva en español y en inglés en contextos sociales y empresariales. Además, utiliza herramientas informáticas que le permiten optimizar procesos de trabajo en forma individual y colaborativo , y la toma de decisiones; poniendo en evidencia actitudes para la resolución de problemas.'),
(2, 2, '2021', 'RD. 095-8566', '2025-08-11 08:58:32', 'Profesional técnico de nivel superior, capacitado para implementar los cuidados de enfermería centrado en la persona, brindando la atención integral a la persona, familia y comunidad en los diferentes niveles de atención y prevención a lo largo de su ciclo vital, en un rol propio o de colaboración en el equipo multidisciplinario tomando en cuenta las normas vigentes y la ética profesional; es capaz de abordar  situaciones y resolver problemas relacionados a su actividad y de la organización, interactuando a través de una comunicación efectiva, el uso del idioma inglés, quechua y las tecnologías de la información y comunicación, considerando su entorno intercultural.'),
(3, 3, '2021', 'RD. 095-8566', '2025-08-11 08:58:48', 'El profesional técnico de nivel superior del  programa de estudios de Industrias Alimentarias, es competente en el manejo de la materia prima, planificación y control de los procesos de producción de alimentos,  garantizando la inocuidad a través de la implementación de sistemas de gestión de calidad en un marco ético. Interactúa de manera colaborativa en su entorno laboral con una comunicación asertiva y manejo del idioma ingles para interpretar y comunicar instrucciones vinculados a su formación, así mismo utiliza las tecnologías de la información y comunicación, capaz de abordar problemas de su campo laboral a través de la  innovación y emprendimiento que conlleven a la mejora continua, promoviendo el cuidado del medio ambiente.'),
(4, 4, '2021', 'RD. 095-8566', '2025-08-11 08:59:05', 'El Profesional Técnico de Mecatrónica Automotriz está en la capacidad de realizar el diagnóstico, mantenimiento y reparación de los diferentes mecanismos y sistemas del vehículo automotor; según especificaciones técnicas del fabricante. Asimismo, tiene la habilidad de comunicarse con fluidez y seguridad, redactar documentos técnicos e interpretar manuales y catálogos en inglés, utilizando las herramientas informáticas.Practica actividades para el bienestar integral desarrollando valores, disciplina y actividades colaborativas. Está preparado para emprender su propio proyecto o negocio, siendo capaz de resolver situaciones complejas evaluando posibles soluciones y teniendo en cuenta la preservación y conservación del medio ambiente. Así también está preparado para laborar en las entidades públicas y privadas del sector automotriz, logrando integrarse de manera asertiva, estableciendo relaciones de respeto y justicia con los demás, lo que hace de él, un líder que busca el bienestar de su equipo y de la empresa.'),
(5, 5, '2021', 'RD. 095-8566', '2025-08-11 08:59:23', 'El profesional técnico de producción agropecuaria, es competente para gestionar y desarrollar una explotación agropecuaria familiar y/o empresarial de manera sostenible, de acuerdo a la vocación productiva y características del entorno  con énfasis en la innovación, así como su comercialización con valor agregado; capaz de abordar situaciones y resolver problemas relacionado a su actividad y la organización, interactuando de manera colaborativa a través de una comunicación efectiva, el uso del idioma inglés, las tecnologías de la información y comunicación.'),
(6, 2, '2025', '--', '2025-08-11 08:59:50', 'El profesional técnico en Enfermería Tecnica, es competente para brindar atención integral a la persona, familia y comunidad,  en actividades de  promoción y prevención de la salud, en diferentes etapas de la vida teniendo en cuenta las necesidades básicas de la salud y la normativa vigente; aplicando el enfoque  intercultural, de derechos y de género en diversos contextos. Se comunica de manera asertiva, efectiva, es capaz de abordar situaciones y resolver problemas  en su ambito laboral bajo principios éticos, se desempeña de manera colaborativa, mantiene una comunicación efectiva en el idioma quechua; evidencia dominio de las herramientas informaticas, identifica ideas de negocio,  es emprendedor e innovador y demostrando liderazgo.'),
(7, 6, '2025', '--', '2025-08-11 09:00:09', 'El profesional técnico del  programa de estudios de Industrias de Alimentos y Bebidas, es competente en el manejo de la materia prima e insumos como en la recepción y acondicionamiento,  realiza el proceso de mezclado, tratamiento térmico, operaciones de eliminación de agua, separación y hace el uso de la biotecnología para los procesos de producción de alimentos y bebidas,  garantizando la inocuidad a través de la implementación de sistemas de gestión de calidad en un marco ético. Así mismo, ejecuta el envasado y la protección de los alimentos y bebidas. Interactúa de manera colaborativa en su entorno laboral con una comunicación efectiva y manejo del idioma inglés para interpretar y comunicar instrucciones vinculados a su formación, utiliza las tecnologías de la información y comunicación, con capacidad de solucionar  problemas de su campo laboral a través de la  innovación y emprendimiento que conlleven a la mejora continua, promoviendo el cuidado del medio ambiente.'),
(8, 4, '2025', '--', '2025-08-11 09:00:30', 'El Profesional Técnico de Mecatrónica Automotriz está en la capacidad de realizar el diagnóstico, mantenimiento y reparación de los diferentes mecanismos y sistemas del vehículo automotor; según especificaciones técnicas del fabricante. Asimismo, tiene la habilidad de comunicarse con fluidez y seguridad, redactar documentos técnicos e interpretar manuales y catálogos en inglés, utilizando las herramientas informáticas. Practica actividades para el bienestar integral desarrollando valores, disciplina y actividades colaborativas. Está preparado para emprender su propio proyecto o negocio, siendo capaz de resolver situaciones complejas evaluando posibles soluciones y teniendo en cuenta la preservación, emprender e innovar procesos de productos o servicios.'),
(9, 5, '2025', '--', '2025-08-11 09:00:46', 'El profesional técnico del Programa de Estudios de Producción Agropecuaria es competente en gestionar procesos de producción agrícola y pecuaria, aplicando técnicas agroecológicas y buenas prácticas agropecuarias, para obtener productos de calidad destinados a la comercialización y/o transformación. Supervisa la ejecución del plan operativo agrícola y/o pecuario de acuerdo con la unidad productiva, implementando la infraestructura productiva agrícola /pecuaria de acuerdo con el plan de producción, realizando la instalación y preparación del terreno de acuerdo al tipo de cultivo, requerimientos del mercado, supervisando el cumplimiento de los procesos de prevención y control de plagas/enfermedades agrícolas y pecuarios.   Asimismo, establece un seguimiento al procesamiento primario de productos agropecuarios  de acuerdo con requerimientos del mercado, optimizando el aprovechamiento primario de productos y subproductos agropecuarios, aplicando normas técnicas vigentes.  Establece el cumplimiento del proceso de almacenamiento de los productos agropecuarios de acuerdo a las normas, garantizando la adecuada presentación, conservación y comercialización de la producción primaria agrícola y/o pecuaria de acuerdo con los parámetros requeridos de los mercados de destino, dando cumplimiento a los procedimientos establecidos y normativa vigente.  Se comunica de manera efectiva, utiliza las tecnologías de la información y comunicación con dominio del idioma inglés, para interpretar y comunicar instrucciones que faciliten su actividad profesional. Asimismo, identifica nuevas oportunidades de negocios agropecuarios, mejora un proceso, producto o servicio. Se desempeña de manera colaborativa, analiza y plantea situaciones para resolver problemas relacionados a su ámbito laboral bajo principios éticos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sigi_programa_estudios`
--

DROP TABLE IF EXISTS `sigi_programa_estudios`;
CREATE TABLE IF NOT EXISTS `sigi_programa_estudios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `sigi_programa_estudios`
--

INSERT INTO `sigi_programa_estudios` (`id`, `codigo`, `tipo`, `nombre`) VALUES
(1, 'DPW', 'Modular', 'DISEÑO Y PROGRAMACIÓN WEB'),
(2, 'ET', 'Modular', 'ENFERMERÍA TÉCNICA'),
(3, 'IA', 'Modular', 'INDUSTRIAS ALIMENTARIAS'),
(4, 'MA', 'Modular', 'MECATRONICA AUTOMOTRIZ'),
(5, 'PA', 'Modular', 'PRODUCCIÓN AGROPECUARIA'),
(6, 'IAB', 'Modular', 'INDUSTRIAS DE ALIMENTOS Y BEBIDAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sigi_semestre`
--

DROP TABLE IF EXISTS `sigi_semestre`;
CREATE TABLE IF NOT EXISTS `sigi_semestre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(5) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `id_modulo_formativo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_modulo_formativo` (`id_modulo_formativo`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `sigi_semestre`
--

INSERT INTO `sigi_semestre` (`id`, `descripcion`, `id_modulo_formativo`) VALUES
(1, 'I', 1),
(2, 'II', 1),
(3, 'III', 2),
(4, 'IV', 2),
(5, 'V', 3),
(6, 'VI', 3),
(7, 'I', 4),
(8, 'II', 4),
(9, 'III', 5),
(10, 'IV', 5),
(11, 'V', 6),
(12, 'VI', 6),
(13, 'I', 7),
(14, 'II', 8),
(15, 'III', 8),
(16, 'IV', 8),
(17, 'V', 9),
(18, 'VI', 10),
(19, 'I', 11),
(20, 'II', 11),
(21, 'III', 12),
(22, 'IV', 13),
(23, 'V', 14),
(24, 'VI', 14),
(25, 'I', 15),
(26, 'II', 15),
(27, 'III', 16),
(28, 'IV', 16),
(29, 'V', 17),
(30, 'VI', 18),
(31, 'I', 19),
(32, 'II', 19),
(33, 'III', 20),
(34, 'IV', 20),
(35, 'V', 21),
(36, 'VI', 22),
(37, 'I', 23),
(38, 'II', 23),
(39, 'III', 24),
(40, 'IV', 24),
(41, 'V', 25),
(42, 'VI', 25),
(43, 'I', 26),
(44, 'II', 27),
(45, 'III', 27),
(46, 'IV', 27),
(47, 'V', 28),
(48, 'VI', 29),
(49, 'I', 30),
(50, 'II', 30),
(51, 'III', 31),
(52, 'IV', 32),
(53, 'V', 33),
(54, 'VI', 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sigi_unidad_didactica`
--

DROP TABLE IF EXISTS `sigi_unidad_didactica`;
CREATE TABLE IF NOT EXISTS `sigi_unidad_didactica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `id_semestre` int NOT NULL,
  `creditos_teorico` int NOT NULL,
  `creditos_practico` int NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `orden` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_semestre` (`id_semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `sigi_unidad_didactica`
--

INSERT INTO `sigi_unidad_didactica` (`id`, `nombre`, `id_semestre`, `creditos_teorico`, `creditos_practico`, `tipo`, `orden`) VALUES
(1, 'FUNDAMENTOS DE PROGRAMACIÓN', 1, 2, 2, 'ESPECIALIDAD', 1),
(2, 'REDES E INTERNET', 1, 1, 2, 'ESPECIALIDAD', 2),
(3, 'ANÁLISIS Y DISEÑO DE SISTEMAS', 1, 2, 2, 'ESPECIALIDAD', 3),
(4, 'INTRODUCCIÓN DE BASE DE DATOS', 1, 2, 1, 'ESPECIALIDAD', 4),
(5, 'ARQUITECTURA DE COMPUTADORAS', 1, 1, 1, 'ESPECIALIDAD', 5),
(6, 'COMUNICACIÓN ORAL', 1, 1, 1, 'EMPLEABILIDAD', 6),
(7, 'APLICACIONES EN INTERNET ', 1, 1, 1, 'EMPLEABILIDAD', 7),
(8, 'METODOLOGÍA DE DESARROLLO DE SOFTWARE', 2, 1, 2, 'ESPECIALIDAD', 1),
(9, 'PROGRAMACIÓN ORIENTADA A OBJETOS', 2, 0, 3, 'ESPECIALIDAD', 2),
(10, 'ARQUITECTURA DE SERVIDORES WEB', 2, 1, 2, 'ESPECIALIDAD', 3),
(11, 'APLICACIONES SISTEMATIZADAS ', 2, 1, 1, 'ESPECIALIDAD', 4),
(12, 'TALLER DE BASE DE DATOS', 2, 1, 2, 'ESPECIALIDAD', 5),
(13, 'INTERPRETACIÓN Y PRODUCCIÓN DE TEXTOS', 2, 1, 1, 'EMPLEABILIDAD', 6),
(14, 'OFIMÁTICA', 2, 1, 1, 'EMPLEABILIDAD', 7),
(15, 'ADMINISTRACIÓN DE BASE DE DATOS', 3, 2, 3, 'ESPECIALIDAD', 1),
(16, 'PROGRAMACIÓN DE APLICACIONES WEB', 3, 2, 3, 'ESPECIALIDAD', 2),
(17, 'DISEÑO DE INTERFACES WEB', 3, 2, 3, 'ESPECIALIDAD', 3),
(18, 'PRUEBAS DE SOFTWARE', 3, 1, 1, 'ESPECIALIDAD', 4),
(19, 'DESARROLLO DE ENTORNOS WEB', 4, 1, 3, 'ESPECIALIDAD', 1),
(20, 'PROGRAMACIÓN DE SOLUCIONES WEB', 4, 2, 3, 'ESPECIALIDAD', 2),
(21, 'PROYECTOS DE SOFTWARE', 4, 2, 1, 'ESPECIALIDAD', 3),
(22, 'SEGURIDAD EN APLICACIONES WEB', 4, 1, 1, 'ESPECIALIDAD', 4),
(23, 'INGLÉS PARA LA COMUNICACIÓN ORAL', 3, 1, 1, 'EMPLEABILIDAD', 5),
(24, 'COMPRENSIÓN Y REDACCIÓN EN INGLÉS', 4, 1, 1, 'EMPLEABILIDAD', 5),
(25, 'COMPORTAMIENTO ÉTICO', 4, 1, 2, 'EMPLEABILIDAD', 6),
(26, 'PROGRAMACIÓN DE APLICACIONES MÓVILES', 5, 2, 3, 'ESPECIALIDAD', 1),
(27, 'MARKETING DIGITAL', 5, 2, 1, 'ESPECIALIDAD', 2),
(28, 'DISEÑO DE SOLUCIONES WEB', 5, 2, 1, 'ESPECIALIDAD', 3),
(29, 'GESTIÓN Y ADMINISTRACIÓN DE SITIOS WEB', 5, 1, 1, 'ESPECIALIDAD', 4),
(30, 'DIAGRAMACIÓN DIGITAL', 5, 1, 2, 'ESPECIALIDAD', 5),
(31, 'SOLUCIÓN DE PROBLEMAS', 5, 1, 1, 'EMPLEABILIDAD', 6),
(32, 'OPORTUNIDADES DE NEGOCIOS', 5, 1, 1, 'EMPLEABILIDAD', 7),
(33, 'PLATAFORMA DE SERVICIOS WEB', 6, 1, 2, 'ESPECIALIDAD', 1),
(34, 'ILUSTRACIÓN Y GRÁFICA DIGITAL', 6, 2, 3, 'ESPECIALIDAD', 2),
(35, 'ADMINISTRACIÓN DE SERVIDORES WEB', 6, 2, 2, 'ESPECIALIDAD', 3),
(36, 'COMERCIO ELECTRÓNICO', 6, 2, 3, 'ESPECIALIDAD', 4),
(37, 'PLAN DE NEGOCIOS', 6, 1, 1, 'EMPLEABILIDAD', 5),
(38, 'SALUD COMUNITARIA ', 7, 1, 2, 'ESPECIALIDAD', 1),
(39, 'ATENCIÓN DE ENFERMERÍA A LA FAMILIA Y COMUNIDAD ', 7, 1, 2, 'ESPECIALIDAD', 2),
(40, 'PROMOCIÓN DE LA SALUD', 7, 1, 1, 'ESPECIALIDAD', 3),
(41, 'EDUCACIÓN PARA LA SALUD', 7, 1, 1, 'ESPECIALIDAD', 4),
(42, 'ASISTENCIA DE ENFERMERÍA EN INMUNIZACIONES ', 7, 1, 2, 'ESPECIALIDAD', 5),
(43, 'ATENCIÓN PARA LA PREVENCIÓN DE ENFERMEDADES', 7, 1, 1, 'ESPECIALIDAD', 6),
(44, 'COMUNICACIÓN ORAL', 7, 1, 1, 'EMPLEABILIDAD', 7),
(45, 'APLICACIONES EN INTERNET ', 7, 1, 1, 'EMPLEABILIDAD', 8),
(46, 'EVALUACIÓN DE LA INTERVENCIÓN DE ENFERMERÍA ', 8, 1, 1, 'ESPECIALIDAD', 1),
(47, 'EPIDEMIOLOGÍA ', 8, 1, 1, 'ESPECIALIDAD', 2),
(48, 'SALUD EN DESASTRES NATURALES  ', 8, 1, 1, 'ESPECIALIDAD', 3),
(49, 'ACTIVIDADES DE ENFERMERÍA EN SALUD PÚBLICA ', 8, 1, 2, 'ESPECIALIDAD', 4),
(50, 'ANATOMÍA Y FISIOLOGÍA HUMANA ', 8, 1, 2, 'ESPECIALIDAD', 5),
(51, 'MATEMÁTICA APLICADA A LA ENFERMERÍA', 8, 1, 1, 'ESPECIALIDAD', 6),
(52, 'TERMINOLOGIA EN SALUD HUMANA', 8, 0, 1, 'ESPECIALIDAD', 7),
(53, 'INTERPRETACIÓN Y PRODUCCIÓN DE TEXTOS ', 8, 1, 1, 'EMPLEABILIDAD', 8),
(54, 'OFIMÁTICA ', 8, 1, 1, 'EMPLEABILIDAD', 9),
(55, 'ASISTENCIA BÁSICA HOSPITALARIA', 9, 1, 4, 'ESPECIALIDAD', 1),
(56, 'ADMINISTRACION DE MEDICAMENTOS', 9, 1, 3, 'ESPECIALIDAD', 2),
(57, 'DOCUMENTACION EN SALUD', 9, 1, 1, 'ESPECIALIDAD', 3),
(58, 'MICROBIOLOGÍA Y MUESTRAS BIOLOGICAS', 9, 1, 2, 'ESPECIALIDAD', 4),
(59, 'INGLÉS PARA LA COMUNICACIÓN ORAL', 9, 1, 1, 'EMPLEABILIDAD', 5),
(60, 'QUECHUA', 9, 1, 1, 'EMPLEABILIDAD', 6),
(61, 'ATENCIÓN DE ENFERMERÍA EN URGENCIAS Y EMERGENCIAS', 10, 1, 3, 'ESPECIALIDAD', 1),
(62, 'PROCEDIMIENTOS INVASIVOS, NO INVASIVOS', 10, 1, 4, 'ESPECIALIDAD', 2),
(63, 'ESTADÍSTICA APLICADA A LA ENFERMERÍA', 10, 1, 1, 'ESPECIALIDAD', 3),
(64, 'QUÍMICA APLICADA A LA ENFERMERÍA', 10, 1, 2, 'ESPECIALIDAD', 4),
(65, 'COMPRENSIÓN Y REDACCIÓN EN INGLÉS', 10, 1, 1, 'EMPLEABILIDAD', 5),
(66, 'CULTURA AMBIENTAL', 10, 1, 1, 'EMPLEABILIDAD', 6),
(67, 'SALUD MATERNO NEONATAL', 11, 1, 2, 'ESPECIALIDAD', 1),
(68, 'ATENCIÓN DEL NIÑO Y ADOLESCENTE', 11, 1, 3, 'ESPECIALIDAD', 2),
(69, 'ATENCIÓNAL USUARIO QUIRÚRGICO', 11, 1, 3, 'ESPECIALIDAD', 3),
(70, 'ATENCIÓN DEL ADULTO Y ADULTO MAYOR ', 11, 2, 3, 'ESPECIALIDAD', 4),
(71, 'COMPORTAMIENTO ÉTICO', 11, 1, 1, 'EMPLEABILIDAD', 5),
(72, 'MEDICINA ALTERNATIVA', 12, 1, 4, 'ESPECIALIDAD', 1),
(73, 'ATENCIÓN DE EN SALUD MENTAL ', 12, 2, 3, 'ESPECIALIDAD', 2),
(74, 'ATENCIÓN DEL PACIENTE EN ESTADO CRÍTICO', 12, 2, 3, 'ESPECIALIDAD', 3),
(75, 'SOLUCIÓN DE PROBLEMAS E INNOVACIÓN', 12, 1, 2, 'EMPLEABILIDAD', 4),
(76, 'RECEPCIÓN DE MATERIA PRIMA', 13, 1, 2, 'ESPECIALIDAD', 1),
(77, 'ALMACENAMIENTO DE MATERIAS PRIMAS', 13, 1, 1, 'ESPECIALIDAD', 2),
(78, 'COMPOSICION DE LOS ALIMENTOS', 13, 1, 1, 'ESPECIALIDAD', 3),
(79, 'MAQUINARIA Y EQUIPOS EN LA RECEPCIÓN Y CLASIFICACIÓN DE LA MATERIA PRIMA', 13, 1, 1, 'ESPECIALIDAD', 4),
(80, 'OPERACIONES DE SELECCIÓN Y CLASIFICACIÓN', 13, 1, 1, 'ESPECIALIDAD', 5),
(81, 'OPERACIONES DE ACONDICIONAMIENTO DE LA MATERIA PRIMA ', 13, 0, 1, 'ESPECIALIDAD', 6),
(82, 'FUNDAMENTOS DE LAS OPERACIONES PRELIMINARES Y PRE TRATAMIENTO', 13, 1, 1, 'ESPECIALIDAD', 7),
(83, 'COMUNICACIÓN ORAL', 13, 1, 1, 'EMPLEABILIDAD', 8),
(84, 'APLICACIONES EN INTERNET ', 13, 0, 1, 'EMPLEABILIDAD', 9),
(85, 'SOLUCION DE PROBLEMAS', 13, 1, 1, 'EMPLEABILIDAD', 10),
(86, 'MATEMÁTICA APLICADA', 14, 1, 1, 'ESPECIALIDAD', 1),
(87, 'OPERACIONES UNITARIAS', 14, 0, 2, 'ESPECIALIDAD', 2),
(88, 'QUÍMICA APLICADA', 14, 1, 1, 'ESPECIALIDAD', 3),
(89, 'PLANEAMIENTO Y CONTROL DE LA PRODUCCIÓN ', 14, 1, 2, 'ESPECIALIDAD', 4),
(90, 'PROCESAMIENTO DE FRUTAS, HORTALIZAS Y LEGUMBRES', 14, 1, 3, 'ESPECIALIDAD', 5),
(91, 'INGLÉS PARA LA COMUNICACIÓN ORAL', 14, 1, 1, 'EMPLEABILIDAD', 6),
(92, 'INTERPRETACIÓN Y PRODUCCIÓN DE TEXTOS ', 14, 1, 1, 'EMPLEABILIDAD', 7),
(93, 'OFIMÁTICA', 14, 0, 1, 'EMPLEABILIDAD', 8),
(94, 'PROCESAMIENTO DE PRODUCTOS LÁCTEOS', 15, 1, 3, 'ESPECIALIDAD', 1),
(95, 'PROCESAMIENTO DE  PRODUCTOS CÁRNICOS E HIDROBIOLÓGICOS', 15, 1, 2, 'ESPECIALIDAD', 2),
(96, 'PROCESAMIENTO DE GRANOS, CEREALES Y TUBERCULOS', 15, 1, 1, 'ESPECIALIDAD', 3),
(97, 'BIOQUÍMICA APLICADA', 15, 1, 1, 'ESPECIALIDAD', 4),
(98, 'ANÁLISIS DE ALIMENTOS ', 15, 1, 4, 'ESPECIALIDAD', 5),
(99, 'COMPRENSIÓN Y REDACCIÓN EN INGLÉS', 15, 1, 1, 'EMPLEABILIDAD', 6),
(100, 'MICROBIOLOGÍA APLICADA', 16, 2, 2, 'ESPECIALIDAD', 1),
(101, 'REFRIGERACIÓN Y CONGELACIÓN DE ALIMENTOS ', 16, 1, 4, 'ESPECIALIDAD', 2),
(102, 'HIGIENE Y MANIPULACIÓN DE ALIMENTOS', 16, 1, 3, 'ESPECIALIDAD', 3),
(103, 'MAQUINARIAS Y EQUIPOS DE PROCESAMIENTO DE ALIMENTOS', 16, 1, 2, 'ESPECIALIDAD', 4),
(104, 'ÉTICA', 16, 1, 1, 'EMPLEABILIDAD', 5),
(105, 'FUNDAMENTOS DEL ENVASADO Y EMBALADO DE ALIMENTOS', 17, 2, 1, 'ESPECIALIDAD', 1),
(106, 'GESTION DE ENVASES, EMPAQUES Y EMBALAJES', 17, 1, 1, 'ESPECIALIDAD', 2),
(107, 'EQUIPOS DE ENVASADO, EMBALADO Y ETIQUETADO DE ALIMENTOS', 17, 1, 2, 'ESPECIALIDAD', 3),
(108, 'EMPAQUE Y EMBALAJE DE PRODUCTOS ALIMENTICIOS', 17, 1, 2, 'ESPECIALIDAD', 4),
(109, 'CONSERVACION Y ALMACENAMIENTO DE ALIMENTOS.', 17, 1, 2, 'ESPECIALIDAD', 5),
(110, 'LOGÍSTICA DE PRODUCTOS TERMINADOS', 17, 2, 1, 'ESPECIALIDAD', 6),
(111, 'FUNDAMENTOS DE INNOVACIÓN TECNOLÓGICA', 17, 0, 1, 'EMPLEABILIDAD', 7),
(112, 'OPORTUNIDADES DE NEGOCIOS', 17, 0, 1, 'EMPLEABILIDAD', 8),
(113, 'CONTROL DE CALIDAD DE MATERIA PRIMA E INSUMOS', 18, 2, 1, 'ESPECIALIDAD', 1),
(114, 'CONTROL DE PARÁMETROS DEL PROCESO PRODUCTIVO', 18, 1, 2, 'ESPECIALIDAD', 2),
(115, 'CALIBRACION DE EQUIPOS DE MEDIDA', 18, 1, 2, 'ESPECIALIDAD', 3),
(116, 'SISTEMAS DE GESTION DE CALIDAD', 18, 1, 2, 'ESPECIALIDAD', 4),
(117, 'INSPECCIÓN Y MUESTREO DE ALIMENTOS ', 18, 1, 2, 'ESPECIALIDAD', 5),
(118, 'INNOVACIÓN TECNOLÓGICA', 18, 1, 1, 'EMPLEABILIDAD', 6),
(119, 'PLAN DE NEGOCIOS', 18, 1, 1, 'EMPLEABILIDAD', 7),
(120, 'DIBUJO MECÁNICO CAD  AUTOMOTRIZ', 19, 1, 2, 'ESPECIALIDAD', 1),
(121, 'MANTENIMIENTO AUTOMOTRIZ', 19, 1, 2, 'ESPECIALIDAD', 2),
(122, 'MECÁNICA DE TALLER AUTOMOTRIZ', 19, 1, 2, 'ESPECIALIDAD', 3),
(123, 'SISTEMA DE SUSPENSIÓN', 19, 1, 3, 'ESPECIALIDAD', 4),
(124, 'SEGURIDAD LABORAL ', 19, 1, 1, 'ESPECIALIDAD', 5),
(125, 'COMUNICACIÓN ORAL', 19, 1, 1, 'EMPLEABILIDAD', 6),
(126, 'INTERPRETACIÓN Y PRODUCCIÓN DE TEXTOS', 19, 0, 1, 'EMPLEABILIDAD', 7),
(127, 'HIDRAULICA Y NEUMÁTICA', 20, 2, 3, 'ESPECIALIDAD', 1),
(128, 'CÁLCULOS APLICADOS A LOS SISTEMAS DE SUSPENSIÓN, DIRECCIÓN Y FRENOS', 20, 1, 1, 'ESPECIALIDAD', 2),
(129, 'SISTEMA DE DIRECCIÓN', 20, 2, 3, 'ESPECIALIDAD', 3),
(130, 'SISTEMA DE FRENOS', 20, 1, 2, 'ESPECIALIDAD', 4),
(131, 'CULTURA FÍSICA Y DEPORTIVA', 20, 1, 1, 'EMPLEABILIDAD', 5),
(132, 'APLICACIONES EN INTERNET', 20, 1, 1, 'EMPLEABILIDAD', 6),
(134, 'SISTEMAS DE LUCES', 21, 1, 2, 'ESPECIALIDAD', 1),
(135, 'SISTEMA DE CARGA Y ARRANQUE', 21, 1, 3, 'ESPECIALIDAD', 2),
(136, 'SISTEMA DE ENCENDIDO AUTOMOTRIZ', 21, 1, 3, 'ESPECIALIDAD', 3),
(137, 'SISTEMA DE IMPLEMENTOS Y CONFORT.', 21, 1, 2, 'ESPECIALIDAD', 4),
(138, 'OFIMÁTICA', 21, 1, 1, 'EMPLEABILIDAD', 5),
(139, 'INGLES PARA LA COMUNICACIÒN ORAL', 21, 1, 1, 'EMPLEABILIDAD', 6),
(140, 'SISTEMA DE TRANSMISIÓN AUTOMÁTICA Y TRANSFERENCIA', 22, 2, 3, 'ESPECIALIDAD', 1),
(141, 'MECANISMO DIFERENCIAL', 22, 1, 2, 'ESPECIALIDAD', 2),
(142, 'CÁLCULOS APLICADOS A LA TRANSMISIÓN', 22, 1, 1, 'ESPECIALIDAD', 3),
(143, 'SISTEMA DE TRANSMISIÓN MANUAL ', 22, 2, 3, 'ESPECIALIDAD', 4),
(144, 'COMPRENSIÓN Y REDACCIÓN EN INGLÉS', 22, 1, 1, 'EMPLEABILIDAD', 5),
(145, 'CULTURA AMBIENTAL', 22, 1, 1, 'EMPLEABILIDAD', 6),
(146, 'MOTORES DE COMBUSTIÓN INTERNA OTTO', 23, 1, 4, 'ESPECIALIDAD', 1),
(147, 'INYECCIÓN ELECTRÓNICA OTTO', 23, 2, 3, 'ESPECIALIDAD', 2),
(148, 'CÁLCULOS APLICADOS AL MOTOR DE COMBUSTIÓN INTERNO', 23, 1, 2, 'ESPECIALIDAD', 3),
(149, 'AFINAMIENTO ELECTRÓNICO DE MCI', 23, 1, 2, 'ESPECIALIDAD', 4),
(150, 'OPORTUNIDADES DE NEGOCIOS', 23, 1, 1, 'EMPLEABILIDAD', 5),
(151, 'MOTORES DE COMBUSTIÓN INTERNA DIESEL', 24, 1, 3, 'ESPECIALIDAD', 1),
(152, 'INYECCIÓN ELECTRÓNICA DIESEL', 24, 2, 3, 'ESPECIALIDAD', 2),
(153, 'RECTIFICACIONES AUTOMOTRICES', 24, 1, 2, 'ESPECIALIDAD', 3),
(154, 'CONVERSIÓN A COMBUSTIBLES ALTERNOS A GAS GLP Y GNV', 24, 1, 3, 'ESPECIALIDAD', 4),
(155, 'PLAN DE NEGOCIOS Y FINANCIAMIENTO', 24, 1, 1, 'EMPLEABILIDAD', 5),
(156, 'MANEJO Y CONSERVACIÓN DE SUELOS', 25, 1, 1, 'ESPECIALIDAD', 1),
(157, 'BOTÁNICA Y FISIOLOGÍA VEGETAL', 25, 2, 1, 'ESPECIALIDAD', 2),
(158, 'TOPOGRAFÍA AGRÍCOLA', 25, 1, 2, 'ESPECIALIDAD', 3),
(159, 'CULTIVO DE HORTALIZAS', 25, 2, 2, 'ESPECIALIDAD', 4),
(160, 'CULTIVO DE LEGUMINOSAS Y GRANOS ANDINOS', 25, 1, 1, 'ESPECIALIDAD', 5),
(161, 'PRODUCCIÓN DE PASTOS Y FORRAJES', 25, 1, 2, 'ESPECIALIDAD', 6),
(162, 'COMUNICACIÓN ORAL', 25, 0, 1, 'EMPLEABILIDAD', 7),
(163, 'APLICACIONES DE INTERNET', 25, 0, 1, 'EMPLEABILIDAD', 8),
(164, 'MECANIZACIÓN AGRÍCOLA', 26, 1, 2, 'ESPECIALIDAD', 1),
(165, 'OPERACIÓN DE SISTEMAS DE RIEGO', 26, 1, 2, 'ESPECIALIDAD', 2),
(166, 'PROPAGACIÓN DE PLANTAS EN VIVEROS', 26, 1, 2, 'ESPECIALIDAD', 3),
(167, 'CULTIVO DE RAÍCES Y TUBEROSAS', 26, 2, 2, 'ESPECIALIDAD', 4),
(168, 'CULTIVO DE FRUTALES', 26, 1, 1, 'ESPECIALIDAD', 5),
(169, 'INTERPRETACIÓN Y PRODUCCIÓN DE TEXTOS', 26, 1, 1, 'EMPLEABILIDAD', 6),
(170, 'OFIMÁTICA', 26, 1, 1, 'EMPLEABILIDAD', 7),
(171, 'ANATOMÍA Y FISIOLOGÍA ANIMAL', 27, 2, 1, 'ESPECIALIDAD', 1),
(172, 'INSTALACIONES PARA LA CRIANZA ANIMAL', 27, 1, 2, 'ESPECIALIDAD', 2),
(173, 'NUTRICIÓN Y ALIMENTACIÓN ANIMAL', 27, 1, 2, 'ESPECIALIDAD', 3),
(174, 'TÉCNICAS DE MEJORAMIENTO ANIMAL', 27, 1, 2, 'ESPECIALIDAD', 4),
(175, 'PRODUCCIÓN DE CUYES Y CONEJOS', 27, 1, 3, 'ESPECIALIDAD', 5),
(176, 'INGLÉS PARA LA COMUNICACIÓN ORAL', 27, 0, 1, 'EMPLEABILIDAD', 6),
(177, 'FUNDAMENTOS DE INNOVACIÓN TECNOLÓGICA', 27, 1, 1, 'EMPLEABILIDAD', 7),
(178, 'PRODUCCIÓN DE AVES', 28, 1, 2, 'ESPECIALIDAD', 1),
(179, 'PRODUCCIÓN DE VACUNOS', 28, 2, 2, 'ESPECIALIDAD', 2),
(180, 'PRODUCCIÓN DE PORCINOS', 28, 2, 2, 'ESPECIALIDAD', 3),
(181, 'PRODUCCIÓN DE OVINOS, CAPRINOS Y CAMÉLIDOS', 28, 1, 1, 'ESPECIALIDAD', 4),
(182, 'CRIANZA DE ABEJAS', 28, 1, 2, 'ESPECIALIDAD', 5),
(183, 'COMPRENSIÓN Y REDACCIÓN EN INGLÉS', 28, 1, 1, 'EMPLEABILIDAD', 6),
(184, 'INNOVACIÓN TECNOLÓGICA ', 28, 0, 1, 'EMPLEABILIDAD', 7),
(185, 'CONTROL DE ENFERMEDADES METABÓLICAS E INFECCIOSAS', 29, 2, 2, 'ESPECIALIDAD', 1),
(186, 'CONTROL DE ENFERMEDADES PARASITARIAS', 29, 3, 2, 'ESPECIALIDAD', 2),
(187, 'MANEJO INTEGRADO DE PLAGAS AGRÍCOLAS', 29, 2, 2, 'ESPECIALIDAD', 3),
(188, 'MANEJO Y CONTROL DE ENFERMEDADES AGRÍCOLAS', 29, 2, 2, 'ESPECIALIDAD', 4),
(189, 'COMPORTAMIENTO ÉTICO', 29, 1, 1, 'EMPLEABILIDAD', 5),
(190, 'OPORTUNIDADES DE NEGOCIOS', 29, 1, 1, 'EMPLEABILIDAD', 6),
(191, 'MANEJO POS COSECHA', 30, 1, 2, 'ESPECIALIDAD', 1),
(192, 'PROCESAMIENTO PRIMARIO DE PRODUCTOS AGRÍCOLAS', 30, 1, 2, 'ESPECIALIDAD', 2),
(193, 'PROCESAMIENTO PRIMARIO DE PRODUCTOS PECUARIOS', 30, 1, 2, 'ESPECIALIDAD', 3),
(194, 'CONTROL DE CALIDAD DE PRODUCTOS AGROPECUARIOS', 30, 1, 1, 'ESPECIALIDAD', 4),
(195, 'PLAN DE EXPLOTACIÓN AGROPECUARIA', 30, 1, 1, 'ESPECIALIDAD', 5),
(196, 'MARKETING DE PRODUCTOS AGROPECUARIOS', 30, 1, 1, 'ESPECIALIDAD', 6),
(197, 'SOLUCIÓN DE PROBLEMAS', 30, 1, 1, 'EMPLEABILIDAD', 7),
(198, 'PLAN DE NEGOCIOS', 30, 1, 1, 'EMPLEABILIDAD', 8),
(199, 'RECEPCIÓN DE MATERIAS PRIMAS E INSUMOS', 31, 2, 2, 'ESPECIALIDAD', 1),
(200, 'BUENAS PRÁCTICAS DE MANUFACTURA', 31, 2, 1, 'ESPECIALIDAD', 2),
(201, 'QUÍMICA APLICADA', 31, 2, 2, 'ESPECIALIDAD', 3),
(202, 'MAQUINARIA Y EQUIPOS EN LA RECEPCIÓN Y CLASIFICACIÓN DE LA MATERIA PRIMA', 31, 2, 1, 'ESPECIALIDAD', 4),
(203, 'ALMACENAMIENTO DE MATERIAS PRIMAS E INSUMOS', 31, 2, 1, 'ESPECIALIDAD', 5),
(204, 'COMUNICACIÓN ORAL', 31, 1, 1, 'EMPLEABILIDAD', 6),
(205, 'APLICACIONES EN INTERNET', 31, 1, 1, 'EMPLEABILIDAD', 7),
(206, 'SELECCIÓN Y CLASIFICACIÓN DE LAS MATERIAS PRIMAS ', 32, 1, 2, 'ESPECIALIDAD', 1),
(207, 'ACONDICIONAMIENTO DE LAS MATERIAS PRIMAS PARA EL PROCESO', 32, 2, 1, 'ESPECIALIDAD', 2),
(208, 'HIGIENE EN LA INDUSTRIA ALIMENTARIA', 32, 2, 1, 'ESPECIALIDAD', 3),
(209, 'PROCESO PARA MEZCLADO Y HOMOGENIZADO', 32, 1, 2, 'ESPECIALIDAD', 4),
(210, 'BIOQUÍMICA DE LOS ALIMENTOS', 32, 2, 2, 'ESPECIALIDAD', 5),
(211, 'INTERPRETACIÓN Y PRODUCCIÓN TEXTOS', 32, 1, 1, 'EMPLEABILIDAD', 6),
(212, 'OFIMÁTICA', 32, 1, 1, 'EMPLEABILIDAD', 7),
(213, 'PROCESAMIENTO DE FRUTAS Y HORTALIZAS', 33, 2, 2, 'ESPECIALIDAD', 1),
(214, ' PROCESOS TÉRMICOS EN PRODUCTOS CÁRNICOS E HIDROBIOLÓGICOS', 33, 2, 2, 'ESPECIALIDAD', 2),
(215, 'PLANIFICACIÓN Y ORGANIZACIÓN DE LA PRODUCCIÓN DE ALIMENTOS', 33, 1, 1, 'ESPECIALIDAD', 3),
(216, 'MAQUINARIAS Y EQUIPOS PARA LA SEPARACIÓN Y ELIMINACIÓN DE AGUA.', 33, 1, 1, 'ESPECIALIDAD', 4),
(217, 'MICROBIOLOGÍA DE ALIMENTOS', 33, 2, 2, 'ESPECIALIDAD', 5),
(218, 'INGLÉS PARA LA COMUNICACIÓN ORAL', 33, 1, 1, 'EMPLEABILIDAD', 6),
(219, 'ESTRATEGIAS PARA LA RESOLUCIÓN DE PROBLEMAS', 33, 1, 1, 'EMPLEABILIDAD', 7),
(220, 'PROCESAMIENTO DE PRODUCTOS DE PANADERÍA Y PASTELERÍA', 34, 1, 4, 'ESPECIALIDAD', 1),
(221, 'OPERACIONES DE ELIMINACIÓN DE AGUA EN PRODUCTOS VEGETALES Y  AZUCARES', 34, 2, 1, 'ESPECIALIDAD', 2),
(222, 'OPERACIONES DE SEPARACIÓN DE LOS ALIMENTOS', 34, 1, 1, 'ESPECIALIDAD', 3),
(223, 'ANÁLISIS DE ALIMENTOS', 34, 2, 3, 'ESPECIALIDAD', 4),
(224, 'COMPRENSIÓN Y REDACCIÓN EN INGLÉS', 34, 1, 1, 'EMPLEABILIDAD', 5),
(225, 'COMPORTAMIENTO ÉTICO', 34, 1, 1, 'EMPLEABILIDAD', 6),
(226, 'PROCESAMIENTO DE PRODUCTOS LÁCTEOS', 35, 2, 2, 'ESPECIALIDAD', 1),
(227, 'PROCESAMIENTO DE PRODUCTOS FERMENTADOS', 35, 1, 2, 'ESPECIALIDAD', 2),
(228, 'ENVASADO DE PRODUCTOS ALIMENTICIOS', 35, 1, 1, 'ESPECIALIDAD', 3),
(229, 'ETIQUETADO, ROTULADO Y DESPACHO DE LOS PRODUCTOS ALIMENTARIOS', 35, 1, 1, 'ESPECIALIDAD', 4),
(230, ' ALMACENAMIENTO DE ALIMENTOS', 35, 2, 1, 'ESPECIALIDAD', 5),
(231, 'EMPACADO Y EMBALADO DE ALIMENTOS', 35, 1, 1, 'ESPECIALIDAD', 6),
(232, 'FUNDAMENTOS DE INNOVACIÓN TECNOLÓGICA', 35, 1, 1, 'EMPLEABILIDAD', 7),
(233, 'OPORTUNIDADES DE NEGOCIOS', 35, 1, 1, 'EMPLEABILIDAD', 8),
(234, 'SISTEMAS HACCP', 36, 1, 2, 'ESPECIALIDAD', 1),
(235, 'SISTEMAS DE GESTIÓN DE LA CALIDAD', 36, 1, 2, 'ESPECIALIDAD', 2),
(236, 'EVALUACIÓN SENSORIAL DE ALIMENTOS', 36, 2, 1, 'ESPECIALIDAD', 3),
(237, 'CONTROL ESTADISTICO DE  PROCESOS', 36, 0, 2, 'ESPECIALIDAD', 4),
(238, 'NUTRICIÓN HUMANA ', 36, 2, 1, 'ESPECIALIDAD', 5),
(239, 'INNOVACIÓN TECNOLÓGICA ', 36, 1, 2, 'EMPLEABILIDAD', 6),
(240, 'PLAN DE NEGOCIOS', 36, 1, 1, 'EMPLEABILIDAD', 7),
(241, 'SALUD COMUNITARIA', 37, 1, 2, 'ESPECIALIDAD', 1),
(242, 'PROMOCIÓN DE LA SALUD', 37, 2, 3, 'ESPECIALIDAD', 2),
(243, 'EDUCACIÓN PARA LA SALUD', 37, 1, 1, 'ESPECIALIDAD', 3),
(244, 'ASISTENCIA EN INMUNIZACIONES', 37, 1, 2, 'ESPECIALIDAD', 4),
(245, ' SEGURIDAD Y SALUD EN EL TRABAJO', 37, 1, 1, 'ESPECIALIDAD', 5),
(246, 'COMUNICACIÓN ORAL', 37, 1, 1, 'EMPLEABILIDAD', 6),
(247, 'APLICACIONES EN INTERNET ', 37, 1, 1, 'EMPLEABILIDAD', 7),
(248, 'EPIDEMIOLOGÍA ', 38, 1, 1, 'ESPECIALIDAD', 1),
(249, 'SALUD EN DESASTRES NATURALES', 38, 1, 1, 'ESPECIALIDAD', 2),
(250, 'PREVENCION EN SALUD PUBLICA', 38, 2, 3, 'ESPECIALIDAD', 3),
(251, 'ANATOMÍA Y FISIOLOGÍA HUMANA ', 38, 1, 3, 'ESPECIALIDAD', 4),
(252, 'FUNDAMENTOS DE BIOSEGURIDAD', 38, 1, 1, 'ESPECIALIDAD', 5),
(253, 'INTERPRETACIÓN Y PRODUCCIÓN TEXTOS ', 38, 1, 1, 'EMPLEABILIDAD', 6),
(254, 'OFIMÁTICA ', 38, 1, 1, 'EMPLEABILIDAD', 7),
(255, 'ASISTENCIA BÁSICA HOSPITALARIA	', 39, 1, 4, 'ESPECIALIDAD', 1),
(256, 'ADMINISTRACION DE MEDICAMENTOS	', 39, 1, 3, 'ESPECIALIDAD', 2),
(257, 'DOCUMENTACION EN SALUD	', 39, 1, 1, 'ESPECIALIDAD', 3),
(258, 'MICROBIOLOGÍA Y MUESTRAS BIOLOGICAS	', 39, 1, 2, 'ESPECIALIDAD', 4),
(259, 'INGLÉS PARA LA COMUNICACIÓN ORAL	', 39, 1, 1, 'EMPLEABILIDAD', 5),
(260, 'COMUNICACIÓN EFECTIVA EN QUECHUA 	', 39, 1, 1, 'EMPLEABILIDAD', 6),
(261, 'ATENCIÓN EN URGENCIAS Y EMERGENCIAS	', 40, 1, 3, 'ESPECIALIDAD', 1),
(262, 'PROCEDIMIENTOS INVASIVOS Y NO INVASIVOS	', 40, 1, 4, 'ESPECIALIDAD', 2),
(263, 'BIOESTADISTICA EN SALUD 	', 40, 1, 1, 'ESPECIALIDAD', 3),
(264, 'DIETAS Y NUTRICIÓN 	', 40, 1, 2, 'ESPECIALIDAD', 4),
(265, 'COMPRENSIÓN Y REDACCIÓN EN INGLÉS	', 40, 1, 1, 'EMPLEABILIDAD', 5),
(266, 'MEDIO AMBIENTE Y DESARROLLO SOSTENIBLE.	', 40, 1, 1, 'EMPLEABILIDAD', 6),
(267, 'SALUD MATERNO NEONATAL	', 41, 2, 2, 'ESPECIALIDAD', 1),
(268, 'ATENCIÓN DEL NIÑO Y ADOLESCENTE	', 41, 2, 2, 'ESPECIALIDAD', 2),
(269, 'ATENCIÓN AL USUARIO QUIRÚRGICO	', 41, 2, 2, 'ESPECIALIDAD', 3),
(270, 'ATENCIÓN DEL ADULTO Y ADULTO MAYOR 	', 41, 2, 2, 'ESPECIALIDAD', 4),
(271, 'TÉCNICAS DE RESOLUCIÓN DE CONFLICTOS	', 41, 1, 1, 'EMPLEABILIDAD', 5),
(272, 'COMPORTAMIENTO ÉTICO	', 41, 1, 1, 'EMPLEABILIDAD', 6),
(273, 'MEDICINA ALTERNATIVA	', 42, 1, 2, 'ESPECIALIDAD', 1),
(274, 'FISIOTERAPIA Y REHABILITACIÓN	', 42, 1, 3, 'ESPECIALIDAD', 2),
(275, ' SALUD MENTAL	', 42, 2, 2, 'ESPECIALIDAD', 3),
(276, 'ATENCIÓN DEL PACIENTE EN ESTADO CRÍTICO	', 42, 2, 2, 'ESPECIALIDAD', 4),
(277, 'INNOVACIÓN TECNOLOGICA	', 42, 1, 1, 'EMPLEABILIDAD', 5),
(278, 'PLAN DE NEGOCIOS	', 42, 1, 1, 'EMPLEABILIDAD', 6),
(279, 'INSTALACIONES AGROPECUARIAS ', 43, 1, 2, 'ESPECIALIDAD', 1),
(280, 'OPERACIÓN DE SISTEMAS DE RIEGO', 43, 1, 2, 'ESPECIALIDAD', 2),
(281, 'TOPOGRAFÍA AGRÍCOLA', 43, 1, 2, 'ESPECIALIDAD', 3),
(282, 'MANEJO Y CONSERVACIÓN  DE SUELOS ', 43, 1, 2, 'ESPECIALIDAD', 4),
(283, ' MECANIZACIÓN AGRÍCOLA', 43, 1, 2, 'ESPECIALIDAD', 5),
(284, 'COMUNICACIÓN ORAL', 43, 1, 1, 'EMPLEABILIDAD', 6),
(285, 'APLICACIONES EN INTERNET', 43, 0, 1, 'EMPLEABILIDAD', 7),
(286, 'PRODUCCIÓN DE PASTOS Y FORRAJES ', 44, 1, 2, 'ESPECIALIDAD', 1),
(287, 'PRODUCCIÓN DE  CUYES Y CONEJOS.', 44, 1, 2, 'ESPECIALIDAD', 2),
(288, 'HORTICULTURA', 44, 1, 1, 'ESPECIALIDAD', 3),
(289, 'RAÍCES Y TUBEROSAS', 44, 1, 1, 'ESPECIALIDAD', 4),
(290, 'FORMULACIÓN DE RACIONES.', 44, 1, 2, 'ESPECIALIDAD', 5),
(291, 'PLAN DE EXPLOTACIÓN AGROPECUARIA ', 44, 1, 1, 'ESPECIALIDAD', 6),
(292, 'INGLÉS PARA LA COMUNICACIÓN ORAL', 44, 1, 1, 'EMPLEABILIDAD', 7),
(293, 'OFIMÁTICA', 44, 1, 1, 'EMPLEABILIDAD', 8),
(294, 'PRODUCCIÓN DE AVES.', 45, 2, 2, 'ESPECIALIDAD', 1),
(295, 'PRODUCCIÓN APÍCOLA', 45, 1, 1, 'ESPECIALIDAD', 2),
(296, 'CONTROL DE ENFERMEDADES PARASITARIAS', 45, 1, 2, 'ESPECIALIDAD', 3),
(297, 'PROPAGACIÓN DE PLANTAS EN VIVEROS', 45, 1, 2, 'ESPECIALIDAD', 4),
(298, 'CULTIVO DE CEREALES Y LEGUMINOSAS ', 45, 1, 1, 'ESPECIALIDAD', 5),
(299, 'TÉCNICAS DE MEJORAMIENTO ANIMAL', 45, 1, 2, 'ESPECIALIDAD', 6),
(300, ' RESOLUCIÓN DE PROBLEMAS', 45, 1, 1, 'EMPLEABILIDAD', 7),
(301, 'PRODUCCIÓN DE  VACUNOS ', 46, 1, 2, 'ESPECIALIDAD', 1),
(302, 'PRODUCCIÓN DE  PORCINOS', 46, 2, 1, 'ESPECIALIDAD', 2),
(303, 'PRODUCCIÓN DE  OVINOS,CAPRINOS Y CAMÉLIDOS SUDAMERICANOS ', 46, 1, 1, 'ESPECIALIDAD', 3),
(304, 'CONTROL DE ENFERMEDADES INFECCIOSAS Y METABÓLICAS', 46, 1, 1, 'ESPECIALIDAD', 4),
(305, ' MANEJO INTEGRADO DE PLAGAS Y ENFERMEDADES AGRÍCOLAS.', 46, 2, 2, 'ESPECIALIDAD', 5),
(306, 'FRUTICULTURA', 46, 1, 1, 'ESPECIALIDAD', 6),
(307, 'COMPRENSIÓN Y REDACCIÓN EN INGLÉS', 46, 1, 1, 'EMPLEABILIDAD', 7),
(308, 'COMPORTAMIENTO ÉTICO', 46, 1, 1, 'EMPLEABILIDAD', 8),
(309, 'PROCESAMIENTO PRIMARIO DE PRODUCTOS AGRÍCOLAS', 47, 1, 2, 'ESPECIALIDAD', 1),
(310, 'PROCESOS PRIMARIOS DE PRODUCTOS PECUARIOS', 47, 1, 2, 'ESPECIALIDAD', 2),
(311, 'MANEJO DE POSCOSECHA ', 47, 2, 1, 'ESPECIALIDAD', 3),
(312, 'CONTROL DE CALIDAD DE PRODUCTOS AGROPECUARIOS ', 47, 1, 2, 'ESPECIALIDAD', 4),
(313, 'APROVECHAMIENTO DE PRODUCTOS PECUARIOS', 47, 1, 2, 'ESPECIALIDAD', 5),
(314, 'FUNDAMENTOS DE INNOVACIÓN TECNOLÓGICA', 47, 1, 1, 'EMPLEABILIDAD', 6),
(315, 'OPORTUNIDADES DE NEGOCIOS', 47, 1, 1, 'EMPLEABILIDAD', 7),
(316, 'COMERCIALIZACIÓN DE LA PRODUCCIÓN AGROPECUARIA.', 48, 1, 2, 'ESPECIALIDAD', 1),
(317, 'MARKETING AGROPECUARIO', 48, 1, 2, 'ESPECIALIDAD', 2),
(318, 'TÉCNICAS DE ALMACENAMIENTO.', 48, 1, 2, 'ESPECIALIDAD', 3),
(319, 'LOGÍSTICA EN ALMACENES AGROPECUARIOS ', 48, 1, 2, 'ESPECIALIDAD', 4),
(320, 'CADENAS PRODUCTIVAS ', 48, 2, 1, 'ESPECIALIDAD', 5),
(321, 'INNOVACIÓN TECNOLÓGICA ', 48, 1, 1, 'EMPLEABILIDAD', 6),
(322, 'PLAN DE NEGOCIOS', 48, 1, 1, 'EMPLEABILIDAD', 7),
(323, 'MANTENIMIENTO AUTOMOTRIZ', 49, 2, 1, 'ESPECIALIDAD', 1),
(324, 'MECÁNICA DE TALLER Y METROLOGÍA AUTOMOTRIZ', 49, 2, 2, 'ESPECIALIDAD', 2),
(325, 'MANTENIMIENTO PREVENTIVO DE LA SUSPENSIÓN, DIRECCION Y FRENOS', 49, 1, 2, 'ESPECIALIDAD', 3),
(326, 'SEGURIDAD LABORAL ', 49, 1, 1, 'ESPECIALIDAD', 4),
(327, 'MANTENIMIENTO PREVENTIVO DEL SISTEMA ELECTRICO ', 49, 2, 2, 'ESPECIALIDAD', 5),
(328, 'COMUNICACIÓN ORAL', 49, 1, 1, 'EMPLEABILIDAD', 6),
(329, 'APLICACIONES EN INTERNET', 49, 1, 1, 'EMPLEABILIDAD', 7),
(330, 'DIBUJO MECÁNICO CAD  AUTOMOTRIZ', 50, 1, 1, 'ESPECIALIDAD', 1),
(331, 'HIDRAULICA Y NEUMÁTICA	', 50, 2, 1, 'ESPECIALIDAD', 2),
(332, 'CÁLCULOS APLICADOS A LOS SISTEMAS DE SUSPENSIÓN, DIRECCIÓN Y FRENOS', 50, 1, 1, 'ESPECIALIDAD', 3),
(333, 'MANTENIMIENTO Y REPARACIÓN DEL SISTEMA DE SUSPENSIÓN Y DIRECCIÓN CON ASISTENCIA ELECTRÓNICA', 50, 2, 3, 'ESPECIALIDAD', 4),
(334, 'MANTENIMIENTO Y REPARACIÓN DEL SISTEMA DE FRENOS CONVENCIONAL Y CON ASISTENCIA ELECTRÓNICA', 50, 2, 2, 'ESPECIALIDAD', 5),
(335, 'INTERPRETACIÓN Y  PRODUCCIÓN DE TEXTOS ', 50, 1, 1, 'EMPLEABILIDAD', 6),
(336, 'OFIMATICA ', 50, 1, 1, 'EMPLEABILIDAD', 7),
(337, 'SISTEMAS DE LUCES', 51, 2, 2, 'ESPECIALIDAD', 1),
(338, 'SISTEMA DE CARGA Y ARRANQUE', 51, 2, 2, 'ESPECIALIDAD', 2),
(339, 'SISTEMA DE ENCENDIDO AUTOMOTRIZ CON ASISTENCIA ELECTRÓNICA', 51, 2, 2, 'ESPECIALIDAD', 3),
(340, 'SISTEMA DE IMPLEMENTOS, SEGURIDAD Y CONFORT	', 51, 1, 1, 'ESPECIALIDAD', 4),
(341, 'DIBUJO ELECTRICO Y ELECTRÓNICO AUTOMOTRIZ', 51, 1, 1, 'ESPECIALIDAD', 5),
(342, 'COMPORTAMIENTO ÉTICO', 51, 1, 1, 'EMPLEABILIDAD', 6),
(343, 'INGLÉS PARA LA COMUNCACIÓN ORAL', 51, 1, 1, 'EMPLEABILIDAD', 7),
(344, 'SISTEMA DE TRANSMISIÓN AUTOMÁTICA Y TRANSFERENCIA.', 52, 2, 3, 'ESPECIALIDAD', 1),
(345, 'MECANISMO DIFERENCIAL', 52, 2, 3, 'ESPECIALIDAD', 2),
(346, 'MECANISMO DE EMBRAGUE Y CAJA DE VELOCIDADES MANUAL ', 52, 2, 3, 'ESPECIALIDAD', 3),
(347, 'COMPRESIÓN Y REDACCIÓN EN INGLÉS	', 52, 1, 1, 'EMPLEABILIDAD', 4),
(348, 'ESTRATEGIAS PARA SOLUCIÓN DE PROBLEMAS ', 52, 1, 1, 'EMPLEABILIDAD', 5),
(349, 'MOTORES DE COMBUSTIÓN INTERNA OTTO', 53, 2, 3, 'ESPECIALIDAD', 1),
(350, 'INYECCIÓN ELECTRÓNICA OTTO', 53, 2, 3, 'ESPECIALIDAD', 2),
(351, 'SISTEMA CAN BUS Y UNIDADES DE CONTROL ELECTRÓNICO ', 53, 1, 2, 'ESPECIALIDAD', 3),
(352, 'CÁLCULOS APLICADOS AL MOTOR DE COMBUSTIÓN INTERNO', 53, 1, 1, 'ESPECIALIDAD', 4),
(353, 'OPORTUNIDAD DE NEGOCIOS', 53, 1, 1, 'EMPLEABILIDAD', 5),
(354, 'FUNDAMENTOS DE INNOVACIÓN TECNOLÓGICA ', 53, 1, 1, 'EMPLEABILIDAD', 6),
(355, 'MOTORES DE COMBUSTIÓN INTERNA DIESEL CON ASISTENCIA ELECTRÓNICA', 54, 1, 3, 'ESPECIALIDAD', 1),
(356, 'SISTEMA DE INYECCIÓN DIESEL CON GESTIÓN ELECTRÓNICA', 54, 2, 2, 'ESPECIALIDAD', 2),
(357, 'AFINAMIENTO ELECTRÓNICO DE MCI', 54, 2, 1, 'ESPECIALIDAD', 3),
(358, 'CONVERSIÓN A COMBUSTIBLES ALTERNOS A GAS GLP Y GNV', 54, 1, 3, 'ESPECIALIDAD', 4),
(359, 'PLAN DE NEGOCIOS', 54, 0, 1, 'EMPLEABILIDAD', 5),
(360, 'PROYECTO DE INNOVACIÓN TECNOLÓGICA ', 54, 2, 1, 'EMPLEABILIDAD', 6);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sigi_modulo_formativo`
--
ALTER TABLE `sigi_modulo_formativo`
  ADD CONSTRAINT `fk_modulo_plan` FOREIGN KEY (`id_plan_estudio`) REFERENCES `sigi_planes_estudio` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sigi_planes_estudio`
--
ALTER TABLE `sigi_planes_estudio`
  ADD CONSTRAINT `fk_planes_programa` FOREIGN KEY (`id_programa_estudios`) REFERENCES `sigi_programa_estudios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sigi_semestre`
--
ALTER TABLE `sigi_semestre`
  ADD CONSTRAINT `sigi_semestre_ibfk_1` FOREIGN KEY (`id_modulo_formativo`) REFERENCES `sigi_modulo_formativo` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sigi_unidad_didactica`
--
ALTER TABLE `sigi_unidad_didactica`
  ADD CONSTRAINT `sigi_unidad_didactica_ibfk_1` FOREIGN KEY (`id_semestre`) REFERENCES `sigi_semestre` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
