*&---------------------------------------------------------------------*
*& Report yr_wordwrap_nme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr_wordwrap_nme.

PARAMETERS : p_text  TYPE string,
             p_width TYPE i.


CLASS lcl_splitter DEFINITION.

  PUBLIC SECTION.
    TYPES : BEGIN OF ty_word,
              word   TYPE string,
              length TYPE i,
            END OF ty_word,
            tty_words TYPE STANDARD TABLE OF ty_word WITH DEFAULT KEY.
    METHODS :
      split_text_by_words IMPORTING i_text          TYPE string
                          RETURNING VALUE(rt_words) TYPE tty_words.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_splitter IMPLEMENTATION.

  METHOD split_text_by_words.

    DATA : lt_splitted_text TYPE string_table,
           ls_words         TYPE ty_word.

    SPLIT i_text AT space INTO TABLE lt_splitted_text.
    LOOP AT lt_splitted_text INTO DATA(ls_splitted_text).
      ls_words-word = ls_splitted_text.
      ls_words-length = strlen( ls_words-word ).
      APPEND ls_words TO rt_words.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.


CLASS lcl_combiner DEFINITION.

  PUBLIC SECTION.
    METHODS :
      combine_words IMPORTING it_words       TYPE lcl_splitter=>tty_words
                              i_width        TYPE i
                    RETURNING VALUE(rt_text) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_combiner IMPLEMENTATION.

  METHOD combine_words.

    DATA ls_text TYPE string.

    LOOP AT it_words INTO DATA(ls_word).
      IF ( strlen( ls_text ) + ls_word-length + 1 ) GT i_width.
        APPEND ls_text TO rt_text.
        ls_text = ls_word-word.
      ELSE.
        IF ls_text IS INITIAL.
          ls_text = ls_word-word.
        ELSE.
          CONCATENATE ls_text ls_word-word INTO ls_text SEPARATED BY space.
        ENDIF.
      ENDIF.
    ENDLOOP.
    IF ls_text IS NOT INITIAL.
      APPEND ls_text TO rt_text.
    ENDIF.
  ENDMETHOD.

ENDCLASS.


CLASS lcl_wrapper DEFINITION.

  PUBLIC SECTION.

    METHODS :
      constructor IMPORTING i_text  TYPE string
                            i_width TYPE i,
      wrap RETURNING VALUE(rt_text) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : text  TYPE string,
           width TYPE i.
ENDCLASS.

CLASS lcl_wrapper IMPLEMENTATION.

  METHOD constructor.
    text = i_text.
    width = i_width.
  ENDMETHOD.

  METHOD wrap.

    rt_text = NEW lcl_combiner(  )->combine_words(
                                            it_words = NEW lcl_splitter(  )->split_text_by_words( text )
                                            i_width = width ).
  ENDMETHOD.

ENDCLASS.


CLASS ltcl_wrapper DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      acceptance_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_wrapper IMPLEMENTATION.

  METHOD acceptance_test.

    DATA(lo_wrapper) = NEW lcl_wrapper( i_text = 'This is a long text we want to split' i_width = 10 ).
    DATA lt_text TYPE string_table.
    lt_text = VALUE #( ( CONV string( 'This is a' ) )
                         ( CONV string( 'long text' ) )
                         ( CONV string( 'we want to' ) )
                         ( CONV string( 'split' ) ) ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lo_wrapper->wrap(  )
        exp                  = lt_text
    ).
  ENDMETHOD.

ENDCLASS.


CLASS ltcl_splitter DEFINITION FINAL FOR TESTING
        DURATION SHORT
        RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    METHODS:
      splitter_test FOR TESTING.
ENDCLASS.


CLASS ltcl_splitter IMPLEMENTATION.
  METHOD splitter_test.

    DATA(lo_splitter) = NEW lcl_splitter( ).
    DATA(lt_result) = VALUE lcl_splitter=>tty_words(
                               ( word = CONV string( 'This' ) length = 4 )
                               ( word = CONV string( 'is' ) length = 2 )
                               ( word = CONV string( 'a' ) length = 1 )
                               ( word = CONV string( 'long' ) length = 4 )
                               ( word = CONV string( 'text' ) length = 4 )
                               ).

    cl_abap_unit_assert=>assert_equals(
   EXPORTING
     act                  = lo_splitter->split_text_by_words( i_text = 'This is a long text' )
     exp                  = lt_result
    ).
  ENDMETHOD.

ENDCLASS.

CLASS ltcl_combiner DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      combine_words_test FOR TESTING.
ENDCLASS.


CLASS ltcl_combiner IMPLEMENTATION.

  METHOD combine_words_test.
    DATA(lo_combiner) = NEW lcl_combiner( ).
    DATA(lt_words) = VALUE lcl_splitter=>tty_words(
                               ( word = CONV string( 'This' ) length = 4 )
                               ( word = CONV string( 'is' ) length = 2 )
                               ( word = CONV string( 'a' ) length = 1 )
                               ( word = CONV string( 'long' ) length = 4 )
                               ( word = CONV string( 'text' ) length = 4 )
                               ).
    DATA(lt_result) = VALUE string_table( ( CONV string( 'This is a' ) )
                                          ( CONV string( 'long text' ) ) ).

    cl_abap_unit_assert=>assert_equals(
   EXPORTING
     act                  = lo_combiner->combine_words( it_words = lt_words
                                                         i_width = 10 )
     exp                  = lt_result
    ).
  ENDMETHOD.

ENDCLASS.

CLASS lcl_application DEFINITION.

  PUBLIC SECTION.
    METHODS main.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_application IMPLEMENTATION.

  METHOD main.
    cl_demo_output=>display( NEW lcl_wrapper( i_text = p_text i_width = p_width )->wrap(  ) ).
  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  NEW lcl_application(  )->main(  ).
