WITH ordenes_detalle AS (
    SELECT * FROM {{ ref('ordenes_detalle_completo') }}
)
SELECT 
    AVG(total) AS ticket_promedio
FROM (
    SELECT orden_id, MAX(total) AS total
    FROM ordenes_detalle
    GROUP BY orden_id
) AS ordenes;