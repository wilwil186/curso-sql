-- DROP
--DROP TABLE IF EXISTS marcas;
--DROP TABLE IF EXISTS productos;


-- Crear tabla de marcas
CREATE TABLE MARCAS (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

-- Insertar datos en la tabla de marcas
INSERT INTO MARCAS (id, nombre) VALUES 
(1, 'Dell'),
(2, 'Apple'),
(3, 'Samsung');

-- Crear tabla de productos
CREATE TABLE PRODUCTOS (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    marca_id INTEGER NOT NULL,
    precio REAL NOT NULL,
    FOREIGN KEY (marca_id) REFERENCES marcas (id)
);

-- Insertar datos en la tabla de productos
INSERT INTO PRODUCTOS (id, nombre, marca_id, precio) VALUES 
(1, 'Laptop', 1, 1200.00),
(2, 'Smartphone', 2, 800.00),
(3, 'Tablet', 1, 400.00);

-- Consultar las tablas para verificar los datos
SELECT * FROM MARCAS;
SELECT * FROM PRODUCTOS;
--- inner 
SELECT * FROM PRODUCTOS INNER JOIN MARCAS ON PRODUCTOS.marca_id = MARCAS.id;


SELECT P.ID, P.NOMBRE, M.ID, M.NOMBRE
FROM PRODUCTOS P
INNER JOIN MARCAS M ON P.MARCA_ID = M.ID;
-- NO ES BUENA PRATICA COLOCAR SOLO UNA LETRA PARA RENOMBRAR UNA TABLA POR 
-- QUE NO SE ENTIENDE 

CREATE VIEW VM_STUDENTS AS 
SELECT * FROM STUDENTS;