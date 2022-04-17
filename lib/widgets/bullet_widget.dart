import 'package:flutter/material.dart';
import 'package:tutero_assignment/core/utils/box_decoration.dart';
import 'package:tutero_assignment/models/bullet.dart';

class BulletWidget extends StatelessWidget {
  final BulletData bulletData;

  const BulletWidget({
    Key? key,
    required this.bulletData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: bulletData.position.y,
      left: bulletData.position.x,
      child: Container(
        height: 9,
        width: 9,
        decoration: AppDecoration.radius(
          color: Colors.yellow,
          radius: 150,
        ),
      ),
    );
  }
}
