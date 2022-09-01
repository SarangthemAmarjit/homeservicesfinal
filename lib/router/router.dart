import 'package:auto_route/annotations.dart';
import 'package:homeservice/onboarding/login.page.dart';
import 'package:homeservice/onboarding/register.dart';
import 'package:homeservice/pages/allservice.dart';
import 'package:homeservice/pages/detail.page.dart';
import 'package:homeservice/pages/home.dart';
import 'package:homeservice/pages/nointerpage.dart';
import 'package:homeservice/pages/profile.page.dart';
import 'package:homeservice/pages/splash_screen.dart';
import 'package:homeservice/pages/userprofile.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashscreenPage, initial: true),
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(page: HomePage, path: '/home'),
    AutoRoute(page: NointernetPage, path: '/nointernet'),
    AutoRoute(page: DetailPage),
    AutoRoute(page: ProfilePage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: AllservicePage),
    AutoRoute(page: UserProfilePage),
  ],
)
class $AppRouter {}
