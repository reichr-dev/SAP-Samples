@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for Loyalty Program Transaction Details'
@Metadata.allowExtensions: true

define view entity ZRR1_C_LoyalPointsMgmTxnDet
  as projection on ZRR1_R_LoyalPointsMgmTxnDet as LoyaltyPgmTransactions
{
  key LoyaltyPgmMembershipID,
  key LoyaltyPgmTransactionID,
      LoyaltyPgmTransactionDate,
      LoyaltyPgmTransactionValue,
      LoyaltyPgmTransactionCurrency,
      LoyaltyPgmActivityType,
      LoyaltyPgmPoints,
      LoyaltyPgmTransDescription,

      /* Admininstrative fields */
      @UI.hidden: true
      LoyaltyPgmTransCreatOn,
      @UI.hidden: true
      LoyaltyPgmTransCreatBy,
      @UI.hidden: true
      LoyaltyPgmTransChngBy,
      @UI.hidden: true
      LocalLastChangedAt,

      /* Associations */
      _LoyaltyPgmMembershipHeader : redirected to parent ZRR1_C_LoyaltyProgramHeader
}
