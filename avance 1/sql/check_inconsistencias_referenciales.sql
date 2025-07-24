1. Usuarios en fact_carrito que no existen en dim_usuarios

SELECT fc.id, fc.usuario_id
FROM fact_carrito fc
LEFT JOIN dim_usuarios du ON fc.usuario_id = du.id
WHERE du.id IS NULL;

2. Productos en fact_carrito que no existen en dim_productos

SELECT fc.id, fc.producto_id
FROM fact_carrito fc
LEFT JOIN dim_productos dp ON fc.producto_id = dp.id
WHERE dp.id IS NULL;

3. Órdenes en fact_detalle_ordenes que no existen en fact_ordenes

SELECT fdo.id, fdo.orden_id
FROM fact_detalle_ordenes fdo
LEFT JOIN fact_ordenes fo ON fdo.orden_id = fo.id
WHERE fo.id IS NULL;

4. Productos en fact_detalle_ordenes que no existen en dim_productos

SELECT fdo.id, fdo.producto_id
FROM fact_detalle_ordenes fdo
LEFT JOIN dim_productos dp ON fdo.producto_id = dp.id
WHERE dp.id IS NULL;

5. Usuarios en dim_direcciones_envio que no existen en dim_usuarios

SELECT dde.id, dde.usuario_id
FROM dim_direcciones_envio dde
LEFT JOIN dim_usuarios du ON dde.usuario_id = du.id
WHERE du.id IS NULL;

6. Órdenes en fact_historial_pagos que no existen en fact_ordenes

SELECT fhp.id, fhp.orden_id
FROM fact_historial_pagos fhp
LEFT JOIN fact_ordenes fo ON fhp.orden_id = fo.id
WHERE fo.id IS NULL;

7. Métodos de pago en fact_historial_pagos que no existen en dim_metodos_pago

SELECT fhp.id, fhp.metodo_pago_id
FROM fact_historial_pagos fhp
LEFT JOIN dim_metodos_pago dmp ON fhp.metodo_pago_id = dmp.id
WHERE dmp.id IS NULL;

8. Usuarios en fact_ordenes que no existen en dim_usuarios

SELECT fo.id, fo.usuario_id
FROM fact_ordenes fo
LEFT JOIN dim_usuarios du ON fo.usuario_id = du.id
WHERE du.id IS NULL;

9. Órdenes en fact_ordenes_metodo_pago que no existen en fact_ordenes

SELECT fomp.id, fomp.orden_id
FROM fact_ordenes_metodo_pago fomp
LEFT JOIN fact_ordenes fo ON fomp.orden_id = fo.id
WHERE fo.id IS NULL;

10. Métodos de pago en fact_ordenes_metodo_pago que no existen en dim_metodos_pago

SELECT fomp.id, fomp.metodo_pago_id
FROM fact_ordenes_metodo_pago fomp
LEFT JOIN dim_metodos_pago dmp ON fomp.metodo_pago_id = dmp.id
WHERE dmp.id IS NULL;

11. Usuarios en fact_resenas_productos que no existen en dim_usuarios

SELECT frp.id, frp.usuario_id
FROM fact_resenas_productos frp
LEFT JOIN dim_usuarios du ON frp.usuario_id = du.id
WHERE du.id IS NULL;

12. Productos en fact_resenas_productos que no existen en dim_productos

SELECT frp.id, frp.producto_id
FROM fact_resenas_productos frp
LEFT JOIN dim_productos dp ON frp.producto_id = dp.id
WHERE dp.id IS NULL;
