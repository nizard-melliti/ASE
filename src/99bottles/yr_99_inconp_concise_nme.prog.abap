*&---------------------------------------------------------------------*
*& Report yr_99_inconp_concise_nme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr_99_inconp_concise_nme.


CLASS lcl_99bottles DEFINITION.

  PUBLIC SECTION.
    TYPES : tty_int TYPE STANDARD TABLE OF i WITH DEFAULT KEY.
    CLASS-METHODS : downto IMPORTING max               TYPE i
                                     min               TYPE i
                           RETURNING VALUE(rt_integer) TYPE tty_int.
    METHODS :
      song RETURNING VALUE(r_verses) TYPE string,
      verses IMPORTING hi              TYPE i
                       lo              TYPE i
             RETURNING VALUE(r_verses) TYPE string,
      verse IMPORTING n              TYPE i
            RETURNING VALUE(r_verse) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS lcl_99bottles IMPLEMENTATION.
  METHOD song.
    r_verses = verses(
                 hi = 99
                 lo = 0
               ).
  ENDMETHOD.

  METHOD verse.

  ENDMETHOD.

  METHOD verses.

  ENDMETHOD.

  METHOD downto.



  ENDMETHOD.

ENDCLASS.

CLASS lcl_application DEFINITION.

  PUBLIC SECTION.
    CLASS-METHODS main.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_application IMPLEMENTATION.

  METHOD main.
    cl_demo_output=>display( NEW lcl_99bottles( )->song( ) ).
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  lcl_application=>main( ).
