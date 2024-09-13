import 'package:shramik/app/screens/auth/views/register_screen.dart';
import 'package:shramik/app/screens/signup/binding/sign_up_binding.dart';

import '../middlewares/onboarding_middleware.dart';
import '../screens/account/views/my_profile.dart';
import '../components/congrats_screen.dart';
import '../screens/auth/views/get_started.dart';
import '../screens/auth/views/login_screen.dart';
import '../screens/signup/views/sign_up_screen.dart';

import 'package:get/get.dart';
import '../components/splash.dart';
import '../screens/auth/binding/auth_binding.dart';
import '../screens/auth/views/auth_screen.dart';
import '../screens/auth/views/verify_otp_screen.dart';
import '../screens/blog/binding/blog_binding.dart';
import '../screens/blog/views/blog_details_screen.dart';
import '../screens/blog/views/blog_screen.dart';
import '../screens/home/binding/home_binding.dart';
import '../screens/home/views/advertisement_screen.dart';
import '../screens/home/views/dashboard_screen.dart';
import '../screens/onboarding/binding/onboarding_binding.dart';
import '../screens/onboarding/views/onboarding_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      // binding: OnboardBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.GET_STARTED,
      page: () => GetStarted(),
      binding: OnboardBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnBoardingScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => MainScreen(),
      binding: HomeBinding(),
      middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    // GetPage(
    //   name: Routes.FORGOT_PASSWORD,
    //   page: () => ForgotPasswordScreen(),
    //   binding: AuthBinding(),
    //   // middlewares: [OnBoardingMiddleWare()],
    // ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.OTP_VERIFY,
      page: () => VerifyOTPScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_PROFILE,
      page: () => MyProfileScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.ADVERTISEMENT,
      page: () => AdvertisementScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CONGRATS,
      page: () => CongratsScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    // GetPage(
    //   name: Routes.CREATE_VPIN,
    //   page: () => CreateVpinScreen(),
    //   binding: AuthBinding(),
    //   // middlewares: [OnBoardingMiddleWare()],
    // ),
    // GetPage(
    //   name: Routes.CREATE_PASSWORD,
    //   page: () => CreatePasswordScreen(),
    //   binding: AuthBinding(),
    //   // middlewares: [OnBoardingMiddleWare()],
    // ),
    GetPage(
      name: Routes.BLOG,
      page: () => BlogScreen(),
      binding: BlogBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BLOG_DETAILS,
      page: () => BlogDetailsScreen(),
      binding: BlogBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
  ];
}
