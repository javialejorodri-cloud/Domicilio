USE `Domicilios`;

SELECT
    c.`id_cliente`,
    c.`nombre`,
    c.`correo`,
    c.`telefono`,
    c.`fecha_registro`
FROM `cliente` c
WHERE c.`correo` IS NOT NULL
ORDER BY c.`fecha_registro` DESC;

SELECT
    cli.`nombre`       AS Cliente,
    p.`id_pedido`,
    p.`fecha_pedido`,
    p.`total`,
    p.`estado_pedido`,
    r.`nombre`         AS Repartidor,
    e.`estado_entrega`
FROM `pedido` p
INNER JOIN `cliente` cli       ON cli.`id_cliente` = p.`id_cliente`
INNER JOIN `entrega` e         ON e.`id_pedido` = p.`id_pedido`
INNER JOIN `repartidor` r      ON r.`id_repartidor` = e.`id_repartidor`
WHERE p.`estado_pedido` != 'Cancelado'
ORDER BY p.`fecha_pedido` DESC;

SELECT
    cat.`nombre`       AS Categoria,
    COUNT(pr.`id_producto`) AS Total_Productos
FROM `categoria` cat
LEFT JOIN `producto` pr ON pr.`id_producto` = cat.`id_categoria`
GROUP BY cat.`id_categoria`, cat.`nombre`
ORDER BY Total_Productos DESC;

SELECT
    r.`nombre`         AS Repartidor,
    e.`estado_entrega`,
    COUNT(*)           AS Total_Entregas
FROM `entrega` e
INNER JOIN `repartidor` r ON r.`id_repartidor` = e.`id_repartidor`
GROUP BY r.`nombre`, e.`estado_entrega`;