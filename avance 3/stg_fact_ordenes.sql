-- models/fact_ordenes.sql
SELECT
    id AS orden_id,
    usuario_id,
    fecha_orden,
    total,
    estado
FROM {{ source('public', 'fact_ordenes') }}