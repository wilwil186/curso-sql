--------------------------------------------------------------------------
-- CONSULTAS UTILIZANDO WHERE
-- Filtrar instructores con una edad mayor a 40 años
SELECT * FROM INSTRUCTORS WHERE AGE > 40;

-- Filtrar estudiantes con un apellido específico
SELECT * FROM STUDENTS WHERE LAST_NAME = 'Doe';

-- Filtrar cursos que tengan más de 3 créditos
SELECT * FROM COURSES WHERE CREDITS > 3;

--------------------------------------------------------------------------
-- USO DE BETWEEN PARA RANGOS DE DATOS
-- Filtrar estudiantes cuya edad esté entre 22 y 30 años
SELECT * FROM STUDENTS WHERE AGE BETWEEN 22 AND 30;

-- Filtrar cursos con créditos entre 3 y 5
SELECT * FROM COURSES WHERE CREDITS BETWEEN 3 AND 5;

-- Filtrar instructores con ID entre 1 y 3
SELECT * FROM INSTRUCTORS WHERE INSTRUCTOR_ID BETWEEN 1 AND 3;

--------------------------------------------------------------------------
-- CONSULTAS UTILIZANDO LIKE PARA PATRONES DE BÚSQUEDA
-- Buscar estudiantes cuyo nombre comience con 'J'
SELECT * FROM STUDENTS WHERE FIRST_NAME LIKE 'J%';

-- Buscar instructores cuyo correo termine en '@example.com'
SELECT * FROM INSTRUCTORS WHERE EMAIL LIKE '%@example.com';

--------------------------------------------------------------------------
-- CONSULTAS UTILIZANDO IN PARA MULTIPLES VALORES
-- Buscar cursos impartidos por los instructores con ID 1 o 2
SELECT * FROM COURSES WHERE INSTRUCTOR_ID IN (1, 2);

-- Buscar estudiantes con ID en una lista específica
SELECT * FROM STUDENTS WHERE STUDENT_ID IN (1, 3, 5);

--------------------------------------------------------------------------
-- CONSULTAS UTILIZANDO ORDER BY PARA ORDENAR DATOS
-- Ordenar estudiantes por edad en orden descendente
SELECT * FROM STUDENTS ORDER BY AGE DESC;

-- Ordenar cursos por créditos en orden ascendente
SELECT * FROM COURSES ORDER BY CREDITS ASC;

--------------------------------------------------------------------------
-- CONSULTAS UTILIZANDO LIMIT PARA RESTRINGIR RESULTADOS
-- Obtener solo los primeros 3 estudiantes
SELECT * FROM STUDENTS LIMIT 3;

-- Obtener los 2 cursos con más créditos
SELECT * FROM COURSES ORDER BY CREDITS DESC LIMIT 2;
