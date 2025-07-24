WITH ordenes_detalle AS (
    SELECT * FROM {{ ref('ordenes_detalle_completo') }}
),
productos AS (
    SELECT * FROM {{ source('public', 'dim_productos') }}
),
categorias AS (
    SELECT * FROM {{ source('public', 'dim_categorias') }}
)
SELECT 
    c.nombre_categoria,
    SUM(o.cantidad * o.precio_unitario) AS valor_total
FROM ordenes_detalle o
JOIN productos p ON o.producto_id = p.producto_id
JOIN categorias c ON p.categoria_id = c.categoria_id
GROUP BY c.nombre_categoria
ORDER BY valor_total DESC
LIMIT 1;