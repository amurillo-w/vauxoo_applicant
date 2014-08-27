
﻿--sql1: parte 1
--Crea una base de datos llamada "employee_employee". 

create database employee_employee;

-- drop database employee_employee
-- drop table employee
-- drop table employee_departament
-- drop table employee_hobby
-- drop table emplo_hobby


--Crea una tabla de "employee" con los campos "id", "first name", "Last Name". 
--Se agrego un campo id_departament para relacionar la tabla con departamento

create table employee(
  id_em serial,
  first_name varchar(30) not null,
  last_name varchar(30) not null,
  primary key (id_em)
 );

--Crea una tabla "employee_departament" con los campos "id", "name", "description". 
 
 create table employee_departament(
  id_dep serial,
  name_depto varchar(20) not null,
  description varchar(99)not null,
  primary key(id_dep)
 );
--Haz los cambios necesarios en la base de datos para poder asignarle 
--a los empleados su respectivo departamento.

--Agregua un campo id_departamento en la tabla employee para relacionarla con la tabla employee_departament

alter table employee
  add id_departament smallint;

--Se agrega la llave foranea para la relacion entre tablas
alter table employee
add constraint FK_employee_id_departament
foreign key (id_departament)
references employee_departament(id_dep);

--Reglas: 
--Un empleado está asignado a un solo departamento. 
--Los departamentos pueden tener muchos empleados. 
--Haz cumplir las reglas de normalización de tablas y reglas de base de datos.

--Inserta 4 empleados y 6 departamentos de datos, 
--asígnale a los empleados un departamento. 


 insert into employee_departament(name_depto,description)
 values ('Administrativo','Encargado de la administracion dentro de la empresa');
 insert into employee_departament(name_depto,description)
 values ('Recursos Humanos','Bsca personal capacitado');
 insert into employee_departament(name_depto,description)
 values ('Sistemas','Encargado de soporte en hardware y software');
 insert into employee_departament(name_depto,description)
 values ('Gerencia','Director de la empresa');
 insert into employee_departament(name_depto,description)
 values ('Produccion','Diseña y planea la produccion');
 insert into employee_departament(name_depto,description)
 values ('Desarrollo','lleva a cabo la idea planteada en produccion');

insert into employee (first_name,last_name,id_departament)
 values ('Alejandro','Ramirez','1');
insert into employee (first_name,last_name,id_departament)
 values ('Daniel', 'Galvan','2');
insert into employee (first_name,last_name,id_departament)
 values ('Alan','Guzman','3');
insert into employee (first_name,last_name,id_departament)
 values ('Sergio','Tostado','4');

select * from employee
select * from employee_departament

 select e.first_name, ep.name_depto
from employee as e
join employee_departament as ep
on e.id_departament=ep.id_dep
order by id_em;


-- alter table employee
--  drop constraint FK_employee_id_departament;

-- sql2: Utilizando la misma base de datos. Parte 2
-- Crea una tabla llamada "employee_hobby" con los campos "id", "name", "description". 

create table employee_hobby(
  id_h serial,
  name_h varchar(30) not null,
  description_h varchar(100) not null,
  primary key (id_h)
 );

-- Haz los cambios necesarios en la base de datos para poder asignar a los empleados sus pasatiempos.

create table emplo_hobby(
  id_em_ho serial,
  id_emp  smallint references employee(id_em),
  id_hobby smallint references employee_hobby(id_h)
)

-- Inserta 3 pasatiempos y asígnale a todos los empleados al menos 2 pasatiempos. 
insert into employee_hobby(name_h,description_h)
values('Leer','Lecturas acerca de.........');
insert into employee_hobby(name_h,description_h)
values('Nadar','Ayuda a reelajarse despues de un dia intenso');
insert into employee_hobby(name_h,description_h)
values('Dibujar','Ayuda a liberar la imaginacion');

-- Se asigna a los empleados los diferentes hobbys
insert into emplo_hobby(id_emp,id_hobby)
values ('1','1');
insert into emplo_hobby(id_emp,id_hobby)
values ('1','2');
insert into emplo_hobby(id_emp,id_hobby)
values ('2','1');
insert into emplo_hobby(id_emp,id_hobby)
values ('2','3');
insert into emplo_hobby(id_emp,id_hobby)
values ('3','2');
insert into emplo_hobby(id_emp,id_hobby)
values ('3','3');
insert into emplo_hobby(id_emp,id_hobby)
values ('4','3');
insert into emplo_hobby(id_emp,id_hobby)
values ('4','2');

select * from emplo_hobby
-- Reglas: 
-- Un empleado puede tener muchos pasatiempos. Y muchos pasatiempos pueden pertenecer a muchos empleados. 
-- Haz cumplir las reglas de normalización de tablas y reglas de base de datos


select e.first_name, emh.name_h
from employee as e
join emplo_hobby as eh
  on e.id_em=eh.id_emp
  join employee_hobby as emh 
  on emh.id_h=eh.id_hobby
  order by id_em ;
  

--sql3: Haz los cambios necesarios en la base de datos para poder 
--asignar a los empleados un jefe.
--Inserta a cada empleado un jefe. 
--Reglas: 
--Un jefe, es también un empleado. 
--Un empleado solo puede tener un jefe. --
--Y un jefe puede tener muchos empleados. 
--Haz cumplir las reglas de normalización de tablas y reglas de base de datos.

--Agregar campo jefe a la tabla employee

alter table employee
  add jefe smallint;

-- Se grega una restriccion FK dentro de la misma tabla
 alter table employee
  add constraint FK_employee_jefe
  foreign key (jefe)
  references employee (id_em);

--Se agrega una restriccion check
alter table employee
 add constraint CK_id_dif_jefe
 check (id_em<>jefe) 

 --Se agrega jefes a los empleados
 update employee set jefe='3'
  where id_em='1';

   update employee set jefe='3'
  where id_em='2';

   update employee set jefe='1'
  where id_em='3';

   update employee set jefe='1'
  where id_em='4';
  
  select * from employee

