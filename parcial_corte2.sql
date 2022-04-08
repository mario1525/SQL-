create table cines (
      id int primary key,
      direccion varchar,
      telefono bigint,
      N_salas int
      
);

create table peliculas (
      id int primary key,      
      nombre varchar,
      director varchar,
      genero varchar,
      id_prota int,
      id_prota2 int,
      id_prota3 int,
      clasificion varchar
      
);

create table protagonista (
	id primary key,
	nombre varchar
);

create table precio (
	id primary key,
	fecha varchar,
	valor int	
);

create table proyecciones (
	id int primary key,
	id_cine int,
	id_peli int,	
	id_hora int,
	sala int,
	id_preci int
);

create table horario (
	id int primary key,
	horas varchar
); 
	

ALTER TABLE proyecciones 
    ADD CONSTRAINT relacion FOREIGN KEY (id_cine) REFERENCES cines(id);
ALTER TABLE proyecciones 
    ADD CONSTRAINT relacion2 FOREIGN KEY (id_peli) REFERENCES peliculas(id);
ALTER TABLE proyecciones 
    ADD CONSTRAINT relacion3 FOREIGN KEY (id_hora) REFERENCES horario(id);
ALTER TABLE proyecciones 
    ADD CONSTRAINT relacion4 FOREIGN KEY (id_preci) REFERENCES precio(id);
ALTER TABLE peliculas 
    ADD CONSTRAINT relacion5 FOREIGN KEY (id_prota) REFERENCES protagonista(id);
ALTER TABLE peliculas 
    ADD CONSTRAINT relacion6 FOREIGN KEY (id_prota2) REFERENCES protagonista(id);
ALTER TABLE peliculas 
    ADD CONSTRAINT relacion7 FOREIGN KEY (id_prota3) REFERENCES protagonista(id);

insert into cines values (11, 'cc plaza cll 80#23:53', 32165448, 4);
insert into cines values (12, 'cc hogar cll 80#23:53', 32165448, 3);
insert into cines values (13, 'cc hola cll 80#23:53', 32165448, 4);

insert into protagonista values (31 , 'richard');
insert into protagonista values (32 , 'manuel');
insert into protagonista values (33 , 'maria');
insert into protagonista values (34 , 'juan');
insert into protagonista values (35 , 'robert');

insert into peliculas values (21, 'homer', 'jorge','comedia', 31 , 33 ,35 , 'todo publico');
insert into peliculas values (23, 'casa', 'pedro','accion', 31 , 33 ,35 , 'todo publico');
insert into peliculas values (24, 'locos', 'jose','terror', 34 , 33 ,32 , 'mayores de 18');
insert into peliculas values (25, 'max', 'angel','comedia', 32 , 33 ,35 , 'todo publico');

insert into horario values (41 , 'de 8 a 12');
insert into horario values (42 , 'de 13 a 15');
insert into horario values (43 , 'de 16 a 19');
insert into horario values (44 , 'de 20 a 23');
insert into horario values (45 , 'de 23 a 1');


insert into precio values (51 , 'dia de semana' , 7000);
insert into precio values (52 , 'fin de semana' , 8000);
insert into precio values (53 , 'festivo' , 6000);
insert into precio values (54 , 'estudianes ' , 5000);
insert into precio values (54 , 'fechas especiales ' , 4500);


insert into proyecciones values (61, 11 , 21, 43 , 2, 53 );
insert into proyecciones values (62, 12 , 23, 43 , 2, 53 );
insert into proyecciones values (63, 13 , 24, 43 , 2, 53 );



//consulta1\\
select nombre 
from peliculas 
where genero = 'terror';




//consulta2\\
create view protago as 
 select id_prota, id_prota2, id_prota3 
from peliculas
where id_prota = (select id from protagonista where nombre = 'richart') or 
      id_prota2 = (select id from protagonista where nombre = 'richart') or
      id_prota3 = (select id from protagonista where nombre = 'richart')
 


