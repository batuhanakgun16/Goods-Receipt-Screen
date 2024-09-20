*&---------------------------------------------------------------------*
*& Report Z_MAL_GIRIS_PRG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_MAL_GIRIS_PRG.

TABLES: zbk_mal_giris.

DATA: p_mal_id TYPE zbk_mal_giris-mal_id,
      p_mal_isim TYPE zbk_mal_giris-mal_isim,
      p_mal_miktar TYPE  zbk_mal_giris-mal_miktar.

START-OF-SELECTION.
  CALL SCREEN 100.
MODULE pbo_100 OUTPUT.
  " Ekranın varsayılan ayarları buraya yapılabilir.
ENDMODULE.

FORM kaydet_mal_verisi.
  DATA: wa_mal_giris TYPE zbk_mal_giris.

  wa_mal_giris-mal_id = p_mal_id.
  wa_mal_giris-mal_isim = p_mal_isim.
  wa_mal_giris-mal_miktar = p_mal_miktar.

  INSERT INTO zbk_mal_giris VALUES wa_mal_giris.

  IF sy-subrc = 0.
    MESSAGE 'Veri başarıyla kaydedildi' TYPE 'S'.
  ELSE.
    MESSAGE 'Veri kaydedilemedi' TYPE 'E'.
  ENDIF.
ENDFORM.

FORM display_salv.
  DATA: lt_mal_giris TYPE TABLE OF zbk_mal_giris,
        lo_salv TYPE REF TO cl_salv_table,
        lo_columns TYPE REF TO cl_salv_columns_table,
        lo_column TYPE REF TO cl_salv_column.


  SELECT * FROM zbk_mal_giris INTO TABLE lt_mal_giris.



        cl_salv_table=>factory(
          IMPORTING r_salv_table = lo_salv
          CHANGING  t_table      = lt_mal_giris ).


        lo_columns = lo_salv->get_columns( ).




        lo_salv->display( ).

ENDFORM.




MODULE pai_200 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS '100'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
CASE sy-ucomm .
  WHEN '&BACK'.
SET SCREEN 0.
ENDCASE.
 CASE sy-ucomm.
    WHEN 'SAVE'.
      PERFORM kaydet_mal_verisi.
      CALL SCREEN 200.
    WHEN OTHERS.

  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  PAI_100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS '200'.
 PERFORM display_salv.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
CASE sy-ucomm.
  WHEN '&BACK'.
SET SCREEN 0.
ENDCASE.
ENDMODULE.