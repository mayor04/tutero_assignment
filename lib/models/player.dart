import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tutero_assignment/core/utils/app_extension.dart';
import 'package:tutero_assignment/models/vector2.dart';

class Player {
  double x;
  double y;

  double _angle = 0;
  double get angle => _angle;

  ///This is the direction the player is moving
  Vect2 _angleOffset = Vect2(0, 0);
  Vect2 get angleOffset => _angleOffset;

  //
  final Size _size = const Size(35, 25);
  double get width => _size.width;
  double get height => _size.height;

  //This is the center position of the player for bullets
  Vect2 get centerPosition {
    return Vect2(width / 2 + x, height / 2 + y);
  }

  //The mouse has not been scrolled to the target area
  //Usually when game starts
  bool _unset = true;

  //Stores the 8 most recent delta to calculate the angle
  final List<Offset> _deltaList = [];

  Player(this.x, this.y);

  void updatePosition(Offset mouse, Offset delta) {
    if (mouse.dx == 0 && mouse.dy == 0) {
      //mouse is outside the screen
      return;
    }
    _unset = false;

    x = mouse.dx;
    y = mouse.dy;
    _updateAngle(delta);
  }

  void _updateAngle(Offset delta) {
    _deltaList.add(delta);

    if (_deltaList.length > 7) {
      _deltaList.removeAt(0);
    }

    Offset total = Offset.zero;
    for (var delta in _deltaList) {
      total += delta;
    }

    //Convert to unit type so it can be scalled proportionally
    _angleOffset = total.offsetToVect2.normScale(1);
    _angle = atan2(total.dy, total.dx);
  }

  Vect2 get position => Vect2(x, y);
}
