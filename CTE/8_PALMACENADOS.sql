-- =============================================
-- PROCEDIMIENTO ALMACENADO PARA GESTIONAR PRODUCTOS
-- =============================================
/*
Un procedimiento almacenado es un conjunto de instrucciones SQL precompiladas
que se almacenan en el servidor de base de datos y pueden ser invocadas cuando
se necesiten. Ofrecen varias ventajas:

1. Reutilización de código: Se escriben una vez y se ejecutan múltiples veces
2. Seguridad: Permiten controlar el acceso a las tablas subyacentes
3. Rendimiento: Al estar precompilados, se ejecutan más rápido
4. Mantenimiento: Centralizan la lógica de negocio en la base de datos
5. Reducción de tráfico de red: Solo se envían los parámetros y resultados
*/

-- Eliminamos el procedimiento si ya existe para evitar errores
DROP PROCEDURE IF EXISTS sp_GestionarProductos;

-- Creamos el procedimiento almacenado
CREATE PROCEDURE sp_GestionarProductos(
    IN p_accion VARCHAR(10),           -- Acción a realizar: 'INSERTAR', 'ACTUALIZAR', 'ELIMINAR', 'BUSCAR'
    IN p_id INTEGER,                   -- ID del producto (para actualizar, eliminar o buscar)
    IN p_nombre TEXT,                  -- Nombre del producto
    IN p_marca_id INTEGER,             -- ID de la marca
    IN p_precio REAL                   -- Precio del producto
)
BEGIN
    -- Declaración de variables
    DECLARE v_existe INTEGER;
    
    -- Verificamos qué acción realizar
    CASE p_accion
        -- INSERTAR un nuevo producto
        WHEN 'INSERTAR' THEN
            -- Verificamos si la marca existe
            SELECT COUNT(*) INTO v_existe FROM MARCAS WHERE id = p_marca_id;
            
            IF v_existe > 0 THEN
                -- Insertamos el nuevo producto
                INSERT INTO PRODUCTOS (id, nombre, marca_id, precio)
                VALUES (p_id, p_nombre, p_marca_id, p_precio);
                
                -- Mostramos mensaje de éxito
                SELECT 'Producto insertado correctamente' AS Mensaje;
            ELSE
                -- Mostramos mensaje de error
                SELECT 'Error: La marca especificada no existe' AS Mensaje;
            END IF;
            
        -- ACTUALIZAR un producto existente
        WHEN 'ACTUALIZAR' THEN
            -- Verificamos si el producto existe
            SELECT COUNT(*) INTO v_existe FROM PRODUCTOS WHERE id = p_id;
            
            IF v_existe > 0 THEN
                -- Verificamos si la marca existe
                SELECT COUNT(*) INTO v_existe FROM MARCAS WHERE id = p_marca_id;
                
                IF v_existe > 0 THEN
                    -- Actualizamos el producto
                    UPDATE PRODUCTOS
                    SET nombre = p_nombre,
                        marca_id = p_marca_id,
                        precio = p_precio
                    WHERE id = p_id;
                    
                    -- Mostramos mensaje de éxito
                    SELECT 'Producto actualizado correctamente' AS Mensaje;
                ELSE
                    -- Mostramos mensaje de error
                    SELECT 'Error: La marca especificada no existe' AS Mensaje;
                END IF;
            ELSE
                -- Mostramos mensaje de error
                SELECT 'Error: El producto especificado no existe' AS Mensaje;
            END IF;
            
        -- ELIMINAR un producto
        WHEN 'ELIMINAR' THEN
            -- Verificamos si el producto existe
            SELECT COUNT(*) INTO v_existe FROM PRODUCTOS WHERE id = p_id;
            
            IF v_existe > 0 THEN
                -- Eliminamos el producto
                DELETE FROM PRODUCTOS WHERE id = p_id;
                
                -- Mostramos mensaje de éxito
                SELECT 'Producto eliminado correctamente' AS Mensaje;
            ELSE
                -- Mostramos mensaje de error
                SELECT 'Error: El producto especificado no existe' AS Mensaje;
            END IF;
            
        -- BUSCAR un producto por ID
        WHEN 'BUSCAR' THEN
            -- Buscamos el producto y su marca
            SELECT P.id, P.nombre AS producto, M.nombre AS marca, P.precio
            FROM PRODUCTOS P
            JOIN MARCAS M ON P.marca_id = M.id
            WHERE P.id = p_id;
            
        -- Acción no reconocida
        ELSE
            SELECT 'Error: Acción no reconocida. Use INSERTAR, ACTUALIZAR, ELIMINAR o BUSCAR' AS Mensaje;
    END CASE;
END;
