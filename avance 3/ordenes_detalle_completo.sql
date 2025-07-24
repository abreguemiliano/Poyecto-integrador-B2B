-- models/ordenes_detalle_completo.sql
WITH ordenes AS (
    SELECT * FROM {{ ref('stg_fact_ordenes') }}
),
metodos_pago AS (
    SELECT * FROM {{ ref('stg_fact_ordenes_metodo_pago') }}
),
detalle AS (
    SELECT * FROM {{ ref('stg_fact_detalle_ordenes') }}
)

SELECT
    detalle.id,
    detalle.orden_id,
    detalle.producto_id,
    detalle.cantidad,
    detalle.precio_unitario,
    ordenes.usuario_id,
    ordenes.total,
    ordenes.estado,
    metodos_pago.monto_pagado,
    metodos_pago.metodo_pago_id
FROM detalle
LEFT JOIN ordenes ON detalle.orden_id = ordenes.orden_id
LEFT JOIN metodos_pago ON detalle.orden_id = metodos_pago.orden_id