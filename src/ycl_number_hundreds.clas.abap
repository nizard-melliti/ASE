CLASS ycl_number_hundreds DEFINITION
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



CLASS ycl_number_hundreds IMPLEMENTATION.
  METHOD constructor.
    m_value = i_value.
  ENDMETHOD.

  METHOD get_roman_representation.

    CASE m_value.
      WHEN '1' OR  '2' OR '3'.
        DO m_value TIMES.
          CONCATENATE 'C' r_result INTO r_result.
        ENDDO.
      WHEN '4'.
        r_result = 'CD'.
      WHEN '5'.
        r_result = 'D'.
      WHEN '6' OR '7' OR '8'.
        DATA(lv_times) = m_value - 5.
        r_result = 'D'.
        DO lv_times TIMES.
          CONCATENATE r_result 'C' INTO r_result.
        ENDDO.
      WHEN '9'.
        r_result = 'CM'.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
