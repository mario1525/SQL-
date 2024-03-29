DELIMITER $$
CREATE PROCEDURE cursorTest (
) BEGIN

  DECLARE listo boolean DEFAULT false;
  DECLARE v_id int;
  DECLARE v_estado VARCHAR(120);
  DECLARE v_nombre VARCHAR(120);
  DECLARE v_precio BIGINT;  
  
DECLARE c_productos CURSOR for SELECT id, estado , nombre ,precio 
                                FROM productos;
DECLARE CONTINUE HANDLER for SQLSTATE '02000' SET listo = true;
OPEN c_productos;
c_productosLoop:LOOP;
FETCH c_productos INTO v_id, v_estado, v_nombre, v_precio;
  if listo THEN LEAVE c_productosLoop;
  END if;
  UPDATE productos set precio = precio + 10 WHERE id = v_id;
END Loop c_productosLoop;
CLOSE c_productos;
END$$
DELIMITER ;

call cursorTest() 


