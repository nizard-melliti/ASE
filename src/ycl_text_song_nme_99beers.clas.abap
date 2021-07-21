CLASS ycl_text_song_nme_99beers DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_text_song_nme_99beers IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lo_99beers_song) = NEW ycl_text_song_nme( '99' ).
    out->write(
      EXPORTING
        data   = lo_99beers_song->get_text_song( )
    ).
  ENDMETHOD.

ENDCLASS.
