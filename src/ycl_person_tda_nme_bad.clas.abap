CLASS ycl_person_tda_nme_bad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : do_something,
      do_something_for_adult,
      do_something_for_child.
PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : age TYPE REF TO ycl_age_tda_nme_bad.
ENDCLASS.



CLASS ycl_person_tda_nme_bad IMPLEMENTATION.

  METHOD do_something.
    DATA(lv_age) = age->get_age(  ).
    IF lv_age >= 18.
      do_something_for_adult( ).
    ELSE.
      do_something_for_child(  ).
    ENDIF.

  ENDMETHOD.

  METHOD do_something_for_adult.

  ENDMETHOD.

  METHOD do_something_for_child.

  ENDMETHOD.

ENDCLASS.
