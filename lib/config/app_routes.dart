import 'package:flutter/material.dart';
import 'package:tutero_assignment/features/game/game_view.dart';
import 'package:tutero_assignment/features/home/home_view.dart';
import 'package:tutero_assignment/features/settings/setting_view.dart';

///Only home route present at the moment
class AppRoutes {
  static const String home = '/';
  static const String game = '/game';
  static const String setting = '/settings';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case game:
        Size size = settings.arguments as Size;
        return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, p, s) => GameView(
            screenWidth: size.width,
            screenHeight: size.height,
          ),
        );

      case setting:
        return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, p, s) => const SettingsView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No Route Found')),
          ),
        );
    }
  }
}
