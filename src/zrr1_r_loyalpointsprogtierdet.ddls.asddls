@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Loyal Points Program Tier Details'
define view entity ZRR1_R_LoyalPointsProgTierDet
  as select from zrr1_lytpgmtr as LoyaltyTierDetails
    join         zrr1_lyltier  as TierConfig on LoyaltyTierDetails.lyttierid = TierConfig.lyltierid
  association        to parent ZRR1_R_LoyaltyProgramHeader as _LoyaltyPgmMembershipHeader on $projection.LoyaltyMembershipID = _LoyaltyPgmMembershipHeader.LoyaltyMembershipID
  association [1..1] to ZRR1_LoyaltyPointsTierStat_VH      as _TierStatusText             on $projection.LoyaltyTierStatus = _TierStatusText.Id
{

  key LoyaltyTierDetails.lytmemid              as LoyaltyMembershipID,
  key LoyaltyTierDetails.lyttierid             as LoyaltyTierID,
  key LoyaltyTierDetails.lyttiervalidfrom      as LoyaltyTierValidFrom,
      LoyaltyTierDetails.lyttierstatus         as LoyaltyTierStatus,
      LoyaltyTierDetails.lyttierstatustext     as LoyaltyTierStatusText,

      @Semantics.user.createdBy: true
      LoyaltyTierDetails.lytbptiercreatby      as LoyaltyTierCreatedBy,
      @Semantics.user.lastChangedBy: true
      LoyaltyTierDetails.lytbptierchngby       as Lytbptierchngby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LoyaltyTierDetails.local_last_changed_at as LocalLastChangedAt,

      LoyaltyTierDetails.tierwfapprovaldueby   as Tierwfapprovaldueby,

      /* Associations */
      _LoyaltyPgmMembershipHeader,
      _TierStatusText
}
