import 'dart:math';

import 'package:tutero_assignment/models/particle/particle_data.dart';
import 'package:tutero_assignment/models/vector2.dart';

class CircleParticleData extends ParticleData {
  CircleParticleData({
    required Vect2 size,
    required Vect2 position,
    required Vect2 velocity,
    required int directionChangeTime,
  }) : super(size, position, velocity, directionChangeTime);

  @override
  bool isColliding(Vect2 pos, double radius) {
    double distX = pos.x - position.x;
    double distY = pos.y - position.y;
    double distance = sqrt((distX * distX) + (distY * distY));

    if (distance <= size.x / 2 + radius) {
      return true;
    }
    return false;
  }
}
