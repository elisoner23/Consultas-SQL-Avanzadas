--Consulta 1: Insertar un propietario
INSERT INTO propietarios (
	nombre,
	apellido,
	email,
	telefono
) VALUES (
	'Erick', 'Garcia', 'erick.garcia@alojamiento.com', '+503-6585-7410'
);

SELECT * FROM propietarios;


--Consulta 2: Alojamiento
INSERT INTO alojamientos (id_propietario, nombre, descripcion, tipo, direccion, ciudad, pais, precio_noche, capacidad_personas, num_habitaciones, num_banos, activo) VALUES
(6, 'Apartamento Lago de coatepeque', 'Hermoso hostal con vista al lago', 'hostal', 'Calle Principal #233', 'Santa Ana', 'El Salvador', 85.00, 7, 4, 2, true);

SELECT * FROM alojamientos;


--Consulta 3: Huesped y Reserva
INSERT INTO huespedes (nombre, apellido, email, telefono, nacionalidad) VALUES
('Stephany', 'Figueroa', 'stephany.figueroa@email.com', '+44-555-1010', 'Reino Unido');

SELECT * FROM huespedes;

--Consulta 3: Huesped y Reserva
INSERT INTO reservas (id_alojamiento, id_huesped, fecha_entrada, fecha_salida, num_personas, precio_total, estado) VALUES
(11, 11, '2026-06-15', '2026-06-30', 2, 200.00, 'confirmada');

SELECT * FROM reservas;

--Consulta 4: Registrar pago
INSERT INTO pagos (id_reserva, monto, metodo_pago, estado_pago) VALUES
(14, 200.00, 'tarjeta', 'completado');

SELECT * FROM pagos;

--Consulta 5: Alojamientos activos
SELECT * FROM alojamientos
WHERE activo = TRUE;


--Consulta 5: Huespedes por pais
SELECT * FROM huespedes
WHERE nacionalidad = 'Estados Unidos';


--Reservas por fechas
SELECT * FROM reservas
WHERE fecha_entrada
BETWEEN '2025-05-15' AND '2025-06-30';


--Consulta 8: Actualizar precio
UPDATE alojamientos
SET precio_noche = 75.00
WHERE id_alojamiento = 1;

SELECT * FROM alojamientos;


-- Consulta 9: Estado reserva
UPDATE reservas
SET estado = 'Confirmada'
WHERE id_reserva = 14;

SELECT * FROM reservas;


--Consulta 10: Eliminar reseña
DELETE FROM resenas
WHERE id_resena = 5;

SELECT * FROM resenas;


--Consulta 11: Reservas + huesped
SELECT
	r.id_reserva,
	h.nombre,
	h.apellido,
	r.fecha_entrada,
	r.fecha_salida
FROM reservas r
INNER JOIN huespedes h
ON r.id_huesped = h.id_huesped;


--Consulta 12: Alojamiento completo
SELECT
	a.nombre AS alojamiento,
	h.nombre AS huesped,
	r.fecha_entrada,
	r.fecha_salida
FROM reservas r
INNER JOIN alojamientos a
ON r.id_alojamiento = a.id_alojamiento
INNER JOIN huespedes h
ON r.id_huesped = h.id_huesped;


--Consulta 13: Pagos + reservas
SELECT
	p.id_pago,
	p.monto,
	r.id_reserva,
	r.estado
FROM pagos p
INNER JOIN reservas r
ON p.id_reserva = r.id_reserva;


--Consulta 14: Sin reseñas
SELECT
	a.id_alojamiento,
	a.nombre,
	re.id_resena
FROM alojamientos a
LEFT JOIN resenas re
ON a.id_alojamiento = re.id_alojamiento;


--Consulta 15: Sin reservas
SELECT
	a.id_alojamiento,
	a.nombre
FROM alojamientos a
LEFT JOIN reservas r
ON a.id_alojamiento = r.id_alojamiento
WHERE r.id_reserva IS NULL;


--Consulta 16: Total ingresos
SELECT
SUM(monto) AS total_ingresos
FROM pagos;


--Consulta 17: Promedio rating
SELECT
AVG(calificacion) AS promedio_rating
FROM resenas;


--Consulta 18: Top alojamientos
SELECT
	id_alojamiento,
COUNT(*) AS total_reservas
FROM reservas
GROUP BY id_alojamiento
ORDER BY total_reservas DESC
LIMIT 5;


--Consulta 19: Más de 3 reservas
SELECT
	id_alojamiento,
COUNT(*) AS cantidad_reservas
FROM reservas
GROUP BY id_alojamiento
HAVING COUNT(*) > 3;


--Consulta 20: Alojamiento más caro
SELECT *
FROM alojamientos
WHERE precio_noche = (
    SELECT MAX(precio_noche)
    FROM alojamientos
);








