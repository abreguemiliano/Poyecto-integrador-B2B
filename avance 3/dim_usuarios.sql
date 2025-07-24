-- models/dim_usuarios.sql
SELECT
    id AS usuario_id,
    nombre,
    apellido,
    dni,
    email,
    contrasena,
    fecha_registro
FROM {{ source('public', 'dim_usuarios') }}