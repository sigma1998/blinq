class NetworkConstants{
  static String login = 'login/';
  static String sendVerificationCode = 'send/verification/code/';
  static String registration = 'user/register/second/version/';
  static String loginApple = 'social/auth/apple/jwt/';
  static String loginGoogle = 'social/auth/google/';
  static String confirmMailVerification = 'confirm/email/for/reset/password';
  static String getVerificationCode = '/send/code/for/reset/password/';
  static String resetPassword = 'reset/password/';
  static String  deleteUser (String id)=> 'user/$id/';

}