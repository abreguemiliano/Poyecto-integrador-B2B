-- models/fact_ordenes_metodo_pago.sql
SELECT
    id,
    orden_id,
    metodo_pago_id,
    monto_pagado
FROM {{ source('public', 'fact_ordenes_metodo_pago') }}