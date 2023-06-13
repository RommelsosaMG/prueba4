  EXIT WHEN C_CLIENT%NOTFOUND;
    IF L_NERR = 0 THEN
      L_SCLIENT := X.SCLIENT;

      DBMS_OUTPUT.put_line( '--SCLIENT: ' || X.SCLIENT );

      FOR Y IN C_POLIZAS LOOP
      EXIT WHEN C_POLIZAS%NOTFOUND;
        L_SCERTYPE := Y.SCERTYPE;
        L_NPRODUCT := Y.NPRODUCT;
        L_NPOLICY := Y.NPOLICY;

        DBMS_OUTPUT.put_line( '  POLIZA: ' || Y.NPOLICY );

        FOR Z IN C_RECIBOS LOOP
        EXIT WHEN C_RECIBOS%NOTFOUND;
          UPDATE BILLS B
             SET B.NBILLSTAT = 4
           WHERE B.NINSUR_AREA = Z.NINSUR_AREA
             AND B.SBILLTYPE = Z.SBILLTYPE
             AND B.NBILLNUM = Z.NBILLNUM;
          L_NVAL := SQL%ROWCOUNT;

          IF L_NVAL = 1 THEN
            DBMS_OUTPUT.put_line( '    RECIBO: ' || Z.NRECEIPT || ' | COMPROBANTE: ' || Z.NINSUR_AREA || ' -- ' || Z.SBILLTYPE || '-' || Z.NBILLNUM || ' | ESTADO: ' || Z.SDESCRIPT || ' -> Cobrado/Devuelto' );
          ELSIF L_NVAL = 0 THEN
            DBMS_OUTPUT.put_line( '    RECIBO: ' || Z.NRECEIPT || ' | COMPROBANTE: ' || Z.NINSUR_AREA || ' -- ' || Z.SBILLTYPE || '-' || Z.NBILLNUM || ' | ESTADO: ' || Z.SDESCRIPT || ' X Sin cambios' );
          ELSE
            DBMS_OUTPUT.put_line( '    RECIBO: ' || Z.NRECEIPT || ' | COMPROBANTE: ' || Z.NINSUR_AREA || ' -- ' || Z.SBILLTYPE || '-' || Z.NBILLNUM || ' | ESTADO: ' || ' -> Error: Se han actualizado mas de 2 recibos.' );
            L_NERR := 1;
            ROLLBACK;
            EXIT ;
          END IF;
        COMMIT;
        END LOOP;
      END LOOP;
    ELSE
      EXIT;
      END IF;
      COMMIT;
  END LOOP;
END;