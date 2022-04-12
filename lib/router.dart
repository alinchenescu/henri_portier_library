import 'package:auto_route/auto_route.dart';
import 'package:henri_portier_library/screens/home_screen.dart';
import 'package:henri_portier_library/screens/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
    ),
    AutoRoute(page: HomeNavScreen, initial: true),
  ],
)
class $AppRouter {}
