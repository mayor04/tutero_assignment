import 'package:flutter/material.dart';
import 'package:tutero_assignment/core/constant/app_colors.dart';
import 'package:tutero_assignment/core/utils/box_decoration.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appDarker,
      body: Center(
        child: Container(
          height: 300,
          width: 500,
          decoration: AppDecoration.lightBorder(
            color: AppColors.appDark,
            borderColor: Colors.white70,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}

class SettingData extends InheritedWidget {
  const SettingData({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
