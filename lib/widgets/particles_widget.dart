import 'package:flutter/material.dart';
import 'package:tutero_assignment/core/utils/box_decoration.dart';
import 'package:tutero_assignment/models/particle/particle_data.dart';

class ParticleWidget extends StatelessWidget {
  final ParticleData particleData;

  const ParticleWidget({
    Key? key,
    required this.particleData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: particleData.position.y,
      left: particleData.position.x,
      child: Container(
        height: particleData.size.y,
        width: particleData.size.x,
        decoration: AppDecoration.radius(
          color: Colors.red,
          radius: 150,
        ),
      ),
    );
  }
}
