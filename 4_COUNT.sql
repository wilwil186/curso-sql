--------------------------------------------------------------------------
-- EJEMPLOS DE USO DE COUNT() EN SQL
--------------------------------------------------------------------------

-- 1) CONTAR ESTUDIANTES POR CURSO (EQUIVALENTE A TU PRIMER EJEMPLO)
-- Usamos GROUP BY con la tabla STUDENT_COURSE para replicar tu escenario

SELECT 
    COURSE_ID, 
    COUNT(STUDENT_ID) AS total_estudiantes  -- Cuenta estudiantes únicos por curso
FROM STUDENT_COURSE
GROUP BY COURSE_ID;

/*
RESULTADO ESPERADO:
COURSE_ID | total_estudiantes
1         | 3                 -- Curso 1 tiene 3 inscritos (John, Mark, Peter)
2         | 2                 -- Curso 2 tiene 2 inscritos (Jane, Peter)
3         | 1                 -- Curso 3 tiene 1 inscrito (John)
4         | 1                 -- Curso 4 tiene 1 inscrito (Lucy)
*/

-- 2) FILTRAR ESTUDIANTES CON MÁS DE 1 CURSO (MODIFICACIÓN DE TU SEGUNDO EJEMPLO)
-- Primero agregamos más datos de prueba para hacer el ejemplo relevante

INSERT INTO STUDENT_COURSE (STUDENT_ID, COURSE_ID) VALUES 
(1, 2),  -- John Doe se inscribe en Advanced SQL Queries
(1, 4);  -- John Doe se inscribe en Machine Learning

-- Ahora aplicamos HAVING
SELECT 
    STUDENT_ID,
    COUNT(COURSE_ID) AS total_cursos
FROM STUDENT_COURSE
GROUP BY STUDENT_ID
HAVING COUNT(COURSE_ID) > 1;  -- Filtra estudiantes con más de 1 curso

/*
RESULTADO TRAS LOS NUEVOS INSERTS:
STUDENT_ID | total_cursos
1          | 4            -- John Doe está en 4 cursos
5          | 2            -- Peter Gonzalez en 2 cursos
*/

--------------------------------------------------------------------------
-- EJEMPLO ADICIONAL: COUNT CON JOIN PARA DATOS ENRIQUECIDOS
-- Muestra nombres de estudiantes y cursos en vez de IDs

SELECT 
    c.COURSE_NAME AS curso,
    s.FIRST_NAME || ' ' || s.LAST_NAME AS estudiante,
    COUNT(sc.STUDENT_ID) OVER (PARTITION BY sc.COURSE_ID) AS estudiantes_por_curso
FROM STUDENT_COURSE sc
JOIN COURSES c ON sc.COURSE_ID = c.COURSE_ID
JOIN STUDENTS s ON sc.STUDENT_ID = s.STUDENT_ID;

/*
RESULTADO PARCIAL:
curso                          | estudiante       | estudiantes_por_curso
Introduction to SQL            | John Doe         | 3
Introduction to SQL            | Mark Taylor      | 3
Introduction to SQL            | Peter Gonzalez   | 3
Advanced SQL Queries           | Jane Miller      | 2
... (resto de registros)
*/

--------------------------------------------------------------------------
-- BUENAS PRÁCTICAS DEMOSTRADAS:
-- 1) Usar ALIAS para mejorar legibilidad
-- 2) Incluir comentarios para secciones complejas
-- 3) Usar snake_case para alias compuestos
-- 4) Validar resultados con datos reales mediante INSERTS
-- 5) Usar JOINs para contextualizar los resultados