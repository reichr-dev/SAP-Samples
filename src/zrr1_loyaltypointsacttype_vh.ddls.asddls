@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain values for activity type'
define root view entity ZRR1_LoyaltyPointsActType_VH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name : 'ZEXES1_LYLACTTYP' )
{
      @UI.hidden: true
  key domain_name,
      @UI.hidden: true
  key value_position,
      @UI.hidden: true
  key language,
      @EndUserText.label: 'Activity Type'
      value_low as Id,
      @EndUserText.label: 'Description'
      text
}
where
      language  =  'E'
  and value_low <> 'REDM'
