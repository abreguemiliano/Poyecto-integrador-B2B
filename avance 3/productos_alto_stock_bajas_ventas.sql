WITH ordenes_detalle AS (
    SELECT * FROM {{ ref('ordenes_detalle_completo') }}
),
productos AS (
    SELECT * FROM {{ source('public', 'dim_productos') }}
)
SELECT 
    p.nombre AS producto,
    p.stock,
    COALESCE(SUM(o.cantidad), 0) AS cantidad_vendida
FROM productos p
LEFT JOIN ordenes_detalle o ON p.producto_id = o.producto_id
GROUP BY p.nombre, p.stock
HAVING p.stock > 100 AND COALESCE(SUM(o.cantidad), 0) < 10
ORDER BY p.stock DESC;