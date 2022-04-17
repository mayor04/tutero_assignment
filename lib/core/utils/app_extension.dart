import 'package:flutter/material.dart';
import 'package:tutero_assignment/models/vector2.dart';

extension DebugBorder on Widget {
  Widget get debugBorder {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 237, 176, 144))),
      child: this,
    );
  }
}

extension SafeList<T> on List<T> {
  ///Returns null when the element at the index
  ///is not present
  T? itemAt(int index) {
    if (index >= length) {
      return null;
    }
    return this[index];
  }
}

extension Vect on Offset {
  Vect2 get offsetToVect2 {
    return Vect2(dx, dy);
  }
}

extension Theming on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }
}

extension MediaQueryExt on BuildContext {
  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }
}

extension StringExtension on String {
  String get capitalizeFirst {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension KeyRect on BuildContext {
  RenderBox? get renderBox {
    return findRenderObject() as RenderBox?;
  }

  Offset get position {
    return renderBox?.localToGlobal(Offset.zero) ?? const Offset(0, 0);
  }

  double get dy {
    return position.dy;
  }

  double get dx {
    return position.dx;
  }

  Size get widgetSize {
    return renderBox?.hasSize == true ? renderBox!.size : const Size(0, 0);
  }
}
