
-- Schema base PostgreSQL - Dataset prueba Data Science Engineer TUMIPAY
-- Ajusta tipos o constraints si decides cargar los CSV con otra herramienta.

DROP TABLE IF EXISTS eventos_app;
DROP TABLE IF EXISTS pagos;
DROP TABLE IF EXISTS creditos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    cliente_id VARCHAR(20) PRIMARY KEY,
    fecha_registro DATE,
    departamento VARCHAR(80),
    ciudad VARCHAR(80),
    edad INTEGER,
    genero VARCHAR(20),
    estrato INTEGER,
    nivel_educativo VARCHAR(80),
    ocupacion VARCHAR(80),
    ingreso_mensual_estimado NUMERIC(14,2),
    canal_adquisicion VARCHAR(80),
    score_externo NUMERIC(8,2),
    tiene_producto_ahorro BOOLEAN,
    numero_dependientes INTEGER,
    dispositivo_principal VARCHAR(40),
    email_hash VARCHAR(80)
);

CREATE TABLE creditos (
    credito_id VARCHAR(20) PRIMARY KEY,
    cliente_id VARCHAR(20) REFERENCES clientes(cliente_id),
    fecha_desembolso DATE,
    producto_credito VARCHAR(80),
    monto_credito NUMERIC(14,2),
    plazo_meses INTEGER,
    tasa_interes_mensual NUMERIC(8,4),
    valor_cuota_pactada NUMERIC(14,2),
    canal_originacion VARCHAR(80),
    score_interno_originacion NUMERIC(8,2),
    relacion_cuota_ingreso NUMERIC(10,4),
    politica_aprobacion VARCHAR(40),
    estado_credito_operativo VARCHAR(40)
);

CREATE TABLE pagos (
    pago_id VARCHAR(20) PRIMARY KEY,
    credito_id VARCHAR(20) REFERENCES creditos(credito_id),
    cliente_id VARCHAR(20) REFERENCES clientes(cliente_id),
    numero_cuota INTEGER,
    fecha_vencimiento DATE,
    fecha_pago DATE,
    valor_cuota NUMERIC(14,2),
    valor_pagado NUMERIC(14,2),
    medio_pago VARCHAR(80),
    estado_pago VARCHAR(40),
    dias_mora INTEGER
);

CREATE TABLE eventos_app (
    evento_id VARCHAR(20) PRIMARY KEY,
    cliente_id VARCHAR(20) REFERENCES clientes(cliente_id),
    fecha_evento DATE,
    tipo_evento VARCHAR(80),
    canal VARCHAR(40),
    resultado_evento VARCHAR(80),
    dispositivo VARCHAR(40),
    duracion_sesion_seg INTEGER
);