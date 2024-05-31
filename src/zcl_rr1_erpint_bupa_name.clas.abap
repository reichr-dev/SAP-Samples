CLASS zcl_rr1_erpint_bupa_name DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
ENDCLASS.


CLASS zcl_rr1_erpint_bupa_name IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA bo_context_data TYPE STANDARD TABLE OF ZRR1_C_LoyaltyProgramHeader WITH DEFAULT KEY.

    bo_context_data = CORRESPONDING #( it_original_data ).

    " Create filters
    " TODO: variable is assigned but never used (ABAP cleaner)
    LOOP AT bo_context_data ASSIGNING FIELD-SYMBOL(<bo_context>) WHERE loyaltymembershipid IS NOT INITIAL.

    ENDLOOP.
    ct_calculated_data = CORRESPONDING #( bo_context_data ).
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
