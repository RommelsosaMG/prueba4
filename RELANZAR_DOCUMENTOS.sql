------Relanzar documentos------------------------------------
----- cambiar en el campo NENV_PRINT  el estado 7 al 0 , para relanzar los documentos // EN PRODUCCION EL ESTADO ES 1
select * from TBL_TRX_CARGA_DEFINITIVA WHERE NPOLICY='6000009787' AND NIDHEADERPROC=36048 FOR UPDATE;
