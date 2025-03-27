--CONSULTAS DE COMBINACION
--NOS PERMITEN MOSTRAR DATOS DE VARIAS TABLAS QUE
--DEBEN ESTAR RELACIONADAS ENTRE SI MEDIANTE ALGUNA CLAVE
--1) NECESITAMOS CAMPO/S RELACION ENTRE LAS TABLAS
--2) DEBEMOS PONER EL NOMBRE DE CADA TABLA Y CADA CAMPO EN LA CONSULTA
--SINTAXIS STANDARD ORACLE 1999 (EFICIENTE):
select TABLA1.CAMPO1, TABLA1.CAMPO2
, TABLA2.CAMPO1, TABLA2.CAMPO2
from TABLA1
inner join TABLA2
on TABLA1.CAMPO_RELACION = TABLA2.CAMPO_RELACION;

--MOSTRAR EL APELLIDO, EL OFICIO DE EMPLEADOS JUNTO A 
--SU NOMBRE DE DEPARTAMENTO Y LOCALIDAD
select EMP.APELLIDO, EMP.OFICIO
, DEPT.DNOMBRE, DEPT.LOC
from EMP
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--TENEMOS OTRA SINTAXIS PARA REALIZAR LOS JOIN
select EMP.APELLIDO, EMP.OFICIO
, DEPT.DNOMBRE, DEPT.LOC
from EMP, DEPT
where EMP.DEPT_NO = DEPT.DEPT_NO;

--PODEMOS REALIZAR, POR SUPUESTO NUESTROS WHERE
--QUEREMOS MOSTRAR LOS DATOS SOLO DE MADRID
select EMP.APELLIDO, EMP.OFICIO
, DEPT.DNOMBRE, DEPT.LOC
from EMP
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
where DEPT.LOC='MADRID';

--DESCRIBE DEPT;
--DESC EMP;
--NO ES OBLIGATORIO INCLUIR EL NOMBRE DE LA 
--TABLA ANTES DEL CAMPO A MOSTRAR EN EL SELECT (NO RECOMENDABLE)
select EMP.APELLIDO, OFICIO
, DEPT.DNOMBRE, LOC, EMP.DEPT_NO
from EMP
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--PODEMOS INCLUIR ALIAS A LOS NOMBRES DE LAS TABLAS
--PARA LLAMARLAS ASI A LO LARGO DE LA CONSULTA
--ES UTIL CUANDO TENEMOS TABLAS CON NOMBRE MUY LARGOS
--CUANDO PONEMOS ALIAS, LA TABLA SE LLAMARA ASI PARA TODA LA CONSULTA
select e.APELLIDO, e.OFICIO
, d.DNOMBRE, d.LOC
from EMP e
inner join DEPT d
on e.DEPT_NO = d.DEPT_NO order by d.LOC;

--TENEMOS MULTIPLES TIPOS DE JOIN EN LAS BASES DE DATOS
--inner: COMBINA LOS RESULTADOS DE LAS DOS TABLAS
--left: COMBINA LAS DOS TABLAS Y TAMBIEN LA TABLA IZQUIERDA
--right: COMBINA LAS DOS TABLA Y FUERZA LA TABLA DERECHA
--full: COMBINA LAS DOS TABLAS Y FUERZA LAS DOS TABLAS
--cross: PRODUCTO CARTESIANO, COMBINAR CADA DATO DE UNA TABLA CON LOS OTROS DATOS DE LA TABLA
select DISTINCT DEPT_NO from EMP;
select * from DEPT;

--TENEMOS UN DEPARTAMENTO: 40, PRODUCCION, GRANADA SIN EMPLEADOS
--VAMOS A CREAR UN NUEVO EMPLEADO QUE NO TENGA DEPARTAMENTO
--TENEMOS UN EMPLEADO SIN DEPARTAMENTO EN EL 50
--left: COMBINA LAS DOS TABLAS Y TAMBIEN LA TABLA IZQUIERDA
--LA TABLA DE LA IZQUIERDA ES ANTES DEL JOIN
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP
left join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--right: COMBINA LAS DOS TABLAS Y TAMBIEN LA TABLA DERECHA
--LA TABLA DE LA DERECHA ES DESPUES DEL JOIN
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP
right join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--full: COMBINA LAS DOS TABLAS Y TAMBIEN LOS DATOS QUE NO COMBINEN
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP
full join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--cross: PRODUCTO CARTESIANO.  NO LLEVA ON
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP
cross join DEPT;

--MOSTRAR LA MEDIA SALARIAL DE LOS DOCTORES POR HOSPITAL
select avg(SALARIO) as MEDIA, HOSPITAL_COD 
from DOCTOR
group by HOSPITAL_COD;

--MOSTRAR LA MEDIA SALARIAL DE LOS DOCTORES POR HOSPITAL, 
--MOSTRANDO EL NOMBRE DEL HOSPITAL
select avg(DOCTOR.SALARIO) as MEDIA, HOSPITAL.NOMBRE 
from DOCTOR
inner join HOSPITAL
on DOCTOR.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
group by HOSPITAL.NOMBRE;

--MOSTRAR EL NUMERO DE EMPLEADOS QUE EXISTEN POR CADA LOCALIDAD
select count(EMP.EMP_NO) as EMPLEADOS
, DEPT.LOC
from EMP
right join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.LOC;




























