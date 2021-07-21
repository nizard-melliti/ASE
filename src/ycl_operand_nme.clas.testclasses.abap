*"* use this source file for your ABAP unit test classes
class ltcl_operand definition final for testing
  duration short
  risk level harmless.

  PRIVATE SECTION.
    DATA lo_operand TYPE REF TO ycl_operand_nme.
    METHODS:
      setup,
      check_is_even FOR TESTING RAISING cx_static_check,
      check_is_odd FOR TESTING RAISING cx_static_check,
      check_divide FOR TESTING RAISING cx_static_check,
      check_multiply FOR TESTING RAISING cx_static_check,
      check_is_not_1 FOR TESTING RAISING cx_static_check,
      check_is_1 FOR TESTING RAISING cx_static_check.

  ENDCLASS.


class ltcl_operand implementation.

  METHOD setup.
    lo_operand = NEW ycl_operand_nme( 47 ).
  ENDMETHOD.

  METHOD check_is_even.

    cl_abap_unit_assert=>assert_equals(
   EXPORTING
     act                  =  lo_operand->is_even(  )
     exp                  =  abap_false
    ).

  ENDMETHOD.


  method check_is_odd.
    cl_abap_unit_assert=>assert_equals(
   EXPORTING
     act                  =  lo_operand->is_odd(  )
     exp                  =  abap_true
    ).
  endmethod.


  method check_divide.
    lo_operand->divide( 2 ).
        cl_abap_unit_assert=>assert_equals(
   EXPORTING
     act                  =  lo_operand->get_value(  )
     exp                  =  23
    ).
  endmethod.

  METHOD check_is_1.

    lo_operand->set_value( 1 ).
    cl_abap_unit_assert=>assert_equals(
EXPORTING
act                  =  lo_operand->is_not_1( )
exp                  =  abap_false
).
  ENDMETHOD.

  METHOD check_is_not_1.
    cl_abap_unit_assert=>assert_equals(
EXPORTING
act                  =  lo_operand->is_not_1( )
exp                  =  abap_true
).
  ENDMETHOD.

  method check_multiply.
        lo_operand->multiply( 2 ).
        cl_abap_unit_assert=>assert_equals(
   EXPORTING
     act                  =  lo_operand->get_value(  )
     exp                  =  94
    ).
  endmethod.

endclass.
