create table estudiante (
      id int primary key,
	nombre varchar,
	n_matricula int ,    
	telefono bigint 
);

create table matricula (
      id int primary key,
      fecha_matricula date,
      id_estudiante int

);     

ALTER TABLE matricula
    ADD CONSTRAINT relacion FOREIGN KEY (id_estudiante) REFERENCES estudiante(id);



insert into estudiante values (11, 'mario', 1234,  3213584582);
insert into estudiante values (12, 'manuela',1234,   3213584582);
insert into estudiante values (13, 'juan',1234,  3213584582);
insert into estudiante values (14, 'maria',1234, 3213584582);
insert into estudiante values (15, 'robert',1234,  3213584582);
insert into estudiante values (16, 'alex', 1234,  3213584582);
insert into estudiante values (17, 'jorge', 1234,  3213584582);
insert into estudiante values (18, 'jose',1234,  3213584582);
insert into estudiante values (19, 'juana',1234, 3213584582);

insert into matricula values (111,'24/02/2022',11);
insert into matricula values (222,'24/02/2022',13);
insert into matricula values (333,'24/02/2022',12);
insert into matricula values (444,'24/02/2022',14);
insert into matricula values (555,'24/02/2022',12);


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