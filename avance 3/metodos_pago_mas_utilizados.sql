WITH ordenes_detalle AS (
    SELECT * FROM {{ ref('ordenes_detalle_completo') }}
),
metodos AS (
    SELECT * FROM {{ source('public', 'dim_metodos_pago') }}
)
SELECT 
    m.nombre_metodo AS metodo_pago,
    COUNT(*) AS cantidad_usos
FROM ordenes_detalle o
JOIN metodos m ON o.metodo_pago_id = m.metodo_pago_id
GROUP BY m.nombre_metodo
ORDER BY cantidad_usos DESC;