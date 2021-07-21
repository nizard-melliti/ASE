*"* use this source file for your ABAP unit test classes
class ltcl_russ_peasant_mult definition final for testing
  duration short
  risk level harmless.

  PRIVATE SECTION.
    DATA : lo_multiplication TYPE REF TO ycl_russ_peasant_mult_nme,
           lo_operand_left TYPE REF TO ycl_operand_nme,
           lo_operand_right TYPE REF TO ycl_operand_nme.
    METHODS:
      setup,
      check_add_col_not_crossed_out FOR TESTING RAISING cx_static_check,
      check_multiply FOR TESTING RAISING cx_static_check.

  ENDCLASS.


CLASS ltcl_russ_peasant_mult IMPLEMENTATION.

  METHOD setup.
    lo_operand_left = NEW ycl_operand_nme( 9 ).
    lo_operand_right = NEW ycl_operand_nme( 5 ).
    lo_multiplication = NEW ycl_russ_peasant_mult_nme(  ).
  ENDMETHOD.



  METHOD check_add_col_not_crossed_out.

    DATA :lt_left   TYPE TABLE OF REF TO ycl_operand_nme,
          lt_right  TYPE TABLE OF REF TO ycl_operand_nme,
          lv_result TYPE i.

    APPEND lo_operand_left TO lt_left.
    APPEND lo_operand_right TO lt_right.
    FREE : lo_operand_left, lo_operand_right.

    lo_operand_left = NEW ycl_operand_nme( 4 ).
    lo_operand_right = NEW ycl_operand_nme( 10 ).
    APPEND lo_operand_left TO lt_left.
    APPEND lo_operand_right TO lt_right.
    FREE : lo_operand_left, lo_operand_right.

    lo_operand_left = NEW ycl_operand_nme( 2 ).
    lo_operand_right = NEW ycl_operand_nme( 20 ).
    APPEND lo_operand_left TO lt_left.
    APPEND lo_operand_right TO lt_right.
    FREE : lo_operand_left, lo_operand_right.

    lo_operand_left = NEW ycl_operand_nme( 1 ).
    lo_operand_right = NEW ycl_operand_nme( 40 ).
    APPEND lo_operand_left TO lt_left.
    APPEND lo_operand_right TO lt_right.
    FREE : lo_operand_left, lo_operand_right.

    lo_multiplication->add_col_not_crossed_out(
      EXPORTING
        it_value_left  = lt_left
        it_value_right = lt_right
      RECEIVING
        r_value        = lv_result
    ).

    cl_abap_unit_assert=>assert_equals(
    EXPORTING
     act                  =   lv_result
     exp                  =  45
    ).

  ENDMETHOD.

  METHOD check_multiply.
    DATA lv_result TYPE i.
    lo_multiplication->multiply(
      EXPORTING
        io_left   = lo_operand_left
        io_right  = lo_operand_right
      RECEIVING
        r_result = lv_result
    ).

    cl_abap_unit_assert=>assert_equals(
    EXPORTING
     act                  =   lv_result
     exp                  =  45
    ).

  ENDMETHOD.

ENDCLASS.
