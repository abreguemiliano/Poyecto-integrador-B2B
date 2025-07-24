WITH ordenes_detalle AS (
    SELECT * FROM {{ ref('ordenes_detalle_completo') }}
),
productos AS (
    SELECT * FROM {{ source('public', 'dim_productos') }}
)
SELECT 
    p.nombre AS producto,
    SUM(o.cantidad) AS total_vendido
FROM ordenes_detalle o
JOIN productos p ON o.producto_id = p.producto_id
GROUP BY p.nombre
ORDER BY total_vendido DESC
LIMIT 10;