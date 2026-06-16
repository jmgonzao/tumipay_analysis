-- Consultas para exploración de datos:

-- tbl_clientes:
-- Distribución de clientes por estrato socioeconómico
SELECT estrato, COUNT(*) AS total_clientes
FROM clientes
GROUP BY estrato
ORDER BY total_clientes DESC;

-- Promedio y dispersión de ingresos por nivel educativo
SELECT nivel_educativo,
       AVG(ingreso_mensual_estimado) AS ingreso_promedio,
       STDDEV(ingreso_mensual_estimado) AS dispersion
FROM clientes
GROUP BY nivel_educativo
ORDER BY ingreso_promedio DESC;

-- tbl_creditos

-- Distribución de créditos por tipo de producto
SELECT producto_credito, COUNT(*) AS total_creditos
FROM creditos
GROUP BY producto_credito
ORDER BY total_creditos DESC;

-- Relación cuota-ingreso promedio por estado operativo
SELECT estado_credito_operativo,
       AVG(relacion_cuota_ingreso) AS promedio_relacion
FROM creditos
GROUP BY estado_credito_operativo
ORDER BY promedio_relacion DESC;

-- tbl_pagos

-- Distribución de días de mora
SELECT CASE
           WHEN dias_mora = 0 THEN 'Sin mora'
           WHEN dias_mora BETWEEN 1 AND 30 THEN 'Mora leve (1-30 días)'
           WHEN dias_mora > 30 THEN 'Mora grave (>30 días)'
           ELSE 'Sin información'
       END AS categoria_mora,
       COUNT(*) AS total_pagos
FROM pagos
GROUP BY categoria_mora
ORDER BY total_pagos DESC;

-- Medio de pago más utilizado
SELECT medio_pago, COUNT(*) AS total
FROM pagos
WHERE medio_pago IS NOT NULL
GROUP BY medio_pago
ORDER BY total DESC;

-- tbl_eventos

-- Tipos de eventos más frecuentes
SELECT tipo_evento, COUNT(*) AS total_eventos
FROM eventos_app
GROUP BY tipo_evento
ORDER BY total_eventos DESC;

-- Duración promedio de sesión por canal
SELECT canal, AVG(duracion_sesion_seg) AS duracion_promedio
FROM eventos_app
GROUP BY canal
ORDER BY duracion_promedio DESC;