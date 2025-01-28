--------------------------------------------------------------------------
-- ELIMINACIÓN DE TABLAS (SI EXISTEN)
-- Antes de crear nuevamente las tablas, nos aseguramos de borrarlas
-- si existen para evitar errores de duplicado.

DROP TABLE IF EXISTS INSTRUCTORS;
DROP TABLE IF EXISTS STUDENTS;
DROP TABLE IF EXISTS COURSES;
DROP TABLE IF EXISTS STUDENT_COURSE;
--------------------------------------------------------------------------
-- 1) TABLA: INSTRUCTORS
-- Descripción: Esta tabla almacena la información de los instructores 
-- (profesores). Cada instructor tiene un ID único y datos personales básicos.

CREATE TABLE INSTRUCTORS (
    INSTRUCTOR_ID INTEGER PRIMARY KEY AUTOINCREMENT,      -- Identificador único del instructor
    FIRST_NAME    VARCHAR(50),                           -- Nombre del instructor
    LAST_NAME     VARCHAR(50),                           -- Apellido del instructor
    AGE           INTEGER,                                -- Edad del instructor
    EMAIL         VARCHAR(100),                          -- Correo electrónico del instructor
    LOAD_DATE     TIMESTAMP DEFAULT (DATETIME('now', 'localtime')),  -- Fecha/hora de creación del registro
    UPDATE_DATE   TIMESTAMP DEFAULT (DATETIME('now', 'localtime'))   -- Fecha/hora de última actualización
);

--------------------------------------------------------------------------
-- 2) TABLA: STUDENTS
-- Descripción: En esta tabla se almacena la información de los estudiantes.
-- Cada estudiante tiene un ID único y datos personales básicos.

CREATE TABLE STUDENTS (
    STUDENT_ID   INTEGER PRIMARY KEY AUTOINCREMENT,       -- Identificador único del estudiante
    FIRST_NAME   VARCHAR(50),                             -- Nombre del estudiante
    LAST_NAME    VARCHAR(50),                             -- Apellido del estudiante
    AGE          INTEGER,                                  -- Edad del estudiante
    EMAIL        VARCHAR(100),                            -- Correo electrónico del estudiante
    LOAD_DATE    TIMESTAMP DEFAULT (DATETIME('now', 'localtime')),   -- Fecha/hora de creación del registro
    UPDATE_DATE  TIMESTAMP DEFAULT (DATETIME('now', 'localtime'))    -- Fecha/hora de última actualización
);

--------------------------------------------------------------------------
-- 3) TABLA: COURSES
-- Descripción: Esta tabla almacena la información de los cursos.
-- Cada curso tiene un ID único, el ID del instructor que lo imparte y
-- otros datos relevantes como nombre, descripción y créditos.

CREATE TABLE COURSES (
    COURSE_ID     INTEGER PRIMARY KEY AUTOINCREMENT,      -- Identificador único del curso
    INSTRUCTOR_ID INTEGER,                                -- Identificador del instructor que imparte el curso
    COURSE_NAME   VARCHAR(100),                           -- Nombre del curso
    DESCRIPTION   VARCHAR(200),                           -- Descripción breve del curso
    CREDITS       INTEGER,                                -- Número de créditos del curso
    LOAD_DATE     TIMESTAMP DEFAULT (DATETIME('now', 'localtime')),  -- Fecha/hora de creación del registro
    UPDATE_DATE   TIMESTAMP DEFAULT (DATETIME('now', 'localtime')),  -- Fecha/hora de última actualización
    FOREIGN KEY (INSTRUCTOR_ID) REFERENCES INSTRUCTORS(INSTRUCTOR_ID) -- Relación con la tabla INSTRUCTORS
);

--------------------------------------------------------------------------
-- 4) TABLA: STUDENT_COURSE
-- Descripción: Esta tabla representa la relación muchos-a-muchos
-- entre los estudiantes y los cursos en los que se inscriben.
-- Contiene el ID del estudiante, el ID del curso y la fecha de inscripción.

CREATE TABLE STUDENT_COURSE (
    STUDENT_COURSE_ID INTEGER PRIMARY KEY AUTOINCREMENT,  -- Identificador único de la relación estudiante-curso
    STUDENT_ID        INTEGER,                            -- Identificador del estudiante
    COURSE_ID         INTEGER,                            -- Identificador del curso
    ENROLLMENT_DATE   TIMESTAMP DEFAULT (DATETIME('now', 'localtime')), -- Fecha/hora de inscripción
    LOAD_DATE         TIMESTAMP DEFAULT (DATETIME('now', 'localtime')), -- Fecha/hora de creación del registro
    UPDATE_DATE       TIMESTAMP DEFAULT (DATETIME('now', 'localtime')), -- Fecha/hora de última actualización
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),  -- Relación con la tabla STUDENTS
    FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID)      -- Relación con la tabla COURSES
);

--------------------------------------------------------------------------
-- INSERTS: INSTRUCTORS
-- Agregamos algunos instructores de ejemplo.

INSERT INTO INSTRUCTORS (FIRST_NAME, LAST_NAME, AGE, EMAIL)
VALUES ('Alice', 'Smith', 40, 'alice.smith@example.com'); 
-- Instructor con nombre Alice Smith, 40 años.

