CLASS ycl_text_song_nme DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES :
              tt_string TYPE TABLE OF string WITH DEFAULT KEY.
    METHODS :
      constructor IMPORTING i_nb_beer  TYPE numc2,
      get_text_song RETURNING VALUE(rt_text_song) TYPE tt_string,
      add_verse IMPORTING i_verse     TYPE string
                          i_parameter TYPE string.

PROTECTED SECTION.
PRIVATE SECTION.
  CONSTANTS : gc_first_verse  TYPE string VALUE '& of beer on the wall, & of beer.',
              gc_second_verse TYPE string VALUE 'Take one down and pass it around, & of beer on the wall.',
              gc_last_verse   TYPE string VALUE 'Go to the store and buy some more, & of beer on the wall.'.
  DATA : gt_text_song TYPE tt_string,
         lo_beers     TYPE REF TO ycl_beers_nme.

ENDCLASS.


CLASS ycl_text_song_nme IMPLEMENTATION.

  METHOD constructor.

    DATA : lv_nb_beer   TYPE numc2,
           lv_parameter TYPE string.

    lo_beers = NEW ycl_beers_nme( i_nb_beer ).

    DO lo_beers->get_init_beers(  ) TIMES.

      lv_parameter = lo_beers->get_nb_beers(  ).

      add_verse(
        EXPORTING
          i_verse     = gc_first_verse
          i_parameter = lv_parameter
      ).

      lo_beers->decrease_1_beer(  ).

      lv_parameter = lo_beers->get_nb_beers(  ).
      add_verse(
        EXPORTING
          i_verse     = gc_second_verse
          i_parameter = lv_parameter
      ).
    ENDDO.

    lv_parameter = lo_beers->get_nb_beers(  ).
    add_verse(
      EXPORTING
        i_verse     = gc_first_verse
        i_parameter = lv_parameter
    ).

    lo_beers->set_init_beers(  ).

    lv_parameter = lo_beers->get_nb_beers(  ).

    add_verse(
     EXPORTING
       i_verse     = gc_last_verse
       i_parameter = lv_parameter
   ).

  ENDMETHOD.

  METHOD add_verse.

    DATA : lv_verse           TYPE string,
           lv_verse_char(125) TYPE c.

    lv_verse_char = i_verse.
    REPLACE ALL OCCURRENCES OF '&' IN lv_verse_char WITH i_parameter.
    lv_verse_char+0(1) = to_upper( lv_verse_char+0(1) ).
    lv_verse = lv_verse_char.
    APPEND lv_verse TO gt_text_song.

  ENDMETHOD.

  METHOD get_text_song.
    rt_text_song[] = gt_text_song[].
  ENDMETHOD.

ENDCLASS.
