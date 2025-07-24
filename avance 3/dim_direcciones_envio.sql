-- models/dim_direcciones_envio.sql
SELECT
    id AS direccion_id,
    usuario_id,
    calle,
    ciudad,
    departamento,
    provincia,
    distrito,
    estado,
    codigo_postal,
    pais
FROM {{ source('public', 'dim_direcciones_envio') }}