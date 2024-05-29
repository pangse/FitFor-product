@EndUserText.label: 'Consumption View for Fitfor API'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZXE3_A_FITFOR
  provider contract transactional_query
  as projection on ZXE3_I_FITFOR_V2
{
  key Werks,
  key ProducedPro,
  key FitforPro,
      Priority
}
