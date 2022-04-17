// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:tutero_assignment/config/app_routes.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._();

  final navigatorKey = GlobalKey<NavigatorState>();

  factory NavigationService() {
    return _instance;
  }

  NavigationService._();

  Future<T?>? navigateToGame<T>({Size? args}) {
    return _navigateToNamed(AppRoutes.game, args: args);
  }

  Future<T?>? navigateToSettings<T>() {
    return _navigateToNamed(AppRoutes.setting);
  }

  //View navigation
  Future<T?>? _navigateTo<T>(Route<T> route) {
    return navigatorKey.currentState?.push(route);
  }

  Future<T?>? _navigateToNamed<T>(String route, {Object? args}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: args);
  }
}
