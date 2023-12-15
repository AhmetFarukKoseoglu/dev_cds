class ZCL_AFKOSEOGLU_5055_CL2 definition
  public
  inheriting from ZCL_AFKOSEOGLU_5055_CL1
  final
  create public .

public section.

  methods CALL
    importing
      !IV_NUM1 type ZAFKOSEOGLU_5055_7_2_DEC
      !IV_NUM2 type ZAFKOSEOGLU_5055_7_2_DEC
    exporting
      !EV_RESULT type ZAFKOSEOGLU_5055_7_2_DEC .
protected section.
private section.
ENDCLASS.



CLASS ZCL_AFKOSEOGLU_5055_CL2 IMPLEMENTATION.


  method CALL.
    bolme(
      EXPORTING
        iv_num1   = iv_num1                   " 7,2 Decimal
        iv_num2   = iv_num2                   " 7,2 Decimal
      CHANGING
        cv_result = ev_result                 " 7,2 Decimal
    ).
*    CATCH cx_shm_build_failed.
  endmethod.
ENDCLASS.
