*&---------------------------------------------------------------------*
*& Report ZAFKOSEOGLU_5055_P_OOPHW
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zafkoseoglu_5055_p_oophw.

PARAMETERS : p_d1 TYPE zafkoseoglu_5055_7_2_dec,
             p_d2 TYPE zafkoseoglu_5055_7_2_dec,
             p_d3 TYPE zafkoseoglu_5055_7_2_dec,
             p_d4 TYPE zafkoseoglu_5055_7_2_dec.

DATA : lo_test1_1  TYPE REF TO zcl_afkoseoglu_5055_cl1,
       lo_test1_2  TYPE REF TO zcl_afkoseoglu_5055_cl1,
       lo_test2    TYPE REF TO zcl_afkoseoglu_5055_cl2,
       lv_result_1 TYPE zafkoseoglu_5055_7_2_dec,
       lv_result_2 TYPE zafkoseoglu_5055_7_2_dec,
       lv_return_1 TYPE zafkoseoglu_5055_7_2_dec,
       lv_return_2 TYPE zafkoseoglu_5055_7_2_dec.

CREATE OBJECT: lo_test1_1.
CREATE OBJECT: lo_test1_2.
CREATE OBJECT: lo_test2.

lo_test1_1->zafkoseoglu_5055_if1~toplama(
    EXPORTING
      iv_num1   = p_d1
      iv_num2   = p_d2
    IMPORTING
      ev_total = lv_result_1
  ).

lo_test1_1->zafkoseoglu_5055_if2~cikarma(
  EXPORTING
    iv_num1   = p_d1
    iv_num2   = p_d2
  RECEIVING
    rv_result = lv_return_1
).

lo_test1_2->zafkoseoglu_5055_if1~toplama(
  EXPORTING
    iv_num1   = p_d3
    iv_num2   = p_d4
  IMPORTING
    ev_total = lv_result_2
).

lo_test1_2->zafkoseoglu_5055_if2~cikarma(
  EXPORTING
    iv_num1   = p_d3
    iv_num2   = p_d4
  RECEIVING
    rv_result = lv_return_2
).

lo_test2->call(
  EXPORTING
    iv_num1   = p_d3
    iv_num2   = p_d4
  IMPORTING
    ev_result = lv_return_2
    EXCEPTIONS
      OTHERS     = 1
).

WRITE : / lo_test1_1->zafkoseoglu_5055_if1~ins_val ,"'-',
          p_d1,
          p_d2,
          p_d3,
          p_d4,
          "
          lv_result_1,
          lv_return_2,
          lo_test2->error.
