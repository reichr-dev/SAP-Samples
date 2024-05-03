@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Loyalty Program Header'
@ObjectModel.usageType:{
    sizeCategory: #XL,
    dataClass: #TRANSACTIONAL
    }

define root view entity ZRR1_R_LoyaltyProgramHeader
  as select from zrr1_lytpgmhdr as LoyaltyProgramHeader
  composition [0..*] of ZRR1_R_LoyalPointsProgTierDet as _LoyaltyPgmTierDets
  composition [0..*] of ZRR1_R_LoyalPointsMgmTxnDet   as _LoyaltyPgmTransactions
{
  key LoyaltyProgramHeader.lytmemid         as LoyaltyMembershipID,
      LoyaltyProgramHeader.bpid             as BusinessPartnerID,
      LoyaltyProgramHeader.bpname           as BusinessPartnerName,
      LoyaltyProgramHeader.memsince         as LoyaltyPgmMemberSince,
      LoyaltyProgramHeader.lytpoints_avl    as LoyaltyPgmPointsAvailable,
      LoyaltyProgramHeader.lytpoints_red    as LoyaltyPgmPointsRedeemed,
      //  Administrative fields
      @Semantics.systemDateTime.createdAt: true
      LoyaltyProgramHeader.lytmemcreation   as LoyaltyPgmMembershipCreatOn,
      @Semantics.user.createdBy: true
      LoyaltyProgramHeader.lytmemcreatby    as LoyaltyPgmMembershipCreatBy,
      @Semantics.systemDateTime.lastChangedAt: true
      LoyaltyProgramHeader.lytmemchngon     as LoyaltyPgmMembershipChngOn,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LoyaltyProgramHeader.lytmemlastchngat as LoyaltyPgmMembershipLclChngAt,
      @Semantics.user.lastChangedBy: true
      LoyaltyProgramHeader.lytmemchngby     as LoyaltyPgmMembershipChngBy,

      _LoyaltyPgmTierDets, // Make association public
      _LoyaltyPgmTransactions // Make association public
}
