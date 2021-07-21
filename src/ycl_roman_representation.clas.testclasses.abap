*"* use this source file for your ABAP unit test classes
CLASS ltcl_roman_representation DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA : lo_roman_representation TYPE REF TO ycl_roman_representation.
    METHODS:
      acceptance_test FOR TESTING RAISING cx_static_check,
      single_arabic_to_single_roman FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_roman_representation IMPLEMENTATION.


  METHOD acceptance_test.

    lo_roman_representation = NEW #( 2013 ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  =   lo_roman_representation->to_roman( ) " Data object with current value
        exp                  =   'MMXIII'                           " Data object with expected type

    ).

  ENDMETHOD.

  METHOD single_arabic_to_single_roman.

    lo_roman_representation = NEW #( 1 ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  =   lo_roman_representation->to_roman( ) " Data object with current value
        exp                  =   'I'                           " Data object with expected type

    ).

  ENDMETHOD.


ENDCLASS.
