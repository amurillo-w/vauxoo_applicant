
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
