-- =====================================================================
-- MIGRACION: Tabla planilla_pagos (historial de pagos a vendedores)
-- Fecha:    2026-05-25
-- Requiere: planilla.sql ya aplicado (5 columnas en usuarios)
--
-- OBJETIVO:
--   Persistir cada pago aprobado al vendedor con SNAPSHOT completo
--   de la configuracion al momento. Esto permite:
--     - Historial auditable
--     - Detectar anulaciones de cotizaciones POST-pago
--     - Reportes de planilla por periodo
--
-- LOGICA DEL CALCULO (snapshot al aprobar):
--   sueldo_base:
--     - tipo=1 (Fijo)     -> monto_sueldo_fijo * (dias_periodo / 30)
--     - tipo=2 (Comision) -> total_ventas_periodo * pct_comision/100
--   bono_meta:
--     - Si meta > 0 Y total_ventas > meta -> (total_ventas - meta) * pct_bono/100
--     - Si no -> 0
--   total_pagado = sueldo_base + bono_meta
--
-- COMO REVERTIR:
--   DROP TABLE planilla_pagos;
-- =====================================================================

CREATE TABLE IF NOT EXISTS `planilla_pagos` (
    `id_pago` INT(11) NOT NULL AUTO_INCREMENT,
    `id_usuario` INT(11) NOT NULL,
    `id_empresa` INT(11) NOT NULL,
    `sucursal` INT(11) DEFAULT NULL,

    -- Periodo del pago
    `periodo_desde` DATE NOT NULL,
    `periodo_hasta` DATE NOT NULL,
    `dias_periodo` INT(11) NOT NULL COMMENT 'Cantidad de dias del periodo (para sueldo fijo proporcional)',

    -- Snapshot de la configuracion del usuario al momento del pago
    `tipo_sueldo_snap` INT(11) NOT NULL COMMENT '1=Fijo, 2=Comision',
    `monto_sueldo_fijo_snap` DECIMAL(10,2) DEFAULT 0,
    `pct_comision_snap` DECIMAL(5,2) DEFAULT 0,
    `meta_snap` DECIMAL(10,2) DEFAULT 0,
    `pct_bono_snap` DECIMAL(5,2) DEFAULT 0,

    -- Resultado del calculo
    `total_ventas_periodo` DECIMAL(10,2) NOT NULL COMMENT 'Suma de cotizaciones del vendedor en el periodo',
    `sueldo_base` DECIMAL(10,2) NOT NULL,
    `bono_meta` DECIMAL(10,2) NOT NULL DEFAULT 0,
    `total_pagado` DECIMAL(10,2) NOT NULL,

    -- Auditoria
    `fecha_aprobacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `id_admin_aprobador` INT(11) DEFAULT NULL,
    `estado` CHAR(1) DEFAULT '1' COMMENT '1=activo, 0=anulado',
    `observaciones` TEXT,

    PRIMARY KEY (`id_pago`),
    KEY `idx_usuario_periodo` (`id_usuario`, `periodo_desde`, `periodo_hasta`),
    KEY `idx_empresa_fecha` (`id_empresa`, `fecha_aprobacion`),
    KEY `idx_estado` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Verificacion final
SELECT 'Tabla planilla_pagos creada' AS info;
SHOW CREATE TABLE planilla_pagos;
