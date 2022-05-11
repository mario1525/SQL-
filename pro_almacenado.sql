DELIMITER $$
CREATE PROCEDURE nombreproductos(IN nombre_cliente varchar(55))  
BEGIN
   select nombre from productos where id in 
(select id from detalle_fac where id_enc = ( select id from factura where id_person =
(select id from personas where nombre = nombre_cliente )));
END$$
DELIMITER $$