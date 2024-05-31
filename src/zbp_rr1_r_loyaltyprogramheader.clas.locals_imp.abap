CLASS lhc_loyaltyprogramheader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR loyaltyprogramheader RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE loyaltyprogramheader.

    METHODS earlynumbering_cba_loyaltypgmt      FOR NUMBERING
      IMPORTING entities FOR CREATE loyaltyprogramheader\_loyaltypgmtransactions.

ENDCLASS.


CLASS lhc_loyaltyprogramheader IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.
  METHOD earlynumbering_create.
  ENDMETHOD.
  METHOD earlynumbering_cba_loyaltypgmt.
  ENDMETHOD.

ENDCLASS.
