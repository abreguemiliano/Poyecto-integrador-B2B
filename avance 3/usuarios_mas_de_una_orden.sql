WITH ordenes_detalle AS (
    SELECT * FROM {{ ref('ordenes_detalle_completo') }}
)
SELECT 
    usuario_id,
    COUNT(DISTINCT orden_id) AS cantidad_ordenes
FROM ordenes_detalle
GROUP BY usuario_id
HAVING COUNT(DISTINCT orden_id) > 1;