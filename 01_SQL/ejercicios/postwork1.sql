/* POSTWORK 1 - Introducción a SQL */
-- Valeria Osorio Ferreiro :)

USE tienda;

-- 1. Usuarios Jóvenes Registrados Recientemente.
/* Selecciona el nombre  y apellido de los usuarios menores a 30 años y que se 
registraron después del 01 de Enero del 2020. Ordena de manera desc los resultados. */

SELECT * FROM Usuarios; 
-- En lugar de usar DESCRIBE para mí es mejor visualmente seleccionar toda la tabla antes de hacer consultas :)

SELECT nombre, apellido, fecha_registro
FROM Usuarios
WHERE edad < 30 AND fecha_registro > '2020-01-01'
ORDER BY fecha_registro DESC;

-- 2. Productos Económicos y con Stock Disponible.
/* Obten el nombre y precio de los productos que tienen un stock disponible mayor o igual
a 10 y cuyo precio sea menor o igual a $50. Ordena los resultados por precio en orden asc. */

SELECT * FROM Productos;

SELECT nombre_producto, precio, stock_disponible
FROM Productos
WHERE stock_disponible >= 10 AND precio <= 50
ORDER BY precio ASC;

-- 3. Pedidos Grandes Realizados Antes de una Fecha Específica.
/* Recupera el identificador del pedido, fecha del pedido y total del pedido 
para aquellos pedidos realizados antes del 01 de Enero del 2024 y cuyo total del pedido
sea mayor a $100. Ordena los resultados por fecha del pedido en orden desc. */

SELECT * FROM Pedidos;

SELECT pedido_id, fecha_pedido, total_pedido 
FROM Pedidos
WHERE fecha_pedido < '2024/01/01' AND total_pedido > 100
ORDER BY fecha_pedido DESC;

-- 4. Productos Próximos por Terminarse.
/* Muestra la descripción del producto y el stock disponible de aquellos productos que
tengan menos de 10 piezas disponibles en stock. Ordena alfabéticamente los resultados. */

SELECT * FROM Productos;

SELECT nombre_producto, descripcion, stock_disponible
FROM Productos
WHERE stock_disponible < 10
ORDER BY descripcion ASC;

-- 5. Usuarios de la Tercera Edad y Registros a partir del Último Mes. 
/* Obtén los correos electrónicos de los usuarios que son parte de la tercera edad y se hayan
registrado en el último mes de información. Ordena alfabéticamente los resultados por dirección de correo. */ 

SELECT * FROM Usuarios;

SELECT edad, correo_electronico, fecha_registro
FROM Usuarios
WHERE edad >= 60
AND fecha_registro >= (SELECT MAX(fecha_registro) FROM Usuarios) - INTERVAL 1 MONTH
ORDER BY correo_electronico ASC;

/* [ (SELECT MAX(fecha_registro) FROM Usuarios) ] -> Busca la fecha más reciente en fecha_registro,
[ - INTERVAL 1 MONTH ] -> Resta un mes exacto a esa fecha encontrada. */







