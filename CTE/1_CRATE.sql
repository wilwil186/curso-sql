-- ==========================================
-- CREACIÓN DE TABLAS
-- ==========================================
DROP TABLE IF EXISTS MARCAS;
DROP TABLE IF EXISTS PRODUCTOS;
-- Crear la tabla MARCAS
-- Esta tabla almacena las diferentes marcas de productos
CREATE TABLE MARCAS (
    id INTEGER PRIMARY KEY,    -- Identificador único de la marca (clave primaria)
    nombre TEXT NOT NULL       -- Nombre de la marca (obligatorio)
);

-- Crear la tabla PRODUCTOS
-- Esta tabla almacena los productos y se relaciona con la tabla MARCAS
CREATE TABLE PRODUCTOS (
    id INTEGER PRIMARY KEY,    -- Identificador único del producto (clave primaria)
    nombre TEXT NOT NULL,      -- Nombre del producto (obligatorio)
    marca_id INTEGER,          -- Clave foránea que relaciona con la tabla MARCAS
    precio REAL,               -- Precio del producto (valor decimal)
    FOREIGN KEY (marca_id) REFERENCES MARCAS (id)  -- Restricción de clave foránea
);

-- ==========================================
-- INSERCIÓN DE DATOS: MARCAS
-- ==========================================

-- Insertar datos en la tabla MARCAS
INSERT INTO MARCAS (id, nombre) VALUES
(1, 'Dell'),             -- Marca de equipos informáticos
(2, 'Apple'),            -- Marca de productos electrónicos
(3, 'Samsung'),          -- Marca de electrónica de consumo
(4, 'HP'),               -- Marca de equipos informáticos y periféricos
(5, 'Lenovo'),           -- Marca de ordenadores y dispositivos
(6, 'Asus'),             -- Marca de hardware informático
(7, 'Acer'),             -- Marca de ordenadores
(8, 'LG'),               -- Marca de electrónica y electrodomésticos
(9, 'Sony'),             -- Marca de electrónica y entretenimiento
(10, 'Microsoft'),       -- Marca de software y hardware
(11, 'Huawei'),          -- Marca de telecomunicaciones
(12, 'Xiaomi'),          -- Marca de electrónica y telefonía
(13, 'Logitech'),        -- Marca de periféricos informáticos
(14, 'Canon'),           -- Marca de equipos fotográficos
(15, 'Epson');           -- Marca de impresoras y proyectores

-- ==========================================
-- INSERCIÓN DE DATOS: PRODUCTOS
-- ==========================================

-- Insertar datos en la tabla PRODUCTOS
INSERT INTO PRODUCTOS (id, nombre, marca_id, precio) VALUES
-- Productos Dell
(1, 'Laptop XPS 13', 1, 1200.50),          -- Portátil ultraligero premium
(2, 'Monitor UltraSharp 27"', 1, 300.00),  -- Monitor profesional de alta resolución
(3, 'Laptop Inspiron 15', 1, 799.99),      -- Portátil gama media
(4, 'Alienware m15', 1, 1899.99),          -- Portátil gaming
(5, 'Dock WD19', 1, 249.99),               -- Estación de acoplamiento

-- Productos Apple
(6, 'iPhone 14 Pro', 2, 999.99),           -- Teléfono inteligente de gama alta
(7, 'MacBook Pro 16"', 2, 2500.00),        -- Portátil profesional
(8, 'iPad Air', 2, 599.99),                -- Tablet de gama media
(9, 'AirPods Pro', 2, 249.99),             -- Auriculares inalámbricos
(10, 'iMac 24"', 2, 1499.99),              -- Ordenador todo en uno

-- Productos Samsung
(11, 'Galaxy S23 Ultra', 3, 1199.99),      -- Teléfono inteligente flagship
(12, 'Galaxy Tab S8', 3, 649.99),          -- Tablet de gama alta
(13, 'Monitor Odyssey G9', 3, 1399.99),    -- Monitor curvo para gaming
(14, 'Galaxy Watch 5', 3, 279.99),         -- Reloj inteligente
(15, 'SSD 980 Pro 1TB', 3, 179.99),        -- Unidad de estado sólido

-- Productos HP
(16, 'Laptop Spectre x360', 4, 1299.99),   -- Portátil convertible
(17, 'OfficeJet Pro 9015', 4, 229.99),     -- Impresora multifunción
(18, 'Pavilion Desktop', 4, 699.99),       -- Ordenador de escritorio
(19, 'OMEN 27i Monitor', 4, 499.99),       -- Monitor para gaming
(20, 'Z Book Fury G9', 4, 2399.99),        -- Estación de trabajo móvil

-- Productos Lenovo
(21, 'ThinkPad X1 Carbon', 5, 1499.99),    -- Portátil profesional
(22, 'Yoga 9i', 5, 1199.99),               -- Portátil convertible
(23, 'Legion 5 Pro', 5, 1299.99),          -- Portátil gaming
(24, 'ThinkCentre M70q', 5, 549.99),       -- Mini PC
(25, 'Tab P11 Pro', 5, 399.99),            -- Tablet Android

-- Productos Asus
(26, 'ROG Zephyrus G14', 6, 1499.99),      -- Portátil gaming
(27, 'ZenBook 14', 6, 999.99),             -- Ultrabook
(28, 'ProArt Display PA278CV', 6, 349.99), -- Monitor para creadores
(29, 'TUF Gaming A15', 6, 999.99),         -- Portátil gaming resistente
(30, 'ROG Swift PG32UQ', 6, 899.99),       -- Monitor gaming 4K

-- Productos Acer
(31, 'Predator Helios 300', 7, 1199.99),   -- Portátil gaming
(32, 'Swift 5', 7, 999.99),                -- Ultrabook ligero
(33, 'Nitro 5', 7, 799.99),                -- Portátil gaming accesible
(34, 'Aspire 5', 7, 599.99),               -- Portátil para productividad
(35, 'Chromebook Spin 713', 7, 599.99),    -- Chromebook convertible

-- Productos LG
(36, 'OLED C2 55"', 8, 1499.99),           -- Televisor OLED
(37, 'UltraGear 27GN950', 8, 799.99);    -- Monitor gam
