class AppLink {
  static const String server = 'https://amineamine.com/ecommerce';
  static const String test = '$server/test.php';

  // ======================== Auth ===========================//
  static const String signUp = '$server/auth/signup.php';
  static const String verifycodesignup = '$server/auth/verifycode.php';
  static const String signIn = '$server/auth/signin.php';

  // ======================== forget password ===========================//
  static const String checkEmail = '$server/forgetpassword/checkemail.php';
  static const String verifyCodePassword =
      '$server/forgetpassword/verifycode.php';
  static const String resetPassword =
      '$server/forgetpassword/resetpassword.php';
}
