create table cines (
      id int primary key,
      direccion varchar,
      telefono bigint,
      N_salas int
      
);

create table peliculas (
      id int primary key,
      id_cines int,
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
	ds int,
	fs int,
	fes int,
	estu int
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



