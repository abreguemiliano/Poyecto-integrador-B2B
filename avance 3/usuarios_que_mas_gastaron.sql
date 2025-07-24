WITH ordenes_detalle AS (
    SELECT * FROM {{ ref('ordenes_detalle_completo') }}
),
usuarios AS (
    SELECT * FROM {{ source('public', 'dim_usuarios') }}
)
SELECT 
    u.nombre AS usuario,
    SUM(o.total) AS gasto_total
FROM (
    SELECT DISTINCT orden_id, usuario_id, total
    FROM ordenes_detalle
) o
JOIN usuarios u ON o.usuario_id = u.usuario_id
GROUP BY u.nombre
ORDER BY gasto_total DESC
LIMIT 10;