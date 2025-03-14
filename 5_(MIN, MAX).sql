-- Selecciona todos los estudiantes
SELECT * FROM STUDENTS;

-- Calcula la edad mínima y máxima de los estudiantes
SELECT 
    MIN(AGE) AS 'EDAD_MINIMA',
    MAX(AGE) AS 'EDAD_MAXIMA'
FROM STUDENTS;

-- Cuenta cuántos cursos está tomando cada estudiante
SELECT STUDENT_ID, COUNT(*) AS 'NUMERO_DE_CURSOS'
FROM STUDENT_COURSE
GROUP BY STUDENT_ID;

-- Cuenta cuántos estudiantes hay en cada curso
SELECT COURSE_ID, COUNT(*) AS 'NUMERO_DE_ESTUDIANTES'
FROM STUDENT_COURSE
GROUP BY COURSE_ID;

-- Selecciona los cursos que tienen más de 2 estudiantes
SELECT COURSE_ID, COUNT(*) AS 'NUMERO_DE_ESTUDIANTES'
FROM STUDENT_COURSE 
GROUP BY COURSE_ID
HAVING COUNT(*) > 2; 

-- Asigna estudiantes a equipos basados en su edad
SELECT 
    AGE,
    CASE 
        WHEN AGE BETWEEN 18 AND 22 THEN 'TEAM A' 
        ELSE 'TEAM B' 
    END AS 'EQUIPO'
FROM STUDENTS;

-- Cuenta cuántos estudiantes hay en cada equipo
SELECT 
    CASE 
        WHEN AGE BETWEEN 18 AND 22 THEN 'TEAM A' 
        ELSE 'TEAM B' 
    END AS 'EQUIPO',
    COUNT(*) AS 'NUMERO_DE_ESTUDIANTES'
FROM STUDENTS
GROUP BY 
    CASE 
        WHEN AGE BETWEEN 18 AND 22 THEN 'TEAM A' 
        ELSE 'TEAM B' 
END;
