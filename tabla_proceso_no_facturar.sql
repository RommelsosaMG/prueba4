-----facturacion desactivar / activar------------------
--para que se desactive la facturacion , actualizar la fecha a una posterior a la actual en el sistema--
--NTYPE_BILLS_DACT : 1 CONTRATANTES PRIVADOS / 2 CONTRATANTES GOBIERNO

select * from tbl_pd_month_bills_log where DNULLDATE is  null

---for update order by 1;
