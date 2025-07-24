-- models/fact_detalle_ordenes.sql
SELECT
    id,
    orden_id,
    producto_id,
    cantidad,
    precio_unitario
FROM {{ source('public', 'fact_detalle_ordenes') }}