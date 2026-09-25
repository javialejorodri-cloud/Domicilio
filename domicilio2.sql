INSERT INTO entrega (id_entrega, id_pedido, id_repartidor, estado_entrega, fecha_entrega, fecha_asignacion, hora_asignacion, observaciones) VALUES 
(1, 1, 1, 'En camino', '2026-09-22', '2026-09-22', '10:30:00', 'Llevar con cuidado'),
(2, 2, 2, 'Entregado', '2026-09-22', '2026-09-22', '11:15:00', 'Entregado en recepción'),
(3, 3, 3, 'Preparando', NULL, '2026-09-22', '12:00:00', 'Pendiente de asignar repartidor final'),
(4, 4, 4, 'Pendiente', NULL, '2026-09-22', '13:20:00', 'Sin novedad'),
(5, 5, 5, 'Entregado', '2026-09-22', '2026-09-22', '14:00:00', 'Recibido por el cliente');