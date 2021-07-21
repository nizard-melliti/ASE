*&---------------------------------------------------------------------*
*& Report yr_to_roman_nme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr_to_roman_nme.

PARAMETERS p_val TYPE i.

CLASS lcl_application DEFINITION.

  PUBLIC SECTION.
    METHODS main.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_application IMPLEMENTATION.

  METHOD main.
    WRITE : NEW ycl_roman_representation( p_val )->to_roman(  ).
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  NEW lcl_application( )->main( ).
