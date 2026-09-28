
USE `Domicilios`;


CREATE OR REPLACE VIEW `v_pedidos_detallados` AS
SELECT
    p.`id_pedido`,
    cli.`nombre`       AS Cliente,
    cli.`correo`       AS Correo_Cliente,
    p.`fecha_pedido`,
    p.`total`,
    p.`estado_pedido`
FROM `pedido` p
INNER JOIN `cliente` cli ON cli.`id_cliente` = p.`id_cliente`;


SELECT * FROM `v_pedidos_detallados` ORDER BY `fecha_pedido` DESC;


CREATE OR REPLACE VIEW `v_entregas_repartidores` AS
SELECT
    e.`id_entrega`,
    e.`id_pedido`,
    r.`nombre`         AS Repartidor,
    r.`vehiculo`,
    r.`placa`,
    e.`estado_entrega`,
    e.`fecha_entrega`
FROM `entrega` e
INNER JOIN `repartidor` r ON r.`id_repartidor` = e.`id_repartidor`;


SELECT * FROM `v_entregas_repartidores` ORDER BY `id_pedido`;

