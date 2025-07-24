ALTER TABLE fact_ordenes_metodo_pago
DROP CONSTRAINT fact_ordenes_metodo_pago_metodo_pago_id_fkey;

ALTER TABLE fact_ordenes_metodo_pago
DROP CONSTRAINT fact_ordenes_metodo_pago_orden_id_fkey;


ALTER TABLE fact_historial_pagos
DROP CONSTRAINT IF EXISTS fact_historial_pagos_metodo_pago_id_fkey;

ALTER TABLE fact_historial_pagos
DROP CONSTRAINT IF EXISTS fact_historial_pagos_orden_id_fkey;

ALTER TABLE fact_detalle_ordenes 
DROP CONSTRAINT fact_detalle_ordenes_orden_id_fkey;


ALTER TABLE fact_ordenes_metodo_pago
ADD CONSTRAINT fact_ordenes_metodo_pago_metodo_pago_id_fkey
FOREIGN KEY (metodo_pago_id) REFERENCES fact_ordenes(id);


ALTER TABLE fact_ordenes_metodo_pago
ADD CONSTRAINT fact_ordenes_metodo_pago_orden_id_fkey
FOREIGN KEY (orden_id) REFERENCES dim_metodos_pago(id);

ALTER TABLE fact_historial_pagos
ADD CONSTRAINT fact_historial_pagos_metodo_pago_id_fkey
FOREIGN KEY (metodo_pago_id) REFERENCES dim_metodos_pago(id);

ALTER TABLE fact_historial_pagos
ADD CONSTRAINT fact_historial_pagos_orden_id_fkey
FOREIGN KEY (orden_id) REFERENCES fact_ordenes(id);

ALTER TABLE fact_detalle_ordenes
ADD CONSTRAINT fact_detalle_ordenes_orden_id_fkey
FOREIGN KEY (orden_id) REFERENCES fact_ordenes(id);


ALTER TABLE dim_usuarios DROP CONSTRAINT dim_usuarios_pkey CASCADE;
