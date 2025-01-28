-- Ejemplos básicos de SELECT en SQL

-- Seleccionar una operación aritmética simple
SELECT 2 + 2 AS suma; -- Devuelve 4

-- División con resultado entero
SELECT 18 / 3 AS division; -- Devuelve 6

-- Selección de una cadena de texto
SELECT 'Esto es una sentencia SELECT' AS mensaje;

-- Seleccionar múltiples expresiones en una sola consulta
SELECT 
    10 * 5 AS multiplicacion, 
    20 - 7 AS resta, 
    'Hola, SQL!' AS saludo;

-- Usar funciones integradas en SELECT
SELECT 
    UPPER('texto en mayúsculas') AS mayusculas, 
    LENGTH('contar caracteres') AS longitud;

-- Seleccionar la fecha y hora actual
SELECT CURRENT_TIMESTAMP AS fecha_actual;

-- Generar un número aleatorio (varía según el sistema de bases de datos)
SELECT RANDOM() AS numero_aleatorio; -- PostgreSQL
-- SELECT RAND() AS numero_aleatorio; -- MySQL / MariaDB
