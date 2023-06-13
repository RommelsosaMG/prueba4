---hallar en numero de la cotizacion nid y viceversa

SELECT * FROM TBL_PD_CARGA_SCTR t where t.npolicy =6000009871;

---muestra a los asegurados que estan en la cotizacion y por movimiento

SELECT * FROM tbl_pd_cot_transac_pre where nid_cotizacion =33916


---muestra a los asegurados que estan en la cotizacion

select * from tbl_pd_pre_mov_cab where npolicy=6000013356

