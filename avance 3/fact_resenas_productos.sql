-- models/fact_resenas_productos.sql
SELECT
    id,
    usuario_id,
    producto_id,
    calificacion,
    comentario,
    fecha
FROM {{ source('public', 'fact_resenas_productos') }}