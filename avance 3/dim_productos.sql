-- models/dim_productos.sql
SELECT
    id AS producto_id,
    nombre,
    descripcion,
    precio,
    stock,
    categoriaid
FROM {{ source('public', 'dim_productos') }}