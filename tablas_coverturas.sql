


--consulta para obtener el código de la cobertura (ncovergen) según el numero de cobertura (NCOVER)

SELECT * FROM LIFE_COVER WHERE NBRANCH = 73 AND NPRODUCT = 1 AND NMODULEC = 22 AND NCOVERGEN IN (1099,1102);
SELECT * FROM LIFE_COVER WHERE NBRANCH = 73 AND NPRODUCT = 1 AND NMODULEC = 22 AND NCOVER  IN (6,8);


--Consulta para ver codigo de cobertura y su descripción

SELECT * FROM TAB_LIFCOV WHERE NCOVERGEN in (1099 ,1102);


--consulta de las tablas TAB_LIFCOV Y LIFE_COVER---

SELECT L.NBRANCH,    L.NCOVER,    L.NPRODUCT,    L.NMODULEC,    L.NCOVERGEN ,C.SDESCRIPT
FROM LIFE_COVER L INNER JOIN TAB_LIFCOV C ON L.NCOVERGEN = C.NCOVERGEN
--SELECCIONAR 73 : RAMO VL  y producto 1  NMODULECT el tipo de
WHERE L.NBRANCH = 73 AND L.NPRODUCT = 1 AND L.NMODULEC = 22 AND L.NCOVER in (
32,26) order by L.NCOVER  ASC


---En esta tabla se ve las Categorias  de los planes-----------------
select * from TBL_PD_PLAN_VL order by NTYPE_EMPLOYEE,SDESCRIPT asc


---------En esta tabla se ven los tipos de empleados para VL ---------
select * from  TBL_PD_TYPE_EMPLOYEE
