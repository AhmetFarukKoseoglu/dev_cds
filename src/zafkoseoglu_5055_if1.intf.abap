interface ZAFKOSEOGLU_5055_IF1
  public .


  data INS_VAL type D .

  methods TOPLAMA
    importing
      !IV_NUM1 type ZAFKOSEOGLU_5055_7_2_DEC
      !IV_NUM2 type ZAFKOSEOGLU_5055_7_2_DEC
    exporting
      !EV_TOTAL type ZAFKOSEOGLU_5055_7_2_DEC .
endinterface.
