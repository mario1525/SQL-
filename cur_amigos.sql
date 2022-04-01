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
    ADD CONSTRAINT relacion2 FOREIGN KEY (id_receptor) REFERENCES personas(id);

insert into personas values (11, 'mario', 'beltran' , 'marioh@gmail.con');
insert into personas values (12, 'manuela','solano' , 'manuh@gmail.con');
insert into personas values (13, 'juan','beltran' , 'janh@gmail.con');
insert into personas values (14, 'sebastian','perez' , 'perzh@gmail.con');
insert into personas values (15, 'robert','gomes' , '328masih@gmail.con');
insert into personas values (16, 'alex', 'castilla' , 'alex76h@gmail.con');
insert into personas values (17, 'jorge','solano' , 'joroh@gmail.con');
insert into personas values (18, 'jose','gonzalez' , 'jgonzh@gmail.con');

insert into amigos values (20, 11,12,'24/02/2022','24/02/2022','aceptado');
insert into amigos values (21, 18,17,'24/02/2022','24/02/2022','espera');
insert into amigos values (22, 11,16,'24/02/2022','24/02/2022','aceptado');
insert into amigos values (23, 13,17,'24/02/2022','24/02/2022','espera');
insert into amigos values (24, 14,11,'24/02/2022','24/02/2022','aceptado');
insert into amigos values (25, 16,14,'24/02/2022','24/02/2022','aceptado');
insert into amigos values (26, 15,14,'24/02/2022','24/02/2022','aceptado');


create view aceptadose as
select id_emisor from amigos where estado ='aceptado' 
and id_receptor = (select id from personas where nombre ='sebastian')


create view enviase as
select id_receptor from amigos where estado ='aceptado' 
and id_emisor = (select id from personas where nombre ='sebastian')

select nombre
from personas 
where id in (SELECT id_emisor FROM aceptadose
UNION
SELECT id_receptor FROM enviase)

