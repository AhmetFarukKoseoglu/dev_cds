interface ZAFKOSEOGLU_5055_IF2
  public .


  class-data STAT_VAL type D .

  class-methods CIKARMA
    importing
      !IV_NUM1 type ZAFKOSEOGLU_5055_7_2_DEC
      !IV_NUM2 type ZAFKOSEOGLU_5055_7_2_DEC
    returning
      value(RV_RESULT) type ZAFKOSEOGLU_5055_7_2_DEC .
endinterface.
