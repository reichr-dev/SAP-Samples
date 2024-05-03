@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Get the tier domain values'
define view entity ZRR1_LoyaltyPointsTierStat_VH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZEXES1_LYLSTATUS' )
  association [0..1] to I_Language as _Language on $projection.language = _Language.Language
{
      @UI.hidden: true
  key domain_name,
      @UI.hidden: true
  key value_position,
      @UI.hidden: true
      @Semantics.language: true
  key language,
      @EndUserText.label: 'Tier Status'
      @ObjectModel.text.element: ['Text']
      value_low as Id,
      @EndUserText.label: 'Description'
      @Semantics.text: true
      text,
      _Language
}
