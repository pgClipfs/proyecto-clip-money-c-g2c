insert into login (password, ultimo_acceso, usuario, id_us,log_activo)
values ('1234','2020-09-29 13:05','pepe95',8,1)

insert into login (password, ultimo_acceso, usuario, id_us,log_activo)
values ('1111','2020-09-29','sabrii',9,1)

insert into login (password, ultimo_acceso, usuario, id_us,log_activo)
values ('1122','2020-09-29','juani',10,1)

select * from login
delete from login where id_usuario=1
delete from login

--------------------------------------------------------------------------------------------------------------------------------

insert into contacto (pais, provincia, localidad, barrio, calle, nro_casa, departamento, cod_postal)
values (1,1,1,'alberdi','c.pellegrini',49,0,4444)

insert into contacto (pais, provincia, localidad,barrio, calle, nro_casa, departamento, cod_postal)
values (1,1,1,'alberdi','c.pellegrini',49,0)

insert into contacto (pais, provincia, localidad,barrio, calle, nro_casa, departamento, piso, puerta, cod_postal)
values (1,2,1,'alberdi','c.pellegrini',49,1,3,'a')

select * from contacto
delete from contacto where id_usuario=1
delete from contacto

--------------------------------------------------------------------------------------------------------------------------------
insert into paises (nom_pais)
values ('argentina')

insert into paises (nom_pais)
values ('chile')

insert into paises (nom_pais)
values ('uruguay')

insert into paises (nom_pais)
values ('peru')

insert into paises (nom_pais)
values ('venezuela')

insert into paises (nom_pais)
values ('bolivia')

insert into paises (nom_pais)
values ('mexico')

insert into paises (nom_pais)
values ('paraguay')

insert into paises (nom_pais)
values ('ecuador')

insert into paises (nom_pais)
values ('brasil')

select * from paises
delete from paises where id_usuario=1
delete from paises
--------------------------------------------------------------------------------------------------------------------------------
insert into provincias (nom_prov)
values ('cordoba')

insert into provincias (nom_pais)
values ('buenos aires')

select * from provincias
delete from provincias where id_usuario=1
delete from provincias
--------------------------------------------------------------------------------------------------------------------------------
insert into localidades (nom_loc)
values ('cordoba')

insert into localidades  (nom_loc)
values ('rio cuarto')

select * from localidades 
delete from localidades  where id_usuario=1
delete from localidades 
--------------------------------------------------------------------------------------------------------------------------------
insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('jose','perez','img/fotof.jmg','img/fotor.jmg',35689528,'jose_love@sumail.com','1991-09-29',19356895286,358456825,1)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('sabrina','perez','img/fotof.jmg','img/fotor.jmg',35777528,'sabrii@sumail.com','1991-09-29',19357775286,358456825,1)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('juan','hernandez','img/fotof.jmg','img/fotor.jmg',35777528,'juanito@sumail.com','1991-09-05',19355689286,35568928,2)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('romina','lopez','img/fotof.jmg','img/fotor.jmg',35775666,'rl95@sumail.com','1994-12-05',19354569286,35536928,1)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('santiago','rios','img/fotof.jmg','img/fotor.jmg',35985666,'tiagorios@sumail.com','1993-02-15',19354569741,35536741,2)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('abel','lozano','img/fotof.jmg','img/fotor.jmg',35975648,'rl95@sumail.com','1991-06-25',19352229286,35222928,1)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('alicia','lugones','img/fotof.jmg','img/fotor.jmg',35714566,'alilu58@sumail.com','1997-12-05',19354458286,35458928,1)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('andres','martinez','img/fotof.jmg','img/fotor.jmg',35766366,'amnez@sumail.com','1990-11-01',19354789686,35547896,2)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('alonso','alvarez','img/fotof.jmg','img/fotor.jmg',35752366,'alonso1994@sumail.com','1994-01-28',19354631286,35514566,1)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('susana','gimenez','img/fotof.jmg','img/fotor.jmg',35772266,'rl95@sumail.com','1992-04-18',19354567486,35537428,2)

select * from usuarios
select id_usuario, nombre, dni from usuarios
delete from usuarios 

--------------------------------------------------------------------------------------------------------------------------------

INSERT INTO tipo_operaciones (nombre_op, descripcion) VALUES ('Extraccion', 'Extraer dinero');
INSERT INTO tipo_operaciones (nombre_op, descripcion) VALUES ('Deposito', 'Depositar dinero');
INSERT INTO tipo_operaciones (nombre_op, descripcion) VALUES ('Transferencia', 'Transferir dinero' );

select * from tipo_operaciones order by nombre_op asc
delete from tipo_operaciones

--------------------------------------------------------------------------------------------------------------------------------

INSERT INTO operaciones ( fecha, monto, cbu_destino, cvu_destino, tipo_op) VALUES ('2010-03-05',8000, 0590940090418135201, 0001300000074550000, 7)
INSERT INTO operaciones ( fecha, monto, cbu_destino, cvu_destino, tipo_op) VALUES ('2010-03-05',4000, 0590940090418135201, 0001300000074550000, 8)
INSERT INTO operaciones ( fecha, monto, cbu_destino, cvu_destino, tipo_op) VALUES ('2010-09-15',3000, 0590940090418135201, 0001300000074550000, 7)
INSERT INTO operaciones ( fecha, monto, cbu_destino, cvu_destino, tipo_op) VALUES ('2010-09-15',9000, 0590940090418135201, 0001300000074550000, 7)

select * from operaciones
select avg (monto) from operaciones where tipo_op=7 and fecha='2010-09-15'
delete from operaciones

--------------------------------------------------------------------------------------------------------------------------------

INSERT INTO cuentas (monto_al_descubierto, saldo, id_us, id_op, cuenta_activa) VALUES (9000, 40000, 5, 9, 1)
INSERT INTO cuentas (monto_al_descubierto, saldo, id_us, id_op, cuenta_activa) VALUES (7000, 80000, 6, 10, 1)

select * from cuentas
delete from cuentas where id_us=1
delete from cuentas

--------------------------------------------------------------------------------------------------------------------------------


select u.nombre, u.apellido, l.usuario
from usuarios u inner join login l
on u.id_login = l.id_usuario