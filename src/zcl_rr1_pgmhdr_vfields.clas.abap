CLASS zcl_rr1_pgmhdr_vfields DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
ENDCLASS.


CLASS zcl_rr1_pgmhdr_vfields IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA bo_context_data TYPE STANDARD TABLE OF zrr1_c_loyaltyprogramheader WITH DEFAULT KEY.
    TYPES: BEGIN OF t_pgm_tier,
             loyaltypgmmembershipid    TYPE zexes1_lylmemid,
             loyaltypgmtierid          TYPE zexes1_lyltierid,
             loyaltypgmpointsavailable TYPE i,
           END OF t_pgm_tier.

    DATA pgm_tier TYPE TABLE OF t_pgm_tier.
    DATA valid_points TYPE i.

    bo_context_data = CORRESPONDING #( it_original_data ).
    " Update the context data
    SELECT loyaltymembershipid, loyaltytierid
      FROM zrr1_r_loyalpointsprogtierdet
      FOR ALL ENTRIES IN @bo_context_data
      WHERE loyaltymembershipid = @bo_context_data-loyaltymembershipid
      INTO TABLE @pgm_tier.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    SELECT loyaltypgmmembershipid, loyaltypgmtransactionid, loyaltypgmtransactionvalue
      FROM zrr1_r_loyalpointsmgmtxndet
      FOR ALL ENTRIES IN @bo_context_data
      WHERE loyaltypgmmembershipid = @bo_context_data-loyaltymembershipid
          " TODO: variable is assigned but never used (ABAP cleaner)
      INTO TABLE @DATA(pgm_txns).

    SORT bo_context_data BY loyaltymembershipid ASCENDING.
    SORT pgm_tier BY loyaltypgmmembershipid ASCENDING.
    SORT pgm_txns BY loyaltypgmmembershipid
                     loyaltypgmtransactionid.
    LOOP AT bo_context_data ASSIGNING FIELD-SYMBOL(<context>) WHERE loyaltymembershipid IS NOT INITIAL.
      CLEAR valid_points.
      " TODO: variable is assigned but never used (ABAP cleaner)
      ASSIGN pgm_tier[ loyaltypgmmembershipid = <context>-loyaltymembershipid ] TO FIELD-SYMBOL(<fs_pgm_tier>).
      IF sy-subrc = 0.
      ENDIF.
      <context>-loyaltypgmpointsavailable = valid_points.
    ENDLOOP.
    ct_calculated_data = CORRESPONDING #( bo_context_data ).
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
