USE banco;
-- 1. Inserta un cliente con tu nombre y apellidos.
SELECT * FROM cliente;
INSERT INTO cliente (COD_CLIENTE,APELLIDOS,NOMBRE,DIRECCION) VALUES 
("PHUMGAN","Humanes Gandul", "Pablo","C/Coracha");

SELECT * FROM cliente WHERE NOMBRE = "Pablo";

-- 2. Crea dos cuentas para tí, una sin dinero y otra con 100000 euros asociados a la
-- sucursal de Lepanto.

SELECT * FROM cuenta;

INSERT INTO cuenta(COD_CUENTA,SALDO,INTERES,COD_CLIENTE,COD_SUCURSAL) VALUES 
(123789,100000, 0.1200, "PHUMGAN", 4),
(123456, 0.0, 0.0300, "PHUMGAN", 4);

SELECT * FROM cuenta WHERE COD_CLIENTE = "PHUMGAN";


-- 3. Realiza dos movimientos de entrada con valor de 10 euros en ambas cuentas y dos
-- movimientos de salida con valor de 150 euros en ambas cuentas

SELECT * FROM tipo_movimiento;
SELECT * FROM movimiento;


INSERT INTO movimiento(COD_CUENTA, MES, NUM_MOV_MES, IMPORTE, FECHA_HORA, COD_TIPO_MOVIMIENTO) VALUES
(123456, 6, 6, 10.00, "2024-06-03 10:56:00", "TR-E"),
(123789, 6, 4, 10.00, "2024-06-03 10:57:00", "TR-E"),
(123456, 6, 3, 150.00, "2024-06-03 10:56:00", "TR-S"),
(123789, 6, 5, 150.00, "2024-06-03 10:56:00", "TR-S");

SELECT * FROM movimiento WHERE COD_CUENTA = 123456 ;
SELECT * FROM movimiento WHERE COD_CUENTA = 123789 ;


-- 4. Crea un nuevo tipo de movimiento denominado Bizum.

SELECT * FROM tipo_movimiento;

INSERT INTO tipo_movimiento (COD_TIPO_MOVIMIENTO,DESCRIPCION, SALIDA) VALUES
("BZ", "Realizar un bizum", "Si");

SELECT * FROM tipo_movimiento WHERE COD_TIPO_MOVIMIENTO = "BZ";

-- 5. Crea dos nuevas sucursales una en calle Juan de Mairena sin capital del año
-- anterior y otra en calle Velázquez con 1500 euros de capital del año anterior.

SELECT * FROM sucursal;

INSERT INTO sucursal (COD_SUCURSAL, DIRECCION, CAPITAL_ANIO_ANTERIOR) VALUES
(6," C/ Juan de Mairena", 0.0),
(7, "C/ Velazquez", 1500.00);

SELECT * FROM sucursal WHERE COD_SUCURSAL = 6;
SELECT * FROM sucursal WHERE COD_SUCURSAL = 7;


-- 6. Elimina la sucursal de Velázquez.

DELETE FROM sucursal WHERE COD_SUCURSAL = 7;

SELECT * FROM sucursal WHERE COD_SUCURSAL = 7;

-- 7. Elimina aquellos usuarios cuyo nombre empieza por Z

DELETE FROM cliente WHERE NOMBRE LIKE "Z%";

SELECT * FROM cliente WHERE NOMBRE LIKE "Z%";

-- 8. Elimina aquellas cuentas cuyo saldo supera el saldo medio de la base de datos 

DELETE FROM cuenta WHERE saldo > (SELECT AVG(saldo) FROM cuenta);

-- 9. Elimina todas las sucursales sin cuentas asociadas.

DELETE FROM sucursal WHERE COD_SUCURSAL NOT IN (SELECT DISTINCT COD_SUCURSAL FROM cuenta);

-- 10. Actualiza a mayúsculas toda la descripción de los tipos de movimientos.
UPDATE tipo_movimiento SET descripcion = UPPER(descripcion);

SELECT * FROM tipo_movimiento;

-- 11. Cambia el ID de tu cuenta de 100000 euros a 21

SELECT * FROM cuenta WHERE  saldo = 100000;

ALTER TABLE movimiento DROP CONSTRAINT fk_movimiento_cuenta;
ALTER TABLE movimiento ADD CONSTRAINT fk_movimiento_cuenta FOREIGN KEY (cod_cuenta) REFERENCES cuenta(cod_cuenta) ON UPDATE CASCADE;

UPDATE cuenta
SET COD_CUENTA = 21
WHERE saldo = 100000;


-- Crea una tabla llamada historico_saldos con la información de tu nombre y el saldo
-- total.


CREATE TABLE historico_saldos (
	nombre VARCHAR(50),
    saldo_total DECIMAL(12,2)
);

-- 13. Crea una tabla llamada historico_cuentas con la información de tu nombre, tu
-- apellido y el número de cuentas asociadas.

CREATE TABLE historico_cuentas (
	nombre VARCHAR(50),
    apellidos VARCHAR(50),
    num_cuentas INT
);



-- 14. Crea una tabla llamada historico_movimientos_salida con la información de tu
-- nombre y tu apellido en el mismo campo y los movimientos de salida realizados.

CREATE TABLE historico_movimientos_salida (
	nombre_completo VARCHAR(50),
    movimientos_salida INT
);