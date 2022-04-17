import 'package:tutero_assignment/models/vector2.dart';

abstract class ParticleData {
  final Vect2 size;
  Vect2 position;
  Vect2 velocity;

  //After this time the direction needs to change, ussually in seconds
  int directionChangeTime;
  int lastElapsedTime = -20;

  ParticleData(
    this.size,
    this.position,
    this.velocity,
    this.directionChangeTime,
  );

  //Move particle at random
  //The unit vector should always be between -1 and 1
  void moveParticle(Duration elapsedTime, {Vect2? unit}) {
    //Check if the the particles can change direction
    if ((lastElapsedTime + directionChangeTime) < elapsedTime.inSeconds) {
      _changeDirection(unit);
      lastElapsedTime = elapsedTime.inSeconds;
    }

    position.add(velocity);
  }

  //This changes the direction of the particle
  void _changeDirection(Vect2? unit) {
    velocity.multiply(unit ?? Vect2(1, 1));
  }

  bool isColliding(Vect2 pos, double radius);
}
