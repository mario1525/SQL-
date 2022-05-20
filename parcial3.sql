create table estudiante (
      id int primary key,
	nombre varchar,
	n_matricula int ,    
	telefono bigint,
      estado boolean,
      id_facultad int
);

create table matricula (
      id int primary key,
      fecha_matricula date,
      fecha_fsemestre date 
      id_estudiante int
);  

create table facultad (
      id int primary key,
      n_facultad varchar    
); 

create table asignatura (
      id int primary key,
      n_asignatura varchar ,
      n_profesor varchar,
	id_facultad int
);   

ALTER TABLE matricula
    ADD CONSTRAINT relacion FOREIGN KEY (id_estudiante) REFERENCES estudiante(id);

ALTER TABLE estudiante 
    ADD CONSTRAINT relacion2 FOREIGN KEY (id_facultad) REFERENCES facultad(id);

ALTER TABLE asignatura
    ADD CONSTRAINT relacion3 FOREIGN KEY (id_facultad) REFERENCES facultad(id);

insert into facultad values (31,'ingenieria');
insert into facultad values (32,'derecho');
insert into facultad values (33,'medicina');
insert into facultad values (34,'diseño');

insert into asignatura values (41,'calculo','pedro',31);
insert into asignatura values (42,'fisica','hugo',31);
insert into asignatura values (43,'h derecho','ana',32);
insert into asignatura values (44,'ley romana','juana',32);
insert into asignatura values (45,'s cuerpo','ernesto',33);
insert into asignatura values (46,'fisiologia','dario',33);
insert into asignatura values (47,'h arte','mateo',34);
insert into asignatura values (48,'D grafico','carmen',34);

insert into estudiante values (11, 'mario', 1234,  3213584582,true,31);
insert into estudiante values (12, 'manuela',1234,   3213584582,true,31);
insert into estudiante values (13, 'juan',1234,  3213584582,true,34);
insert into estudiante values (14, 'maria',1234, 3213584582,true,33);
insert into estudiante values (15, 'robert',1234,  3213584582,true,33);
insert into estudiante values (16, 'alex', 1234,  3213584582,false,31);
insert into estudiante values (17, 'jorge', 1234,  3213584582,false,32);
insert into estudiante values (18, 'hugo',1234,  3213584582,false,31);
insert into estudiante values (19, 'juana',1234, 3213584582,false,34);

insert into matricula values (21,'24/02/2022','07/06/2022',11);
insert into matricula values (22,'24/02/2022','31/05/2022',13);
insert into matricula values (23,'24/02/2022','15/06/2022',12);
insert into matricula values (24,'24/02/2022','07/06/2022',14);
insert into matricula values (25,'24/02/2022','07/06/2022',15);


//////////////////////////////////////////////primer punto\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

create view matriculados2 as 
 select nombre 
from estudiante
where id in (select id_estudiante from matricula ) and estado = true

select * from matriculados2

////////////////////////////////////////// segundo punto \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

 DELIMITER $$
CREATE PROCEDURE estadoestudiante ( IN fecha date
) BEGIN

  DECLARE listo boolean DEFAULT false;
  DECLARE v_id int;  
  DECLARE v_nombre VARCHAR(120);
  DECLARE v_estado boolean;  
  

DECLARE c_estudiante CURSOR for SELECT id, estado , nombre  
                                FROM estudiante where id in 
								(select id_estudiante 
                                 from matricula 
                                 where fecha_matricula <fecha and fecha_fsemestre <= fecha);
DECLARE CONTINUE HANDLER for SQLSTATE '02000' SET listo = true;
OPEN c_estudiante;
c_estudianteLoop:LOOP
FETCH c_estudiante INTO v_id, v_estado, v_nombre;
  if listo THEN LEAVE c_estudianteLoop;
  END if;
  UPDATE estudiante set estado = false WHERE id = v_id;
END Loop c_estudianteLoop;
CLOSE c_estudiante;
END$$
DELIMITER ;

call estadoestudiante ('20/05/2022');
