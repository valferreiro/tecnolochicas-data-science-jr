/* POSTWORK 4 - Instroducción a SQL */
-- Valeria Osorio Ferreiro :)

USE tienda;

-- 1. INNER JOIN con Pedidos y Usuarios
/* Utiliza INNER JOIN para combinar la tabla Pedidos con la tabla
de Usuarios y obtén el nombre de usuario y fecha en que se realizó cada pedido. */

SELECT U.nombre, U.apellido, P.fecha_pedido
FROM Usuarios U
INNER JOIN Pedidos P
ON U.user_id = P.user_id;

-- 2. LEFT JOIN
/* Utiliza LEFT JOIN para combinar la tabla de Productos con la 
tabla Detalles_Pedido y obtén el nombre del producto, la cantidad y el precio
unitario para cada detalle de pedido. 
    a) Si un producto no tiene detalle de pedido, muestra NULL para las columnas
    correspondientes. */
   
SELECT P.nombre_producto, D.cantidad, P.precio
FROM Productos P
LEFT JOIN Detalles_Pedido D
ON P.producto_id = D.producto_id;

-- 3. RIGHT JOIN
/* Utiliza RIGHT JOIN para combinar la tabla Pedidos con la tabla de Usuarios
y obtener el nombre de usuario y la fecha de pedido para cada pedido.
    a) Incluye todos los pedidos, incluso si no hay un usuario asociado al pedido. */

SELECT U.user_id, U.nombre, P.pedido_id, P.fecha_pedido
FROM Usuarios U
RIGHT JOIN Pedidos P
ON U.user_id = P.user_id;

-- 4. UNION
/* Utiliza UNION para combinar los nombres de los productos de la tabla 
Productos y Detalles_Pedido, en un solo conjunto de resultados. */

SELECT producto_id, nombre_producto
FROM Productos
UNION
SELECT producto_id, NULL AS nombre_producto
FROM Detalles_Pedido;

-- 5. CROSS JOIN
/* Utiliza CROSS JOIN para generar todas las posibles combinaciones entre los 
nombres de usuario de la tabla Usuarios y los nombres de prodcuto de la tabla Productos. */

SELECT U.nombre, P.nombre_producto
FROM Usuarios U
CROSS JOIN Productos P;








