-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-01-2019 a las 10:27:12
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargodepartamento`
--

CREATE TABLE `cargodepartamento` (
  `id` int(11) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `cargos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `descripcionCargo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargousuarios`
--

CREATE TABLE `cargousuarios` (
  `id` int(11) NOT NULL,
  `estadoCargo` varchar(100) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `cargos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `descripcionDepartamento` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregable`
--

CREATE TABLE `entregable` (
  `id` int(11) NOT NULL,
  `documento` varchar(1000) NOT NULL,
  `descripcionDocumento` varchar(400) DEFAULT NULL,
  `asunto` varchar(1000) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `fechaCargo` date DEFAULT NULL,
  `tarea_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estrategia`
--

CREATE TABLE `estrategia` (
  `id` int(11) NOT NULL,
  `descripcionEstrategia` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `porcentajeCumplimiento` decimal(10,2) DEFAULT NULL,
  `recomendacionesusuarios_id` int(11) DEFAULT NULL,
  `recomendacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estrategiausuario`
--

CREATE TABLE `estrategiausuario` (
  `id` int(11) NOT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `porcentajeCumplimiento` decimal(10,2) DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `documento` varchar(1000) DEFAULT NULL,
  `codigoDocumento` varchar(1000) NOT NULL,
  `users_id` int(11) NOT NULL,
  `estrategia_id` int(11) NOT NULL,
  `insistencias_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informe`
--

CREATE TABLE `informe` (
  `id` int(11) NOT NULL,
  `fechaAprobacion` date DEFAULT NULL,
  `fechaLimite` date DEFAULT NULL,
  `memorandoSolicitud` varchar(2000) DEFAULT NULL,
  `temaExamen` varchar(2000) DEFAULT NULL,
  `porcentajeCumplido` decimal(10,0) DEFAULT NULL,
  `observacion` varchar(2000) DEFAULT NULL,
  `codigoInforme` varchar(100) DEFAULT NULL,
  `estadoInforme` varchar(45) DEFAULT NULL,
  `tipoInforme_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insistencias`
--

CREATE TABLE `insistencias` (
  `idinsistencias` int(11) NOT NULL,
  `descripcionInsistencia` varchar(400) DEFAULT NULL,
  `documento` varchar(400) DEFAULT NULL,
  `codigoDocumento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendacion`
--

CREATE TABLE `recomendacion` (
  `id` int(11) NOT NULL,
  `descripcionRecomendacion` varchar(1000) DEFAULT NULL,
  `porcentajeCumplimiento` decimal(10,0) DEFAULT NULL,
  `estadoRecomendacion` varchar(100) DEFAULT NULL,
  `subtema_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendacionesusuarios`
--

CREATE TABLE `recomendacionesusuarios` (
  `id` int(11) NOT NULL,
  `estadoRecomendacionUsuario` varchar(100) DEFAULT NULL,
  `porcentajeCumplimiento` decimal(10,0) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `documento` varchar(1000) DEFAULT NULL,
  `codigoDocumento` varchar(100) DEFAULT NULL,
  `recomendacion_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subtema`
--

CREATE TABLE `subtema` (
  `id` int(11) NOT NULL,
  `descripcionSubtema` varchar(200) DEFAULT NULL,
  `conclusion` varchar(200) DEFAULT NULL,
  `porcentajeCumplidoSubtema` decimal(10,0) DEFAULT NULL,
  `estadoSubtema` varchar(200) DEFAULT NULL,
  `informe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `id` int(11) NOT NULL,
  `descripcionTarea` varchar(200) DEFAULT NULL,
  `porcentajeCumplimientotarea` decimal(10,0) NOT NULL,
  `estadoTarea` varchar(200) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estrategia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `descripciontipo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_informe`
--

CREATE TABLE `tipo_informe` (
  `id` int(11) NOT NULL,
  `tipoInforme` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `celular` decimal(10,0) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  `password` varchar(400) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipousuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargodepartamento`
--
ALTER TABLE `cargodepartamento`
  ADD PRIMARY KEY (`id`,`departamento_id`,`cargos_id`),
  ADD KEY `fk_cargodepartamento_departamento1_idx` (`departamento_id`),
  ADD KEY `fk_cargodepartamento_cargos1_idx` (`cargos_id`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargousuarios`
--
ALTER TABLE `cargousuarios`
  ADD PRIMARY KEY (`id`,`users_id`,`cargos_id`),
  ADD KEY `fk_cargausuarios_users1_idx` (`users_id`),
  ADD KEY `fk_cargousuarios_cargos1_idx` (`cargos_id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entregable`
--
ALTER TABLE `entregable`
  ADD PRIMARY KEY (`id`,`tarea_id`),
  ADD KEY `fk_entregable_tarea1_idx` (`tarea_id`);

--
-- Indices de la tabla `estrategia`
--
ALTER TABLE `estrategia`
  ADD PRIMARY KEY (`id`,`recomendacion_id`),
  ADD KEY `fk_estrategia_recomendacionesusuarios1_idx` (`recomendacionesusuarios_id`),
  ADD KEY `fk_estrategia_recomendacion1_idx` (`recomendacion_id`);

--
-- Indices de la tabla `estrategiausuario`
--
ALTER TABLE `estrategiausuario`
  ADD PRIMARY KEY (`id`,`users_id`,`estrategia_id`,`insistencias_id`),
  ADD KEY `fk_users_has_estrategia_estrategia1_idx` (`estrategia_id`),
  ADD KEY `fk_users_has_estrategia_users1_idx` (`users_id`),
  ADD KEY `fk_estrategiausuario_insistencias1_idx` (`insistencias_id`);

--
-- Indices de la tabla `informe`
--
ALTER TABLE `informe`
  ADD PRIMARY KEY (`id`,`tipoInforme_id`),
  ADD KEY `fk_informe_tipo_informe1_idx` (`tipoInforme_id`);

--
-- Indices de la tabla `insistencias`
--
ALTER TABLE `insistencias`
  ADD PRIMARY KEY (`idinsistencias`);

--
-- Indices de la tabla `recomendacion`
--
ALTER TABLE `recomendacion`
  ADD PRIMARY KEY (`id`,`subtema_id`),
  ADD KEY `fk_recomendacion_subtema1_idx` (`subtema_id`);

--
-- Indices de la tabla `recomendacionesusuarios`
--
ALTER TABLE `recomendacionesusuarios`
  ADD PRIMARY KEY (`id`,`recomendacion_id`,`users_id`),
  ADD KEY `fk_recomendacionesusuarios_recomendacion1_idx` (`recomendacion_id`),
  ADD KEY `fk_recomendacionesusuarios_users1_idx` (`users_id`);

--
-- Indices de la tabla `subtema`
--
ALTER TABLE `subtema`
  ADD PRIMARY KEY (`id`,`informe_id`),
  ADD KEY `fk_subtema_informe1_idx` (`informe_id`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`id`,`estrategia_id`),
  ADD KEY `fk_tarea_estrategia1_idx` (`estrategia_id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_informe`
--
ALTER TABLE `tipo_informe`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`tipousuario_id`),
  ADD KEY `fk_users_tipousuario1_idx` (`tipousuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargodepartamento`
--
ALTER TABLE `cargodepartamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `cargousuarios`
--
ALTER TABLE `cargousuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `entregable`
--
ALTER TABLE `entregable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `estrategia`
--
ALTER TABLE `estrategia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `estrategiausuario`
--
ALTER TABLE `estrategiausuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `informe`
--
ALTER TABLE `informe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `insistencias`
--
ALTER TABLE `insistencias`
  MODIFY `idinsistencias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recomendacion`
--
ALTER TABLE `recomendacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `recomendacionesusuarios`
--
ALTER TABLE `recomendacionesusuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `subtema`
--
ALTER TABLE `subtema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipo_informe`
--
ALTER TABLE `tipo_informe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cargodepartamento`
--
ALTER TABLE `cargodepartamento`
  ADD CONSTRAINT `fk_cargodepartamento_cargos1` FOREIGN KEY (`cargos_id`) REFERENCES `cargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cargodepartamento_departamento1` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cargousuarios`
--
ALTER TABLE `cargousuarios`
  ADD CONSTRAINT `fk_cargausuarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cargousuarios_cargos1` FOREIGN KEY (`cargos_id`) REFERENCES `cargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entregable`
--
ALTER TABLE `entregable`
  ADD CONSTRAINT `fk_entregable_tarea1` FOREIGN KEY (`tarea_id`) REFERENCES `tarea` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estrategia`
--
ALTER TABLE `estrategia`
  ADD CONSTRAINT `fk_estrategia_recomendacion1` FOREIGN KEY (`recomendacion_id`) REFERENCES `recomendacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estrategia_recomendacionesusuarios1` FOREIGN KEY (`recomendacionesusuarios_id`) REFERENCES `recomendacionesusuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estrategiausuario`
--
ALTER TABLE `estrategiausuario`
  ADD CONSTRAINT `fk_estrategiausuario_insistencias1` FOREIGN KEY (`insistencias_id`) REFERENCES `insistencias` (`idinsistencias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_estrategia_estrategia1` FOREIGN KEY (`estrategia_id`) REFERENCES `estrategia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_estrategia_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `informe`
--
ALTER TABLE `informe`
  ADD CONSTRAINT `fk_informe_tipo_informe1` FOREIGN KEY (`tipoInforme_id`) REFERENCES `tipo_informe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recomendacion`
--
ALTER TABLE `recomendacion`
  ADD CONSTRAINT `fk_recomendacion_subtema1` FOREIGN KEY (`subtema_id`) REFERENCES `subtema` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recomendacionesusuarios`
--
ALTER TABLE `recomendacionesusuarios`
  ADD CONSTRAINT `fk_recomendacionesusuarios_recomendacion1` FOREIGN KEY (`recomendacion_id`) REFERENCES `recomendacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recomendacionesusuarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `subtema`
--
ALTER TABLE `subtema`
  ADD CONSTRAINT `fk_subtema_informe1` FOREIGN KEY (`informe_id`) REFERENCES `informe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `fk_tarea_estrategia1` FOREIGN KEY (`estrategia_id`) REFERENCES `estrategia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_tipousuario1` FOREIGN KEY (`tipousuario_id`) REFERENCES `tipousuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
