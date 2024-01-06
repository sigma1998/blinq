class NetworkConstants {
  ///
  ///auth
  ///
  static String login = 'v1/api/login/';
  static String sendVerificationCode = 'v1/api/send/verification/code/';
  static String registration = 'v1/api/user/register/second/version/';
  static String loginApple = 'v1/api/social/auth/apple/jwt/';
  static String loginGoogle = 'v1/api/social/auth/google/';
  static String confirmMailVerification =
      'v1/api/confirm/email/for/reset/password';
  static String getVerificationCode = 'v1/api/send/code/for/reset/password/';
  static String resetPassword = 'v1/api/reset/password/';
  static String deleteUser = 'v1/api/user/delete/request/';
  static String refreshToken = '/v1/api/token/refresh/';

  static String updateFCMToken(int userId) =>
      '/v1/api/update/$userId/device_token/';

  static String verifyDeleteUser(String code) =>
      'v1/api/user/accept/delete/request/$code/';

  ///
  /// Accident
  ///

  static const String accident = 'v2/api/accident/';

  static String history = 'v1/api/accident/breakdown/history/?page=1';
  static String deleteReport = '${accident}breakdown/delete';

  static String getDriverB(int id) => 'v1/api/user/$id/mini/';

  static String connectBDriver(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/connect_bdriver_with_qr_code/';

  ///
  /// Profile
  ///

  static String profile = 'v1/api/profile/';
  static String profileData = '${profile}with/all/datas/';

  static String changeEmail = '${profile}change/email/';
  static String verifyEmail = '${profile}verify/changed/email/';
  static String changePassword = '/v1/api/change/password/in/profile/';
  static String changeLanguage = '/v1/api/change/language/';

  static String insurance = '${profile}insurance/update/';
  static String policyHolder = '${profile}policy/holder/update/';

  static String vehicle = '${profile}vehicle/update/';

  static String car = '${profile}vehicle/update/';
  static String userVehicle = '${profile}vehicle/datas/update/';

  static String brands = 'v1/api/vehicle/brands/';
  static String models = 'v1/api/vehicle/brand/models/';
  static String colors = 'v1/api/vehicle/brand/colors/';

  static String checkAccountData = 'v1/api/check/account/datas/';

  ///
  ///  Contact
  ///
  static String contact = 'v1/api/contact/';

  static String editContact(int id) => '$contact$id/';

  static String premadeMessage = 'v1/api/pre/made/message/';

  static String editpremadeMessage(int id) => '$premadeMessage$id/';

  ///
  ///  second version reports
  ///
  static String createAccident = 'v2/api/create/accident/adriver/';

  static String accidentTimeAndPlace(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/date_time_country_place/';

  static String accidentSketch(int accidentId) =>
      '/v2/api/abdriver/accident/$accidentId/sketch/';

  static String accidentCircumstances(int accidentId) =>
      '/v2/api/abdriver/accident/$accidentId/circumstances/';
  static String uploadFile = 'v2/api/files/';

  static String accidentStatus(int accidentId) =>
      'v2/api/get/accident/$accidentId/status/';

  ///driver a
  static String injury(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/injury/';

  static String witnesses(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/witnesses/';

  static String visibleDamage(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/visible_damage/';

  static String initialImpactPoint(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/initial_impact_point/';

  static String myRemarks(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/my_remarks/';

  static String damagePoints(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/damage_points/';

  static String uploadMedia(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/upload_media/';

  static String sign(int accidentId) =>
      '/v2/api/adriver/accident/$accidentId/sign/';

  /// Driver b

  static String connectToNoBlinqDriver(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/no_blinq_user_connect/';

  static String injuryB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/injury/';

  static String witnessesB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/witnesses/';

  static String visibleDamageB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/visible_damage/';

  static String initialImpactPointB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/initial_impact_point/';

  static String myRemarksB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/my_remarks/';

  static String damagePointsB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/damage_points/';

  static String uploadMediaB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/upload_media/';

  static String signB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/sign/';

  static String getAccidentPdf(int accidentId) =>
      '/v2/api/accident/$accidentId/get_pdf/';

  static String sendToInsurance =
      'v1/api/accident/send/breakdown/report/to/insurance/';

  static String updateCarB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/about_car/';

  static String updateDriverB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/about_driver/';

  static String updateInsuranceCompanyB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/insurance_company/';

  static String updatePolicyHolderB(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/policy_holder/';

  static String secondDriverVehicleType(int accidentId) =>
      '/v2/api/bdriver/accident/$accidentId/vehicle_type/';

  static String deactivateAccident(int accidentId) =>
      '/v2/api/update/accident/$accidentId/status/';

  ///
  /// breakdowns
  ///
  static String createBreakdown = 'v2/api/create/breakdown/';

  static String breakdownTimeAndPlace(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/date_time_country_place/';

  static String breakdownSketch(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/sketch/';

  static String breakdownCircumstances(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/circumstances/';

  static String getBreakdownPdf(int accidentId) =>
      '/v2/api/breakdown/$accidentId/get_pdf/';

  static String getBreakdownStatus(int breakdownId) =>
      'v2/api/get/breakdown/$breakdownId/status/';

  static String injuryBreakdown(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/injury/';

  static String witnessesBreakdown(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/witnesses/';

  static String visibleDamageBreakdown(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/visible_damage/';

  static String initialImpactPointBreakdown(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/initial_impact_point/';

  static String myRemarksBreakdown(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/my_remarks/';

  static String damagePointsBreakdown(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/damage_points/';

  static String uploadMediaBreakdown(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/upload_media/';

  static String signBreakdown(int breakdownId) =>
      '/v2/api/breakdown/$breakdownId/sign/';

  static String deactivateBreakdown(int breakdownId) =>
      '/v2/api/update/breakdown/$breakdownId/status/';

  ///notifications
  static String sendNotification(int accidentId) => ''
      'v2/api/adriver/accident/$accidentId/send_notification';

  static String confirmNotification(int accidentId) => ''
      'v2/api/bdriver/accident/$accidentId/confirm_notification';
}
