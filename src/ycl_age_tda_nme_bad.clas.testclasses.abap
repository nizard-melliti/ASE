*"* use this source file for your ABAP unit test classes
class ltcl_beers definition final for testing
  duration short
  risk level harmless.

  PRIVATE SECTION.
    DATA lo_age TYPE REF TO ycl_age_tda_nme_bad.
    METHODS:
      setup,
      check_set_get_age FOR TESTING RAISING cx_static_check.

  ENDCLASS.


class ltcl_beers implementation.

  METHOD setup.
    lo_age = NEW ycl_age_tda_nme_bad(  ).
  ENDMETHOD.



  METHOD check_set_get_age.

    lo_age->set_age( 18 ).
    DATA(lv_age) = lo_age->get_age(  ).
    cl_abap_unit_assert=>assert_equals(
   EXPORTING
     act                  =  lv_age
     exp                  =  18
    ).

  ENDMETHOD.



endclass.
