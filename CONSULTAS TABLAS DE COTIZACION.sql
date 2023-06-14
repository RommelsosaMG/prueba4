------------------------------------------------------------------COTIZADOR DE TECNICA--------------------------------------------------------------------------------
select * from tbl_pd_log_auth where nid_cotizacion=25601 ;  ------------TABLA PARA VALIDAR LOS ENVIOS A TÉCNICA, VERIFICAR LA INFORMACIÓN DEL JSON EN CADA DERIVACIÓN Y APROBACIÓN Q SE ENVIE LA INFO CORRECTA
------------------------------------------------------------------TABLAS DE VALIDACIÓN -------------------------------------------------------------------------------

select * from tbl_pd_cotizacion_det where nid_cotizacion=47006  ; ----- VALIDA EL DETALLE DE COTIZACIÓN ANTES Y DESPUES DE LAS DERIVACIONES                                            ;
select * from tbl_pd_cot_transac_pre where nid_cotizacion=47006; -----ENCONTRAMOS EL NID_PROC Y EL SKEY DE LA TRANSACCION : SE VISUALIZAN LAS PRIMAS POR MES , PRIMAS + IGV POR MES , PRIMAS X FRECUENCIA DE PAGO , PRIMAS X FRECUENCIA DE PAGO + IGV Y ADEMAS UNA ESTIMACION POR UN AÑO DE LOS MONTOS
select * from tbl_pd_cotizacion_cab where nid_cotizacion=47006 ;--CON EN NÚMERO DE COTIZACION HALLA EL SCLIENT  Y RAMO : ESTADO DE LA COTIZACION DE LA TABLA TABLE802  Relanza  el slip en el campo 8 : n

select * from tbl_pd_cot_transac where nid_cotizacion=47006;--- UNA VEZ SE COMPLETE EL MOVIMIENTO VALIDAR LAS FECHAS , -ENCONTRAMOS EL NID_PROC Y EL SKEY DE LA TRANSACCION
select * from tbl_pd_cotiza_his where nid_cotizacion= 35219 ORDER BY NMOVEMENT ASC ;----VALIDA EL HSITORIAL ANTES Y DESPUES DE LAS DERIVACIONES

-----------------------------------------------------------------validar errores en las transacciones-------------------------------------------------------------------
SELECT * FROM batch_job WHERE skey ='T2023051004671211756' ;--- EN ESTA TABLA CONSULTAS POR EL SKEY , IGUAL OBTENIDO DEL COT TRANSAC, VERIFICA LA INFORMACION DEL CAMPO SCOMMAND
/*NSTATUS
 Estado de la ejecucion de este proceso. Los valores posibles de este campo son:
 0 - Deshabilitado
 1 - Habilitado para proceso
 2 - Enviado a proceso
 3 - En ejecucion
 4 - Termino anormal
 5 - Termino exitoso.
 */

-----------------------------------------------------------------------------Tabla de control de transacciones )---------------------------------------------------------------------------------------------------------------------------
select * from tbl_pd_log_transac WHERE skey ='T2022100736927101537';--- EN ESTA TABLA PUEDES VALIDAR SI SE LLEGA A PRESENTAR ALGUN ERROR EN LA TRANSACCION Y NO SE COMPLETO / CON EL SKEY DE LA TRANSACCION Q OBTIENES EN COT_TRANSAC


--Tabla de control de transacciones de polizas pendientes de Pago Adelantado tipo CIP (Pago Efectivo)--
SELECT * FROM TBL_PD_POLIZA_PREPAY T WHERE T.NID_PROC ='000090509RqKQq7420230516170117'

select * from tbl_pd_pre_mov_cab where NID_COTIZACION=47006 and npolicy=6000013437 -- en esta table se ve los certificados asociados a la polizas (emsion, inclusion,exclusiones) si se tiene el SKEY se puede mostrar los certificados segun el SKEY

