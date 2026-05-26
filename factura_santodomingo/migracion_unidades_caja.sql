-- =====================================================================
-- MIGRACION: Soporte para presentaciones Caja / Unidad en productos
-- Fecha:    2026-05-25
-- Autor:    Sistema
--
-- OBJETIVO:
--   Permitir vender un mismo producto en dos presentaciones:
--     - Por CAJA   (multiplica por unidades_por_caja al descontar stock)
--     - Por UNIDAD (descuenta 1 a 1)
--
--   El stock SIEMPRE se almacena en la unidad base (la mas pequeña).
--   Ejemplo: 10 cajas de vino x 5 unidades = stock guarda 50 unidades.
--
-- IMPACTO EN PRODUCCION:
--   - Todos los productos existentes quedan con unidades_por_caja = 1
--   - "1 unidad por caja" significa que el producto NO tiene presentacion
--     por caja, se vende solo suelto. Comportamiento identico a hoy.
--   - Cero riesgo de romper ventas/compras existentes.
--
-- COMO REVERTIR (si algo sale mal):
--   ALTER TABLE productos DROP COLUMN unidades_por_caja;
--   ALTER TABLE productos DROP COLUMN volumen_unidad;
-- =====================================================================

-- Verificar que las columnas no existan ya (idempotente, seguro re-ejecutar)
SET @col_exists_unidades := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'productos'
      AND COLUMN_NAME = 'unidades_por_caja'
);

SET @col_exists_volumen := (
    SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'productos'
      AND COLUMN_NAME = 'volumen_unidad'
);

-- Agregar columna unidades_por_caja
SET @sql_unidades := IF(
    @col_exists_unidades = 0,
    'ALTER TABLE `productos` ADD COLUMN `unidades_por_caja` INT(11) NOT NULL DEFAULT 1 COMMENT ''Unidades que contiene una caja. 1 = producto se vende solo por unidad suelta'' AFTER `precio_unidad`',
    'SELECT ''Columna unidades_por_caja ya existe, se omite'' AS aviso'
);
PREPARE stmt FROM @sql_unidades;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Agregar columna volumen_unidad
SET @sql_volumen := IF(
    @col_exists_volumen = 0,
    'ALTER TABLE `productos` ADD COLUMN `volumen_unidad` VARCHAR(20) COLLATE utf8_spanish_ci NULL DEFAULT NULL COMMENT ''Volumen descriptivo de la unidad base (ej: 1L, 500ml, 750ml)'' AFTER `unidades_por_caja`',
    'SELECT ''Columna volumen_unidad ya existe, se omite'' AS aviso'
);
PREPARE stmt FROM @sql_volumen;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Verificacion final
SELECT
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    COLUMN_COMMENT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'productos'
  AND COLUMN_NAME IN ('unidades_por_caja', 'volumen_unidad');
