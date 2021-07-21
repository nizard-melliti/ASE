*"* use this source file for your ABAP unit test classes
CLASS ltcl_number_tens DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA lo_number_tens TYPE REF TO ycl_number_tens.
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


CLASS ltcl_number_tens IMPLEMENTATION.

  METHOD get_roman_representation_0.

    lo_number_tens = NEW #( 0 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = ''                             " Data object with expected type
    ).

  ENDMETHOD.

  METHOD get_roman_representation_1.
    lo_number_tens = NEW #( 1 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = 'X'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_2.
    lo_number_tens = NEW #( 2 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = 'XX'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_3.
    lo_number_tens = NEW #( 3 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = 'XXX'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_4.
    lo_number_tens = NEW #( 4 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = 'XL'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_5.
    lo_number_tens = NEW #( 5 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = 'L'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_6.
    lo_number_tens = NEW #( 6 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = 'LX'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_7.
    lo_number_tens = NEW #( 7 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = 'LXX'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_8.
    lo_number_tens = NEW #( 8 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = 'LXXX'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_9.
    lo_number_tens = NEW #( 9 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_tens->get_roman_representation(  )
        exp                  = 'XC'                             " Data object with expected type
    ).
  ENDMETHOD.

ENDCLASS.
