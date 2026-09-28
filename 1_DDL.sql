
USE `Domicilios`;


CREATE TABLE IF NOT EXISTS `tabla_prueba` (
    -- Llave primaria autoincremental, sigue la misma convención del resto del modelo.
    `Tabla_Prueba_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    -- Campo de texto simple usado únicamente para la prueba.
    `Descripcion` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`Tabla_Prueba_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci
  COMMENT = 'Tabla temporal usada únicamente para demostrar sentencias DDL.';


ALTER TABLE `cliente`
    ADD COLUMN `fecha_registro` DATETIME NULL
    COMMENT 'Fecha y hora en que el cliente se registró en la plataforma.';


ALTER TABLE `repartidor`
    ADD COLUMN `calificacion_promedio` DECIMAL(3,2) NULL
    COMMENT 'Calificación promedio obtenida por el repartidor.';


ALTER TABLE `cliente`
    MODIFY COLUMN `telefono` VARCHAR(25) NULL
    COMMENT 'Teléfono de contacto del cliente, incluye formato o indicativo.';


CREATE INDEX `idx_pedido_estado` ON `pedido` (`estado_pedido`);

DROP TABLE IF EXISTS `tabla_prueba`;