@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Entity for FitFor Product Mapping'
define root view entity ZXE3_I_FITFOR_V2
  as select from zxe3_fitfor_v2
{
  key werks        as Werks,
  key produced_pro as ProducedPro,
  key fitfor_pro   as FitforPro,
      priority     as Priority
}
