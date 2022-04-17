import 'package:flutter/material.dart';
import 'package:tutero_assignment/core/constant/app_colors.dart';
import 'package:tutero_assignment/core/utils/app_extension.dart';
import 'package:tutero_assignment/core/utils/box_decoration.dart';
import 'package:tutero_assignment/services/navigation_services.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _SelectGameItems(
                title: 'PLAY',
                iconData: Icons.play_arrow,
                onTap: () {
                  NavigationService().navigateToGame(
                      args: Size(context.screenWidth, context.screenWidth));
                },
              ),
              _SelectGameItems(
                title: 'LEVELS',
                iconData: Icons.add_chart,
                onTap: () {},
              ),
              _SelectGameItems(
                title: 'SETTING',
                iconData: Icons.settings,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectGameItems extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData iconData;

  const _SelectGameItems({
    Key? key,
    required this.title,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: AppDecoration.lightBorder(
              color: AppColors.appGrey,
              borderColor: Colors.white70,
            ),
            alignment: Alignment.center,
            child: Icon(
              iconData,
              size: 40,
            ),
          ),
          Text(
            title,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
