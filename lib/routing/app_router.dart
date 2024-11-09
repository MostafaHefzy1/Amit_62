import 'package:flutter/material.dart';
import 'package:flutter_application_1/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
    return null;
  }
}
