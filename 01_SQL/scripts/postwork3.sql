/* POSTWORK 3 - Instroducción a SQL */
-- Valeria Osorio Ferreiro :)

USE tienda;

-- 1. Usuarios Mayores de Edad
/* Crea una consulta para seleccionar el nombre y apellido de los
usuarios cuya edad sea mayor a 18 años. */

SELECT nombre, apellido, edad
FROM Usuarios
WHERE edad > 18;

-- 2. Pedidos de Productos Agotados
/* Escriba una consulta para seleccionar el ID y la fecha de los pedidos
que contienen productos actualmente agotados en el inventario. */

SELECT pedido_id, fecha_pedido
FROM Pedidos
WHERE pedido_id IN(
    SELECT pedido_id 
    FROM Detalles_Pedido
    WHERE producto_id IN(
        SELECT producto_id
        FROM Productos
        WHERE stock_disponible = 0
    )
);

-- Comprobaciones
SELECT * FROM Productos
WHERE stock_disponible = 0;

SELECT DISTINCT producto_id
FROM Detalles_Pedido
ORDER BY producto_id;

/* La consulta no arroja ningun resultado debido a que en Detalles_Pedido
no existen registros con los producto_id 66, 67 y 68, que corresponden
a los productos actualmente agotados en la tabla Productos. Por lo tanto, 
ningún detalle de pedido está asociado con esos productos
agotados y la consulta no encuentra pedidos que cumplan la condición. */

-- 3. Cantidad Total de Pedidos de un Usuario
/* Escribe una consulta para mostrar el nombre del usuario y la cantidad total de  
pedidos realizados por cada usuario. */

SELECT U.nombre, (
    SELECT COUNT(*)
    FROM Pedidos P
    WHERE P.user_id = U.user_id
) AS total_pedidos
FROM Usuarios U;

-- 4. Productos con Precio Superior al Promedio
/* Escribe una consulta para seleccionar el nombre del producto y su precio
para todos los productos cuyo precio sea superior al precio promedio de todos 
los productos. */

SELECT nombre_producto, precio
FROM Productos
WHERE precio > (SELECT AVG(precio) FROM Productos);

-- 5. Productos con Precio Superior al Promedio Versión 2
/* Añade a la consulta anterior el precio promedio como columna para poder .comparar
los resultados */

SELECT nombre_producto, precio, (
    SELECT AVG(precio) 
    FROM Productos
) AS precio_promedio 
FROM Productos
WHERE precio > (SELECT AVG(precio) FROM Productos);

