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
  static const String resendCode = '$server/auth/resend.php';

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
  static const String searctItems = '$server/items/search.php';


     //====================== favorite ===========================
     static const String FavoriteAdd = '$server/favorite/add.php';
  static const String favoriteRemove = '$server/favorite/remove.php';
  static const String favoriteView = '$server/favorite/view.php';
  static const String removemyfavorite = '$server/favorite/removemyfavorite.php';



// ======================== cart =========================
static const String cartAdd = '$server/cart/add.php';
static const String cartView = '$server/cart/view.php';
static const String cartRemove = '$server/cart/remove.php';
  static const String countCartItems = '$server/cart/getcountitems.php';
     
}
