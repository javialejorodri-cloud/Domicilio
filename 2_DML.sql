
USE `Domicilios`;


INSERT INTO `cliente` (`nombre`, `correo`, `telefono`, `fecha_registro`)
VALUES ('Sofía Ramírez', 'sofia.ramirez@example.com', '3011122334', '2026-06-01 10:30:00');


UPDATE `pedido`
SET `estado_pedido` = 'Entregado'
WHERE `id_pedido` = 1;


UPDATE `repartidor`
SET `calificacion_promedio` = 4.85
WHERE `id_repartidor` = 1;


DELETE FROM `detalle_carrito`
WHERE `id_carrito` = 1 AND `id_producto` = 3;