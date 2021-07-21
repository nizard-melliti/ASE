REPORT yr_fizzbuzz_extended_nme.

PARAMETERS : p_number TYPE i.



CLASS lcl_fizzbuzz DEFINITION.

  PUBLIC SECTION.
    METHODS : fizzbuzz_reprensation IMPORTING i_number                         TYPE i
                                    RETURNING VALUE(r_fizzbuzz_representation) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_fizzbuzz IMPLEMENTATION.

  METHOD fizzbuzz_reprensation.

  ENDMETHOD.

ENDCLASS.

CLASS ltcl_fizzbuzz_reprensetation DEFINITION FINAL FOR TESTING
        DURATION SHORT
        RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      acceptance_test FOR TESTING.
ENDCLASS.


CLASS ltcl_fizzbuzz_reprensetation IMPLEMENTATION.

  METHOD acceptance_test.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_application DEFINITION.
  PUBLIC SECTION.
    METHODS main.
ENDCLASS.

CLASS lcl_application IMPLEMENTATION.
  METHOD main.

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  NEW lcl_application(  )->main(  ).
