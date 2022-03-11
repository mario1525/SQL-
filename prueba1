


CREATE TABLE solicitud (
    id int primary key ,
    id_usu_soli int,
    fecha_envi date,
    estado character,
    momento character
);

CREATE TABLE usu_soli (
    id int primary key ,
    id_remitente int,
    id_reseptor int
);

CREATE TABLE usuario (
    id int primary key ,
    nombre character(50),
    apellido character(50),
    edad int
);

ALTER TABLE usu_soli
    ADD CONSTRAINT relacion FOREIGN KEY (id_remitente) REFERENCES usuario(id);

ALTER TABLE usu_soli
    ADD CONSTRAINT relacion_2 FOREIGN KEY (id_reseptor) REFERENCES usuario(id);

ALTER TABLE solicitud
    ADD CONSTRAINT relacion_3 FOREIGN KEY (id_usu_soli) REFERENCES usu_soli(id);

insert into usuario values (11, 'mario', 'beltran' , 18);
insert into usuario values (12, 'manuela', 'mejia' , 18);
insert into usuario values (13, 'juan', 'mendoza' , 19);
insert into usuario values (14, 'maria', 'hernadez' , 17);
insert into usuario values (15, 'robert', 'fernandez' , 20);
insert into usuario values (16, 'alex', 'solano' , 21);
insert into usuario values (17, 'jorge', 'gonzales' , 19);
insert into usuario values (18, 'jose', 'soto' , 23);
insert into usuario values (19, 'juana', 'perez' , 17);
insert into usuario values (20, 'ana', 'brito' , 18);
insert into usuario values (21, 'liliana', 'carrillo' , 20);
insert into usuario values (22, 'isabella', 'paredes ' , 19);
insert into usuario values (23, 'jaime', 'daza' , 15);
insert into usuario values (24, 'valentina', 'solano' , 23);
insert into usuario values (25, 'manuel', 'medina' , 21);

insert into usu_soli values (111,11,20);
insert into usu_soli values (112,15,25);
insert into usu_soli values (113,16,11);
insert into usu_soli values (114,18,20);
insert into usu_soli values (115,22,11);
insert into usu_soli values (116,23,14);
insert into usu_soli values (117,25,20);
insert into usu_soli values (118,12,16);
insert into usu_soli values (119,11,15);
insert into usu_soli values (120,13,22);
insert into usu_soli values (121,16,17);
insert into usu_soli values (122,25,24);
insert into usu_soli values (123,21,18);
insert into usu_soli values (124,24,12);

insert into solicitud values (1111, 111 , '24/02/2022' ,'true' ,'aceptado');
insert into solicitud values (1112, 112 , '01/07/2021','false' ,'espera');
insert into solicitud values (1113, 113 , '21/02/2020' ,'false' ,'enviado');
insert into solicitud values (1114, 114 , '11/05/2020' ,'false' ,'rechasado');
insert into solicitud values (1115, 115 , '30/11/2021' ,'true' ,'aceptado');
insert into solicitud values (1116, 116 , '29/10/2020' ,'true' ,'aceptado');
insert into solicitud values (1117, 117 , '12/09/2022' ,'true' ,'aceptado');
insert into solicitud values (1118, 118 , '03/05/2022' ,'false' ,'rechasado');
insert into solicitud values (1119, 119 , '23/07/2022' ,'true' ,'aceptado');
insert into solicitud values (1120, 120 , '28/12/2020' ,'false' ,'rechasado');
insert into solicitud values (1121, 121 , '21/12/2019' ,'true' ,'aceptado');
insert into solicitud values (1122, 122 , '20/10/2019' ,'false' ,'enviado');
insert into solicitud values (1123, 123 , '02/05/2018' ,'true' ,'aceptado');
insert into solicitud values (1124, 124 , '05/01/2020' ,'true' ,'aceptado');


create view aceptadas as select id_usu_soli from solicitud where estado = 'true' ;

create view amigos as select * from usu_soli where id in (select * from aceptadas );

create view amigos_m as 
select id_remitente, id_reseptor from amigos where id_remitente = (select id from usuario where nombre = 'mario' )
or id_reseptor = (select id from usuario where nombre = 'mario');

create view nombre as select nombre from usuario where id in (select id_remitente from amigos_m);

create view nombre2 as select nombre from usuario where id in (select id_reseptor from amigos_m);