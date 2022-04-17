import 'package:flutter/material.dart';
import 'package:tutero_assignment/controller/game_controller.dart';
import 'package:tutero_assignment/core/constant/app_colors.dart';
import 'package:tutero_assignment/core/utils/app_extension.dart';
import 'package:tutero_assignment/core/utils/box_decoration.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({
    Key? key,
    required this.state,
    required this.onTapRestart,
  }) : super(key: key);

  final GameState state;
  final VoidCallback onTapRestart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 500,
        decoration: AppDecoration.lightBorder(
          color: AppColors.appDark,
          borderColor: Colors.white70,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              state.message,
              style: context.textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      'Back Home',
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onTapRestart,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      'Restart',
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
