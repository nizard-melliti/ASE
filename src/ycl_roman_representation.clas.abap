CLASS ycl_roman_representation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : constructor IMPORTING i_value TYPE i,
      to_roman RETURNING VALUE(r_result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : m_value TYPE i.
ENDCLASS.



CLASS ycl_roman_representation IMPLEMENTATION.

  METHOD constructor.
    m_value = i_value.
  ENDMETHOD.

  METHOD to_roman.

    DATA(lo_validate_roman) = NEW ycl_validate_roman( m_value ).
    IF lo_validate_roman->validate_input( ) .
      r_result = lo_validate_roman->get_roman_representation(  ).
    ELSE.
      r_result = 'Input not valid'.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
