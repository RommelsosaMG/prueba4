---Query para Autorizar un Pago Efectivo:

select * from TBL_PD_cliente_prueba

--- 1.buscar código CIP

SELECT * FROM PV_PROCESS_PAYMENT WHERE SOPERATIONNUMBER = '1254170';

--- 2. tomar de la primera consulta el NIDREFERENCE y NIDPAYMENT // actualizar el nstatus
UPDATE PV_PROCESS_PAYMENT SET NSTATUS = 1 WHERE NIDPAYMENT= 4269974 AND NIDREFERENCE= '0000268616Zg30DU20220610130748' AND NSTATUS= 0 ;

--- 3. tomar de la primera consulta el NIDAUTHORIZATION y actualizar el estado a 23(pagado)

UPDATE PV_AUTHORIZATION
SET NCIP_STATUS  = 23 --AUTORIZADO  
WHERE NIDAUTHORIZATION='100161'

select SPAYMENT_TYPE,NUSER_ID,SUSER_FIRSTNAME,SUSER_LASTNAME,SUSER_EMAIL,SCURRENCY_ID,SCURRENCY_ID,NTOTAL,STRANSACTION_CODE,DCIP_EXPIRATION_DATE,SSTATUS_RESPONSE,SMESSAGE_RESPONSE,SOPERATION_STATUS,SCIP_ID,SCIP_ID,NCLIENT_ID,NCIP_STATUS,SCIP_NUMBER,NIDPROCESS,SFLOW_ID,NPAYROLL_ID,DCOMPDATE,DCREATED,NBRANCH,NPRODUCT from  PV_AUTHORIZATION where NIDAUTHORIZATION='99128'
select * from  PV_AUTHORIZATION where NIDAUTHORIZATION='100161'


--si deseas cambiar a estado expirado (21) solo ejecutar el query 3.
---*(el estado 22 es pendiente)
--recordar ejecutar el commit para guardar los resultados**

--si deseas cambiar a estado expirado (21) solo ejecutar el query 3.
SELECT * FROM PV_PROCESS_PAYMENT WHERE SOPERATIONNUMBER = '2654431';
SET NCIP_STATUS   = 21 --AUTORIZADO  
WHERE NIDAUTHORIZATION='97942'

---posterior consultar la tabla  FROM PV_PROCESS_PAYMENT y visualizar que los campos nstatus y nstatureg sean igual a
--- nstatus : 0(anulado) 1(autorizado) 2 (procesado) 3(anulado)
--- nestatusreg : 0(anulado) 1(procesado) 3(anulado)


-- PARA HALLAR EL NUMERO DE POLIZA ASOCIADO  BUSCAR CON EL NBILLNUM


 select
        nreceipt,

        sclient,
        ncertif,
        npolicy,
        nstatus_pre,
        dcompdate,
        dissuedat,
        deffecdate,
        dexpirdat,
        nbalance,
        ncomamou,
        nparticip,
        npremium,
        npremiuml,
        npremiumn,
        sbilltype,
        nbillnum,
        ncurrency,
        dnulldate
   from premium
  where NBILLNUM = 21803 AND NBRANCH=73 ;

  --- para hallar la póliza con el numero de recibo
   select
        nreceipt,
        NBILLNUM
        sclient,
        ncertif,
        npolicy,
        nstatus_pre,
        dcompdate,
        dissuedat,
        deffecdate,
        dexpirdat,
        nbalance,
        ncomamou,
        ninsur_area
        nparticip,
        npremium,
        npremiuml,
        npremiumn,
        sbilltype,
        nbillnum,
        ncurrency,
        dnulldate
   from premium
  where   nreceipt=    ;






---Query para Pagar deuda de un cliente:  Donde nbillstat=  '2' anulado, '3' pendiente ,'4' pagado, '5' aplicado
--- no olvidar de anteponer las cifras 010 ---- 01010716088109
UPDATE bills SET nbillstat='4' WHERE nbillstat='3' and sclient='01010434622200'


--- buscar el estado de la deuda con numero de cliente , estado y fecha

select * from  bills where sclient='01010434622200' and  nbillstat='3'
--and TRUNC(DVALDATE)='28-04-2022'

select * from bills where NBILLNUM =22882 AND  NINSUR_AREA=1 AND SBILLTYPE=5  AND  sclient='01020547825781'

select * from  bills where sclient='01020547825781'



---ingresar el numero de cip :)
--este mostrará un numero de poliza

SELECT PE.NPOLICY
FROM PV_PROCESS_EMISION PE
INNER JOIN PV_AUTHORIZATION PA ON PA.NIDPROCESS = PE.NIDPROCESS
WHERE PA.SCIP_ID IN ('2675059');