@AbapCatalog.sqlViewName: 'ZAFK_CDS_0003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Example 3'
define view ZAFKOSEOGLU_5055_CDS_0003
  as select from ZAFKOSEOGLU_5055_CDS_0002 as cds2
{
  sum(cds2.conversion_netwr)                                                                               as toplam_net_deger,
  cds2.kunnrAd                                                                                             as musteri_ad_soyad,
  count(*)                                                                                                 as toplam_fatura_adedi,
  division(cast(sum(cds2.conversion_netwr) as abap.curr( 15, 2 )) ,cast(count(*) as abap.curr( 15, 2 )),2) as ortalama_miktar,
  substring(cds2.fkdat,1,4)                                                                                as faturalama_yili,
  substring(cds2.fkdat,5,2)                                                                                as faturalama_ayi,
  substring(cds2.fkdat,7,2)                                                                                as faturalama_gun,
  substring(cds2.inco2_l,1,3)                                                                              as incoterm_yeri
}
group by
  cds2.vbeln,
  cds2.kunnrAd,
  cds2.fkdat,
  cds2.inco2_l
