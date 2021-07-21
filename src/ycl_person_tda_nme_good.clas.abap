CLASS ycl_person_tda_nme_good DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      METHODS : do_something,
      do_something_for_adult,
      do_something_for_child.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : age TYPE REF TO ycl_age_tda_nme_good.
  ENDCLASS.



CLASS ycl_person_tda_nme_good IMPLEMENTATION.
  METHOD do_something.
    IF age->is_adult(  ).
      do_something_for_adult(  ).
    ELSE.
      do_something_for_child(  ).
    ENDIF.
  ENDMETHOD.

  METHOD do_something_for_adult.

  ENDMETHOD.

  METHOD do_something_for_child.

  ENDMETHOD.

ENDCLASS.
