-- Ejecutar este script en la base de datos de Producción
-- Agrega las columnas necesarias a la tabla usuarios para manejar sueldos y bonos dinámicos.

ALTER TABLE `usuarios` ADD COLUMN `tipo_sueldo` INT DEFAULT 1 COMMENT '1=Sueldo Fijo, 2=Sueldo por Comisión';
ALTER TABLE `usuarios` ADD COLUMN `monto_sueldo_fijo` DECIMAL(10,2) DEFAULT 0;
ALTER TABLE `usuarios` ADD COLUMN `porcentaje_sueldo_comision` DECIMAL(5,2) DEFAULT 0;
ALTER TABLE `usuarios` ADD COLUMN `meta_ventas` DECIMAL(10,2) DEFAULT 0;
ALTER TABLE `usuarios` ADD COLUMN `porcentaje_comision_meta` DECIMAL(5,2) DEFAULT 0;

