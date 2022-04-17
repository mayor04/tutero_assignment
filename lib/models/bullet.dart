import 'package:tutero_assignment/models/vector2.dart';

class BulletData {
  Vect2 position;

  ///values of velocity should always be less than one
  ///to prevent unwanted speed and tunneling
  Vect2 velocity;
  double speed = 6;

  BulletData(this.position, this.velocity) {
    // The bullet starts from the centter to make it start from
    // the tip increase the position in the right direction

    // position.add(velocity * 8);
  }

  updatePosition() {
    position.add(velocity * speed);
  }
}
