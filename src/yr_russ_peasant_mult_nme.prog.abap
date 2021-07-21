*&---------------------------------------------------------------------*
*& Report yr_russ_peasant_mult_nme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr_russ_peasant_mult_nme.


PARAMETERS :
    p_left TYPE i,
    p_right TYPE i.


START-OF-SELECTION.

DATA : lo_operand_left TYPE REF TO ycl_operand_nme,
       lo_operand_right TYPE REF TO ycl_operand_nme,
       lo_russ_peasant_mult TYPE REF TO ycl_russ_peasant_mult_nme,
       lv_result TYPE i.


    lo_operand_left = NEW ycl_operand_nme( p_left ).
    lo_operand_right = NEW ycl_operand_nme( p_right ).

    lo_russ_peasant_mult = NEW ycl_russ_peasant_mult_nme(  ).

    lo_russ_peasant_mult->multiply(
      EXPORTING
        io_left  = lo_operand_left
        io_right = lo_operand_right
      RECEIVING
        r_result = lv_result
    ).

    WRITE : lv_result.
