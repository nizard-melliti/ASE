*"* use this source file for your ABAP unit test classes
CLASS ltcl_number_units DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA lo_number_units TYPE REF TO ycl_number_units.
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


CLASS ltcl_number_units IMPLEMENTATION.

  METHOD get_roman_representation_0.

    lo_number_units = NEW #( 0 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = ''                             " Data object with expected type
    ).

  ENDMETHOD.

  METHOD get_roman_representation_1.
    lo_number_units = NEW #( 1 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = 'I'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_2.
    lo_number_units = NEW #( 2 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = 'II'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_3.
    lo_number_units = NEW #( 3 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = 'III'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_4.
    lo_number_units = NEW #( 4 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = 'IV'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_5.
    lo_number_units = NEW #( 5 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = 'V'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_6.
    lo_number_units = NEW #( 6 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = 'VI'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_7.
    lo_number_units = NEW #( 7 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = 'VII'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_8.
    lo_number_units = NEW #( 8 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = 'VIII'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_9.
    lo_number_units = NEW #( 9 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_units->get_roman_representation(  )
        exp                  = 'IX'                             " Data object with expected type
    ).
  ENDMETHOD.

ENDCLASS.
