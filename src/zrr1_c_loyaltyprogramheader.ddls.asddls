@EndUserText.label: 'Consumption for Loyalty Program Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    sizeCategory: #XL,
    dataClass: #TRANSACTIONAL
}

define root view entity ZRR1_C_LoyaltyProgramHeader
  provider contract transactional_query
  as projection on ZRR1_R_LoyaltyProgramHeader as LoyaltyProgramHeader
{
      @EndUserText.label: 'Membership ID'
  key LoyaltyMembershipID,
      @EndUserText.label: 'Customer ID'
      BusinessPartnerID,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZEXES1_CL_ERPINT_BUPA_NAME'
      @EndUserText.label: 'Customer Name'
      BusinessPartnerName,
      @EndUserText.label: 'Member Since'
      LoyaltyPgmMemberSince,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_EXES1_PGMHDR_VFIELDS'
      @EndUserText.label: 'Loyalty Points Available'
      LoyaltyPgmPointsAvailable,
      @EndUserText.label: 'Loyalty Points Redeemed'
      LoyaltyPgmPointsRedeemed,

      /* Administrative Fileds */
      @UI.hidden: true
      LoyaltyPgmMembershipCreatOn,
      @UI.hidden: true
      LoyaltyPgmMembershipCreatBy,
      @UI.hidden: true
      LoyaltyPgmMembershipChngOn,
      @UI.hidden: true
      LoyaltyPgmMembershipLclChngAt,
      @UI.hidden: true
      LoyaltyPgmMembershipChngBy,

      /* Associations */
      _LoyaltyPgmTierDets     : redirected to composition child ZRR1_C_LoyalPointsProgTierDet,
      _LoyaltyPgmTransactions : redirected to composition child ZRR1_C_LoyalPointsMgmTxnDet
}
