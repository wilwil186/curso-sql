-- Ejemplos básicos de SELECT en SQL

-- 1. Operaciones aritméticas simples
SELECT 2 + 2 AS suma; -- Devuelve 4

-- Seleccionar el resultado de una división con resultado entero
SELECT 18 / 3 AS division; -- Devuelve 6

-- 2. Selección de cadenas de texto
-- Seleccionar una cadena de texto como resultado
SELECT 'Esto es una sentencia SELECT' AS mensaje;

-- 3. Selección de múltiples expresiones en una sola consulta
-- Combinar operaciones aritméticas y cadenas de texto en una consulta
SELECT 
    10 * 5 AS multiplicacion,  -- Devuelve 50
    20 - 7 AS resta,           -- Devuelve 13
    'Hola, SQL!' AS saludo;    -- Devuelve 'Hola, SQL!'

-- 4. Uso de funciones integradas en SELECT
-- Convertir texto a mayúsculas y calcular la longitud de una cadena
SELECT 
    UPPER('texto en mayúsculas') AS mayusculas,  -- Devuelve 'TEXTO EN MAYÚSCULAS'
    LENGTH('contar caracteres') AS longitud;     -- Devuelve 18 (longitud de la cadena)

-- 5. Selección de la fecha y hora actual
-- Obtener la fecha y hora actual del sistema
SELECT CURRENT_TIMESTAMP AS fecha_actual; -- Devuelve la fecha y hora actual

-- 6. Generación de números aleatorios
-- Generar un número aleatorio (la función varía según el sistema de bases de datos)
SELECT RANDOM() AS numero_aleatorio; -- PostgreSQL
-- SELECT RAND() AS numero_aleatorio; -- MySQL / MariaDB

-- 7. Ejemplos adicionales para mejorar la comprensión
-- Calcular el área de un círculo (pi * radio^2)
SELECT 3.1416 * POWER(5, 2) AS area_circulo; -- Devuelve 78.54 (área con radio 5)

-- Concatenar cadenas de texto
SELECT CONCAT('SQL ', 'es ', 'divertido') AS mensaje_concatenado; -- Devuelve 'SQL es divertido'

-- Extraer parte de una cadena de texto
SELECT SUBSTRING('Aprendiendo SQL', 1, 10) AS subcadena; -- Devuelve 'Aprendiendo'

-- Redondear un número decimal
SELECT ROUND(15.789, 2) AS redondeado; -- Devuelve 15.79

-- Calcular la raíz cuadrada
SELECT SQRT(25) AS raiz_cuadrada; -- Devuelve 5

-- 8. Uso de condiciones con CASE
-- Evaluar una condición y devolver un valor basado en el resultado
SELECT 
    CASE 
        WHEN 10 > 5 THEN '10 es mayor que 5'
        ELSE '10 no es mayor que 5'
    END AS resultado_condicion; -- Devuelve '10 es mayor que 5'

-- Ejemplo de consulta SQL para seleccionar correos electrónicos y nombres de instructores
-- Ordenados por la fecha de carga en orden ascendente
SELECT * FROM INSTRUCTORS;
-- Seleccionar las columnas 'eMail' y 'FIRSTNAME' de la tabla 'INSTRUCTORS'
SELECT 
    email,          -- Columna que almacena el correo electrónico del instructor
    FIRST_NAME       -- Columna que almacena el nombre del instructor
FROM 
    INSTRUCTORS     -- Nombre de la tabla que contiene los datos de los instructores
ORDER BY 
    LOAD_DATE ASC;   -- Ordenar los resultados por la columna 'LOADDATE' en orden ascendente (más antiguo a más reciente)

-- Obtener todas las columnas de la tabla cursos
SELECT * FROM COURSES;

-- Contar la cantidad total de cursos con el alias "cantidad"
SELECT COUNT(*) AS cantidad FROM COURSES;

-- Seleccionar las columnas nombre, profe y n_calificaciones renombrándolas
-- SELECT nombre AS name, profe AS teacher, n_calificaciones AS n_reviews FROM COURSES;
