--models/dim_categorias.sql
SELECT
    id AS categoria_id,
    nombre,
    descripcion
FROM {{ source('public', 'dim_categorias') }}