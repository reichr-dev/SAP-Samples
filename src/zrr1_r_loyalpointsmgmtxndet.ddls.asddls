@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Loyalty Points Management - Transaction Details'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    sizeCategory: #XL,
    dataClass: #TRANSACTIONAL
}

@AbapCatalog.extensibility: {
  extensible: true,
  elementSuffix: 'ZTX',
  allowNewDatasources: false,
  dataSources: ['_LoyaltyPgmTransactions'],
  quota: {
    maximumFields: 100,
    maximumBytes: 5000
  },
  allowNewCompositions: true
}

define view entity ZRR1_R_LoyalPointsMgmTxnDet
  as select from zrr1_lytpgmtxn as _LoyaltyPgmTransactions
  association to parent ZRR1_R_LoyaltyProgramHeader as _LoyaltyPgmMembershipHeader on $projection.LoyaltyPgmMembershipID = _LoyaltyPgmMembershipHeader.LoyaltyMembershipID
{

  key lytmemid              as LoyaltyPgmMembershipID,
  key lyttxnid              as LoyaltyPgmTransactionID,
      lyttxndt              as LoyaltyPgmTransactionDate,
      lyttxnval             as LoyaltyPgmTransactionValue,
      lyttxncur             as LoyaltyPgmTransactionCurrency,
      lytacttyp             as LoyaltyPgmActivityType,
      lytpoints             as LoyaltyPgmPoints,
      lyttxndesc            as LoyaltyPgmTransDescription,

      @Semantics.systemDateTime.createdAt: true
      lyttxncreaton         as LoyaltyPgmTransCreatOn,
      @Semantics.user.createdBy: true
      lyttxncreatby         as LoyaltyPgmTransCreatBy,
      @Semantics.user.lastChangedBy: true
      lyttxnchngby          as LoyaltyPgmTransChngBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      /* Associations */
      _LoyaltyPgmMembershipHeader
}
