--para que se desactive la facturacion , actualizar la fecha a una posterior a la actual en el sistema--

--------------------consulta-----------------------------------
SELECT * FROM TBL_PD_MONTH_BILLS_LOG WHERE DNULLDATE IS NULL ORDER BY 1;


----------- Proceso de facturación anticipada--------------------

select * from TBL_ACCOUNTING_CLOSING_DATES WHERE NBRANCH=73