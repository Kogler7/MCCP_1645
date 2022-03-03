import 'package:get/get.dart';
import 'package:mccp_1645/config/binding.dart';
import 'package:mccp_1645/module/auth/welcome.dart';
import 'package:mccp_1645/module/intro/intro.dart';
import 'package:mccp_1645/module/tab/home.dart';
import 'package:mccp_1645/module/splash/splash_page.dart';
import 'package:mccp_1645/module/auth/login.dart';
import 'package:mccp_1645/module/auth/signup.dart';
part 'routes.dart';

class AppPages {
  static const init = Routes.splash;
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: RootBinding(),
    ),
    GetPage(
      name: Routes.intro,
      page: () => const AnimatedIntroductionScreen(),
    ),
    // GetPage(
    //   name: Routes.auth,
    //   page: () => AuthScreen(),
    //   binding: AuthBinding(),
    //   children: [
    //     GetPage(name: Routes.register, page: () => RegisterScreen()),
    //     GetPage(name: Routes.login, page: () => LoginScreen()),
    //   ],
    // ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.signup,
      page:() => const SignUpPage(),
    ),
    GetPage(
        name: Routes.login,
        page:() => const LoginPage(),
    ),
    GetPage(
      name: Routes.auth,
      page:() => const WelcomePage(),
    ),
  ];
}