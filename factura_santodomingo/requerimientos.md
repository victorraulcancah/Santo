# Configuración Dinámica de Comisiones y Sueldos para Vendedores

Este documento detalla el plan técnico para agregar un submódulo que permita al administrador configurar los esquemas de pago para cada vendedor de manera individual.

## User Review Required

> [!IMPORTANT]
> Entendido. Según tu corrección, el pago a un vendedor se divide en dos partes: su **Sueldo Base** y sus **Comisiones Extra por Meta**. Por favor, revisa el plan actualizado a continuación.

## Open Questions

> [!WARNING]
> Necesito tu respuesta en la siguiente pregunta matemática para programar el cálculo correctamente:

1. **Sobre la Meta de Ventas:** Si un vendedor tiene configurada una meta de S/ 1000, y en el mes logra vender S/ 1500... La comisión extra por meta, ¿se calcula sobre el monto excedente (es decir, el % se aplica a los 500 de diferencia) o se calcula sobre la venta total completa (el % se aplica a los 1500)?

## Proposed Changes

---

### Base de Datos (MySQL)

Se ejecutarán comandos SQL para agregar 5 nuevas columnas a la tabla `usuarios`:

- `tipo_sueldo` (INT DEFAULT 1 COMMENT '1=Sueldo Fijo, 2=Sueldo por Comisión')
- `monto_sueldo_fijo` (DECIMAL(10,2) DEFAULT 0) -> Si tipo_sueldo = 1
- `porcentaje_sueldo_comision` (DECIMAL(5,2) DEFAULT 0) -> Si tipo_sueldo = 2 (ej: 3%)
- `meta_ventas` (DECIMAL(10,2) DEFAULT 0) -> Monto a superar para activar comisión extra (0 = no tiene meta).
- `porcentaje_comision_meta` (DECIMAL(5,2) DEFAULT 0) -> El % que gana al superar la meta.

---

### Módulo de Usuarios (Frontend y Configuración)

#### [MODIFY] [usuarios.php](file:///c:/laragon/www/Santo/factura_santodomingo/resources/views/fragment-views/cliente/usuarios.php)
- En el modal **"Agregar"** y **"Editar"**, crear una sección de "Esquema de Pago" con:
  - **Tipo de Sueldo Base:** Select (1. Sueldo Fijo, 2. Sueldo por Comisión de ventas).
  - **Monto Sueldo Fijo:** Visible si Tipo = 1.
  - **Porcentaje de Sueldo (%):** Visible si Tipo = 2.
  - **Meta de Ventas para Bono Extra:** Campo numérico (si es 0, no hay meta).
  - **Porcentaje de Bono Extra (%):** Visible si Meta de Ventas > 0.
- Añadir lógica JS para mostrar/ocultar los campos según el Tipo de Sueldo y Meta ingresada.

---

### Módulo de Autenticación (Backend)

#### [MODIFY] [Usuario.php](file:///c:/laragon/www/Santo/factura_santodomingo/app/models/Usuario.php)
- En el método `login()`, guardar en la sesión las 5 nuevas variables (`tipo_sueldo`, `monto_sueldo_fijo`, etc.) para usarlas rápido en el dashboard.

---

### Paneles y Dashboards (Cálculo de la Comisión)

#### [MODIFY] [home.php](file:///c:/laragon/www/Santo/factura_santodomingo/resources/views/fragment-views/cliente/home.php)
- El Dashboard del vendedor mostrará:
  - **Sueldo Base Acumulado:** 
    - Si `tipo_sueldo` == 1, mostrará el `monto_sueldo_fijo` (ej. S/ 1000).
    - Si `tipo_sueldo` == 2, calculará (Venta Total * `porcentaje_sueldo_comision`).
  - **Bono Extra por Meta:** Si Venta Total > `meta_ventas`, calculará la comisión extra (según la respuesta a la pregunta abierta 1).
  - **Ingreso Total del Mes:** Suma del Sueldo Base + Bono Extra.

#### [MODIFY] [cotizaciones.php](file:///c:/laragon/www/Santo/factura_santodomingo/resources/views/fragment-views/cliente/cotizaciones.php)
- Las "etiquetas verdes" en las cotizaciones individuales mostrarán la comisión ganada por esa venta basándose en el `porcentaje_sueldo_comision` (si su sueldo es por comisión).
- Los bonos por meta solo se visualizarán de forma global en el dashboard principal, ya que las metas son acumulativas mensuales.

## Verification Plan

### Manual Verification
1. Ingresar como Administrador al apartado de Usuarios. Crear/Editar dos vendedores:
   - **Vendedor A**: Sueldo 0, Comisión Fija del 3%.
   - **Vendedor B**: Sueldo 1000, Comisión del 10% si supera meta de 1000.
2. Hacer ventas/cotizaciones con el Vendedor A y verificar que en su dashboard la comisión sea el 3% de cada venta.
3. Hacer ventas/cotizaciones con el Vendedor B por un valor de 500 (menor a la meta) y verificar que no reciba comisión pero vea su sueldo fijo. Luego, aumentar sus ventas a 1500 (supera la meta) y verificar que se calcule la comisión.
