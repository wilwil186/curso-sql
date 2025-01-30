# Curso de Bases de Datos con SQL

¡Bienvenido/a al **Curso de Bases de Datos con SQL**! Este repositorio contiene materiales de estudio, ejemplos y recursos prácticos para aprender y dominar SQL de principio a fin. Siéntete libre de usarlo, contribuir y compartir con otros estudiantes y profesionales.

## Tabla de Contenidos

1. [Introducción](#introducción)  
2. [Requisitos Previos](#requisitos-previos)  
3. [Estructura del Repositorio](#estructura-del-repositorio)  
4. [Fundamentos de Bases de Datos](#fundamentos-de-bases-de-datos)  
5. [Manipulación de Datos con SQL](#manipulación-de-datos-con-sql)  
6. [Funciones y Agrupaciones](#funciones-y-agrupaciones)  
7. [Joins y Relaciones entre Tablas](#joins-y-relaciones-entre-tablas)  
8. [Optimización y Procedimientos Avanzados](#optimización-y-procedimientos-avanzados)  
9. [Administración y Análisis Avanzado](#administración-y-análisis-avanzado)  
10. [Ejemplos Prácticos con SQLite](#ejemplos-prácticos-con-sqlite)  
11. [Recursos Adicionales](#recursos-adicionales)  
12. [Contribución](#contribución)  
13. [Licencia](#licencia)  

---

## Introducción

Este curso te guiará a través de los conceptos y habilidades esenciales para trabajar con bases de datos relacionales, haciendo uso del lenguaje SQL. Aprenderás desde la creación y diseño de tablas hasta la optimización de consultas y análisis de datos avanzado.

### Objetivos del Curso

- **Comprender** el funcionamiento de las bases de datos relacionales.  
- **Escribir** consultas SQL eficientes para extraer y manipular datos.  
- **Optimizar** consultas y mejorar el rendimiento en bases de datos.  
- **Aplicar** SQL en análisis de datos y generación de reportes.  
- **Dominar** herramientas avanzadas como vistas, joins y procedimientos almacenados.

---

## Requisitos Previos

- Conocimientos básicos de programación (recomendado).  
- Entorno de base de datos (MySQL, PostgreSQL, SQLite, etc.).  
- Herramientas de línea de comando (opcional pero útil para automatizar tareas).  
- Una mente curiosa y ganas de aprender.

---

## Estructura del Repositorio

```bash
.
├── docs
│   ├── guias     # Documentos y guías de estudio
│   ├── ejemplos  # Ejemplos en SQL para distintas secciones
│   └── scripts   # Scripts de configuración, creación y manipulación de tablas
├── exercises
│   ├── basicos
│   ├── intermedios
│   └── avanzados
├── README.md      # Archivo principal con la descripción del curso
└── .gitignore
```

---

## Fundamentos de Bases de Datos

1. **Sistemas de Gestión de Bases de Datos (SGBD)**: Conceptos y características.  
2. **Modelo Entidad-Relación (ER)**: Cómo diseñar esquemas relacionales.  
3. **Normalización**: Buenas prácticas para estructurar datos y evitar redundancias.  

---

## Manipulación de Datos con SQL

1. **Creación y modificación de bases de datos**: `CREATE DATABASE`, `ALTER DATABASE`, `DROP DATABASE`.  
2. **Operaciones CRUD**:  
   - **Insertar datos**: `INSERT`  
   - **Actualizar datos**: `UPDATE`  
   - **Borrar datos**: `DELETE`  
3. **Consultas con `SELECT`**:  
   - **Filtrado**: `WHERE`, `LIKE`, `IN`, `NOT`, operadores lógicos (`AND`, `OR`).  
   - **Ordenación**: `ORDER BY`.  
4. **Otros comandos útiles**:  
   - **Creación de tablas**: `CREATE TABLE`, `ALTER TABLE`  
   - **Restricciones**: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`  

---

## Funciones y Agrupaciones

1. **Funciones agregadas**: `COUNT`, `MIN`, `MAX`, `SUM`, `AVG`.  
2. **Agrupaciones**: `GROUP BY`, `HAVING`.  
3. **Uso de `CASE`**: Generar columnas calculadas o lógicas en el resultado de una consulta.  

---

## Joins y Relaciones entre Tablas

1. **Tipos de `JOIN`**:  
   - `INNER JOIN`  
   - `LEFT JOIN`  
   - `RIGHT JOIN`  
   - `FULL JOIN`  
2. **Uniones de múltiples tablas**:  
   - Cómo combinar datos de varias tablas para obtener información completa.

---

## Optimización y Procedimientos Avanzados

1. **Vistas**:  
   - Vistas temporales y materializadas.  
   - Mejoras de rendimiento y seguridad de datos.  
2. **Expresiones de Tabla Comunes (CTE)**:  
   - Simplificación de consultas complejas.  
3. **Procedimientos almacenados**:  
   - Uso de variables, parámetros y control de flujo (`IF`, `WHILE`, etc.).  

---

## Administración y Análisis Avanzado

1. **Respaldos y restauración**: Plan de contingencia y protección de datos.  
2. **Integración con Big Data y ML/IA**:  
   - Cómo conectarse a plataformas de análisis masivo.  
3. **Integración con herramientas de visualización**:  
   - Conexión con Power BI, Tableau, etc.

---

## Ejemplos Prácticos con SQLite

A continuación se presentan ejemplos básicos para que puedas practicar de inmediato con **SQLite**, una base de datos ligera y portable. Para seguir estos ejemplos:

1. [Descarga SQLite](https://www.sqlite.org/download.html) o utiliza un servicio en línea como [DB Fiddle](https://www.db-fiddle.com/) o [SQLite Online](https://sqliteonline.com/).  
2. Crea un archivo `ejemplos.sqlite` o abre la consola de SQLite para ejecutar los scripts.

### Creación de una Tabla

```sql
-- Crear la tabla "Estudiantes"
CREATE TABLE Estudiantes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    correo TEXT NOT NULL UNIQUE,
    fecha_registro DATE DEFAULT (DATE('now'))
);
```

### Insertar Datos

```sql
-- Insertar varios registros en la tabla "Estudiantes"
INSERT INTO Estudiantes (nombre, correo)
VALUES
    ('Ana González', 'ana@example.com'),
    ('Carlos Pérez', 'carlos@example.com'),
    ('María López', 'maria@example.com');
```

### Consultar Datos

```sql
-- Seleccionar todos los campos de la tabla "Estudiantes"
SELECT *
FROM Estudiantes;

-- Filtrar por nombre
SELECT nombre, correo
FROM Estudiantes
WHERE nombre LIKE 'Ana%';
```

### Actualizar Datos

```sql
-- Actualizar el correo de un estudiante
UPDATE Estudiantes
SET correo = 'anagonzalez@example.com'
WHERE id = 1;
```

### Borrar Datos

```sql
-- Eliminar un estudiante por su ID
DELETE FROM Estudiantes
WHERE id = 3;
```

### Uso de Funciones Agregadas

```sql
-- Contar cuántos estudiantes hay registrados
SELECT COUNT(*) AS TotalEstudiantes
FROM Estudiantes;
```

### Joins (Ejemplo)

Si tuviéramos otra tabla `Cursos`:

```sql
CREATE TABLE Cursos (
    curso_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_curso TEXT NOT NULL
);

-- Tabla para relacionar Estudiantes y Cursos
CREATE TABLE EstudianteCursos (
    estudiante_id INTEGER,
    curso_id INTEGER,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);
```

Podríamos consultarlos así:

```sql
-- Consultar qué cursos toma cada estudiante
SELECT E.nombre, C.nombre_curso
FROM Estudiantes E
INNER JOIN EstudianteCursos EC ON E.id = EC.estudiante_id
INNER JOIN Cursos C ON EC.curso_id = C.curso_id;
```

---

## Recursos Adicionales

- **[Página Oficial de SQLite](https://sqlite.org/)**: Documentación y descargas.  
- **[Documentación de MySQL](https://dev.mysql.com/doc/)**: Guías completas y referencias de API.  
- **[Documentación de PostgreSQL](https://www.postgresql.org/docs/)**: Ejemplos, guías y mejores prácticas.  
- **[Curso en Platzi](https://platzi.com/)**: Encuentra este y otros cursos para mejorar tus habilidades en desarrollo y bases de datos.  

---

## Contribución

¡Las contribuciones son bienvenidas! Si deseas añadir ejemplos, corregir errores o mejorar el contenido:

1. Haz un **fork** de este repositorio.  
2. Crea una nueva rama con tu mejora: `git checkout -b feature/nueva-mejora`.  
3. Realiza los cambios y haz commits: `git commit -m "Agrego explicación sobre X"`.  
4. Envía un **pull request** y describe los cambios propuestos.

---

## Licencia

Este proyecto está bajo la licencia [MIT](LICENSE). Siéntete libre de usar el contenido para fines educativos y/o comerciales. ¡Esperamos que te sea de gran ayuda!

---

### ¡Gracias por unirte!

Esperamos que este repositorio te sirva para avanzar en tu formación en SQL. ¡Disfruta el proceso de aprendizaje y no dudes en compartir tus avances con la comunidad!
