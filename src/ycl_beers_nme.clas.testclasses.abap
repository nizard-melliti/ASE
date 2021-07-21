*"* use this source file for your ABAP unit test classes
class ltcl_beers definition final for testing
  duration short
  risk level harmless.

  PRIVATE SECTION.
    DATA lo_beers TYPE REF TO ycl_beers_nme.
    METHODS:
      setup,
      check_get_init_beers FOR TESTING RAISING cx_static_check,
      check_set_init_beers FOR TESTING RAISING cx_static_check,
      check_get_nb_beers_0 FOR TESTING RAISING cx_static_check,
      check_get_nb_beers_1 FOR TESTING RAISING cx_static_check,
      check_get_nb_beers_2 FOR TESTING RAISING cx_static_check,
      check_decrease_1_beer FOR TESTING RAISING cx_static_check.

  ENDCLASS.


class ltcl_beers implementation.

  METHOD setup.
    lo_beers = NEW ycl_beers_nme( i_nb_beer = '3' ).
  ENDMETHOD.



  METHOD check_get_init_beers.

    DATA(lv_nb_beer) = lo_beers->get_init_beers(  ).
    cl_abap_unit_assert=>assert_equals(
   EXPORTING
     act                  =  lv_nb_beer
     exp                  =  3
    ).

  ENDMETHOD.

  METHOD check_decrease_1_beer.
    lo_beers->decrease_1_beer(  ).
    DATA(lv_result) = lo_beers->get_nb_beers(  ).

    cl_abap_unit_assert=>assert_equals(
    EXPORTING
    act                  =  lv_result
    exp                  =  '2 bottles'
    ).
  ENDMETHOD.

  method check_get_nb_beers_0.

    lo_beers->decrease_1_beer(  ).
    lo_beers->decrease_1_beer(  ).
    lo_beers->decrease_1_beer(  ).
    DATA(lv_result) = lo_beers->get_nb_beers(  ).

    cl_abap_unit_assert=>assert_equals(
    EXPORTING
    act                  =  lv_result
    exp                  =  'no more bottles'
    ).

  endmethod.

  method check_get_nb_beers_1.

    lo_beers->decrease_1_beer(  ).
    lo_beers->decrease_1_beer(  ).

    DATA(lv_result) = lo_beers->get_nb_beers(  ).

    cl_abap_unit_assert=>assert_equals(
    EXPORTING
    act                  =  lv_result
    exp                  =  '1 bottle'
    ).

  endmethod.

  METHOD check_get_nb_beers_2.

    lo_beers->decrease_1_beer(  ).

    DATA(lv_result) = lo_beers->get_nb_beers(  ).

    cl_abap_unit_assert=>assert_equals(
    EXPORTING
    act                  =  lv_result
    exp                  =  '2 bottles'
    ).
  ENDMETHOD.

  method check_set_init_beers.
    lo_beers->decrease_1_beer(  ).

    lo_beers->set_init_beers(  ).

    DATA(lv_result) = lo_beers->get_nb_beers(  ).

    cl_abap_unit_assert=>assert_equals(
    EXPORTING
    act                  =  lv_result
    exp                  =  '3 bottles'
    ).
  endmethod.



endclass.
