@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for Loyalty Program Tier Details'
@Metadata.allowExtensions: true

define view entity ZRR1_C_LoyalPointsProgTierDet
  as projection on ZRR1_R_LoyalPointsProgTierDet
{
  key LoyaltyMembershipID,
  key LoyaltyTierID,
  key LoyaltyTierValidFrom,
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: ['TierStatusText']
      LoyaltyTierStatus,
      _TierStatusText.text as TierStatusText,
      LoyaltyTierStatusText,
      //      TierCountry,
      /* Admininstrative fields */
      @UI.hidden: true
      LoyaltyTierCreatedBy,
      @UI.hidden: true
      LoyaltyTierChangedBy,
      @UI.hidden: true
      LocalLastChangedAt,
      Tierwfapprovaldueby,

      /* Associations */
      _LoyaltyPgmMembershipHeader : redirected to parent ZRR1_C_LoyaltyProgramHeader
}
