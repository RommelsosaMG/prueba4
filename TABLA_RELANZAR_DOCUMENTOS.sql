------Relanzar documentos------------------------------------
----- cambiar en el campo NENV_PRINT  el estado 7 al 0 , para relanzar los documentos // EN PRODUCCION EL ESTADO ES 1
select * from TBL_TRX_CARGA_DEFINITIVA WHERE NPOLICY='6000009787' AND NIDHEADERPROC=36048 FOR UPDATE;

update TBL_TRX_CARGA_DEFINITIVA set NENV_PRINT=0 where NPOLICY='63834'and nbranch=61

--SOLO QUIERO QUE SE VEA EN RAMO PRUEBAS PRUEBAS ROMMEL 2222