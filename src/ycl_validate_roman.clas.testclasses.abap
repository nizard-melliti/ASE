*"* use this source file for your ABAP unit test classes
CLASS ltcl_validate_roman DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA lo_validate_roman TYPE REF TO ycl_validate_roman.
    METHODS:
      setup,
      validate_input_true FOR TESTING RAISING cx_static_check,
      validate_input_false FOR TESTING RAISING cx_static_check,
      concatenate FOR TESTING RAISING cx_static_check,
      get_units FOR TESTING RAISING cx_static_check,
      get_tens FOR TESTING RAISING cx_static_check,
      get_hundreds FOR TESTING RAISING cx_static_check,
      get_thousands FOR TESTING RAISING cx_static_check,
      get_subvalue_1 FOR TESTING RAISING cx_static_check,
      get_subvalue_2 FOR TESTING RAISING cx_static_check,
      get_subvalue_3 FOR TESTING RAISING cx_static_check,
      get_subvalue_4 FOR TESTING RAISING cx_static_check,
      get_roman_representation FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_validate_roman IMPLEMENTATION.

  METHOD setup.
    lo_validate_roman = NEW #( 2013 ).
  ENDMETHOD.

  METHOD concatenate.

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->concatenate( i_str1 = 'MM'
                                                               i_str2 = ''
                                                               i_str3 = 'X'
                                                               i_str4 = 'III' )                            " Data object with current value
        exp                  = 'MMXIII'                             " Data object with expected type
    ).

  ENDMETHOD.



  METHOD validate_input_true.
    cl_abap_unit_assert=>assert_equals(
    EXPORTING
    act                  = lo_validate_roman->validate_input( )
    exp = abap_true
).
  ENDMETHOD.

  METHOD validate_input_false.

    FREE lo_validate_roman.
    lo_validate_roman = NEW #( 3001 ).
    cl_abap_unit_assert=>assert_equals(
    EXPORTING
    act                  = lo_validate_roman->validate_input( )
    exp = abap_false
).

  ENDMETHOD.

  METHOD get_units.

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->get_units( )                           " Data object with current value
        exp                  = 3                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_tens.

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->get_tens( ) " Data object with current value
        exp                  = 1                             " Data object with expected type
    ).
  ENDMETHOD.



  METHOD get_hundreds.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->get_hundreds( )                              " Data object with current value
        exp                  = 0                             " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_thousands.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->get_thousands(  ) " Data object with current value
        exp                  = 2                          " Data object with expected type
    ).
  ENDMETHOD.



  METHOD get_roman_representation.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->get_roman_representation(  ) " Data object with current value
        exp                  = 'MMXIII'                          " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_subvalue_1.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->get_subvalue( 1 ) " Data object with current value
        exp                  = 3                          " Data object with expected type
    ).
  ENDMETHOD.

  METHOD get_subvalue_2.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->get_subvalue( 2 ) " Data object with current value
        exp                  = 1                          " Data object with expected type
    ).
  ENDMETHOD.

    METHOD get_subvalue_3.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->get_subvalue( 3 ) " Data object with current value
        exp                  = 0                          " Data object with expected type
    ).
  ENDMETHOD.

    METHOD get_subvalue_4.
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_validate_roman->get_subvalue( 4 ) " Data object with current value
        exp                  = 2                          " Data object with expected type
    ).
  ENDMETHOD.
ENDCLASS.
