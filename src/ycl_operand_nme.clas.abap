CLASS ycl_operand_nme DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS :
      constructor IMPORTING i_value TYPE i,
      get_value RETURNING VALUE(r_value) TYPE i,
      set_value IMPORTING i_value TYPE i,
      divide IMPORTING i_value TYPE i,
      multiply IMPORTING i_value TYPE i,
      is_even RETURNING VALUE(r_bool) TYPE bool,
      is_odd RETURNING VALUE(r_bool) TYPE bool,
      is_not_1 RETURNING VALUE(r_bool) TYPE bool.
PROTECTED SECTION.
  PRIVATE SECTION.
    DATA value TYPE i.
  ENDCLASS.



CLASS ycl_operand_nme IMPLEMENTATION.
  METHOD constructor.
    value = i_value.
  ENDMETHOD.

  METHOD divide.
    DATA lv_value_f TYPE f.
    lv_value_f = value.
    value = floor( lv_value_f / i_value ).
  ENDMETHOD.

  METHOD get_value.
    r_value = value.
  ENDMETHOD.

  METHOD is_even.
    r_bool = abap_false.
    IF value MOD 2 EQ 0.
        r_bool = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD is_odd.
    r_bool = abap_false.
    IF value MOD 2 NE 0.
        r_bool = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD multiply.
    MULTIPLY value BY i_value.
  ENDMETHOD.

  METHOD set_value.
    value = i_value.
  ENDMETHOD.

  METHOD is_not_1.
    r_bool = abap_false.
    IF value <> 1.
        r_bool = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
