
--agregar la cotizacion para obtener los valores :
SELECT T1.NID_COTIZACION, (SELECT SDESCRIPT FROM TBL_PD_TYPE_EMPLOYEE WHERE NTYPE_EMPLOYEE = NMODULEC) AS CATEGORIA,
           NTASA_CALCULADA, NPREMIUM_MENSUAL,NPRODUCT,NBRANCH,npolicy,
          CASE WHEN PV_REA_MOV_COTIZA_HIS(T1.NID_COTIZACION, 0, 'NPAYFREQ') = 5 THEN 1 *  NPREMIUM_MEN_AUT
                   WHEN PV_REA_MOV_COTIZA_HIS(T1.NID_COTIZACION, 0, 'NPAYFREQ') = 4 THEN 2 *  NPREMIUM_MEN_AUT
                   WHEN  PV_REA_MOV_COTIZA_HIS(T1.NID_COTIZACION, 0, 'NPAYFREQ') = 3 THEN 3 *  NPREMIUM_MEN_AUT
                   WHEN PV_REA_MOV_COTIZA_HIS(T1.NID_COTIZACION, 0, 'NPAYFREQ')= 2 THEN 6 *  NPREMIUM_MEN_AUT
                   WHEN PV_REA_MOV_COTIZA_HIS(T1.NID_COTIZACION, 0, 'NPAYFREQ') = 1 THEN 12 *  NPREMIUM_MEN_AUT
          END AS PRIMA_TOTAL, NMONTO_PLANILLA,
           (SELECT UPPER(SDESCRIPT) FROM TBL_PD_PLAN_VL WHERE NCODPLAN = (SELECT NIDPLAN FROM TBL_PD_COTIZACION_CAB WHERE NID_COTIZACION = T1.NID_COTIZACION) AND ROWNUM = 1) AS PLAN,
          (SELECT SDESCRIPT FROM TABLE36 WHERE NPAYFREQ =PV_REA_MOV_COTIZA_HIS(T1.NID_COTIZACION, 0, 'NPAYFREQ')) AS FRECUENCIA_PAGO,
          (SELECT SDESCRIPT FROM TABLE35 WHERE NTIP_RENOV = (SELECT NTIP_RENOV FROM TBL_PD_COTIZACION_CAB WHERE NID_COTIZACION = T1.NID_COTIZACION )) AS TIPO_RENOVACION
FROM TBL_PD_COTIZACION_DET T1
WHERE NID_COTIZACION IN
(
40222
)
AND DNULLDATE IS NULL
ORDER BY NID_COTIZACION, T1.NMODULEC

