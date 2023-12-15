class ZCL_AFKOSEOGLU_5055_CL1 definition
  public
  create public .

public section.

  interfaces ZAFKOSEOGLU_5055_IF1 .
  interfaces ZAFKOSEOGLU_5055_IF2 .

  data ERROR type STRING .
protected section.

  methods BOLME
    importing
      !IV_NUM1 type ZAFKOSEOGLU_5055_7_2_DEC
      !IV_NUM2 type ZAFKOSEOGLU_5055_7_2_DEC
    changing
      !CV_RESULT type ZAFKOSEOGLU_5055_7_2_DEC
    raising
      CX_SHM_BUILD_FAILED .
private section.
ENDCLASS.



CLASS ZCL_AFKOSEOGLU_5055_CL1 IMPLEMENTATION.


  METHOD bolme.
    DATA:  lv_exception          TYPE REF TO cx_root.

    TRY.
        cv_result = iv_num1 / iv_num2.
      CATCH cx_root INTO lv_exception.
        error = 'Bölme Hatası'.
        cv_result = 0.
*        RAISE EXCEPTION TYPE cx_shm_build_failed
*          EXPORTING
*            previous = lv_exception.
    ENDTRY.
  ENDMETHOD.


  METHOD zafkoseoglu_5055_if1~toplama.
    ev_total = iv_num1 + iv_num2.
    zafkoseoglu_5055_if1~ins_val = ev_total.
  ENDMETHOD.


  METHOD zafkoseoglu_5055_if2~cikarma.
    rv_result = iv_num1 - iv_num2.
    zafkoseoglu_5055_if2~stat_val = rv_result.
  ENDMETHOD.
ENDCLASS.
