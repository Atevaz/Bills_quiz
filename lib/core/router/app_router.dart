import 'package:flutter/material.dart';
import 'package:quiz/feature/auth/presentation/screens/home_screen.dart';
import 'package:quiz/feature/auth/presentation/screens/login_screen.dart';
import 'package:quiz/feature/auth/presentation/screens/splash_screen.dart';
import 'package:video_player/video_player.dart';

import 'app_router_names.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rSplashLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case AppRouterNames.rLoginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRouterNames.rHomeLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}
