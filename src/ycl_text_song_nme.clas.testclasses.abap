*"* use this source file for your ABAP unit test classes
class ltcl_text_song definition final for testing
  duration short
  risk level harmless.

  PRIVATE SECTION.
    DATA lo_text_song TYPE REF TO ycl_text_song_nme.
    METHODS:
      setup,
      check_add_text FOR TESTING RAISING cx_static_check,
      check_add_text2 FOR TESTING RAISING cx_static_check,
      check_text FOR TESTING RAISING cx_static_check.

  ENDCLASS.


class ltcl_text_song implementation.

  METHOD setup.
    lo_text_song = NEW ycl_text_song_nme( i_nb_beer = '3' ).
  ENDMETHOD.

  METHOD check_add_text.

    DATA : lt_text_song TYPE TABLE OF string,
           ls_text_song TYPE string.

    ls_text_song = '3 bottles of beer on the wall, 3 bottles of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Take one down and pass it around, 2 bottles of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = '2 bottles of beer on the wall, 2 bottles of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Take one down and pass it around, 1 bottle of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = '1 bottle of beer on the wall, 1 bottle of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Take one down and pass it around, no more bottles of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'No more bottles of beer on the wall, no more bottles of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Go to the store and buy some more, 3 bottles of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Test to add a line with parameter toto'.
    APPEND ls_text_song TO lt_text_song.


    lo_text_song->add_verse(
      EXPORTING
        i_verse     = 'Test to add a line with parameter &'
        i_parameter = 'toto'
    ).

    cl_abap_unit_assert=>assert_equals(
       EXPORTING
         act                  =  lo_text_song->get_text_song( )                            " Data object with current value
         exp                  =  lt_text_song
     ).

  ENDMETHOD.

  METHOD check_add_text2.

    DATA : lt_text_song TYPE TABLE OF string,
           ls_text_song TYPE string.

    ls_text_song = '3 bottles of beer on the wall, 3 bottles of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Take one down and pass it around, 2 bottles of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = '2 bottles of beer on the wall, 2 bottles of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Take one down and pass it around, 1 bottle of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = '1 bottle of beer on the wall, 1 bottle of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Take one down and pass it around, no more bottles of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'No more bottles of beer on the wall, no more bottles of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Go to the store and buy some more, 3 bottles of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Test to add a line with parameter 7'.
    APPEND ls_text_song TO lt_text_song.


    lo_text_song->add_verse(
      EXPORTING
        i_verse     = 'Test to add a line with parameter &'
        i_parameter = '7'
    ).

    cl_abap_unit_assert=>assert_equals(
       EXPORTING
         act                  =  lo_text_song->get_text_song( )                            " Data object with current value
         exp                  =  lt_text_song
     ).

  ENDMETHOD.

  METHOD check_text.

    DATA : lt_text_song TYPE TABLE OF string,
           ls_text_song TYPE string.

    ls_text_song = '3 bottles of beer on the wall, 3 bottles of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Take one down and pass it around, 2 bottles of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = '2 bottles of beer on the wall, 2 bottles of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Take one down and pass it around, 1 bottle of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = '1 bottle of beer on the wall, 1 bottle of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Take one down and pass it around, no more bottles of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'No more bottles of beer on the wall, no more bottles of beer.'.
    APPEND ls_text_song TO lt_text_song.
    ls_text_song = 'Go to the store and buy some more, 3 bottles of beer on the wall.'.
    APPEND ls_text_song TO lt_text_song.

    cl_abap_unit_assert=>assert_equals(
       EXPORTING
         act                  =  lo_text_song->get_text_song( )                            " Data object with current value
         exp                  =  lt_text_song
     ).

  ENDMETHOD.



endclass.
