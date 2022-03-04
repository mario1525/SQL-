create table estudiante (
      id int primary key,
	nombre varchar,
	n_matricula int ,
      c_matriculado varchar,
	fecha_nacimiento date,
	telefono bigint 
);

create table asignatura (	
	cog_asignatura int  primary key ,
	nombre varchar ,
      cod_profe int 
	
);

create table profesor (	
      id_p int,
      nif_p int primary key,
	nombre varchar,
	especialidad varchar,	
	telefono bigint 
);

create table alum_asig (	
      id int primary key,
      id_alum int,
	id_asig int 
);
ALTER TABLE asignatura
    ADD CONSTRAINT relacion FOREIGN KEY (cod_profe) REFERENCES profesor(nif_p);

ALTER TABLE alum_asig
    ADD CONSTRAINT relacion2 FOREIGN KEY (id_asig) REFERENCES asignatura(cog_asignatura);

ALTER TABLE alum_asig
    ADD CONSTRAINT relacion3 FOREIGN KEY (id_alum) REFERENCES estudiante(id);




insert into estudiante values (11, 'mario', 1234, '9no', '24/02/2022' , 3213584582);
insert into estudiante values (12, 'manuela',1234, '9no', '24/02/2022' , 3213584582);
insert into estudiante values (13, 'juan',1234, '9no', '24/02/2022' , 3213584582);
insert into estudiante values (14, 'maria',1234, '9no', '24/02/2022' , 3213584582);
insert into estudiante values (15, 'robert',1234, '9no', '24/02/2022' , 3213584582);
insert into estudiante values (16, 'alex', 1234, '9no', '24/02/2022' , 3213584582);
insert into estudiante values (17, 'jorge', 1234, '8vo', '24/02/2022' , 3213584582);
insert into estudiante values (18, 'jose',1234, '8vo', '24/02/2022' , 3213584582);
insert into estudiante values (19, 'juana',1234, '8vo', '24/02/2022' , 3213584582);
insert into estudiante values (20, 'ana', 1234, '8vo', '24/02/2022' , 3213584582);
insert into estudiante values (21, 'liliana',1234, '10mo', '24/02/2022' , 3213584582);
insert into estudiante values (22, 'isabella', 1234, '10mo', '24/02/2022' , 3213584582);
insert into estudiante values (23, 'jaime',1234, '10mo', '24/02/2022' , 3213584582);
insert into estudiante values (24, 'valentina', 1234, '10mo', '24/02/2022' , 3213584582);
insert into estudiante values (25, 'manuel', 1234, '10mo', '24/02/2022' , 3213584582);

insert into profesor  values (321,111,'willian','informatico' ,3213584582);
insert into profesor values (215,112, 'juana' , 'sociales', 3213584582);
insert into profesor values (325,113,'pedro' , 'matematicas', 3213584582);

insert into asignatura values (1111,'informatica',111);
insert into asignatura values (1122,'sociales',112);
insert into asignatura values (1133,'matematicas',113);

insert into alum_asig values (11111,11,1111);
insert into alum_asig values (11112,15,1111);
insert into alum_asig values (11113,16,1111);
insert into alum_asig values (11114,18,1111);
insert into alum_asig values (11115,22,1111);
insert into alum_asig values (11116,23,1133);
insert into alum_asig values (11117,25,1133);
insert into alum_asig values (11118,12,1133);
insert into alum_asig values (11119,11,1133);

create view alumno as 
select id_alum from alum_asig where id_asig = (
	select cog_asignatura from asignatura where cod_profe = (
	select nif_p from profesor where nombre = 'willian') );
select nombre from estudiante where id in (select * from alumno);