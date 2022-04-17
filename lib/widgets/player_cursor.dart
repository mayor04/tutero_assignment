import 'package:flutter/material.dart';
import 'package:tutero_assignment/core/constant/app_colors.dart';
import 'package:tutero_assignment/models/player.dart';
import 'package:tutero_assignment/paint/mouse_paint.dart';

class PlayerCursor extends StatelessWidget {
  final Player player;
  const PlayerCursor({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: player.position.y,
      left: player.position.x,
      child: Transform.rotate(
        angle: player.angle,
        child: Container(
          height: 15,
          width: 40,
          // color: Colors.white,
          alignment: Alignment.centerLeft,
          child: CustomPaint(
            size: const Size(25, 10),
            painter: MousePainter(AppColors.appDark),
          ),
        ),
      ),
    );
  }
}
