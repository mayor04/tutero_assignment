import 'dart:math';

/// This is the direct copy of the `offset` class
/// The name `Offset` makes handling co-ordinates harder
class Vect2 {
  double x;
  double y;

  Vect2(this.x, this.y);

  /// An offset with zero magnitude.
  ///
  /// This can be used to represent the origin of a coordinate space.
  static Vect2 zero = Vect2(0.0, 0.0);

  void add(Vect2 other) {
    x += other.x;
    y += other.y;
  }

  void multiply(Vect2 other) {
    x *= other.x;
    y *= other.y;
  }

  copy() {
    return Vect2(x, y);
  }

  /// The magnitude of the offset.
  ///
  /// If you need this value to compare it to another [Offset]'s distance,
  /// consider using [distanceSquared] instead, since it is cheaper to compute.
  double get distance => sqrt(x * x + y * y);

  double get direction => atan2(y, x);

  /// Binary addition operator.
  ///
  /// Returns an offset whose [dx] value is the sum of the [dx] values of the
  /// two operands, and whose [dy] value is the sum of the [dy] values of the
  /// two operands.
  ///
  /// See also [translate].
  Vect2 operator +(Vect2 other) => Vect2(x + other.x, y + other.y);

  /// Multiplication operator.
  ///
  /// Returns an Vect2 whose coordinates are the coordinates of the
  /// left-hand-side operand (an Vect2) multiplied by the scalar
  /// right-hand-side operand (a double).
  ///
  /// See also [scale].
  Vect2 operator *(double operand) => Vect2(x * operand, y * operand);

  Vect2 normScale(int i) {
    var normX = x / distance;
    var normY = y / distance;

    return Vect2(normX, normY);
  }
}
