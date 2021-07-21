CLASS ycl_number_thousands DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : constructor IMPORTING i_value TYPE i,
      get_roman_representation RETURNING VALUE(r_result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : m_value TYPE i.
ENDCLASS.



CLASS ycl_number_thousands IMPLEMENTATION.
  METHOD constructor.
    m_value = i_value.
  ENDMETHOD.

  METHOD get_roman_representation.

    CASE m_value.
      WHEN '1' OR  '2' OR '3'.
        DO m_value TIMES.
          CONCATENATE 'M' r_result INTO r_result.
        ENDDO.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
