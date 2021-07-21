CLASS ycl_validate_roman DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : constructor IMPORTING i_value TYPE i,
      validate_input RETURNING VALUE(r_result) TYPE abap_bool,
      split,
      get_subvalue IMPORTING i_position TYPE i RETURNING VALUE(r_value) TYPE i,
      get_units RETURNING VALUE(r_value) TYPE i,
      get_tens RETURNING VALUE(r_value) TYPE i,
      get_hundreds RETURNING VALUE(r_value) TYPE i,
      get_thousands RETURNING VALUE(r_value) TYPE i,
      concatenate IMPORTING i_str1          TYPE string
                            i_str2          TYPE string
                            i_str3          TYPE string
                            i_str4          TYPE string
                  RETURNING VALUE(r_result) TYPE string,
      get_roman_representation RETURNING VALUE(r_result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : m_value            TYPE i,
           m_number_units     TYPE REF TO ycl_number_units,
           m_number_tens      TYPE REF TO ycl_number_tens,
           m_number_hundreds  TYPE REF TO ycl_number_hundreds,
           m_number_thousands TYPE REF TO ycl_number_thousands.
ENDCLASS.



CLASS ycl_validate_roman IMPLEMENTATION.
  METHOD concatenate.
    CONCATENATE i_str1 i_str2 i_str3 i_str4 INTO r_result.
    CONDENSE r_result NO-GAPS.
  ENDMETHOD.

  METHOD constructor.
    m_value = i_value.
  ENDMETHOD.

  METHOD split.

    m_number_units = NEW #( get_units( ) ).
    m_number_tens = NEW #( get_tens( ) ).
    m_number_hundreds = NEW #( get_hundreds( ) ).
    m_number_thousands = NEW #( get_thousands( ) ).

  ENDMETHOD.

  METHOD validate_input.

    IF m_value >= 1 AND m_value <= 3000.
      r_result = abap_true.
    ELSE.
      r_result = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD get_subvalue.
    DATA lv_value_str TYPE numc4.

    lv_value_str = m_value.
    CONDENSE lv_value_str NO-GAPS.

    DATA(lv_len) = strlen( lv_value_str ).

    CHECK lv_len >= i_position.
    DATA(lv_substring) = substring( val = lv_value_str off = lv_len - i_position len = 1 ).
    r_value = lv_substring.
  ENDMETHOD.

  METHOD get_units.
    r_value = get_subvalue( 1 ).
  ENDMETHOD.

  METHOD get_tens.
    r_value = get_subvalue( 2 ).
  ENDMETHOD.

  METHOD get_hundreds.
    r_value = get_subvalue( 3 ).
  ENDMETHOD.

  METHOD get_thousands.
    r_value = get_subvalue( 4 ).
  ENDMETHOD.

  METHOD get_roman_representation.

    split( ).

    concatenate(
      EXPORTING
        i_str1   = m_number_thousands->get_roman_representation(  )
        i_str2   = m_number_hundreds->get_roman_representation(  )
        i_str3   = m_number_tens->get_roman_representation(  )
        i_str4   = m_number_units->get_roman_representation(  )
      RECEIVING
        r_result = r_result
    ).

  ENDMETHOD.



ENDCLASS.
