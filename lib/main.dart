import 'package:flutter/material.dart';
import 'package:tutero_assignment/config/app_routes.dart';
import 'package:tutero_assignment/config/app_theme.dart';
import 'package:tutero_assignment/features/home/home_view.dart';
import 'package:tutero_assignment/services/navigation_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      onGenerateRoute: AppRoutes.generateRoutes,
      navigatorKey: NavigationService().navigatorKey,
      home: Builder(builder: (context) {
        // return GameView(
        //   screenHeight: context.screenHeight,
        //   screenWidth: context.screenWidth,
        // );

        return const HomeView();
      }),
    );
  }
}
