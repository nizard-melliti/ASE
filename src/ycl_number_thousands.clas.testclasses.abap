*"* use this source file for your ABAP unit test classes
CLASS ltcl_number_thousands DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA lo_number_thousands TYPE REF TO ycl_number_thousands.
    METHODS:
      get_roman_representation_0 FOR TESTING RAISING cx_static_check,
      get_roman_representation_1 FOR TESTING RAISING cx_static_check,
      get_roman_representation_2 FOR TESTING RAISING cx_static_check,
      get_roman_representation_3 FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_number_thousands IMPLEMENTATION.

  METHOD get_roman_representation_0.

    lo_number_thousands = NEW #( 0 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_thousands->get_roman_representation(  )
        exp                  = ''                             " Data object with expected type
    ).

  ENDMETHOD.

  METHOD get_roman_representation_1.
    lo_number_thousands = NEW #( 1 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_thousands->get_roman_representation(  )
        exp                  = 'M'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_2.
    lo_number_thousands = NEW #( 2 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_thousands->get_roman_representation(  )
        exp                  = 'MM'                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_roman_representation_3.
    lo_number_thousands = NEW #( 3 ).
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_number_thousands->get_roman_representation(  )
        exp                  = 'MMM'                             " Data object with expected type
    ).
  ENDMETHOD.


ENDCLASS.
