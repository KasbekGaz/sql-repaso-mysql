CREATE TABLE `Usuario` (
  `id` int PRIMARY KEY,
  `username` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `rol` varchar(255)
);

CREATE TABLE `Obra` (
  `id` int PRIMARY KEY,
  `nombre` varchar(255),
  `localidad` varchar(255),
  `municipio` varchar(255),
  `dependencia` varchar(255),
  `fecha` date,
  `p_inicial` decimal DEFAULT 0,
  `total_gastos` decimal DEFAULT 0,
  `total_importes` decimal DEFAULT 0,
  `total_importes_mod` decimal DEFAULT 0
);

CREATE TABLE `Tarea` (
  `id` int PRIMARY KEY,
  `Fvence` date,
  `Fcreado` date,
  `Fcompletado` date,
  `titulo` varchar(255),
  `descripcion` text,
  `estado` varchar(255) COMMENT 'Completado, No completado, vencida',
  `Obra_id` int
);

CREATE TABLE `Gasto` (
  `id` int PRIMARY KEY,
  `fecha` date,
  `proveedor` varchar(255),
  `concepto` varchar(255),
  `descripcion` text,
  `categoria` varchar(255) COMMENT 'administracion, mano de obra, Materiales, Viaticos, Varios',
  `facturado` varchar(255) COMMENT 'No Facturado, Facturado',
  `Tipo` varchar(255) COMMENT 'Efectivo, Transferencia',
  `importe` decimal,
  `Obra_id` int
);

CREATE TABLE `Galeria` (
  `id` int PRIMARY KEY,
  `descripcion` text,
  `fecha` date,
  `archivo` varchar(255),
  `Obra_id` int
);

CREATE TABLE `volumen` (
  `id` int PRIMARY KEY,
  `codigo` varchar(255),
  `unidad` varchar(255),
  `concepto` varchar(255),
  `estado` varchar(255) COMMENT 'Sin cambio, Deduccion, Adicional, Extraordinario',
  `volumen` decimal,
  `precio` decimal,
  `importe` decimal,
  `v_mod` decimal,
  `importe_mod` decimal,
  `diferencia` decimal,
  `Obra_id` int
);

CREATE TABLE `Proveedor` (
  `id` int PRIMARY KEY,
  `nombre_comercial` varchar(255),
  `razon_social` varchar(255),
  `telefono` varchar(255),
  `correo` varchar(255),
  `RFC` varchar(255),
  `descripcion` text
);

CREATE TABLE `Material` (
  `id` int PRIMARY KEY,
  `material` varchar(255),
  `Precio` decimal,
  `proveedor_id` int
);

CREATE TABLE `Banca` (
  `id` int PRIMARY KEY,
  `banco` varchar(255),
  `cuenta_banco` varchar(255),
  `clave_banco` varchar(255),
  `proveedor_id` int
);

ALTER TABLE `Gasto` ADD CONSTRAINT `ObraGasto` FOREIGN KEY (`Obra_id`) REFERENCES `Obra` (`id`);

ALTER TABLE `Tarea` ADD CONSTRAINT `ObraTarea` FOREIGN KEY (`Obra_id`) REFERENCES `Obra` (`id`);

ALTER TABLE `Galeria` ADD CONSTRAINT `ObraFoto` FOREIGN KEY (`Obra_id`) REFERENCES `Obra` (`id`);

ALTER TABLE `volumen` ADD CONSTRAINT `ObraVolumen` FOREIGN KEY (`Obra_id`) REFERENCES `Obra` (`id`);

ALTER TABLE `Material` ADD CONSTRAINT `ProvMaterial` FOREIGN KEY (`proveedor_id`) REFERENCES `Proveedor` (`id`);

ALTER TABLE `Banca` ADD CONSTRAINT `BancaProv` FOREIGN KEY (`proveedor_id`) REFERENCES `Proveedor` (`id`);

CREATE TABLE `Obra_Usuario` (
  `Obra_id` int,
  `Usuario_id` int,
  PRIMARY KEY (`Obra_id`, `Usuario_id`)
);

ALTER TABLE `Obra_Usuario` ADD FOREIGN KEY (`Obra_id`) REFERENCES `Obra` (`id`);

ALTER TABLE `Obra_Usuario` ADD FOREIGN KEY (`Usuario_id`) REFERENCES `Usuario` (`id`);

