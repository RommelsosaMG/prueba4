
--OBTENER COTIZACION CON EL NUMERO CIP--
SELECT   PP.NIDREFERENCE ,  PP.SOPERATIONNUMBER AS "NUMEROCIP",CH.NID_PROC ,CH.NID_COTIZACION FROM PV_PROCESS_PAYMENT PP  INNER JOIN TBL_PD_COTIZA_HIS CH ON  PP.NIDREFERENCE = CH.NID_PROC WHERE PP.SOPERATIONNUMBER =1254170;
SELECT   PP.NIDREFERENCE ,  PP.SOPERATIONNUMBER AS "NUMEROCIP",CH.NID_PROC ,CH.NID_COTIZACION FROM PV_PROCESS_PAYMENT PP  INNER JOIN TBL_PD_COTIZA_HIS CH ON  PP.NIDREFERENCE = CH.NID_PROC WHERE CH.NID_COTIZACION ='';


--DE MANERA SEPARADA INSERTAR EL NUMERO CIP
--select * from PV_PROCESS_PAYMENT where SOPERATIONNUMBER = '1254170' -- obtener nidreference
--CONSULTA CON EL NIDREFENTECE EN LA TABLA COTIZA
--select * from TBL_PD_COTIZA_HIS where NID_PROC = '00009050TvhJKCdX20230526143419' -- obtener nro cotizacion