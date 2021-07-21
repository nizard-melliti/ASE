CLASS ycl_number_tens DEFINITION
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



CLASS ycl_number_tens IMPLEMENTATION.
  METHOD constructor.
    m_value = i_value.
  ENDMETHOD.

  METHOD get_roman_representation.

    CASE m_value.
      WHEN '1' OR  '2' OR '3'.
        DO m_value TIMES.
          CONCATENATE 'X' r_result INTO r_result.
        ENDDO.
      WHEN '4'.
        r_result = 'XL'.
      WHEN '5'.
        r_result = 'L'.
      WHEN '6' OR '7' OR '8'.
        DATA(lv_times) = m_value - 5.
        r_result = 'L'.
        DO lv_times TIMES.
          CONCATENATE r_result 'X' INTO r_result.
        ENDDO.
      WHEN '9'.
        r_result = 'XC'.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
