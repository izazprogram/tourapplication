import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tourapplication/views/auth/sign_up.dart';
import 'package:tourapplication/views/onbody_screen.dart';
import 'package:tourapplication/views/splash_screen.dart';

import '../../views/auth/log_in.dart';
import '../../views/user_from.dart';

const String splash = '/splash-screen';
const String onbody = '/onbody-screen';
const String signup = '/signup-screen';
const String signIn = '/signin-screen';
const String userFrom = '/userFrom-screen';
// control our page route
List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onbody, page: () => OnBodyScreen()),
  GetPage(name: signup, page: () => SignUp()),
  GetPage(name: signIn, page: () => SignIn()),
  GetPage(name: userFrom, page: () => User_From()),
];
