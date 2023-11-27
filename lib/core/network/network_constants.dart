class NetworkConstants {
  //
  static String login = 'v1/api/login/';
  static String sendVerificationCode = 'v1/api/send/verification/code/';
  static String registration = 'v1/api/user/register/second/version/';
  static String loginApple = 'v1/api/social/auth/apple/jwt/';
  static String loginGoogle = 'v1/api/social/auth/google/';
  static String confirmMailVerification = 'cv1/api/onfirm/email/for/reset/password';
  static String getVerificationCode = 'v1/api/send/code/for/reset/password/';
  static String resetPassword = 'v1/api/reset/password/';
  static String deleteUser = 'v1/api/user/delete/request/';
  static String verifyDeleteUser(String code) =>
      'v1/api/user/accept/delete/request/$code/';

  ///
  /// Accident
  ///

  static String accident = 'v1/api/accident/';

  static String history = '${accident}breakdown/history/?page=1';
  static String deleteReport = '${accident}breakdown/delete';

  static String secondDriver = '${accident}connect/second/driver/to/accident/';

  ///
  /// Profile
  ///

  static String profile = 'v1/api/profile/';
  static String profileData = '${profile}with/all/datas/';

  static String changeEmail = '${profile}change/email/';
  static String verifyEmail = '${profile}verify/changed/email/';
  static String changePassword = 'change/password/in/profile/';
  static String changeLanguage = 'change/language/';

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
  static String contact = 'contact/';
  static String editContact(int id) => '$contact$id/';

  static String premadeMessage = 'v1/api/pre/made/message/';
  static String editpremadeMessage(int id) => '$premadeMessage$id/';


  ///
  ///  second version reports
  ///
  static String createReport = 'v2/api/create/accident/adriver/';
  static String accidentTimeAndPlace (accidentId)=> '/v2/api/adriver/accident/$accidentId/date_time_country_place/';
}
