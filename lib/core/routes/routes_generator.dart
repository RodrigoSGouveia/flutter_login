import 'package:flutter/material.dart';
import 'package:flutter_login/src/features/login/login.dart';

class RoutesGenerator {
  static Map<String, dynamic> getRoutes(RouteSettings settings) => {
        "/": (context) => const LoginPage(),
      };

  static Route<dynamic>? generateRoutes(
    RouteSettings settings,
  ) {
    final routes = RoutesGenerator.getRoutes(settings);
    final WidgetBuilder? builder = routes[settings.name];

    if (builder != null) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) =>
            builder(context),
      );
    }
    return null;
  }
}
