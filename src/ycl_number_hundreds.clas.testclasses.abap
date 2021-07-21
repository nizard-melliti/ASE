*"* use this source file for your ABAP unit test classes
CLASS ltcl_number_hundreds DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA lo_number_hundreds TYPE REF TO ycl_number_hundreds.
    METHODS:
      get_roman_representation_0 FOR TESTING RAISING cx_static_check,
      get_roman_representation_1 FOR TESTING RAISING cx_static_check,
      get_roman_representation_2 FOR TESTING RAISING cx_static_check,
      get_roman_representation_3 FOR TESTING RAISING cx_static_check,
      get_roman_representation_4 FOR TESTING RAISING cx_static_check,
      get_roman_representation_5 FOR TESTING RAISING cx_static_check,
      get_roman_representation_6 FOR TESTING RAISING cx_static_check,
      get_roman_representation_7 FOR TESTING RAISING cx_static_check,
      get_roman_representation_8 FOR TESTING RAISING cx_static_check,
      get_roman_representation_9 FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_number_hundreds IMPLEMENTATION.

  METHOD get_roman_representation_0.

    lo_number_hundreds = NEW #( 0 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = ''                             " Data object with expected type
    ).

  ENDMETHOD.

  METHOD get_roman_representation_1.
    lo_number_hundreds = NEW #( 1 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = 'C'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_2.
    lo_number_hundreds = NEW #( 2 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = 'CC'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_3.
    lo_number_hundreds = NEW #( 3 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = 'CCC'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_4.
    lo_number_hundreds = NEW #( 4 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = 'CD'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_5.
    lo_number_hundreds = NEW #( 5 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = 'D'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_6.
    lo_number_hundreds = NEW #( 6 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = 'DC'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_7.
    lo_number_hundreds = NEW #( 7 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = 'DCC'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_8.
    lo_number_hundreds = NEW #( 8 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = 'DCCC'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_9.
    lo_number_hundreds = NEW #( 9 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_hundreds->get_roman_representation(  )
        exp                  = 'CM'                             " Data object with expected type
    ).
  ENDMETHOD.

ENDCLASS.
