-- models/dim_metodos_pago.sql
SELECT
    id AS metodo_pago_id,
    nombre,
    descripcion
FROM {{ source('public', 'dim_metodos_pago') }}
