CLASS ycl_beers_nme DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS :
        constructor IMPORTING i_nb_beer  TYPE numc2,
        decrease_1_beer,
        get_nb_beers RETURNING VALUE(r_nb_beers) TYPE string,
        set_init_beers,
        get_init_beers RETURNING VALUE(r_nb_beers) TYPE i.


  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA :
           gv_actual_nb_beers TYPE numc2,
           gv_init_nb_beers TYPE numc2.
ENDCLASS.



CLASS ycl_beers_nme IMPLEMENTATION.


  METHOD constructor.
    gv_init_nb_beers = i_nb_beer.
    gv_actual_nb_beers = i_nb_beer.
  ENDMETHOD.

  METHOD decrease_1_beer.
    CHECK gv_actual_nb_beers IS NOT INITIAL.
    SUBTRACT 1 FROM gv_actual_nb_beers.
  ENDMETHOD.

  METHOD get_init_beers.
    r_nb_beers = gv_init_nb_beers.
  ENDMETHOD.

  METHOD get_nb_beers.
    CASE gv_actual_nb_beers.
      WHEN 0.
        r_nb_beers = 'no more bottles'.
      WHEN 1.
        r_nb_beers = '1 bottle'.
      WHEN OTHERS.
        r_nb_beers = gv_actual_nb_beers && ` ` && `bottles`.
        SHIFT r_nb_beers LEFT DELETING LEADING '0'.
    ENDCASE.

  ENDMETHOD.

  METHOD set_init_beers.
    gv_actual_nb_beers = gv_init_nb_beers.
  ENDMETHOD.

ENDCLASS.
