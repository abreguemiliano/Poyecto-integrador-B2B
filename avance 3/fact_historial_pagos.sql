-- models/fact_historial_pagos.sql
SELECT
    id,
    orden_id,
    metodo_pago_id,
    monto,
    fecha_pago,
    estado_pago
FROM {{ source('public', 'fact_historial_pagos') }}