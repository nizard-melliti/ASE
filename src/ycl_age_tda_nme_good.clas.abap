CLASS ycl_age_tda_nme_good DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : set_age IMPORTING i_age TYPE i,
      get_age RETURNING VALUE(r_age) TYPE i,
      is_adult RETURNING VALUE(r_bool) TYPE bool.
PROTECTED SECTION.
  PRIVATE SECTION.
  DATA : age TYPE i.
ENDCLASS.



CLASS ycl_age_tda_nme_good IMPLEMENTATION.
  METHOD get_age.
    r_age = age.
  ENDMETHOD.

  METHOD set_age.
    age = i_age.
  ENDMETHOD.

  METHOD is_adult.
    r_bool = abap_false.
    IF age >= 18.
      r_bool = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
