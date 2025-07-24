-- models/fact_carrito.sql
SELECT
    id,
    usuario_id,
    producto_id,
    cantidad,
    fecha_agregado
FROM {{ source('public', 'fact_carrito') }}
