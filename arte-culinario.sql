create table cocineros (
      id int primary key,
	nombre varchar,
	 puesto varchar,    
	telefono bigint      
);

create table menu (
      id int primary key,	
	id_primero int,
      id_segundo int,
	id_postre int,	    
	precio bigint,
      tipo_menu varchar 
);

create table recetas(
	id int primary key,
	nombre varchar ,
	pasos varchar,	
	ingredientes varchar,
	t_estimado varchar,
	utencilios varchar,
      tipo_plato varchar ,
	ingrediente_principal varchar,
	id_ubicacion int,
	id_plato int
	
);

create table documentacion(
	id int primary key,
	fuente varchar,
	ubicacion varchar
);

create table comentario(
	id int primary key, 
	comentario varchar,
	id_rec int,
	id_cheff int,
);

create table plato (
	id int primary key,
	nombre varchar,
	calorias int , 
	cantidades varchar 
);



ALTER TABLE recetas
    ADD CONSTRAINT relacion FOREIGN KEY (id_ubicacion) REFERENCES documentacion(id);
ALTER TABLE comentario
    ADD CONSTRAINT relacion2 FOREIGN KEY (id_rec) REFERENCES recetas(id);
ALTER TABLE comentario
    ADD CONSTRAINT relacion3 FOREIGN KEY (id_cheff) REFERENCES cocineros(id);
ALTER TABLE recetas
    ADD CONSTRAINT relacion4 FOREIGN KEY (id_plato) REFERENCES plato(id);
ALTER TABLE menu
    ADD CONSTRAINT relacion5 FOREIGN KEY (id_primero) REFERENCES plato(id);
ALTER TABLE menu
    ADD CONSTRAINT relacion6 FOREIGN KEY (id_segundo) REFERENCES plato(id);
ALTER TABLE menu
    ADD CONSTRAINT relacion7 FOREIGN KEY (id_postre) REFERENCES plato(id);



