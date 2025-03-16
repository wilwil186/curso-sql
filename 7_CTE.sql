-- Definir la CTE para productos y marcas
WITH ProductosMarcas AS (
    SELECT 
        P.ID AS ProductoID, 
        P.NOMBRE AS ProductoNombre, 
        M.ID AS MarcaID, 
        M.NOMBRE AS MarcaNombre
    FROM PRODUCTOS P
    INNER JOIN MARCAS M ON P.MARCA_ID = M.ID
)

-- Consultar la CTE
SELECT * 
FROM ProductosMarcas;
/*
Las CTE son expresiones de tabla comunes que permiten definir tablas temporales en una consulta SQL. 
Son útiles para hacer consultas más legibles y estructuradas, especialmente cuando necesitas realizar 
operaciones complejas o reutilizar subconsultas.
);
*/