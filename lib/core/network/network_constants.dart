class NetworkConstants {
  //
  static String login = 'login/';
  static String sendVerificationCode = 'send/verification/code/';
  static String registration = 'user/register/second/version/';
  static String loginApple = 'social/auth/apple/jwt/';
  static String loginGoogle = 'social/auth/google/';
  static String confirmMailVerification = 'confirm/email/for/reset/password';
  static String getVerificationCode = '/send/code/for/reset/password/';
  static String resetPassword = 'reset/password/';
  static String deleteUser(String id) => 'user/$id/';

  ///
  /// Profile
  ///

  static String profile = 'profile/';

  static String changeEmail = '${profile}change/email/';
  static String verifyEmail = '${profile}verify/changed/email/';
  static String changePassword = 'change/password/in/profile/';
  static String changeLanguage = 'change/language/';

  static String insurance = '${profile}insurance/update/';
  static String policyHolder = '${profile}policy/holder/update/';
  static String vehicle = '${profile}vehicle/update/';
  static String myVehicle = '${profile}vehicle/datas/update/';
}
