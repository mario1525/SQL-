create table usuario (
      id int primary key,
      nombre varchar, 
      estado boolean,      
      cargo varchar	
);

insert into usuario values (111, 'jorge', true ,'estudiante');
insert into usuario values (112, 'mateo', false,'estudiante');
insert into usuario values (114, 'marcos', true,'administrativo');
insert into usuario values (115, 'jorge', true,'servicios');

DELIMITER $$
CREATE PROCEDURE cambiarEstado (IN nnombre varchar(50)) 
BEGIN

  DECLARE listo boolean DEFAULT false;
  DECLARE v_id int;
  DECLARE v_estado boolean;
  
   
  
DECLARE c_state CURSOR for SELECT id, estado
                                FROM usuario ;
DECLARE CONTINUE HANDLER for SQLSTATE '02000' SET listo = true;
OPEN c_state;
c_stateLoop:LOOP
FETCH c_state INTO v_id, v_estado;
  if listo THEN LEAVE c_stateLoop;
  END if;
  UPDATE usuario set estado = true WHERE id = v_id and id = (select id from usuario Where nombre = nnombre);
END Loop c_stateLoop;
CLOSE c_state;
END$$
DELIMITER ;

call cambiarEstado('jorge')

//////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

DELIMITER $$
CREATE PROCEDURE cambiarEstado2 (IN nid int(11)) 
BEGIN

  DECLARE listo boolean DEFAULT false;
  DECLARE v_id int;
  DECLARE v_estado boolean;   
  
DECLARE c_state CURSOR for SELECT id, estado
                                FROM usuario ;
DECLARE CONTINUE HANDLER for SQLSTATE '02000' SET listo = true;
OPEN c_state;
c_stateLoop:LOOP
FETCH c_state INTO v_id, v_estado;
  if listo THEN LEAVE c_stateLoop;
  END if;
  UPDATE usuario set estado = false WHERE id = v_id and id =  nid;
END Loop c_stateLoop;
CLOSE c_state;
END$$
DELIMITER ;

call cambiarEstado2(111);

//////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

DELIMITER $$
CREATE PROCEDURE cambiarEstado3 (IN nid int(11)) 
BEGIN

  DECLARE listo boolean DEFAULT false;
  DECLARE v_id int;
  DECLARE v_estado boolean;   
  
DECLARE c_state CURSOR for SELECT id, estado
                                FROM usuario ;
DECLARE CONTINUE HANDLER for SQLSTATE '02000' SET listo = true;
OPEN c_state;
c_stateLoop:LOOP
FETCH c_state INTO v_id, v_estado;
  if listo THEN LEAVE c_stateLoop;
  END if;
  UPDATE usuario set estado = false WHERE id = v_id and id =  nid;
END Loop c_stateLoop;
CLOSE c_state;
END$$
DELIMITER ;

call cambiarEstado3(111);
