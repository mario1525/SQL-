create table estudiante (
      id int primary key,
	nombre varchar,
	n_matricula int ,    
	telefono bigint,
      id_facultad int
);

create table matricula (
      id int primary key,
      fecha_matricula date,
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

insert into estudiante values (11, 'mario', 1234,  3213584582,31);
insert into estudiante values (12, 'manuela',1234,   3213584582,31);
insert into estudiante values (13, 'juan',1234,  3213584582,34);
insert into estudiante values (14, 'maria',1234, 3213584582,33);
insert into estudiante values (15, 'robert',1234,  3213584582,33);
insert into estudiante values (16, 'alex', 1234,  3213584582,31);
insert into estudiante values (17, 'jorge', 1234,  3213584582,32);
insert into estudiante values (18, 'hugo',1234,  3213584582,31);
insert into estudiante values (19, 'juana',1234, 3213584582,34);

insert into matricula values (21,'24/02/2022',11);
insert into matricula values (22,'24/02/2022',13);
insert into matricula values (23,'24/02/2022',12);
insert into matricula values (24,'24/02/2022',14);
insert into matricula values (25,'24/02/2022',12);



// busqueda primera actividad 

SELECT *
FROM estudiante
INNER JOIN matricula
ON estudiante.id = matricula.id_estudiante;

SELECT *
FROM estudiante
left JOIN matricula
ON estudiante.id = matricula.id_estudiante;

SELECT *
FROM estudiante
right JOIN matricula
ON estudiante.id = matricula.id_estudiante;

SELECT *
FROM estudiante
full outer JOIN matricula
ON estudiante.id = matricula.id_estudiante
where nombre = 'mario';

//busqueda segunda actividad 

SELECT *
FROM estudiante
INNER JOIN facultad ON estudiante.id_facultad = facultad.id 
INNER JOIN asignatura ON asignatura.id_facultad = facultad.id
inner join matricula on  matricula.id_estudiante = estudiante.id;

SELECT *
FROM estudiante
left JOIN facultad ON estudiante.id_facultad = facultad.id 
left JOIN asignatura ON asignatura.id_facultad = facultad.id
left join matricula on  matricula.id_estudiante = estudiante.id;

SELECT *
FROM estudiante
right JOIN facultad ON estudiante.id_facultad = facultad.id 
right JOIN asignatura ON asignatura.id_facultad = facultad.id
right join matricula on  matricula.id_estudiante = estudiante.id;

SELECT *
FROM estudiante
full outer JOIN facultad ON estudiante.id_facultad = facultad.id 
full outer JOIN asignatura ON asignatura.id_facultad = facultad.id
full outer join matricula on  matricula.id_estudiante = estudiante.id
where nombre = 'mario';



