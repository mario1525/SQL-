create table personas (
      id int primary key,
	nombre varchar,
	apellido varchar,
      correo varchar
);

create table amigos (
      id int primary key,
      id_emisor int, 
      id_receptor int, 
      fecha_solicitud date,
      fecha_aceptacion date,
      estado varchar
	
);

ALTER TABLE amigos
    ADD CONSTRAINT relacion FOREIGN KEY (id_emisor) REFERENCES personas(id);
ALTER TABLE amigos
    ADD CONSTRAINT relacion FOREIGN KEY (id_receptor) REFERENCES personas(id);

insert into personas values (11, 'mario', 'beltran' , 'marioh@gmail.con');
insert into personas values (12, 'manuela','solano' , 'manuh@gmail.con');
insert into personas values (13, 'juan',1234,'beltran' , 'janh@gmail.con');
insert into personas values (14, 'sebastian','perez' , 'perzh@gmail.con');
insert into personas values (15, 'robert','gomes' , '328masih@gmail.con');
insert into personas values (16, 'alex', 'castilla' , 'alex76h@gmail.con');
insert into personas values (17, 'jorge','solano' , 'joroh@gmail.con');
insert into personas values (18, 'jose','gonzalez' , 'jgonzh@gmail.con');



