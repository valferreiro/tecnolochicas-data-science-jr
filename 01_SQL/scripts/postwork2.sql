/* POSTWORK 2 - Instroducción a SQL */
-- Valeria Osorio Ferreiro :)

USE tienda;

/* 1. Encuentra el número total de usuario registrados cuya edad sea
mayor o igual a 30 años. */
SELECT * FROM Usuarios;

SELECT nombre, edad
FROM Usuarios
WHERE edad >= 30;

/* 2. Lista de productos que tienen un precio mayor a $50, ordenados por
nombre de producto de forma ascendsente. */
SELECT * FROM Productos;

SELECT nombre_producto, precio
FROM Productos
WHERE precio > 50
ORDER BY nombre_producto ASC;

/* 3. Calcula la edad promedio de los usuarios por fecha de registro. */
SELECT fecha_registro,
   ROUND(AVG(edad), 0) AS edad_promedio
FROM Usuarios
GROUP BY fecha_registro
ORDER BY fecha_registro ASC;

/* 4. Encuentra el identificador del producto y la cantidad vendida en cada 
pedido, donde la cantidad vendida sea mayor a 10 unidades, ordenado por el identificador 
del producto de forma descendente. */

SELECT * FROM Detalles_Pedido;

SELECT pedido_id, producto_id, cantidad
FROM Detalles_Pedido
WHERE cantidad > 10 
ORDER BY producto_id DESC;

SELECT pedido_id, producto_id, cantidad
FROM Detalles_Pedido
ORDER BY cantidad DESC;


/* 5. Muestra los usuarios que se registraron en el último mes, ordenados por la
fecha de registro de forma descendente. */
SELECT nombre, fecha_registro
FROM Usuarios
WHERE fecha_registro >= (SELECT MAX(fecha_registro) FROM Usuarios) - INTERVAL 1 MONTH
ORDER BY fecha_registro;
