CLASS ycl_age_tda_nme_bad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : set_age IMPORTING i_age TYPE i,
              get_age RETURNING VALUE(r_age) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA : age TYPE i.
ENDCLASS.



CLASS ycl_age_tda_nme_bad IMPLEMENTATION.
  METHOD get_age.
    r_age = age.
  ENDMETHOD.

  METHOD set_age.
    age = i_age.
  ENDMETHOD.

ENDCLASS.
