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



insert into documentacion values (11, 'libro culinario', 'estante c numero 43 ');
insert into documentacion values (12, 'pagina web el arte de la cocina ', ' en el area de postres y mas');
insert into documentacion values (13, 'libro cul', 'estante a numero 43 ');
insert into documentacion values (14, 'libro culinario', 'estante c numero 50 ');
insert into documentacion values (15, 'libro culinario', 'estante d numero 43 ');

insert into cocineros values (111, 'jorge', 'principal',3125486975);
insert into cocineros values (112, 'mateo', 'repostero',3125486975);
insert into cocineros values (113, 'juan', 'asistente',3125486975);
insert into cocineros values (114, 'marcos', 'cocinero',3125486975);
insert into cocineros values (115, 'jorge', 'cocinero',3125486975);

insert into plato values (1111, 'ribeye', 500,'250g de carne');
insert into plato values (1112, 'salmon', 500,'250g de pezcado');
insert into plato values (1113, 'cebiche', 500,'250g de camarones');
insert into plato values (1114, 'cerdo', 500,'250g de cerdo');
insert into plato values (1115, 'tacos de ternera', 500,'250g de carne');
insert into plato values (1116, 'carnes en verduras ', 500,'250g de carne');
insert into plato values (1117, 'postre', 500,'250g de galleta de avena ');
insert into plato values (1118, 'postre', 500,'250g de gelatina');

insert into menu values (11111, 1111,1115,1118,150000,'menu de verano');
insert into menu values (11112, 1112,1114,1117,100000,'menu mexicano');
insert into menu values (11113, 1116,1111,1117,230000,'menu invierno');
insert into menu values (11114, 1113,1114,1118,80000,'menu caribe ');

insert into recetas values (111111, 'carnes' , '1-limpiar la carne 2-cosinar 3-servir','carne tomates salsas peregil',
'120 min','horno ahumador','BBQ','carne ribeye', 11,1111 );
insert into recetas values (111112, 'pezcados' , '1-limpiar la carne 2-cosinar 3-servir','carne tomates salsas peregil',
'120 min','horno ahumador','ahumado','salmon', 13,1112 );
insert into recetas values (111113, 'cebiche' , '1-limpiar la carne 2-cosinar 3-servir','carne tomates salsas peregil',
'120 min','horno ahumador','marinado','camaron', 11,1111 );

insert into cocineros values (1122, 'esta receta es de mucha paciencia y consentracion pero muy sabrosa', 111111,111);
insert into cocineros values (1123, 'esta receta es de mucha paciencia y consentracion pero muy sabrosa', 111113,112);     




