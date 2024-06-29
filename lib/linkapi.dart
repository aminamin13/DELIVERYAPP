class AppLink {
  static const String server = 'https://amineamine.com/ecommerce';


  //==================images===========================
  static const String imagestatic = 'https://amineamine.com/ecommerce/upload';
  static const String imagecategories = '$imagestatic/categories';
  static const String imageitems = '$imagestatic/items';

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

      //======================= home ============================
     static const String homepage = '$server/home.php'; 


     //======================= items ============================
     static const String items = '$server/items/items.php';
     
}
