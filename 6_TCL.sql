
USE `Domicilios`;


START TRANSACTION;


INSERT INTO `pedido` (`id_cliente`, `id_direccion`, `fecha_pedido`, `subtotal`, `costo_domicilio`, `total`, `estado_pedido`)
VALUES (1, 1, NOW(), 45000, 5000, 50000, 'Preparando');


SAVEPOINT `sp_pedido_creado`;


INSERT INTO `detalle_pedido` (`id_pedido`, `id_producto`, `cantidad`, `precio`, `descuento`)
VALUES (LAST_INSERT_ID(), 1, 2, 22500, 0);


COMMIT;




UPDATE `pedido`
SET `estado_pedido` = 'Estado Temporal de Prueba'
WHERE `id_pedido` = 1;


ROLLBACK;