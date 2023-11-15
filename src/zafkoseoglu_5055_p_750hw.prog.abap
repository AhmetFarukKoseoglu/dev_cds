*&---------------------------------------------------------------------*
*& Report ZAFKOSEOGLU_5055_P_750HW
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zafkoseoglu_5055_p_750hw.

TYPES :BEGIN OF ty_first,
         werks TYPE werks_d,
         arbpl TYPE arbpl,
         total TYPE menge_d,
         meins TYPE meins,
         islem TYPE int8,
       END OF ty_first.

TYPES : tt_first TYPE TABLE OF ty_first WITH EMPTY KEY.

DATA(lt_first) = VALUE tt_first(
  ( werks = '2013' arbpl = '07' total = '16'   meins = '' )
  ( werks = '2013' arbpl = '07' total = '32'   meins = '' )
  ( werks = '2015' arbpl = '09' total = '07'   meins = '' ) ).

DATA : lt_second TYPE tt_first.

lt_second       = VALUE #( FOR GROUPS ls_grup OF <ls_first> IN lt_first GROUP BY ( werks = <ls_first>-werks
                                                                                    arbpl = <ls_first>-arbpl )
                ( VALUE #( arbpl  = ls_grup-arbpl
                           werks  = ls_grup-werks
                           total = REDUCE netwr( INIT val TYPE menge_d
                                                   FOR ls_first  IN GROUP ls_grup
                                                   NEXT val = val + ls_first-total ) ) ) ) .

DATA(lt_third) = VALUE tt_first( FOR ls_first IN lt_second LET lv_meins = 'ADT'
                                                                lv_no1 = 5
                                                                lv_no2 = 3 IN ( meins  = lv_meins
                                                                                    werks  = ls_first-werks
                                                                                    arbpl  = ls_first-arbpl
                                                                                    total = ls_first-total
                                                                                    islem  = lv_no1 * lv_no2  ) ).
cl_demo_output=>display( lt_third ).