INSERT INTO INSTRUCTORS (FIRST_NAME, LAST_NAME, AGE, EMAIL)
VALUES ('Bob', 'Anderson', 35, 'bob.anderson@example.com');
-- Instructor con nombre Bob Anderson, 35 años.

INSERT INTO INSTRUCTORS (FIRST_NAME, LAST_NAME, AGE, EMAIL)
VALUES ('Carol', 'Johnson', 45, 'carol.johnson@example.com');
-- Instructor con nombre Carol Johnson, 45 años.

--------------------------------------------------------------------------
-- INSERTS: STUDENTS
-- Agregamos varios estudiantes de ejemplo.

INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME, AGE, EMAIL)
VALUES ('John', 'Doe', 25, 'john.doe@example.com'); 
-- Estudiante John Doe, 25 años.

INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME, AGE, EMAIL)
VALUES ('Jane', 'Miller', 22, 'jane.miller@example.com');
-- Estudiante Jane Miller, 22 años.

INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME, AGE, EMAIL)
VALUES ('Mark', 'Taylor', 27, 'mark.taylor@example.com');
-- Estudiante Mark Taylor, 27 años.

INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME, AGE, EMAIL)
VALUES ('Lucy', 'Garcia', 20, 'lucy.garcia@example.com');
-- Estudiante Lucy Garcia, 20 años.

INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME, AGE, EMAIL)
VALUES ('Peter', 'Gonzalez', 29, 'peter.gonzalez@example.com');
-- Estudiante Peter Gonzalez, 29 años.

--------------------------------------------------------------------------
-- INSERTS: COURSES
-- Agregamos cursos de ejemplo, relacionándolos con los instructores insertados.
-- Observa que INSTRUCTOR_ID debe corresponder a un ID existente en la tabla INSTRUCTORS.

INSERT INTO COURSES (INSTRUCTOR_ID, COURSE_NAME, DESCRIPTION, CREDITS)
VALUES (1, 'Introduction to SQL', 'Conceptos básicos de SQL y bases de datos relacionales', 3);
-- Curso impartido por el Instructor con INSTRUCTOR_ID = 1 (Alice Smith).

INSERT INTO COURSES (INSTRUCTOR_ID, COURSE_NAME, DESCRIPTION, CREDITS)
VALUES (1, 'Advanced SQL Queries', 'Técnicas avanzadas de consultas en SQL', 4);
-- Curso impartido por el Instructor con INSTRUCTOR_ID = 1 (Alice Smith).

INSERT INTO COURSES (INSTRUCTOR_ID, COURSE_NAME, DESCRIPTION, CREDITS)
VALUES (2, 'Data Analysis with Python', 'Introducción a librerías para análisis de datos', 5);
-- Curso impartido por el Instructor con INSTRUCTOR_ID = 2 (Bob Anderson).

INSERT INTO COURSES (INSTRUCTOR_ID, COURSE_NAME, DESCRIPTION, CREDITS)
VALUES (3, 'Machine Learning Fundamentals', 'Conceptos básicos de aprendizaje automático', 4);
-- Curso impartido por el Instructor con INSTRUCTOR_ID = 3 (Carol Johnson).

--------------------------------------------------------------------------
-- INSERTS: STUDENT_COURSE
-- Agregamos la relación entre estudiantes y cursos.
-- Asegúrate de que los STUDENT_ID y COURSE_ID existan en sus tablas correspondientes.

-- Ejemplo: Estudiante 1 (John Doe) se inscribe en el Curso 1 (Introduction to SQL).
INSERT INTO STUDENT_COURSE (STUDENT_ID, COURSE_ID)
VALUES (1, 1);

-- Estudiante 1 (John Doe) también se inscribe en el Curso 3 (Data Analysis with Python).
INSERT INTO STUDENT_COURSE (STUDENT_ID, COURSE_ID)
VALUES (1, 3);

-- Estudiante 2 (Jane Miller) se inscribe en el Curso 2 (Advanced SQL Queries).
INSERT INTO STUDENT_COURSE (STUDENT_ID, COURSE_ID)
VALUES (2, 2);

-- Estudiante 3 (Mark Taylor) se inscribe en el Curso 1 (Introduction to SQL).
INSERT INTO STUDENT_COURSE (STUDENT_ID, COURSE_ID)
VALUES (3, 1);

-- Estudiante 4 (Lucy Garcia) se inscribe en el Curso 4 (Machine Learning Fundamentals).
INSERT INTO STUDENT_COURSE (STUDENT_ID, COURSE_ID)
VALUES (4, 4);

-- Estudiante 5 (Peter Gonzalez) se inscribe en el Curso 1 (Introduction to SQL) y 2 (Advanced SQL Queries).
INSERT INTO STUDENT_COURSE (STUDENT_ID, COURSE_ID)
VALUES (5, 1);
INSERT INTO STUDENT_COURSE (STUDENT_ID, COURSE_ID)
VALUES (5, 2);

--------------------------------------------------------------------------
-- CONSULTAS DE VERIFICACIÓN
-- Realizamos algunas consultas sencillas para verificar que se hayan insertado los registros correctamente.

SELECT * FROM INSTRUCTORS;
SELECT * FROM STUDENTS;
SELECT * FROM COURSES;
SELECT * FROM STUDENT_COURSE;

/*
CREATE TABLE people (
    person_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    last_name TEXT(255),
    first_name TEXT(255),
    address TEXT(255),
    city TEXT(255)
);
*/
