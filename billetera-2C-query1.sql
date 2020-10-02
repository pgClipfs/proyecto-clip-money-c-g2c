insert into login values ('1234','2020-09-29 13:05','pepe95')
insert into login values ('1111','2020-09-29','sabrii')
insert into login values ('1122','2020-09-29','juani')

select * from login
delete from login where id_usuario=1
delete from login

--------------------------------------------------------------------------------------------------------------------------------

insert into ubicacion (pais, provincia, localidad,barrio, calle, nro_casa, departamento)
values ('argentina','cordoba','rio cuarto','alberdi','c.pellegrini',49,0)

insert into ubicacion (pais, provincia, localidad,barrio, calle, nro_casa, departamento)
values ('argentina','cordoba','rio cuarto','alberdi','c.pellegrini',49,0)

insert into ubicacion (pais, provincia, localidad,barrio, calle, nro_casa, departamento, piso, puerta)
values ('argentina','cordoba','rio cuarto','alberdi','c.pellegrini',49,1,3,'a')

select * from ubicacion
delete from ubicacion where id_usuario=1
delete from ubicacion

--------------------------------------------------------------------------------------------------------------------------------

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,id_login,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('jose','perez','img/fotof.jmg','img/fotor.jmg',8,35689528,'jose_love@sumail.com','1991-09-29',19356895286,358456825,1)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,id_login,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('sabrina','perez','img/fotof.jmg','img/fotor.jmg',9,35777528,'sabrii@sumail.com','1991-09-29',19357775286,358456825,1)

insert into usuarios (nombre,apellido,foto_frente_dni,foto_reverso_dni,id_login,dni,email,fecha_nac,cuilcuit,telefono,id_ubic)
values ('juan','hernandez','img/fotof.jmg','img/fotor.jmg',10,35777528,'juanito@sumail.com','1991-09-05',19355689286,35568928,2)

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

INSERT INTO cuentas (monto_al_descubierto, saldo, id_us, id_op) VALUES (9000, 40000, 5, 9)
INSERT INTO cuentas (monto_al_descubierto, saldo, id_us, id_op) VALUES (7000, 80000, 6, 10)

select * from cuentas
delete from cuentas where id_us=1
delete from cuentas

--------------------------------------------------------------------------------------------------------------------------------


select u.nombre, u.apellido, l.usuario
from usuarios u inner join login l
on u.id_login = l.id_usuario