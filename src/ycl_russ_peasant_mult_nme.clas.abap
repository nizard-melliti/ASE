CLASS ycl_russ_peasant_mult_nme DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  TYPES :
            tt_operand TYPE TABLE OF REF TO ycl_operand_nme.
    METHODS :
        multiply IMPORTING io_left TYPE REF TO ycl_operand_nme
                           io_right TYPE REF TO ycl_operand_nme
                 RETURNING VALUE(r_result) TYPE i,

        add_col_not_crossed_out IMPORTING it_value_left TYPE tt_operand
                                          it_value_right TYPE tt_operand
                 RETURNING VALUE(r_value) TYPE i.
PROTECTED SECTION.
PRIVATE SECTION.

ENDCLASS.



CLASS ycl_russ_peasant_mult_nme IMPLEMENTATION.

  METHOD multiply.

    DATA : lt_left   TYPE TABLE OF REF TO ycl_operand_nme,
           lt_right  TYPE TABLE OF REF TO ycl_operand_nme,
           lo_left   TYPE REF TO ycl_operand_nme,
           lo_left2  TYPE REF TO ycl_operand_nme,
           lo_right  TYPE REF TO ycl_operand_nme,
           lo_right2 TYPE REF TO ycl_operand_nme.


    lo_left = NEW ycl_operand_nme( io_left->get_value( ) ).
    lo_right = NEW ycl_operand_nme( io_right->get_value( ) ).

    APPEND io_left TO lt_left.
    APPEND io_right TO lt_right.

    WHILE lo_left->is_not_1( ).

      lo_left->divide( 2 ).
      lo_right->multiply( 2 ).

      lo_left2 = NEW ycl_operand_nme( lo_left->get_value( ) ).
      lo_right2 = NEW ycl_operand_nme( lo_right->get_value( ) ).

      APPEND lo_left2 TO lt_left.
      APPEND lo_right2 TO lt_right.

      FREE : lo_left2, lo_right2.
    ENDWHILE.

    r_result = add_col_not_crossed_out(
                 it_value_left  = lt_left
                 it_value_right = lt_right
               ).
  ENDMETHOD.

  METHOD add_col_not_crossed_out.

    DATA : lo_value_right TYPE REF TO ycl_operand_nme,
           lo_value_left  TYPE REF TO ycl_operand_nme.

    r_value = 0.
    LOOP AT it_value_right INTO lo_value_right.
      READ TABLE it_value_left INTO lo_value_left INDEX sy-tabix.
      IF sy-subrc = 0.
        IF lo_value_left->is_odd( ).
          DATA(lv_value) = lo_value_right->get_value( ).
          ADD lv_value TO r_value.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
